minimap
minimapJs
	^ '

window.addEventListener("load", function () {
	$(".minimap-container").each(function(index, container) { 
		loadMinimap(container);
	});

});

function loadMinimap(codeComponent) {
	var dataObj = {};
	dataObj[codeComponent.dataset.cbid] = "";
	$.ajax({
		url: codeComponent.dataset.url,
		type: "POST",
		data: dataObj,
		success: function (res) {

			//Load in DOM
			$(codeComponent).find(".minimap-bar").replaceWith(res);

			//Initialize scroll marker
			var scrollMarker = $(codeComponent).find(".minimap-scroll-marker").get(0);
			syncScrollMarker(scrollMarker);		
			// move marker when scrolled
			minimapScrollableFor(scrollMarker).scroll(function(e) {
				syncScrollMarker(scrollMarker);
			});

		},
		error: function () {
			location.reload();
		}
	});
}	

	
function minimapScrollableFor(marker) { 
	return $(marker).closest(".minimap-container").find(".minimap-code > pre");
}

function syncScrollMarker(marker) {
	var scrollable = minimapScrollableFor(marker);

	// first, calculate marker in the loaded lines
	var scrollTop = scrollable.scrollTop();
	var scrollHeight = scrollable.height();
	var totalHeight = scrollable.prop("scrollHeight");
	var markerInLoadedLines = {
		top: scrollTop / totalHeight,
		height: scrollHeight / totalHeight
	};

	// now, adapt marker to total lines (loaded lines <= total lines)
	var data = scrollable.get(0).dataset;
	var totalLines = data.totallines
	var loadedLines = {
		first: data.firstindex,
		last: data.lastindex
	};
	var adaptationMultiplier = (loadedLines.last - loadedLines.first) / totalLines;
	var adaptationOffset = loadedLines.first / totalLines;	
	var markerAfterAdaptationToTotalLines = { 
		top: (markerInLoadedLines.top * adaptationMultiplier) + adaptationOffset,
		height: markerInLoadedLines.height * adaptationMultiplier
	};

	// finally, adapt to CSS format (percents)
	$(marker).css({ 
		"top": "" + (markerAfterAdaptationToTotalLines.top * 100) + "%", 
		"height": "" + (markerAfterAdaptationToTotalLines.height * 100) + "%"
	});
}

'