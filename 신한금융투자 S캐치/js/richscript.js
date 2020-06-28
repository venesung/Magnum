/*

 * Rich JavaScript framework, version 1.5

 * Copyright (c) 2006-2010 Lee Won-Gyoon <mail.kido@gmail.com>

 * 

 * Licensed under the Apache License, Version 2.0 (the "License");

 * For details, see the RichScript web site: http://www.richScript.net/

 * 

*******************************************************************************/



var useSuperDomain = true;

try {

	if (USE_SUPER_DOMAIN==false) {

		useSuperDomain = false;

	}

} catch(e) { }



try {

	if (useSuperDomain) {

		//document.domain = "goodi.com";
		document.domain = "shinhaninvest.com";

	}

} catch(e){}





var richScript = {

	//Version : "1.5 (For www.goodi.com)"
	Version : "1.5 (For www.shinhaninvest.com)"

};



var browser = {

	isIE : (navigator.userAgent.toUpperCase().indexOf('MSIE')>-1),

	isIE6 : (navigator.userAgent.toUpperCase().indexOf('MSIE 6')>-1&&navigator.userAgent.toUpperCase().indexOf('MSIE 7')==-1&&navigator.userAgent.toUpperCase().indexOf('MSIE 8')==-1),

	isIE7 : (navigator.userAgent.toUpperCase().indexOf('MSIE 7')>-1&&navigator.userAgent.toUpperCase().indexOf('MSIE 8')==-1),

	isIE8 : (navigator.userAgent.toUpperCase().indexOf('MSIE 8')>-1),

	isFF : (navigator.userAgent.toUpperCase().indexOf('FIREFOX')>-1),

	isSF : (navigator.userAgent.toUpperCase().indexOf('SAFARI')>-1&&navigator.userAgent.toUpperCase().indexOf('CHROME')==-1),

	isOP : (navigator.userAgent.toUpperCase().indexOf('OPERA')>-1),

	isCR : (navigator.userAgent.toUpperCase().indexOf('CHROME')>-1),

	getW : function() {

		return document.documentElement.clientWidth;

	},

	getH : function() {

		return document.documentElement.clientHeight;

	}

};





/**

 String

*****************************/

String.prototype.constructorType = function() {

	return "String";

};



String.prototype.trim = function () {

	var s = (this!=null) ? this : "";

	s = s.replace(/^\s+/g,"");

	s = s.replace(/\s+$/g,"");

	return s;

};



