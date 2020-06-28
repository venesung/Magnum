//@author mvint-wssoo
function RecruitMain()
{	
	this.mainGnb();
}


RecruitMain.prototype.mainGnb = function () {
	
	var $board = $('.snb');
	var $gnb = $('.gnb ul');
	var $out = $('.recruit_visual');
	var gStatus = false;
	$board.css({top: '-233px'});
	
	$gnb.mouseenter(function(e) { if (gStatus == false){toggleMenu();} });
	$out.mouseenter(function(e) { if (gStatus == true){toggleMenu();} });

	function toggleMenu (e) {

		if (gStatus == true) {
			gStatus = false;
			$board.animate({ top: '-233px' }, {queue:false, duration: 500, easing:'easeOutExpo' } );

		} else if (gStatus == false) {
			gStatus = true;
			$board.animate({ top: '0px' }, {queue:false, duration: 500, easing:'easeOutExpo' } );
		}
	}
}

