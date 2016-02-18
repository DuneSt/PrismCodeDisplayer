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
var linkMd = /ế(((?!ề).|[\n\r])+)ề\(((\/[\w\d=?&#_]*)+)\)/i;

	Prism.hooks.add(''before-highlight'', function(env) {
		Prism.languages.insertBefore(env.language, Object.keys(env.grammar)[0], {
			''prismLink'': {
				pattern:linkMd,
				inside: {
					text: /ế(((?!ề).|[\n\r])+)ề/i,
					url:url					
				}
		}
		});
	});

	Prism.hooks.add(''after-highlight'', function(env) {
		linkMdSpan = env.element.getElementsByClassName("prismLink");
		for(i=0; i< linkMdSpan.length;i++ ){
			var link = linkMdSpan[i].getElementsByClassName("url")[0].innerHTML.split("#");
			var text = linkMdSpan[i].getElementsByClassName("text")[0].innerHTML.slice(1, -1);
			param = "{"+link[1]+":"+link[2].slice(0,-1)+"}";
			linkMdSpan[i].innerHTML = "<a href=''javascript:void(0)'' onclick=''post("+''"''+link[0]+''"''+","+param+");''>"+text+"</a>";
		}		
	});

})();'