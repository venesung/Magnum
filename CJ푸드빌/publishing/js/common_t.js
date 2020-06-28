/**
* @projectDescription CJ푸드빌 Template 모바일 웹사이트 리뉴얼.
*
* @since 2014.08.04 zt common_t.js (gnb, popup, tab, swipebanner, resize section...) 
* @last  2014.09.30 ns 
* @version 1.2.0
*/
var depth1 = 0, depth2 = 0, depth3 = 0; //gnb depth focus
var current_title = "";
"use strict";
$(document).ready(function() {
	// 현재 사이트 <title>
	current_title = $("title").text(); 

	//gnb 초기화
	if($(".totalwrap").length){
		Gnb.Init();
		Footer.init(); //footer 초기화
	}

	//탭메뉴 초기화
	if($(".tabList").length){
		var tab = new tabView(".tabList",".tabContent");  
		tab.Init();
	}

	//3뎁스메뉴 
	if($(".location a.topLoct").length){
		setDepthMenu();
	}
	
	//section 높이값설정 footer하단고정
	$(window).resize(resizeSection).resize();

	//페이지 뒤로가기시 전체메뉴 닫기
	window.addEventListener("pagehide",function(){if(Gnb.isOpen){ Gnb.Close(0);}},false);
}); // document.ready();

/**
 * @mobile device check
 * var andVersion = isMobile.AndroidVers(); 
 *  
 */
var isMobile = { 
    Android: function() { return navigator.userAgent.match(/Android/i); },
    BlackBerry: function() { return navigator.userAgent.match(/BlackBerry/i); }, 
    iOS: function() { return navigator.userAgent.match(/iPhone|iPad|iPod/i); }, 
    Opera: function() { return navigator.userAgent.match(/Opera Mini/i); }, 
    Windows: function() { return navigator.userAgent.match(/IEMobile/i); }, 
    any: function() { return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows()); },
    AndroidVers: function() {
        if(isMobile.Android()){
          var vers = navigator.userAgent.match(/android\s([0-9\.]+)\;/i);
          if (vers[1]){return parseFloat(vers[1],10);}}else{return 0;} 
    }
};

/**
 * @addLoadEvent
 * duplicate window.onload 방지 window.onload 대상 addLoadEvent(func)로 사용
 */
function addLoadEvent(func){
	var oldonload = window.onload;
	if(typeof window.onload != 'function'){
		window.onload = func;
	}else{
		window.onload = function(){
			oldonload();
			func();
		};
	}
}

/**
 * @URLShare
 *  URL 링크 복사
 */
function URLShare(trb) {
	var IE=(document.all)?true:false;
	if (IE) {
		window.clipboardData.setData("Text", trb);
		alert("URL이 복사되었습니다.");
	} else {
		temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", trb);
	}
}

/**
 * @facebookShare
 *  페이스북 공유
 */
function facebookShare(url,title){
    var u = url,   t = title;
    window.open('http://m.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');
}


/**
 * @kakaoShare
 * 카카오톡 공유
 */
function kakaoShare(labelText, buttonText, imgsrc, link){ 
   //Kakao.init('25782cba9fcc9ef66c4291833d994ad9');
   //Kakao.init(siteOfkakaoApiKeys);
   //kakaoSetLink("카카오링크 샘플에 오신 것을 환영합니다", "빕스 BI 바로가기", "http://mvint.magnumvint.com:8981/publishing/images/vips/img_menu01.jpg","http://mvint.magnumvint.com:8981/publishing/html/vips/about_steak02_pop.html");
   //function kakaoSetLink(labelText, buttonText, src, link, ){
	   if (imgsrc == null || imgsrc == "")
	   {
         Kakao.Link.sendTalkLink({
          label: labelText,
          webButton  : {
            text: buttonText,
            url: link 
          }
        }); 
	   }else{
         Kakao.Link.sendTalkLink({
          label: labelText,
          image: {
            src: imgsrc,
            width: '300',
            height: '200'
          },
          webButton  : {
            text: buttonText,
            url: link 
          }
        }); 
	   }
   //}
}

/**
 * @3뎁스메뉴 셋팅
 */
function setDepthMenu(){
	var $location_cont = $(".location");	
	$(".location a.topLoct").on("click", function(e){
		e.stopPropagation();
		e.preventDefault();

		if($(".underLoct").css("display") === "none") $(".underLoct").show();    
		else $(".underLoct").hide();

		if ($location_cont.hasClass("on")) {
			$location_cont.removeClass("on");
			$location_cont.find(".conts_hidden").html("동위메뉴 펼치기");
		} else {
			$location_cont.addClass("on");
			$location_cont.find(".conts_hidden").html("동위메뉴 닫기");
		}
	});

	$(".location a.topLoct").find('ul').find('li:last').append('<span class="conts_hidden">동위메뉴 펼치기</span>');

	var $topLoct_list = $(".topLoct ul").find("li");
	var $underloct_list = $(".underLoct").find("ul").find("li");
	var top_len = $topLoct_list.length;

	if (top_len === 2) { // depth2
		$(".location a.topLoct").off("click");
		$topLoct_list.eq(1).find("span").remove();
	}

	if (top_len > 2) $topLoct_list.last().addClass("underOpen");
	if (top_len === 3 && depth2 !== 0) $underloct_list.eq(depth2 - 1).addClass("on");
	if (top_len === 4 && depth3 !== 0) $underloct_list.eq(depth3 - 1).addClass("on");
}

var resizeSection = function(){
    var headerHeight = $("header").outerHeight();
    var footerHeight = $("footer").outerHeight();
    var sectionHeight = $("section").outerHeight();
    var screenHeight = $(window).outerHeight();
    var minHeight = screenHeight - headerHeight - footerHeight ;

	//if (minHeight > 100) return;
    $("section").each(function() {
		if ($(this).css("display") === "block") $(this).css("min-height", minHeight);
	});
};

