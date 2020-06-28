/**
* @projectDescription CJ푸드빌 모바일 웹사이트 리뉴얼.
*
* @since 2014.08.04 zt common.js (gnb, popup, tab, swipebanner, resize section...) 
* @last  2014.09.17 ns 
* @version 1.1
*/
var depth1 = 0, depth2 = 0, depth3 = 0; //gnb depth focus
//var selectedStoreServiceIndex = 0; // VIPS_GNB에서 매장 검색 조건에 해당하는 인덱스를 지정 할 때 사용
var siteOfkakaoApiKeys = "";
var current_title = "";
"use strict";
$(document).ready(function() {
	// 현재 사이트 <title>
	current_title = $("title").text(); 

	//gnb 초기화
	if($(".totalwrap").length){
		Gnb.Init();    
	}

	//footer 초기화
	Footer.init();

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

	
	var cjfoodvile_list = ["VIPS", "TWOSOME", "허브", "푸드빌"];
	for (var i = 0, len = cjfoodvile_list.length; i < len; i++) {
		if (current_title.indexOf(cjfoodvile_list[i]) !== -1) {
			currentSiteInit(cjfoodvile_list[i]);
			break;
		}
	}

	function currentSiteInit(title) {
		switch(title) {
			case "VIPS" : initVIPS();    
				siteOfkakaoApiKeys = '9e5ad4c92468466ba04140313ca20fc8';
				break;
			case "TWOSOME" : initTWOSOME();	
				siteOfkakaoApiKeys = 'bbe994a2cb127a73aa75e2a0ab41477f';
				break;
			case "허브"	: initHUB(); 
				siteOfkakaoApiKeys = 'd3aa07200155e23c8177cb361d825925';
				break;
			case "푸드빌" : initCOMPANY(); 
				siteOfkakaoApiKeys = '85c36b7d8d26a208b7dd36c3f132105a';
				break;
		}
	}

	// VIPS 초기화
	function initVIPS() {
		window.onload = function() {
			if ($(".maincont").length) {
				var mainCont = $(".maincont");
				swipeBanner(mainCont.find(".topLeft") , true, 0, ".mainrolBtn > a");
				swipeBanner(mainCont.find(".cntRigt") , true, 0, ".btmrol > a");
				var vips_main = new vipsMainFuncs();
				vips_main.init();
			}
		};
		
		//브랜드스토리_광고
		if($(".ad_list").length){
			adBrochureSlider(".ad_list ul", [10, 5]);
		}
		
		//메뉴소개_ENJOY STEAKS_부위별 색다른맛
		if($(".enjoyMenuRol").length){   
			swipeBanner(".tabCont1 .enjoyMenuRol" , false, 59);
		}

		//할인상품권_제휴카드
		if($(".benefit_list").length) {
			benefitDescriptSwitch();
		}
	}

	// TWOSOME 초기화
	function initTWOSOME() {
		//투썹 메인
		if($(".top_visual_sliding").length) {
			swipeBanner(".top_visual_sliding", true, 0, ".indicator > a"); // TOP BANNER
			var twosome_main = new twosomeMainFuncs();
			twosome_main.init();
		}

		//투썸 광고, 현장보기 슬라이드
		if($(".ad_thumnail_list").length){
			adCFListSlider();
			adBrochureSlider(".ad_picture_slide ul", [8, 2]);
		}
		
		//매장안내 + 버튼, 이벤트 제거
		if ($(".topLoct ul li").eq(1).text() === "매장안내") {
			
			$(".topLoct ul li").eq(2).removeClass("underOpen");
			$(".location a.topLoct").off("click");
		}
	}

	// 허브 초기화
	function initHUB() {
		// 유의사항 버튼
		if($(".contentBox .btnBox01").length){
			var notice_btn = $(".contentBox .btnBox01 > .btnBlack"); 
			for (var i = 0; i < notice_btn.length; i++) {
				if(notice_btn.eq(i).text().indexOf("유의사항") !== -1){
						notice_btn.eq(i).on("click", function(e) {
						//e.preventDefault();
						e.stopPropagation();
						popUp.Open($(".layer_Popup"), null, false); 
					});	
				}
			}
		}
		// CJ타운
		if ($(".map_area .townMaker01").length) {
			var $btnspace = $(".btnspace");
			var $townlpop = $(".townLyBox");
			$btnspace.on("click", function(e) {
				e.preventDefault();
				e.stopPropagation();
				var target = $(e.currentTarget);
				var idx = target.index();
				$townlpop.css("display", "none");
				$townlpop.eq(idx).css("display", "block");

			});
			$townlpop.find(".btnClose").on("click", function(e) {
				e.preventDefault();
				e.stopPropagation();
				$(e.currentTarget).parent().parent().css("display", "none");
			});
		}
	}

	// 기업 초기화
	function initCOMPANY() {
		// 박스 슬라이더
		if ($(".whiteBox_slide").length) {
			setCompanyWhiteBoxSlider();
		}
		
		// 라운드 이미지 슬라이더
		if ($(".round_image_slide").length) {
			swipeBanner(".round_image_slide", true, 0, "", ".buttons > a");
		}
	}
}); // document.ready();


// ============================
// !VIPS ONLY
// ============================

/**
 * VIPS 메인 DOM Elements 조작
 * var vips_main = new vipsMainFuncs();
 * vips_main.init();
 */
