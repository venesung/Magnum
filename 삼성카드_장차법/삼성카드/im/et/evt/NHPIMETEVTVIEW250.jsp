<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW250.jsp
 * Author: "삼성SDS 김기현 사원"
 * Created on 2010. 6. 15.
 * My 패밀리 서비스 신청 이벤트
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<title>나의 가족, My 패밀리 이벤트 - 삼성카드</title>
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
	<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyMyFamilyServiceEvent" method="post"></form>
	
	<img src="/images/et/myfamily0601.jpg" width="712" height="1256" border="0" usemap="#Map" alt="나의 가족, My 패밀리 이벤트"  />
	<map name="Map" id="Map">
		<area shape="rect" coords="110,868,203,902" href="javascript:parent.goTabPage('NHPIMSSFAM001M001');" alt="신청하기" /> <!-- 신청하기 -->
		<area shape="rect" coords="313,868,404,900" href="javascript:applyEvent()" alt="응모하기" />	<!-- 응모하기 -->
		<area shape="rect" coords="489,1083,605,1119" href="javascript:parent.goTabPage('NHPIMSSFAM001M002');" alt="자세히 보기" /> <!-- 자세히 보기 -->
	</map>
	
	<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>
</body>
</html>