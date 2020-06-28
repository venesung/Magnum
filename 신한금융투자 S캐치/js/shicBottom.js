// crazybart
// 2012-06-29

var sHeight = $(window).height();
var sWidth = $(window).width();

function shicBottom()
{	
			
	this.bottom();
	                     
}


shicBottom.prototype.bottom = function () {
	
	var bottomTimer;
	var idx = 0;
	 
	var $layer = $('.moveLayer');
	var $layerCon = $('.mContainer');
	var $layerTop = $('.mHeader');
	var $topCon = $('.mContent');
	var $thumb = $('.mNb li');
	var $detail = $('.mContainer').children('div:not(.ClearBlock)');
	
	var $toggler = $('.btnDwon');
	
	var status = false;
	var dHeight = 245;
	
	
	bottomTimer = setInterval( titleTimer, 5000);
	
	function resetTimer() { bottomTimer = setInterval( titleTimer, 5000); }	
		
	function titleTimer() {
		
		( idx == 3 ) ? idx = 0 : idx++ ; 
		changeTop(idx);	
	};
	
	$layerCon.hide();
	init();
	updateScreen();
	
	$(window).resize(function(){

		sHeight = $(window).height();
		sWidth = $(window).width();

		updateScreen();
		
	});

	$layer.mouseenter(function(e){
		if (status == true) { 
		} else {
			window.clearInterval(bottomTimer);
		};		
	}).mouseleave(function(e){
		if (status == false) { resetTimer();}; 
	});
	
	
	function init() {
		
		$thumb.removeClass('on');
		$thumb.eq(0).addClass('on');
		
		$thumb.find('img').removeClass('on');
		$thumb.eq(0).find('img').addClass('on');
		
		updateImg2over();
		
		$topCon.hide();
		$topCon.eq(0).show();
			
	}	
		
	function updateScreen() {
		
		var wHeight;
		
		(status == false) ?	wHeight = '' : wHeight = sHeight-dHeight;
		
		$layer.css({top:wHeight});
		
		if (sWidth < 1186) {
			$layerTop.css({width:1185});
			$layerCon.css({width:1185});	
		} else {
			$layerTop.css({width:''});
			$layerCon.css({width:''});	
		}
		
	};
	
	function changeTop(idx) {

		updateImg2over();
		updateConStat(); 
		
	};
	
	function changeCon(idx) {
		
		updateImg2on();
		updateConStat(); 
		
		$detail.hide();
		$detail.eq(idx).show();	
			
	};
	
	// 선택된 상단 컨텐츠 상태변경
	function updateConStat() {
		
		$thumb.removeClass('on');
		$thumb.eq(idx).addClass('on');
		
		$thumb.find('img').removeClass('on');
		$thumb.eq(idx).find('img').addClass('on');
		
		$topCon.hide();
		$topCon.eq(idx).show();
			
	};
	
	// 선택된 상단 썸네일을 ROLLOVER 상태로
	function updateImg2over() {
		
		for (var i=0; i<4; i++) {
			
			if (i == idx) {
				$thumb.eq(idx).find('img').attr('src','../img/movelayer/nb_0'+(idx+1)+'_over.gif');
			} else {
				$thumb.eq(i).find('img').attr('src','../img/movelayer/nb_0'+(i+1)+'_off.gif');
			}			
		}
			
	};
	
	// 선택된 상단 썸네일을 ON 상태로
	function updateImg2on() {
		
		for (var i=0; i<4; i++) {
			
			if (i == idx) {
				$thumb.eq(idx).find('img').attr('src','../img/movelayer/nb_0'+(idx+1)+'_on.gif');
			} else {
				$thumb.eq(i).find('img').attr('src','../img/movelayer/nb_0'+(i+1)+'_off.gif');
			}			
		}
			
	}
	
	$thumb.click(function(e){
		
		e.preventDefault();
		
		idx = $(this).index();
		
		if (status == false) { toggleWin();};

		changeCon(idx);
	
	});
	
	$toggler.click(function(e) {
		
		toggleWin();
		

	});
	
	
	// 하단 창 열고 닫기
	function toggleWin() {
		
		if (status == false) {
			
			window.clearInterval(bottomTimer);
			
			$toggler.find('img').attr('src','../img/movelayer/btn_down.gif');
			updateImg2on();
			$layer.css({top:sHeight-dHeight});
			$layerCon.show();	
				
		} else {
			
			$toggler.find('img').attr('src','../img/movelayer/btn_up.gif');
			updateImg2over();
			$layer.css({top:''});
			$layerCon.hide();	
			
		};
		
		(status == false) ? status = true : status = false ;
		
	}
	
	
	
	// 최근조회종목
	
	var $lrArrs = $('.btn .prev, .btn .next');
	var $con01listCon = $('.mCon1 .l_Area ul');
	var $listEl = $('.mCon1 .l_Area ul li');	
	
	$lrArrs.click(function(e) {

		var dir = $(this).attr('class');	
		
		$listEl = $('.mCon1 .l_Area ul li');

		if (dir == "prev")
		
		{
			$listEl.attr('id','');
			var tempi = $listEl.eq(-1).attr('id','cmove');
			
			$('#cmove').prependTo($con01listCon);
			
		
		} else {
			
			$listEl.attr('id','');
			var tempi = $listEl.eq(0).attr('id','cmove');
			
			$('#cmove').appendTo($con01listCon);
			
		}
		
		$listEl = $('.mCon1 .l_Area ul li');
	});
	
	$listEl.click(function(e){
		
		var cidx = $(this).index();
		$listEl.removeClass('on')
		$listEl.eq(cidx).addClass('on')
		
	});
	
	
	// 관심달인
	
	var $tlrArrs = $('.master2 .btn .prev, .master2 .btn .next');
	var $con02listCon = $('.master2 .l_Area ul');
	var $thumEl = $('.master2 .l_Area ul li');
	
	$tlrArrs.click(function(e){
		
		var dir = $(this).attr('class');	

		
		if (dir == "prev")
		
		{
			$thumEl.attr('id','');
			var tempi = $thumEl.eq(-1).attr('id','tmove');
			
			$('#tmove').prependTo($con02listCon);
			
		
		} else {
			
			$thumEl.attr('id','');
			var tempi = $thumEl.eq(0).attr('id','tmove');
			
			$('#tmove').appendTo($con02listCon);
			
		}
		
		$thumEl = $('.master2 .l_Area ul li');
	
	});
	
	$thumEl.click(function(e){
		
		var cidx = $(this).index();
		$thumEl.removeClass('on')
		$thumEl.eq(cidx).addClass('on')
		
	});
			
}