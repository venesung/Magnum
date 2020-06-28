// crazybart
// 2012-06-04

var shTemp = null;

function shicmisc()
{	
	this.boxCover();	
	this.closeLayer();	
	this.topTab();
	this.kospi();
	this.compareStock();
	
}

shicmisc.prototype.boxCover = function () {

    var $boxCover = $('.bCover');
    
	setTimeout(function(){
		
		$boxCover.animate({ opacity : 0 }, {queue:false, duration: 1000, easing:'easeOutCubic', complete:onComp } );
			
		},500); 
	   
	   //clearTimeout(interval);
                                          
              
    function onComp () {
                                
    	$boxCover.remove();
	
	}
	
}

shicmisc.prototype.closeLayer = function () {

	$closeBtn = $('.type_title .nb4');
	$closeBtn.click(function(e) {

	var pr = parent.document;

	$('.tempBox', pr).remove();
	$('#SkipToContents', pr).css({height:''});
	$('.LeftArea', pr).css({height:''});

	});
	
}

shicmisc.prototype.topTab = function () {

	var $status = false;
	var $isOnMotion = false;
	var $btn = $('.ranking_view .btn');
	var $view = $('.ranking_view');
	
	$btn.css({outline: 0});
	
	$btn.click(function(e) {
		
		if ($isOnMotion == true) {return};
		if ($status == false) {
			
			$view.css({top:-208});
			$view.find('.con_box').show();
			$view.animate({ top : 0 }, {queue:false, duration: 500, easing:'easeOutQuint', complete:onCompOpenning } );	
		
		} else {
			
			$view.animate({ top : -208 }, {queue:false, duration: 500, easing:'easeOutQuint', complete:onCompClosing } );	
				
		}

		$isOnMotion = true;
		
	});
	
	function onCompOpenning() {
		$isOnMotion = false;
		$status = true;	
	};
	
	function onCompClosing() {
		$isOnMotion = false;
		$status = false;
		
		$view.find('.con_box').hide();
		$view.css({top:0});
	}
	
}

shicmisc.prototype.kospi = function () {
	
	var $udArrs = $('.type_kospi_rol .btns a');
	var $kkCon = $('.type_kospi_rol');
	var $kitems;
	
	$udArrs.click(function(e) {
		
		var dir = $(this).find('img').attr('alt');
		$kitems = $('.type_kospi_rol dl');
		
		if (dir == "¿Ã¿¸") {
						
			$kitems.attr('id','');
			var tempi = $kitems.eq(-1).attr('id','kmove');
			
			$('#kmove').prependTo($kkCon);
		
		} else {
			
			$kitems.attr('id','');
			var tempi = $kitems.eq(0).attr('id','kmove');
			
			$('#kmove').appendTo($kkCon);
			
		}
	});
	
}

shicmisc.prototype.compareStock = function () {
	
	var $lrArrs = $('.type_business .prev, .type_business .next');
	var $compareCon = $('.type_business ul');
	var $cpitems;
	
	$lrArrs.click(function(e) {
		
		var dir = $(this).attr('class');	
		$cpitems = $('.type_business div ul li');
		
		if (dir == "prev")
		
		{
			$cpitems.attr('id','');
			var tempi = $cpitems.eq(-1).attr('id','cmove');
			
			$('#cmove').prependTo($compareCon);
			
		
		} else {
			
			$cpitems.attr('id','');
			var tempi = $cpitems.eq(0).attr('id','cmove');
			
			$('#cmove').appendTo($compareCon);
			
		}
	});
	
}
