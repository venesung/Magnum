// crazybart
// 2012-06-04

var shicHS = null;
var addr = null;
var historyCache = null;
var codeNo = null;

var $sitem;
var $box;
var $conta;
var $leftA;
var $pLoad = $('<img />').attr('src', '../img/ajax-loader.gif');

$.ajaxSetup ({ 

	cache:false
	
});

function shicRanking()
{
		 		 
	$sitem = $('tr .type');
	
	$sitem.click(function(e) {
		
		e.preventDefault();
		
		openLayer();
			
	});
	
}

function openLayer () {
	
	$conta = $('.ContentsArea');
	$leftA = $('.LeftArea');
	
	if (addr != null) { addr = null; }
	addr = $sitem.attr('href') + "?" + new Date().getTime();
	
	var ifHeight = 3300;

		
		$('#SkipToContents').css({height:ifHeight - 200 });
		$leftA.css({height:ifHeight + 200 });
		
		$container = $("<div></div>")
		.css({ "position":"absolute", "margin-left":"48px", "width":"800px", "height":"3300px", "top":"57px", "background-color":"#ffffff", "overflow":"hidden"})
		.attr('class','tempBox')
		.appendTo($conta);
		
		$box = $("<div></div>");
		$box.appendTo($container);
		
		$box.html('<img src="../img/loader.gif" width="32" height="32" style="margin-top:200px;margin-left:382px"/>');
		
		$.ajax({

			type: "GET",
			beforeSend : function(xhr) {
            	
       		},
       		contentType: 'text/html; charset=utf-8',
			url: addr,
			dataType: 'html',
						
			success: function(data){
			
				//alert(data)
				$box.html(data);
				
				if (shicHS != null) { delete(shicHS);}
				shicHS = new shichistory();
				
			}
			
		});
		
		/*
		$.post(addr , function(data) {
			alert(data)	
  			$box.html(data);

			if (shicHS != null) { delete(shicHS);}
			shicHS = new shichistory(historyCache,codeNo);
			
		});
		*/
			
}




