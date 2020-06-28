<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: file_name
 * Author: "삼성SDS 김동현 사원"
 * Created on 2010. 1. 19.
 * 테마여행
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<%
	String strPopGubun = (String)request.getAttribute("strPopGubun");
	String eventNo = (String)request.getAttribute("eventNo");
	String loginYN = (String)request.getAttribute("loginYN") == null ? "" : (String)request.getAttribute("loginYN") ;
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/class.css" />
<style type="text/css">
body{overflow-x:hidden;}
#pop_speedmate{width:710px;}
@media print {
h1, #pop_footer ,#btn , .conts_hidden{display:none}
}
#pop_content {height:100%}
</style>

<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>

<script language="javascript">
	
function printDiv(div) {
    initBody = document.getElementById(div);
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

function couponPrint() {

	document.form1.target = "applyResultFrame";
	document.form1.submit();
}

function printOk() {
	printDiv('pop_wrap');
}

function coupon_Ok() {
	alert("이벤트를 이용하실 수 없습니다.\n\n신용카드이용회원에 한합니다.");
	window.close();
}

function body_onload() {
	if ( '<%=loginYN%>' == 'N' ) {
		alert("세션이 만료되었습니다.");
		window.close();
	}
}
</script>

</head>
<body onload="body_onload();">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
<form name="form1" action="/hp/im/et/evt002.do?method=setCouponPopApply" method="post">
<input type="hidden" name="popgubun" value="${strPopGubun}"/>
<input type="hidden" name="eventNo" value="${eventNo}"/>
<input type="hidden" name="loginYN" value="${loginYN}"/>
<div id="pop_wrap">
         <!--  710 x 575 --><!-- header -->

            <h1><img src="/images/et/coupon/h1_samsung_coupon.png" alt="COUPON, 삼성 가족만을 위한 특별 혜택" /></h1>
         <!-- content -->
		<div id="pop_content">
<%
	if ( strPopGubun.equals("1") ) {
%>
			<p class="al_center mt20"><img src="/images/et/coupon/coupon_1.png" alt="매드 포 갈릭 무료쿠폰" border="0"/></p>
			<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%
	} else if ( strPopGubun.equals("2") ) {
%>
		<p class="al_center mt20"><img src="/images/et/coupon/coupon_2.png" alt="스파게띠아 무료쿠폰" border="0"/></p>
		<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%
	} else if ( strPopGubun.equals("3") ) {
%>
		<p class="al_center mt20"><img src="/images/et/coupon/coupon_3.png" alt="토니로마스 무료쿠폰" border="0"/></p>
		<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%
	} else if ( strPopGubun.equals("4") ) {
%>
		<p class="al_center mt20"><img src="/images/et/coupon/coupon_4.png" alt="비스트로 서울 무료쿠폰" border="0"/></p>
		<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%
	} else if ( strPopGubun.equals("5") ) {
%>
		<p class="al_center mt20"><img src="/images/et/coupon/coupon_5.png" alt="모락 무료쿠폰" border="0"/></p>
		<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%
	} else if ( strPopGubun.equals("6") ) {
%>
		<p class="al_center mt20"><img src="/images/et/coupon/coupon_6.png" alt="시추안하우스 무료쿠폰" border="0"/></p>
		<p class="al_center mt20 " style="padding-bottom:20px;"  id="btn"><a onclick="couponPrint();" href="#"><img src="/images/et/coupon/btn_coupon_print.png" alt="쿠폰 출력하기" /></a></p>
<%  } %>
		</div>
         <!-- footer -->

	<div id="pop_footer">
		<p><img src="/images/et/coupon/pop_bottom.png" alt="Copyright@ 2013. samsungcard. All rights reserved." border="0" usemap="#Map" />
		<map name="Map" id="Map">
			<area shape="rect" coords="669,9,699,25" href="#" alt="CLOSE" title="닫기" onclick="window.close();" />
	    </map></p>
	</div>
</div>
</form>
</body>
</html>