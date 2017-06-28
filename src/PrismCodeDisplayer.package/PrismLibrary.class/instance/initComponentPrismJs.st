uploaded
initComponentPrismJs
	^ '(function () {

	      previousSelection= {  };
	Prism.hooks.add("complete", function (env) {
	
	   env.element.parentElement.addEventListener("mousedown", function(e) {
	      previousSelection= { inprogress: true };
	     console.log("key down")
      });

	   env.element.parentElement.addEventListener("mousemove", function(e) {
	     if( previousSelection.inprogress){
          var selectedText = window.getSelection().getRangeAt(0);
          start= (textSizeBefore(selectedText.startContainer)+selectedText.startOffset);
          previousSelection.tmp=start+getLineOffsetDiff(start, $(e.target).closest("pre")[0].linesOffset)
          previousSelection.inprogress = false;

console.log("move ok")
      } else { 

console.log("move nothing");
 }
    });

		env.element.parentElement.addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();
	     console.log("key up")

		if(selectedText != "" && env.element.parentElement.contains(selectedText.anchorNode)){
		      menu= $("#menu"+env.element.parentElement.id);
			   domRect= env.element.parentElement.getBoundingClientRect();
		      $("#menu"+env.element.parentElement.id).fadeIn(500).css({''left'': e.pageX- domRect.left ,''top'' : e.pageY-domRect.top });
            selectedTextRange = selectedText.getRangeAt(0);
            end = (textSizeBefore(selectedTextRange.endContainer)+selectedTextRange.endOffset);
	         end = end + getLineOffsetDiff(end, $(e.target).closest("pre")[0].linesOffset);
	         if(end > previousSelection.tmp){
               previousSelection.start= previousSelection.tmp;
               previousSelection.end= end;
            }else{
               previousSelection.start= end;
               previousSelection.end= previousSelection.tmp;
	         }
        } 
    });
		document.addEventListener("selectionchange", function() { if(window.getSelection() == "") $("#menu" +env.element.parentElement.id).fadeOut(500);} );
	});

})();'