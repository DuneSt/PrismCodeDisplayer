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
	
[tooltip]:before {
    content: attr(tooltip);
    position: absolute;
    padding: 10px;
    color: #FFF;
    border-radius: 5px;
    box-shadow:  0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);    
    background: #455A64;
    margin-top: -30px;
    margin-left: 20px;    
	 display: none;
}

[tooltip]:hover:before {
    display: block;
}

[tooltip]:not([tooltip-persistent]):before {
    pointer-events: none;
}'