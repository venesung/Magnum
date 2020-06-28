/**
 * @author : Jo Yun Ki (ddoeng@naver.com)
 * @version : 1.0
 * @since : 2013.12.04
 *
 * 어린이 한국가스공사 공통 스크립트
 */

/********************************************************************************************/
/**************************************** String Util ****************************************/
/********************************************************************************************/

var StringUtil = {
	/**
	 * 문자열 전체를 특정 문자를 선택하여 변경
	 * @param str			::: 문자열
	 * @param oldSubStr	::: 변경될 문자
	 * @param newSubStr	::: 변경된 문자
	 * @return 				::: 새로운 문자열
	 * 
	 */
	setReplace: function(str, oldSubStr, newSubStr) {
		return str.split(oldSubStr).join(newSubStr);
	}
};

$(document).ready(function () {
	initGnb();
	initMain();
	initTaekwondoTab();
	initTaekwondoBbs();
	initMovie();
});

/*메인*/
var initGnb = function () {
	if ($('.header').length === 0) return false;

	var container = $('.gnbList');
	var menuLI = container.find('> li');
	var menuA = menuLI.find('a');
	var act1, act2;

	var timerId;

	menuDefault();
	menuMemory();

	function menuMemory() {
		if (act1 === undefined && act2 === undefined) {
			var title =  StringUtil.setReplace($('.lnbSect > ul > li > a.on').text(), ' ', '');
			menuA.each(function () {
				var target = $(this)
				var isDepth1 = (target.parentsUntil(container, 'ul').length === 0);

				if (!isDepth1 && StringUtil.setReplace(target.text(), ' ', '') === title) {
					act2 = target.closest('li').index();
					act1 = target.closest('div').parent().index();

					menuLI.eq(act1).addClass('on').find('li').eq(act2).addClass('on');

					return false;
				}
			});
		} else {
			menuLI.eq(act1).addClass('on').find('li').eq(act2).addClass('on');
		}
	}

	function menuDefault() {
		container.find('li').removeClass('on');
	}

	menuA.on('mouseenter focusin', function (e) {
		var target = $(e.currentTarget);
		var li = target.parent();
		var sub = target.siblings('div');
		var isDepth1 = (target.parentsUntil(container, 'ul').length === 0);

		if (timerId !== undefined) clearTimeout(timerId);

		if (isDepth1) {
			menuDefault();
		} else {
			li = target.closest('li').closest('li');
		}

		li.addClass('on').siblings().removeClass('on');

		/*
		if (isDepth1) {
			sub.css('marginTop', '-10px').stop().animate({
				'marginTop' : '0px'
			}, {queue:false, duration:700});
		}
		*/
	});

	container.on('mouseleave focusout', function (e) {
		timerId = setTimeout(fun, 100);
		
		function fun () {
			menuDefault();
			menuMemory();
		}
	});
};

/*메인*/
var initMain = function () {
	if ($('.bannerList').length === 0) return false;

	var maskDiv = $('.bannerList > ul').wrap('<div id="rollingMaskDIV">').parent();
	var ul = maskDiv.find('> ul');
	var li = ul.find('> li');
	maskDiv.css({
		'overflow' : 'hidden',
		'width' : '190px',
		'height' : '191px'
	});

	li.css('float', 'left');
	ul.css({
		'overflow': 'visible',
		'width': li.length * 190
	});

	var rollingData = {
		container: '.bannerList',									//전체 영역 부모
		itemContainer: '.bannerList > #rollingMaskDIV > ul',		//리스트를 감싸고 있는 부모
		item: '.bannerList > #rollingMaskDIV > ul > li',			//리스트들
		upA: '.bannerList .control a.prev',							//화살표 위
		downA: '.bannerList .control a.next',						//화살표 아래
		dotA: '.bannerList .control > ul > li > a',					//도트버튼
		distance: 190,												//클릭시 리스트 하나당 이동할 거리
		range: 1,													//노출될 리스트 갯수                기본값 1
		jump: 1,													//한번에 이동 할 갯수               기본값 1
		delay: 5000,												//자동롤링 시간                     기본값 5000
		speed: 0,													//모션 속도                         기본값 800
		direction: 'horizontal',									//방향                              기본값 horizontal (수평)
		play: true,													//자동 롤링 유무                    기본값 false
		first: true,												//슬라이딩 처음으로 돌아가기 유무   기본값 false
		repeat: false												//한 방향으로 무한 반복 유무        기본값 false
	}
	  
	var rolling = new Rolling();
	rolling.init(rollingData);

	rolling.exComplete(function () {
		ul.css('opacity', '0').animate({
			'opacity' : '1'
		}, {queue:false, duration:500});
	});

	rolling.exDot(function (idx) {
		$(rollingData.dotA).parent().removeClass('on').eq(idx).addClass('on');
	});
};

