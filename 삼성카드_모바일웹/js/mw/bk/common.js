var rightMenuOpenFlag = false;
var menuXML;
var externalMenu;
var isTablet = (document.documentElement.clientWidth>=768) ? true : false;
var isApple = navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i);
var documentWidth = document.documentElement.clientWidth;
var documentHeight = document.documentElement.clientHeight;
var rightMenuPosArr = [];
isApple = false;


$(function(){
	
	$("#wrap").after ( "<div id='rightMenu'></div>");

	if ( externalMenu > 0){
		$("#header2").load ( "../shared/header" + externalMenu + ".html"  );	
		$("#footer2").load ( "../shared/footer2.html" );
	}else{
		loadMenuJsonData();
		$("#footer").load ( "../shared/footer.html" );
	}

	$(".pre_pop a").click ( function()	{
		Popup.Open ( $(".pre_popview") );
	} );

	topBtnControl();
	quickMenu();

} );

function quickMenu(){
	$(".quick > a").click(function(e){
		e.stopPropagation();
		e.preventDefault();
		if($(this).parent().hasClass("on")){
			$(this).parent().removeClass("on");	
			$(this).text("퀵메뉴 열림");
		}else{
			$(this).parent().addClass("on");
			$(this).text("퀵메뉴 닫힘");
		}		
	});
		
	/*$(window).resize(function(e){		
		if($(".quickscroll").getNiceScroll().length < 1){
			$(".quickscroll").niceScroll($(".quickscroll ul"),{touchbehavior:true});		
		}
	});*/	
	
}

function loadMenuJsonData(){
	$.ajax ( { url:"../xml/menu.json" , type:"get" , dataType:"json", success:subMenuLoadOk });
	
	function subMenuLoadOk( _xml )	{
		isJosn = true;
		menuXML = _xml.data.item;
		
		$("#header").load ( "../shared/header.html");	
		rightMenuInit();
	}
}

function rightMenuInit(){
	RightMenu.init();
}

function rightMenuOpen(){
	rightMenuResize();
	if ( rightMenuOpenFlag == false)	{
		
		$("#wrap").css({"height":documentHeight,"overflow":"hidden"});
		$("#rightMenu").css ( { display:"block" , "z-index":10 });
		$(".totladim").css({opacity:0});
		TweenMax.fromTo($("#rightMenu"), 0.3, {left:documentWidth},{left:0 , onComplete:rightMenuMotionEnd} );			
		
		if ($.fn.niceScroll !== undefined) $(".total_submn").niceScroll(".subcon",{touchbehavior:true,bouncescroll:false});			
		rightMenuPosReset();
		rightMenuScroll();
		
		function rightMenuMotionEnd ( e )
		{
			//$(".subcon > a ").focus();
			$(".totladim").css({opacity:0.8});
			//$(".total_submn .subcon").css({"overflow-y":"auto", "height":documentHeight});
			/*if ($.fn.niceScroll !== undefined) $(".total_submn").niceScroll(".subcon",{touchbehavior:true,bouncescroll:false});			
			rightMenuPosReset();
			rightMenuScroll();*/
		}
		
		$(window).resize(rightMenuResize);
		function rightMenuResize(){			
			documentWidth = document.documentElement.clientWidth;
			documentHeight = document.documentElement.clientHeight;		
			
			if ( rightMenuOpenFlag != false){
				$("#wrap").css({"height":documentHeight,"overflow":"hidden"});
			}else{				
				$("#wrap").css({"height":"100%","overflow":""});
			}
			//$(".total_submn .subcon").css({"overflow-y":"auto", "height":documentHeight});
			$(".total_submn").getNiceScroll().resize();
		}
		
	}else{
		$("#wrap").css({"height":"100%","overflow":""});
		$(".totladim").css({opacity:0});
		TweenMax.to($("#rightMenu"), 0.3, {left:documentWidth, onComplete:menuOpenEnd} );
	}
	
	function menuOpenEnd(){
		$("#rightMenu").css ( { display:"none" } );		
	}
	rightMenuOpenFlag = !rightMenuOpenFlag;

	
}