/*
 * @GNB set
 * Gnb.Init(); 
 * Gnb.Close(0);
 */
var Gnb = {
    documentHeight : document.documentElement.clientHeight,
    documentWidth : document.documentElement.clientWidth,
    gnbIscroll : null,
    isOpen : false,
    
    Init : function(){
        var options = {
              bounce:false,
              tap:true, 
              click:false,
              preventDefaultException:{tagName:/.*/},
              mouseWheel:true, 
              keyBindings:true
     };
      
        Gnb.gnbIscroll = new IScroll('.totalwrap', options);  
        Gnb.Close(0);
        
        $(".totalwrap").css({"display":"none","z-index":15});
        $("header a.util_r").css({"position":"fixed"});
        
        //gnb 메뉴 활성화
        try{
            if (depth1 !== undefined && depth1 > 0){
                 $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ")").addClass("on");
                 $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > a").attr("title", "확장메뉴 닫기");
                 if (depth2 !== undefined && depth2 > 0){
                     $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ")").addClass("on");
                     $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ") > a").attr("title", "확장메뉴 닫기");
                     if (depth3 !== undefined && depth3 > 0){
                         $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ") > div a:eq(" + (depth3 -1) + ")").addClass("on");
                     }
                }
            }
        } catch (exception) {
           //c onsole.log(exception.message); 
        }
        
		function setDepth1Expand() {
			var depth1_list = $(".menuBox ul.totalList > li");
			var depth1_len = depth1_list.length;
			for (var i = 0; i < depth1_len; i++ ) {
				var g_detph1 = depth1_list.eq(i);
				if (g_detph1.find("ul").length < 1) {
					g_detph1.addClass("oldep1");
					g_detph1.find("a").removeAttr("title");
				}
			}
		}

		function setDepth2Expand() {
			var depth2_list = $(".menuBox ul.totalList > li > ul > li");
			var depth2_len = depth2_list.length;
			for (var i = 0; i < depth2_len; i++ ) {
				var g_depth2 = depth2_list.eq(i);
				var g_depth3 = g_depth2.find("div");
				if (g_depth3.length === 0) {
					g_depth2.addClass("depno");
					g_depth2.find("a").removeAttr("title");
				}
			}
		}
		
		setDepth1Expand();
		setDepth2Expand();

		$(window).resize(Gnb.Resize);
		$(".fotTopBtn").css("display", "none");
		$(window).scroll(function(){
			var top = $(window).scrollTop(),
				btn = $(".util_r"),
				toTop_btn = $(".fotTopBtn"); 
				if (top > 60) btn_scroll.css("display", "none");		
				else btn_scroll.css("display", "block");
			
			if (top > topBtnPosition) toTop_btn.css("display", "block");
			else toTop_btn.css("display", "none");
		});
        
        $("a.util_r").on("click", function(e){
            e.stopPropagation();
            e.preventDefault();
            if(!Gnb.isOpen) Gnb.Open();    
        });
        
        $(".menuBox ul.totalList > li > a").on("click", function(e){
            if($(this).siblings("ul").length > 0){
                e.stopPropagation();
                e.preventDefault();

                if($(this).parent().hasClass("on")){
                    $(this).attr("title", "확장메뉴 펼치기");
                    $(this).parent().removeClass("on");
                    $(this).siblings().css({"display":"none"});    
                }else{
					$(".menuBox ul.totalList > li").removeClass("on");
					$(".menuBox ul.totalList > li > a").attr("title", "확장메뉴 펼치기");
					$(".menuBox ul.totalList > li > a").siblings().css({"display":"none"}); 
					$(".menuBox ul.totalList > li > ul > li").removeClass("on");
					if (!$(".menuBox ul.totalList > li > ul > li").hasClass("depno")) {
						$(".menuBox ul.totalList > li > ul > li > a").attr("title", "확장메뉴 펼치기");
					}
					$(".menuBox ul.totalList > li > ul > li > a").siblings().css({"display":"none"}); 
                    $(this).attr("title", "확장메뉴 닫기");
                    $(this).parent().addClass("on");
                    $(this).siblings().css({"display":"block"});
                }
                Gnb.gnbIscroll.refresh();
            }
        });
        
         $(".menuBox ul.totalList > li > ul > li > a").on("click", function(e){
            if($(this).siblings("div").length > 0){
                e.stopPropagation();
                e.preventDefault();
                if($(this).parent().hasClass("on")){
					$(this).attr("title", "확장메뉴 펼치기");
                    $(this).parent().removeClass("on");
                    $(this).siblings().css({"display":"none"});    
                }else{
					$(".menuBox ul.totalList > li > ul > li").removeClass("on");
					if (!$(".menuBox ul.totalList > li > ul > li").hasClass("depno")) {
						$(".menuBox ul.totalList > li > ul > li > a").attr("title", "확장메뉴 펼치기");
					}
					$(".menuBox ul.totalList > li > ul > li > a").siblings().css({"display":"none"});    
                    $(this).attr("title", "확장메뉴 닫기");
                    $(this).parent().addClass("on");
                    $(this).siblings().css({"display":"block"});
                }
                Gnb.gnbIscroll.refresh();
            }
        });
    },
    
    Open : function(){
		Gnb.isOpen = true;
		Gnb.gnbIscroll.scrollTo(Gnb.documentWidth,0,0);
		Gnb.documentHeight = window.innerHeight ? window.innerHeight : $(window).height();
		Gnb.documentWidth  = window.innerWidth ? window.innerWidth : $(window).width();
		$("body").append($('<div class="dimBg"></div>'));
		$("body").css({"width":this.documentWidth, "height":Gnb.documentHeight, "overflow":"hidden"});
		var top = $(window).scrollTop() - 0.5;
		$(".totalwrap").css({"display":"block","height":Gnb.documentHeight,"top":top});
		TweenMax.to($(".total"), 0.3, {x:0, onComplete:openComplete, delay:0.3});

		function openComplete(){
			Gnb.gnbIscroll.refresh();
			TweenMax.to($(".dimBgtotal"), 0.2, {x:0});
			if($("*:focus").length > 0){
				tapIndexFnc.Init($(".totalwrap"));
			}

			$(".dimBgtotal a").off().on("click", function(e){
				e.stopPropagation();
				e.preventDefault();
				Gnb.Close();
			});
		}
    },
    
    Close : function(speed){
        Gnb.isOpen = false;
        var self = this;
        var dura = speed == 0 ? 0 : 0.3;
       
        TweenMax.set($(".total"), {y:Gnb.gnbIscroll.y, z:0.01});
        TweenMax.to($(".total"), dura, {x:self.documentWidth, z:0.01, onComplete:closeComplete});    
        function closeComplete(){
             $(".dimBg").remove();
             $("body").css({"width":"", "height":"", "overflow":"auto"});
             $(".totalwrap").css({"display":"none"});
             tapIndexFnc.Close();
             Gnb.gnbIscroll.scrollTo(self.documentWidth,0,0);
			 TweenMax.to($(".dimBgtotal"), 0, {x:-100});
             TweenMax.set($(".total"), {y:0, z:0.01});
             TweenMax.killAll();
        }
    },
        
    Resize : function(){
       Gnb.documentHeight = window.innerHeight ? window.innerHeight : $(window).height();
       Gnb.documentWidth  = window.innerWidth ? window.innerWidth : $(window).width();
       if(Gnb.isOpen){
            var top = $(window).scrollTop();
            $(".totalwrap").css({"display":"block","height":Gnb.documentHeight,"top":top});
            $("body").css({"width":Gnb.documentWidth, "height":Gnb.documentHeight});
            Gnb.gnbIscroll.refresh();
        }
    }
};

