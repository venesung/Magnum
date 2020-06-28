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
<title>삼성패밀리카드 업그레이드 이벤트 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; }

img  {border:0;vertical-align: top;}
div,p {margin:0; padding:0}
.vie1 {font-size:11px;position:absolute ;top:306px;left:133px;width:186px;text-align:center;}
.vie2 {font-size:11px;position:absolute ;top:306px;left:316px;width:186px;text-align:center;}
.vie3 {font-size:11px;position:absolute ;top:306px;left:502px;width:186px;text-align:center;}
.vie4 {font-size:11px;position:absolute ;top:480px;left:133px;width:186px;text-align:center;}
.vie5 {font-size:11px;position:absolute ;top:480px;left:316px;width:186px;text-align:center;}
.vie6 {font-size:11px;position:absolute ;top:480px;left:502px;width:186px;text-align:center;}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script language="javascript" type="text/javascript">

			
function applyEvent(gubun) {
		var chkCheckbox = "N";

/*if(document.form1.objectAmount.value =="000" ){
	alert('휴대폰번호를 확인해주시기 바랍니다.');
	return ;
}*/
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('12138');
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
alert("이미 루이비통 가방에 응모하셨습니다.");
return;
<%} else if (item03.equals("02")) {%>
alert("이미 프라다 가방에  응모하셨습니다.");
return;
<%} else if (item03.equals("03")) {%>
alert("이미 구찌 가방에 응모하셨습니다.");
return;
<%} else if (item03.equals("04")) {%>
alert("이미 스타벅스 모바일 기프트카드 1만원권에 응모하셨습니다.");
return;
<%} else if (item03.equals("05")) {%>
alert("이미 서비스포인트 3,000P에 응모하셨습니다.");
return;
<%} else if (item03.equals("06")) {%>
alert("이미 서비스포인트 1,000P에 응모하셨습니다.");
return;
<%}%>


		document.form1.selgift.value = gubun;
		document.form1.method = "post";

		document.form1.action="/hp/im/et/evt003.do?method=applySfcupgradeEvent";
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
function pop201201() {
	window.open('/html/et/sfc_pop.html','pop201201','menubar=0,resizable=0,scrollbars=0,width=710,height=466,left=0,top=0');
}
	</script>
</head>

<body>
<form name="form1" method="post" action="">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value=""/>
<input type="hidden" name="ActionMode" value=""/>
<div style="position:relative">
	<div>
		<div ><img src="/images/et/sfcupgrade/sfcupgrade1.jpg" alt="삼성패밀리카드 업그레이드 이벤트"  usemap="#map1" /></div>
		<map name="map1" id="map1">
			<area shape="rect" coords="193,1011,399,1039" alt="업그레이드서비스 자세히보기" href="#" onclick="pop201201();" title="새창" />
		</map>
  </div>
	<div style="position:relative">
		<img src="/images/et/sfcupgrade/sfcupgrade2.jpg" alt="삼성패밀리카드 업그레이드 이벤트"  usemap="#map2"/>
		<map name="map2" id="map2">
			<area shape="rect" coords="185,329,256,348" alt="응모하기" href="#" onclick="applyEvent('1');" />
			<area shape="rect" coords="374 ,329,444,348" alt="응모하기" href="#" onclick="applyEvent('2');" />
			<area shape="rect" coords="558,329,628 ,348" alt="응모하기" href="#" onclick="applyEvent('3');" />
			<area shape="rect" coords="187,505,257,523" alt="응모하기" href="#" onclick="applyEvent('4');" />
			<area shape="rect" coords="374,504,444,524" alt="응모하기" href="#" onclick="applyEvent('5');" />
			<area shape="rect" coords="558,505,627,525" alt="응모하기" href="#" onclick="applyEvent('6');" />
		</map>
		<p class="vie1">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></p>
		<p class="vie2">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></p>
		<p class="vie3">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></p>
		<p class="vie4">경쟁률 : <fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></p>
		<p class="vie5">경쟁률 : <fileTag:emzCommon pdt_cnt='999' req_cnt='<%=String.valueOf(grade05) %>' inputCss="" /></p>
		<p class="vie6">경쟁률 : <fileTag:emzCommon pdt_cnt='1000' req_cnt='<%=String.valueOf(grade06) %>' inputCss="" /></p>
</div>
<div>
	<img src="/images/et/sfcupgrade/sfcupgrade3.jpg" alt="삼성패밀리카드 업그레이드 이벤트" border="0" usemap="#Map"/>
	<map name="Map" id="Map">
	<area shape="rect" coords="105,712,272,732" href="https://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1233" target="_blank" alt="삼성카드  SFC2 자세히 보기" title="새창"/>
	<area shape="rect" coords="416,712,582,732" href="https://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1235" target="_blank" alt="삼성카드  SFC3 자세히 보기" title="새창"/>
	<area shape="rect" coords="105,741,271,762" href="https://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1234" target="_blank" alt="삼성카드  SFC2+ 자세히 보기"  title="새창"/>
	<area shape="rect" coords="416,741,582,762" href="https://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1236" target="_blank" alt="삼성카드  SFC3+ 자세히 보기" title="새창"/>
	</map>
</div>

</form>

<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈프레임"></iframe>
</body>

</html>