function rightMenuScroll(){
	$(".total_submn").getNiceScroll().resize();
	
	if (over1 !== undefined && over1 !== 0){
		if(over1 == 1){
			$(".total_submn").getNiceScroll().doScrollPos(0,0,0);
		}else{
			$(".total_submn").getNiceScroll().doScrollPos(0,rightMenuPosArr[over1 -2],0);
		}
	}
		
	$(".total_submn").scroll(function(){
	 	var scrollTop = $(".total_submn").scrollTop();	 
	 	$("ul.total_mn > li > a").removeClass("on");
	 	for (var i=0; i < rightMenuPosArr.length; i++ ){
			if(i == 0){
				if(between(scrollTop,0, rightMenuPosArr[i])){
					$("ul.total_mn > li:eq("+(i+1)+") > a").addClass("on");
				}
			}else{
				if(between(scrollTop, rightMenuPosArr[i-1], rightMenuPosArr[i])){
					$("ul.total_mn > li:eq("+(i+1)+") > a").addClass("on");
				}
			}
		}
		
	 });
	 
	 $(".total_submn").getNiceScroll()[0].scrollend(function(){
	 		
	 });
	
	 
	
	
	function between(x, min, max) {
	  return x >= min && x < max;
	}	
}

function rightMenuPosReset(){
	var mpos = $(".total_submn .subcon dl");
	rightMenuPosArr=[];
	$.each (mpos, function ( i ){
		if(i == 0){
			rightMenuPosArr.push($(mpos[i]).height()+36);
		}else{
			rightMenuPosArr.push(rightMenuPosArr[i-1] + $(mpos[i]).height() + 36);
		}
	});
}


// Layer Show/Hide
// strTabName : 탭이름 ex)tab_1
// strBlockName : 블록 이름 ex)layer_1
// strTotal : 총 블록 갯수
// strSelBlockNum : 선택된 블록 번호

function SHBlock(strTabName, strBlockName, strTotal, strSelBlockNum) {
			$('#allView').show(); //추가
           for(i=1;i<strTotal+1;i++) {
                     document.getElementById(strTabName+ "_" + i).className = "";
                     document.getElementById(strBlockName+ "_" + i).style.display = "none";
           }
                     
           document.getElementById(strTabName+ "_" + strSelBlockNum).className = "selected"; // class 명
           document.getElementById(strBlockName + "_" + strSelBlockNum).style.display = "block";          
}



var currentFocusObj = null;

var Popup = 
{
	Open : function ( con , focusTar )
	{
		currentFocusObj = focusTar;
//		focusTar.parent().css ( { opacity:0.3 });
		
		var modalDiv = '<div class="modalBg"></div>';
		$("body").append ( modalDiv );
		var h1 = $("#wrap").height();
		var h2 = $(window).height();
		var h3 = h1>h2 ? h1 : h2;
		$(".modalBg").css ( { height:h3 } );

		con.find(".btnClose").bind ( "click" , function ()
		{
			Popup.Close();
		} );

		var top = $(window).scrollTop();
		var w = $(window).width();
		var h1 = $(window).height();
		var h2 = con.height();
		var t = top + h1/2 - h2/2;
		if ( t < 0 ) t = 0;
		con.removeClass("modalContainer").addClass("modalContainer" ).css ( { position:"absolute" , left:-w , display:"block" , top:t , opacity:0 } );
		con.stop().animate ( { opacity:1 , left:0 } , { complete:popupMotionEnd });

		//$("html").addClass ( "htmlHighlightOff" );
		
		function popupMotionEnd()
		{
			var focusCon = con.find(".firstFocus");
			var focusText = focusCon.text();
			
			var focusText2 = '<a href="#" class="focusForced">' + focusText + '</a>';
			focusCon.html ( focusText2 );
			
			$(".______focusForced").focus();
			//focusCon.html ( focusText );  // 원상복귀
		}
	}
	,
	Close : function()
	{
		var w = $(window).width();
		$(".modalContainer .btnClose").unbind ( "click" );
		$(".modalContainer").stop().animate ( { left:-w , opacity:0 } , { duration:200 , complete:closeComplete } );

		function closeComplete()
		{
			setTimeout ( timeDelay , 1000 ); // 딜레이타임
			
			function timeDelay()
			{
				$(".modalContainer").css ( { display:"none" } );
				$(".modalBg").css ( { display:"none" } ).remove();
				currentFocusObj.focus();
			}
		}	
		//$("html").removeClass ( "htmlHighlightOff" );
	}

};

