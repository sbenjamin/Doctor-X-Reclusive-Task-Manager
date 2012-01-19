


////template////utils.js///////

// Ignore console on platforms where it is not available
if (typeof(window["console"]) === "undefined") {
	console = {};
    console.log = function() {};
    console.error = function() {};
    console.info = function() {};
    console.dir = function() {};   
};


//utility function used by the templates.
rowCntr = 0;
//Since this is a template utility, a caller parameter is required.
//hence, rowItem is not used, but required.
function getRowCount(rowItem){
	rowCntr++;
	return rowCntr;
};

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};


function parseBoolean(str) {	
	return /true/i.test(str);
};

//http://www.quirksmode.org/js/cookies.html
function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
};

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    };
    return null;
};

function eraseCookie(name) {
    createCookie(name,"",-1);
};


browserDetect = function(){
	if(parseBoolean(/msie/.test(navigator.userAgent.toLowerCase()))){
		return "msie";
	};
	
	if(parseBoolean(/opera/.test(navigator.userAgent.toLowerCase()))){
		return "opera";
	};
	
	if(parseBoolean(/chrome/.test(navigator.userAgent.toLowerCase()))){
		return "chrome";
	};
	
	if(parseBoolean(/safari/.test(navigator.userAgent.toLowerCase()))){
		return "safari";
	};
	
	if(parseBoolean(/firefox/.test(navigator.userAgent.toLowerCase()))){
		return "firefox";
	};
	
	if(parseBoolean(/webkit/.test(navigator.userAgent.toLowerCase()))){
		return "webkit";
	};
	
	if(parseBoolean(/mozilla/.test(navigator.userAgent.toLowerCase()))){
		return "mozilla";
	};
	
	return "unknown"
};


//http://jquery-howto.blogspot.com/2009/09/get-url-parameters-values-with-jquery.html
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    };
    return vars;
};


function formatDollar(num,spacer) {
	if (typeof(num) !== 'number'){
		return '';
	};

	if(spacer === false){
		spacer = 0;
	};
	
	if(spacer === true){
		spacer = 1;
	};
	
	spacer = spacer || 1;
	
	num = parseFloat(num);
    var p = num.toFixed(2).split(".");
    var result =  "$" + p[0].split("").reverse().reduce(function(acc, num, i, orig) {return  num + (i && !(i % 3) ? "," : "") + acc}, "") + "." + p[1];
	
	result = result.split('.');
	
	if(result[0] == '$NaN'){
		result[0] = '';	
	};
	
	postPrice = result[0];
	
	if(spacer > 0 ){
		var nbsp='';
		for(var i=0; i<spacer; i++){
			nbsp = nbsp+'&nbsp;'
		};
		
		return postPrice+nbsp;
	}
	else{
		return postPrice;
	};
};