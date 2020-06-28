var cookieName = 'korCookieData';
var cookieOption = { path:'/oph_kor', domain:'www2.huvitz.com', expires: 10};
//var cookieOption = { path:'/project/huvitz/optic', domain:'webc.magnumvint.com', expires: 10};
var cookieValue = $.cookie(cookieName);
var urlName1 = '../product/HPE-8000.html';	
var urlName2 = '../product/p_HPE-8000.html';

function Main()
{	
	this.mainGnb();
	this.mainVisual();
	this.treeDepthOpen();
}

Main.prototype.treeDepthOpen = function() {
	var $edingSolution = $('.gnb').find('.nb1 > li').eq(2).find('a');
		
	$('.snb2').find('li').removeClass();	
	
	$('.snb3').removeClass();
		
	if( cookieValue != null){
		if( cookieValue == "2_1"){
			$('.snb2').find('li').eq(0).addClass('on');
			$('.snb2').find('li').eq(1).addClass('last');
			seriesOperate();
		}else{
			$('.snb2').find('li').eq(1).addClass('last on');
			puOperate();
		}
	}else{
		$('.snb2').find('li').eq(0).addClass('on');
		$('.snb2').find('li').eq(1).addClass('last');
		seriesOperate();
	}
	
	$('.snb2').find('li').eq(0).click(function (e){
		defaultSnb2();
		$(this).addClass('on');
		seriesOperate();
		$.cookie(cookieName, "2_1", cookieOption);
		checkEdingSolutionURL("2_1");
	});
	
	$('.snb2').find('li').eq(1).click(function (e){
		 defaultSnb2();
		 $(this).addClass('last on');
		 puOperate();
		 $.cookie(cookieName, "2_2", cookieOption);
		 checkEdingSolutionURL("2_2");
	});
	
	function defaultSnb2(){
		$('.snb2').find('li').removeClass();
		$('.snb2').find('li').eq(1).addClass('last');
		
		$('.snb ul').eq(3).removeClass();
		$('.snb ul').eq(4).removeClass();
	}
	
	function seriesOperate(){
		$('.snb ul').eq(3).addClass('snb3 on');
		$('.snb ul').eq(4).addClass('snb3');
	}
	
	function puOperate(){
		$('.snb ul').eq(3).addClass('snb3');
		$('.snb ul').eq(4).addClass('snb3 on');
	}
	
	function checkEdingSolutionURL(urlIndex){
		if(cookieValue != null){
			if(urlIndex == '2_1') {
				$edingSolution.attr('href', urlName1);
			}else{
				$edingSolution.attr('href', urlName2);	
			}	
		}else{
			$edingSolution.attr('href', urlName1);
		}
	}
}


Main.prototype.mainGnb = function () {
	var $edingSolution = $('.gnb').find('.nb1 > li').eq(2).find('a');
	var $board = $('.snb');
	var $gnb = $('.gnb ul');
	var $out = $('.visual');
	var gStatus = false;
		
	if(cookieValue != null){
		if(cookieValue == '2_1'){
			$edingSolution.attr('href', urlName1);	
		}else{
			$edingSolution.attr('href', urlName2);
		}
	}else{
		$edingSolution.attr('href', urlName1);
	}
	
	$board.css({top: '-172px'});
	
	$gnb.mouseenter(function(e) { if (gStatus == false){toggleMenu();} });
	$out.mouseenter(function(e) { if (gStatus == true){toggleMenu();} });

	function toggleMenu (e) {

		if (gStatus == true) {
			gStatus = false;
			$board.animate({ top: '-172px' }, {queue:false, duration: 500, easing:'easeOutExpo' } );

		} else if (gStatus == false) {
			gStatus = true;
			$board.animate({ top: '0px' }, {queue:false, duration: 500, easing:'easeOutExpo' } );

		}
	}

}

Main.prototype.mainVisual = function () {
	
	var cid = 0;
	var aid;
	var $img = $('.visual ul li');
	var tn = $('.visual ul li').length;
	var $pArr = $('.img_prev');
	var $nArr = $('.img_next');
	var $dot = $('.numlist a');
	var visualTimer;

	$pArr.hide();
	
	visualTimer = setInterval( changeCon, 5000); 
	function resetTimer() {	visualTimer = setInterval( changeCon, 5000); }

	$('.visual div').mouseenter(function(e) { window.clearInterval(visualTimer); });
	$('.visual div').mouseleave(function(e){ resetTimer(); });

	$pArr.click(function(e){
		( cid == 0 ) ? cid = 0 : cid-- ;
		aid = cid;
		changeCon(aid);
	});

	$nArr.click(function(e){
		( cid == (tn-1) ) ? cid = 0 : cid++ ;
		aid = cid;
		changeCon(aid);
	});

	$dot.click(function(e){

		idx = $(this).index();
		cid = idx;

		changeCon(cid);

	});

	function changeCon (aid) {
		
		if (aid == undefined || aid == null) { ( cid == (tn-1) ) ? cid = 0 : cid++ ; } 

		$('.numlist').find('img').attr('src','../img/product/num.gif');
		$dot.eq(cid).children().attr('src','../img/product/num_on.gif');
		
		$pArr.show();
		$nArr.show();

		if (cid == 0) {
			$pArr.hide();
		} else if (cid == 2) {
			$nArr.hide();
		} 

		chageImg();

	}

	function chageImg () {

		$img.hide();
		$img.eq(cid).show().css({opacity:0}).animate({opacity:1}, {queue:false, duration: 1000, easing:'easeOutExpo' } );
	}

}
