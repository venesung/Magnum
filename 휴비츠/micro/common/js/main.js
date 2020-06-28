function Main()
{	
	
	this.mainGnb();
	this.mainVisual();

}

Main.prototype.mainGnb = function () {
	
	var $board = $('.snb');
	var $gnb = $('.gnb ul');
	var $out = $('.visual');
	var gStatus = false;
	$board.css({top: '-130px'});
	
	$gnb.mouseenter(function(e) { if (gStatus == false){toggleMenu();} });
	$out.mouseenter(function(e) { if (gStatus == true){toggleMenu();} });

	function toggleMenu (e) {

		if (gStatus == true) {
			gStatus = false;
			$board.animate({ top: '-130px' }, {queue:false, duration: 500, easing:'easeOutExpo' } );

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