/*우리는 태권도 전문가 탭*/
var initTaekwondoTab = function () {
	if ($('.tkdTab').length === 0 && $('h1').text() === '우리는 태권도 전문가') return false;

	var listLI = $('.tkdTab > li');
	var contentDIV = $('div[id^="tabCont"]');

	listLI.removeClass('on');
	contentDIV.css('display', 'none');

	listLI.find('> a').on('click', function (e) {
		var target = $(e.currentTarget);
		var li = target.parent();
		var idx = li.index();

		listLI.removeClass('on');

		li.addClass('on');
		contentDIV.css('display', 'none').eq(idx).css('display', 'block');

		e.preventDefault();
	});

	listLI.find('a:first').triggerHandler('click');
};

/*태권도단 사진 게시판*/
var initTaekwondoBbs = function () {
	if ($('.photoBox').length === 0 && $('h1').text() === '태권도단 사진') return false;

	var listLI = $('.thumbList > ul > li');

	listLI.removeClass('on');
	
	listLI.find('> a').on('click', function (e) {
		var target = $(e.currentTarget);
		var li = target.parent();
		var idx = li.index();

		listLI.removeClass('on');

		li.addClass('on');

		if (taekwondoListClick !== undefined) taekwondoListClick(idx);

		e.preventDefault();
	});

	listLI.find('a:first').triggerHandler('click');
};


/*천연가스 실험실 동영상플레이어*/
var getMovieURL = function () {
    var title = StringUtil.setReplace($('h1').text(), ' ', '');
    var url;
    
    switch (title)
    {
        case '천연가스실험실' :
            url = '/resources/child/mov/Lab_LNG';
            break;
        case '청정에너지를찾아라' :
			url = '/resources/child/mov/earthtwin';
            break;
        case '천연가스를찾아서' :
            url = '/resources/child/mov/kogas_search';
            break;
        default :
    }
    
    return url;
};

var setWMV;

