uploaded
prismComponentJs
	^ '/**
 * I define a function to load more elements when we are at the beginning or at the end of the list.
 */
function prismAutoLoad() {

    $(".prismComponent").scroll(function (e) {
			// here we check that a loading is not in progress
			if(e.currentTarget.dataset.lastindexasked == e.currentTarget.dataset.lastindexloaded){
				if (0.1 > (e.currentTarget.scrollTop) / e.currentTarget.scrollHeight) {
               if(e.currentTarget.dataset.lastindexloaded > 1){// check not at the beginning
						loadPrism(Math.max(parseInt(e.currentTarget.dataset.lastindexloaded) - 150, 0), parseInt(e.currentTarget.dataset.lastindexloaded) + 250, e.currentTarget)
					}
            }

            if (0.9 < (e.currentTarget.scrollTop + $(e.currentTarget).height()) / e.currentTarget.scrollHeight) {
                lastind=parseInt(e.currentTarget.dataset.lastindexloaded);
                total=parseInt(e.currentTarget.dataset.totallines)
                if(lastind< (total-400)){
                    loadPrism(lastind + 250,lastind + 650, e.currentTarget)}
                else if(lastind < total) {
                    //need to find better solution, too many request to server
                    loadPrism(total-400, total, e.currentTarget)
                }
            }
			}
    });

}

function refreshPrism(codeComponent) {
   loadPrism(parseInt(codeComponent.dataset.lastindexloaded), parseInt(codeComponent.dataset.lastindexloaded)+400,
           codeComponent, {checkRefresh: true});
   refreshMinimap(codeComponent);
}

function goToLine(line, codeComponent, forceRefresh) {
   total=parseInt(codeComponent.dataset.totallines)
   if(line< 400){
      //substract 10 to avoid to have the line in first line in codeComponent
      loadPrism(0, 400, codeComponent, {scrollValue:(line-10)* $(codeComponent.children[0]).height()/
                  Math.min(400,total), checkRefresh: forceRefresh})
   }else if(line< (total-400)){
      loadPrism(line - 100,line + 300, codeComponent,{scrollValue:codeComponent.scrollTopMax*0.25, checkRefresh: forceRefresh})
   }else if(line < total) {
      loadPrism(total-400, total, codeComponent, {scrollValue:(line-total +390)* $(codeComponent.childNodes[0]).height()/400, checkRefresh: forceRefresh})
   }

}

function loadPrism(start, end, codeComponent, options) {
   if(start<1){ start=1; }
   options= options || { };
   if(options.checkRefresh || codeComponent.dataset.lastindexasked != start){
    	var dataObj = {};
	   codeComponent.dataset.lastindexasked = start;
      dataObj[codeComponent.dataset.cbid] = start + ":" + end;
      $.ajax({
        url: codeComponent.dataset.url,
        type: "POST",
        data: dataObj,
        success: function (res) {
          crlfRegex= /\r\n/g;
          res = JSON.parse(res);
          if(res.html != ""){
     		  codeComponent.childNodes[0].innerHTML = res.html;
					if(codeComponent.dataset.protectcrlf == "true"){
				    for(var  i = 0; i< res.intervals.length;i++){
				console.log("ok ok")
				      res.intervals[i].start = res.intervals[i].start - (res.html.substring(0,res.intervals[i].start).match(crlfRegex) || []).length;
				      res.intervals[i].end = res.intervals[i].end - (res.html.substring(0,res.intervals[i].end).match(crlfRegex) || []).length;
			      }
					}
				  Prism.metaMark.componants[codeComponent.childNodes[0].id] = {intervals:res.intervals, offset: res.charOffset};
				  Prism.highlightElement(codeComponent.childNodes[0]);

				  codeComponent.scrollTop = options.scrollValue || (codeComponent.scrollTop - ((start - codeComponent.dataset.firstindex) / (codeComponent.dataset.lastindex - codeComponent.dataset.firstindex)) * $(codeComponent.childNodes[0]).height());

				  codeComponent.style.counterReset = "linenumber " + (parseInt(codeComponent.dataset.startcountnumber) + start - 1);

				  codeComponent.dataset.firstindex = res.start;
				  codeComponent.dataset.lastindex = end;
				  codeComponent.dataset.lastindexloaded = start;
				}
        },
        error: function () {
            location.reload();
        }
      });
   }else if ( options.scrollValue){
      codeComponent.scrollTop = options.scrollValue ;
   }
}

function initPrismComponents(){
	prismAutoLoad();
   $(".prismComponent").each(function(index, codeComponent){loadPrism(0, 400, codeComponent)});
}

window.addEventListener("load", function () {
    initPrismComponents();
});'