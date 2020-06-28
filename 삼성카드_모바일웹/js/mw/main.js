$(function()
{
	window.scrollTo(0,1);
	mainControl();
	banner($(".HomeEvent"));
	banner($(".m_homebanner"));
} );


var mainControl = function(){
    if($(".mainWrap").length < 1){ return;}
    var currentMainNum = 0 , totalMainNum = 1, mainPaddingRight = 12*2, mainPaddingLeft = 8, mainPadding = 4;
    var mainslider, wWidth, reWidth, leftPos, isWidthOver;
	$(".maincontainer").css({"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});
	mainslider = new mainSlider( $(".maincontainer") , true );
	mainslider.moveEnd = function ( dragFlag , disX , conX )
	{
		
		if ( disX == 0 ) return;
		if ( Math.abs(disX) > 30 ){
			if ( disX > 0 ){
				currentMainNum++;				
			}else{
				currentMainNum--;
			}
		}
		moveMenu();
	};	
			
	mainslider.movIng = function ( dragFlag , disX , conX ){	
		if(isWidthOver == true){
			mainslider.scrollLockFlag(true);
		}else{		
		    if(currentMainNum == 1 && disX > 0){
		        mainslider.scrollLockFlag(true);
		    }else{
		       mainslider.scrollLockFlag(false);    
		    }
		}
	};		
	
	function moveMenu(duration){
		var dura = duration == 0 ? 0 : 0.3;
		if(currentMainNum > totalMainNum) {
			currentMainNum = totalMainNum;
		}
		
		if(currentMainNum < 0 ) {
			currentMainNum = 0;
		}
		var tx = -((currentMainNum) * (reWidth+mainPadding) );
		TweenMax.killAll();		
		TweenMax.to($(".maincontainer") , dura, {x:tx, ease:"easeOutSine", onComplete:animateComplete} );
	}	
	
	function animateComplete() {
		var hh = $(".mainCon0"+(currentMainNum+1)).height()+10;		
		$(".maincontainer").stop().css ( { height:hh } );		
		if(currentMainNum == 0){
			$(".btn_view.before").hide();
			$(".btn_view.next").show();
		}else{
			$(".btn_view.before").show();
			$(".btn_view.next").hide();
		}
		mainslider.scrollLockFlag(false);
	}

	
	$(window).resize ( resizeFn ).resize();
		
	
	function resizeFn ( e ){
		wWidth = $(window).width();
		reWidth = wWidth-mainPaddingRight;
		leftPos = wWidth-mainPaddingLeft;
		isWidthOver = (wWidth>=750) ? true : false;
		mainCssInit();
	}	
   
   
   $(".btn_view.before").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		$(".btn_view.before").hide();
   		$(".btn_view.next").show();
   		currentMainNum = 0;
   		moveMenu();
	});
	
   $(".btn_view.next").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		$(".btn_view.before").show();
   		$(".btn_view.next").hide();
   		currentMainNum = 1;
   		moveMenu();
	});
	
	function mainCssInit(){
		if(isWidthOver){			
			$(".maincontainer").css({"position":"relative","width": "100%","left":"","height":""});
			$(".mainCon01").css({"position":"relative","left":"","width":""});
			$(".mainCon02").css({"position":"relative","top":"","left": "","width":""});
 			$(".btn_view.before").hide();
   			$(".btn_view.next").hide();   	
   			TweenMax.to($(".maincontainer"), 0, {x:0} );
 		}else{ 	
			$(".maincontainer").css({"position":"relative","width": "100%"});
			$(".mainCon01").css({"position":"relative","left":0,"width":reWidth});
			$(".mainCon02").css({"position":"absolute","top":0,"left": leftPos,"width":reWidth});
			if(currentMainNum == 0){
				$(".btn_view.before").hide();
   				$(".btn_view.next").show();
			}else{
				$(".btn_view.before").show();
   				$(".btn_view.next").hide();
			}			
			moveMenu();
		}
	};

};