/**
 *@푸터설정 전체보기 메뉴 클릭시 확장
 */
var Footer = {
	init: function() {
		var $total_brand = $(".total_brand"),
			$footer_wrap = $("footer"),
			btn_allBrand = $(".footListTop > li").eq(3).find("a"),
			$dimDiv = null,
			dimDiv = '<div class="dimBg"></div>';
	
		btn_allBrand.on("click", function(e) {
			e.preventDefault();
			e.stopPropagation();
			var target = $(e.currentTarget);
			if (target.hasClass("on")) {
				target.removeClass("on");
				$total_brand.css("display", "none");
				$dimDiv.css ({display:"none"}).remove();
				$footer_wrap.removeAttr("style");
			} else {
				$("body").append(dimDiv);
				$footer_wrap.css("z-index", "13");
				$dimDiv = $(".dimBg").on("click", function(e) {
					btn_allBrand.trigger("click");
				});;
				target.addClass("on");
				$total_brand.css("display", "block");
			}
		});
	}	
};

/*
 * @modal popup 
 *  popUp.Open($(".layer_Popup"), callback)); 
 *  
 */
var popUp = {
    callBack : null,
    container: null,
    Open : function(con, callBack, adjustTop){
		adjustTop = typeof adjustTop !== 'undefined' ? adjustTop : true;
        popUp.container = con;
        var dimDiv = '<div class="dimBg"></div>';
        $("body").append(dimDiv);
        con.find(".btnClose, .popupClose").on("click", function (e){ 
            e.stopPropagation();
            e.preventDefault();
            popUp.Close();
        });
        
        $(".dimBg").off().on("click", function(e){
            e.stopPropagation();
            e.preventDefault();
            popUp.Close();
        });
        
        var h1 = $("body").height();
        var h2 = $(window).height();
        var top = $(window).scrollTop();
        var w = $(window).width();
        var h1 = $(window).height();
        var h2 = con.height();
        var t = 0;
		if (adjustTop) t = top + h1/2 - h2/2;
		else t = null;
        if ( t < 0 ){ t = 0;}
        
		
		con.css( { position:"absolute" , left:-w , display:"block" , top:t , opacity:0 } );
        TweenMax.to(con, 0.3, {autoAlpha :1, left:0, onComplete:openComplete});
        function openComplete(){
            if($("*:focus").length > 0){
                tapIndexFnc.Init(con);
            }
        }
        
        if(typeof callBack === "function") {
            popUp.callBack = callBack;
        }
    },
    
    Close : function(){
        popUp.container.find(".btnClose, .popupClose").off("click");
        var w = $(window).width();
        TweenMax.to( popUp.container, 0.3, {autoAlpha :0, left:-w, onComplete:closeComplete, onCompleteScope:this});
        function closeComplete(){
            popUp.container.css ( { display:"none" } );
            $(".dimBg").css ( {display:"none"}).remove();
            popUp.container= null;
            tapIndexFnc.Close();
             if (popUp.callBack !== null) {
                if (typeof popUp.callBack === "function") {
                    popUp.callBack();
                    popUp.callBack = null;
                }
            }
        }
    }
};

/*
 * @tapIndex focus
 * tapIndexFnc.init($(".layer_Popup"));
 * 
 */
