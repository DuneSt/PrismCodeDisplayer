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
	var scrollTop = scrollable.scrollTop();
	var scrollHeight = scrollable.height();
	var totalHeight = scrollable.prop("scrollHeight");
	var ratio = 100.0 / totalHeight;
	var top = "" + (scrollTop * ratio) + "%";
	var height = "" + (scrollHeight * ratio) + "%";
	$(marker).css({ "top": top, "height": height });
}

'