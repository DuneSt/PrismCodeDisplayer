uploaded
searchJs
	^ '
Prism.searchBar ={intervals:{}};

window.addEventListener("load", function () {
	Prism.searchBar.initSearchBarShortcuts();
});

Prism.searchBar.getRootElement=function(searchElement){
	return $(searchElement).closest(".prism-search-container")[0];
}

Prism.searchBar.setSearchResults= function(searchElement, linesList){
   root = Prism.searchBar.getRootElement(searchElement);
 	Prism.searchBar.intervals[root.id] = {
		linesList: linesList,
		currentElement: 0
	}
	if(linesList.length>0){
		goToLine( Prism.searchBar.intervals[root.id].linesList[0].line, root.parentElement.getElementsByTagName("pre")[0], true );
	} else { 
		Prism.searchBar.intervals[root.id].currentElement = -1;
	}
	Prism.searchBar.refreshCounter(root);
};

Prism.searchBar.changeElement = function(root,offset ){
  interval = Prism.searchBar.intervals[root.id];
  interval.currentElement = interval.currentElement + offset;
  goToLine( interval.linesList[interval.currentElement].line, root.parentElement.getElementsByTagName("pre")[0] );
  Prism.searchBar.refreshCounter(root);
};

Prism.searchBar.prevElement = function(searchElement){
	root = Prism.searchBar.getRootElement(searchElement);
  if(Prism.searchBar.intervals[root.id].currentElement > 0){
    Prism.searchBar.changeElement(root, -1);
  }
};

Prism.searchBar.nextElement = function(searchElement ){
	root = Prism.searchBar.getRootElement(searchElement);
  if(Prism.searchBar.intervals[root.id].currentElement < (Prism.searchBar.intervals[root.id].linesList.length - 1)){
    Prism.searchBar.changeElement(root, 1);
  }
};

Prism.searchBar.refreshCounter = function(root){
  interval=Prism.searchBar.intervals[root.id];
  root.getElementsByClassName("prism-search-counter")[0].innerHTML = (interval.currentElement + 1) + "/" + interval.linesList.length;
};

Prism.searchBar.bindings = {};

Prism.searchBar.bindings[40] = Prism.searchBar.nextElement;

Prism.searchBar.bindings[38] = Prism.searchBar.prevElement;

Prism.searchBar.initSearchBarShortcuts = function(){
	$(window).keydown(function(event) {
	  if(event.ctrlKey && event.shiftKey && event.keyCode == 70) { 
			$(".prism-search-bar").animate({width:"toggle"},350);
			$(".prism-search-bar input").focus();
			event.preventDefault(); 
  		}
	});
	
	$(".prism-search-bar input").keydown(function(event) {
	  if(Prism.searchBar.bindings[event.keyCode]) { 
			Prism.searchBar.bindings[event.keyCode](event.target);
			event.preventDefault(); 
  		}
	});

}'