var vipsMainFuncs = (function() {
	var self = this,
		mainCont = $(".maincont"),
		newsCont = $(".mainnews"),
		bannerCont = $('.mainCentImg').find('ul'); 
		banners = bannerCont.find('li'),
		banner_id = null,
		banner_idx = 0,
		banner_height = 0,
		newsUl = newsCont.find('> div').eq(0);
		isRefreshed = false,
		isBannerRefreshed = false,
		news_list =  newsCont.find('div').find('> a'),
		news_len = news_list.length,
		news_idx = 0,
		news_id = null;

	self.rollingNews = function() {
		var len = news_list.length;
		if (!isRefreshed) {
			isRefreshed = true;
			news_list.eq(0).clone().insertAfter(news_list.eq(len-1));
		}  else {
			TweenMax.to(newsUl, 0.5, {y: -41 * news_idx, onComplete: changePosY});	
		}
		news_idx++; 
		function changePosY() {
			if (news_idx > len) {
				news_idx = 1;
				TweenMax.to(newsUl, 0, {y: 0});
			}
		};
	};
	
	self.setRollingBtn = function() {
		var btn_stop = newsCont.find('span').find('a').eq(0);
		var btn_play = newsCont.find('span').find('a').eq(1);  
		btn_stop.on('click', function(e){
			e.stopPropagation();
	        e.preventDefault();
	        clearInterval(news_id);
	        btn_stop.css('display', 'none');
	        btn_play.css('display', 'block');
		});
		btn_play.on('click', function(e){
			e.stopPropagation();
	        e.preventDefault();
	        news_id = setInterval(self.rollingNews, 3000);
	        btn_stop.css('display', 'block');
	        btn_play.css('display', 'none');
		});
	};
	
	self.setSwitchDim = function(obj) {
		var isOpen = false;
		var dim_layer = obj.find('div').eq(0); 
		obj.find("a").eq(0).find("img").on('click', function(e){
			e.stopPropagation();
	        e.preventDefault();
			dim_layer.css('display', 'block');
		});
		dim_layer.on('click', function(e){
			e.stopPropagation();
	        e.preventDefault();
			dim_layer.css('display', 'none');
		});
		dim_layer.find('a').find('img').on('click', function(e){
			e.stopPropagation();
		});
	};
	
	self.init = function() {
		self.setSwitchDim(mainCont.find('.topRigt'));
		news_id = setInterval(self.rollingNews, 3000);
		self.rollingNews();
		self.setRollingBtn();
	};
	return self;
});

/**
 * VIPS 할인 / 상품권 - 제휴카드 아코디언 열기, 닫기
 * benefitDescriptSwitch();
 */
function benefitDescriptSwitch() {
	var lists = $('.benefit_list').find('> li');
	var len = lists.length;
	lists.removeClass('on');
	for (var i = 0; i < len; i++) {
		var btns = lists.eq(i).find('> a').find('span');
		btns.attr('seq', i);
		btns.on('click', benefitClickHn);
	}
	
	function benefitClickHn(e) {
		e.stopPropagation();
		e.preventDefault();
		
		var target = $(e.currentTarget);
		var idx = parseInt(target.attr('seq'), 10);
		var current_list = lists.eq(idx);
		if (current_list.hasClass('on')) {
			current_list.removeClass('on');
		} else {
			current_list.addClass('on');	
		}
	}
}

// ============================
// !TWOSOME ONLY
// ============================

/**
 * 투썸 메인 DOM Elements 조작
 * var twosome_main = new twosomeMainFuncs();
 * twosome_main.init();
 */
