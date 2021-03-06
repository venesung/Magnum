/*! Copyright (c) 2013 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.1.3
 *
 * Requires: 1.2.2+
 */

(function (factory) {
    if ( typeof define === 'function' && define.amd ) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // Node/CommonJS style for Browserify
        module.exports = factory;
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($) {

    var toFix = ['wheel', 'mousewheel', 'DOMMouseScroll', 'MozMousePixelScroll'];
    var toBind = 'onwheel' in document || document.documentMode >= 9 ? ['wheel'] : ['mousewheel', 'DomMouseScroll', 'MozMousePixelScroll'];
    var lowestDelta, lowestDeltaXY;

    if ( $.event.fixHooks ) {
        for ( var i = toFix.length; i; ) {
            $.event.fixHooks[ toFix[--i] ] = $.event.mouseHooks;
        }
    }

    $.event.special.mousewheel = {
        setup: function() {
            if ( this.addEventListener ) {
                for ( var i = toBind.length; i; ) {
                    this.addEventListener( toBind[--i], handler, false );
                }
            } else {
                this.onmousewheel = handler;
            }
        },

        teardown: function() {
            if ( this.removeEventListener ) {
                for ( var i = toBind.length; i; ) {
                    this.removeEventListener( toBind[--i], handler, false );
                }
            } else {
                this.onmousewheel = null;
            }
        }
    };

    $.fn.extend({
        mousewheel: function(fn) {
            return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
        },

        unmousewheel: function(fn) {
            return this.unbind("mousewheel", fn);
        }
    });


    function handler(event) {
        var orgEvent = event || window.event,
            args = [].slice.call(arguments, 1),
            delta = 0,
            deltaX = 0,
            deltaY = 0,
            absDelta = 0,
            absDeltaXY = 0,
            fn;
        event = $.event.fix(orgEvent);
        event.type = "mousewheel";

        // Old school scrollwheel delta
        if ( orgEvent.wheelDelta ) { delta = orgEvent.wheelDelta; }
        if ( orgEvent.detail )     { delta = orgEvent.detail * -1; }

        // New school wheel delta (wheel event)
        if ( orgEvent.deltaY ) {
            deltaY = orgEvent.deltaY * -1;
            delta  = deltaY;
        }
        if ( orgEvent.deltaX ) {
            deltaX = orgEvent.deltaX;
            delta  = deltaX * -1;
        }

        // Webkit
        if ( orgEvent.wheelDeltaY !== undefined ) { deltaY = orgEvent.wheelDeltaY; }
        if ( orgEvent.wheelDeltaX !== undefined ) { deltaX = orgEvent.wheelDeltaX * -1; }

        // Look for lowest delta to normalize the delta values
        absDelta = Math.abs(delta);
        if ( !lowestDelta || absDelta < lowestDelta ) { lowestDelta = absDelta; }
        absDeltaXY = Math.max(Math.abs(deltaY), Math.abs(deltaX));
        if ( !lowestDeltaXY || absDeltaXY < lowestDeltaXY ) { lowestDeltaXY = absDeltaXY; }

        // Get a whole value for the deltas
        fn = delta > 0 ? 'floor' : 'ceil';
        delta  = Math[fn](delta / lowestDelta);
        deltaX = Math[fn](deltaX / lowestDeltaXY);
        deltaY = Math[fn](deltaY / lowestDeltaXY);

        // Add event and delta to the front of the arguments
        args.unshift(event, delta, deltaX, deltaY);

        return ($.event.dispatch || $.event.handle).apply(this, args);
    }

}));


/*
jquery.animate-enhanced plugin v1.03
---
http://github.com/benbarnett/jQuery-Animate-Enhanced
http://benbarnett.net
@benpbarnett
*/

