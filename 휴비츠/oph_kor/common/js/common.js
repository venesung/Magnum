
/* footer_family */
function family(n){
  for(i=1;i<=2;i++){
	  if(i==n){
	  document.getElementById('family0'+n).style.display="block";
	  }else{
	  document.getElementById('family0'+i).style.display="none";
		}
	}
}

var moveto = '';
moveto += '<div class="compass">';
moveto += ' <ul>';
moveto += '		<li class="first"><a href="/kor/main/main.html">COMPANY INFO</a></li>';
moveto += '		<li class="on"><a href="/oph_kor/main/main.html">OPHTHALMIC &amp; OPTICAL</a></li>';
moveto += '		<li><a href="http://microscope.huvitz.com/kor/index.html">MICROSCOPE SYSTEM</a></li>';
moveto += '	</ul>';
moveto += '</div>';
moveto += '<div class="clear"></div>';








var gnb = '';
gnb += '<div class="gnb">';
gnb += '				<ul class="nb1">';
gnb += '					<li>';
gnb += '						<strong><a href="/oph_kor/product/HRK-8000a.html">REFRACTIVE</a></strong><!-- 선택 : class="on"추가 -->';

gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="/oph_kor/product/HRK-8000a.html">Auto Ref-Keratometer</a></li><!-- 선택 : class="on"추가 -->';
gnb += '								<li><a href="/oph_kor/product/HLM-7000.html">Auto Lensmeter</a></li>';
gnb += '							    <li><a href="/oph_kor/product/HDR-7000.html">Digital Refractor</a></li>';
gnb += '								<li><a href="/oph_kor/product/HDC-9000N.html">Chart Projector</a></li>';
gnb += '							    <li><a href="/oph_kor/product/HRT-7000.html">Unit Table</a></li>';
gnb += '							</ul>';				
gnb += '						</div>';
gnb += '						<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '					<li><strong><a href="/oph_kor/product/HS-7000.html">DIAGNOSTIC</a></strong>';
gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="/oph_kor/product/HS-7000.html">Slitlamp</a></li>';
gnb += '								<li><a href="/oph_kor/product/HNT-7000.html">Non-contact Tonometer</a></li>';
gnb += '								<li><a href="/oph_kor/product/HT-5000.html">Applanation Tonometer</a></li>';
gnb += '							</ul>';				
gnb += '						</div>';
gnb += '						<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '					<li><strong class="last"><a href="/oph_kor/product/HPE-8000.html">EDGING SOLUTION</a></strong>';
gnb += '					<!-- sub_navigation -->';
gnb += '						<div class="snb snb2" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li class="tab1">';
gnb += '                           		<a href="/oph_kor/product/HPE-8000.html" class="on">By Series</a>';
gnb += '                           		</li>';
gnb += '                           		<li class="snb3 open">';
gnb += '                        			<ul>';
gnb += '										<li><a href="/oph_kor/product/HPE-8000.html">Kaizer Series </a></li>';				
gnb += '										<li><a href="/oph_kor/product/HPE-7000.html">Excelon XD/XQ</a></li>';
gnb += '										<li><a href="/oph_kor/product/CPE-4000.html">Excelon</a></li>';
gnb += '										<li><a href="/oph_kor/product/CPE-3000.html">Excelon EZ</a></li>';
gnb += '              							<li><a href="/oph_kor/product/remoteedging.html">Remote Edging Solution</a></li>';
gnb += '									</ul>';
gnb += '								</li>';
gnb += '								<li class="tab2"><a href="/oph_kor/product/p_HPE-8000.html">By Product Usage</a></li>';
gnb += '								<li class="snb3">';
gnb += '							 		<ul>';
gnb += '							 			<li><a href="/oph_kor/product/p_HPE-8000.html">Edger</a></li>';
gnb += '							   			<li><a href="/oph_kor/product/p_HFR-8000.html">Frame Reader</a></li>';
gnb += '							  			<li><a href="/oph_kor/product/p_HAB-8000.html">Auto-Blocker with Frame Reader</a></li>';
gnb += '						  				<li><a href="/oph_kor/product/p_HMB-8000.html">Blocker</a></li>';
gnb += '						  				<li><a href="/oph_kor/product/p_HDM-8000.html">Drilling Machine</a></li>';
gnb += '									</ul>';				
gnb += '								</li>';
gnb += '							</ul>';
gnb += '						</div>';
gnb += '           <!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '				</ul>';
gnb += '				<ul class="nb2">';
gnb += '					<li>';
gnb += '						<strong class="on"><a href="/oph_kor/support/download.html">SUPPORT</a></strong>';
gnb += '                         <!-- sub_navigation -->';
gnb += '                         <div class="snb" style="display:;">';
gnb += '                         	<ul>';
gnb += '                         		<li class="on"><a href="/oph_kor/support/download.html">DOWNLOAD</a></li>';
gnb += '                         		<li><a href="/oph_kor/support/service.html">원격지원서비스</a></li>';
gnb += '                        		<li><a href="/oph_kor/support/faq.html">FAQ</a></li>';
gnb += '								<li><a href="/oph_kor/support/counsel_list.html">1:1온라인 상담</a></li>';				
gnb += '							</ul>';
gnb += '						</div>';
gnb += '			<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '				</ul>';
gnb += '			</div>';
gnb += '				<!--/ gnb -->';
gnb += '	<ul class="util">';
gnb += '		<li><a href="/oph_kor/etc/sitemap.html">SITEMAP</a></li>';
gnb += '		<li><a href="/oph_kor/etc/location.html">CONTACT US</a></li>';
gnb += '		<li><a href="/oph_eng/main/main.html">ENGLISH</a></li>';
gnb += '	</ul>';


