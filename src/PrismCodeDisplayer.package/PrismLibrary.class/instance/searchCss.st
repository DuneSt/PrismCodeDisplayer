uploaded
searchCss
	^ '
.prism-search-container{
	position: relative;
	height: 100%;
	width: 100%;
}

.prism-search-bar-container{
	position: absolute;
	display: flex;
	top:0;
	right:45px;
	z-index:2;
	background-color: #FFF;
	padding: 4px 10px;
	border-radius:0 0 5px 5px;
}

.prism-search-bar{
	display: flex;
}

.prism-search-bar-container img{
	height: 15px;
	width: 15px;
	cursor: pointer;
	padding: 8px;
}
	
.prism-search-bar > * {
	align-self: center;
}

.prism-search-counter{
	color: rgba(0,0,0,.54);
	font-size: 14px;
	line-height: 18px;
	font-weight: 400;
	font-family: "Roboto" , "Helvetica" , "Arial" , "sans-serif";
	padding:5px;
}
	'