var tapIndexFnc = {
    focusableElementsString : "a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]",
    focusedElementBeforeModal : null,
    Init : function(con){
        var self = this;
        var obj = con;
        var o = obj.find("*");
        self.focusedElementBeforeModal = $(":focus");
        obj.keydown(function(event){self.trapTabKey($(obj),event);});
        obj.keydown(function(event){self.trapEscapeKey($(obj),event);});
        con.find(".btnClose").keydown(function(event){self.trapSpaceKey($(obj),event);});
        o.filter(self.focusableElementsString).filter(":visible").first().focus();
    },
    
    Close :function(){
         if(this.focusedElementBeforeModal){
            this.focusedElementBeforeModal.focus();
            this.focusedElementBeforeModal = null;
        }
    },
    
    trapSpaceKey : function(obj, evt){
         if ( evt.which == 32 ) {
            evt.preventDefault();
        }   
    },
    
    trapEscapeKey : function(obj, evt){
         if ( evt.which == 27 ) {
            var o = obj.find("*");
            var cancelElement;
            cancelElement = o.filter("#cancel");
            cancelElement.click();
            evt.preventDefault();
        }    
    },
    
     trapTabKey : function(obj, evt){
         if ( evt.which == 9 ) {
            var o = obj.find("*");
            var focusableItems = o.filter(this.focusableElementsString).filter(":visible");
            var focusedItem = $(":focus");
            var numberOfFocusableItems = focusableItems.length;
            var focusedItemIndex = focusableItems.index(focusedItem);
            if (evt.shiftKey) {
                if (focusedItemIndex == 0) {
                    focusableItems.get(numberOfFocusableItems - 1).focus();
                    evt.preventDefault();
                }
            } else {
                if (focusedItemIndex == numberOfFocusableItems - 1) {
                    focusableItems.get(0).focus();
                    evt.preventDefault();               
                }
            }
        }
    }
};

/*
 * @ tabmenu 
 *  var tab = new tabView(".tabList",".view");  
 *  tab.Init();
 *  
 */
function tabView(btn,layer){
    this.tabBtn = $(btn);
    this.tabLayer = $(layer);
   
}

tabView.prototype = {
    Init : function(){
        var self = this;
        self.tabBtn.find("> li").eq(0).addClass("on");
        //140818 self.tabBtn.find("> li > a").attr("title","현위치");
        self.tabLayer.find("> div").css("display","none");
        self.tabLayer.find("> div").eq(0).css("display","block");
   
        self.tabBtn.find("li > a").on("click", function(e){
            e.stopPropagation();
             e.preventDefault();
             self.tabBtn.find("li").removeClass("on");
             $(this).parent().addClass("on");
             self.tabBtn.find("li > a").removeAttr("title");
             $(this).attr("title","현위치");
             var idx = $(this).parent().index();
             self.tabLayer.find("> div").css("display","none");
             self.tabLayer.find("> div").eq(idx).css("display","block");
        });
    }
};

/**
 * @swipeBanner
 * swipeBanner(wrapobj, limit, dis, indicatorSelector, prevnextbtn, //opt.isOneContent);
 */
var swipeBanner = function(obj,limit,dis,btnSelector,pnBtn,opt){
	var btnSelector = typeof btnSelector !== "undefined" ? btnSelector : ".rolBtn > a";
	var pnBtn = typeof pnBtn !== "undefined" ? pnBtn : "";
	var opt = typeof opt !== "undefined" ? opt : "";
	
	//var _obj = $(obj);
	var objSelector = obj;
	var limit = limit;
	var self = this;
	if($(obj).length < 1){ return;}
	if($(obj).hasClass("js-swipe")){return;}
	
        var $obj  = $(obj),
			currentBannerNum = 0, 
			totalBannerNum,
			mainBannerSlider,targetWidth,
			itemDistance = dis,
			$lists = $obj.find("ul").eq(0).find("li"),
			lists_len = $lists.length,
			totalBannerNum = $obj.find("ul").eq(0).find("li").length,
			targetWidth = $obj.find("ul").eq(0).width(),
			isPaging = false,
			isContentOne = false,
			$paging = null;
		
		$obj.addClass("js-swipe");

        if (!opt) {
			if(totalBannerNum <= 1){
				hideIndicator();
				return;
			} else{
				bannerCssInit();
				$(window).resize(bannerResizeFn);
			}
		} else {
			if(totalBannerNum <= 1){
				hideIndicator();
			}
			bannerCssInit();
			$(window).resize(bannerResizeFn);
        }

		function hideIndicator() {
			
			if (btnSelector !== "") {
				var rstr0 = btnSelector.replace(" > a", "");
				$(obj).find(rstr0).css("display", "none");
			}
			if (pnBtn !== "" || pnBtn !== "undefined") {
				var rstr1 = pnBtn.replace(" > a", "");
				$(obj).find(rstr1).css("display", "none");
			}
		}

        function bannerResizeFn(e){
            $obj.find("ul").eq(0).css({"width":""});
            $obj.find("ul").eq(0).find("li").css({"width":""});
            targetWidth = $obj.find("ul").eq(0).find("li").width();
            bannerCssInit();
            moveMenu();
        }

			
        function bannerCssInit(){       
		
			targetWidth =  $obj.find("ul").width();
			if(!opt) { // basic
				$obj.find("ul").eq(0).css({"position":"relative", "width":targetWidth * (totalBannerNum),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});	
			}
			else { // 배너가 한개일때 클릭 위치 틀어지는 거 방지
				if (opt.isOneContent) {
					$obj.find("ul").eq(0).css({"position":"relative", "width":targetWidth * (totalBannerNum)});	
				}
			}

			$obj.find("ul li").each(function(i,t){
                if(i > 0){
					$(this).css({"left":i*targetWidth+(i*-itemDistance)+"px","width":targetWidth});
                }else{
                    $(this).css({"left":i*targetWidth+"px","width":targetWidth});   
                }
            });     

            $obj.find(btnSelector).eq(0).addClass("on");
        };
		
        $obj.find(btnSelector).click(function(e){
            e.stopPropagation();
            e.preventDefault();
            var idx = $(this).index();
			currentBannerNum = idx;
            moveMenu();
        });
		if (pnBtn !== "") { // prev next buttons
		
			$obj.find(pnBtn).eq(0).click(function(e) {
				e.stopPropagation();
				e.preventDefault();
				var idx = $(this).index();
				currentBannerNum--;
				if (currentBannerNum < 0) currentBannerNum = 0;
				moveMenu();
			});

			$obj.find(pnBtn).eq(1).click(function(e) {
				e.stopPropagation();
				e.preventDefault();
				var idx = $(this).index();
				currentBannerNum++;
				if (currentBannerNum > totalBannerNum) currentBannerNum = totalBannerNum;
				moveMenu();
			});
		
		}

		if ($(".paging").length) {
			$paging = $(".paging");
			isPaging = true;
			$paging.find(".prev").on("click", function(e) {
				
				e.preventDefault();
				e.stopPropagation();
				var target = $(e.currentTarget);
				var idx = target.index();
				currentBannerNum--;
				if (currentBannerNum < 0) currentBannerNum = 0;
				moveMenu();
			});
			$paging.find(".next").on("click", function(e) {
				e.preventDefault();
				e.stopPropagation();
				var target = $(e.currentTarget);
				var idx = target.index();
				currentBannerNum++;
				if (currentBannerNum > totalBannerNum) currentBannerNum = totalBannerNum;
				moveMenu();
			});
		}
	
		mainBannerSlider = new mainSlider( $obj.find("ul").eq(0), limit );
		mainBannerSlider.moveEnd = function ( dragFlag , disX , conX ){
			if ( disX == 0 ) return;
			if ( Math.abs(disX) > 10 ){
				if ( disX > 0 ){
					currentBannerNum++;             
				}else{
					currentBannerNum--;
				}
			}
			moveMenu();
		};
        
        function moveMenu(duration){
            var dura = duration == 0 ? 0 : 0.25;
            var tx;
		
			if(currentBannerNum > totalBannerNum-1) currentBannerNum = totalBannerNum-1;
			if(currentBannerNum < 0 ) currentBannerNum = 0;
			if(currentBannerNum > 0) {
				tx = -((currentBannerNum) * targetWidth+(currentBannerNum*-itemDistance));
			}
			else tx = -((currentBannerNum) * targetWidth);   
			TweenMax.to($obj.find("ul").eq(0), dura, {x:tx, ease:"easeOutSine", onComplete:animateComplete} );
        }   
        
        function animateComplete() {
            $obj.find(btnSelector).removeClass("on");
            $obj.find(btnSelector).eq(currentBannerNum).addClass("on");
			if (isPaging) {
				$paging.find(".saladList").find("em").eq(0).text(currentBannerNum+1);
			}
        }

	return {
		swipeResize: function() {
			bannerResizeFn();
		}
	};
};

