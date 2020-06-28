<%
/*
 * Project Name: 삼성카드 웹 목표달성 이벤트
 * File Name: NHPIMETEVTVIEW434.jsp (목표달성 이벤트)
 * Author: 인투데이타시스템 소재민
 * Created on 2011. 9. 26.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<%

	//String isResult		= (String)request.getAttribute("isResult");		// 이벤트 신청 결과 페이지 여부
	String loginYN		= (String)request.getAttribute("loginYN");
	//String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");

	String grade01 = (String)request.getAttribute("grade01");
	String grade02 = (String)request.getAttribute("grade02");
	String grade03 = (String)request.getAttribute("grade03");
	String grade04 = (String)request.getAttribute("grade04");
	String grade05 = (String)request.getAttribute("grade05");
	String grade06 = (String)request.getAttribute("grade06");
	String grade07 = (String)request.getAttribute("grade07");
	String grade08 = (String)request.getAttribute("grade08");
	//String dupEventB = (String)request.getAttribute("dupEventB");
	String stamp10 = (String)request.getAttribute("stamp10");
	String stamp11 = (String)request.getAttribute("stamp11");
	String stamp12 = (String)request.getAttribute("stamp12");
	
	
	String item03 = (String)request.getAttribute("item03"); //선택한 선물
	//String item04 = (String)request.getAttribute("item04"); //설정금액
	//String usedAmt = (String)request.getAttribute("usedAmt"); //현재까지 사용한금액
	
	//leftAmt = StringUtil.amountToString(intLeftAmt);
		
	String beginDateYN = (String)request.getAttribute("beginDateYN");
	String endDateYN = (String)request.getAttribute("endDateYN");
	String beginMsg = (String)request.getAttribute("beginMsg");
	String endMsg = (String)request.getAttribute("endMsg");
	

	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>이벤트 응모 - 삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0; font:normal 12px '돋움'; color:#666}
img {border:0 none}

strong	{font-weight:bold}
.t_point {color:#333}
.mt5 {margin-top:5px}
.battery {position:relative}


/* 수정111025 */
/*선물내역*/
.battery1 {position:absolute; top:831px; left:84px;}
.battery2 {position:absolute; top:831px; left:272px;}
.battery3 {position:absolute; top:831px; left:493px;}
.battery4 {position:absolute; top:1005px; left:63px;}
.battery5 {position:absolute; top:1005px; left:269px;}
.battery6 {position:absolute; top:1005px; left:475px;}
/*//선물내역*/
/* //수정111025 */

