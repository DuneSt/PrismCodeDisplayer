uploaded
metaMarkPrismJs
	^ '(function () {

	var closeTagRegex=/<([^\s]*)[^<]*>/;
	
	function closeTagFunction(match, p1){
    return "</"+p1+">";
	}
	
	function closeTag(tagString){
		return tagString.replace(closeTagRegex, closeTagFunction);
	}
	
	function insertText(env,insert){
		env.string = [env.string.slice(0, env.pos), insert, env.string.slice(env.pos)].join("");
		env.pos= env.pos + insert.length;
	}
	
	var defaultParseFunction = {};
	
	defaultParseFunction.start = function(env){
		insertText(env, closeTag(env.lastNode));
	};
	
	defaultParseFunction.endTag = function(env){
		env.lastNode="";
	};
	
	defaultParseFunction.beginTag = function(env){
		env.lastNode="";
		while (env.string[env.pos] != ">"){
			env.lastNode += env.string[env.pos];
			env.pos++;
		}
		env.lastNode += ">";
		env.inTag= false;
	};
	
	defaultParseFunction.end = function(env){
		env.post=insertText(env, env.lastNode);
	};

	function textCount(env, number, callbacks) {
    callbacks= callbacks || {};
	  env.lastNode= "";
	  env.inTag = false;
		if(callbacks["start"])
		   callbacks["start"](env);
		while (number > 0) {
			if (env.inTag) {
				if (env.string[env.pos] == ">") {
					env.inTag = false;
					if(callbacks["endTag"])
						callbacks["endTag"](env);
				}
			} else {
				if (env.string[env.pos] == "<") {
					env.inTag = true;
					if(callbacks["beginTag"])
						callbacks["beginTag"](env);
				} else {
					number--;
				}
			}
			env.pos++;
		}
		if(callbacks["end"])
		   callbacks["end"](env);
	};

	function parseAndReplace(codeNode) {
		var html = codeNode.innerHTML;
		var data = Prism.metaMark.componants[codeNode.id];
		var key = Object.keys(data);

		var env = {string: html};

		for (var i = 0; i < key.length; i++) {
			var prop = key[i];
			env.pos = parseInt(codeNode.parentElement.dataset.firstindex) || 0;
			
			if(!data[prop].length)
			  data[prop].length= data[prop].end - data[prop].start;

			textCount(env, data[prop].start);
			insertText(env, data[prop].tag);

			textCount(env, data[prop].length, defaultParseFunction);
			insertText(env, closeTag(data[prop].tag));
		}
		codeNode.innerHTML = env.string;
	}
	Prism.metaMark= { componants:{} };
	Prism.hooks.add("complete", function (env) {
		parseAndReplace(env.element);
	});

})();'