/*
 *  @mainslider
 *  var slider = new mainSlider($object, false); 
 *  slider.moveEnd = fcuntion(dragFlag , disX , conX){};
 * 
 */
function mainSlider(obj, limit) {
    var self = this;
    this.tar = obj;
    this.limitlast = limit;
    this.init();
}

mainSlider.prototype = {
    init : function() {
        var self = this, sx, sy, conX, disX, disY, interval, dragFlag, scrollLock, firstCheck;
		var winW = 0;
		if (self.limitlast) {
			$(window).resize(setWinWidth);
		}
		function setWinWidth() {
			winW = $(window).width();
		}
		setWinWidth();

        self.tar.css({"-webkit-transform" : "matrix(1,0,0,1,0,0)"});
        self.tar.bind("touchstart", touchstart);

        function touchstart(e) {
            e.stopPropagation();
            clearTimeout(interval);
            setTimeout(setTimer, 200);
            sx = e.originalEvent.touches[0].pageX;
            sy = e.originalEvent.touches[0].pageY;
    
            var wx = matrixToArray(self.tar.css("-webkit-transform"))[4];
            conX = parseInt(wx);
            disX = 0;
            dragFlag = false;
            scrollLock = true;
            firstCheck = true;
    
            self.tar.bind("touchmove", touchmove).bind("touchend", touchend);
        }

        function touchmove(e) {
            e.stopPropagation();
            disX = sx - e.originalEvent.touches[0].pageX;
            disY = sy - e.originalEvent.touches[0].pageY;
    
            if (firstCheck) {
                if (Math.abs(disX) > Math.abs(disY)) {
                    scrollLock = false;
                }
            }
    
            firstCheck = false;
            var scl = self.scrollLock;
            if (scl) {
                scrollLock = true;
            }
    
            if (!scrollLock) {
                e.preventDefault();
                var wx = matrixToArray(self.tar.css("-webkit-transform"))[4];
                var targetX = conX - disX;
                if (self.limitlast) {					
                    if (targetX > 0) {
							self.tar.css("-webkit-transform", "matrix(1, 0, 0, 1, 0, 0)");
                        return;
						} else if (targetX < -self.tar.width() + winW) {
                        return;
                    }
                } 
				TweenMax.to(self.tar, 0, {x : targetX});
            } else {
                self.tar.unbind("touchmove", touchmove).unbind("touchend", touchend);
            }
        }

        function touchend(e) {
            self.tar.unbind("touchmove", touchmove).unbind("touchend", touchend);
            e.stopPropagation();
            clearTimeout(interval);
            if (!scrollLock) {
                self.moveEnd(dragFlag, disX, conX);
            }
        }
    
        function setTimer() {
            dragFlag = true;
        }
    
        function matrixToArray(str) {
            return str.match(/(-?[0-9\.]+)/g);
        }
    }, 
    
    moveEnd :function(dragFlag , disX , conX) {
        this.moveEnd(dragFlag, disX, conX);
    }, 
    
    scrollLockFlag :function(dragFlag) {
        this.scrollLock = dragFlag;
    }
};


/**
 * @왼쪽부터 쌓이는 슬라이더 리스트
 * leftStackSlider("타겟 셀렉터", [간격조정numbers]);
 */