var twosomeMainFuncs = (function() {
	var self = this,
		isRefreshed = false,
		newsCont = $('.main .notice'),
		newsUl = newsCont.find('ul'),
		product_idx = 0,
		news_list = newsCont.find('ul').find('li'),
		news_len = news_list.length,
		news_idx = 0;
		news_id = null;
	
	self.rollingNews = function() {
		var len = news_list.length;
		if (!isRefreshed) {
			isRefreshed = true;
			news_list.eq(0).clone().insertAfter(news_list.eq(len-1));
		}  else {
			TweenMax.to(newsUl, 0.5, {y: -60 * news_idx, onComplete: changePosY});	
		}
		news_idx++; 
		function changePosY() {
			if (news_idx > len) {
				news_idx = 1;
				TweenMax.to(newsUl, 0, {y: 0});
			}
		};
	};

	self.twosomePairing = function() {
		var $el = $('.product_information ul');
		var len = $el.find('li').length;
		$('.product_information').css('overflow', 'hidden');
		var setTwosomePairing = function(obj, i) {
			var idx = i;
			obj.each(function(i,target) {
				var $con = $(target),
					$mask = $con.find('.mask'),
					$content1 = $con.find('.contents_01'),
					$content2 = $con.find('.contents_02'),
					$show_btn = $con.find('.button_show > a'),
					index = idx;
					show_btn_posY = 0;
					content_height = 0;
					$con.css('top', 0);
				$(window).resize(function() {
					resizePairing();
				});
				$show_btn.on('click', function(e) {
					e.stopPropagation();
					e.preventDefault();
					var tar = $(e.currentTarget);
					if(tar.hasClass('on')) {
						tar.removeClass('on');
						$show_btn.html('투썸페어링 정보 보기');
						TweenMax.to($content1, 0.25, {y: 0});
						TweenMax.to($content2, 0.25, {y: -content_height});
					} else {
						tar.addClass('on');
						$show_btn.html('투썸페어링 정보 닫기');
						TweenMax.to($content1, 0.25, {y: content_height});
						TweenMax.to($content2, 0.25, {y: 0});
					}
				});

				$content1.on('click', function(e) {
					e.preventDefault();
					e.stopPropagation();
					$show_btn.trigger('click');
				});

				function resizePairing() {
					var adjustWidth = $el.find('li').eq(0).width();

					if (len !== 1 ) {
						var winW = $(window).width();
						var ar = 40;
						$el.find('li').css('width', winW - ar);
						//$el.find('> li').css('left', );
					} else {
						var winW = $(window).width();
						var ar = 40;
						$el.find('li').css('width', winW - ar);
						$content1.css('width', winW - ar);
						$content2.css('width', winW - ar);
						//$content1.css('-webkit-transform', 'matrix(1, 0, 0, 1, 0, 0)');
						$el.find('li').css('margin-right', "3%");
					}
					content_height = $content1.height();
					$mask.css('height', content_height);
					show_btn_posY = -content_height;
					$show_btn.parent().css('top', show_btn_posY - 20);
					$content1.css('-webkit-transform', 'matrix(1, 0, 0, 1, 0, 0)');
					$content2.css('-webkit-transform', 'matrix(1, 0, 0, 1, 0, '+ -content_height +')');
					var subject_height = $el.find('li').eq(0).find('img').eq(0).height();
					var adjust_height = content_height + subject_height;
					$el.css('height', adjust_height);
					$el.find('li').css('height', adjust_height);
					adjustWidth = 0;
				}
				resizePairing();
			});
		};

		for(var i = 0; i < len; i++) {
			setTwosomePairing($el.find('li').eq(i), i);
		}
	};

	self.setNewProducts = function() {
		var con = $("#hotnewproducts");
		var len = con.find("li").length;
		var width = con.find("li").eq(0).width();
		con.css("width", len * width + 500);
		con.css("height", con.find("li").eq(0).height());
		/*
		function moveLeft() {
			product_idx--;
			if (product_idx < 0) product_idx = 0;
			TweenMax.to(con, 0.25, {x: -width * product_idx});
		}

		function moveRight() {
			product_idx++;
			if (product_idx > len-1) product_idx = len-1;
			TweenMax.to(con, 0.25, {x: -width * product_idx});
		}
		*/
	};

	self.init = function() {
		window.onload = function() {
			swipeBanner(".twosome_sliding", true, 0, ".indicator > a");  // TWOSOME PAIRING
			swipeBanner(".hotnewproducts", false, 0); // EVENT BANNER
			self.twosomePairing();	
			swipeBanner(".event_sliding", true, 0, ".indicator > a"); // EVENT BANNER
			self.rollingNews();
			self.setNewProducts();  // HOT & NEW
		};
	};
	return self;
});

/**
 * 투썸 브랜드스토리 - 광고 슬라이더
 * adBrochureSlider("타겟 셀렉터", [간격조정numbers]);
 */
function adCFListSlider() {
    var w  = document.documentElement.clientWidth,
		target = $(".ad_thumnail_list ul"),
		itemLen = $(".ad_thumnail_list ul li").length,
		limitNum = (itemLen  > 3) ? itemLen-3 : 0,
		liWidth = target.find('li').width(),
		totalWidth = liWidth * itemLen + 50,
		currentNum = 0,
		frontLen = Math.floor($(window).width() / liWidth),
		centerX = -liWidth * (itemLen-frontLen);
	target.css({"width": totalWidth});  
    $(".ad_thumnail_list ul li").css({"width":liWidth});
    
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
        	else TweenMax.to(target, 0.3, {x:w - (totalWidth) - 10 * (itemLen - 3)});
        }
    }
  
    function matrixToArray(str){
		return str.match(/(-?[0-9\.]+)/g);
    }
   
    $(window).resize (adResize).resize();  
    function adResize(){
         w = document.documentElement.clientWidth;  
         $(".ad_list ul li").css({"width":liWidth});
         target.css({"width":totalWidth + 500});
         TweenMax.to(target, 0.3, {x:0} );      
    }
    
    target.find("li > a").on("click", function(e){
        e.stopPropagation();
        //e.preventDefault();
        target.find("li").removeClass("on");
        $(this).parent().addClass("on");
    });
}


// ============================
// !HUB ONLY
// ============================



// ============================
// !COMPANY ONLY
// ============================

function setCompanyBrandInfo() {
	var info  = $(".brand_info > .info");
	var slide = info.find("> .slide");
	var slide_len = slide.length;
	for (var i = 0; i < slide_len; i++) {
		var el = slide.eq(i);
		swipeBanner(el, true, 0, "", "> a");
	}

	info.find("> .intro a").on("click", function(e) {
		e.preventDefault();
		e.stopPropagation();
		var target = $(e.currentTarget);
		var idx = target.index();	
		if (target.hasClass("on")) {
			target.removeClass("on");
			target.parent().find(".view").css("display", "none");
		} else {
			target.addClass("on");
			target.parent().find(".view").css("display", "block");
		}
	});
}

function setCompanyWhiteBoxSlider() {
	var slide = $(".whiteBox_slide");
	var isInSlide = $(".accodion_list").length;
	if (isInSlide > 0) slide.eq(0).parent().parent().css("display", "block");
	var slide_len = slide.length;
	for (var i = 0; i < slide_len; i++) {
		var el = slide.eq(i);
		swipeBanner(el, true, 0, ".indicator > a", ".buttons > a");
	}
	if (isInSlide > 0) slide.eq(0).parent().parent().css("display", "none");
}

