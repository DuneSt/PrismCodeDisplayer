uploaded
autoLinkerJs
	^ 'function post(path, parameters) {
	 var form = $(''<form></form>'');

    form.attr("method", "post");
    form.attr("action", path);

    $.each(parameters, function(key, value) {
        var field = $(''<input></input>'');

        field.attr("type", "hidden");
        field.attr("name", key);
        field.attr("value", value);

        form.append(field);
    });

    // The form needs to be a part of the document in
    // order for us to be able to submit it.
    $(document.body).append(form);
    form.submit();
}
	
	(function(){

var url = /(\/\S*)+/i;
var linkMd = /\[\[\[(((?!]]]).)+)]]]\(([(\/\S*)+]+)\)/i;

	// Tokens that may contain URLs and emails
    candidates = [''comment'', ''url'', ''attr-value'', ''string''];

	Prism.hooks.add(''before-highlight'', function(env) {
		Prism.languages.insertBefore(env.language, Object.keys(env.grammar)[0], {
			''prismLink'': {
				pattern:linkMd,
				inside: {
					url:url,
					text: /\[\[\[(((?!]]]).)+)]]]/
				}
		}
		});
	});

	Prism.hooks.add(''after-highlight'', function(env) {
		linkMdSpan = env.element.getElementsByClassName("prismLink");
		for(i=0; i< linkMdSpan.length;i++ ){
		
			var link = linkMdSpan[i].getElementsByClassName("url")[0].innerText.split("#");
			var text = linkMdSpan[i].getElementsByClassName("text")[0].innerHTML.slice(3, -3);
			param = "{"+link[1]+":"+link[2].slice(0,-1)+"}";
			function2 = ''post("''+link[0]+''",''+param+'');return false;'';
			functionTest = ''post("www.google.fr",{});'';
			linkMdSpan[i].innerHTML = "<a href=''javascript:void(0)'' onclick=''post("+''"''+link[0]+''"''+","+param+");''>"+text+"</a>";
		}		
	});

})();'