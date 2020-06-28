function Main()
{	
	var setnumHuvitzWd = 0;
	var setnumHuvitzHd = 0; 
	var $setNum_huvitz = $('.num_huvitz');
	
	//var windowWt = $(window).width();
	
	setnumHuvitzWd = $('.visual_area').position().left+55;
	setnumHuvitzHd = $('#content').position().top+180;
	$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:setnumHuvitzHd+"px"});
	/*
	if($.browser.msie  && parseInt($.browser.version, 10) === 7){
		$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:"720px"});
	}else{
		$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:"750px"});	
	}*/
	
	$(window).resize(function (e){
		setnumHuvitzWd = $('.visual_area').position().left+55;
		setnumHuvitzHd = $('#content').position().top+180;
		$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:setnumHuvitzHd+"px"});
		/*setnumHuvitzWd = $('.visual_area').position().left+55;
		
		if($.browser.msie  && parseInt($.browser.version, 10) === 7){
			$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:"720px"});
		}else{
			$setNum_huvitz.css({left:setnumHuvitzWd+"px", top:"750px"});	
		}*/
	});
	
	this.mainGnb();
	this.mainVisual();
	this.mainNews();
	this.mainAbout();
	this.mainCulture();
	this.mainRecruit();
}

Main.prototype.mainAbout = function(){
	
	var $aboutDiv = $('.main_content').children().eq(0);
	var $aboutObjects = $('.num_huvitz > ul');
	var $aboutLi = $aboutObjects.find('>li');
	var tn = $aboutLi.length;
	var $btnOb = $aboutDiv.find('.numlist2').children();
	var $allAboutBtn = $aboutDiv.find('.numlist2').find('img');
	var operateBtnNum = 0;
	var timerSpeed = 3000;
	var aboutTimer = null;
	var btnNum = $aboutDiv.find('.numlist2 > a').index();
	var savePos = [0, -295, -585, -883];
	var mainImgPlayer = false;
	var clickDotNum = 0;
	
	$aboutDiv.find('> .numlist2').css({ 'z-index':59, left:'0px'});	
	$('.num_huvitz').css({position:'absolute', width:'290px', height:'105px', overflow:'hidden'});		
	$aboutObjects.css({position:'absolute', width:'1420px', height:'105px', left:'0px', top:"10px"});
	
	startAboutTimer();	
	
	$btnOb.click(function (e){
		e.preventDefault();
			
		var operateBtn = $(this).find('img');
		operateBtnNum = $(this).index();
			
			
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		operateBtn.attr('src', '../img/product/s_num_on.gif');
		
		$aboutObjects.stop().animate({left:savePos[operateBtnNum]+'px'},{quese:false, duration:1000, easing:'easeOutExpo'});
	});
	
	$aboutDiv.find('>.numlist2').mouseover(function(e){ 	stopAboutTimer();	});
	$('.num_huvitz').mouseover(function(e){ 	stopAboutTimer();	});
	$aboutDiv.find('>.top_con').mouseleave(function(e){	startAboutTimer();	});
	$aboutDiv.find('>.top_con').mouseover(function(e){ 	stopAboutTimer();	});
	
	function startAboutTimer(){ aboutTimer = setInterval( btnTimer, timerSpeed ); 	}
	function stopAboutTimer(){ clearInterval(aboutTimer);	}
	
	function btnTimer(){
		
		operateBtnNum++;
		
		if(operateBtnNum == (btnNum+1)) operateBtnNum = 0;
		
		$btnOb.eq(operateBtnNum).trigger('click');
		
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		$btnOb.eq(operateBtnNum).find('img').attr('src', '../img/product/s_num_on.gif');
	}
}

Main.prototype.mainRecruit = function(){
	
	var $aboutDiv = $('.main_content').children().eq(2);
	var $cultureObjects = $aboutDiv.find(">.top_con2 > dd");
	var $btnOb = $aboutDiv.find('.numlist2').children();
	var $allAboutBtn = $aboutDiv.find('.numlist2').find('img');
	var operateBtnNum = 0;
	var timerSpeed = 3000;
	var aboutTimer = null;
	var btnNum = $aboutDiv.find('.numlist2 > a').index();
			
	$cultureObjects.hide();
	$cultureObjects.eq(operateBtnNum).show();
	
	startAboutTimer();	
	
	$btnOb.click(function (e){
		e.preventDefault();
		
		stopAboutTimer();
		
		var operateBtn = $(this).find('img');
		operateBtnNum = $(this).index();
		
		$cultureObjects.hide();
		$cultureObjects.eq(operateBtnNum).show();
		
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		operateBtn.attr('src', '../img/product/s_num_on.gif');
	});

	$aboutDiv.find('.top_con').mouseleave(function(e){	startAboutTimer();	});
	$aboutDiv.find('.top_con').mouseover(function(e){ 	stopAboutTimer();	});
	
	function startAboutTimer(){ aboutTimer = setInterval( btnTimer, timerSpeed ); 	}
	function stopAboutTimer(){ clearInterval(aboutTimer);	}
	
	function btnTimer(){
		operateBtnNum++;
				
		if(operateBtnNum == (btnNum+1)) operateBtnNum = 0;
		
		$cultureObjects.hide();
		$cultureObjects.eq(operateBtnNum).show();
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		$btnOb.eq(operateBtnNum).find('img').attr('src', '../img/product/s_num_on.gif');
	}
}