//	============================
//	!COMMONS
//	============================

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
   Kakao.init('25782cba9fcc9ef66c4291833d994ad9');
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

function setDepthMenu(){
	var $location_cont = $(".location");	
	$(".location a.topLoct").on("click", function(e){
		e.stopPropagation();
		e.preventDefault();
		if($(".underLoct").css("display") === "none"){
			$(".underLoct").show();    
		}else{
			$(".underLoct").hide();
		}

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

	if (top_len === 3 && depth2 !== 0) { // depth2
		$underloct_list.eq(depth2 - 1).addClass("on");
	}

	if (top_len === 4 && depth3 !== 0) { // depth3
		$underloct_list.eq(depth3 - 1).addClass("on");
	}

	if  (current_title.indexOf("허브") !== -1 || current_title.indexOf("TWOSOME") !== -1)  {
		if (top_len > 2) { // depth2
			$topLoct_list.last().addClass("underOpen");
		}
	}
}

var resizeSection = function(){
    var headerHeight = $("header").outerHeight();
    var footerHeight = $("footer").outerHeight();
    var sectionHeight = $("section").outerHeight();
    var screenHeight = $(window).outerHeight();
    var minHeight = screenHeight - headerHeight - footerHeight ;

	//if (minHeight > 100) return;
    $("section").each(function() {
            if ($(this).css("display") === "block") {
                $(this).css("min-height", minHeight);
            }
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
            if(depth1 !== undefined && depth1 > 0){
                 $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ")").addClass("on");
                 $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > a").attr('title', '확장메뉴 닫기');
                 if(depth2 !== undefined && depth2 > 0){
                     $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ")").addClass("on");
                     $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ") > a").attr('title', '확장메뉴 닫기');
                     if(depth3 !== undefined && depth3 > 0){
                         $(".menuBox ul.totalList > li:eq(" + (depth1 -1) + ") > ul > li:eq(" + (depth2 -1) + ") > div a:eq(" + (depth3 -1) + ")").addClass("on");
                     }
                }
            }
        }catch(exception){
            console.log(exception.message); 
        }
        

		function setDepth2Expand() {
			var depth2_list = $(".menuBox ul.totalList > li > ul > li");
			var depth2_len = depth2_list.length;
			for(var i = 0; i < depth2_len; i++ ) {
				var g_depth2 = depth2_list.eq(i);
				var g_depth3 = g_depth2.find("div");
				if(g_depth3.length === 0) {
					//g_depth2.find("a").css("background-image", "none");depno
					g_depth2.addClass("depno");
					g_depth2.find("a").removeAttr("title");
				}
			}
		}
		setDepth2Expand();

		$(window).resize(Gnb.Resize);
		$(".fotTopBtn").css("display", "none");
		$(window).scroll(function(){
			var top = $(window).scrollTop(),
				btn = $(".util_r"),
				toTop_btn_vips = $(".fotTopBtn"); 
				toTop_btn_twosome = $(".button_top"); 
			if (top > 60) {
				toTop_btn_vips.css("display", "block");
				toTop_btn_twosome.css("display", "block");
			} else {
				toTop_btn_vips.css("display", "none");
				toTop_btn_twosome.css("display", "none");
			}
		});
        
        $("a.util_r").on("click", function(e){
            e.stopPropagation();
            e.preventDefault();
            if(!Gnb.isOpen){
                Gnb.Open();    
            }
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
             //TweenMax.to($(".dimBgtotal"), 0, {x:-100, z:0.1});
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
        var o = obj.find('*');
        self.focusedElementBeforeModal = $(':focus');
        obj.keydown(function(event){self.trapTabKey($(obj),event);});
        obj.keydown(function(event){self.trapEscapeKey($(obj),event);});
        con.find(".btnClose").keydown(function(event){self.trapSpaceKey($(obj),event);});
        o.filter(self.focusableElementsString).filter(':visible').first().focus();
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
            var o = obj.find('*');
            var cancelElement;
            cancelElement = o.filter("#cancel");
            cancelElement.click();
            evt.preventDefault();
        }    
    },
    
     trapTabKey : function(obj, evt){
         if ( evt.which == 9 ) {
            var o = obj.find('*');
            var focusableItems = o.filter(this.focusableElementsString).filter(':visible');
            var focusedItem = $(':focus');
            var numberOfFocusableItems = focusableItems.length;
            var focusedItemIndex = focusableItems.index(focusedItem);
            if (evt.shiftKey) {
                if(focusedItemIndex == 0){
                    focusableItems.get(numberOfFocusableItems-1).focus();
                    evt.preventDefault();
                }
            } else {
                if(focusedItemIndex == numberOfFocusableItems-1){
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

			  if($(".enjoyMenuRol").length > 0){
              	swipeBanner(".tabCont"+(idx+1)+" .enjoyMenuRol", false, 59);
             }
        });
    }
};

var simpleTabList = function(selector, index) {
	var $btns = $(selector).find('ul > li');
	$btns.eq(index).addClass('on');
	$btsn.eq(index).attr('title', '선택');
};

/**
 *@상단 브랜드, 하단 카테고리 선택 ajax 컨텐츠
 *@var ajaxTabList = new AjaxTabList([brandSelector, categorySelector], exeCuteAjaxFunc, optionFunc, formValueListArray);
 */
var AjaxTabList = function(selector, formId, ajaxFunc, optionFunc, valueList) {
	this.obj = $(selector[0]);
	this.dobj = $(selector[1]);
	this.cidx = 0;
	this.didx = 0;
	this.formId = formId;
	this.ishubMobileProductShop = false;
	if (this.formId === "hubMobileProductShop") {
		this.ishubMobileProductShop = true;
	}
	this.form = typeof formId !== 'undefined' ? this.formSetting() : '';
	this.ajaxFunc = ajaxFunc;
	this.optionFunc = typeof optionFunc !== 'undefined' ? optionFunc : null;
	this.valueList = typeof valueList !== 'undefined' ? valueList : null;
	this.init();
};
	
AjaxTabList.prototype = {
	init: function() {
		var self = this,
			$list = self.obj.find('li'),
			$dlist = self.dobj.find('li'),
			$btns = $list.find('> a'),
			$dbtns = $dlist.find('> a'), 
			$form = self.form,
			len = parseInt($btns.length);
			//if (this.formId === "hubBrandCoupon") len = len - 1;

		if (!self.ishubMobileProductShop) { // normal
			$btns.on('click', function(e) {
				e.preventDefault();
				e.stopPropagation();
				var cbtn = $list.eq(self.cidx);
				var idx = $(e.currentTarget).parent().index();
			
				cbtn.removeClass('on');
				$list.eq(idx).addClass('on');
				cbtn.removeAttr('title');
				$form.eq(self.cidx).removeAttr('value');
				$list.eq(idx).attr('title', '선택');
				if (self.valueList === null) {
					$form.eq(idx).val('1');	
				} else {
					$form.eq(0).val(self.valueList[idx]);	
				}
				
				self.cidx = idx;
				if (self.dobj !== null) {
					$dbtns.eq(0).trigger('click');
				}
				if(self.optionFunc !== null ) self.optionFunc();
				//self.ajaxFunc(idx + 1);
			});
		} else { // infinite banner - 허브 모바일 상품샵
			
		}

		if (self.dobj !== undefined) { 
			$dbtns.on('click', function(e) {
				e.preventDefault();
				e.stopPropagation();
				var idx = $(e.currentTarget).parent().index();
				var cbtn = $dlist.eq(self.didx);

				//cbtn.removeClass('on');
				//cbtn.removeAttr('title');
				//$form.eq(self.didx + len).removeAttr('value');

				//$dlist.eq(idx).addClass('on');
				//$dlist.eq(idx).attr('title', '현위치');
				if (self.valueList === null) {
					$form.eq(idx + len).val('1');
				} else {
					$form.eq(1).val(idx+1);
				}	
				self.didx = idx;
				if(self.optionFunc !== null) self.optionFunc();
				self.ajaxFunc(idx + 1);
			});
		}
		
		if (self.valueList === null) {
			$btns.eq(0).trigger("click");
		}

		if ($(".tabProduct").length > 0) {
			var value_1 = $("#hubBrandCoupon").find("input").eq(1).val();
			$dlist.eq(value_1-1).addClass('on');
			$dlist.eq(value_1-1).attr('title', '현위치');
			//$dbtns.eq(value_1).trigger('click');
		}
	},
	formSetting: function() {
		var $forms = null;
		if($('#' + this.formId).find('input').length > 0) $forms = $('#' + this.formId).find('input');
		else $forms = $('#' + this.formId);
		return $forms;
	},
	setIndex: function(index) {
		this.cidx = index;
	},
	getIndex: function() {
		return this.cidx;
	},
	getForm: function() {
		return this.form;
	}
};

/**
 * @infiniteBanner(obj, pnBtnSelectorArr);
 * @무한롤링, 좌우버튼
 */
var infiniteBanner = function(obj,pnBtnArr,formid, valuelist, ajaxFunc) {
	
	if (obj.length < 1) {return;}
	if ($(obj).hasClass("js-swipe")){return;}

	var $container = $(obj).find("ul"),
		currentBannerNum = 0,
		totalBannerNum = 0,
		lists_len = 0,
		$lists = $container.find("li");
		$prev_btn = $(pnBtnArr[0]),
		$next_btn = $(pnBtnArr[1]),
		targetWidth = parseInt(document.documentElement.clientWidth / 3),
		isInfinite = false;
		el = document.getElementById("shopBrandRolID"),
		formId = formid,
		valueList = valuelist,
		ajaxFunc = ajaxFunc,
		$order_list = $('.shopProduct .tabProduct > li'),
		$order_btns = $('.shopProduct .tabProduct > li > a'); 
	
	//swipeBanner(".shopBrandRol", true, 0);

	listSetting();
	bannerCssInit();
	//$(window).resize(bannerResizeFn);
	window.addEventListener('orientationchange', function() {
		var intervalId = setTimeout(function() {
			bannerResizeFn();
		}, 300);
	});

	function bannerResizeFn(){
	
		$container.css({"width":""});
		$container.find("li").css({"width":""});
		targetWidth = $container.find("li").width();
		bannerCssInit();
		moveMenu();
	}  
		
	function listSetting() {
		lists_len = $lists.length;
		for (var i = 0; i < lists_len; i++) {
			$lists.eq(i).attr("seq", i);
		}
		$lists.eq(2).clone().insertAfter($lists.eq(lists_len-1));
		$lists.eq(1).clone().insertAfter($lists.eq(lists_len-1));
		$lists.eq(0).clone().insertAfter($lists.eq(lists_len-1));
		$lists = $container.find("li");
		lists_len = $lists.length;
		totalBannerNum = lists_len;
	}

	function bannerCssInit(){
		
		$container.css({"position":"relative","height":110, "width":targetWidth*(totalBannerNum),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});	
		$container.find("li").each(function(i,t){
			var li = $(this);
			if(i > 0){
				li.css({"left":i*targetWidth+"px","width":targetWidth});
			}else{
				li.css({"left":i*targetWidth+"px","width":targetWidth});   
			}
		});
	}

	
	swipedetect(el, function(swipedir){
		if (swipedir == "left" ) $next_btn.trigger("click");
		else if (swipedir == "right") $prev_btn.trigger("click");
	});

	currentBannerNum = 0; 
	/*
	var isListClick = false;
	var $list_btns = $lists.find("> a");
	*/

	$prev_btn.on("click", function(e) {
		e.stopPropagation();
		e.preventDefault();
		$lists.eq(currentBannerNum).removeClass("on");
		$lists.eq(currentBannerNum).removeAttr("title"); 
		currentBannerNum--;
		if (currentBannerNum < 1) {
			currentBannerNum = lists_len - 2;
			//$container.css("-webkit-transform", "matrix(1, 0, 0, 1, " + -((currentBannerNum-1) * targetWidth + 3) + ", 0)");
			TweenMax.to($container , 0, {x:-((currentBannerNum - 1) * targetWidth)});
			currentBannerNum = lists_len - 3;
			isInfinite = true;
			moveMenu();
		} else {
			moveMenu();
		}

		if (isListClick) {
			isListClick = false;
			return;
		}
		$list_btns.eq(currentBannerNum).trigger("click");
		
	});

	$next_btn.on("click", function(e) {
		e.stopPropagation();
		e.preventDefault();
		$lists.eq(currentBannerNum).removeClass("on");
		$lists.eq(currentBannerNum).removeAttr("title"); 
		currentBannerNum++;
		if (currentBannerNum > lists_len - 2) {
			currentBannerNum = 1;
			//$container.css("-webkit-transform", "matrix(1, 0, 0, 1, " + -((currentBannerNum-1) * targetWidth + 3) + ", 0)");
			TweenMax.to($container , 0, {x:-((currentBannerNum - 1) * targetWidth)});
			currentBannerNum = 2;
			isInfinite = true;
			moveMenu();
		} else {
			moveMenu();
		}
		
		if (isListClick) {
			isListClick = false;
			return;
		}
		$list_btns.eq(currentBannerNum).trigger("click");
		
	});

	$lists.find(" > a").on("click", function(e) {
		
		e.stopPropagation();
		e.preventDefault();
		isListClick = true;
		var idx = $(e.currentTarget).parent().index();
		if (idx > currentBannerNum ) $next_btn.trigger("click");
		else if (idx < currentBannerNum ) $prev_btn.trigger("click");
		else {
			return;
		}
		isListClick = false;
	});
		
	function moveMenu(duration){
		var dura = duration == 0 ? 0 : 0.25;
		var tx = -((currentBannerNum-1) * targetWidth + 3);
		TweenMax.to($container, dura, {x:tx, ease:"easeOutSine", onComplete:prevnextComplete} );
	}   

	function prevnextComplete() {
		$lists.eq(currentBannerNum).addClass("on"); 
		$lists.eq(currentBannerNum).attr("title", "선택");
		isInfinite = false;	
		loadListButtonAjax();
	}

	function loadListButtonAjax() {
		var $form = $(formId);
		var idx = currentBannerNum,
		len = lists_len - 3;
		var seq = $lists.eq(currentBannerNum).attr('seq');
		if (idx > seq) {
			idx = seq;
		}

		$form.find('input').eq(0).val(valueList[idx]);

		//$("#COMP_CODE").attr('value', valueList[idx]);
		$order_btns.eq(0).trigger('click');
		
	}

	//$("#COMP_CODE").attr('value', valueList[0]);
	//$form.find('input').eq(1).val($dbtns.eq(idx).attr('type'));

	function init() {
		var value_0 = $(formId).find("input").eq(0).val();
		if (value_0) {
			var l = valueList.length;
			for (var i = 0; i < l; i++) {
				if (value_0 === valueList[i]) {
					currentBannerNum = i;
				}
			}
			//$(".tabProduct").find("li").eq(order_num).addClass("on");
		}

		//currentBannerNum = 1;
		if (currentBannerNum !== 0) {
			var initx = -((currentBannerNum-1) * targetWidth + 3);
		} else {
			currentBannerNum = lists_len - 3;
		}
		var initx = -((currentBannerNum-1) * targetWidth + 3);
		TweenMax.to($container, 0, {x:initx} );
		$lists.eq(currentBannerNum).addClass("on"); 
		$lists.eq(currentBannerNum).attr("title", "선택");
	}

	function ajaxListInit() {
						
		var $dlist = $order_list;
		var $dbtns = $order_btns;
		var $form = $(formId);

		
		$dbtns.on('click', function(e) {
			e.preventDefault();
			e.stopPropagation();
			var idx = $(e.currentTarget).parent().index();
			
			$form.find("input").eq(1).removeAttr('value');
			$dlist.removeClass('on');
			$dlist.removeAttr('title');
			$dlist.eq(idx).addClass('on');
			$dlist.eq(idx).attr('title', '현위치');
			$form.find('input').eq(1).val($dbtns.eq(idx).attr('type'));
			ajaxFunc();
		});

		if ($(".tabProduct").length > 0) {
			var value_1 = $form.find("input").eq(1).val();
			var value_o = [];
			var order_num = 10;

			function setValueOrder() {
				var $target = $(".tabProduct").find("li > a");
				for(var i = 0; i < 3; i++) {
					value_o.push($target.eq(i).attr("type"));
				}
			}
			setValueOrder();
			
			var ol = value_o;
			var oll = value_o.length;
			for (var j = 0; j < oll; j++) {
				if (value_1 === value_o[j]) {
					order_num = j;
				}
			}
			$dbtns.eq(order_num).trigger('click');
		}
	}
	init();
	ajaxListInit();
	
};

/**
 * @swipeBanner
 * swipeBanner(wrapobj, limit, dis, selector, prevnextbtn);
 */
var swipeBanner = function(obj,limit,dis,btnSelector,pnBtn){
	btnSelector = typeof btnSelector !== 'undefined' ? btnSelector : ".rolBtn > a";
	pnBtn = typeof pnBtn !== 'undefined' ? pnBtn : "";
	//var _obj = $(obj);
	var objSelector = obj;
	var limit = limit;
	var self = this;
	if($(obj).length < 1){ return;}
	if($(obj).hasClass("js-swipe")){return;}
	    
    //$(obj).each(function(i,target){
        var $obj  = $(obj);
        $obj.addClass("js-swipe");
        var currentBannerNum = 0 , totalBannerNum;
        var mainBannerSlider,targetWidth;
        var itemDistance = dis;
		var $lists = $obj.find("ul").eq(0).find("li");
		var lists_len = $lists.length;
        totalBannerNum = $obj.find("ul").eq(0).find("li").length;
		targetWidth = $obj.find("ul").eq(0).width();

		var isTwosomePairing = false;
		var isHotnewproducts = false;
		if (objSelector == ".twosome_sliding") {
			isTwosomePairing = true;
		} else if (objSelector == ".hotnewproducts") {
			isHotnewproducts = true;
		}
        
        if(totalBannerNum <= 1){
            return;
        }else{
            bannerCssInit();
            $(window).resize(bannerResizeFn);
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
			
			//$obj.find("ul").css({"position":"relative", "width":targetWidth*(totalBannerNum-1)+(totalBannerNum-1),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});	
			$obj.find("ul").eq(0).css({"position":"relative", "width":targetWidth * (totalBannerNum),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});	

			// exceptions
			if (isTwosomePairing) $obj.find("ul").eq(0).css({"position":"relative", "width":(targetWidth + 40)* (totalBannerNum),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});
			if (isHotnewproducts) {
				var w = $(window).width();
				$obj.find("ul").eq(0).css("margin-left", w / 2 - 120); 
				targetWidth = 278;
				$obj.find("ul").eq(0).css({"position":"relative", "width":(targetWidth - 40)* (totalBannerNum),"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});
			}
			//


            $obj.find("ul li").each(function(i,t){
                if(i > 0){
					$(this).css({"left":i*targetWidth+(i*-itemDistance)+"px","width":targetWidth});
					
					// exceptions
					if (isTwosomePairing) $(this).css({"left":i*targetWidth+(i*-itemDistance) + 40  * i +"px","width":targetWidth});
					if (isHotnewproducts) {
						targetWidth = 278;
						$(this).css({"left":i*targetWidth+(i*-itemDistance) - 40  * i +"px","width":targetWidth});
					}
					//

                }else{
                    $(this).css({"left":i*targetWidth+"px","width":targetWidth});   
                }
            });     

            $obj.find(btnSelector).eq(0).addClass("on");
           // $obj.find(".rolBtn").css({"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});       
           // $obj.find("a").css({"-webkit-transform":"translateZ(0)"});        
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
				if(isTwosomePairing) tx = -((currentBannerNum) * (targetWidth+40)+(currentBannerNum*-itemDistance));
				if(isHotnewproducts) tx = -((currentBannerNum) * (targetWidth-40)+(currentBannerNum*-itemDistance));
			}
			else tx = -((currentBannerNum) * targetWidth);   
			TweenMax.to($obj.find("ul").eq(0), dura, {x:tx, ease:"easeOutSine", onComplete:animateComplete} );
        }   
        
        function animateComplete() {
            $obj.find(btnSelector).removeClass("on");
            $obj.find(btnSelector).eq(currentBannerNum).addClass("on");
        }
	//});


	return {
		swipeResize: function() {
			$obj.find("ul").eq(0).css({"width":""});
            $obj.find("ul").eq(0).find("li").css({"width":""});
            targetWidth = $obj.find("ul").eq(0).find("li").width();
            bannerCssInit();
            moveMenu();
		}
	}
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
						//} else if (targetX < -self.tar.width()) {
						} else if (targetX < -self.tar.width() + winW) {
                        //self.tar.css("-webkit-transform", "matrix(1, 0, 0, 1, " + (-self.tar.width()) + ", 0)");
						//self.tar.css("-webkit-transform", "matrix(1, 0, 0, 1, " + (-self.tar.width()) + ", 0)");
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
 * adBrochureSlider("타겟 셀렉터", [간격조정numbers]);
 */
function adBrochureSlider(selector, rm, lm) {
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
             return this.each(function(i) {
                var $this = $(this), isOpen = false, opts = options, $target = $this.find("li>a.list_tit");
                if(opts.open){
                    $(this).find(".list_con").eq(opts.oIndex).css("display","block");
                    $(this).find(".list_con").eq(opts.oIndex).addClass("on");
                }else{
                    $(this).find(".list_con").eq(opts.oIndex).css("display","none");
                }
                
                 $target.on("click",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    if($(this).hasClass("on")){
                        $(this).removeClass("on");
                        $(this).parent().find(".list_con").css("display","none");
                    }else{
                        /*$target.removeClass("on");
                        $target.parent().find(".list_con").slideUp();*/
                        $(this).addClass("on");
                        $(this).parent().find(".list_con").css("display","block");
                    }
                });

				if ($this.find("li").eq(0).find("p a").length > 0) {
					var $lis = $this.find("> li");
					var listlen = $lis.length;
					for(var i = 0; i < listlen; i++) {
						$lis.eq(i).find(".list_con p a").on("click", function(e) {
							e.stopPropagation();
							e.preventDefault();
							var target = $(e.currentTarget);
							var idx = target.parent().parent().parent().index();
							$lis.eq(idx).find(".list_tit").trigger("click");
						});
					}
				}
            });
        }
    });    
})(jQuery);

