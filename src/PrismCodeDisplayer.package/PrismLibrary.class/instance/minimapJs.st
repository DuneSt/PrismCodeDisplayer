minimap
minimapJs
	^ '

window.addEventListener("load", function () {
	$(".minimap-container").each(function(index, container) { 
		loadMinimap(container);
	});

});

/*
* need refactor to recude the couple between html and js
**/
function refreshMinimap(codeComponent){
  elem= codeComponent.parentElement.parentElement;
  if(elem.getAttribute("class")=="minimap-container"){
     loadMinimap(elem);
  }
}


function loadMinimap(minimapContainer) {
	var dataObj = {};
	dataObj[minimapContainer.dataset.cbid] = "";
	$.ajax({
		url: minimapContainer.dataset.url,
		type: "POST",
		data: dataObj,
		success: function (res) {

			// load markers in DOM
			$(minimapContainer).find(".minimap-bar").replaceWith(res);

			// initialize scroll marker
			var scrollMarker = $(minimapContainer).find(".minimap-scroll-marker");
			var scrollable = $(minimapContainer).find(".minimap-code > pre");
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

/*
The scroll marker of a "prismComponent" is rendered with a "top" and "height" percent values.
Percents allow window resizing. Obtaining the top and height of the scroll marker involves multiple info summarized below:

*---
| Total code
|
| -> Used info: 
|    - attribute "data-totallines" -> total number of lines of code
|
| *---
| | Lazy loaded code
| | 
| | -> Used info:
| |    - attribute "data-firstindex"    -> first line of currently lazy-loaded code
| |    - attribute "data-lastindex"     -> last line of currently lazy-loaded code
| |    - JQuery property "scrollHeight" -> the DOM element pixel height (including the NOT visible code)
| | 
| | *---
| | | Visible code
| | |
| | | -> Used info:
| | |    - "scrollTop()" -> the scroll position (pixel offset from the first line of the loaded code)
| | |    - "height()"    -> the visible height (how many pixels of the loaded code are visible)
| | *---
| *---
*---

*/
function freshScrollMarkerPosition(scrollable) {
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

function minimapScrollableFor(marker) { 
	return $(marker).closest(".minimap-container").find(".minimap-code > pre");
}

function syncScrollMarker(scrollMarker, scrollable) {
	var position = freshScrollMarkerPosition(scrollable);

	scrollMarker.css({
		top: "" + position.top + "%", 
		height: "" + position.height + "%"
	});
}


'