var initMovie = function () {	
	if ($('.flashArea').length === 0) return false;

	var movieDIV = $('.flashArea > .contBox > #flashTarget');
	movieDIV.empty();
	
	movieDIV.each(function (idx) {
		var url = getMovieURL();

		//video
		if (Modernizr.video) {
			$(this).html(
				'<video id="myVideo" width="550px" height="366px">' +
					'<source src="' + url + '.mp4' + '" type="video/mp4"></source>' +
					'<source src="' + url + '.ogg' + '" type="video/ogg"></source>' +
					'<source src="' + url + '.webm' + '" type="video/webm"></source>' +
				'</video>');
				
			$(this).find('> video').each(function () {
				var p = new player();
				p.init($(this));
			});
		} else {
			$(this).append('<div id="flashContent' + idx + '"></div>');

			var flashvars = {};
			flashvars.flv = url + '.flv';
			flashvars.id = idx;

			var params = {};
			params.menu = "false";
			params.wmode = "window";
			params.allowscriptaccess = "always";

			var attributes = {};
			attributes.id = "falshMovie" + idx;
			attributes.name = "falshMovie" + idx;

			swfobject.embedSWF("/resources/child/swf/player.swf", "flashContent" + idx, "550", "366", "9.0.0", "expressInstall.swf", flashvars, params, attributes);

			var controlDIV = $(this).parent().siblings('.control').data('idx', idx);
			var playBtnA = controlDIV.find('a:eq(0)');
			var pauseBtnA = controlDIV.find('a:eq(1)');

			//play
			playBtnA.on('click.flv', function (e) {
				var idx = $(this).closest('.control').data('idx');
				swfobject.getObjectById("falshMovie" + idx).setplay();
				
				e.preventDefault();
			});

			//pause
			pauseBtnA.on('click.flv', function (e) {
				var idx = $(this).closest('.control').data('idx');
				swfobject.getObjectById("falshMovie" + idx).setpause();
				
				e.preventDefault();
			});
		}
	});

	setWMV = function (id, path) {
		var idx = id;
		var url = StringUtil.setReplace(path, '.flv', '');
		var movieDIV = $('.flashArea > .contBox > #flashTarget');
		movieDIV.empty();

		var controlDIV = movieDIV.parent().siblings('.control');
		var playBtnA = controlDIV.find('a:eq(0)');
		var pauseBtnA = controlDIV.find('a:eq(1)');

		playBtnA.off('.flv');
		pauseBtnA.off('.flv');

		//play
		playBtnA.on('click', function (e) {
			var video = $(this).closest('.control').siblings('.contBox').find('> #flashTarget').children()
			video.get(0).play();
			
			e.preventDefault();
		});

		//pause
		pauseBtnA.on('click', function (e) {
			var video = $(this).closest('.control').siblings('.contBox').find('> #flashTarget').children()
			video.get(0).pause();

			e.preventDefault();
		});

		movieDIV.css('backgroundColor', 'black');
		movieDIV.html('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" width="550" height="366" vspace="0" hspace="0" align="top" id="WMVPlayer" style="left:0px; top:0px;">' + 
						  '<param name="FileName" value="' + url + '.wmv" />' +
						  '<param name="AllowChangeDisplaySize" value="true" />' +
						  '<param name="AllowScan" value="true" />' +
						  '<param name="AnimationAtStart" value="false" />' +
						  '<param name="AudioStream" value="-1" />' +
						  '<param name="AutoRewind" value="true" />' +
						  '<param name="AutoSize" value="false" />' +
						  '<param name="AutoStart" value="false" />' +
						  '<param name="Balance" value="0" />' +
						  '<param name="BufferingTime" value="5" />' +
						  '<param name="ClickToPlay" value="false" />' +
						  '<param name="CurrentMarker" value="0" />' +
						  '<param name="CurrentPosition" value="-1" />' +
						  '<param name="CursorType" value="0" />' +
						  '<param name="DisplayBackColor" value="16777215" />' +
						  '<param name="DisplayForeColor" value="16777215" />' +
						  '<param name="DisplayMode" value="0" />' +
						  '<param name="DisplaySize" value="1" />' +
						  '<param name="EnableContextMenu" value="true" />' +
						  '<param name="Enabled" value="true" />' +
						  '<param name="EnableFullScreenControls" value="true" />' +
						  '<param name="EnablePositionControls" value="true" />' +
						  '<param name="EnableTracker" value="false" />' +
						  '<param name="InvokeURLs" value="true" />' +
						  '<param name="Language" value="-1" />' +
						  '<param name="Mute" value="false" />' +
						  '<param name="PlayCount" value="0" />' +
						  '<param name="PreviewMode" value="false" />' +
						  '<param name="Rate" value="1" />' +
						  '<param name="SelectionEnd" value="-1" />' +
						  '<param name="SelectionStart" value="-1" />' +
						  '<param name="SendErrorEvents" value="true" />' +
						  '<param name="SendKeyboardEvents" value="true" />' +
						  '<param name="SendMouseClickEvents" value="true" />' +
						  '<param name="SendMouseMoveEvents" value="false" />' +
						  '<param name="SendOpenStateChangeEvents" value="true" />' +
						  '<param name="SendPlayStateChangeEvents" value="true" />' +
						  '<param name="SendWarningEvents" value="true" />' +
						  '<param name="ShowAudioControls" value="false" />' +
						  '<param name="ShowCaptioning" value="false" />' +
						  '<param name="ShowControls" value="false" />' +
						  '<param name="ShowDisplay" value="false" />' +
						  '<param name="ShowGotoBar" value="false" />' +
						  '<param name="ShowPositionControls" value="false" />' +
						  '<param name="ShowStatusBar" value="false" />' +
						  '<param name="ShowTracker" value="false" />' +
						  '<param name="TransparentAtStart" value="true" />' +
						  '<param name="VideoBorder3D" value="true" />' +
						  '<param name="VideoBorderColor" value="0" />' +
						  '<param name="VideoBorderWidth" value="0" />' +
						  '<param name="WindowlessVideo" value="true" />' +
						  '<param name="Volume" value="-300" />' +
					  '</object>');
	};
};