function leftStackSlider(selector, rm, lm) {
	lm = typeof lm !== "undefined" ? lm : 3;
	var selector = selector,
		rm = rm,
		w  = document.documentElement.clientWidth,
		target = $(selector),
		itemLen = $(selector + " li").length,
		limitNum = (itemLen  > lm) ? itemLen-lm : 0,
		//liMargin = parseInt(target.find("li").eq(0).css("margin").substr(4,1)),
		liWidth = target.find("li").width(),
		totalWidth = (liWidth * itemLen) + 50,
		currentNum = 0,
		frontLen = Math.floor($(window).width() / liWidth),
		centerX = 0;
	if (!lm === 2) centerX = -liWidth * (itemLen-frontLen);
	else centerX = -liWidth * (itemLen-frontLen) + 60;
	
	target.css({"width": totalWidth});  
    $(selector + " li").css({"width":liWidth});
    
	if (totalWidth > w) {
    	var adslider = new mainSlider(target, false);
    	adslider.moveEnd = function( dragFlag , disX , conX ){
	        if ( disX == 0 ) return;
        	moveItem();
    	};

    }
	
    function moveItem(){ 
        var targetLeft = matrixToArray(target.css("-webkit-transform"))[4];   
        if(targetLeft > 0){
            TweenMax.to(target, 0.3, {x:0} );         
        }else if(targetLeft < centerX){
        	if (itemLen <= 3) TweenMax.to(target, 0.3, {x:0} );
        	else TweenMax.to(target, 0.3, {x:w - (totalWidth) - (rm[0] * (itemLen - lm))+ rm[1]});
			/*
			else {
				//TweenMax.to(target,  0.3, {x:w - (totalWidth - rm[0]) + rm[1]});
				//TweenMax.to(target,  0.3, {x:w -(totalWidth) - (liMargin * (itemLen-1)) * 2});
			}
			*/
        }
    }
  
    function matrixToArray(str){
		return str.match(/(-?[0-9\.]+)/g);
    }
   
    $(window).resize (adResize).resize();  
    function adResize(){
         w = document.documentElement.clientWidth;  
         $(selector + " li").css({"width":liWidth});
         target.css({"width":totalWidth + 500});
         TweenMax.to(target, 0.3, {x:0} );      
    }
}

/**
 * @accordion menu
 *  $('.listType01').accordionMenu({open:true, oIndex:1});
 * 
 */
(function($){
    $.fn.extend({          
         accordionMenu: function() {
            var defaults = { open: false, oIndex:0 };
            var options = $.extend(defaults, options);
			var lists = null;
             return this.each(function(i) {
                var $this = $(this), isOpen = false, opts = options, $target = $this.find("li>a.list_tit");
                if(opts.open){
                    $(this).find(".list_con").eq(opts.oIndex).css("display","block");
                    $(this).find(".list_con").eq(opts.oIndex).addClass("on");
                }else{
                    $(this).find(".list_con").eq(opts.oIndex).css("display","none");
                }
				
				var isOtherClickClose = false;
				var lastSelect_idx = null;

                 $target.on("click",function(e){
                    e.stopPropagation();
                    e.preventDefault();
					
                    if($(this).hasClass("on")){
                        $(this).removeClass("on");
                        $(this).parent().find(".list_con").css("display","none");
                    }else{
                        $(this).addClass("on");
                        $(this).parent().find(".list_con").css("display","block");
                    }

                });
            });
        }
    });    
})(jQuery);


/**
 * apiMapResize(좌표x, 좌표y, 지도초기화함수, 지도Wrapper영역);
 * apiMapResize.apiMapResizeWidth; api 지도 넓이에 적용
 */
var apiMapResize = function(latitude, longitude, apiInitFunc, mapArea) {
	var apiMapResizeWidth = 0;
	var lat = latitude;
	var lon = longitude;
	var apiMapArea = $(mapArea);
	var paramoMap = null;
	window.addEventListener('orientationchange', function() {
		var intervalId = setTimeout(function() {
			if (paramoMap != null) {
				paramoMap.setSize(new nhn.api.map.Size((apiMapResizeWidth), 300));
			} else {
				setMapInit();
			}
		}, 300);
	});

	function setMapInit() {
		apiMapResizeWidth = $('.contentBox').width();
		if (apiMapResizeWidth == null || apiMapResizeWidth == 0) {
			apiMapResizeWidth = apiMapArea.width();
		}
		apiMapArea.css('width', apiMapResizeWidth);
		$('#map_area').html('');
		apiInitFunc(lat, lon);
	}
	setMapInit();
	return {
		width: apiMapResizeWidth,
		setOmap: function(omap) {
			paramoMap = omap;
		}
	};
};

/**
 * ajax 리스트 상세보기 후 back 버튼으로 돌아올 때 리스트 유지
 *
 *
 $(document).ready(function() {
	var hOpts = {target: "#lists", moreBtn: "#moreBtn", ajaxUrl: "./1.html", form: "#newsForm" };
	var ajaxBack = new AjaxHistoryBack(hOpts);

	//ajaxBack.setPage(1);
	//ajaxBack.reqAjax();			
 });
 *
 */
