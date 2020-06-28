// crazybart
// 2012-06-14

var d0;
var d1;
var d2;
//HTS에서 파라미터 전달
var para = location.search.substring(1);

function shicNavi(mid0,mid1,mid2)
{	
	
	d0 = mid0;
	d1 = mid1;
	d2 = mid2;
		
	this.menu();
	                     
}


shicNavi.prototype.menu = function () {
	
	var data;
	var $totalNum;
	var $url = "../data/shic_links.xml";

	$.ajax({
		type: 'get'
		, dataType: "xml"
		, url:$url 
		, success: function(xml) {
			data = $('gnb', xml).get();
			$totalNum = $('gnb', xml).length;
			var i = 1;

			$(data).each(function () {

				if (i == $totalNum) {
					
					init();
					return;
				}
				i++;
			});

		}
		, error: function(xhr, status, error) {alert(error); }
	});
			
	var idx = 0; // depth1 id
	var sidx; // depth2 id
	var lidx; // depth3 id
	
	var $mTab = $('img[class^="slideL"]');
	var $1dep = $('.menu ul li');
	var $2depRec = $('.subMenu > ul');
	var $2dep = $('.subMenu > ul').children('li');
	var $2depL = $2dep.find('a')
	var $3dep;
	var $mArea = $(".RightArea");
	
	var mx;
	var my;
	
	var flag = false;
	
	selMenu(d0,d1,d2);


	//HTS에서 열때
	if (para == "mode=hts") {

		flag = true;
		$mArea.css({left:0});
		$(".slideLayout").hide();	
		$(".slideLayout2").show();
		
	};
	
	function init() {
		/*
		var d0len = $(data).find('depth0').length -1; //마이메뉴제외
		var d1l;
		
		for (var i=0; i<d0len; i++) {
			
			var d1s;
			var d1Len;
			var d1n;
			
			for (var j=0; j<d1Len; j++) {
				dep1l = $(data).find('depth0').eq(i).attr('link');
			}
		}
		*/
	}
	
	function selMenu(d0,d1,d2){

		$1dep.find('a').eq(d0).addClass('sel');
		$2depRec.hide().eq(d0).show();
		$('.subMenu > ul').eq(d0).children('li').eq(d1).attr("style","overflow:visible;height:auto").children().addClass('sel').find('li').eq(d2).children().addClass('sel');

	}
	
	$(document).mousemove(function(e){
		
		mx = e.pageX;
        my = e.pageY;

        var lt = 0;
        var tp = 230;
        var wd;
        (flag == true) ? wd = 170 : wd = 340 ;
        var ht = 700;

		if ( ( lt < mx && mx < wd ) && ( tp < my && my < ht ) ) {

		} else {
			$1dep.find('a').removeClass('sel');
			$2dep.find('a').removeClass('sel');
			selMenu(d0,d1,d2);
		}

	});
	
	$mTab.click(function(){
		
		toggleLnb();	
	
	});
	
	function toggleLnb() {
		
		if (flag == false) {
			$mArea.animate({ left : 0 }, {queue:false, duration: 1000, easing:'easeOutQuad', complete:onCompMoving } );
	
		} else {
			$mArea.animate({ left : 160 }, {queue:false, duration: 1000, easing:'easeOutQuad', complete:onCompMoving } );	
		}
		
		(flag == false)  ? flag = true : flag = false ;
		
	}
	
	function onCompMoving() {
		
		if (flag == false) {
			$(".slideLayout2").hide();	
			$(".slideLayout").show();
		} else {
			$(".slideLayout").hide();	
			$(".slideLayout2").show();
		}
			
	}
	
	$1dep.click(function(){
		
		idx = $(this).index()
	
		$2depRec.hide().eq(idx).show();
		
	}).mouseenter(function(){
		
		$1dep.find('a').removeClass('sel');
		$(this).children().addClass('sel');
				
	});
	
	$2dep.mouseenter(function(){	
			
		sidx = $(this).index();
		$2dep.find('a').removeClass('sel');
		$2dep.attr("style","overflow:hidden");
		$(this).attr("style","overflow:visible;height:auto");
		
		var d2Link = $(data).find('depth0').eq(idx).find('depth1').eq(sidx).attr('link');
		$(this).find('a').attr('href',d2Link);
		
			$3dep = $(this).find('li');
				
			$3dep.mouseenter(function(){
				
				$(this).parent().parent().children('a').addClass('sel');
				lidx = $(this).index();
	
				var d3Link = $(data).find('depth0').eq(idx).find('depth1').eq(sidx).find('depth2').eq(lidx).attr('link');
				$(this).children('a').attr('href',d3Link);
		

	});
			
	}).mouseleave(function(){
			
			$2dep.attr("style","overflow:hidden");
			
	});
	
			
}