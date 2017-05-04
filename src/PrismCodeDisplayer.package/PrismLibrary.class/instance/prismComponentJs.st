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
          res = JSON.parse(res);
          if(res.html != ""){
     		    codeComponent.childNodes[0].innerHTML = res.html;
            protectCRLF(res, codeComponent);

				    Prism.metaMark.componants[codeComponent.childNodes[0].id] = {intervals:res.intervals, offset: res.charOffset};
				    Prism.highlightElement(codeComponent.childNodes[0]);
				    eval(codeComponent.dataset.onchangehook);
				    if(codeComponent.dataset.onloadhook != ""){
				      eval(codeComponent.dataset.onloadhook);
				      codeComponent.dataset.onloadhook = "";
				    }

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

function protectCRLF(res, codeComponent){
  codeComponent.linesOffset = getPrismLinesOffset(res.html, res.charOffset);
  intervals = res.intervals;
  for(var  i = 0; i< intervals.length;i++){
		intervals[i].length = intervals[i].end - intervals[i].start;
		intervals[i].start = intervals[i].start - getLineOffsetDiff(intervals[i].start, codeComponent.linesOffset );
	  intervals[i].end = intervals[i].start + (intervals[i].length - getLineOffsetDiffBetween(intervals[i].start, intervals[i].end, codeComponent.linesOffset));
  }
}

function getPrismLinesOffset(str, PrismCharOffset){
  linesOffset= [PrismCharOffset];
  charOffset= 0;

  i=0;
  while(i<str.length){
    if(str[i]== "\r" && str[i+1]== "\n"){
      linesOffset.push(charOffset+PrismCharOffset);
      i++;
      charOffset++;
    }
    charOffset++;
    i++;
    i= escapeHTMLCode(str, i)
  }
  return linesOffset;
}

function escapeHTMLCode(str, pos) {
		if (str[pos] === "&") {
			tmpPos = pos;
			while (tmpPos < str.length) {
				tmpPos++;
				if (str[tmpPos] === ";") {
					return tmpPos;
				} else if (str[tmpPos] === " ") {
                return pos;
				}
			}
		}
    return pos;
	}

function getLineOffsetDiff(pos, lineOffsetArray){
  res= dicotomiqueSearchIndex(lineOffsetArray, 0, lineOffsetArray.length, pos)
  if(res == -1){
    /*In this case, we have not posed in the table.
    * As we put the smallest offset in the table, but not
    * the largest, we have necessarily the biggest offset for pos */
    res= lineOffsetArray.length - 1;
  }
  return res;
}

function  getLineOffsetDiffBetween(start, end, lineOffsetArray){
  return getLineOffsetDiff(end, lineOffsetArray)-getLineOffsetDiff(start, lineOffsetArray)
}

function dicotomiqueSearchIndex(arr, start, end, value){
  if( start > end){
    return -1;
  }
  midle= Math.ceil((start +end) /2);
  if(value >= arr[midle] && value < arr[midle+1] ){
    return midle;
  } else if( value > arr[midle]){
    return dicotomiqueSearchIndex(arr, midle+1, end, value);
  } else {
    return dicotomiqueSearchIndex(arr, start, midle-1 , value);
  }

}

Prism.pharo ={};

Prism.pharo.getSpecialTextRange= function(){
	start= (textSizeBefore(previousSelection.startContainer)+previousSelection.startOffset);
	end = (textSizeBefore(previousSelection.endContainer)+previousSelection.endOffset);
	start = start + getLineOffsetDiff(start, previousSelection.codeComponentOffset);
	end = end + getLineOffsetDiff(end, previousSelection.codeComponentOffset);
	return { start : start,
		end: end-1,
		previous: (previousSelection.toString())}
}

function initPrismComponents(){
	prismAutoLoad();
   $(".prismComponent").each(function(index, codeComponent){loadPrism(0, 400, codeComponent)});
}

window.addEventListener("load", function () {
    initPrismComponents();
});'