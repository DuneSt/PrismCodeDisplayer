minimap
minimapJs
	^ '
function minimapScrollableFor(marker) { 
	return $(marker).closest(".minimap-container").find(".minimap-code > pre");
};

function syncScrollMarker(marker) {
	var scrollable = minimapScrollableFor(marker);
	var scrollTop = scrollable.scrollTop();
	var scrollHeight = scrollable.height();
	var totalHeight = scrollable.prop("scrollHeight");
	var ratio = 100.0 / totalHeight;
	var top = "" + (scrollTop * ratio) + "%";
	var height = "" + (scrollHeight * ratio) + "%";
	$(marker).css({ "top": top, "height": height });

	console.log(marker);
	console.log("--> set scroll to " + top + ":" + height);
};

window.addEventListener("load", function () {
	console.log("loading minimap");

	$(".minimap-scroll-marker").each(function(index, scrollMarker) { 

		syncScrollMarker(scrollMarker);
	
		var scrollable = minimapScrollableFor(scrollMarker)
		
		// move marker when scrolled
		scrollable.scroll(function(e) {
			syncScrollMarker(scrollMarker);
		});
	
	});	
});
'