var AjaxHistoryBack = (function(hOtps) {
	var self = this,
		page = 1,
		linkAnchorEls = null,
		chkTimerId = null,
		$targetcon = $(hOtps.target),
		$target = $targetcon.find(' > li'),
		$form = $(hOtps.form),
		$moreBtn = $(hOtps.moreBtn);
	
	window.addEventListener("popstate", retrieveData, false);
	
	if (window.history.state != null) {
		chkTimerId = window.setInterval(function() {
			if ($("#totCnt").val() > 0) {
				window.clearInterval(chkTimerId);
				var tl = $target.length;
				if ($("#totCnt").val() > tl) {
					$moreBtn.css("display", "block");
					page = Math.floor( (tl - 1) / 10) + 1;
				};
			};
				
			if ($target.length === 0) {
				page = 1;
				reqAjax();
			}
		}, 100);
	} else {
		reqAjax();
	};
	
	$moreBtn.on('click', function(e) {
		e.preventDefault();
		e.stopPropagation();
		moreView();
	});
	
	function moreView() {
		page = page + 1;
		$form.find("#page").val(page);
		reqAjax();
	}
	
	function reqAjax() {
		$.ajax({
			type : "post",
			url  : hOtps.ajaxUrl,
			data : $form.serialize(),
			dataType:"html",
			complete:function(data, status){
				if (status == "success"){
					$targetcon.append(data.responseText);
					$moreBtn.css("display", "block");
					
					var tl = $target.length;
					if ($("#totCnt").val() > tl) {
						$moreBtn.css("display", "block");
						page = Math.floor( (tl-1) / 10) + 1;
					};
					
					bindStateEl();
				} else {
					console.log("error : " + status);
				}
			}
		});		
	}

	function clickHandler(event) {
		var data = $(targetcon).html();
		var	context = {container: data};
		history.replaceState(context, 'TITLE');
	};

	function bindStateEl() {
		linkAnchorEls = $target.find(' > a');
		for (var i = 0, l = linkAnchorEls.length; i < l; i++) {
			linkAnchorEls[i].addEventListener('click', clickHandler);
		};
	};
	
	function retrieveData(event) {
		if (event.state == null) {
			return;
		}
		var	state = event.state,
		context = event.state.container;
		$(targetcon).empty().append(context);
	};
	
	return {
		setPage: function(p) {
			self.page = p;
		},
		reqAjax: function() {
			reqAjax();			
		}
	};
});


/**
 @가까운 매장찾기
  
  NaverAPI이용현재 좌표위치를 뽑아내서
  DB에 있는 매장 리스트를 화면에 뿌려줌

  JSON_2.0.4.asp 동일 폴더에 복사
  nearby_stor_list_ajax.aps 쿼리 편집

  <script type="text/javascript" src="jqueryLibrary.js">
  <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=naverAPIKey%>">
	
	<%
	'example of ASP
	'form에 표현식으로 사용할 변수 선언
	Dim lat : lat = 0
	Dim lng : lng = 0
	Dim distance : distance = 3
	%>

	form 태그 작성, 해당 value에 표현식으로 변수삽입
	<form id="mapFrom" name="mapFrom" method="POST">
		<input type="hidden" id="latitude" name="latitude" value="<%=lat%>" />
		<input type="hidden" id="longitude" name="longitude" value="<%=lng%>" />
		<input type="hidden" id="distance" name="distance" value="<%=distance%>" />
		<!-- 추가로 필요한 데이터 input type="hidden" 추가 -->
	</form>


	// optionObject 지정
	var mapApiOpt = {
		oMap: oMap,
		maparea: "#selector",
		ajaxurl: "/store/store_list_ajax.asp",
		viewurl: "/store/store_view.asp",
		form: ".formSelector",
		distinfo: ".distInfoSelector",
		querydatas: ["store_name", "store_phone", "store_id", "brand_img(option)"] // option이 필요없을 경우 앞의세개만 작성
	};

	// execute
	nearByStore.init() // 초기화 함수 실행
	var nearByStore = new NearByStor(mapApiOpt);

	// additional Functions
	nearByStore.setMapHeight(number);
	nearByStore.setDistances(array);
	nearByStore.setDefaultDistance(number);
	nearByStore.setDefaultZoom(array);

 */

