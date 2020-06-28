// crazybart
// 2012-06-11

var cidx;
var pageUrls  = [["stock/trade_01.html","stock/basic_01.html","stock/tech_01.html"],
					["option/basic_01.html","option/trade_01.html","option/fund_01.html","option/strategy_01.html"],
					["elw/feature.html","elw/summary_01.html","elw/structure_01.html","elw/kind_01.html","elw/invest_01.html"],
					["etf/etf_list.html"],
					["fund/basic_01.html","fund/exp_01.html","fund/mgt_01.html"],
					["product/indirect.html","product/stock_01.html","product/mutual.html","product/abroad_01.html","product/ship.html","product/etf.html","product/els.html","product/wrap_account.html"],
					["bond/info_01.html","bond/market_01.html","bond/trade_01.html"],
					["insu/basic_01.html","insu/guide_01.html","insu/banka.html"]
				];
var pageTitles = [["�ֽĸŸ�","�⺻���м�","������м�"],
					["�����ɼ� �������","�����ɼ� �Ÿ�����","�����ɼ� �ڱݰ���","�����ɼ� ��������"],
					["ELW �ֿ�Ư¡","ELW ���尳��","ELW ��������","ELW ����","ELW ��������"],
					["ETF"],
					["���ʰ���","�ݵ����� ����","�ݵ����� ����"],
					["��������","��������","���߾��ݵ�","�ؿ��ݵ�","�����ݵ�","ETF","ELS","����ī��Ʈ"],
					["ä������","ä�ǽ���","ä�ǸŸ�"],
					["����⺻����","���谡�԰��̵�","��ī������"],
				];

function shiceduPop()
{	
	
	this.eduPop();
	
}

function shicedu()
{	
	
	this.eduMenu();
	
}



// �������ڱ��� �ε���������

shiceduPop.prototype.eduPop = function () {
	
	var $btn = $('.reBox .btns img');
	var bidx;
	
	$btn.click(function(e){
		
		e.preventDefault();
		cidx = $(this).parent().parent().parent().find('dt').children().attr('src').slice(-5,-4) - 1;
			
	})

}


function openPop() {
	
	if (cidx == 3) {
			window.open('school/'+pageUrls[cidx],'ETF','width=1096,height=700,toolbar=0,resizable=0,scrollbars=yes');
	} else {
			window.open('pop_school.html','�������ڱ���','width=920,height=770,toolbar=0,resizable=0');	
	}
	
}

// �������ڱ��� �˾�������

shicedu.prototype.eduMenu = function () {
	
	cidx = opener.cidx;
	
	resetMenu(cidx);
	appendSnb(); 
	selectMenu(cidx);
		
	var lMenu = $('.LeftArea li');
	var sMenu;
	var len = lMenu.length;
	var idx;
	var self;
	
	function appendSnb() {
		
		var $snbCon = $('.snb ul');
		var slen = pageTitles[cidx].length;
		var $stimg = $('#SkipToContents img');
		
		$snbCon.empty();
		
		for (var i =0; i<slen; i++) {
			
			$('<li><a href="#">'+pageTitles[cidx][i]+'</a></li>').appendTo($snbCon);	
				
		}
		
		$('.snb li').eq(0).addClass('on');
		$('.snb li').eq(-1).addClass('last');
		$stimg.attr('src','../img/edu/pop_stitle_'+cidx+0+'.gif');
		
		sMenu = $('.snb a');
		
		sMenu.click(function(){

			var idx = $(this).parent().index();
			var $pageUrl = $('#SkipToContents iframe');	
			
			$('.snb li').removeClass('on');
			$('.snb li').eq(idx).addClass('on');
			
			$pageUrl.attr('src', 'school/'+pageUrls[cidx][idx]);
			$stimg.attr('src','../img/edu/pop_stitle_'+cidx+idx+'.gif');
				
		});
	};
	
	lMenu.mouseenter(function(e) {
		
		self = $(this);
		idx = self.index();
		
		var $img = $('.LeftArea').find('li').eq(idx).find('img');
		var $imgsrc = $img.attr('src');
		var on = $imgsrc.replace(/off.gif/,"over.gif");	
		
		$img.attr('src',on);  
		
			
	}).mouseleave(function(e) {
			
		resetMenu(cidx);	
		
			
	}).click(function(e) {
		
		var pidx = cidx;

		cidx = self.index();	
		
		lMenu.removeClass('on');
		self.addClass('on');
		
		if (cidx == 3) {
			window.open('school/'+pageUrls[cidx],'ETF','width=1096,height=700,toolbar=0,resizable=0,scrollbars=yes');
			selectMenu(pidx);
			resetMenu(pidx);
			
			cidx = pidx;
			
		} else {
			selectMenu(cidx);
			resetMenu(cidx);
			appendSnb(); 
		}	
		
	});
	
	function selectMenu(cidx) {
			
		var $img = $('.LeftArea').find('li').eq(cidx).find('img');
		var $imgsrc = $img.attr('src');
		var $pageUrl = $('#SkipToContents iframe');	
		var src = $imgsrc.slice(-7,-4);
		var on;
		
		$('.LeftArea').find('li').eq(cidx).addClass('on');
		
		if (src == "off") {
			on = $imgsrc.replace(/off.gif/,"on.gif");
		} else {
			on = $imgsrc.replace(/over.gif/,"on.gif");
		}	
		
		$img.attr('src',on); 	
		$pageUrl.attr('src', 'school/'+pageUrls[cidx][0]);	
		$('.snb li').eq(0).addClass('on');
			
	}
	
	function resetMenu(cidx) {
		
		for (var i =0; i<len; i++) {
			
			if (i != cidx) {
				$('.LeftArea').find('li').eq(i).find('img').attr('src','../img/edu/pop_lnb_0'+(i+1)+'_off.gif');	
			}				
		}	
	}

}