/**
 *	@swipedetect 터치 스와이프 x, y축 체크
 *
 *	var el = document.getElementById('someel')
 *	swipedetect(el, function(swipedir){
 *	swipedir contains either "none", "left", "right", "top", or "down"
 *	if (swipedir =='left')
 *		alert('You just swiped left!')
 *	})
 */
function swipedetect(el, callback){
	var touchsurface = el,
	swipedir,
	startX,
	startY,
	distX,
	distY,
	threshold = 30, //required min distance traveled to be considered swipe
	restraint = 100, // maximum distance allowed at the same time in perpendicular direction
	allowedTime = 300, // maximum time allowed to travel that distance
	elapsedTime,
	startTime,
	handleswipe = callback || function(swipedir){};	
	

	touchsurface.addEventListener('touchstart', function(e){
		var touchobj = e.changedTouches[0];
		swipedir = 'none';
		dist = 0;
		startX = touchobj.pageX;
		startY = touchobj.pageY;
		startTime = new Date().getTime(); // record time when finger first makes contact with surface
		//e.preventDefault();
		e.stopPropagation();
	}, false);
	
	
 
	touchsurface.addEventListener('touchmove', function(e){		
		var touchobj = e.changedTouches[0];
		distX = touchobj.pageX - startX; 
		distY = touchobj.pageY - startY; 
		//if (distX > 30 ) 
			e.preventDefault(); // prevent scrolling when inside DIV
	}, false);
 
	touchsurface.addEventListener('touchend', function(e){
		var touchobj = e.changedTouches[0];
		distX = touchobj.pageX - startX; // get horizontal dist traveled by finger while in contact with surface
		distY = touchobj.pageY - startY; // get vertical dist traveled by finger while in contact with surface
		elapsedTime = new Date().getTime() - startTime; // get time elapsed
		if (elapsedTime <= allowedTime){ // first condition for awipe met
			if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint){ // 2nd condition for horizontal swipe met
				swipedir = (distX < 0)? 'left' : 'right'; // if dist traveled is negative, it indicates left swipe
			}
			else if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint){ // 2nd condition for vertical swipe met
				swipedir = (distY < 0)? 'up' : 'down'; // if dist traveled is negative, it indicates up swipe
			}
		}
		handleswipe(swipedir);
		//e.preventDefault()
		e.stopPropagation();
	}, false);
}

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
				alert('orientationchagne');
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
 * @ajaxMoreList(target, moreBtn, ajaxFunc);
 * 1. var ajaxHistoryBack = null; 전역변수 선언
 * 2. $(document).ready {} 객체생성 
 *   - ajaxHistoryBack = new AjaxHistoryBack(target, moreBtn, ajaxFunc);
 * 3. displayHtml 함수 끝부분에 추가 
 *   - ajaxHistoryBack.bindStateEl();
 */
