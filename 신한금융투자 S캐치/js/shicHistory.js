// crazybart
// 2012-06-04


function shichistory()
{	

	stockId = 0;
	this.history();
	
        
}

shichistory.prototype.history = function () {

	var $arrs = $('.type_history .prev, .type_history .next');
	var $itemCon = $('.type_list ul');
	
	// cookie 
	
	function getCookie(name) {
		var prefix = name + "=";
                 
		var startIdx = document.cookie.indexOf(prefix);
                
			if (startIdx == -1)
			return null;
                 
			var endIdx = document.cookie.indexOf(";", startIdx + prefix.length);   
			if (endIdx == -1)
			endIdx = document.cookie.length;
                 
			return unescape(document.cookie.substring(startIdx + prefix.length, endIdx));
                
        }
                                    
        var str = getCookie('sp_code_history');
        var nStr = str.split("|");
        var nLen = (nStr.length)-1;
                        
        $itemCon.empty();
                        
        for (var i = 0; i < nLen; i++ ) {
                                
                var nStri = nStr[i].split(",");

                $('<li></li>').html('<a href="#">'+nStri[1]+'</a> <a href="#"><img src="../img/button/close_off.gif" alt="�ݱ�" /></a>').attr('id',nStri[0]).appendTo($itemCon);
        
        }
	
	var $item = $('.type_list li a:not(:has(img))');
	var $itemConP = $itemCon.position().left;
	var dWidth = 624;
	var dMargin = 35;
	var $items;
	var len;
	var $itemConW; 
	var $itemConDefaultW = $('.type_list').width(); 
	var $itemFirstW = $itemCon.find('li').eq(0).width();
	var $isOnMotion = false;
	
       
 
 	selStock();
	getWidth();
	checkPosition();
	
	// �ֽļ���

	function selStock() {

		for (var i =0; i<len; i++) {
			
			$('.type_list').find('li').eq(i).find('img').attr('src','../img/button/close_off.gif');
						
		}
		
		$item.parent().removeClass('selected');	
		$item.parent().eq(stockId).addClass('selected');
		
		var $img = $('.type_list').find('li').eq(stockId).find('img');
		var $imgsrc = $img.attr('src');
		
		var on = $imgsrc.replace(/off.gif/,"on.gif");	
		
		//�����ڵ�
		var codeNo = $item.parent().eq(stockId).attr('id');

		$img.attr('src',on); 
		

	}

	// ����Ʈ �ʱ� ���̰� ������ �����丮 ���� ����
	
	function getWidth() {
 		
		len = $('.type_list li').length;
		$itemConW = 0;
		$itemFirstW = $itemCon.find('li').eq(0).width() + dMargin;
 
		for (var i=0;i<len;i++ )
		{		
			$itemConW += ($itemCon.find('li').eq(i).width()) + dMargin; 
			$itemCon.css({width:$itemConW});
		}
	}
	
	// ���õ� �������� �Ⱥ��̶�
	
	function checkPosition() {
		
		if ($('.selected').position().left > 520) {
			
			stockId = 0;
 			
 			selStock();
		}
	}
	
	// �¿� ȭ��ǥ ��Ʈ��
 
	$arrs.click(function(e){
		
		var dir = $(this).attr('class');	
		$itemFirstW = $itemCon.find('li').eq(0).width();
 
		if ($itemConW < dWidth){ return; };
		if ($isOnMotion == true){ return; };
		
		if (dir == "prev")
		{
			$items = $('.type_list ul li');
			$items.attr('id','');
			var tempi = $items.eq(-1).attr('id','move');
			
			$('#move').prependTo($itemCon);
		
			$itemCon.css({left: $itemCon.position().left - ($itemFirstW+dMargin)} );
			
			$itemCon.animate({ left : 0 }, {queue:false, duration: 500, easing:'easeOutQuint', complete:onCompMovingLeft } );
			
			( stockId == (len-1) ) ? stockId =  0 : stockId++  ;

 
		} else {
 
			$itemConP = $itemCon.position().left;

			$itemCon.animate({ left : $itemConP - ($itemFirstW+21) }, {queue:false, duration: 500, easing:'easeOutQuint', complete:onCompMovingRight } );
				
			( stockId == 0 ) ? stockId =  (len-1) : stockId--  ;


		}
 
		$isOnMotion = true;
 
	});
	
	// ������ �Ϸ� �� �ʱ�ȭ
	
	function onCompMovingRight() {
		
		$isOnMotion = false;
 
		$items = $('.type_list ul li');
		$items.attr('id','');
		var tempi = $items.eq(0).attr('id','move');
 
		$('#move').appendTo($itemCon);
 
		$itemCon.css({left: 0});
			
		//checkPosition();
		
	}
 
	function onCompMovingLeft() {
		
		$isOnMotion = false;
		
		//checkPosition();
		
	}
 
 	// ����Ʈ ����
 	
 	$item.live('click',function(e) {
 
		var idx = $(this).parent().index();

		stockId = idx;
		
		$item.parent().removeClass('selected');	
		$(this).parent().addClass('selected');

		selStock();
 		
	});
 	
 	// ����Ʈ ����
 
	$itemCon.find('li img').live('click',function(e) {
 
		if ($isOnMotion == true){ return; };
		
		var cidx = $(this).parent().parent().index();
 
 		if (stockId == cidx) { 
 		        
 		        stockId = 0 ;
 		         
                } else if ( stockId > cidx ) {
                        
                        if (cidx == 0 && stockId == 1) {
                                 
                                stockId = 0;      
                                  
                        } else {
                                
                                stockId  = stockId - 1 ; 
                                            
                        }         
                                      
                } 

		$(this).parent().parent().remove();
		
		getWidth();
		selStock();
		
	});

}
