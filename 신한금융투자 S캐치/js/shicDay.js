// crazybart
// 2012-06-25

function shicDay()
{
		 		 
	this.following();
	
}


shicDay.prototype.following = function () {
	
	var $arrs = $('.prev, .next');
	var $thumConS = $('.listBox ul');
	var $thumCell = $('.listBox ul li');
	var tlen = $thumCell.length;
	var $cNumOfList = 0; // 현재 페이지
	var $pNumOfList = Math.ceil(tlen / 5); // 총 페이지 수
	var isOnMotion = false; 
	var idx = 0;
	
	selectCP();
	
	$arrs.click(function(e){
		
		e.preventDefault();
		
		if (isOnMotion == true) { return; }
		
		var dir = $(this).attr('class');
		

		if (dir == "prev") {
			
			if ($cNumOfList == 0) { return; }
			
			$thumConS.animate({ left:-575*($cNumOfList-1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList--;
						
		} else {
			
			if ($cNumOfList == ($pNumOfList-1)) { return; }
			
			$thumConS.animate({ left:-575*($cNumOfList+1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList++;
			
		}
		
		idx = 5*$cNumOfList;
		isOnMotion = true;
		
	});
	
	$thumCell.click(function(){
		
		idx = $(this).index();
		
		selectCP();
		
	})
	
	function selectCP() {
		
		isOnMotion = false;
		 
		if ($pNumOfList < 2) { 

			$arrs.hide(); 
			
		} else {
			
			if ($cNumOfList == 0) {
				$('.prev').hide();
				$('.next').show();	
			} else if ($cNumOfList == ($pNumOfList-1)) {
				$('.prev').show();
				$('.next').hide();	
			} else {
				$arrs.show();
			}
			
		}
		
		$thumCell.removeClass('on');
		$thumCell.eq(idx).addClass('on');
		
		
	}
	
			
}