var NearByStore = (function(opt) {
	var self = this,
		storeListJsonData,
		distance = 3,
		zoomLevel = 8,
		winWidth = $(window).width(),
		winHeight = $(window).height(),
		mapHeight = 300,
		mapMargin = 26,
		distance_arr = [3,3,5,7,10],
		zoomLevel_arr = [8,8,7,6,6],
		query_titles = [],
		query_phonenumber = [],
		query_zoomcode = [],
		query_dataname = opt.querydatas,
				
		viewUrl = opt.viewurl,
		oMap = opt.oMap,
		$mapArea = $(opt.maparea),
		mapArea_str = opt.maparea,
		ajaxurl = ajaxurl,
		apiDataForm = $(opt.form),
		apiDataInput = apiDataForm.find('> input'), // latitude, longitude, distance 순으로 선언, + etc
		$distanceInfo = $(opt.distinfo);

	function init() {
	// latitude, longitude
	if (apiDataInput.eq(0).val() == 0 || apiDataInput.eq(1).val() == 0) {
			geolocationInit();
		} else {
			mapInit();
		}

		$distanceInfo.find('> li').on('click touchstart', function(e){
		    e.preventDefault();
		    var _idx = $(this).index();
			distance = distance_arr[_idx];

			if (_idx == 0) {
				geolocationInit();
			} else {
				resetDistance(distance);
			}

			if (_idx !== 0 ) {
				$distanceInfo.find('> li').removeClass('on');
			}

			$(this).addClass('on');
		});
	}

	$(window).on('resize', function() {
		winWidth = $(window).width();
		winHeight = $(window).height();	
		if (oMap != null) {
			oMap.setSize(new nhn.api.map.Size((winWidth - 26), mapHeight));
			$('.nmap_overlay_pane .branch_info_tooltip').remove();
		};
	});

	function resetDistance(distance) {
		switch(distance) {
			case distance_arr[1] : zoomLevel = zoomLevel_arr[1]; break;
			case distance_arr[2] : zoomLevel = zoomLevel_arr[2]; break;
			case distance_arr[3] : zoomLevel = zoomLevel_arr[3]; break;
			case distance_arr[4] : zoomLevel = zoomLevel_arr[4]; break;
			case distance_arr[5] : zoomLevel = zoomLevel_arr[5]; break;
		}
		$formInput.eq(2).val(distance);
		var lat = $formInput.eq(0).val();
		var lng = $formInput.eq(1).val();
		$mapArea.html("");
		callMapQueryAjax(lat, lng);
	}

	function geolocationInit() {
		if (navigator.geolocation) {
			var geo = navigator.geolocation;
			geo.getCurrentPosition(function (pos) {
				$distanceInfo.eq(0).val(pos.coords.latitude);
				$distanceInfo.eq(1).val(pos.coords.longitude);
				callMapQueryAjax(pos.coords.latitude, pos.coords.longitude);
			}, function (e) {
				msg({
					0: '위치 정보 검색에 문제가 있습니다.(msg:' + e.message + ')',
					1: '현재 페이지에서 사용자가 위치 정보 검색을 거부했습니다.',
					2: '브라우저가 위치정보를 검색하지 못했습니다.(msg:' + e.message + ')',
					3: '브라우저의 위치 정보 검색 시간이 초과됐습니다.'
				}[e.code]);
			}, {
				enableHeighAccuracy: false,
				timeout: 10000,
				maximumAge: 0
			});
		} else {
			alert('HTML 5 geolocation 을 지원하지 않는 브라우저입니다.');
		}
	}

	function callMapQueryAjax(lat, lon) {
		$.ajax({
			url		: ajaxurl,
			dataType: "json",
			type	: "POST",
			data	: apiDataForm.serialize(),
			success:function(data){					
				storeListJsonData = data;
				$mapArea.html("");
				mapInit(lat, lon);
				//console.log(data);
			},
			error:function(e){
				console.log (e);
			}
		});
	}

	var oMarkerParam = new Array();
		
	function mapInit(lat, lon) {
		
		var lat = $formInput.eq(0).val();
		var lng = $formInput.eq(1).val();
		var oCenterPoint = new nhn.api.map.LatLng(lat,lng);
		
		nhn.api.map.setDefaultPoint('LatLng');
		oMap = new nhn.api.map.Map('map_area', {
			point : oCenterPoint,
			zoom : zoomLevel, 
			enableWheelZoom : false,
			enableDragPan : true,
			enableDblClickZoom : false,
			mapMode : 0,
			activateTrafficMap : false,
			activateBicycleMap : false,
			minMaxLevel : [ 1, 14 ],
			//size : new nhn.api.map.Size(winwidth, 505)
			size : new nhn.api.map.Size((winWidth - 26), mapHeight),
		});
		
		// 줌 컨트롤
		var markerCount = 0;
		var mapZoom = new nhn.api.map.ZoomControl();
		
		mapZoom.setPosition({left:10, bottom:10});
		oMap.addControl(mapZoom); 
		
		var infoWindow = new nhn.api.map.InfoWindow();
		var oLabel = new nhn.api.map.MarkerLabel();
		
		oMap.addOverlay(oLabel);
		oMap.addOverlay(infoWindow);

		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		
		
		// 마커이미지
		var dataLen = storeListJsonData.length;
		for (var i = 0; i < dataLen; i++){
			var jo = storeListJsonData;
			//var oIconOn = new nhn.api.map.Icon('/common/images/common/map/img_marker01.png', oSize, oOffset); 
			if (query_dataname[3] !== "" || quer_dataname[3] !== "undefined") {
				var oIconOn = new nhn.api.map.Icon(jo[i][query_dataname[3]], oSize, oOffset); 
			}
			var oPoint = new nhn.api.map.LatLng(jo[i]["latitude"], jo[i]["longitude"]);
			
			query_titles.push(jo[i][query_dataname[0]]);
			query_phonenumber.push(jo[i][query_dataname[1]]);
			query_zoomcode.push(jo[i][query_dataname[2]]);

			oMarker = new nhn.api.map.Marker(oIconOn, {
				title : query_titles,
				zIndex : 1
			});
			oMarker.id = i;
			oMarkerParam[i] = '';
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
		}
		
		oMap.attach('click', function(oCustomEvent) {
			var oTarget = oCustomEvent.target;
			if (oTarget instanceof nhn.api.map.Marker) {
				var _idx = oCustomEvent.target.id;
				var oMarkerId = oCustomEvent.target.getTitle();
				//oTarget.setIcon(oIconOn);
				//oMap.setCenter(oMarker.getPoint());
				infoWindow.setContent(infoWindow[_idx]);
				infoWindow.setPoint(oMarker.getPoint());
				infoWindow.setVisible(true);
				infoWindow.setPosition({right : 90, top : 0});
				//infoWindow.autoPosition();
				$('.nmap_overlay_pane').append('<div class="branch_info_tooltip" style="left:140px;top:68px;">' +
					'<a href="' + opt.viewurl + '?JUMCODE=' + query_zoomcode[_idx] + '">' + oTarget._sTitle[_idx] + '</a>'+
					'<p><a href="tel:' + query_phonenumber[_idx] + '">' + query_phonenumber[_idx] + '</a></p>'+
					'</div>');
				$('.branch_info_tooltip').css({left:$(oTarget._elEl).position().left-103, top:$(oTarget._elEl).position().top-145,
					'z-index':9999});
				//oTarget._sTitle[_idx]
				return;
			}
			$('.nmap_overlay_pane .branch_info_tooltip').remove();
		});
	}
	
	function msg(msg) {
		alert(msg);
	}

	return {
		setMapHeight: function(h) { // 맵의 높이에 따라 마커 중앙정렬 픽셀 정의
			self.mapHeight = h;
		},
		setDistances: function(arr) { // 버튼 클릭에 따른 거리(km) 배열
			self.distance_arr = arr;
		},
		setDefaultDistance: function(d) { // 최초 로드시 기본으로 선택되는 거리(km)
			self.distance = d;
		},
		setDefaultZoom: function(z) { // 최초 로드시 기본으로 선택되는 줌레벨
			self.zoomLevel = z;
		},
		setZoomLevels: function(arr) { // 버튼 클릭에 따른 줌레벨 배열
			self.zoomLevel_arr = arr;
		},
		init: function() {
			self.init();
		}
	};
});