<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 프리미엄 회원만을 위한 특별 혜택, 프리미엄 쿠폰 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/et.css" />
</head>
<!---BEGIN_ENC--->
<script type="text/javascript">
/*
 * div 인쇄 시작
 */
function printDiv(div) {

    initBody = document.getElementById(div);

    //alert(initBody.childNodes.length);

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;

    window.print();
}

function beforePrint(tempDiv) {

    boxes = document.body.innerHTML;

    for(var index = 0; index < initBody.childNodes.length; index++){

        if(initBody.childNodes[index].tagName == "DIV"){

            initBody.childNodes[index].style.display = "block";

        }

    }

    document.body.innerHTML = initBody.innerHTML;
}

function afterPrint() {
     document.body.innerHTML = boxes;
}
 
function keypressed() { 
	alert(event.keyCode);
if (event.keyCode==44) {  
	//alert("죄송해요..");  
	}  


}

document.onkeydown=keypressed(); 

function clock() {
    var now=new Date()
    var hrs= now.getHours()
    var mins=now.getMinutes()
    var secs=now.getSeconds()
    var disp=((hrs>12) ? (hrs-12) : hrs) + ":"
    disp+=((mins<10) ? "0" + mins : mins) + ":" + ((secs<10) ? "0" + secs : secs)
    disp+=((hrs>12) ? " PM" : " AM")
    status=disp
//to make it in the form feild..just use the same
//scripting as above..but just add this next line in
//place off "status=disp"

            setTimeout("clock()", 0);
}
function ClipBoardClear(){
    if(window.clipboardData) clipboardData.clearData();
   }
setInterval("ClipBoardClear();", 1000);
</script>
<body>

<div id="pop_wrap" bgproperties="fixed" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" onload="clock();" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/cm/ski2010/pop_h1_premiumcoupon.png" alt="삼성카드 프리미엄 회원만을 위한 특별 혜택, 프리미엄 쿠폰" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h445">

		<div class="content_block content_block_card clfix">

			<p><img src="/images/cm/ski2010/img_premiumcoupon101130.jpg" alt="휘닉스파크 리프트/렌탈 최대 40% 할인권" /></p>
			<div class="btnset mt10">
				<p class="btnc"><a href="javascript:printDiv('pop_wrap')"><img src="/images/common/btn_cpn_print.png" alt="쿠폰 출력하기" /></a></p>
			</div>

		</div>
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> <!-- 100311 -->
	</div>
</div>
</body>
<!---END_ENC--->
</html>