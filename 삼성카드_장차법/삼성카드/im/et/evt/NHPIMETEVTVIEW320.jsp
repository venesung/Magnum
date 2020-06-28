<%/*
 * Project Name: 추석이벤트 전사 메인
 * File Name: NHPIMETEVTVIEW320.jsp
 * Author: "삼성SDS 소재민"
 * Created on 2010. 8. 30.
 * 추석 전사 이벤트
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<title>추석 황금연휴!! 한가위 스페셜 - 삼성카드</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script type="text/javascript">
function applyEvent() {
	
	document.evtFrm.target = "applyResultFrame";
	document.evtFrm.submit();
}
</script>
</head>

<body>
	<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
	
	<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=applyChoosuck" method="post"></form>
	
	<img src="/images/et/event_100824.jpg" alt="추석 황금연휴!! 한가위 스페셜" border="0" usemap="#event_100825"/>
	<map name="event_100825" id="event_100825">
		<!--  <area shape="rect" coords="110,868,203,902" href="javascript:parent.goTabPage('NHPIMSSFAM001M001');" /> 
		<area shape="rect" coords="313,868,404,900" href="javascript:applyEvent()" />	goTabPageWithParam
		<area shape="rect" coords="489,1083,605,1119" href="javascript:parent.goTabPage('NHPIMSSFAM001M002');" /> -->
		<area shape="rect" coords="399,904,466,925" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428');"/>
		<area shape="rect" coords="399,930,466,950" alt="자세히보기" href="https://shopping.samsungcard.com/ec/sp/spMain.do?method=selectSPMain" target="_blank" title="새창"/>
		<area shape="rect" coords="399,959,466,978" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0286');"/>
		<area shape="rect" coords="340,1056,406,1075" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');"/>
		<area shape="rect" coords="340,1172,406,1192" alt="자세히보기" href="https://travel.samsungcard.com" target="_blank" title="새창"/>
		<area shape="rect" coords="233,1259,500,1322" alt="응모하기" href="javascript:applyEvent()" />
	</map>
	
	<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>
</body>
</html>