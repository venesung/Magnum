function cardRotate(){
	$(".mainBlock").css({"overflow":"hidden"});
	$(".RotateBlock").css({"overflow":""});
	$(".RotateBlock .boxBack").css({"display":"none"});
	TweenMax.to($(".RotateBlock .boxBack"), 0, {transformPerspective:1000,rotationY:180} );
	
	$(".boxFront .btnBlock a.detailBtn").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		var $front = $(this).parent().parent().parent().find(".boxFront");
		var $back = $(this).parent().parent().parent().find(".boxBack");			
		$front.css({"display":"none"});
		$back.css({"display":"block"});
		TweenMax.to($front, 0.4, {transformPerspective:1000, rotationY:-180} );
		TweenMax.to($back, 0.4, {transformPerspective:1000, rotationY:0, onComplete:rotateEnd} );
		function rotateEnd(){
			$front.css({"display":"none"});
		}			
	});
	
	$(".boxBack a.close").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		var $front =$(this).parent().parent().find(".boxFront");
		var $back = $(this).parent().parent().find(".boxBack");	
		$front.css({"display":"block"});
		$back.css({"display":"none"});
		TweenMax.to($front, 0.4, {transformPerspective:1000, rotationY:0, onComplete:rotateEnd} );
		TweenMax.to($back, 0.4, {transformPerspective:1000, rotationY:180} );
		function rotateEnd(){
			$back.css({"display":"none"});
		}
	});		
}

$(function()
{
	var con = $(".CardEvent");
	var currentEventNum = 0;
	var totalEventNum = $(".CardEvent li").length;
	var w;

	mainEventInit();
	cardMore();
	//cardRotate();
	$(window).resize ( batchEvent ).resize();
	
	function cardMore(){
		 $(".plusCard a.plusbtn").click(function(e){
			e.stopPropagation();
			e.preventDefault();
			if($(this).hasClass("plusclose")){
				$(this).parent().find(".plusSect").css({"display":"none"});
				$(this).removeClass("plusclose");
				$(this).text("연관 카드 더보기");				
			}else{
				$(this).parent().find(".plusSect").css({"display":"block"});
				$(this).addClass("plusclose");
				$(this).text("닫기");
				
			}
		});
		 cardDetail();
	}
	
	function cardDetail(){
		var target = $(".plusCard .plusSect > ul");
		$.each(target, function(index, value){
		var len = $(value).find("li").length;
		var twidth = 88 * len;
		var documentWidth, limit, slideArr=[]; 			
		$(window).resize ( cardresize ).resize();
		if(documentWidth > twidth) return;		
			
		//$(value).parent().css({"position":"relative","height":"113px"});		
		$(value).css({"position":"relative","width":twidth});
		
		function cardresize(){
			 documentWidth = document.documentElement.clientWidth;	
			 limit = twidth - (documentWidth-40);
			 if(documentWidth > twidth){
				 $(value).css({"-webkit-transform":"none"});
				 $(value).off();	 				 				 				
			 	return;
			 }else{
				 TweenMax.to($(value), 0.5, {x:5} );	
				 cardMakeSlider();		
			 }		 				 
		}
			
		function cardMakeSlider(){				
				if($(value).css("-webkit-transform") == "none"){		
					slideArr[index] = new mainSlider($(value), true );
					slideArr[index].moveEnd = function( dragFlag , disX , conX ){
						if ( disX == 0 ) return;
						moveCard();
					};
					
					function moveCard(){						
						var targetLeft = matrixToArray($(value).css("-webkit-transform"))[4];	
						if(targetLeft > 5){
							TweenMax.killAll();
							TweenMax.to($(value), 0.5, {x:5} );			
						}else if(targetLeft < -limit){
							TweenMax.killAll();
							TweenMax.to($(value), 0.5, {x:-limit} );
						}
						slideArr[index].scrollLockFlag(false);
					}
					var matrixToArray = function(str){
						return str.match(/(-?[0-9\.]+)/g);
					};	
				}
			
		}
		});
	}
	
	function mainEventInit()
	{
		eventslider = new mainSlider ( con.find("ul") , true );
		eventslider.moveEnd = function( dragFlag , disX , conX )
		{
			if ( disX == 0 ) return;
			if ( Math.abs ( disX ) > 60 )
			{
				if ( disX > 0 ) 
				{
					currentEventNum++;
				}
				else
				{
					currentEventNum--;
				}
			}
			moveEvent();
			eventBtnSet();
		};

		con.find(".btn a").click ( clickEventBtn );
		function clickEventBtn ( e )
		{
			e.preventDefault();
			var index = $(this).index();
			currentEventNum = index;
			moveEvent();
			eventBtnSet();
		}

		function eventBtnSet()
		{
			con.find(".btn a").each ( function ( i )
			{
				if ( i == currentEventNum )
				{
					$(this).find("img").attr ( "src" , "/images/mw/v1.0/main/btn_event_on.png" );
				}
				else
				{
					$(this).find("img").attr ( "src" , "/images/mw/v1.0/main/btn_event_off.png" );
				}

			} );
		}
	}

	function batchEvent()
	{
		w = $(window).width()+50;
		con.find(".btn").css ( { display:"block" } );
		con.css ( { overflow:"hidden" } );
		con.css ( { "margin-bottom" : "5px" } );
		con.find(">ul").css ( { left:0 , width:(w-70)*(totalEventNum-1)+(totalEventNum-1) } );
		con.find("li").each ( function ( i ){
			if(i > 0){
				$(this).css({"left":i*(w-70)+(i*1)+"px","width":(w-70)});
			}else{
				$(this).css({"left":i*(w-70)+"px","width":(w-70)});
			}
			$(this).find("img").css ( { width:w-70 } );
		} );
		con.find(".btn").css({"-webkit-backface-visibility":"hidden","-webkit-perspective":"1000"});	
		if (vers) {
	          if ( parseFloat(vers[1],10) < 4.3) {
	        	  con.find("img").css({"-webkit-transform":"translateZ(0)"});  	  
	          };
	     };
		var height = ( w-70 ) * ( 335 / 718 );
		con.css ( { height:height } );
		moveEvent(0);
	}

	function moveEvent( duration )
	{
		var dura = duration == 0 ? 0 :0.3;
		if ( currentEventNum < 0 ) currentEventNum = 0;
		if ( currentEventNum > totalEventNum-1 ) currentEventNum = totalEventNum-1;
		var tx ;
		if(currentEventNum > 0){
			tx = -((currentEventNum) *( w - 70)+(currentEventNum*1));
		}else{
			tx = -((currentEventNum) * (w - 70));	
		}
		TweenMax.to(con.find("ul") , dura, {x:tx, ease:"easeOutSine"} );
	}
} );