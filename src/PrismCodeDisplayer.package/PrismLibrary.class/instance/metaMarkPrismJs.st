uploaded
metaMarkPrismJs
	^ '(function () {

	var closeTagRegex = /<([^\s]*)[^<]*>/;

	function closeTagFunction(match, p1) {
		return "</" + p1 + ">";
	}

	function closeTag(tagString) {
		return tagString.replace(closeTagRegex, closeTagFunction);
	}

   
	function insertText(env, insert) {
		deep= env.deep;
		while(deep> 0){
			insert= closeTag(env.lastNode[deep])+insert+env.lastNode[deep];
			deep--;
		}
		env.string = [env.string.slice(0, env.pos), insert, env.string.slice(env.pos)].join("");
		env.pos = env.pos + insert.length;
	}

    /* escape a tag closing.
	 *  */
	function endTag(env) {
		while (env.string[env.pos] !== ">") {
			env.pos++;
		}
		env.deep= env.deep-1//Math.max(env.deep-1,0);
	};

  /* escape a tag opening.
	 * Save the tag escaped to have possibility to break him without problems
	 *  */
	function beginTag(env) {
		env.deep++;
		lastNode = "<";
		while (env.string[env.pos] !== ">") {
			lastNode += env.string[env.pos];
			env.pos++;
		}
		env.lastNode[env.deep] = lastNode + ">";
	};

   /*count a HTML code like "&amp;" as only one character
	 * bug when we really want to display the HTML code*/
	function escapeHTMLCode(env) {
		if (env.string[env.pos] === "&") {
			tmpPos = env.pos;
			while (tmpPos < env.string.length) {
				tmpPos++;
				if (env.string[tmpPos] === ";") {
					env.pos = tmpPos;
					break;
				} else if (env.string[tmpPos] === " ") {
					break;
				}
			}
		}
	}

  /*count in env.string the number of character in text without 
	 * html balises since env.pos*/
	function textCount(env, number) {
		while (number > 0) {
			if (env.string[env.pos] === "<") {
				env.pos++;
				if (env.string[env.pos] === "/") {
					endTag(env);
				} else {
					beginTag(env);
				}
			} else {
				escapeHTMLCode(env);
				number--;
				env.number++;
			}
			env.pos++;
		}
	};

	function parseAndReplace(codeNode) {
		try {
   	      var html = codeNode.innerHTML;
		   var data = Prism.metaMark.componants[codeNode.id];
		   offset = (data.offset -2) || 0;
		   codeNode.dataset.offset=data.offset;
			var key = Object.keys(data.intervals);

			var env = {string: html};
			window.envtest =env;
			env.tab=[];

			for (var i = 0; i < key.length; i++) {
				var prop = key[i];
				env.pos = 0;
				env.lastNode = [""];
				env.number=0;
				env.deep = 0;
				if (!data.intervals[prop].length)
					data.intervals[prop].length = data.intervals[prop].end - data.intervals[prop].start;

				textCount(env, data.intervals[prop].start-offset);
				insertText(env, data.intervals[prop].tag);

				textCount(env, data.intervals[prop].length,env.pos);
				insertText(env, closeTag(data.intervals[prop].tag));
				env.tab.push(env.string)
			}
			codeNode.innerHTML = env.string;
		} catch (e) {
		}
	}
	
	Prism.metaMark = Prism.metaMark || {componants: {}};
	Prism.hooks.add("complete", function (env) {
		parseAndReplace(env.element);
	});

})();'