/*플레이어*/
var player = (function (){
	var wddoObj = function () {
		var video;
		var videoPlayer;

		function initEvent() {
			var controlDIV = video.closest('div.contBox').next();
			var playBtnA = controlDIV.find('a:eq(0)');
			var pauseBtnA = controlDIV.find('a:eq(1)');

			//play
			playBtnA.on('click', function (e) {
				playToggle(true);
				
				e.preventDefault();
			});

			//pause
			pauseBtnA.on('click', function (e) {
				playToggle(false);
				
				e.preventDefault();
			});
		} 
		
		function initVideo() {
			//load start
			video.on('loadeddata', function(e) {
				playToggle(false);
			});
			
			//load complete
			video.on('canplay', function(e) {
				playToggle(false);
			});
			
			//end
			video.on('ended', function(e) {
				playToggle(false);
			});

			//progress event handler
			video.on('timeupdate', function(e) {
				var data = videoPlayer.getDataCurrent();
			});
			
			video.on('loadedmetadata', function(e) {
				var data = videoPlayer.getDataTotal();
			});
			
			video.on('progress', function(e) {
				var buffer = videoPlayer.getBuffer();
			});
		}
		
		//play switch
		function playToggle(value) {
			if (value) {
				//play
				videoPlayer.setPlay();
			} else {
				//pause
				videoPlayer.setPause();
			}
		}

		//public
		this.init = function(value) {
			video = value;
			videoPlayer = new VideoPlayer();
			videoPlayer.init(video[0]);
			initEvent();
			initVideo();
		};
	};//end Obj

	return wddoObj;
}());



/* Modernizr 2.7.1 (Custom Build) | MIT & BSD
 * Build: http://modernizr.com/download/#-video
 */
;window.Modernizr=function(a,b,c){function t(a){i.cssText=a}function u(a,b){return t(prefixes.join(a+";")+(b||""))}function v(a,b){return typeof a===b}function w(a,b){return!!~(""+a).indexOf(b)}function x(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:v(f,"function")?f.bind(d||b):f}return!1}var d="2.7.1",e={},f=b.documentElement,g="modernizr",h=b.createElement(g),i=h.style,j,k={}.toString,l={},m={},n={},o=[],p=o.slice,q,r={}.hasOwnProperty,s;!v(r,"undefined")&&!v(r.call,"undefined")?s=function(a,b){return r.call(a,b)}:s=function(a,b){return b in a&&v(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=p.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(p.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(p.call(arguments)))};return e}),l.video=function(){var a=b.createElement("video"),c=!1;try{if(c=!!a.canPlayType)c=new Boolean(c),c.ogg=a.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),c.h264=a.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),c.webm=a.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,"")}catch(d){}return c};for(var y in l)s(l,y)&&(q=y.toLowerCase(),e[q]=l[y](),o.push((e[q]?"":"no-")+q));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)s(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof enableClasses!="undefined"&&enableClasses&&(f.className+=" "+(b?"":"no-")+a),e[a]=b}return e},t(""),h=j=null,e._version=d,e}(this,this.document);

