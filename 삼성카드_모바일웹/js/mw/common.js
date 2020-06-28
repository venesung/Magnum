var rightMenuOpenFlag = false;
var menuXML;
var externalMenu;
var isTablet = (document.documentElement.clientWidth>=768) ? true : false;
var isApple = navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i);
var documentWidth = document.documentElement.clientWidth;
var documentHeight = document.documentElement.clientHeight;
var rightMenuPosArr = [];
var agent = window.navigator.userAgent;
var fixed = true, isApple = false, istouch = false, rightMenuiScroll, vers;

//페이지 뒤로가기시 전체메뉴 닫기
window.addEventListener("pagehide",function(){
	if(rightMenuOpenFlag != false){
		$("#wrap").css({"height":"100%","overflow":""});
		TweenMax.to($(".total"), 0, {x:documentWidth} );
		$("#rightMenu").css ( { display:"none" } );	
		$("body").css({"overflow":""});	
		$(".totladim").css({opacity:0.8});
		$(".total a").attr("tabIndex",-1);
		rightMenuOpenFlag = false;
		}
},false);

$(function(){
	setTimeout(function(){window.scrollTo(0,1);},300);
} );

$(document).ready(function() {
	
	$("#wrap").after ( "<div id='rightMenu'></div>");

	if ( externalMenu > 0){
		$("#header2").load ( "../shared/header" + externalMenu + ".html"  );	
		$("#footer2").load ( "../shared/footer2.html" );
	}else{
		loadMenuJsonData();
		$("#footer").load ( "../shared/footer.html" );
	}

	$(".pre_pop a").click ( function()	{
		Popup.Open ( $(".pre_popview") );
	} );
	
	if ( /android/i.test(agent) ) {
	    vers = agent.match(/android\s([0-9\.]+)\;/i);
	     if ( vers.length > 0 ) {
	          if ( vers[1] ) {
	          	  if ( parseFloat(vers[1],10) < 4 ) {
	                    fixed = false;
	               };
	          };
	     };
	 	$("head").append('<link rel="shortcut icon" href="../images/mw/v2.0/QRicon_114x114.png">');
	 	$("head").append('<link rel="apple-touch-icon-precomposed" href="../images/mw/v2.0/QRicon_114x114.png">');
	}else{
		$("head").append('<link rel="apple-touch-icon" href="../images/mw/v2.0/iphone_128x128.png">');
	};
	
	topBtnControl();
	quickMenu();
	grayBox();
} );

function grayBox(){
	if($('.boxGray')< 1){ return;}
	$(window).on("scroll" , onScroll).scroll();	
	
	function onScroll(){
		var top = $(window).scrollTop();
		if ( top < 92 ){
			$('.boxGray').removeClass('fixBlack');
			$('.boxGray').css({"top":"","position":""});
		}else{
			$('.boxGray').addClass('fixBlack');
		}
		
		if ( !fixed ) {
		    $('.fixBlack').css({position : 'absolute'});
		    var fixPosition = $(document).scrollTop();
		    $(".fixBlack").css({'top' : fixPosition + 'px'});
		};
	}
}

