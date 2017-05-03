uploaded
initComponentPrismJs
	^ '(function () {

	Prism.hooks.add("complete", function (env) {
		env.element.parentElement.addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();

		if(selectedText != "" && env.element.parentElement.contains(selectedText.anchorNode)){
		      $("#menu"+env.element.parentElement.id).fadeIn(500).css({''left'': e.pageX,''top'' : e.pageY});
            previousSelection = selectedText.getRangeAt(0);
            previousSelection.codeComponentOffset =$(e.target).closest("pre")[0].linesOffset;
        } 
    });
		document.addEventListener("selectionchange", function() { if(window.getSelection() == "") $("#menu" +env.element.parentElement.id).fadeOut(500);} );
	});

})();'