/*!    SWFObject v2.3.20130521 <http://github.com/swfobject/swfobject>
    is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
*/
var swfobject=function(){var D="undefined",r="object",T="Shockwave Flash",Z="ShockwaveFlash.ShockwaveFlash",q="application/x-shockwave-flash",S="SWFObjectExprInst",x="onreadystatechange",Q=window,h=document,t=navigator,V=false,X=[],o=[],P=[],K=[],I,p,E,B,L=false,a=false,m,G,j=true,l=false,O=function(){var ad=typeof h.getElementById!=D&&typeof h.getElementsByTagName!=D&&typeof h.createElement!=D,ak=t.userAgent.toLowerCase(),ab=t.platform.toLowerCase(),ah=ab?/win/.test(ab):/win/.test(ak),af=ab?/mac/.test(ab):/mac/.test(ak),ai=/webkit/.test(ak)?parseFloat(ak.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,aa=t.appName==="Microsoft Internet Explorer",aj=[0,0,0],ae=null;if(typeof t.plugins!=D&&typeof t.plugins[T]==r){ae=t.plugins[T].description;if(ae&&(typeof t.mimeTypes!=D&&t.mimeTypes[q]&&t.mimeTypes[q].enabledPlugin)){V=true;aa=false;ae=ae.replace(/^.*\s+(\S+\s+\S+$)/,"$1");aj[0]=n(ae.replace(/^(.*)\..*$/,"$1"));aj[1]=n(ae.replace(/^.*\.(.*)\s.*$/,"$1"));aj[2]=/[a-zA-Z]/.test(ae)?n(ae.replace(/^.*[a-zA-Z]+(.*)$/,"$1")):0}}else{if(typeof Q.ActiveXObject!=D){try{var ag=new ActiveXObject(Z);if(ag){ae=ag.GetVariable("$version");if(ae){aa=true;ae=ae.split(" ")[1].split(",");aj=[n(ae[0]),n(ae[1]),n(ae[2])]}}}catch(ac){}}}return{w3:ad,pv:aj,wk:ai,ie:aa,win:ah,mac:af}}(),i=function(){if(!O.w3){return}if((typeof h.readyState!=D&&(h.readyState==="complete"||h.readyState==="interactive"))||(typeof h.readyState==D&&(h.getElementsByTagName("body")[0]||h.body))){f()}if(!L){if(typeof h.addEventListener!=D){h.addEventListener("DOMContentLoaded",f,false)}if(O.ie){h.attachEvent(x,function aa(){if(h.readyState=="complete"){h.detachEvent(x,aa);f()}});if(Q==top){(function ac(){if(L){return}try{h.documentElement.doScroll("left")}catch(ad){setTimeout(ac,0);return}f()}())}}if(O.wk){(function ab(){if(L){return}if(!/loaded|complete/.test(h.readyState)){setTimeout(ab,0);return}f()}())}}}();function f(){if(L||!document.getElementsByTagName("body")[0]){return}try{var ac,ad=C("span");ad.style.display="none";ac=h.getElementsByTagName("body")[0].appendChild(ad);ac.parentNode.removeChild(ac);ac=null;ad=null}catch(ae){return}L=true;var aa=X.length;for(var ab=0;ab<aa;ab++){X[ab]()}}function M(aa){if(L){aa()}else{X[X.length]=aa}}function s(ab){if(typeof Q.addEventListener!=D){Q.addEventListener("load",ab,false)}else{if(typeof h.addEventListener!=D){h.addEventListener("load",ab,false)}else{if(typeof Q.attachEvent!=D){g(Q,"onload",ab)}else{if(typeof Q.onload=="function"){var aa=Q.onload;Q.onload=function(){aa();ab()}}else{Q.onload=ab}}}}}function Y(){var aa=h.getElementsByTagName("body")[0];var ae=C(r);ae.setAttribute("style","visibility: hidden;");ae.setAttribute("type",q);var ad=aa.appendChild(ae);if(ad){var ac=0;(function ab(){if(typeof ad.GetVariable!=D){try{var ag=ad.GetVariable("$version");if(ag){ag=ag.split(" ")[1].split(",");O.pv=[n(ag[0]),n(ag[1]),n(ag[2])]}}catch(af){O.pv=[8,0,0]}}else{if(ac<10){ac++;setTimeout(ab,10);return}}aa.removeChild(ae);ad=null;H()}())}else{H()}}function H(){var aj=o.length;if(aj>0){for(var ai=0;ai<aj;ai++){var ab=o[ai].id;var ae=o[ai].callbackFn;var ad={success:false,id:ab};if(O.pv[0]>0){var ah=c(ab);if(ah){if(F(o[ai].swfVersion)&&!(O.wk&&O.wk<312)){w(ab,true);if(ae){ad.success=true;ad.ref=z(ab);ad.id=ab;ae(ad)}}else{if(o[ai].expressInstall&&A()){var al={};al.data=o[ai].expressInstall;al.width=ah.getAttribute("width")||"0";al.height=ah.getAttribute("height")||"0";if(ah.getAttribute("class")){al.styleclass=ah.getAttribute("class")}if(ah.getAttribute("align")){al.align=ah.getAttribute("align")}var ak={};var aa=ah.getElementsByTagName("param");var af=aa.length;for(var ag=0;ag<af;ag++){if(aa[ag].getAttribute("name").toLowerCase()!="movie"){ak[aa[ag].getAttribute("name")]=aa[ag].getAttribute("value")}}R(al,ak,ab,ae)}else{b(ah);if(ae){ae(ad)}}}}}else{w(ab,true);if(ae){var ac=z(ab);if(ac&&typeof ac.SetVariable!=D){ad.success=true;ad.ref=ac;ad.id=ac.id}ae(ad)}}}}}X[0]=function(){if(V){Y()}else{H()}};function z(ac){var aa=null,ab=c(ac);if(ab&&ab.nodeName.toUpperCase()==="OBJECT"){if(typeof ab.SetVariable!==D){aa=ab}else{aa=ab.getElementsByTagName(r)[0]||ab}}return aa}function A(){return !a&&F("6.0.65")&&(O.win||O.mac)&&!(O.wk&&O.wk<312)}function R(ad,ae,aa,ac){var ah=c(aa);aa=W(aa);a=true;E=ac||null;B={success:false,id:aa};if(ah){if(ah.nodeName.toUpperCase()=="OBJECT"){I=J(ah);p=null}else{I=ah;p=aa}ad.id=S;if(typeof ad.width==D||(!/%$/.test(ad.width)&&n(ad.width)<310)){ad.width="310"}if(typeof ad.height==D||(!/%$/.test(ad.height)&&n(ad.height)<137)){ad.height="137"}var ag=O.ie?"ActiveX":"PlugIn",af="MMredirectURL="+encodeURIComponent(Q.location.toString().replace(/&/g,"%26"))+"&MMplayerType="+ag+"&MMdoctitle="+encodeURIComponent(h.title.slice(0,47)+" - Flash Player Installation");if(typeof ae.flashvars!=D){ae.flashvars+="&"+af}else{ae.flashvars=af}if(O.ie&&ah.readyState!=4){var ab=C("div");
aa+="SWFObjectNew";ab.setAttribute("id",aa);ah.parentNode.insertBefore(ab,ah);ah.style.display="none";y(ah)}u(ad,ae,aa)}}function b(ab){if(O.ie&&ab.readyState!=4){ab.style.display="none";var aa=C("div");ab.parentNode.insertBefore(aa,ab);aa.parentNode.replaceChild(J(ab),aa);y(ab)}else{ab.parentNode.replaceChild(J(ab),ab)}}function J(af){var ae=C("div");if(O.win&&O.ie){ae.innerHTML=af.innerHTML}else{var ab=af.getElementsByTagName(r)[0];if(ab){var ag=ab.childNodes;if(ag){var aa=ag.length;for(var ad=0;ad<aa;ad++){if(!(ag[ad].nodeType==1&&ag[ad].nodeName=="PARAM")&&!(ag[ad].nodeType==8)){ae.appendChild(ag[ad].cloneNode(true))}}}}}return ae}function k(aa,ab){var ac=C("div");ac.innerHTML="<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'><param name='movie' value='"+aa+"'>"+ab+"</object>";return ac.firstChild}function u(ai,ag,ab){var aa,ad=c(ab);ab=W(ab);if(O.wk&&O.wk<312){return aa}if(ad){var ac=(O.ie)?C("div"):C(r),af,ah,ae;if(typeof ai.id==D){ai.id=ab}for(ae in ag){if(ag.hasOwnProperty(ae)&&ae.toLowerCase()!=="movie"){e(ac,ae,ag[ae])}}if(O.ie){ac=k(ai.data,ac.innerHTML)}for(af in ai){if(ai.hasOwnProperty(af)){ah=af.toLowerCase();if(ah==="styleclass"){ac.setAttribute("class",ai[af])}else{if(ah!=="classid"&&ah!=="data"){ac.setAttribute(af,ai[af])}}}}if(O.ie){P[P.length]=ai.id}else{ac.setAttribute("type",q);ac.setAttribute("data",ai.data)}ad.parentNode.replaceChild(ac,ad);aa=ac}return aa}function e(ac,aa,ab){var ad=C("param");ad.setAttribute("name",aa);ad.setAttribute("value",ab);ac.appendChild(ad)}function y(ac){var ab=c(ac);if(ab&&ab.nodeName.toUpperCase()=="OBJECT"){if(O.ie){ab.style.display="none";(function aa(){if(ab.readyState==4){for(var ad in ab){if(typeof ab[ad]=="function"){ab[ad]=null}}ab.parentNode.removeChild(ab)}else{setTimeout(aa,10)}}())}else{ab.parentNode.removeChild(ab)}}}function U(aa){return(aa&&aa.nodeType&&aa.nodeType===1)}function W(aa){return(U(aa))?aa.id:aa}function c(ac){if(U(ac)){return ac}var aa=null;try{aa=h.getElementById(ac)}catch(ab){}return aa}function C(aa){return h.createElement(aa)}function n(aa){return parseInt(aa,10)}function g(ac,aa,ab){ac.attachEvent(aa,ab);K[K.length]=[ac,aa,ab]}function F(ac){ac+="";var ab=O.pv,aa=ac.split(".");aa[0]=n(aa[0]);aa[1]=n(aa[1])||0;aa[2]=n(aa[2])||0;return(ab[0]>aa[0]||(ab[0]==aa[0]&&ab[1]>aa[1])||(ab[0]==aa[0]&&ab[1]==aa[1]&&ab[2]>=aa[2]))?true:false}function v(af,ab,ag,ae){var ad=h.getElementsByTagName("head")[0];if(!ad){return}var aa=(typeof ag=="string")?ag:"screen";if(ae){m=null;G=null}if(!m||G!=aa){var ac=C("style");ac.setAttribute("type","text/css");ac.setAttribute("media",aa);m=ad.appendChild(ac);if(O.ie&&typeof h.styleSheets!=D&&h.styleSheets.length>0){m=h.styleSheets[h.styleSheets.length-1]}G=aa}if(m){if(typeof m.addRule!=D){m.addRule(af,ab)}else{if(typeof h.createTextNode!=D){m.appendChild(h.createTextNode(af+" {"+ab+"}"))}}}}function w(ad,aa){if(!j){return}var ab=aa?"visible":"hidden",ac=c(ad);if(L&&ac){ac.style.visibility=ab}else{if(typeof ad==="string"){v("#"+ad,"visibility:"+ab)}}}function N(ab){var ac=/[\\\"<>\.;]/;var aa=ac.exec(ab)!=null;return aa&&typeof encodeURIComponent!=D?encodeURIComponent(ab):ab}var d=function(){if(O.ie){window.attachEvent("onunload",function(){var af=K.length;for(var ae=0;ae<af;ae++){K[ae][0].detachEvent(K[ae][1],K[ae][2])}var ac=P.length;for(var ad=0;ad<ac;ad++){y(P[ad])}for(var ab in O){O[ab]=null}O=null;for(var aa in swfobject){swfobject[aa]=null}swfobject=null})}}();return{registerObject:function(ae,aa,ad,ac){if(O.w3&&ae&&aa){var ab={};ab.id=ae;ab.swfVersion=aa;ab.expressInstall=ad;ab.callbackFn=ac;o[o.length]=ab;w(ae,false)}else{if(ac){ac({success:false,id:ae})}}},getObjectById:function(aa){if(O.w3){return z(aa)}},embedSWF:function(af,al,ai,ak,ab,ae,ad,ah,aj,ag){var ac=W(al),aa={success:false,id:ac};if(O.w3&&!(O.wk&&O.wk<312)&&af&&al&&ai&&ak&&ab){w(ac,false);M(function(){ai+="";ak+="";var an={};if(aj&&typeof aj===r){for(var aq in aj){an[aq]=aj[aq]}}an.data=af;an.width=ai;an.height=ak;var ar={};if(ah&&typeof ah===r){for(var ao in ah){ar[ao]=ah[ao]}}if(ad&&typeof ad===r){for(var am in ad){if(ad.hasOwnProperty(am)){var ap=(l)?encodeURIComponent(am):am,at=(l)?encodeURIComponent(ad[am]):ad[am];if(typeof ar.flashvars!=D){ar.flashvars+="&"+ap+"="+at}else{ar.flashvars=ap+"="+at}}}}if(F(ab)){var au=u(an,ar,al);if(an.id==ac){w(ac,true)}aa.success=true;aa.ref=au;aa.id=au.id}else{if(ae&&A()){an.data=ae;R(an,ar,al,ag);return}else{w(ac,true)}}if(ag){ag(aa)}})}else{if(ag){ag(aa)}}},switchOffAutoHideShow:function(){j=false},enableUriEncoding:function(aa){l=(typeof aa===D)?true:aa},ua:O,getFlashPlayerVersion:function(){return{major:O.pv[0],minor:O.pv[1],release:O.pv[2]}},hasFlashPlayerVersion:F,createSWF:function(ac,ab,aa){if(O.w3){return u(ac,ab,aa)}else{return undefined}},showExpressInstall:function(ac,ad,aa,ab){if(O.w3&&A()){R(ac,ad,aa,ab)}},removeSWF:function(aa){if(O.w3){y(aa)}},createCSS:function(ad,ac,ab,aa){if(O.w3){v(ad,ac,ab,aa)}},addDomLoadEvent:M,addLoadEvent:s,getQueryParamValue:function(ad){var ac=h.location.search||h.location.hash;
if(ac){if(/\?/.test(ac)){ac=ac.split("?")[1]}if(ad==null){return N(ac)}var ab=ac.split("&");for(var aa=0;aa<ab.length;aa++){if(ab[aa].substring(0,ab[aa].indexOf("="))==ad){return N(ab[aa].substring((ab[aa].indexOf("=")+1)))}}}return""},expressInstallCallback:function(){if(a){var aa=c(S);if(aa&&I){aa.parentNode.replaceChild(I,aa);if(p){w(p,true);if(O.ie){I.style.display="block"}}if(E){E(B)}}a=false}},version:"2.3"}}();