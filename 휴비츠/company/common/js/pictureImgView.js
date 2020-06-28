/**
 * @author mvint-wssoo
 */

function PictureImgView()
{	
	this.gallery();
}

PictureImgView.prototype.gallery = function () {

	var $desc;
	var $totalNum;
	var $currentNum = 1;
	var $imgCont = $('.viewer_fc div').eq(0);
	var $desCont = $('.description');
	var $thumCont = $('.list ul');
	var $thumContW;
	var $thumCell;
	var $thumCellSelected = 0;
	var $thumCellW = 94;
	var $numOfImgs = 3;
	var $numOfPages;
	var $currentPage = 1;

	var $pArr = $('.prev');
	var $nArr = $('.next');
	
	var iurl;
	var desc;
	var cnum = $('.cnum');
	var tnum = $('.tnum');

	var data;
	
	$imgCont.empty();
	 
	//setup css
	$('body').css({background:'#ffffff'});

	$.ajax({
		type: 'get'
		, dataType: "xml"
		, url: "../xml/data.xml"
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
		, error: function(xhr, status, error) {}
	});

	function insertThumbs(item, i){
		
		var siurl = item.find('simage').text();
		var desc = item.find('desc').text();
		
		$('<li><a href="#"><img src="'+siurl+'" alt="" width="82" height="56" /></a></li>').appendTo($thumCont);	
		
	}

	function init () {

		iurl = $(data).find('image').eq(0).text();
		desc = $(data).find('desc').eq(0).text();
		$thumCell = $thumCont.find('li');
		 
		$('<img src="'+iurl+'" width="340" height="277" alt="" />').appendTo($imgCont);	
		$desCont.append(desc);
		$('.cnum').append($currentNum);
		$('.tnum').append($totalNum);
		
		$thumContW = $thumCellW * ($totalNum+1);
		$('.list').css({left:'29px'});
		$('.list ul').css({position:'absolute', width:$thumContW, height:'58px', left:'0px' });

		$('.list ul li').eq($thumCellSelected).find('a').css({border: '3px solid #000'});

			//thumnail control

			$thumCell.click(function(e){
				e.preventDefault();
				
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
			
			var leftImgMove = [];
			
			for( var z = 0; z < $numOfPages; z++ ){
				leftImgMove[z+1] = -z * 282; // 282  -> (보여야 될 이미지 갯수 * width) + (img 간 마진 값)*이미지 갯수 + (볼드값 * 3)
				
			}
			
			$pArr.click(function(e){
				e.preventDefault();
								
				if ($currentPage == 1) { return; }
				var currentPos = $('.list ul').position().left;
				
				$('.list ul').stop().animate({ left:  (leftImgMove[$currentPage] + 282) }, {queue:false, duration: 1000, easing:'easeOutExpo', complete:onComp } );
				$currentPage -= 1;
				
				
				
			});

			$nArr.click(function(e){
				e.preventDefault(); 
				
				if ($currentPage == $numOfPages) { return; }
												
				$('.list ul').stop().animate({ left: (-($currentPage * 282) ) }, {queue:false, duration: 1000, easing:'easeOutExpo', complete:onComp } );
				$currentPage += 1;
					

			});
			


		//setup css
		$('.list_area, .list').find('a').css({outline:0});

	}

	function onComp () {
		var currentPos = $('.list').position().left;
		//$('.popup_con').append($currentPage);

		var tid = ($currentPage-1) * 3
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