var AjaxHistoryBack = function(target, moreBtn, ajaxFunc) {
	var self = this,
		linkEls = null,
		intv = null,
		targetcon = target,
		target = target + ' > li',
		moreBtn = moreBtn,
		ajaxFunc = ajaxFunc;

	window.addEventListener("popstate", retrieveData, false);
	if (window.history.state != null) {
		intv = window.setInterval(function() {
			if ($("#totCnt").val() > 0) {
				window.clearInterval(intv);
				if ($("#totCnt").val() > $(target).length) {
					$(moreBtn).show();
					page = Math.floor($(target).length/10)+1;
				};
			};
				
			if ($(target).length === 0) {				
				ajaxFunc(arguments);
			}
		}, 100);
	} else {
		ajaxFunc(arguments);
	};

	function clickHandler(event) {
		data = $(targetcon).html();
		var	context =  { container: data };
		history.pushState(context, 'TITLE');
	};

	function bindStateEl() {
		linkEls = $(target).find(' > a');
		for (var i = 0, l = linkEls.length; i < l; i++) {
			linkEls[i].addEventListener('click', clickHandler);
		};
	};
	
	function retrieveData(event) {
		var	state = event.state,
			context = event.state.container;
		$(targetcon).empty().append(context);
	};
	return {
		bindStateEl: function() {
			bindStateEl();	
		}
	};
}

//
// !!!!
//
