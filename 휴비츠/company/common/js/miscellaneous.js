var dep0;
var dep1;
var timer;
var nowImg=0;
var changeSpeed = 2000;

function Misc(a, b)
{	
	dep0 = a;
	dep1 = b;
	
	if($.browser.msie  && parseInt($.browser.version, 10) === 7){}
	else {$('body').css({'overflow-y' : 'scroll'});}
	
	timer = setInterval( changeImg, changeSpeed ); 
	this.subGnb();
	this.imgView();
	this.product();
	this.spec();
	this.recruitFaq();
	this.hlocation();
	//this.download();
	this.rollOverNOut();
	this.industry();
	this.market();
	//this.exhibition();
	this.agent();
	this.job();
	this.enjoy();
	this.humans();
}

Misc.prototype.humans = function (){
	var $tab_human = $('.tab_human').find('>li');
	var humanIndex = $tab_human.index();
	var $human = $('.tab_data > .human');
	var getHumanName = location.search.substring(1);
	var humanNum = 0;
	
	if( getHumanName == "h0" ) humanNum = 0;
	else if ( getHumanName == "h1" ) humanNum = 1;
	else if ( getHumanName == "h2" ) humanNum = 2;
	else if ( getHumanName == "h3" ) humanNum = 3;
	else if ( getHumanName == "h4" ) humanNum = 4;
	else humanNum = 0;
	
	$tab_human.removeClass('on');
	$tab_human.eq(humanNum).addClass('on');
	$human.hide();
	$human.eq(humanNum).show();
	
	$tab_human.click(function (e){
		var idx = $(this).index();
		
		$human.hide();
		$human.eq(idx).show();
		$tab_human.removeClass('on');
		$tab_human.eq(idx).addClass('on');		
	});
}

Misc.prototype.enjoy = function (){
	var $jobTab = $('.tab_type2 li');
	var $enjoyTab = $('div[class^="list2"]');
	var $ebtn = $('.list_type3 li');
		
	$ebtn.removeClass('on');	
	$ebtn.find('>.enjoy_answer').hide();
	$ebtn.find('>.btn').find('img').attr('src', '../img/button/btn_open.gif' )
	$enjoyTab.hide();
	$enjoyTab.eq(0).show();
	
	$jobTab.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$enjoyTab.hide();
		$enjoyTab.eq(idx).show();
	});
	
	$ebtn.find('dd > a, .btn ').click(function(e){	
		var thisOb = $(this).attr('class');
		var parentThing = null;
		
		( thisOb  == 'btn')? parentThing = $(this).parent() :  parentThing = $(this).parent().parent().parent();
		
		e.preventDefault();

		idx = $(this).index();
		
		var hideThing = parentThing.find('.enjoy_answer');
		var onCheck = parentThing.attr('class');
		
		onCheck = onCheck.substring(14,16)
				
		if ( onCheck == 'on') {
			hideThing.hide();
			parentThing.removeClass('on');
			parentThing.find('.btn').find('img').attr('src', '../img/button/btn_open.gif' );
			//$img.attr("src",off);
			//$tFag.find('.answer').hide();

		} else {
			hideThing.show();
			
			parentThing.addClass('on');
			parentThing.find('.btn').find('img').attr('src', '../img/button/btn_close.gif' );
		}

	});

}

Misc.prototype.job = function (){
	var $jobTab = $('.tab_type2 li');
	var $jobList = $('.tab_data').find('>div[class^="job"]');
		
	$jobList.hide();
	$jobList.eq(0).show();
	
	$jobTab.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$jobTab.removeClass();
		$jobTab.eq(idx).addClass('on');
		$jobList.hide();
		$jobList.eq(idx).show();
	});
}

