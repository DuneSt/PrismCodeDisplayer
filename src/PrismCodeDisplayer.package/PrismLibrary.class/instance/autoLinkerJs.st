uploaded
autoLinkerJs
	^ '(function(){

var url = /\b([a-z]{3,7}:\/\/|tel:)[\w\-+%~/.:#=?&amp;]+/;
var linkMd = /\[([^\]]+)]\(([^)]+)\)/;
    
	// Tokens that may contain URLs and emails
    candidates = [''comment'', ''url'', ''attr-value'', ''string''];

	Prism.hooks.add(''before-highlight'', function(env) {
		Prism.languages.insertBefore(env.language, Object.keys(env.grammar)[0], {
			''linkMd'': {
				pattern:linkMd,
				inside: {
					url:url,
					text: /\[([^\]]+)]/
				}
		}
		});
	});

	Prism.hooks.add(''after-highlight'', function(env) {
		linkMdSpan = env.element.getElementsByClassName("linkMd");
		for(i=0; i< linkMdSpan.length;i++ ){
		
			var link = linkMdSpan[i].getElementsByClassName("url")[0].innerText;
			var text = linkMdSpan[i].getElementsByClassName("text")[0].innerHTML.slice(1, -1);
			console.log(linkMdSpan[i]);
		
			linkMdSpan[i].innerHTML = "<a href=''"+ link + "''>"+text+"</a>";
		}		
	});

})();'