var footer = '';
footer += '<div id="footer">';
footer += '			<div class="logo"><img src="../img/footer/footer_logo.gif" alt="Huvitz" /></div>';
			
footer += '			<div class="info">';
footer += '				<p><span>A. 경기도 군포시 금정동  689-3 (주)휴비츠</span><span>T. 031-428-9100</span></p>';
footer += '				<p>Copyright 2008 Huvitz Corp. All rights reserved</p>';
footer += '			</div>';
footer += '            <ul class="link">';
footer += '				<li><a href="/oph_kor/support/privacy.html">개인정보 취급방침</a><span>|</span></li>';
footer += '				<li><a href="/oph_kor/support/terms.html">이용약관</a></li>';
footer += '			</ul>';
footer += '		</div>';





/* footer_family */
function family(n){
  for(i=1;i<=2;i++){
	  if(i==n){
	  document.getElementById('family0'+n).style.display="block";
	  }else{
	  document.getElementById('family0'+i).style.display="none";
		}
	}
}

function popLook(){
	divPopupOpen(800, 720, '/oph_kor/etc/lookaround.html','',1000);
}

function popProduct(product, model){
	model = encodeURIComponent(model);
	window.open("/oph_kor/support/pop_counsel.html?product="+product+"&model="+model,"제품문의","width=660,height=720,scrollbars=yes");
}

function download(filename){
	if(filename == ""){
		alert("파일이 없습니다.");
		return;
	}
	location.href = "/common/include/download.php?filename="+filename;
}

function popUpright(){
	divPopupOpen(360, 442, '/oph_kor/upright/pop_upright.html','',1000);
	//window.open("/eng/upright/pop_upright.html","","width=360,height=442");
}

function popService(){
	divPopupOpen(438, 490, '/oph_kor/support/pop_service.html','',1000);
	//window.open("/eng/upright/pop_upright.html","","width=360,height=442");
}


/* div 팝업 열기 */
/*
 *  w 		: 넓이
 *  h 		: 높이
 *  url 	: 경로
 *  valign 	: "top" 일경우 상단에 붙음
 *  speed 	: 등장모션 속도 ex) 1000(1초)
 */
function divPopupOpen(w, h, url, valign, speed) {
	if ($.browser.msie && $.browser.version == '6.0'){
		var htmlHeight = $('html').css('height'); //string : 0px
		var bodyHeight = $('body').css('height'); //string : 0px
		$('html body').css({	'height': '100%' });
	}
	
	var $backgroundDiv = $('<div id="wBgDiv"></div>').appendTo('body');
	$backgroundDiv.css({	'backgroundColor': '#000000',
							'opacity' : '0.6',
							'width' : '100%',
							'height' : '100%',
							'left' : '0',
							'top' : '0',
							'position' : 'absolute',
							'zIndex' : '99988',
							'display' : 'none'
						});
						
	var $containerDiv = $('<div id="wcontDiv"></div>').appendTo('body');
	$containerDiv.css({		'width' : w,
							'height' : h,
							'left' : '0',
							'top' : '0',
							'position' : 'absolute',
							'zIndex' : '99989',
							'display' : 'none'
						});
	var $iframe = $('<iframe frameborder=0 scrolling="no"></iframe>').appendTo($containerDiv);
	$iframe.attr({	'width' : w,
					'height' : h,
					'allowtransparency' : 'true',
					'src' : url
				});
				
	 // 윈도우 화면 사이즈 구하기
    var winH = $(window).height();
    var winW = $(window).width();
 
    // 스크롤 높이 구하기
    var _y =(window.pageYOffset) ? window.pageYOffset
    : (document.documentElement && document.documentElement.scrollTop) ? document.documentElement.scrollTop
    : (document.body) ? document.body.scrollTop
    : 0;
 
    if(_y<1){
    var wh = winH/2;
    }else{
    var wh = winH/2+_y;
    }
	//리사이즈시
	$(window).resize(function() {
		$containerDiv.css('left', ($(document).width() - w) / 2);
		if(valign != 'top'){
			$containerDiv.css('top', wh-(h/2));
		}	
		
		//스크롤링시 변경된 바탕 크기 다시 복귀
		$backgroundDiv.css('width', '100%');
		$backgroundDiv.css('height', '100%');
	});
	$(window).trigger('resize');
	
	//스크롤링시 바탕 크기 맞힘
	$(window).scroll(function() {
		$backgroundDiv.css('width', $('html')[0].scrollWidth);
		$backgroundDiv.css('height', $('html')[0].scrollHeight);
	});
	$(window).trigger('scroll');
	//등장모션
	if(speed == undefined)speed = 0;
	$backgroundDiv.fadeIn(speed);
	$containerDiv.fadeIn(0);
}

/* div 팝업 닫기 */
/*
 * speend : 아웃모션 속도
 */
function divPopupClose(speed){
	var $backgroundDiv = $('#wBgDiv',parent.document);
	var $containerDiv = $('#wcontDiv',parent.document);
	
	//아웃모션
	if(speed == undefined)speed = 0;
	$containerDiv.fadeOut(0);
	$backgroundDiv.fadeOut(speed, function(){
		$backgroundDiv.remove();
		$containerDiv.remove();
	});
}