Misc.prototype.agent = function () {
	
	var $tbtn = $('.tab_type2 li');
	var $agent = $('div[class^="agent"]');
	var $icon = $('div[class^="global_con"]').find('div').find('img');
	var $iconCountry = $('div[class^=global_con]').find('span');
	var $map1 = $('.map1');
	var $map2 = $('.map2');
	var $mTable1 = $('.agent1').find('tbody > tr');
	var $mTable2 = $('.agent2').find('tbody > tr');
	
	$agent.hide();
	$agent.eq(0).show();
	$mTable1.css('cursor','pointer') //마우스 커서
	$mTable2.css('cursor','pointer') //마우스 커서
	
	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');
		$agent.hide();
		$agent.eq(idx).show();
	});
	
	$mTable1.click(function (e){
		var mOb = $(this);
		var mIdx = $(this).index();
		
		$mTable1.removeClass();
		mOb.addClass('select');
		
		$map1.find('img').css({display:'none'});
		$map1.find('img').eq(mIdx).css({display:'block'});
	});
	
	$mTable2.click(function (e){
		var mOb = $(this);
		var mIdx = $(this).index();
		
		$mTable2.removeClass();
		mOb.addClass('select');
		
		$map2.find('img').css({display:'none'});
		$map2.find('img').eq(mIdx).css({display:'block'});
	});
	// /$map1.find('img').css({display:'none'});
}

Misc.prototype.exhibition = function () {
	
	var $tbtn = $('.tab_type3 li');
	var exhibitionOb = $('div[class^=exhibition]');

	exhibitionOb.hide();
	exhibitionOb.eq(0).show();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');
		exhibitionOb.hide();
		exhibitionOb.eq(idx).show();
	});
}

Misc.prototype.market = function () {
	
	var $tbtn = $('.tab_type2 li');
	var marketOb = $('div[class^=market]');

	marketOb.hide();
	marketOb.eq(0).show();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');
		marketOb.hide();
		marketOb.eq(idx).show();
	});
}

Misc.prototype.industry = function () {
	
	var $tbtn = $('.tab_type2 li');
	var industryOb = $('div[class^=industry]');

	industryOb.hide();
	industryOb.eq(0).show();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();

		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');
		industryOb.hide();
		industryOb.eq(idx).show();
	});	
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

	nowImg++;
	if(nowImg>2){
		nowImg = 0;
	}

	$('.num').find('img').attr('src','../img/product/num.gif');
	$('.num a').children().eq(nowImg).attr('src','../img/product/num_on.gif');

	$img.hide();
	$img.eq(nowImg).show();
}

Misc.prototype.subGnb = function () {
	var $gnb = $('.gnb strong');
	var $snb = $('.snb');
	var $snbCell = $snb.find('li');
	var $out = $('.util');
	var gnbTimer;

	resetMenu();

	$gnb.mouseenter(function(e) {
		window.clearTimeout(gnbTimer);
		$snb.hide();
		$('ul[class^="nb"]').find('strong').removeClass('on');
		$(this).addClass('on').next().show();
		$snbCell.removeClass('on');
		
	});
	
	$('#header').mouseleave(function(e){
		resetMenu();
	});
	
	$snbCell.mouseenter(function(e) {
			$('.snb').find('li').removeClass('on');
			$(this).addClass('on');
	});
	
	$out.mouseenter(function(e) { 
		gnbTimer = window.setTimeout(function () { resetMenu() }, 10);
	});
	
	function resetMenu (e) {
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
Misc.prototype.product = function () {

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

		$('<h4><a href=#>'+ $tpt.text() +'</a></h4>').appendTo($productTab.eq(idx));
		$('.tab_con'+ctab).attr('class','tab_con'+ctab+' tab_con tab'+tid);
		$productTab.css({height:'40px'});
		$products.hide();
		$products.eq(idx).show();

	});
}

Misc.prototype.spec = function () {
	
	var $tbtn = $('.tab_type2 li');
	var tb1 = $('div[class^=ability]');
	
	tb1.hide();
	tb1.eq(0).show();

	$tbtn.click(function(e){

		e.preventDefault(); 

		idx = $(this).index();
		
		$tbtn.removeClass();
		$tbtn.eq(idx).addClass('on');

		tb1.hide();
		tb1.eq(idx).show();
	});
}

Misc.prototype.recruitFaq = function () {
	
	var $fbtn = $('.faq .list_type1 li');
	var $answerTxt = "여기에서 하시면 됩니다.<br />불편하시면 1:1 문의로 접수해 주세요.";
	var $answerCon = $('<div class="answer">'+$answerTxt+'</div>');
	var $img;
	var $imgsrc;
	

	$('.answer').hide();
	$fbtn.removeClass('on');
	
	$fbtn.eq(2).find('>a>img').attr('src', '../img/button/btn_open.gif');
	
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