//무통장입금안내 <select> XML 로드
var Account = {
    loadXML : function (path, options)
    {
        var opts = options;
        
        $.ajax ( { url: path , type:"get" , success:loadComplete });
        
        function loadComplete( _xml )
        {
            var item = $(_xml).find('data > item');

            Account.initLayout(item, opts.container);
        }
    },
    
    initLayout : function (item, cont)
    {
        var select = cont.find('.roundPad > select');
        select.empty();
        
        var content = cont.find('.bgGray > .formType > tbody td');

        //init
        item.each(function (idx)
        {
            select.append('<option>' + item.eq(idx).find('bank').text() + '</option>');
        });
        
        //event
        select.on('change', function (e)
        {
            var target = $(e.currentTarget);
            var selectIdx = target[0].selectedIndex;
            var txt;
            
            content.each(function (idx)
            {
                txt = item.eq(selectIdx).children().eq(idx+1).text();
                
                $(this).text(txt);
            });
            
            // content.eq(0).text( item.eq(selectIdx).find('number').text() );
            // content.eq(1).text( item.eq(selectIdx).find('card').text() );
            // content.eq(2).text( item.eq(selectIdx).find('commission').text() );
            // content.eq(3).text( item.eq(selectIdx).find('state').text() );
        });
        
        select.trigger('change');
    }
};

//탑버튼 컨트롤
function topBtnControl(rangeElement) 
{
	//	$(document).on("scroll", onScroll);
	// var target = ($(".outBoxMainHome").length > 0) ? $(".mainBlock").eq(0) : $(".roundBox");
	$(window).on ( "scroll" , onScroll ).scroll();
	
	function onScroll()
	{
		//var version = $.browser.version;
		var top = $(window).scrollTop();
		//if ( version <= 533.1)
		//{
			//var h = $(window).height();
			//var hh = $("#wrap").height();
			//$(".top").css ( { position:"absolute" , top:h-hh + top  + 172 - 31 } );
		//}
		
		if ( top > 130 )
		{
			$('.top').css('display', 'block');
		}
		else
		{
			$('.top').css('display', 'none');
		}
	}
};

// 명세서토글
$(function()
{
	var isTablet = false;
	$(window).resize ( resizeFn ).resize();
	init();

	function resizeFn ( e )
	{
		//isTablet = (document.documentElement.clientWidth>=768) ? true : false;
		foldingSet();
		
	}

	function init()
	{
		$(".foldingTable dt").click ( clickFoldingTable );

		function clickFoldingTable ( e )
		{
			e.stopPropagation();
			e.preventDefault();
			if ( isTablet ) return;

			var state = $(this).parent().parent().attr ( "isOpen" );
			state = state == "on" ? "off" : "on";
			$(this).parent().parent().attr ( "isOpen" , state );
			foldingSet();
		}
	}

	function foldingSet()
	{
		$(".foldingTable").each ( function ( i )
		{
			var tar = $(this).find("dd");
			var tar2 = $(this).find("dl");
			var state = $(this).attr ( "isOpen" );
			if ( isTablet ) state = "on";
			if ( state == "on" )
			{
				tar.css ( { display:"block" } );
				tar2.addClass ( "on" );
			}
			else
			{
				tar.css ( { display:"none" } );
				tar2.removeClass ( "on" );
			}
		} );
	}
} );


$(function()
{
	var isTablet;
	$(window).resize ( resizeFn ).resize();
	init();

	function resizeFn ( e )
	{
		isTablet = (document.documentElement.clientWidth>=768) ? true : false;
		foldingTable();
	}

	function init()
	{
		$(".foldingTable2 a").click ( clickFoldingTable );

		function clickFoldingTable ( e )
		{
			e.stopPropagation();
			e.preventDefault();
			if ( isTablet ) return;

			var state = $(this).parent().attr ( "isOpen" );
			state = state == "on" ? "off" : "on";
			$(this).parent().attr ( "isOpen" , state );
			foldingTable();
		}
	}

	function foldingTable()
	{
		$(".foldingTable2").each ( function ( i )
		{
			
			var tar = $(this).find(".tableWrap");
//			var tar2 = $(this).find("dl");
			var tar2 = $(this);
			var state = $(this).attr ( "isOpen" );
			if ( isTablet ) state = "on";
			if ( state == "on" )
			{
				tar.css ( { display:"block" } );
				tar.parent().addClass ( "on" );
			}
			else
			{
				tar.css ( { display:"none" } );
				tar.parent().removeClass ( "on" );
			}
		} );
	}
} );
