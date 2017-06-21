rendering
renderEmptyBarOn: html

	^ html div class: 'minimap-bar'; onClick: 'target=$(event.target).closest("div.minimap-bar")[0];
height=(event.clientY - target.getBoundingClientRect().y) * 100 / target.clientHeight; pre= $(target.parentNode).find("pre")[0]
goToLine((Math.floor(height * pre.dataset.totallines / 100)),pre )'