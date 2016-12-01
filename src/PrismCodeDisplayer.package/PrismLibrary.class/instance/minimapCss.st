minimap
minimapCss
	^ '
.minimap-container {
	height: 100%;
	width: 100%;
	display: flex;
}

.minimap-code {
	float: left;
	width: calc(100% - ', self minimapBarWidth, ');
}

.minimap-bar { 
	float: right;
	width: ', self minimapBarWidth, ';
	position: relative !important;
}

.minimap-bar-element { 
	position: absolute !important;
	width: 100%;
	min-height: 1px;
}

.minimap-scroll-marker { 
	background-color: rgba(0,0,0,0.1);
   pointer-events: none;	
}

.minimap-marker { 
	cursor: pointer;
}


@-webkit-keyframes blinker {
  from {opacity: 1.0;}
  to {opacity: 0.0;}
}
.minimap-loading { 
	-webkit-animation-name: blinker;
	-webkit-animation-duration: 0.6s;
	-webkit-animation-iteration-count:infinite;
	-webkit-animation-timing-function:ease-in-out;
	-webkit-animation-direction: alternate;
	height: 100%;
	width: 100%;
	background-color: #eeeeee;
}

'