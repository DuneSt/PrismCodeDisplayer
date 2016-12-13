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

			// load markers in DOM
			$(codeComponent).find(".minimap-bar").replaceWith(res);

			// initialize scroll marker
			var scrollMarker = $(codeComponent).find(".minimap-scroll-marker").get(0);
			var scrollable = $(codeComponent).find(".minimap-code > pre");
			syncScrollMarker(scrollMarker, scrollable);
			
			// move marker when scrolled
			scrollable.scroll(function(e) {
				syncScrollMarker(scrollMarker, scrollable);
			});

		},
		error: function () {
			location.reload();
		}
	});
}	


function freshScrollMarkerPosition(scrollMarker, scrollable) {
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
	var totalLines = parseInt(data.totallines);
	var loadedLines = {
		first: parseInt(data.firstindex),
		last: Math.min(totalLines, parseInt(data.lastindex)) 		// workaround: sometimes lastindex>totallines
	};
	var adaptationMultiplier = (loadedLines.last - loadedLines.first) / totalLines;
	var adaptationOffset = loadedLines.first / totalLines;	

	// -- debugging: log first visible LineNumber
	//console.log(Math.round(loadedLines.first + (markerInLoadedLines.top * (loadedLines.last - loadedLines.first))));

	return {
		top: ((markerInLoadedLines.top * adaptationMultiplier) + adaptationOffset) * 100,
		height: markerInLoadedLines.height * adaptationMultiplier * 100
	};
}


function syncScrollMarker(scrollMarker, scrollable) {
	var position = freshScrollMarkerPosition(scrollMarker, scrollable);

	$(scrollMarker).css({
		top: "" + position.top + "%", 
		height: "" + position.height + "%"
	});
}


'