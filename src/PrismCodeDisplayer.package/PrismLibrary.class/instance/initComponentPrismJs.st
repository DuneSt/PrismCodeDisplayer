uploaded
initComponentPrismJs
	^ '(function () {

	Prism.hooks.add("complete", function (env) {
	   env.element.parentElement.addEventListener("mousedown", function(e) {
	      previousSelection= { inprogress: true };
      });

	   env.element.parentElement.addEventListener("mousemove", function(e) {
	     if( previousSelection.inprogress){
          var selectedText = window.getSelection().getRangeAt(0);
          start= (textSizeBefore(selectedText.startContainer)+selectedText.startOffset);
          previousSelection.start=start+getLineOffsetDiff(end, $(e.target).closest("pre")[0].linesOffset)
          previousSelection.inprogress = false
      }
    });

		env.element.parentElement.addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();

		if(selectedText != "" && env.element.parentElement.contains(selectedText.anchorNode)){
		      menu= $("#menu"+env.element.parentElement.id);
			   domRect= env.element.parentElement.getBoundingClientRect();
		      $("#menu"+env.element.parentElement.id).fadeIn(500).css({''left'': e.pageX- domRect.left ,''top'' : e.pageY-domRect.top });
            selectedTextRange = selectedText.getRangeAt(0);
            end = (textSizeBefore(selectedTextRange.endContainer)+selectedTextRange.endOffset);
	         previousSelection.end = end + getLineOffsetDiff(end, $(e.target).closest("pre")[0].linesOffset);
	previousSelection
        } 
    });
		document.addEventListener("selectionchange", function() { if(window.getSelection() == "") $("#menu" +env.element.parentElement.id).fadeOut(500);} );
	});

})();'