/*
(function(e,C,D){function I(a,b,f,c){if("d"!=f&&E(a)){var g=J.exec(b),d="auto"===a.css(f)?0:a.css(f),d="string"==typeof d?z(d):d;"string"==typeof b&&z(b);c=!0===c?0:d;var e=a.is(":hidden"),k=a.translation();"left"==f&&(c=parseInt(d,10)+k.x);"right"==f&&(c=parseInt(d,10)+k.x);"top"==f&&(c=parseInt(d,10)+k.y);"bottom"==f&&(c=parseInt(d,10)+k.y);g||"show"!=b?g||"hide"!=b||(c=0):(c=1,e&&a.css({display:K(a.context.tagName),opacity:0}));return g?(a=parseFloat(g[2]),g[1]&&(a=("-="===g[1]?-1:1)*a+parseInt(c,
10)),a):c}}function L(a,b,f,c,g,d,h,k){var l=a.data(t),l=l&&!w(l)?l:e.extend(!0,{},M),q=g;if(-1<e.inArray(b,A)){var r=l.meta,p=z(a.css(b))||0,n=b+"_o",q=g-p;r[b]=q;r[n]="auto"==a.css(b)?0+q:p+q||0;l.meta=r;h&&0===q&&(q=0-r[n],r[b]=q,r[n]=0)}return a.data(t,N(a,l,b,f,c,q,d,h,k))}function N(a,b,f,c,g,d,e,k,l){var q=!1;e=!0===e&&!0===k;b=b||{};b.original||(b.original={},q=!0);b.properties=b.properties||{};b.secondary=b.secondary||{};k=b.meta;for(var r=b.original,p=b.properties,t=b.secondary,s=n.length-
1;0<=s;s--){var m=n[s]+"transition-property",u=n[s]+"transition-duration",v=n[s]+"transition-timing-function";f=e?n[s]+"transform":f;q&&(r[m]=a.css(m)||"",r[u]=a.css(u)||"",r[v]=a.css(v)||"");t[f]=e?!0===l||!0===B&&!1!==l&&F?"translate3d("+k.left+"px, "+k.top+"px, 0)":"translate("+k.left+"px,"+k.top+"px)":d;p[m]=(p[m]?p[m]+",":"")+f;p[u]=(p[u]?p[u]+",":"")+c+"ms";p[v]=(p[v]?p[v]+",":"")+g}return b}function O(a){for(var b in a)if(!("width"!=b&&"height"!=b||"show"!=a[b]&&"hide"!=a[b]&&"toggle"!=a[b]))return!0;
return!1}function w(a){for(var b in a)return!1;return!0}function K(a){a=a.toUpperCase();var b={LI:"list-item",TR:"table-row",TD:"table-cell",TH:"table-cell",CAPTION:"table-caption",COL:"table-column",COLGROUP:"table-column-group",TFOOT:"table-footer-group",THEAD:"table-header-group",TBODY:"table-row-group"};return"string"==typeof b[a]?b[a]:"block"}function z(a){return parseFloat(a.replace(a.match(/\D+$/),""))}function E(a){var b=!0;a.each(function(a,c){return b=b&&c.ownerDocument});return b}function P(a,
b,f){if(!E(f))return!1;var c=-1<e.inArray(a,Q);"width"!=a&&"height"!=a&&"opacity"!=a||parseFloat(b)!==parseFloat(f.css(a))||(c=!1);return c}var Q="top right bottom left opacity height width".split(" "),A=["top","right","bottom","left"],n=["-webkit-","-moz-","-o-",""],R=["avoidTransforms","useTranslate3d","leaveTransforms"],J=/^([+-]=)?([\d+-.]+)(.*)$/,S=/([A-Z])/g,M={secondary:{},meta:{top:0,right:0,bottom:0,left:0}},t="jQe",G=null,x=!1,y=(document.body||document.documentElement).style,H=void 0!==
y.WebkitTransition||void 0!==y.MozTransition||void 0!==y.OTransition||void 0!==y.transition,F="WebKitCSSMatrix"in window&&"m11"in new WebKitCSSMatrix,B=F;e.expr&&e.expr.filters&&(G=e.expr.filters.animated,e.expr.filters.animated=function(a){return e(a).data("events")&&e(a).data("events")["webkitTransitionEnd oTransitionEnd transitionend"]?!0:G.call(this,a)});e.extend({toggle3DByDefault:function(){return B=!B},toggleDisabledByDefault:function(){return x=!x},setDisabledByDefault:function(a){return x=
a}});e.fn.translation=function(){if(!this[0])return null;var a=window.getComputedStyle(this[0],null),b={x:0,y:0};if(a)for(var e=n.length-1;0<=e;e--){var c=a.getPropertyValue(n[e]+"transform");if(c&&/matrix/i.test(c)){a=c.replace(/^matrix\(/i,"").split(/, |\)$/g);b={x:parseInt(a[4],10),y:parseInt(a[5],10)};break}}return b};e.fn.animate=function(a,b,f,c){a=a||{};var g=!("undefined"!==typeof a.bottom||"undefined"!==typeof a.right),d=e.speed(b,f,c),h=this,k=0,l=function(){k--;0===k&&"function"===typeof d.complete&&
d.complete.apply(h,arguments)};return!0===("undefined"!==typeof a.avoidCSSTransitions?a.avoidCSSTransitions:x)||!H||w(a)||O(a)||0>=d.duration||d.step?C.apply(this,arguments):this[!0===d.queue?"queue":"each"](function(){var b=e(this),c=e.extend({},d),f=function(c){var d=b.data(t)||{original:{}},f={};if(2==c.eventPhase){if(!0!==a.leaveTransforms){for(c=n.length-1;0<=c;c--)f[n[c]+"transform"]="";if(g&&"undefined"!==typeof d.meta){c=0;for(var h;h=A[c];++c)f[h]=d.meta[h+"_o"]+"px",e(this).css(h,f[h])}}b.unbind("webkitTransitionEnd oTransitionEnd transitionend").css(d.original).css(f).data(t,
null);"hide"===a.opacity&&b.css({display:"none",opacity:""});l.call(this)}},h={bounce:"cubic-bezier(0.0, 0.35, .5, 1.3)",linear:"linear",swing:"ease-in-out",easeInQuad:"cubic-bezier(0.550, 0.085, 0.680, 0.530)",easeInCubic:"cubic-bezier(0.550, 0.055, 0.675, 0.190)",easeInQuart:"cubic-bezier(0.895, 0.030, 0.685, 0.220)",easeInQuint:"cubic-bezier(0.755, 0.050, 0.855, 0.060)",easeInSine:"cubic-bezier(0.470, 0.000, 0.745, 0.715)",easeInExpo:"cubic-bezier(0.950, 0.050, 0.795, 0.035)",easeInCirc:"cubic-bezier(0.600, 0.040, 0.980, 0.335)",
easeInBack:"cubic-bezier(0.600, -0.280, 0.735, 0.045)",easeOutQuad:"cubic-bezier(0.250, 0.460, 0.450, 0.940)",easeOutCubic:"cubic-bezier(0.215, 0.610, 0.355, 1.000)",easeOutQuart:"cubic-bezier(0.165, 0.840, 0.440, 1.000)",easeOutQuint:"cubic-bezier(0.230, 1.000, 0.320, 1.000)",easeOutSine:"cubic-bezier(0.390, 0.575, 0.565, 1.000)",easeOutExpo:"cubic-bezier(0.190, 1.000, 0.220, 1.000)",easeOutCirc:"cubic-bezier(0.075, 0.820, 0.165, 1.000)",easeOutBack:"cubic-bezier(0.175, 0.885, 0.320, 1.275)",easeInOutQuad:"cubic-bezier(0.455, 0.030, 0.515, 0.955)",
easeInOutCubic:"cubic-bezier(0.645, 0.045, 0.355, 1.000)",easeInOutQuart:"cubic-bezier(0.770, 0.000, 0.175, 1.000)",easeInOutQuint:"cubic-bezier(0.860, 0.000, 0.070, 1.000)",easeInOutSine:"cubic-bezier(0.445, 0.050, 0.550, 0.950)",easeInOutExpo:"cubic-bezier(1.000, 0.000, 0.000, 1.000)",easeInOutCirc:"cubic-bezier(0.785, 0.135, 0.150, 0.860)",easeInOutBack:"cubic-bezier(0.680, -0.550, 0.265, 1.550)"},s={},h=h[c.easing||"swing"]?h[c.easing||"swing"]:c.easing||"swing",m;for(m in a)if(-1===e.inArray(m,
R)){var u=-1<e.inArray(m,A),v=I(b,a[m],m,u&&!0!==a.avoidTransforms);P(m,v,b)?L(b,m,c.duration,h,v,u&&!0!==a.avoidTransforms,g,a.useTranslate3d):s[m]=a[m]}b.unbind("webkitTransitionEnd oTransitionEnd transitionend");m=b.data(t);if(!m||w(m)||w(m.secondary))c.queue=!1;else{k++;b.css(m.properties);var x=m.secondary;setTimeout(function(){b.bind("webkitTransitionEnd oTransitionEnd transitionend",f).css(x)})}w(s)||(k++,C.apply(b,[s,{duration:c.duration,easing:e.easing[c.easing]?c.easing:e.easing.swing?"swing":
"linear",complete:l,queue:c.queue}]));return!0})};e.fn.animate.defaults={};e.fn.stop=function(a,b,f){if(!H)return D.apply(this,[a,b]);a&&this.queue([]);this.each(function(){var c=e(this),g=c.data(t);if(g&&!w(g)){var d,h={};if(b){if(h=g.secondary,!f&&void 0!==typeof g.meta.left_o||void 0!==typeof g.meta.top_o)for(h.left=void 0!==typeof g.meta.left_o?g.meta.left_o:"auto",h.top=void 0!==typeof g.meta.top_o?g.meta.top_o:"auto",d=n.length-1;0<=d;d--)h[n[d]+"transform"]=""}else if(!w(g.secondary)){var k=
window.getComputedStyle(c[0],null);if(k)for(var l in g.secondary)if(g.secondary.hasOwnProperty(l)&&(l=l.replace(S,"-$1").toLowerCase(),h[l]=k.getPropertyValue(l),!f&&/matrix/i.test(h[l])))for(d=h[l].replace(/^matrix\(/i,"").split(/, |\)$/g),h.left=parseFloat(d[4])+parseFloat(c.css("left"))+"px"||"auto",h.top=parseFloat(d[5])+parseFloat(c.css("top"))+"px"||"auto",d=n.length-1;0<=d;d--)h[n[d]+"transform"]=""}c.unbind("webkitTransitionEnd oTransitionEnd transitionend");c.css(g.original).css(h).data(t,
null)}else D.apply(c,[a,b])});return this}})(jQuery,jQuery.fn.animate,jQuery.fn.stop);
*/