/* 수정111025 */
/*당첨확률*/
.text{font:12px '돋움'; color:#d7472f; }
.chance1 {position:absolute; top:854px; left:47px; width: 200px; text-align: center;}
.chance2 {position:absolute; top:854px; left:251px; width: 213px; text-align: center;}
.chance3 {position:absolute; top:854px; left:461px; width: 217px; text-align: center;}
.chance4 {position:absolute; top:1027px; left:47px; width: 200px; text-align: center;}
.chance5 {position:absolute; top:1027px; left:251px; width: 213px; text-align: center;}
.chance6 {position:absolute; top:1027px; left:461px; width: 217px; text-align: center;}
/*//당첨확률*/
/* //수정111025 */

/* 수정111025 */
/*10월, 11월,12월 배터리이미지*/
.sucess1 {position:absolute; top:460px; left:163px; width:114px; height:166px; background:url('/images/et/battery/battery_01.jpg') no-repeat}
.sucess2 {position:absolute; top:460px; left:285px; width:114px; height:166px; background:url('/images/et/battery/battery_02.jpg') no-repeat}
.sucess3 {position:absolute; top:460px; left:407px; width:114px; height:166px; background:url('/images/et/battery/battery_03.jpg') no-repeat}
/*//10월, 11월,12월 배터리이미지*/
/* //수정111025 */
.stamp_rdo {float:left; vertical-align:top; margin-right:5px}
.stamp_prd {float:left; vertical-align:top; margin-top:2px}
.stamp_prd p {font:bold 11px '돋움'; color:#999; letter-spacing:-1px}
.blank {width:25px; height:25px}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script language="javascript" type="text/javascript">

			
function applyEvent() {
		var chkCheckbox = "N";

/*if(document.form1.objectAmount.value =="000" ){
	alert('휴대폰번호를 확인해주시기 바랍니다.');
	return ;
}*/
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('11924');
	<%
		}else{
	%>
	
<%
if (beginDateYN.equals("N")) {%>
		alert("<%=beginMsg%>");
		return;
<%}%>
<%if (endDateYN.equals("N")) {%>
		alert("<%=endMsg%>");
		return;
<%}%>
<%if (item03.equals("01")) {%>
alert("이미 프라다 가방에 응모하셨습니다.");
return;
<%} else if (item03.equals("02")) {%>
alert("이미 Leica 디지털카메라에  응모하셨습니다.");
return;
<%} else if (item03.equals("03")) {%>
alert("이미 TISSOT 손목시계에 응모하셨습니다.");
return;
<%} else if (item03.equals("04")) {%>
alert("이미 루이비통 카드홀더에 응모하셨습니다.");
return;
<%} else if (item03.equals("05")) {%>
alert("이미 기프트카드 5만원권에 응모하셨습니다.");
return;
<%} else if (item03.equals("06")) {%>
alert("이미 서비스포인트 3,000P에 응모하셨습니다.");
return;
<%}%>


		for(i=0; i<6; i++){
			if(document.form1.gift1[i].checked){
				gift1 = document.form1.gift1[i].value;
				document.form1.selgift.value = gift1;
				chkCheckbox = "Y";
			}
		}

		if(chkCheckbox =="N" ){
			alert("선물을 선택하셔야 응모가 가능합니다.");
			return ;
		}
		
		
		
		

		document.form1.method = "post";

		document.form1.action="/hp/im/et/evt003.do?method=applyBatteryEvent";
		document.form1.target="formhidden"
		document.form1.submit();
<%}%>
}
function resultAlert(msg) {
	if (msg=="ok") {
		
	} else if (msg=="false") {
		alert("이벤트 응모에 실패하셨습니다.");
	} else if (msg=="dup") {
		alert("이미 이벤트에 응모하셨습니다.");
	}
	location.reload();
}
function resultAlertok() {
	alert("응모가 완료되었습니다.")
	location.reload();
	
}

	</script>
</head>

<body>
<form name="form1" method="post" action="">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value=""/>
<input type="hidden" name="ActionMode" value=""/>
<div class="battery">
	
	<!-- battery -->
	<%if ("Y".equals(stamp10)) { %>
	<p class="sucess1">&nbsp;</p>
	<%} %>
	<%if ("Y".equals(stamp11)) { %>
	<p class="sucess2">&nbsp;</p> <!-- 11월 -->
	<%}
	if ("Y".equals(stamp12)) {%>
	<p class="sucess3">&nbsp;</p><!-- 12월 -->
	<%} %>
	<!-- // battery -->
	<!-- 선물내역 -->
	<div class="battery1">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="01" <%if (item03.equals("01")) {%> checked="checked" <%}%> title="프라다 가방 1명" /></label></div>
	</div>
	<div class="battery2">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="02" <%if (item03.equals("02")) {%> checked="checked" <%}%> title="Leica 디지털카메라 2명" /></label></div>
	</div>
	<div class="battery3">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="03" <%if (item03.equals("03")) {%> checked="checked" <%}%> title="TISSOT 손목시계 5명" /></label></div>
	</div>
	<div class="battery4">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="04" <%if (item03.equals("04")) {%> checked="checked" <%}%> title="루이비통 카드홀더 5명" /></label></div>
	</div>
	<div class="battery5">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="05" <%if (item03.equals("05")) {%> checked="checked" <%}%> title="기프트카드 5만원권 100명" /></label></div>
	</div>
	<div class="battery6">
		<div class="stamp_rdo"><label><input type="radio" class="rdo"  name="gift1" value="06" <%if (item03.equals("06")) {%> checked="checked" <%}%> title="서비스포인트 3,000P 2,012명" /></label></div>
	</div>
	<!-- // 선물내역 -->
	<!-- 당첨확률 -->
	<div class="chance1">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></span>
	</div>
	<div class="chance2">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></span>
	</div>
	<div class="chance3">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='5' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></span>	
	</div>
	<div class="chance4">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='5' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></span>
	</div>
	<div class="chance5">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='100' req_cnt='<%=String.valueOf(grade05) %>' inputCss="" /></span>
	</div>
	<div class="chance6">
		<span class="text">당첨확률&nbsp;<fileTag:emzCommon pdt_cnt='2012' req_cnt='<%=String.valueOf(grade06) %>' inputCss="" /></span>
	</div>
	<!-- // 당첨확률 -->
</div>
<img src="/images/et/battery/bg_battery.jpg" alt="행운 배터리 충전!" usemap="#stamp" />
<map name="stamp" id="stamp">
		<area shape="rect" coords="240,1074,476,1127" href="#" alt="이벤트 응모하기" onclick="applyEvent();"/>
</map>
</form>

<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈프레임"></iframe>
</body>

</html>

