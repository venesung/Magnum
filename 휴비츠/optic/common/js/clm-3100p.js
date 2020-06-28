var dep0;
var dep1;
var timer;
var nowImg=0;
var changeSpeed = 2000;

function Clm(a, b)
{	
	dep0 = a;
	dep1 = b;

	 
	this.subGnb();
	//this.imgView();
	this.product();
	this.spec();
	this.faq();
	this.hlocation();
	this.download();
	this.rollOverNOut();
	
}

Clm.prototype.rollOverNOut = function () {
	var $dot = $('.num a');
	var $img = $('.imgView li img');

	$dot.bind({
		mouseover : function(){
			clearInterval(timer);
		}, mouseout : function(){
			resetTimer();
		}

	});	

	$img.bind({
		mouseover : function(){
			clearInterval(timer);
		}, mouseout : function(){
			resetTimer();
		}

	});	
}

function resetTimer() {
	timer = setInterval( changeImg, changeSpeed );
}

function changeImg() {
	
	var $img = $('.imgView li');

	nowImg++;
	if(nowImg>2){
		nowImg = 0;
	}

	$('.num').find('img').attr('src','../img/product/num.gif');
	$('.num a').children().eq(nowImg).attr('src','../img/product/num_on.gif');

	$img.hide();
	$img.eq(nowImg).show();
}

Clm.prototype.subGnb = function () {

	var $gnb = $('.gnb strong');
	var $snb = $('.snb');
	var $snbCell = $snb.find('li');
	var $out = $('#content, .util');
	var gnbTimer;
	var $tab = $('li[class^="tab"]').find('a');
	
	var cookieName = 'cookieDataSet';
	var cookieOption = { path:'/project/hubitz/optic', domain:'webc.magnumvint.com', expires: 10};
	//var cookieOption = { path:'/', expires: 10};
	
	var cookieValue = $.cookie(cookieName);

	resetMenu();

	$gnb.mouseenter(function(e) {

		window.clearTimeout(gnbTimer);
		$snb.hide();
		$('ul[class^="nb"]').find('strong').removeClass('on');
		$(this).addClass('on').next().show();
		
	});
	
	$('#header').mouseleave(function(e){
		resetMenu();
	});
	
	$tab.click(function(e){
		var $ob = $(this).parent();
		var obIndex = $ob.index(); 
		var $snb2 = $('.snb2').find('ul');
		
		$('li[class^="tab"]').find('a').removeClass('on');
		$ob.find('a').addClass('on');
		
		$('li[class^="snb3"]').removeClass('open');
		$snb2.addClass('on');
		
		$('li[class^="snb3"]').find('li').removeClass('on');
				
		if(obIndex == 0){ 
			$('li[class^="snb3"]').eq(0).addClass('open');
			$.cookie(cookieName, "2_1", cookieOption);
			
			$('li[class^="snb3"]').eq(0).find('li').eq(0).addClass('on') 
			cookieValue = $.cookie(cookieName);	
		}
		else{
			$('li[class^="snb3"]').eq(1).addClass('open');
			 $.cookie(cookieName, "2_2", cookieOption);
			 
			 $('li[class^="snb3"]').eq(1).find('li').eq(0).addClass('on')
			 cookieValue = $.cookie(cookieName);
		}
	});

	function resetMenu (e) {
		var operateNum = 0;
				
		defaultDepth();	//원래 클릭했던 Gnb 위치로 이동
		
		$('li[class^="tab"]').removeClass('on');
		$('li[class^="tab"]').find('a').removeClass('on');
		$('li[class^="snb3"]').find('li').removeClass('on')
		$('li[class^="snb3"]').removeClass('open');
			
		//(cookieValue =='2_1') ? operateNum = 0 : operateNum = 1;
		
		if( cookieValue == null || cookieValue == '2_1') operateNum = 0;
		else	operateNum = 1;
		/**/
		
		$('li[class^="tab"]').eq(operateNum).find('a').addClass('on')
		$('li[class^="snb3"]').eq(operateNum).addClass('open')
		
		if(dep0 == 2)	{
			$('li[class^="snb3"]').eq(operateNum).find('li').eq(dep1).addClass('on');	
		}
		else	{
			$('li[class^="snb3"]').eq(operateNum).find('li').eq(0).addClass('on');	
		}
		
	}
	
	function defaultDepth(){
		$snb.hide();
		$('.snb').find('li').removeClass('on');
		$('ul[class^="nb"]').find('strong').removeClass('on');
	
		var $target1 = $gnb.eq(dep0);
		$target1.addClass('on');
	
		var $target2 = $target1.next('div');
		$target2.show().find('li').eq(dep1).addClass('on');
	}
}

