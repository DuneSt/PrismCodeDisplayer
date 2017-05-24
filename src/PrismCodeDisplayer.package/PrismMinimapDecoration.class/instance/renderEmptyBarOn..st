rendering
renderEmptyBarOn: html

	^ html div class: 'minimap-bar'; onClick: 'height=(event.clientY - event.target.getBoundingClientRect().y) * 100 / event.target.clientHeight; pre= $(event.target.parentNode).find("pre")[0]
goToLine((Math.floor(height * pre.dataset.totallines / 100)),pre )'