Main.prototype.mainCulture = function(){
	
	var $aboutDiv = $('.main_content').children().eq(1);
	var $cultureObjects = $aboutDiv.find(">.top_con2 > dd");
	var $btnOb = $aboutDiv.find('.numlist2').children();
	var $allAboutBtn = $aboutDiv.find('.numlist2').find('img');
	var operateBtnNum = 0;
	var timerSpeed = 3000;
	var aboutTimer = null;
	var btnNum = $aboutDiv.find('.numlist2 > a').index();
			
	$cultureObjects.hide();
	$cultureObjects.eq(operateBtnNum).show();
	
	startAboutTimer();	
	
	$btnOb.click(function (e){
		e.preventDefault();
		
		stopAboutTimer();
		
		var operateBtn = $(this).find('img');
		operateBtnNum = $(this).index();
		
		$cultureObjects.hide();
		$cultureObjects.eq(operateBtnNum).show();
		
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		operateBtn.attr('src', '../img/product/s_num_on.gif');
	});

	$('.top_con').mouseleave(function(e){	startAboutTimer();	});
	$('.top_con').mouseover(function(e){ 	stopAboutTimer();	});
	
	function startAboutTimer(){ aboutTimer = setInterval( btnTimer, timerSpeed ); 	}
	function stopAboutTimer(){ clearInterval(aboutTimer);	}
	
	function btnTimer(){
		operateBtnNum++;
				
		if(operateBtnNum == (btnNum+1)) operateBtnNum = 0;
		
		$cultureObjects.hide();
		$cultureObjects.eq(operateBtnNum).show();
		$allAboutBtn.attr('src', '../img/product/s_num.gif'); // on 현상 초기화
		$btnOb.eq(operateBtnNum).find('img').attr('src', '../img/product/s_num_on.gif');
	}
}

Main.prototype.mainNews = function (){
	var $news_btn = $('.news_btn > a')
	var $newsContainer = $('.main_news').find('ul');
	var playAnimate = false;
	var changeSpeed = 4000;
	var newsTimer = null;
	
	$newsContainer.wrap('<div class="newsListHide" />')
	$newsContainer.css({position:'relative', width:'700px',left:'-58px'});
	$('.newsListHide').css({overflow:'hidden', height:'30px', position:'relative'});	
	$('.news_btn').css('z-index', 89);
	
	startRolling();
	
	$news_btn.click(function (e){
		e.preventDefault();
		
		var arrow = $(this).index();
		var upAdown = 0;
	
		if( arrow == "0")	{
			rollingNews();
		}
		else {
			if(playAnimate != true){
				var $list1 = $newsContainer.children().eq(-1);
				
				playAnimate = true;
				upAdown = "0px";
			
				$newsContainer.css({top:'-30px'});
				$list1.prependTo($newsContainer);
				$newsContainer.animate({top:upAdown},{quese:false, easing:'easeOutExpo', complete:resetPlayAnimate});	
			}
		}
	});
	
	$('.main_news').mouseover(function(e) {	stopRolling(); });
	
	$('.main_news').mouseleave(function(e) {	startRolling(); });
	
	function stopRolling(){ 	clearInterval(newsTimer);  }
	function startRolling(){ 	newsTimer = setInterval( rollingNews, changeSpeed ); 	}
	function resetPlayAnimate(){ playAnimate = false;	}
	
	function rollingNews(){
		if( playAnimate != true ){
			upAdown = "-30px";
			playAnimate = true;
			$newsContainer.animate({top:upAdown},{quese:false, easing:'easeOutExpo', complete:moveNews});
		}	
	}
	
	function moveNews(){
		var $list1 = $newsContainer.children().eq(0);
		
		playAnimate = false;
		
		$newsContainer.css({top:'0px'});
		$list1.appendTo($newsContainer);
	}
}

