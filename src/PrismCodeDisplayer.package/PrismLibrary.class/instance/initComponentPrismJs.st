uploaded
initComponentPrismJs
	^ '(function () {

	Prism.hooks.add("complete", function (env) {
		document.getElementById(env.element.parentElement.id).addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();
		if(selectedText != "" && document.getElementById(env.element.parentElement.id).contains(selectedText.anchorNode)){
				$("#menu"+env.element.parentElement.id).fadeIn(500).css({''left'': e.pageX,''top'' : e.pageY});
            previousSelection = selectedText.getRangeAt(0);
        } 
    });
		document.addEventListener("selectionchange", function() { if(window.getSelection() == "") $("#menu" +env.element.parentElement.id).fadeOut(500);} );
	});

})();'