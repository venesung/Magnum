var dep0;
var dep1;
var timer;
var nowImg=0;
var changeSpeed = 2000;
var cookieName = 'cookieDataSetting';
var cookieOption = { path:'/project/huvitz/optic', domain:'webc.magnumvint.com', expires: 10};
var cookieValue = $.cookie(cookieName);

function Misc(a, b)
{	
	dep0 = a;
	dep1 = b;
	
	if($.browser.msie  && parseInt($.browser.version, 10) === 7){}
	else {$('body').css({'overflow-y' : 'scroll'});}
	
	var imgBtn = $('.num>a').attr('href');
	
	if(imgBtn != null || imgBtn != undefined) {
		timer = setInterval( changeImg, changeSpeed );
		this.rollOverNOut();	
	}
	 
	this.subGnb();
	this.imgView();
	
	if($('.tab_con').attr("class") != null && $('.tab_con').attr("class") != undefined ){
		this.product();
		this.product2();	
	} 
	
	this.spec();
	this.faq();
	this.hlocation();
	this.download();	
}

Misc.prototype.rollOverNOut = function () {
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
	var checkChild = $('.num >a').index();
	var $productTitleOb = $('.product_title > .con h2');
	var productName = $productTitleOb.text();
	
	var hisNames = ['HIS-5000', 'HIS-7000'];
	var hsNames = ['HS-7000', 'HS-7500', 'HS-5000', 'HS-5500'];
	var cpeNames = ['CPE-4000', 'CFR-4000', 'CBK-4000'];	
	var useProductName = [];
	
	if(productName == null || productName == undefined ) return;
	
	if(productName == 'HIS-5000' || productName == 'HIS-7000') useProductName = hisNames;
	else if (productName == 'HS-7000' || productName == 'HS-7500'|| productName == 'HS-5000'|| productName == 'HS-5500')	useProductName = hsNames;
	else if (productName == 'CPE-4000' || productName == 'CFR-4000' || productName == 'CBK-4000')	useProductName = cpeNames;
		
	
	nowImg++;
	if(nowImg>checkChild){
		nowImg = 0;
	}
	
	$('.num').find('img').attr('src','../img/product/num.gif');
	$('.num a').children().eq(nowImg).attr('src','../img/product/num_on.gif');
	if(cookieValue=="2_1" && dep1 == '3')	$productTitleOb.text(useProductName[nowImg]);
	
	$img.hide();
	$img.eq(nowImg).show();
}

Misc.prototype.subGnb = function () {

	var $gnb = $('.gnb strong');
	var $changeEdginSolution = $('.gnb > .nb1 > li').eq(2).find('strong > a');
	var $snb = $('.snb');
	var $snbCell = $snb.find('li');
	var $out = $('#content, .util');
	var gnbTimer;
	var $tab = $('li[class^="tab"]').find('a');

	if(cookieValue != null){
		if(cookieValue == '2_1')	$changeEdginSolution.attr('href', 'hpe-8000.html');
		else	$changeEdginSolution.attr('href', 'p_hpe-8000.html');	
	}
	

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

Misc.prototype.imgView = function () {
	
	var $dot = $('.num a');
	var $img = $('.imgView li');
	var cpeNames = ['CPE-4000', 'CFR-4000', 'CBK-4000'];
	var $productTitleOb = $('.product_title > .con h2');
	var productName = $productTitleOb.text();
	
	if (productName == 'CPE-4000' || productName == 'CFR-4000' || productName == 'CBK-4000')	useProductName = cpeNames;
	
	$dot.click(function(e) {
		
		e.preventDefault(); 

		var idx = $(this).index();

		$('.num').find('img').attr('src','../img/product/num.gif');
		$(this).children().attr('src','../img/product/num_on.gif');

		$img.hide();
		$img.eq(idx).show();
		
		if(cookieValue=="2_1" && dep1 == '3'){
			if (productName == 'CPE-4000' || productName == 'CFR-4000' || productName == 'CBK-4000')
			$productTitleOb.text(cpeNames[idx]);	
		}
	});
}

//기본적으로 보여주는 것
Misc.prototype.product = function () {

	var ctab;
	var saveTabNum = 0;
	              
	
	for( var i = 1; i < 40; i++ ){
		var zz = $('.tab_con'+i).attr("class");
		
		if(zz != null || zz != undefined){
			saveTabNum = zz;
			break;
		}
	}
	//saveTabNum = saveTabNum.tostring;
	if(saveTabNum != null && saveTabNum != undefined ) saveTabNum = saveTabNum.substring(7,9);
	
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
		$('.tab_con'+saveTabNum).attr('class','tab_con'+saveTabNum+' tab_con tab'+tid);
		$productTab.css({height:'40px'});
		$products.hide();
		$products.eq(idx).show();

	});
}

Misc.prototype.product2 = function () {
	var ctab;
	var saveTabNum = 0;
	
	for( var i = 1; i < 40; i++ ){
		var zz = $('.tab_con'+i).attr("class");
		
		if(zz != null || zz != undefined){
			saveTabNum = zz;
			break;
		}
	}
	//saveTabNum = saveTabNum.tostring;
	if(saveTabNum != null && saveTabNum != undefined )
	saveTabNum = saveTabNum.substring(7,9);
	
	var tid = 0;
	var $productTab = $('.tab_2 li');
	var $products = $('.tab1 dl');
	var obH = 0;
	
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
		$('.tab_con'+saveTabNum).attr('class','tab_con'+saveTabNum+' tab_con tab'+tid);
		
		obH=$(this).height();
		
		if(obH == 76) obH = 60;
		$(this).css({height:obH});
		
		$products.hide();
		$products.eq(idx).show();

	});
}

Misc.prototype.spec = function () {
	
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

Misc.prototype.faq = function () {
	
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

Misc.prototype.hlocation = function () {
	
	var $tbtn = $('.tab_type2 li');
	var $map = $('.location');
	var $icon = $('div[class^="global_con"]').find('div').find('img');
	var $iconCountry = $('div[class^=global_con]').find('span');
		
	$('div[class^="global_con"]').find('div').css({'position':'lative'});
	$('.iCon').css({position:'relative', overflow:'hidden', width:'30px'});
	$icon.css({position:'relative', cursor:'pointer'});
	
	$map.hide();
	$map.eq(0).show();
	$iconCountry.hide();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');
		$map.hide();
		$map.eq(idx).show();
	});
	
	$icon.click(function (e){
		e.preventDefault();
		
		var thisOb = $(this);
		var thisObChildren = $(this).parent().parent();
		var checkOn = $(this).parent();

		if(checkOn.attr('class') != 'iCon on'){
			$('.iCon').removeClass('on');
			checkOn.addClass('on');
			
			$icon.attr('src', '../img/huvitz/ico_location1.png');
			thisOb.attr('src', '../img/huvitz/ico_location2.png');
			
			$iconCountry.hide();
			thisObChildren.find('span').show();
			
			$('div[class^="global_con"]').css({'z-index':1});
			thisObChildren.css({'z-index':9});
		}else{
			checkOn.removeClass('on');
			$icon.attr('src', '../img/huvitz/ico_location1.png');
			$icon.css({'margin-left':'0px'});
			$iconCountry.hide();
		}
	});
}

Misc.prototype.download = function () {
	
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