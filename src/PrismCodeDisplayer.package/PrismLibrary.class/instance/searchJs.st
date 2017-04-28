uploaded
searchJs
	^ 'Prism.searchBar ={intervals:{}};

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
};'