String.prototype.replaceQuot = function() {

	var s = (this!=null) ? this : "";

	s = s.replace(/\\/g,"\\\\");

	s = s.replace(/\"/g,"\\\"");

	s = s.replace(/\'/g,"\\\'");

	return s;

};



String.prototype.escapeXml = function() {

	var s = (this!=null) ? this : "";

	s = s.replace(/&/g,"&amp;");

	s = s.replace(/\'/g,"&#039;");

	s = s.replace(/\"/g,"&#34;");

	s = s.replace(/</g,"&lt;");

	s = s.replace(/>/g,"&gt;");

	s = s.replace(/\n/g,"&#10;");

	s = s.replace(/\r/g,"&#13;");

	s = s.replace(/\t/g,"&#9;");

	return s;

};



String.prototype.escapeJavaScript = function() {

	var s = (this!=null) ? this : "";

	s = s.replace(/\\/g,"\\\\");

	s = s.replace(/\//g,"\\/");

	s = s.replace(/\n/g,"\\n");

	s = s.replace(/\r/g,"\\r");

	s = s.replace(/\t/g,"\\t");

	s = s.replace(/\"/g,"\\\"");

	s = s.replace(/\'/g,"\\'");

	return s;

};



String.prototype.removeTag = function() {

	var s = (this!=null) ? this : "";

	s = s.replace(/<\/?[^>]+>/gi,"");

	return s;

};



String.prototype.convertEnterToBr = function() {

	var s = (this!=null) ? this : "";

	s = s.replace(/\n/g,"<br>");

	return s;

};



String.prototype.getBytes = function() {

	var s = (this!=null) ? this : "";

	var bytes = 0;

	var c = "";

	var u = "";

	for (var i=0; i<s.length; i++) {

		c = s.charAt(i);

		u = escape(c);

		if (u.length < 4) {

			bytes++;

		} else {

			var b = parseInt(c.charCodeAt(0));

			if (((b >= 65377)&&(b <= 65500))||((b >= 65512)&&(b <= 65518))) {

				bytes++;

			} else {

				bytes += 2;

			}

		}

	}

	return bytes;

};



String.prototype.encodeUnicode = function(_separator) {

	var s = (this!=null) ? this : "";

	var separator = (_separator==undefined) ? "." : _separator;

	var u = new Array;

	for (var i=0; i<s.length; i++) {

		s.charCodeAt(i);

		u.push(s.charCodeAt(i));

	}

	return u.join(separator);

};



String.prototype.decodeUnicode = function(_separator) {

	var s = (this!=null) ? this : "";

	var separator = (_separator==undefined) ? "." : _separator;

	var u = s.split(separator);

	var dec = "";

	if (u.length>0) {

		try {

			dec = eval("String.fromCharCode("+u.join(",")+")");

		} catch (e) { }

	}

	return dec;

};



String.prototype.appendParameter = function(_param) {

	var s = (this!=null) ? this : "";

	if (_param!=undefined&&_param!="") {

		if (s.indexOf("?")>-1) {

			s += "&";

		} else {

			s += "?";

		}

		s += _param;

	}

	return s;

};



String.prototype.toBold = function() {

	var s = (this!=null) ? this : "";

	return "<strong>"+s+"</strong>";

};





String.prototype.toPng24BgStyle = function() {

	var s = (this!=null) ? this : "";

	if (browser.isIE6) s = ' filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='+s+' ,sizingMethod=scale ); ';

	else s = ' background:url('+s+') transparent; ';

	return s;

};





/**

 Math

*****************************/

Math.isInt = function(_s) {

	return (_s!=undefined&&""+parseInt(_s)!="NaN");

};



Math.isFloat = function(_s) {

	return (_s!=undefined&&""+parseFloat(_s)!="NaN");

};





/**

 Array

*****************************/

Array.prototype.constructorType = function() {

	return "Array";

};

Array.prototype.pushCount = 0;



Array.prototype.push = function(_obj) {

	this[this.length] = _obj;

	this.pushCount++;

	return this.length;

};



Array.prototype.remove = function(_obj) {

	for (var i=0; i<this.length; i++) {

		if (this[i]==_obj) {

			this[i] = null;

		}

	}

};



Array.prototype.compact = function() {

	var temp = new Array;

	for (var i=0; i<this.length; i++) {

		if (this[i]!=null&&this[i]!=undefined) {

			temp.push(this[i]);

		}

	}

	return temp;

};







/**

 Date

*****************************/

Date.prototype.constructorType = function() {

	return "Date";

};

Date.prototype.toFormatted = function(_s) {

	if (_s==undefined) _s = "YYYYMMDD";

	

	var _YYYY = this.getYear();

	var _MM = this.getMonth()+1;

	var _DD = this.getDate();

	var _HH = this.getHours();

	var _MI = this.getMinutes();

	var _SS = this.getSeconds();

	if (_YYYY<1000) {

		_YYYY += 1900;

	}

	if (_MM<10) _MM = "0"+_MM;

	if (_DD<10) _DD = "0"+_DD;

	if (_HH<10) _HH = "0"+_HH;

	if (_MI<10) _MI = "0"+_MI;

	if (_SS<10) _SS = "0"+_SS;

	

	_s = _s.replace(/YYYY/gi, _YYYY);

	_s = _s.replace(/MM/gi, _MM);

	_s = _s.replace(/DD/gi, _DD);

	_s = _s.replace(/HH/gi, _HH);

	_s = _s.replace(/MI/gi, _MI);

	_s = _s.replace(/SS/gi, _SS);

	return _s;

};

Date.prototype.addYear = function(_n) {

	this.setYear(this.getYear()+_n);

};

Date.prototype.addMonth = function(_n) {

	this.setMonth(this.getMonth()+_n);

};

Date.prototype.addDate = function(_n) {

	this.setDate(this.getDate()+_n);

};

Date.prototype.addHours = function(_n) {

	this.setHours(this.getHours()+_n);

};

Date.prototype.addMinutes = function(_n) {

	this.setMinutes(this.getMinutes()+_n);

};

Date.prototype.addSeconds = function(_n) {

	this.setSeconds(this.getSeconds()+_n);

};





/**

 Object

*****************************/

Object.prototype.constructorType = function() {

	return "Object";

};

Object.prototype.__clearMemory = function() {

	for (var prop in this) {

		try {

			if ((""+typeof(this[""+prop])).toLowerCase()=="object") {

				this[""+prop].__clearMemory();

			}

			this[""+prop] = null;

		} catch(e) {

			try {

				this[""+prop] = null;

			} catch(e2) { }

		}

		prop = null;

	}

};









/**

 Request Object

*****************************/

function Request(_queryString) {

	this.search = (_queryString!=undefined)?""+_queryString:"";

	this.key = {};

	this.keys = [];

	this.values = [];

	

	if (this.search.length>1&&this.search.indexOf("?")==0) this.search = this.search.substring(1,this.search.length);

	var param = this.search.split("&");

	var paramValue = "";

	this.search = "";

	for (var i=0; i<param.length; i++) {

		var index = param[i].indexOf("=");

		if (index>-1) {

			var pName = param[i].split("=")[0];

			var pValue = param[i].substring(index+1, param[i].length).trim();

			if (this.key[pName]==undefined) {

				this.set(pName, pValue);

			}

		}

	}

}



Request.prototype.size = function() {

	return this.values.length;

};



Request.prototype.set = function(_name, _value) {

	if (this.key[_name]==undefined) {

		var index = this.values.length;

		this.key[_name] = index;

		this.keys.push(_name);

		this.values.push(_value);

	}

	this.search = this.search.appendParameter(_name+"="+_value);

};



Request.prototype.get = function(_name) {

	var value = this.values[this.key[_name]];

	if (value==undefined) value = "";

	return value;

};



Request.prototype.getKey = function(_index) {

	return this.keys[_index];

};



Request.prototype.getSearch = function() {

	var returnValue = this.search;

	if (this.search.length>1&&this.search.indexOf("?")==0) {

		returnValue = this.search.substring(1);

	}

	return returnValue;

};



var request = new Request(location.search);

request.host = location.host;

request.pathname = location.pathname;









/**

 out Object

*****************************/

var out = {

	print : function(_s) {

		document.write(_s);

	},

	println : function(_s) {

		document.writeln(_s);

	},

	printBr : function(_s) {

		document.writeln(_s+"<br/>");

	}

};









/**

 Cookie Object

*****************************/

var Cookie = {

	get : function(_cookieName) {

		var cookieList = document.cookie.split(";");

		var cookieValue = "";

		for (i = 0; i < cookieList.length; i++) {

			if (cookieList[i].indexOf(_cookieName+"=") > -1) {

				if (cookieList[i].split("=")[0].replace(/\s/g,"") == _cookieName) {

					cookieValue = decodeURIComponent(cookieList[i].split("=")[1]);

					break;

				}

			}

		}

		return cookieValue;

	},

	set : function(_name, _value, _days, _path, _domain) {

		if (_name!=undefined) {

			if (_value==undefined) _value = "";

			if (_days==undefined) _days = 365;

			if (_path==undefined) _path = "/";

			/* try { if (_domain==undefined) _domain = location.hostname; } catch(e) { } */

			var d = new Date();

			d.setDate(d.getDate()+_days);

			var s = "";

			s += _name+"="+encodeURIComponent(_value) + ";";

			s += "expires=" + d.toGMTString() + ";";

			s += "path=" + _path + ";";

			if (_domain!=undefined) {

				s += "domain=" + _domain + ";";

			}

			document.cookie = s;

		}

	}

};







/**

 Ajax Object

*****************************/

function Ajax(_url, _method, _async) {

	this.request = null;

	this.method = (_method==undefined)?"post":_method;

	this.url = (_url==undefined)?"":_url;

	this.async = (_async==undefined)?true:_async;

	this.parameter = "";

	this.header = {

		contentType : "application/x-www-form-urlencoded; charset=UTF-8"

	};

}

Ajax.prototype.getEncParam = function(_name, _value) {

	return encodeURIComponent(_name) + "=" + encodeURIComponent(_value);

};

Ajax.prototype.getTimeStamp = function() {

	return (new Date()).getTime();

};

Ajax.prototype.getReadyState = function() {

	return this.request.readyState;

};

Ajax.prototype.getStatus = function() {

	return this.request.status;

};

Ajax.prototype.getResponseText = function() {

	return this.request.responseText;

};

Ajax.prototype.getResponseXML = function() {

	return this.request.responseXML;

};

Ajax.prototype.appendParameter = function(_name, _value) {

	this.parameter = this.parameter.appendParameter(this.getEncParam(_name, _value));

};

Ajax.prototype.send = function() {

	this.request = null;

	try { this.request = new XMLHttpRequest(); } catch(e1) {

		try { this.request = new ActiveXObject('Msxml2.XMLHTTP'); } catch(e2) {

			try { this.request = new ActiveXObject('Microsoft.XMLHTTP'); } catch(e3) {

				this.request = null;

			}

		}

	}

	if (this.parameter.indexOf("?")==0) {

		this.parameter = this.parameter.substring(1);

	}

	if (this.parameter!="") {

		this.parameter += "&";

	}

	this.parameter += "__temp="+this.getTimeStamp();

	this.request.open(this.method, (this.method=="post")?this.url:this.url.appendParameter(this.parameter) , this.async);

	this.request.setRequestHeader("Content-Type", this.header.contentType);

	this.request.send((this.method=="post")?this.parameter:"");

	var _onStatus200 = this.onStatus200;

	var _onError = this.onError;

	var _req = this.request;

	this.request.onreadystatechange = function() {

		if (_req.readyState==4) {

			if (_req.status==200) {

				_onStatus200();

			} else {

				_onError();

			}

		}

	};

};

Ajax.prototype.onStatus200 = function() { };

Ajax.prototype.onError = function() { };







/**

 Document Object

*****************************/

richScript.$ = function() {

	var o = null;

	if (typeof arguments[0] == 'string') {

		o = document.getElementById(arguments[0]);

	} else {

		o = arguments[0];

	}

	if (o==null) {

		o = {};

		o.isNull = true;

	} else {

		if (o.isNull!=undefined) {

			return o;

		}

		o.isNull = false;

	}

	o.setStyle = $_prototype_setStyle;

	o.getStyle = $_prototype_getStyle;

	o.setPosition = $_prototype_setPosition;

	o.getW = $_prototype_getW;

	o.getH = $_prototype_getH;

	o.getX = $_prototype_getX;

	o.getY = $_prototype_getY;

	o.setOpacity = $_prototype_setOpacity;

	o.getOpacity = $_prototype_getOpacity;

	o.setFadeIn = $_prototype_setFadeIn;

	o.setFadeOut = $_prototype_setFadeOut;

	o._getNextPoint = $_prototype__getNextPoint;

	o.resizeToMotionA = $_prototype_resizeToMotionA;

	o.resizeTo = $_prototype_resizeTo;

	o.moveTo = $_prototype_moveTo;

	o.moveToMotionA = $_prototype_moveToMotionA;

	o.moveToTarget = $_prototype_moveToTarget;

	o.insertAfter = $_prototype_insertAfter;

	o.createChildNode = $_prototype_createChildNode;

	return o;

};

function $_prototype_setStyle(_name, _value) {

	try {

		if (_name=="display") {

			_value = (""+_value).toLowerCase();

			if (_value=="false"||_value=="none") _value = "none";

			else _value = "";

		} else if (_name=="left"||_name=="top"||_name=="width"||_name=="height") {

			_value = (""+_value).toLowerCase();

			if (_value!=""&&_value.indexOf("px")<0) _value += "px";

		}

		this.style[_name] = _value;

	} catch(e) {

		var s = "";

		s += "RichScript Error From richScript.$().setStyle() : \n";

		s += "- Object ID : " + o.id + "\n";

		s += "- Style Property : " + _name + "\n";

		alert(s);

	}

}

function $_prototype_getStyle(_name) {

	return this.style[_name];

}

function $_prototype_setPosition(_x, _y) {

	if (_x!=undefined) this.setStyle("left", _x);

	if (_y!=undefined) this.setStyle("top", _y);

}

function $_prototype_getW() {

	return this.offsetWidth;

}

function $_prototype_getH() {

	return this.offsetHeight;

}

function $_prototype_getX() {

	var posX = this.style.left;

	if (posX=="") {

		posX = 0;

		var tempObj = this;

		if (tempObj.offsetParent) {

			while (tempObj.offsetParent) {

				posX += tempObj.offsetLeft;

				tempObj = tempObj.offsetParent;

			}

		}

		tempObj = null;

	} else {

		posX = parseInt(posX.toLowerCase().replace("px",""));

	}

	return posX;

}

function $_prototype_getY() {

	var posY = this.style.top;

	if (posY=="") {

		posY = 0;

		var tempObj = this;

		if (tempObj.offsetParent) {

			while (tempObj.offsetParent) {

				posY += tempObj.offsetTop;

				tempObj = tempObj.offsetParent;

			}

		}

		tempObj = null;

	} else {

		posY = parseInt(posY.toLowerCase().replace("px",""));

	}

	return posY;

}

function $_prototype_setOpacity(_value) {

	if (parseFloat(_value)>1) _value = parseFloat(_value)/100;

	this.setStyle("filter","alpha(opacity=" + (_value*100) + ")");

	this.setStyle("opacity",_value);

	this.setAttribute("opacity",_value);

}

function $_prototype_getOpacity() {

	var value = this.getAttribute("opacity") || this.getStyle("opacity") || 0;

	if (value==undefined||value=="") value = 0;

	return parseFloat(value);

}

function $_prototype_setFadeIn(_opacity, _sp, _function, _isReCall) {

	try {

		if (!this.isNull) {

			if (_isReCall!=true&&this.getAttribute("fade.status")=="ing") {

				this.setAttribute("fade.mode","in");

				this.setAttribute("fade.opacity",_opacity);

				this._fade_function = _function;

			} else {

				var mode = "in";

				if (_isReCall!=true) {

					if (!Math.isFloat(_opacity)) _opacity = 1.0;

					if (_opacity>1) _opacity = _opacity/100;

					if (!Math.isInt(_sp)) _sp = 30;

					this.setAttribute("fade.status","ing");

					this.setAttribute("fade.mode",mode);

					this.setAttribute("fade.opacity",_opacity);

					this._fade_function = _function;

				} else {

					mode = this.getAttribute("fade.mode");

					_opacity = parseFloat(this.getAttribute("fade.opacity"));

					_sp = parseInt(this.getAttribute("fade.sp"));

				}

				if (mode=="out") {

					this.setFadeOut(null, null, null, true);

				} else {

					var nowOpacity = this.getOpacity();

					var targetOpacity = nowOpacity + 0.1;

					if (targetOpacity > _opacity) targetOpacity = _opacity;

					this.setOpacity(targetOpacity);

					if (targetOpacity<_opacity) {

						var _id = this.id;

						this.fadeTimer = setTimeout( function() {

							richScript.$(_id).setFadeIn(null, null, null, true);

						}, _sp);

					} else {

						this.removeAttribute("fade.status");

						this.removeAttribute("fade.mode");

						this.removeAttribute("fade.opacity");

						_function = this._fade_function;

						this._fade_function = null;

						if (_function==undefined) _function = "";

						try {

							if (typeof(_function)=="function") {

								_function();

							} else {

								eval(_function);

							}

						} catch(e) { }

					}

				}

			}

		}

	}catch(e) {

		alert("RichScript Error From richScript.$().setFadeIn() : " + e);

	}

}

function $_prototype_setFadeOut(_opacity, _sp, _function, _isReCall) {

	try {

		if (!this.isNull) {

			if (_isReCall!=true&&this.getAttribute("fade.status")=="ing") {

				this.setAttribute("fade.mode","out");

				this.setAttribute("fade.opacity",_opacity);

				this._fade_function = _function;

			} else {

				var mode = "out";

				if (_isReCall!=true) {

					if (!Math.isFloat(_opacity)) _opacity = 1.0;

					if (_opacity>1) _opacity = _opacity/100;

					if (!Math.isInt(_sp)) _sp = 30;

					this.setAttribute("fade.status","ing");

					this.setAttribute("fade.mode",mode);

					this.setAttribute("fade.opacity",_opacity);

					this._fade_function = _function;

				} else {

					mode = this.getAttribute("fade.mode");

					_opacity = parseFloat(this.getAttribute("fade.opacity"));

					_sp = parseInt(this.getAttribute("fade.sp"));

				}

				if (mode=="in") {

					this.setFadeIn(null, null, null, true);

				} else {

					var nowOpacity = this.getOpacity();

					var targetOpacity = nowOpacity - 0.1;

					if (targetOpacity < _opacity) targetOpacity = _opacity;

					this.setOpacity(targetOpacity);

					if (targetOpacity>_opacity) {

						var _id = this.id;

						this.fadeTimer = setTimeout( function() {

							richScript.$(_id).setFadeOut(null, null, null, true);

						}, _sp);

					} else {

						this.removeAttribute("fade.status");

						this.removeAttribute("fade.mode");

						this.removeAttribute("fade.opacity");

						_function = this._fade_function;

						this._fade_function = null;

						if (_function==undefined) _function = "";

						try {

							if (typeof(_function)=="function") {

								_function();

							} else {

								eval(_function);

							}

						} catch(e) { }

					}

				}

			}

		}

	}catch(e) {

		alert("RichScript Error From richScript.$().setFadeOut() : " + e);

	}

}

function $_prototype__getNextPoint(_prevPont, _targetPoint, _sp) {

	var point = 0;

	var finishPointChecking = false;

	var checkMode = "";

	if (_targetPoint<0) {

		if (_prevPont<0) {

			if (Math.abs(Math.abs(_targetPoint)-Math.abs(_prevPont))<_sp) {

				point = _targetPoint;

				finishPointChecking = true;

			}

			checkMode = "A";

		} else {

			checkMode = "B";

		}

	} else {

		if (_prevPont>=0) {

			if (Math.abs(Math.abs(_targetPoint)-Math.abs(_prevPont))<_sp) {

				point = _targetPoint;

				finishPointChecking = true;

			}

			checkMode = "C";

		} else {

			checkMode = "D";

		}

	}

	

	if (!finishPointChecking) {

		var setPoint = 0;

		var gapPoint = Math.abs(_prevPont-_targetPoint);

		if (checkMode=="A"||checkMode=="C") {

			gapPoint = Math.abs(_prevPont-_targetPoint);

		} else {

			gapPoint = Math.abs(_prevPont+_targetPoint);

		}

		var minusOption = 1;

		if (_prevPont > _targetPoint) minusOption *= -1;

		if (gapPoint>_sp) setPoint = _sp*minusOption;

		else setPoint = gapPoint*minusOption;

		point = _prevPont+setPoint;

	}

	return point;

}

function $_prototype_resizeToMotionA(_w, _h, _function, _sp, _isReCall) {

	if (!this.isNull) {

		var useMultiCommand = (this.getAttribute("resizeTo.useMultiCommand")=="true");

		if (useMultiCommand&&_isReCall!=true&&this.getAttribute("resizeTo.status")=="ing") {

			if (Math.isInt(_w)) this.setAttribute("resizeTo.w",_w);

			if (Math.isInt(_h)) this.setAttribute("resizeTo.h",_h);

			if (Math.isInt(_sp)) this.setAttribute("resizeTo.sp",_sp);

			this._resizeTo_function = _function;

		}

		if (_isReCall==true||this.getAttribute("resizeTo.status")!="ing") {

			try {

				var w = this.getW();

				var h = this.getH();

				if (_isReCall!=true) {

					if (!Math.isInt(_w)) _w = nowW;

					if (!Math.isInt(_h)) _h = nowH;

					if (!Math.isInt(_sp)) _sp = 10;

					else _sp = parseInt(_sp);

					this.setAttribute("resizeTo.status","ing");

					this.setAttribute("resizeTo.w", _w);

					this.setAttribute("resizeTo.h", _h);

					this.setAttribute("resizeTo.sp", _sp);

					this._resizeTo_function = _function;

				} else {

					_w = parseInt(this.getAttribute("resizeTo.w"));

					_h = parseInt(this.getAttribute("resizeTo.h"));

					_sp = parseInt(this.getAttribute("resizeTo.sp"));

				}

				if (_w<1) _w = 1;

				if (_h<1) _h = 1;

				var targetW = this._getNextPoint(w,_w,_sp);

				var targetH = this._getNextPoint(h,_h,_sp);

				this.setStyle("width",targetW);

				this.setStyle("height",targetH);

				

				if (w==_w&&h==_h) {

					this.removeAttribute("resizeTo.status");

					this.removeAttribute("resizeTo.w");

					this.removeAttribute("resizeTo.h");

					this.removeAttribute("resizeTo.sp");

					_function = this._resizeTo_function;

					this._resizeTo_function = null;

					if (_function==undefined) _function = "";

					try {

						if (typeof(_function)=="function") {

							_function();

						} else {

							eval(_function);

						}

					} catch(e) { }

				} else {

					var _id = this.id;

					this.resizeToTimer = setTimeout( function() {

						richScript.$(_id).resizeToMotionA(null, null, null, null, true);

					}, 10);

				}

			}catch(e) {

				alert("RichScript Error From richScript.$().resizeToMotionA() : " + e);

			}

		}

	}

}

function $_prototype_resizeTo(_w, _h, _function, _sp, _isReCall) {

	if (!this.isNull) {

		var useMultiCommand = (this.getAttribute("resizeTo.useMultiCommand")=="true");

		if (useMultiCommand&&_isReCall!=true&&this.getAttribute("resizeTo.status")=="ing") {

			if (Math.isInt(_w)) this.setAttribute("resizeTo.w",_w);

			if (Math.isInt(_h)) this.setAttribute("resizeTo.h",_h);

			if (Math.isInt(_sp)) this.setAttribute("resizeTo.sp",_sp);

			this._resizeTo_function = _function;

		}

		if (_isReCall==true||this.getAttribute("resizeTo.status")!="ing") {

			try {

				var nowW = this.getW();

				var nowH = this.getH();

				if (_isReCall!=true) {

					if (!Math.isInt(_w)) _w = nowW;

					if (!Math.isInt(_h)) _h = nowH;

					if (!Math.isInt(_sp)) _sp = 5;

					else _sp = parseInt(_sp);

					this.setAttribute("resizeTo.status","ing");

					this.setAttribute("resizeTo.w", _w);

					this.setAttribute("resizeTo.h", _h);

					this.setAttribute("resizeTo.sp", _sp);

					this._resizeTo_function = _function;

				} else {

					_w = parseInt(this.getAttribute("resizeTo.w"));

					_h = parseInt(this.getAttribute("resizeTo.h"));

					_sp = parseInt(this.getAttribute("resizeTo.sp"));

				}

				var targetW = (_w<1)?1:_w;

				var targetH = (_h<1)?1:_h;

				

				if (targetW==nowW&&targetH==nowH) {

					this.removeAttribute("resizeTo.status");

					this.removeAttribute("resizeTo.w");

					this.removeAttribute("resizeTo.h");

					this.removeAttribute("resizeTo.sp");

					_function = this._resizeTo_function;

					this._resizeTo_function = null;

					if (_function==undefined) _function = "";

					try {

						if (typeof(_function)=="function") {

							_function();

						} else {

							eval(_function);

						}

					} catch(e) { }

				} else {

					var addW = 0;

					var addH = 0;

					if (targetW > nowW) addW = Math.ceil((targetW - nowW) / _sp);

					else                addW = Math.ceil((nowW - targetW) / _sp)*-1;

					if (targetH > nowH) addH = Math.ceil((targetH - nowH) / _sp);

					else                addH = Math.ceil((nowH - targetH) / _sp)*-1;

					var finalW = nowW + addW;

					var finalH = nowH + addH;

					if (finalW<1) finalW = 1;

					if (finalH<1) finalH = 1;

					this.setStyle("width", finalW);

					this.setStyle("height", finalH);

					var _id = this.id;

					this.resizeToTimer = setTimeout( function() {

						richScript.$(_id).resizeTo(null, null, null, null, true);

					}, 10);

				}

			}catch(e) {

				alert("RichScript Error From richScript.$().resizeTo() : " + e);

			}

		}

	}

}

function $_prototype_moveTo(_x, _y, _function, _sp, _isReCall) {

	if (!this.isNull) {

		var useMultiCommand = (this.getAttribute("moveTo.useMultiCommand")=="true");

		if (useMultiCommand&&_isReCall!=true&&this.getAttribute("moveTo.status")=="ing") {

			if (Math.isInt(_x)) this.setAttribute("moveTo.x",_x);

			if (Math.isInt(_y)) this.setAttribute("moveTo.y",_y);

			if (Math.isInt(_sp)) this.setAttribute("moveTo.sp",_sp);

			this._moveTo_function = _function;

		}

		if (_isReCall==true||this.getAttribute("moveTo.status")!="ing") {

			try {

				var nowX = this.getX();

				var nowY = this.getY();

				if (_isReCall!=true) {

					if (!Math.isInt(_x)) _x = nowX;

					if (!Math.isInt(_y)) _y = nowY;

					if (!Math.isInt(_sp)) _sp = 5;

					else _sp = parseInt(_sp);

					this.setAttribute("moveTo.status","ing");

					this.setAttribute("moveTo.x", _x);

					this.setAttribute("moveTo.y", _y);

					this.setAttribute("moveTo.sp", _sp);

					this._moveTo_function = _function;

				} else {

					_x = parseInt(this.getAttribute("moveTo.x"));

					_y = parseInt(this.getAttribute("moveTo.y"));

					_sp = parseInt(this.getAttribute("moveTo.sp"));

				}

				var targetX = _x;

				var targetY = _y;

				

				if (targetX==nowX&&targetY==nowY) {

					this.removeAttribute("moveTo.status");

					this.removeAttribute("moveTo.x");

					this.removeAttribute("moveTo.y");

					this.removeAttribute("moveTo.sp");

					_function = this._moveTo_function;

					this._moveTo_function = null;

					if (_function==undefined) _function = "";

					try {

						if (typeof(_function)=="function") {

							_function();

						} else {

							eval(_function);

						}

					} catch(e) { }

				} else {

					var moveX = 0;

					var moveY = 0;

					var sp = _sp;

					if (Math.abs(targetX - nowX)<=20&&Math.abs(targetY - nowY)<=20) {

						sp = 2;

					}

					if (targetX > nowX) {

						moveX = Math.ceil((targetX - nowX) / sp);

					} else {

						moveX = Math.ceil((nowX - targetX) / sp)*-1;

					}

					if (targetY > nowY) {

						moveY = Math.ceil((targetY - nowY) / sp);

					} else {

						moveY = Math.ceil((nowY - targetY) / sp)*-1;

					}

					this.setStyle("left", nowX + moveX);

					this.setStyle("top", nowY + moveY);

					var _id = this.id;

					this.moveToTimer = setTimeout( function() {

						richScript.$(_id).moveTo(null, null, null, null, true);

					}, 10);

				}

			}catch(e) {

				alert("RichScript Error From richScript.$().moveTo() : " + e);

			}

		}

	}

}

function $_prototype_moveToMotionA(_x, _y, _function, _sp, _isReCall) {

	if (!this.isNull) {

		var useMultiCommand = (this.getAttribute("moveTo.useMultiCommand")=="true");

		if (useMultiCommand&&_isReCall!=true&&this.getAttribute("moveTo.status")=="ing") {

			if (Math.isInt(_x)) this.setAttribute("moveTo.x",_x);

			if (Math.isInt(_y)) this.setAttribute("moveTo.y",_y);

			if (Math.isInt(_sp)) this.setAttribute("moveTo.sp",_sp);

			this._moveTo_function = _function;

		}

		if (_isReCall==true||this.getAttribute("moveTo.status")!="ing") {

			try {

				var x = this.getX();

				var y = this.getY();

				if (_isReCall!=true) {

					if (!Math.isInt(_x)) _x = x;

					if (!Math.isInt(_y)) _y = y;

					if (!Math.isInt(_sp)) _sp = 10;

					else _sp = parseInt(_sp);

					this.setAttribute("moveTo.status","ing");

					this.setAttribute("moveTo.x", _x);

					this.setAttribute("moveTo.y", _y);

					this.setAttribute("moveTo.sp", _sp);

					this._moveTo_function = _function;

				} else {

					_x = parseInt(this.getAttribute("moveTo.x"));

					_y = parseInt(this.getAttribute("moveTo.y"));

					_sp = parseInt(this.getAttribute("moveTo.sp"));

				}

				

				if (x==_x&&x==_x) {

					this.removeAttribute("moveTo.status");

					this.removeAttribute("moveTo.x");

					this.removeAttribute("moveTo.y");

					this.removeAttribute("moveTo.sp");

					_function = this._moveTo_function;

					this._moveTo_function = null;

					if (_function==undefined) _function = "";

					try {

						if (typeof(_function)=="function") {

							_function();

						} else {

							eval(_function);

						}

					} catch(e) { }

				} else {

					var targetX = this._getNextPoint(x,_x,_sp);

					var targetY = this._getNextPoint(y,_y,_sp);

					this.setStyle("left",targetX);

					this.setStyle("top",targetY);

					var _id = this.id;

					this.moveToTimer = setTimeout( function() {

						richScript.$(_id).moveToMotionA(null, null, null, null, true);

					}, 10);

				}

			}catch(e) {

				alert("RichScript Error From richScript.$().moveToMotionA() : " + e);

			}

		}

	}

}

function $_prototype_moveToTarget(_targetId, _function, _sp, _isReCall) {

	if (!this.isNull) {

		var useMultiCommand = (this.getAttribute("moveTo.useMultiCommand")=="true");

		if (useMultiCommand&&_isReCall!=true&&this.getAttribute("moveTo.status")=="ing") {

			if (!richScript.$(_targetId).isNull) this.setAttribute("moveTo.targetId",_targetId);

			if (Math.isInt(_sp)) this.setAttribute("moveTo.sp",_sp);

			this._moveTo_function = _function;

		}

		if (_isReCall==true||this.getAttribute("moveTo.status")!="ing") {

			try {

				if (_isReCall!=true) {

					if (!Math.isInt(_sp)) _sp = 5;

					this.setAttribute("moveTo.status","ing");

					this.setAttribute("moveTo.targetId",_targetId);

					this.setAttribute("moveTo.sp",_sp);

					this._moveTo_function = _function;

				} else {

					_targetId = this.getAttribute("moveTo.targetId");

					_sp = this.getAttribute("moveTo.sp");

				}

				if (!richScript.$(_targetId).isNull) {

					var targetX = richScript.$(_targetId).getX();

					var targetY = richScript.$(_targetId).getY();

					var nowX = this.getX();

					var nowY = this.getY();

					

					if (targetX==nowX&&targetY==nowY) {

						this.removeAttribute("moveTo.status");

						this.removeAttribute("moveTo.targetId");

						this.removeAttribute("moveTo.sp");

						_function = this._moveTo_function;

						this._moveTo_function = null;

						if (_function==undefined) _function = "";

						try {

							if (typeof(_function)=="function") {

								_function();

							} else {

								eval(_function);

							}

						} catch(e) { }

					} else {

						var moveX = 0;

						var moveY = 0;

						if (targetX > nowX) moveX = Math.ceil((targetX - nowX) / _sp);

						else                moveX = Math.ceil((nowX - targetX) / _sp)*-1;

						if (targetY > nowY) moveY = Math.ceil((targetY - nowY) / _sp);

						else                moveY = Math.ceil((nowY - targetY) / _sp)*-1;

						this.setStyle("left", nowX + moveX);

						this.setStyle("top", nowY + moveY);

						var _id = this.id;

						this.moveToTimer = setTimeout( function() {

							richScript.$(_id).moveToTarget(null, null, null, true);

						}, 10);

					}

				} else {

					this.removeAttribute("moveTo.status");

					this.removeAttribute("moveTo.targetId");

					this.removeAttribute("moveTo.sp");

				}

			}catch(e) {

				alert("RichScript Error From richScript.$().moveToTarget() : " + e);

			}

		}

	}

}

function $_prototype_insertAfter(_newNode, _beforeNode) {

	if (_beforeNode.parentNode.lastChild==_beforeNode) {

		_beforeNode.parentNode.appendChild(_newNode);

	} else {

		_beforeNode.parentNode.insertBefore(_newNode, _beforeNode.nextSibling);

	}

}

function $_prototype_createChildNode(_html, _tagName, _id) {

	var tagName = (_tagName==undefined) ? "SPAN" : _tagName;

	var node = document.createElement(tagName);

	if (_id!=undefined) {

		node.setAttribute("id", _id);

	}

	node.innerHTML = _html;

	this.appendChild(node);

	node = null;

}

var $o = richScript.$;















/**

 Event

*****************************/

richScript.$E = {

	vars : {},

	event : null,

	eventActions : [],

	

	getElement : function() {

		return this.event.target || this.event.srcElement;

	},

	

	getValidElement : function(_attributeName,_attributeValue) {

		var element = this.getElement();

		while(element) {

			if (element.getAttribute(_attributeName)==_attributeValue) {

				break;

			}

			element = element.parentNode;

		}

		return element;

	},

	

	pointerX : function() {

		var x = 0;

		if (this.event!=null) {

			x = this.event.pageX || (this.event.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));

		}

		return x;

	},

	

	pointerY : function() {

		var y = 0;

		if (this.event!=null) {

			y = this.event.pageY || (this.event.clientY + (document.documentElement.scrollTop || document.body.scrollTop));

		}

		return y;

	},

	

	

	addAction : function(_eventType, _eventGroup, _eventAction) {

		this.eventActions.push(

			{

				  type		: _eventType.trim().toLowerCase()

				, group		: _eventGroup.trim().toLowerCase()

				, action	: _eventAction

			}

		);

	},

	

	removeAction : function(_eventGroup) {

		for (var i=0; i<this.eventActions.length; i++) {

			var eAction = this.eventActions[i];

			if (eAction.group==_eventGroup.trim().toLowerCase()) {

				this.eventActions[i] = null;

			}

		}

		this.eventActions = this.eventActions.compact();

	},

	

	stop : function() {

		if (this.event.preventDefault!=undefined) {

			this.event.preventDefault();

			this.event.stopPropagation();

		} else {

			this.event.returnValue = false;

			this.event.cancelBubble = true;

		}

	},

	

	onEvent : function(_eventType) {

		for (var i=0; i<this.eventActions.length; i++) {

			var eAction = this.eventActions[i];

			if (eAction.type==_eventType.trim().toLowerCase()) {

				try {

					if (typeof(eAction.action)=="function") {

						eAction.action();

					} else {

						eval(eAction.action);

					}

				} catch(e) { }

			}

		}

	}

};

var $E = richScript.$E;



richScript.eventMonitor = {

	run : function(_event) {

		_event = window.event ? window.event : _event;

		richScript.$E.event = _event;

		richScript.$E.onEvent("on"+_event.type);

	},

	observe : function(_targetObject, _eventType, _function) {

		_eventType = _eventType.toLowerCase();

		if (_function==undefined) _function = this.run;

		/* FF, CR, OP, SF */

		if(_targetObject.addEventListener) {

			_targetObject.addEventListener(_eventType, _function, false);

		}

		/* IE */

		else if (_targetObject.attachEvent) {

			_targetObject.attachEvent("on"+_eventType, _function);   

		}

		else {

			_targetObject["on"+_eventType] = _function;

		}

	}

};

/*

richScript.eventMonitor.observe(document, "mousedown");

richScript.eventMonitor.observe(document, "mouseup");

richScript.eventMonitor.observe(document, "mousemove");

richScript.eventMonitor.observe(document, "mouseover");

richScript.eventMonitor.observe(document, "selectstart");

richScript.eventMonitor.observe(document, "click");

richScript.eventMonitor.observe(document, "keydown");

richScript.eventMonitor.observe(document, "contextmenu");

richScript.eventMonitor.observe(window, "unload");

*/

richScript.eventMonitor.observe(document, "mousewheel");

richScript.eventMonitor.observe(window, "load");

richScript.eventMonitor.observe(window, "resize");

richScript.eventMonitor.observe(window, "scroll");



/**

 Clear Browser Memory

*****************************/

var $GARBAGE = {

	instanceName : "$GARBAGE",

	objectNames : null,

	add : function(_objectName) {

		if (this.objectNames==null) {

			this.objectNames = [];

		}

		this.objectNames.push(_objectName);

	},

	cleanup : function() {

		if (this.instanceName!=null) {

			/* this.add(this.instanceName); */

			if (this.objectNames!=null) {

				for (var i=0; i<this.objectNames.length; i++) {

					try {

						eval(this.objectNames[i]+".__clearMemory()");

					} catch(e) { }

					try {

						eval(this.objectNames[i]+"= null");

					} catch(e) { }

				}

				this.objectNames = null;

			}

		}

	}

};



richScript.$E.addAction("onUnload", "onUnload", function() {

	$GARBAGE.cleanup();

});





/**

 Use BackgroundImageCache For IE

*****************************/

try {

	document.execCommand('BackgroundImageCache', false, true);

} catch(e) {}
out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/js/lib/richscript/logging.js"></scr'+'ipt>');
