// crazybart
// 2012-06-15


$.ajaxSetup ({ cache:false });

function shicRankingMain()
{
		 		 
	this.rankingMain();

}

shicRankingMain.prototype.rankingMain = function () {

    //console.log()
	var $rankCon = $('.rList ul, .fRight ul, .fRight .btn');
	var $listBox = $('.rList ul');
	var $list = $('.rList li');
	var $udArrs = $('.ListArea .prev, .ListArea .next');
	var $sListCon = $('.RankingList .fRight dt:not(.rtitle)').next();
	var $sListConCell;
	var $tImg = $('.rtitle img');
	var $tMon;
	var $tDateTarget = $('.rtitle .num')
	var $tTitle;
	var $tImgAlt = $('.rtitle img');
	
	
	var isOnMotion = false;
	
	var idx;
	var cidx = 2;
	var tid;
	
	var rankingTimer = setInterval( slideTimer, 5000);
	
	function resetTimer() { rankingTimer = setInterval( slideTimer, 5000); }
		
	function slideTimer() { 
	    slideList(0) 
    };
	
	$listBox.css({ top: -91 });
	$list.eq(2).addClass('selected');
	$tDateTarget.empty();
	
	init();
	
	// 좌측 종목랭킹 초기화 > init 
	// 작동순서				> slideList > selStock > updateList > showSSEl
	
	function init() {
		
		$tMon = $list.eq(2).find('span').eq(0).text(); // 좌측 종목랭킹 시간 또는 월
		tid = $list.eq(2).attr('class').slice(7,8);
		
		slideList(cidx);
		
		/*	 
		$listBox.empty();
		
		var rLen = 7;  
		 
		for (var i=1; i<rLen; i++) {
			
			$('<li></li>')
			.html('<a href="#"><span class="num">17</span>시 기준<strong>실시간 인기종목</strong></a>')
			.addClass('rList_0'+(i+1))
			.appendTo($listBox);
			
		}
		*/

	}
	
	$rankCon.mouseenter(function(){
		window.clearInterval(rankingTimer);

	}).mouseleave(function(){
		resetTimer();

	})
	
	
	$list.click(function(e){
		
		e.preventDefault();
		
		idx = $(this).index();
		
		if (idx == 1){
			cidx = -1;
		} else if (idx == 3) {
			cidx = 0;
		} else if (idx == 4) {
			cidx = 1;
		} else {
			return;
		}
		
		slideList(cidx);

	});

	$udArrs.click(function(e){
		
		e.preventDefault();
		
		var dir = $(this).attr('class').substring(4);
		var uid;
		
		(dir == "prev") ? uid = 0 : uid = -1 ;
			
		slideList(uid);

	});
	
	
	// 좌측 종목랭킹 슬라이드
	
	function slideList(ud) {
		
		if (isOnMotion == true) { return; }
		
		isOnMotion = true;
		
		$list = $('.rList li').attr('id','');
		var tempi = $list.eq(ud).attr('id','move');
		
		if (ud == -1) {
			
			$listBox.animate({ top : 0 }, {queue:false, duration: 500, easing:'easeOutQuad' } );
			
			setTimeout(function(){	
				
				tempi.prependTo($listBox);
				$listBox.css({ top: -91 }); 
				
				selStock();
							
			},600); 
				
		} else if (ud == 0) {
			
			$listBox.animate({ top : -182 }, {queue:false, duration: 500, easing:'easeOutQuad' } );
			
			setTimeout(function(){	
				
				tempi.appendTo($listBox);
				$listBox.css({ top: -91 });
				
				selStock();
				  	
			},600);	
			
		} else if (ud == 1) {
					
			$listBox.animate({ top : -182 }, {queue:false, duration: 200, easing:'linear', complete:stockUpP1 } );
			
			function stockUpP1() {
				
				var tempdi1 = $list.eq(0).attr('id','move');
				tempdi1.appendTo($listBox);	
				$listBox.css({ top: -91 });
				
				$listBox.animate({ top : -182 }, {queue:false, duration: 500, easing:'easeOutQuad' } );
						
			};
				
			setTimeout(function(){	
				
				$list = $('.rList li').attr('id','');
				var tempdi2 = $list.eq(0).attr('id','move');
				tempdi2.appendTo($listBox);
				$listBox.css({ top: -91 });
				
				selStock();
				  	
			},800);	
			
		} else {
			
			selStock();
			
		}
			
	}
	
	
	// 좌측 종목랭킹 슬라이드 완료 후 선태된 종목 활성화

	function selStock() {
        
		$list = $('.rList li');
		$list.removeClass('selected');
		$list.eq(2).addClass('selected');
		$tTitle = $list.eq(2).find('strong').text();
		$tMon = $list.eq(2).find('span').eq(0).text(); // 좌측 종목랭킹 시간 또는 월
		$tDay = $list.eq(2).find('span').eq(1).text(); // 좌측 종목랭킨 날짜
		tid = $list.eq(2).attr('class').slice(7,8);

		$tImg.attr('src','../img/ranking/rList_title_0'+tid+'.gif');
		$tImgAlt.attr('alt',$tTitle);
		$tDateTarget.empty();
		
		var tempT = define(tid);
		
		function define(tid) {
			
			if (tid == 2) {
				return '<span>'+$tMon+'</span>월 <span>'+$tDay+'</span>일';
			} else {
				return '<span>'+$tMon+'</span>시 기준';		
			}
			
		}
		
		$tDateTarget.append(tempT)

		updateList(tid);
		
	}
	
	// 우측 주가리스트를 
    
    function updateList(tid) {

		$sListCon.empty();
				
		$('<ul></ul>')
		.html('<li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>')
		.attr('class','scriptAction')
		.appendTo($sListCon);
								
        var $timg = $('.fRight').find('dd').find('dt').find('img');
        var $bBtn = $('.fRight .btn .prev, .fRight .btn .next');
        $bBtn.hide();
        
        if (tid == 6) {
            
            $timg.attr('src','../img/ranking/rList_dt_02.gif');
            $bBtn.show();
            
            var tlen = 22;          
            var $sType = "최대글자";
            var $stitle = "최대글자수...";
            var $imgStat = "../img/icon/new_02.gif";
            var $pValue = "3,569,000";
            var $fluc = "34.12%"
            
            $('<div><div></div></div>').prependTo($sListCon);
            var $No1sListConCell = $sListCon.find('div').children();
            
            for (var i=0; i<3; i++) {               			
                
                $No1sListConCell.append('<ul></ul>')
                                    
                var sn = i*10; // j 시작값
				var en = sn + 10; // j 마지막값	
			
				if (en < 10 || en > tlen) {	en = tlen; } // j 마지막값 트림	
			
                for (var j=sn; j<en; j++) {
                	
                	var $No1sListConCellUl = $No1sListConCell.find('ul').eq(i);
                	
	                $('<li></li>')
	                .html('<a href="#"><span class="type">'+$sType+j+'</span><span class="typeName typeName2">'
	                +$stitle+'<span><img src="'+$imgStat+'" alt="NEW" /></span></span><span class="presentValue">'+$pValue+'</span><span class="fluctuation up">'+$fluc+'</span></a>')
	                .appendTo($No1sListConCellUl);  

                }

            }  
            
            var pos = 0;	
            
            $bBtn.click(function(e){
            	
            	e.preventDefault();
            	
            	var dir = $(this).attr('class');
				var cPos = $No1sListConCell.position().left;
				
				if (dir == "prev")
				
				{
					(pos < 2) ? pos++ : pos = 2 ; 
					if (cPos == -800) return;								

				} else {
					(pos < 1) ? pos = 0 : pos-- ; 
					if (cPos == 0) return;	
					
				}
				
				$No1sListConCell.animate({ left:-400*pos }, {queue:true, duration: 400, easing:'easeOutQuint'} );
				          	
			});
            
        } else {
            
            $timg.attr('src','../img/ranking/rList_dt_01.gif');
            
            var sLen = 11;
            var $stitle = "최대글자수최대글자수";
            var $imgStat = "../img/icon/new_02.gif";
            var $pValue = "3,569,000";
            var $fluc = "34.12%"
            
            $('<ul></ul>').prependTo($sListCon);
            $sListConCell = $('.fRight dl dd ul:not(.scriptAction)');
            
            for (var i=1; i<sLen; i++) {
                
                var zero = 0;       
                if (i > 9) {zero = ""}
                
                $('<li></li>')
                .html('<a href="#"><span class="num">'+zero+i+'</span><span class="typeName">'+$stitle+'<span><img src="'
                +$imgStat+'" alt="NEW" /></span></span><span class="presentValue">'+$pValue+'</span><span class="fluctuation up">'+$fluc+'</span></a>')
                .appendTo($sListConCell);   
    
            }  
        
        }
        
        showSSEl();
           
    }
	
	var $selStockEl;
	var sLen;

	// 종목 활성화 완료후 우측 주가 리스트 등장 애니메이션 
	
	function showSSEl() {
			
		$selStockEl = $('.scriptAction li');
		$selStockEl.show().css({opacity:1});
		sLen = $selStockEl.length;

		setTimeout(function(){	
			
			for (var i = 0; i <sLen; i++) {
				
				$selStockEl.eq(i).stop().delay(i*50).animate({ opacity:0 }, {queue:true, duration: 400, easing:'easeOutQuint'} );		
			}
			
		},300);
		
		setTimeout(function(){	

			$selStockEl.hide();
			
			isOnMotion = false;

		},1500);
			
	}
	
	
};
