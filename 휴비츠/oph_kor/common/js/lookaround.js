// crazybart
function lAround()
{	
	this.gallery();
}

lAround.prototype.gallery = function () {

	var $desc;
	var $totalNum;
	var $currentNum = 1;
	var $imgCont = $('.popup_con div').eq(0);
	var $desCont = $('.description');
	var $thumCont = $('.list ul');
	var $thumContW;
	var $thumCell;
	var $thumCellSelected = 0;
	var $thumCellW = 94;
	var $numOfImgs = 7;
	var $numOfPages;
	var $currentPage = 1;

	var $pArr = $('.prev');
	var $nArr = $('.next');
	
	var iurl;
	var desc;
	var cnum = $('.cnum');
	var tnum = $('.tnum');

	var data;

	//setup css
	$('body').css({background:'#ffffff'});

	$.ajax({
		type: 'get'
		, dataType: "xml"
		, url: "../xml/data.xml.php"
		, success: function(xml) {
			data = $('item', xml).get();
			var i = 1;
			$totalNum = $('item', xml).length;
			$numOfPages = Math.ceil($totalNum/$numOfImgs);
			
			$(data).each(function () {
				
				insertThumbs($(this), i);			

				if (i == $totalNum) {
					
					init();
					return;
				}
				i++;
			});

		}
		, error: function(xhr, status, error) {alert(error); }
	});

	function insertThumbs(item, i){
		
		var siurl = item.find('simage').text();
		var desc = item.find('desc').text();
		
		$('<li><a href="#"><img src="'+siurl+'" alt="" width="88" height="56" /></a></li>').appendTo($thumCont);	
		
	}

	function init () {

		iurl = $(data).find('image').eq(0).text();
		desc = $(data).find('desc').eq(0).text();
		$thumCell = $thumCont.find('li');
		 
		$('<img src="'+iurl+'" width="752" height="480" alt="" />').appendTo($imgCont);	
		$desCont.append(desc);
		$('.cnum').append($currentNum);
		$('.tnum').append($totalNum);
		
		$thumContW = $thumCellW * ($totalNum+1);
		$('.list ul').css({width:$thumContW });

		$('.list ul li').eq($thumCellSelected).find('a').css({border: '3px solid #000'});

			//thumnail control

			$thumCell.click(function(e){
				idx = $(this).index();
				$thumCellSelected = idx;
				$('.list ul li a').css({border: '3px solid #fff' })
				$(this).find('a').css({border: '3px solid #000'});

				updateCon(idx);

			});

			$thumCell.mouseenter(function(e){
				idx = $(this).index();
				$('.list ul li a').css({border: '3px solid #fff' })
				$(this).find('a').css({border: '3px solid #000'});

			});

			$thumCell.mouseleave(function(e){

				$('.list ul li a').css({border: '3px solid #fff' })
				$('.list ul li').eq($thumCellSelected).find('a').css({border: '3px solid #000'});

			});
			
			//arrow control

			$pArr.click(function(e){

				if ($currentPage == 1) { return; }
				
				var currentPos = $('.list').position().left;

				$('.list').animate({ left: ( currentPos + 713 ) - 41 }, {queue:false, duration: 1000, easing:'easeOutExpo', complete:onComp } );
				$currentPage--;
			});

			$nArr.click(function(e){

				if ($currentPage == $numOfPages) { return; }
								
				$('.list').animate({ left: (-($currentPage * 672 ) ) + 41 }, {queue:false, duration: 1000, easing:'easeOutExpo', complete:onComp } );
				$currentPage++;

			});

		//setup css
		$('.list_area, .list').find('a').css({outline:0});

	}

	function onComp () {
		var currentPos = $('.list').position().left;
		//$('.popup_con').append($currentPage);

		var tid = ($currentPage-1) * 7
		$thumCellSelected = tid;
		
		$('.list ul li a').css({border: '3px solid #fff' })
		$('.list ul li').eq($thumCellSelected).find('a').css({border: '3px solid #000'});

		updateCon(tid)
	}

	function updateCon(cid) {
		
		$currentNum = cid + 1;

		iurl = $(data).find('image').eq(cid).text();
		desc = $(data).find('desc').eq(cid).text();

		$imgCont.children().attr('src',iurl);
		$desCont.html(desc);

		cnum.html($currentNum);

	}

}
