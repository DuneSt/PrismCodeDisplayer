menu
addSelectionListener: component in: s
	s
		<< ' document.getElementById("';
		<< component id;
		<<
				'").addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();
		if(selectedText != '''' && document.getElementById("';
		<< component id;
		<<
				'").contains(selectedText.anchorNode)){
				$(''#menu';
		<< component id;
		<<
				''').fadeIn(500).css({''left'': e.pageX,''top'' : e.pageY});
            previousSelection = selectedText.getRangeAt(0);
				
        } 
    });';
		<< 'document.addEventListener("selectionchange", function() { if(window.getSelection() == '''') $(''#menu';
		<< component id;
		<< ''').fadeOut(500);} );'