/*!
 * jQuery Transit - CSS3 transitions and transformations
 * Copyright(c) 2011 Rico Sta. Cruz <rico@ricostacruz.com>
 * MIT Licensed.
 *
 * http://ricostacruz.com/jquery.transit
 * http://github.com/rstacruz/jquery.transit
 */
 

(function(d){function k(a){var b=["Moz","Webkit","O","ms"],c=a.charAt(0).toUpperCase()+a.substr(1);if(a in i.style){return a}for(a=0;a<b.length;++a){var d=b[a]+c;if(d in i.style){return d}}}function j(a){"string"===typeof a&&this.parse(a);return this}function p(a,b,c){!0===b?a.queue(c):b?a.queue(b,c):c()}function m(a){var b=[];d.each(a,function(a){a=d.camelCase(a);a=d.transit.propertyMap[a]||a;a=r(a);-1===d.inArray(a,b)&&b.push(a)});return b}function q(a,b,c,e){a=m(a);d.cssEase[c]&&(c=d.cssEase[c]);var h=""+n(b)+" "+c;0<parseInt(e,10)&&(h+=" "+n(e));var f=[];d.each(a,function(a,b){f.push(b+" "+h)});return f.join(", ")}function f(a,b){b||(d.cssNumber[a]=!0);d.transit.propertyMap[a]=e.transform;d.cssHooks[a]={get:function(b){return(d(b).css("transform")||new j).get(a)},set:function(b,e){var h=d(b).css("transform")||new j;h.setFromString(a,e);d(b).css({transform:h})}}}function r(a){return a.replace(/([A-Z])/g,function(a){return"-"+a.toLowerCase()})}function g(a,b){return"string"===typeof a&&!a.match(/^[\-0-9\.]+$/)?a:""+a+b}function n(a){d.fx.speeds[a]&&(a=d.fx.speeds[a]);return g(a,"ms")}d.transit={version:"0.1.3",propertyMap:{marginLeft:"margin",marginRight:"margin",marginBottom:"margin",marginTop:"margin",paddingLeft:"padding",paddingRight:"padding",paddingBottom:"padding",paddingTop:"padding"},enabled:!0,useTransitionEnd:!1};var i=document.createElement("div"),e={},s=-1<navigator.userAgent.toLowerCase().indexOf("chrome");e.transition=k("transition");e.transitionDelay=k("transitionDelay");e.transform=k("transform");e.transformOrigin=k("transformOrigin");i.style[e.transform]="";i.style[e.transform]="rotateY(90deg)";e.transform3d=""!==i.style[e.transform];d.extend(d.support,e);var o=e.transitionEnd={MozTransition:"transitionend",OTransition:"oTransitionEnd",WebkitTransition:"webkitTransitionEnd",msTransition:"MSTransitionEnd"}[e.transition]||null,i=null;d.cssEase={_default:"ease","in":"ease-in",out:"ease-out","in-out":"ease-in-out",snap:"cubic-bezier(0,1,.5,1)"};d.cssHooks.transform={get:function(a){return d(a).data("transform")},set:function(a,b){var c=b;c instanceof j||(c=new j(c));a.style[e.transform]="WebkitTransform"===e.transform&&!s?c.toString(!0):c.toString();d(a).data("transform",c)}};d.cssHooks.transformOrigin={get:function(a){return a.style[e.transformOrigin]},set:function(a,b){a.style[e.transformOrigin]=b}};f("scale");f("translate");f("rotate");f("rotateX");f("rotateY");f("rotate3d");f("perspective");f("skewX");f("skewY");f("x",!0);f("y",!0);j.prototype={setFromString:function(a,b){var c="string"===typeof b?b.split(","):b.constructor===Array?b:[b];c.unshift(a);j.prototype.set.apply(this,c)},set:function(a){var b=Array.prototype.slice.apply(arguments,[1]);this.setter[a]?this.setter[a].apply(this,b):this[a]=b.join(",")},get:function(a){return this.getter[a]?this.getter[a].apply(this):this[a]||0},setter:{rotate:function(a){this.rotate=g(a,"deg")},rotateX:function(a){this.rotateX=g(a,"deg")},rotateY:function(a){this.rotateY=g(a,"deg")},scale:function(a,b){void 0===b&&(b=a);this.scale=a+","+b},skewX:function(a){this.skewX=g(a,"deg")},skewY:function(a){this.skewY=g(a,"deg")},perspective:function(a){this.perspective=g(a,"px")},x:function(a){this.set("translate",a,null)},y:function(a){this.set("translate",null,a)},translate:function(a,b){void 0===this._translateX&&(this._translateX=0);void 0===this._translateY&&(this._translateY=0);null!==a&&(this._translateX=g(a,"px"));null!==b&&(this._translateY=g(b,"px"));this.translate=this._translateX+","+this._translateY}},getter:{x:function(){return this._translateX||0},y:function(){return this._translateY||0},scale:function(){var a=(this.scale||"1,1").split(",");a[0]&&(a[0]=parseFloat(a[0]));a[1]&&(a[1]=parseFloat(a[1]));return a[0]===a[1]?a[0]:a},rotate3d:function(){for(var a=(this.rotate3d||"0,0,0,0deg").split(","),b=0;3>=b;++b){a[b]&&(a[b]=parseFloat(a[b]))}a[3]&&(a[3]=g(a[3],"deg"));return a}},parse:function(a){var b=this;a.replace(/([a-zA-Z0-9]+)\((.*?)\)/g,function(a,d,e){b.setFromString(d,e)})},toString:function(a){var b=[],c;for(c in this){if(this.hasOwnProperty(c)&&(e.transform3d||!("rotateX"===c||"rotateY"===c||"perspective"===c||"transformOrigin"===c))){"_"!==c[0]&&(a&&"scale"===c?b.push(c+"3d("+this[c]+",1)"):a&&"translate"===c?b.push(c+"3d("+this[c]+",0)"):b.push(c+"("+this[c]+")"))}}return b.join(" ")}};d.fn.transition=d.fn.transit=function(a,b,c,f){var h=this,g=0,i=!0;"function"===typeof b&&(f=b,b=void 0);"function"===typeof c&&(f=c,c=void 0);"undefined"!==typeof a.easing&&(c=a.easing,delete a.easing);"undefined"!==typeof a.duration&&(b=a.duration,delete a.duration);"undefined"!==typeof a.complete&&(f=a.complete,delete a.complete);"undefined"!==typeof a.queue&&(i=a.queue,delete a.queue);"undefined"!==typeof a.delay&&(g=a.delay,delete a.delay);"undefined"===typeof b&&(b=d.fx.speeds._default);"undefined"===typeof c&&(c=d.cssEase._default);var b=n(b),j=q(a,b,c,g),l=d.transit.enabled&&e.transition?parseInt(b,10)+parseInt(g,10):0;if(0===l){return p(h,i,function(b){h.css(a);f&&f();b()}),h}var k={},m=function(b){var c=false,g=function(){c&&h.unbind(o,g);l>0&&h.each(function(){this.style[e.transition]=k[this]||null});typeof f==="function"&&f.apply(h);typeof b==="function"&&b()};if(l>0&&o&&d.transit.useTransitionEnd){c=true;h.bind(o,g)}else{window.setTimeout(g,l)}h.each(function(){l>0&&(this.style[e.transition]=j);d(this).css(a)})};p(h,i,function(a){var b=0;e.transition==="MozTransition"&&b<25&&(b=25);window.setTimeout(function(){m(a)},b)});return this};d.transit.getTransitionValue=q})(jQuery);

/*
* url parameter�� �޾ƿ���
*/

function urlParameter()
{
	var url = location.href;
	var obj = {};
	try
	{
		var pm  = url.split('?');
		var params = pm[1].split('&');

		for( var i=0; i<params.length; i++ )
		{
			var param = params[i].split("=");
			obj[ param[0] ] = param[1];
		}
	}
	catch ( e )
	{
		
	}
	return obj;
}


