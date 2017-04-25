uploaded
searchJs
	^ 'Prism.searchBar ={intervals:{}};

Prism.searchBar.setSearchResults= function(searchElement, linesList){
 	Prism.searchBar.intervals[searchElement.id] = {
		linesList: linesList,
		currentElement: 0
	}
	Prism.searchBar.refreshCounter(searchElement);
	goToLine( Prism.searchBar.intervals[searchElement.id].linesList[0].line, searchElement.parentElement.getElementsByTagName("pre")[0], true );
};

Prism.searchBar.changeElement = function(searchElement,offset ){
  interval = Prism.searchBar.intervals[searchElement.id];
  interval.currentElement = interval.currentElement + offset;
  goToLine( interval.linesList[interval.currentElement].line, searchElement.parentElement.getElementsByTagName("pre")[0] );
  Prism.searchBar.refreshCounter(searchElement);
};

Prism.searchBar.prevElement = function(searchElement){
  if(Prism.searchBar.intervals[searchElement.id].currentElement > 0){
    Prism.searchBar.changeElement(searchElement, -1);
  }
};

Prism.searchBar.nextElement = function(searchElement ){
  if(Prism.searchBar.intervals[searchElement.id].currentElement < (Prism.searchBar.intervals[searchElement.id].linesList.length - 1)){
    Prism.searchBar.changeElement(searchElement, 1);
  }
};

Prism.searchBar.refreshCounter = function(searchElement){
  interval=Prism.searchBar.intervals[searchElement.id];
console.log((interval.currentElement + 1) + "/" + interval.linesList.length)
  searchElement.getElementsByClassName("search-counter")[0].innerHTML = (interval.currentElement + 1) + "/" + interval.linesList.length;
};'