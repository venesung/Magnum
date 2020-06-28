// ������ư, üũ�ڽ� �̹���ȭ Start



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

	

	// ������� �ݺ�

	var cHeight = $(".RightArea").innerHeight();

	//alert(cHeight)

	$(".LeftArea").css("height", cHeight + "px")

});

// ������ư, üũ�ڽ� �̹���ȭ End





/* ������� �ݺ� */

$(window).resize(function() {

	var cHeight = $(".RightArea").innerHeight();

	$(".LeftArea").css("height", cHeight + "px")

});



/* ȭ�� ���� �̵� */

function slideLayout(){

	//console.log($(".RightArea").css("left"))

	

	if($(".RightArea").css("left") == "160px") {

		$(".RightArea").stop().animate({left: '80px'},1000);

	} else {

		$(".RightArea").stop().animate({left: '160px'},1000);

	}

};



/* ��Ʈ���� */

function showChart() {

	$("#chartView").toggle();

}



/* Footer */

function showFooter(str) {

	$("#" + str).toggle();

}



/* ���� �� ���� ���� �� */

function showTotalLayer(num){

	for(i=1; i< 3; i++) {

		$("#BtnTab" + i).attr("src", "../img/type/tab_new_0" + i + "_off.gif");

		$("#TotalTab_" + i).css("top","-9999px");

	}

	$("#BtnTab" + num).attr("src", "../img/type/tab_new_0" + num + "_on.gif");

	$("#TotalTab_" + num).css("top","0px");

}

/* ���� �� Business Summary �� */

function showTotalLayer2(num){

	for(i=1; i< 3; i++) {

		$("#BtnTab_" + i).attr("src", "../img/type/tab_business_0" + i + "_off.gif");

		$("#TotalTab_" + i).css("top","-9999px");

	}

	$("#BtnTab_" + num).attr("src", "../img/type/tab_business_0" + num + "_on.gif");

	$("#TotalTab_" + num).css("top","0px");

}



/* �˻����� */

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