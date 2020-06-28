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
	var $cNumOfList = 0; // ���� ������
	var $pNumOfList = Math.ceil(tlen / 8); // �� ������ ��
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
		
		
		// ����  �̹��� ����
		$pic.attr('src',$data[idx].img); 
		
		// ���� ��ŷ ����
		$rank.empty().append((idx+1)+"��"); 
		
		// ���� �̸�
		$name.empty().append('<strong>'+$thumCell.eq(idx).find('span').text()+'</strong>');
		
		// ���� ����
		$name.append(($data[(idx)].branch));
		
		// ���� ����
		$profit.empty().append(($data[idx].profit)).attr('class',$data[(idx)].stat);
		
		// ���� ȸ��
		$member.empty().append(($data[idx].members));
		
		// ���� �ֽ�
		$stocks.empty().append(($data[idx].stocks));
		
	}
	
	
}



// ������ �Ÿ���Ȳ
// ���� ������ ���� �� ����

function tradeExpert(data) {

	var $data = data;
	var tlen = $data.length; 
	var $dotsCon = $('.light');
	var $arrs = $('.prev, .next');
	var $thumCon = $('.ListTypeThum .list');
	var $thumConS = $('.ListTypeThum .inBox');
	var $thumConSbox;
	var $cNumOfList = 0; // ���� ������
	var $pNumOfList = Math.ceil(tlen / 10); // �� ������ ��
	var idx;
	
	// ���� ����Ʈ ����
	
	appendList();
	
	function appendList() {
		
		$thumConS.empty();

		for (var i=0; i<$pNumOfList; i++) {
			
			// 10�� �ڽ� �Ѱ��� ����
			$thumConSbox = $('<div class="moveBlock"><ul></ul></div>)').appendTo($thumConS).attr('id','tbox'+i);
			
			// 10�� ��� ��ư �ϳ��� ����
			$('<a href="#"></a>').html('&nbsp<img src="../img/icon/list_off.gif" alt="����Ʈ" />').appendTo($dotsCon);
		
			// �ڽ� �Ѱ��� 10�� ����
			var sn = i*10; // j ���۰�
			var en = sn + 10; // j ��������	
			
			if (en < 10 || en > tlen) {	en = tlen; } // j �������� Ʈ��	
				
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
	
	
	// ��ư�� Ȱ��ȭ
	
	selectCP();
	
	function selectCP() {

		// ���� ������������ �ش� ȭ��ǥ ����
		
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
		
			
		// �ش� �������� ���߹�ư Ȱ��ȭ
			
		for (var i=0; i<$pNumOfList; i++) {
			
			$('.light').find('a').eq(i).find('img').attr('src','../img/icon/list_off.gif');
						
		}
		
		var $img = $('.light').find('a').eq($cNumOfList).find('img');
		var $imgsrc = $img.attr('src');
		var on = $imgsrc.replace(/off.gif/,"on.gif");	
		
		$img.attr('src',on);
		
		// �ش� �������� ����
		
		var sn = ($cNumOfList*10)+1; // j ���۰�
		var en = sn+9; // j ��������

		if ( en > tlen ) { en = tlen; }; 	
			
		$thumDes.empty();
		$thumDes.append(''+sn+'�� ~ '+en+'�� ������ ������ �Դϴ�');
		
		viewChar(0);	
		
		isOnMotion = false;  	
	}
	
	
	// ���� ����
	
	function viewChar(id) {
		
		// ���� �ڽ� Ȱ��ȭ
		$thum.removeClass('sel');
		$thum.parent().parent().parent().find('.moveBlock').eq($cNumOfList).find('li').eq(id).addClass('sel');
		
		// ���� ��ŷ ����
		$viewRank.empty().append(($cNumOfList*10)+(id+1)); 
		
		// ���� �̸�
		$thumTitle = $thum.parent().parent().parent().find('.moveBlock').eq($cNumOfList).find('span').eq(id).text(); 
		$viewTitle.empty().append($thumTitle);
		
		// ���� ����
		$thumBranch.empty().append(($data[(id + ($cNumOfList*10))].branch));
		
		// ���� ����
		$viewProfit.empty().append(($data[(id + ($cNumOfList*10))].profit)).attr('class',$data[(id + ($cNumOfList*10))].stat);
		
		// ���� ȸ��
		$viewMem.empty().append(($data[(id + ($cNumOfList*10))].members));
		
		// ���� �ֽ�
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




