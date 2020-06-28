// crazybart
// 2012-06-15


var data;

function shicTrade() { getJson("tr"); }

function expertProfile() { getJson("ex"); }


function getJson(val) {
	
	var durl = "../data/tExpert.js";
	
	$.getJSON(durl, function(json) {
   	
   		data = json.list.master;
   		
   		if (val == "tr") { 
   			tradeExpert(data);
   		} else {
   			exProfile(data);	
   		}
   		
	});	
}


function exProfile() {
	
	var $data = data;
	var $arrs = $('.prev, .next');
	var $thumConS = $('.ListRally ul');
	var $thumCell = $('.ListRally ul li');
	var idx = 0;
	var tlen = $thumCell.length; 
	var $cNumOfList = 0; // 현재 페이지
	var $pNumOfList = Math.ceil(tlen / 8); // 총 페이지 수
	var isOnMotion = false;
	
	appendList();
	
	function appendList() {
		
		$thumConS.empty();

		for (var i=0; i<tlen; i++) {
					
			$('<li></li>')
			.html('<img src="'+$data[i].img+'" width="75" height="75" alt="" /><div class="imgBlock"><!-- Design Block --></div><span>'+$data[i].name+'</span>')
			.appendTo($thumConS);

		}
			
	}
	
	selectCP();
	
	$arrs.click(function(e){
		
		e.preventDefault();
		
		if (isOnMotion == true) { return; }
		
		var dir = $(this).attr('class');
		

		if (dir == "prev") {
			
			if ($cNumOfList == 0) { return; }
			
			$thumConS.animate({ left:-720*($cNumOfList-1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList--;
						
		} else {
			
			if ($cNumOfList == ($pNumOfList-1)) { return; }
			
			$thumConS.animate({ left:-720*($cNumOfList+1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList++;
			
		}
		
		idx = 8*$cNumOfList;
		isOnMotion = true;
		
	});
	
	$thumCell.click(function(){
		
		idx = $(this).index();
		
		selectCP();
		
	})
	
	function selectCP() {
		
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
		
		var $pic = $('.ViewRally .pic');
		var $name = $('.ViewRally .name');
		var $profit = $('.view tr').eq(0).find('strong');
		var $rank = $('.view tr').eq(1).find('td');
		var $member = $('.view tr').eq(2).find('td');
		var $stocks = $('.view tr').eq(3).find('td');
		
		
		isOnMotion = false;
		
		$thumCell.removeClass('sel');
		$thumCell.eq(idx).addClass('sel');
		
		
		// 선택  이미지 변경
		$pic.attr('src',$data[idx].img); 
		
		// 선택 랭킹 변경
		$rank.empty().append((idx+1)+"위"); 
		
		// 선택 이름
		$name.empty().append('<strong>'+$thumCell.eq(idx).find('span').text()+'</strong>');
		
		// 선택 지점
		$name.append(($data[(idx)].branch));
		
		// 선택 이윤
		$profit.empty().append(($data[idx].profit)).attr('class',$data[(idx)].stat);
		
		// 선택 회원
		$member.empty().append(($data[idx].members));
		
		// 보유 주식
		$stocks.empty().append(($data[idx].stocks));
		
	}
	
	
}



// 달인의 매매현황
// 달인 참가자 정렬 및 선택

function tradeExpert(data) {

	var $data = data;
	var tlen = $data.length; 
	var $dotsCon = $('.light');
	var $arrs = $('.prev, .next');
	var $thumCon = $('.ListTypeThum .list');
	var $thumConS = $('.ListTypeThum .inBox');
	var $thumConSbox;
	var $cNumOfList = 0; // 현재 페이지
	var $pNumOfList = Math.ceil(tlen / 10); // 총 페이지 수
	var idx;
	
	// 달인 리스트 생성
	
	appendList();
	
	function appendList() {
		
		$thumConS.empty();

		for (var i=0; i<$pNumOfList; i++) {
			
			// 10명에 박스 한개씩 생성
			$thumConSbox = $('<div class="moveBlock"><ul></ul></div>)').appendTo($thumConS).attr('id','tbox'+i);
			
			// 10명에 상단 버튼 하나씩 생성
			$('<a href="#"></a>').html('&nbsp<img src="../img/icon/list_off.gif" alt="리스트" />').appendTo($dotsCon);
		
			// 박스 한개에 10명씩 삽입
			var sn = i*10; // j 시작값
			var en = sn + 10; // j 마지막값	
			
			if (en < 10 || en > tlen) {	en = tlen; } // j 마지막값 트림	
				
				for (var j=sn; j<en; j++) {
					
					$('<li></li>')
					.html('<img src="'+$data[j].img+'" width="75" height="75" alt="" /><div class="imgBlock"><!-- Design Block --></div><span>'+$data[j].name+'</span>')
					.appendTo($('#tbox'+i).children());

				}
				
		};
		
	}
	
	var $dots = $('.light a');
	var $thum = $('.ListTypeThum .list .moveBlock li');
	var $thumTitle;
	var $thumDes = $('.ListTypeThum p');
	
	var $viewRank = $('.ListTypeThum .grade strong');
	var $viewTitle = $('.ListTypeThum .name');
	var $thumBranch  = $('.ListTypeThum .branch');
	var $viewProfit = $('.ListTypeThum .view').find('td').eq(0).find('strong');
	var $viewMem = $('.ListTypeThum .view').find('td').eq(1);
	var $viewStocks = $('.ListTypeThum .view').find('td').eq(2);
	
	var $viewProfile = $('.btn a').eq(0);
	var $viewAdd = $('.btn a').eq(1);
	
	var isOnMotion = false;
	
	
	// 버튼들 활성화
	
	selectCP();
	
	function selectCP() {

		// 양쪽 끝페이지에서 해당 화살표 감춤
		
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
		
			
		// 해당 페이지의 단추버튼 활성화
			
		for (var i=0; i<$pNumOfList; i++) {
			
			$('.light').find('a').eq(i).find('img').attr('src','../img/icon/list_off.gif');
						
		}
		
		var $img = $('.light').find('a').eq($cNumOfList).find('img');
		var $imgsrc = $img.attr('src');
		var on = $imgsrc.replace(/off.gif/,"on.gif");	
		
		$img.attr('src',on);
		
		// 해당 페이지의 순위
		
		var sn = ($cNumOfList*10)+1; // j 시작값
		var en = sn+9; // j 마지막값

		if ( en > tlen ) { en = tlen; }; 	
			
		$thumDes.empty();
		$thumDes.append(''+sn+'위 ~ '+en+'위 까지의 참가자 입니다');
		
		viewChar(0);	
		
		isOnMotion = false;  	
	}
	
	
	// 달인 선택
	
	function viewChar(id) {
		
		// 선택 박스 활성화
		$thum.removeClass('sel');
		$thum.parent().parent().parent().find('.moveBlock').eq($cNumOfList).find('li').eq(id).addClass('sel');
		
		// 선택 랭킹 변경
		$viewRank.empty().append(($cNumOfList*10)+(id+1)); 
		
		// 선택 이름
		$thumTitle = $thum.parent().parent().parent().find('.moveBlock').eq($cNumOfList).find('span').eq(id).text(); 
		$viewTitle.empty().append($thumTitle);
		
		// 선택 지점
		$thumBranch.empty().append(($data[(id + ($cNumOfList*10))].branch));
		
		// 선택 이윤
		$viewProfit.empty().append(($data[(id + ($cNumOfList*10))].profit)).attr('class',$data[(id + ($cNumOfList*10))].stat);
		
		// 선택 회원
		$viewMem.empty().append(($data[(id + ($cNumOfList*10))].members));
		
		// 보유 주식
		$viewStocks.empty().append(($data[(id + ($cNumOfList*10))].stocks));
		
		
	}
	
	$dots.click(function(e){
		
		e.preventDefault();
		
		if (isOnMotion == true) { return; }
		
		$cNumOfList = $(this).index();
		$thumConS.animate({ left:-410*$cNumOfList }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
		
		isOnMotion = true;
		
	})
	
	$arrs.click(function(e){
		
		e.preventDefault();
		
		if (isOnMotion == true) { return; }
		
		var dir = $(this).attr('class');
		
		if (dir == "prev") {
			
			if ($cNumOfList == 0) { return; }
			
			$thumConS.animate({ left:-410*($cNumOfList-1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList--;
			
		} else {

			if ($cNumOfList == ($pNumOfList-1)) { return; }
			
			$thumConS.animate({ left:-410*($cNumOfList+1) }, {queue:false, duration:1000, easing:'easeOutExpo', complete:selectCP } );
			$cNumOfList++;
			
		}
		
		isOnMotion = true;
		
	})
	
	
	$thum.click(function(e){
		
		e.preventDefault();
		
		idx = $(this).index();
	
		viewChar(idx);	
		
	})
	
};




