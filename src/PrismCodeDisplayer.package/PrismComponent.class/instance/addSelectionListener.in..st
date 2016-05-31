menu
addSelectionListener: component in: s
	s
		<< ' document.getElementById("';
		<< component id asString;
		<<
				'").addEventListener("mouseup", function(e) {
        var selectedText = window.getSelection();
			console.log("Event");
        if(selectedText != '''' && document.getElementById("';
		<< component id asString;
		<<
				'").contains(selectedText.anchorNode)){
				$(''#menu';
		<< component id asString;
		<<
				''').fadeIn(200).css({''left'': e.pageX,''top'' : e.pageY});
            previousSelection = selectedText.getRangeAt(0).toString();
				
        } 
    });'.
	s
		<< 'document.addEventListener("selectionchange", function() { if(window.getSelection() == '''') $(''#menu';
		<< component id asString;
		<< ''').fadeOut(200);} );'