Main.prototype.mainGnb = function () {
	
	var $board = $('.snb');
	var $gnb = $('.gnb ul');
	var $out = $('.visual');
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

Main.prototype.mainVisual = function () {
	
	var cid = 0;
	var aid;
	var $clickBtn = $('.visual > div').eq(0).find('> a');
	var $imgUl = $('.visual ul');
	var $img = $('.visual ul li');
	var tn = $('.visual ul li').length;
	var $pArr = $('.img_prev');
	var $nArr = $('.img_next');
	var $dot = $('.numlist a');
	var visualTimer;
	var mainImgPlayer = false; 
	var saveHtml = [];
	
	resetTimer();

	$('.visual div').mouseenter(function(e) { window.clearInterval(visualTimer); });
	$('.visual div').mouseleave(function(e){ resetTimer(); });

	$imgUl.find('>li').each(function(idx){
		$(this).addClass('mainImg'+idx);
		saveHtml[idx] = $(this).find('img').attr('src');
	});

	$imgUl.css({position:'absolute'});
	
	$clickBtn.click(function(e){
		var thisOB = $(this); 
		
		if(mainImgPlayer == false){		mainImgPlayer = true;	controller(thisOB);		}	
	});
	
	$dot.click(function(e){

		idx = $(this).index();
		
		
		var className = '.mainImg'+idx;
		
		if(mainImgPlayer == false && cid != idx){
			mainImgPlayer = true;
			cid = idx;
			($imgUl.find(className)).prependTo($imgUl);
			
			($imgUl.find('>li').eq(1)).prependTo($imgUl);
			$imgUl.stop().animate({left:'-1072px'},{duration:1000, easing:'easeOutExpo', complete:resetLiAlign});
			changeCon(cid);
		}
	});
	
	function resetLiAlign(){
		var nowEq0 = null;
		var ii = 0;
		var jj = 0;
		var startLiNum = 0;
		
		$imgUl.css('left', '0px');
		($imgUl.find('>li').eq(0)).appendTo($imgUl);
		
		nowEq0 = $imgUl.find('>li').eq(0).attr('class');
		nowEq0 = nowEq0.substring(7,8);
		nowEq0 = parseInt(nowEq0);
		
		for( ii = nowEq0; ii < tn; ii++ ){		 
			startLiNum = ii - nowEq0;		// li 0번 부터 클릭한 li 번째 수 까지
			var className = 'mainImg'+ii;
			$imgUl.find('>li').eq( startLiNum ).attr('class', className);
			$imgUl.find('>li').eq( startLiNum ).find('img').attr('src', saveHtml[ii]);			
		}
		
		// 클릭한 수 부터 0번 클릭 시 0 1 2 3
		// 클릭한 수 부터 1번 클릭 시 1 2 3
		// 클릭한 수 부터 2번 클릭 시 2 3
		// 클릭한 수 부터 3번 클릭 시 3
		
		if(nowEq0 != 0){
			for( jj = 0; jj < nowEq0; jj++ ){
				var className = 'mainImg'+(jj); 
				var restartLiNum = startLiNum+jj+1// cooo+jj+1  앞의 cooo 부터  마지막 li 번째 수 까지
				$imgUl.find('>li').eq( restartLiNum ).attr('class', className);
				$imgUl.find('>li').eq( restartLiNum ).find('img').attr('src', saveHtml[jj])	
			}	
		}
		// 클릭한 수 부터 0번 클릭 시 x
		// 클릭한 수 부터 1번 클릭 시 0
		// 클릭한 수 부터 2번 클릭 시 0 1  
		// 클릭한 수 부터 3번 클릭 시 0 1 2 
		
		mainImgPlayer = false;
	}
	
	function resetTimer() {	visualTimer = setInterval( changeImg, 5000); }
	
	function changeImg(){ $clickBtn.eq(1).trigger("click"); }
	
	function controller(ob){
		var thing = ob.attr('class');
		
		if(thing == 'img_next')	{
			( cid == (tn-1) ) ? cid = 0 : cid++ ;
			aid = cid;
			changeCon(aid);
			
			$imgUl.stop().animate({left:'-1072px'},{duration:1000, easing:'easeOutExpo', complete:moveFirstScreen});	
		}
		else{
			cid--
			if(cid < 0)  cid = tn-1;
			aid = cid;
			
			changeCon(aid);
			
			($imgUl.find('>li').eq(-1)).prependTo($imgUl)
			$imgUl.css({left:'-1072px'});
			$imgUl.stop().animate({left:'0px'},{duration:1000, easing:'easeOutExpo', complete:moveFinallScreen});
		}	
	}
	
	function moveFirstScreen(){
		mainImgPlayer = false;
		$imgUl.css('left', '0px');
		($imgUl.find('>li').eq(0)).appendTo($imgUl);
		//bbbb();
	}
	
	function changeCon (aid) {
		$('.numlist').find('img').attr('src','../img/product/num.gif');
		$dot.eq(aid).children().attr('src','../img/product/num_on.gif');
		
	}
	
	function moveFinallScreen(){
		mainImgPlayer = false;
	}
}