function quickMenu(){	
	$(".quick > a").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		if($(this).parent().hasClass("on")){
			$(this).parent().removeClass("on");	
			$(this).text("퀵메뉴 열림");
		}else{
			$(this).parent().addClass("on");
			$(this).text("퀵메뉴 닫힘");
			$(".quick").before( "<div id='dimmed'></div>");
			$("#dimmed").css({"height":"100%","width":"100%","position":"absolute","top":0,"left":0,"display":"block","z-index":14});
			$("#dimmed").on("touchstart click", function(e){
				e.stopPropagation();
				e.preventDefault();
				$(".quick > a").parent().removeClass("on");	
				$(".quick > a").text("퀵메뉴 열림");
				setTimeout( function(){
					$("#dimmed").remove();
					$("#dimmed").off();
				}, 500);
			});
		}		
	});
	
	if(vers){
		if ( !fixed ) {
			var landscape = false;
			orientCheck();		
			
			$(window).scroll(function(e){				
				qucikPos();
			});
			
			$(window).on("orientationchange" ,function(e){
				orientCheck();			
			 });	
		}
	}
	
	function orientCheck(){
		 if(window.orientation ==  90 || window.orientation == -90){
			 landscape = true;			 
			 qucikPos();		
			 qucikScroll();
		 }else{
			 landscape = false;		
			 qucikPos();	
			 if(target != undefined){
				 qucikScrollDestroy();	 
			 }
		 }
	}
	
	function qucikPos(){
		 $(".quick").css({position : "absolute"});
	     $(".quick > a").css({"top":"0"});
	     if(landscape){		    	
	    	 $(".quickscroll").css({"position":""});		    	 	    	 		    			    		 	    	 		    	
	    	 $(".quickcon").css({"bottom":"190px"});
	    	
	     }else{
	    	 $(".quickscroll").css("position","absolute");		    	 	
	    	 $(".quickcon").css({"bottom":"310px"});
	     }
	    var quickHeight = $(".quick > a").height() + 10;
	    var fixPosition = $(window).height() - quickHeight + $(document).scrollTop();
	    $(".quick").css({'top' : fixPosition + 'px'});	   
	}
	
	var  target =  $(".quickscroll ul");
	function qucikScroll()	{
		var sy, conY, disY;
	    target.css({"position":"absolute"});
		target.bind("touchstart", qucikTouchstart);
	}
	 
	 function qucikTouchstart(e){
			e.stopPropagation();
			sy = e.originalEvent.touches[0].pageY;
			conY = parseInt (target.position().top );
			target.bind("touchmove", qucikTouchmove).bind("touchend", qucikTouchend );
	}
	
	function qucikTouchmove(e){
		e.stopPropagation();	
		e.preventDefault();
		disY = sy - e.originalEvent.touches[0].pageY;
		var targetTop = conY - disY;
		var currentTop = target.position().top;
		if(targetTop > 0){
			target.stop().css ( { top:0 });		
			return;
		}else if(targetTop < -122) {
			target.stop().css ( { top:-122 });
			return;
		}
		target.stop().css ( { top:targetTop});			
	}
	
	function qucikTouchend(e){
		target.unbind("touchmove", qucikTouchmove).unbind("touchend" , qucikTouchend);
		e.stopPropagation();
	}				
	
	function qucikScrollDestroy(){
		target.stop().css ( { top:0});	
		target.unbind("touchstart", qucikTouchstart).unbind("touchmove", qucikTouchmove).unbind("touchend" , qucikTouchend);
	}
}

function loadMenuJsonData(){
	$.ajax ( { url:"../xml/menu.json" , type:"get" , dataType:"json", success:subMenuLoadOk });
	
	function subMenuLoadOk( _xml )	{
		isJosn = true;
		menuXML = _xml.data.item;
		
		$("#header").load ( "../shared/header.html");	
		rightMenuInit();
	}
}

