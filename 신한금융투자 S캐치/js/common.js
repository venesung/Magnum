// 라디오버튼, 체크박스 이미지화 Start

function setupLabel() {
	if ($('.label_check input').length) {
		$('.label_check').each(function(){ 
			$(this).removeClass('c_on');
		});
		$('.label_check input:checked').each(function(){ 
			$(this).parent('label').addClass('c_on');
		});                
	};
	if ($('.label_radio input').length) {
		$('.label_radio').each(function(){ 
			$(this).removeClass('r_on');
		});
		$('.label_radio input:checked').each(function(){ 
			$(this).parent('label').addClass('r_on');
		});
	};
};
$(document).ready(function(){
	$('body').addClass('has-js');
	$('.label_check, .label_radio').click(function(){
		setupLabel();
	});
	setupLabel(); 
	
	// 좌측배경 반복
	var cHeight = $(".RightArea").innerHeight();
	//alert(cHeight)
	$(".LeftArea").css("height", cHeight + "px")
});
// 라디오버튼, 체크박스 이미지화 End


/* 좌측배경 반복 */
$(window).resize(function() {
	var cHeight = $(".RightArea").innerHeight();
	$(".LeftArea").css("height", cHeight + "px")
});

/* 화면 좌측 이동 */
function slideLeft(){
	$(".RightArea").stop().animate({left: '0'},1000);
	$(".slideLayout2").show()
};
function slideRight(){
	$(".RightArea").stop().animate({left: '160px'},1000);
	$(".slideLayout2").hide();
};

/* 차트보기 */
function showChart() {
	$(".chartView").toggle();
}

/* Footer */
function showFooter(str) {
	$("#" + str).toggle();
}

/* 종목 상세 뉴스 공시 탭 */
function showTotalLayer(str,num){
	for(i=1; i< 3; i++) {
		$("#Btn" + str + "Tab" + i).attr("src", "../img/type/tab_" + str + "_0" + i + "_off.gif");
		$("#" + str + "Tab_" + i).css("top","-9999px");
	}
	$("#Btn" + str + "Tab" + num).attr("src", "../img/type/tab_" + str + "_0" + num + "_on.gif");
	$("#" + str + "Tab_" + num).css("top","0px");
}

/* 검색보기 */
function showSearch(obj) {
		//console.log(obj.src)
		if(document.getElementById("HiddenSearch").style.display == "none") {
			$("#HiddenSearch").slideDown();
			obj.src = "../img/button/search_open_01.gif"
		} else {
			$("#HiddenSearch").slideUp();	
			obj.src = "../img/button/search_close_01.gif"
		}
}

/* 탭 오버 */
$(document).ready(function(){
	$("#OverTabType img").mouseover(function() {
		//console.log($(this).hasClass("on"))
		var imgback = $(this).attr("src");
		if(!$(this).hasClass("on")) {
				//console.log(imgback.substring(0,imgback.lastIndexOf('_')) + '_over.' + imgback.substring(imgback.lastIndexOf('.') + 1))
			
			$(this).attr("src",imgback.substring(0,imgback.lastIndexOf('_')) + '_over.' + imgback.substring(imgback.lastIndexOf('.') + 1))
			//alert($(this).attr("src"))	
		}
	});
	$("#OverTabType img").mouseout(function() {
		//console.log($(this).attr("src"))
		var imgback = $(this).attr("src");
		if(!$(this).hasClass("on")) {
			$(this).attr("src",imgback.substring(0,imgback.lastIndexOf('_')) + '_off.' + imgback.substring(imgback.lastIndexOf('.') + 1))
		}
	});
});

/* input Border 변경 */
function chBorder(obj) {
	obj.style.borderColor = "#000"
}

// Flash Load
function flash(flashid, flashfilename, flashwidth, flashheight, flashvars, flashtrans) {
	document.write('<object id="' + flashid + '" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+ flashwidth +'" height="'+ flashheight +'">');
	document.write('<param name="allowScriptAccess" value="always" />');
	document.write('<param name="movie" value="'+ flashfilename +'">');
	if (flashvars) document.write('<param name="flashVars" value="'+ flashvars +'">');
	document.write('<param name="wmode" value="' + flashtrans + '">');
	document.write('<embed wmode="' + flashtrans + '" name="' + flashid + '"');
	if (flashvars) document.write(' flashVars="'+ flashvars +'" ');
	document.write(' src="'+ flashfilename +'" width="'+ flashwidth +'" height="'+ flashheight +'" ');
	document.write(' allowScriptAccess="always" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" >');
	document.write('</embed>');
	document.write('</object>');
}

/* 왕초보 주식 시작하기 플래시 로드 */
function chUrlAni(num) {
	for(i=1;i<6;i++) {
		document.getElementById("BtnAni" + i).src = "../img/edu/tab_ani_0" + i + "_off.gif";
	}
	
	document.getElementById("BtnAni" + num).src = "../img/edu/tab_ani_0" + num + "_on.gif";
	document.getElementById("iframe_Ani").src = "iframe_ani_" + num + ".html";
}

/*
	팝업
	pURL : 파일경로
	pName : 팝업창 이름
	pWidth : 팝업 가로사이즈
	pHeight : 팝업 세로사이즈
	pScroll : 팝업 스크롤 여부
*/
function popOpen(pURL, pName, pWidth, pHeight, pScroll) {
  if(pScroll == "1") {
	  	pWidth = eval(pWidth + 17);
  }
  var int_windowLeft = (screen.width - pWidth) / 2;
  var int_windowTop = (screen.height - pHeight) / 2;
  var str_windowProperties = 'height=' + pHeight + ', width=' + pWidth + ',top=' + int_windowTop + ', left=' + int_windowLeft + ', scrollbars=' + pScroll + ',resizable=0, menubar=0, toolbar=0, location=0, statusbar=0, fullscreen=0';
  var obj_window = window.open(pURL, pName, str_windowProperties)
    //if (parseInt(navigator.appVersion) >= 4) {
    //  obj_window.window.focus();
   // }
}

/* 놀부재테크 */
function showComic(num) {
	for(i=1;i<6;i++) {
		document.getElementById("BtnComic" + i).src = "../img/edu/btn_comic_0" + i + "_off.gif";
		$("#ListComic" + i).attr("style","height:40px");
		$("#BtnComic" + i).removeClass("on");
	}
	document.getElementById("BtnComic" + num).src = "../img/edu/btn_comic_0" + num + "_on.gif";
	$("#BtnComic" + num).addClass("on");
	$("#ListComic" + num).attr("style","height:auto");
}

/* FAQ */
function showFaq(num) {
	$("dl.Faq dd:eq(" + num + ")").slideToggle();
}

/* Top 버튼 */
$(document).ready(function(){

	// hide #back-top first
	$("#back-top").hide();
	
	// fade in #back-top
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		$('#back-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});

});