Clm.prototype.imgView = function () {
	
	var $dot = $('.num a');
	var $img = $('.imgView li');

	$dot.click(function(e) {
		
		e.preventDefault(); 

		var idx = $(this).index();

		$('.num').find('img').attr('src','../img/product/num.gif');
		$(this).children().attr('src','../img/product/num_on.gif');

		$img.hide();
		$img.eq(idx).show();

	});
}

//기본적으로 보여주는 것
Clm.prototype.product = function () {

	var ctab;
	
	if (dep1 == 0) {
		ctab = 1;
	} else if (dep1 == 1) {
		ctab = 2;
	} else if (dep0 == 2) {
		ctab = 4;
	}

	var tid = 0;
	var $productTab = $('.tab li');
	var $products = $('.tab1 dl');
	
	$products.hide();
	$products.eq(0).show();

	$productTab.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();
		tid = idx + 1;
		
		$('h4 > a').unwrap();

		var $tpt = $productTab.eq(idx).children().clone();
		$productTab.eq(idx).children().remove();

		$('<h4><a href=#>'+ $tpt.html() +'</a></h4>').appendTo($productTab.eq(idx));
		$('.tab_con'+ctab).attr('class','tab_con'+ctab+' tab_con tab'+tid);
		$products.hide();
		$products.eq(idx).show();

	});
}

Clm.prototype.spec = function () {
	
	var $tbtn = $('.tab_type2 li');
	var tb1 = $('.table_type1');
	$('.table_type4').hide();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();
		
		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');

		if (idx == 0) {
			tb1.show();
			$('.table_type4').hide();
			$('.stxt3, .Vspace40').show();
		} else {
			tb1.hide();
			$('.table_type4').show();
			$('.stxt3, .Vspace40').hide();
		}

	});

}

Clm.prototype.faq = function () {
	
	var $fbtn = $('.faq .list_type1 li');
	var $answerTxt = "여기에서 하시면 됩니다.<br />불편하시면 1:1 문의로 접수해 주세요.";
	var $answerCon = $('<div class="answer">'+$answerTxt+'</div>');
	var $img;
	var $imgsrc;

	$('.answer').hide();

	$fbtn.find('.btn, strong').click(function(e){	
		
		e.preventDefault();

		idx = $(this).index();
		
		$img =$(this).parent().find('img');
		$imgsrc = $img.attr('src');
		var on = $imgsrc.replace(/open.gif/,"close.gif");  
		var off = $imgsrc.replace(/close.gif/,"open.gif");  
		
		var $tFag = $(this).parent();

		if ($tFag.attr('class') == 'on') {
			$tFag.removeClass();
			$img.attr("src",off);
			$tFag.find('.answer').hide();

		} else {
			$tFag.addClass('on');
			$img.attr("src",on);
			$tFag.find('.answer').show();
		}

	});

}

Clm.prototype.hlocation = function () {
	
	var $tbtn = $('.tab_type2 li');
	var $map = $('.location');
	$map.hide();
	$map.eq(0).show();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$map.hide();
		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');

		(idx == 0) ? $map.eq(0).show() : $map.eq(1).show() ;

	});
	
}

Clm.prototype.download = function () {
	
	var $dbtn = $('.download .list_type1 li');
	

	var $img;
	var $imgsrc;

	$('.download_con').hide();

	$dbtn.find('.btn, strong').click(function(e){	
		
		e.preventDefault();

		idx = $(this).index();
		
		$img =$(this).parent().find('img');
		$imgsrc = $img.attr('src');
		var on = $imgsrc.replace(/open.gif/,"close.gif");  
		var off = $imgsrc.replace(/close.gif/,"open.gif");  
		
		var $tFag = $(this).parent();

		if ($tFag.attr('class') == 'on') {
			$tFag.removeClass();
			$img.attr("src",off);
			$tFag.find('.download_con').hide();

		} else {
			$tFag.addClass('on');
			$img.attr("src",on);
			$tFag.find('.download_con').show();
		}

	});
	
}