function rightMenuInit(){
	RightMenu.init();
	$(".totladim").css({"display":"none",opacity:0.8});		
	$(window).resize(rightMenuResize);
	rightMenuResize();
	$(".total_top").css({"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});
	$(".total_close").css({"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});
	$("#rightMenu").css({display:"block" , "z-index":10 ,"width":0, "overflow":"hidden"});
	$(".total").css({'transition' : 'all 0s ease-in-out','transform' : 'translateX('+documentWidth+'px)'});
	$(".totalwrap").css({"width":documentWidth});
	$(".total a").attr("tabIndex",-1);
}

var tapFocus = false;
function rightMenuOpen(){
	if (rightMenuOpenFlag == false){
		if($("*:focus").length > 0){
			tapFocus  = true;
			focusedElementBeforeModal = jQuery(':focus');
			var obj =$(".totalwrap");
			var o = obj.find('*');
			obj.keydown(function(event){trapTabKey($(this),event);});
			obj.keydown(function(event){trapEscapeKey($(this),event);});
			$(".totalwrap .total a").keydown(function(event){trapSpaceKey($(this),event);});
			if(usingWebKit()){
				obj.focus();
			} else {
				o.filter(focusableElementsString).filter(':visible').first().focus();
			}
			$(".total_close").focus();
		}

		documentHeight = document.documentElement.clientHeight;	
		documentWidth = document.documentElement.clientWidth;
		
		$(".util_right").css("display","none");
		$("#rightMenu").css({display:"block" , "z-index":10 ,"width":documentWidth, "overflow":"hidden"});
		$(".totalwrap").css({"width":documentWidth});
		$("#wrap").css({"height":documentHeight-1, "overflow":"hidden"});
		$(".totladim").fadeIn(100,function(){
			$('.total').css({'transition' : 'all 0.3s ease-in-out','transform' : 'translateX(0px)'});
			$(".total").bind("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend", function(){ rightMenuMotionEnd();	});	
			$(".total a").attr("tabIndex","");	
			$(".total_close").css("display","block");
		});

		if(istouch == false){
			if ( vers !=  undefined ) {
				if(tapFocus){
					rightMenuiScroll = new IScroll('.total_submn', {bounce:false});	
				}else{
					rightMenuiScroll = new IScroll('.total_submn', {bounce:false,click:true,disableMouse: true});	
				}
		         
		     }else{
		    	 if(tapFocus){
					 rightMenuiScroll = new IScroll('.total_submn', {bounce:false,click:true});
		    	 }else{
		    		 rightMenuiScroll = new IScroll('.total_submn', {bounce:false,click:true});	 
		    	 }
		     }
			istouch = true;
		}
		rightMenuPosReset();
		rightMenuScroll();
		
		function rightMenuMotionEnd ( e ){	
			$(".util_right").css("display","block");
			$("#wrap").css({"overflow":"hidden"});
			$(".total").unbind("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend");
			rightMenuOpenFlag = true;
			if(tapFocus && vers ==  undefined){
				$("#wrap").css("display","none");
				$(".total_login").focus();
			}
		}		
	}else{
		if(tapFocus && vers ==  undefined){
			$("#wrap").css("display","block");
		}
		$("#wrap").css({"height":"100%","overflow":""});
		$(".totladim").fadeOut(100,function(){
			$('.total').css({'transition' : 'all 0.3s ease-in-out','transform' : 'translateX('+documentWidth+'px)'});
			$(".total").bind("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend", function(){ menuOpenEnd();	});	
		});
	}
	
	function menuOpenEnd(){
		$(".total").unbind("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend");
		$("#rightMenu").css({display:"block" , "z-index":10 ,"width":0, "overflow":"hidden"});
		$(".total a").attr("tabIndex",-1);
		rightMenuOpenFlag = false;
		if(tapFocus){
			focusedElementBeforeModal.focus();
			focusedElementBeforeModal = null;
		}
	}
}

function rightMenuResize(){			
	documentWidth = document.documentElement.clientWidth;
	documentHeight = document.documentElement.clientHeight;		
	if ( rightMenuOpenFlag != false){
		$("#wrap").css({"height":documentHeight});
		$("#rightMenu").css ({"width":documentWidth});
		$(".totalwrap").css({"width":documentWidth});
		if(rightMenuiScroll){
			rightMenuiScroll.refresh();	
		}
	}else{				
		$("#wrap").css({"height":"100%"});
		$("#rightMenu").css ({"width":0});
	}
}

function rightMenuScroll(){		
	if (over1 !== undefined && over1 !== 0){
		if(over1 == 1){
			rightMenuiScroll.scrollTo(0,-(over2*47),0);
		}else{
			rightMenuiScroll.scrollTo(0,-(rightMenuPosArr[over1 -2]+30+(over2*47)),0);
		}
		rightMenuiScroll.refresh();	
	}		

	function posCheck(){
		var scrollTop = rightMenuiScroll.y *-1;
	 	$("ul.total_mn > li > a").removeClass("on");
		for (var i=0; i < rightMenuPosArr.length; i++ ){
			if(i == 0){
				if(between(scrollTop,0, rightMenuPosArr[i])){
					$("ul.total_mn > li:eq("+(i+1)+") > a").addClass("on");
				}
			}else{
				if(between(scrollTop, rightMenuPosArr[i-1], rightMenuPosArr[i])){
					$("ul.total_mn > li:eq("+(i+1)+") > a").addClass("on");
				}
			}
		}
	}
		
	function between(x, min, max) {
	  return x >= min && x < max;
	}
	
	posCheck();
	if(rightMenuiScroll._events["scroll"] == null || rightMenuiScroll._events["scroll"] == undefined){
		rightMenuiScroll.on("scrollEnd", function(e){		
			posCheck();
		});
	}	
}


function rightMenuPosReset(){
	var mpos = $(".total_submn .subcon dl");
	rightMenuPosArr=[];
	$.each (mpos, function ( i ){
		if(i == 0){
			rightMenuPosArr.push($(mpos[i]).height()+7);
		}else{
			rightMenuPosArr.push(rightMenuPosArr[i-1] + $(mpos[i]).height() + 36);
		}
	});
	var last = mpos.length -2;
	$(".lastdl").height(documentHeight - ($(".subcon dl:eq("+last+")").height()+122) );
	if(rightMenuiScroll){
		rightMenuiScroll.refresh();	
	}	
}

var focusableElementsString ="a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]";
var focusedElementBeforeModal;
function usingWebKit(){
	var ua = navigator.userAgent.toLowerCase(); 
	if (ua.indexOf('safari')!=-1){ 
		if(ua.indexOf('chrome')  > -1){
			return true; 
		}else{
			return true; 
		}
	} else {
		return false;
	}
}

function trapSpaceKey(obj,evt) {
	if ( evt.which == 32 ) {
		evt.preventDefault();
	}	
}

function trapEscapeKey(obj,evt) {
	if ( evt.which == 27 ) {
		var o = obj.find('*');
		var cancelElement;
		cancelElement = o.filter("#cancel");
		cancelElement.click();
		evt.preventDefault();
	}	
}

function trapTabKey(obj,evt) {
	if ( evt.which == 9 ) {
		var o = obj.find('*');
		var focusableItems;
		focusableItems = o.filter(focusableElementsString).filter(':visible');
		var focusedItem;
		focusedItem = jQuery(':focus');
		var numberOfFocusableItems;
		numberOfFocusableItems = focusableItems.length;
		var focusedItemIndex;
		focusedItemIndex = focusableItems.index(focusedItem);
		if (evt.shiftKey) {
			if(focusedItemIndex==0){
				focusableItems.get(numberOfFocusableItems-1).focus();
				evt.preventDefault();
			}
		} else {
			if(focusedItemIndex==numberOfFocusableItems-1){
				focusableItems.get(0).focus();
				evt.preventDefault();				
			}
		}
	}
}

// Layer Show/Hide
// strTabName : 탭이름 ex)tab_1
// strBlockName : 블록 이름 ex)layer_1
// strTotal : 총 블록 갯수
// strSelBlockNum : 선택된 블록 번호

function SHBlock(strTabName, strBlockName, strTotal, strSelBlockNum) {
			$('#allView').show(); //추가
           for(i=1;i<strTotal+1;i++) {
                     document.getElementById(strTabName+ "_" + i).className = "";
                     document.getElementById(strBlockName+ "_" + i).style.display = "none";
           }
                     
           document.getElementById(strTabName+ "_" + strSelBlockNum).className = "selected"; // class 명
           document.getElementById(strBlockName + "_" + strSelBlockNum).style.display = "block";          
}



var Popup = 
{
	callBack : null,
	
	Open : function ( con, callBack )
	{
		var modalDiv = '<div class="modalBg"></div>';
		$("body").append ( modalDiv );
		var h1 = $("#wrap").height();
		var h2 = $(window).height();
		var h3 = h1>h2 ? h1 : h2;
		$(".modalBg").css ( { height:h3 } );

		con.find(".btnClose").bind ( "click" , function ()
		{
			Popup.Close();
		} );

		var top = $(window).scrollTop();
		var w = $(window).width();
		var h1 = $(window).height();
		var h2 = con.height();
		var t = top + h1/2 - h2/2;
		if ( t < 0 ) t = 0;
		con.removeClass("modalContainer").addClass("modalContainer" ).css ( { position:"absolute" , left:-w , display:"block" , top:t , opacity:0 } );
		con.stop().animate ( { opacity:1 , left:0 }  ,function(){
			if($("*:focus").length > 0){
				tapFocus  = true;
				focusedElementBeforeModal = jQuery(':focus');
				var obj =$(".modalContainer");
				var o = obj.find('*');
				obj.keydown(function(event){trapTabKey($(this),event);});
				obj.keydown(function(event){trapEscapeKey($(this),event);});
				$(".modalContainer .btnClose").keydown(function(event){trapSpaceKey($(this),event);});
				o.filter(focusableElementsString).filter(':visible').first().focus();
			}
		});

		$("html").addClass ( "htmlHighlightOff" );
		
		if (typeof callBack === "function") {
			Popup.callBack = callBack;
		}
		
	}
	,
	OpenIframe : function ( con )
	{
		/*
		var modalDiv = '<div class="modalBg"></div>';
		$("body").append ( modalDiv );
		con.find(".btnClose").bind ( "click" , function ()
		{
			Popup.Close();
		} );

		var top = $(window).scrollTop();
		var w = $(window).width();
		var h1 = $(window).height();
		var h2 = con.height();
		var t = top + h1/2 - h2/2;
		if ( t < 0 ) t = 0;
		con.removeClass("modalContainer").addClass("modalContainer" ).css ( { position:"absolute" , left:-w , display:"block" , top:t , opacity:0 } );
		con.stop().animate ( { opacity:1 , left:0 }  );
		*/
	}
	,
	Close : function()
	{
		var w = $(window).width();
		$(".modalContainer .btnClose").unbind ( "click" );
		$(".modalContainer").stop().animate ( { left:-w , opacity:0 } , closeComplete );
		function closeComplete()
		{
			$(".modalContainer").css ( { display:"none" } );
			$(".modalBg").css ( { display:"none" } ).remove();
			if(focusedElementBeforeModal){
				focusedElementBeforeModal.focus();
				focusedElementBeforeModal = null;
			}
		}
		$("html").removeClass ( "htmlHighlightOff" );
		
		if (Popup.callBack !== null) {
			if (typeof Popup.callBack === "function") {
				Popup.callBack();
				Popup.callBack = null;
			}
		}
	},
	Position : function( con ) { // 동적 컨텐츠에 대한 팝업 포지션 재조정 (김희중 추가, 2013.09.17)
		var top = $(window).scrollTop();
		var h1 = $(window).height();
		var h2 = con.height();
		var t = top + h1/2 - h2/2;
		if ( t < 0 ) t = 0;
		con.css ( { top:t } );
	}
};

//무통장입금안내 <select> XML 로드
var Account = {
    loadXML : function (path, options)
    {
        var opts = options;
        
        $.ajax ( { url: path , type:"get" , success:loadComplete });
        
        function loadComplete( _xml )
        {
            var item = $(_xml).find('data > item');

            Account.initLayout(item, opts.container);
        }
    },
    
    initLayout : function (item, cont)
    {
        var select = cont.find('.roundPad > select');
        select.empty();
        
        var content = cont.find('.bgGray > .formType > tbody td');

        //init
        item.each(function (idx)
        {
            select.append('<option>' + item.eq(idx).find('bank').text() + '</option>');
        });
        
        //event
        select.on('change', function (e)
        {
            var target = $(e.currentTarget);
            var selectIdx = target[0].selectedIndex;
            var txt;
            
            content.each(function (idx)
            {
                txt = item.eq(selectIdx).children().eq(idx+1).text();
                
                $(this).text(txt);
            });
            
            // content.eq(0).text( item.eq(selectIdx).find('number').text() );
            // content.eq(1).text( item.eq(selectIdx).find('card').text() );
            // content.eq(2).text( item.eq(selectIdx).find('commission').text() );
            // content.eq(3).text( item.eq(selectIdx).find('state').text() );
        });
        
        select.trigger('change');
    }
};

//탑버튼 컨트롤
function topBtnControl(rangeElement) 
{
	//	$(document).on("scroll", onScroll);
	// var target = ($(".outBoxMainHome").length > 0) ? $(".mainBlock").eq(0) : $(".roundBox");
	$(window).on ( "scroll" , onScroll ).scroll();
	
	function onScroll()
	{
		
		var top = $(window).scrollTop();
		
		if ( top > 130 )
		{
			$('.top').css('display', 'block');
		}
		else
		{
			$('.top').css('display', 'none');
		}
		
		if ( !fixed ) {
		    $('.top').css({position : 'absolute'});
		    var topHeight = $(".top").height() + 10;
		    var fixPosition =$(document).height() - $(window).height() - $(document).scrollTop();
		    $(".top").css({'bottom' : fixPosition + 'px'});
		};
	}
};

// 명세서토글
$(function()
{
	var isTablet = false;
	$(window).resize ( resizeFn ).resize();
	init();

	function resizeFn ( e )
	{
		//isTablet = (document.documentElement.clientWidth>=768) ? true : false;
		foldingSet();
		
	}

	function init()
	{
		$(".foldingTable dt").click ( clickFoldingTable );

		function clickFoldingTable ( e )
		{
			e.stopPropagation();
			e.preventDefault();
			if ( isTablet ) return;

			var state = $(this).parent().parent().attr ( "isOpen" );
			state = state == "on" ? "off" : "on";
			$(this).parent().parent().attr ( "isOpen" , state );
			foldingSet();
		}
	}

	function foldingSet()
	{
		$(".foldingTable").each ( function ( i )
		{
			var tar = $(this).find("dd");
			var tar2 = $(this).find("dl");
			var state = $(this).attr ( "isOpen" );
			if ( isTablet ) state = "on";
			if ( state == "on" )
			{
				tar.css ( { display:"block" } );
				tar2.addClass ( "on" );
			}
			else
			{
				tar.css ( { display:"none" } );
				tar2.removeClass ( "on" );
			}
		} );
	}
} );


$(function()
{
	var isTablet;
	$(window).resize ( resizeFn ).resize();
	init();

	function resizeFn ( e )
	{
		isTablet = (document.documentElement.clientWidth>=768) ? true : false;
		foldingTable();
	}

	function init()
	{
		$(".foldingTable2 a").click ( clickFoldingTable );

		function clickFoldingTable ( e )
		{
			e.stopPropagation();
			e.preventDefault();
			if ( isTablet ) return;

			var state = $(this).parent().attr ( "isOpen" );
			state = state == "on" ? "off" : "on";
			$(this).parent().attr ( "isOpen" , state );
			foldingTable();
		}
	}

	function foldingTable()
	{
		$(".foldingTable2").each ( function ( i )
		{
			
			var tar = $(this).find(".tableWrap");
//			var tar2 = $(this).find("dl");
			var tar2 = $(this);
			var state = $(this).attr ( "isOpen" );
			if ( isTablet ) state = "on";
			if ( state == "on" )
			{
				tar.css ( { display:"block" } );
				tar.parent().addClass ( "on" );
			}
			else
			{
				tar.css ( { display:"none" } );
				tar.parent().removeClass ( "on" );
			}
		} );
	}
} );
