// 라디오버튼, 체크박스 이미지화 Start



function setupLabel() {

	if ($('.label_check input').length) {

		$('.label_check').each(function(){ 

			$(this).removeClass('c_on');

		});

		$('.label_check input:checked').each(function(){ 

			$(this).parent('label').addClass('c_on');

		});                

	};

	if ($('.label_radio input').length) {

		$('.label_radio').each(function(){ 

			$(this).removeClass('r_on');

		});

		$('.label_radio input:checked').each(function(){ 

			$(this).parent('label').addClass('r_on');

		});

	};

};

$(document).ready(function(){

	$('body').addClass('has-js');

	$('.label_check, .label_radio').click(function(){

		setupLabel();

	});

	setupLabel(); 

	

	// 좌측배경 반복

	var cHeight = $(".RightArea").innerHeight();

	//alert(cHeight)

	$(".LeftArea").css("height", cHeight + "px")

});

// 라디오버튼, 체크박스 이미지화 End





/* 좌측배경 반복 */

$(window).resize(function() {

	var cHeight = $(".RightArea").innerHeight();

	$(".LeftArea").css("height", cHeight + "px")

});



/* 화면 좌측 이동 */

function slideLayout(){

	//console.log($(".RightArea").css("left"))

	

	if($(".RightArea").css("left") == "160px") {

		$(".RightArea").stop().animate({left: '80px'},1000);

	} else {

		$(".RightArea").stop().animate({left: '160px'},1000);

	}

};



/* 차트보기 */

function showChart() {

	$("#chartView").toggle();

}



/* Footer */

function showFooter(str) {

	$("#" + str).toggle();

}



/* 종목 상세 뉴스 공시 탭 */

function showTotalLayer(num){

	for(i=1; i< 3; i++) {

		$("#BtnTab" + i).attr("src", "../img/type/tab_new_0" + i + "_off.gif");

		$("#TotalTab_" + i).css("top","-9999px");

	}

	$("#BtnTab" + num).attr("src", "../img/type/tab_new_0" + num + "_on.gif");

	$("#TotalTab_" + num).css("top","0px");

}

/* 종목 상세 Business Summary 탭 */

function showTotalLayer2(num){

	for(i=1; i< 3; i++) {

		$("#BtnTab_" + i).attr("src", "../img/type/tab_business_0" + i + "_off.gif");

		$("#TotalTab_" + i).css("top","-9999px");

	}

	$("#BtnTab_" + num).attr("src", "../img/type/tab_business_0" + num + "_on.gif");

	$("#TotalTab_" + num).css("top","0px");

}



/* 검색보기 */

function showSearch(obj) {

		//console.log(obj.src)

		if(document.getElementById("HiddenSearch").style.display == "none") {

			$("#HiddenSearch").slideDown();

			obj.src = "../img/button/search_open_01.gif"

		} else {

			$("#HiddenSearch").slideUp();	

			obj.src = "../img/button/search_close_01.gif"

		}

}