uploaded
autoLinkerJs
	^ '(function(){

var url = /\b([a-z]{3,7}:\/\/|tel:)[\w\-+%~/.:#=?&amp;]+/;
var linkMd = /\[([^\]]+)]\(([^)]+)\)/
    
	// Tokens that may contain URLs and emails
    candidates = [''comment'', ''url'', ''attr-value'', ''string''];

	Prism.hooks.add(''before-highlight'', function(env) {
		Prism.languages.insertBefore(env.language, Object.keys(env.grammar)[0], {
			''linkMd'': linkMd
		});
	});

	Prism.hooks.add(''after-highlight'', function(env) {
		console.log(env.element.getElementsByClassName("linkMd"));
	});

})();'