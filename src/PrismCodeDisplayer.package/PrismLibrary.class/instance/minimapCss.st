minimap
minimapCss
	^ '
.minimap-container {
	height: 100%;
	width: 100%;
}

.minimap-code {
	float: left;
	height: 100%;
	width: calc(100% - ', self minimapBarWidth, ');
}

.minimap-bar { 
	float: right;
	height: 100%;
	width: ', self minimapBarWidth, ';
	position: relative !important;
}

.minimap-bar-element { 
	position: absolute !important;
	width: 100%;
}

.minimap-scroll-marker { 
	background-color: rgba(0,0,0,0.1);
}

.minimap-marker { 
	cursor: pointer;
}

'