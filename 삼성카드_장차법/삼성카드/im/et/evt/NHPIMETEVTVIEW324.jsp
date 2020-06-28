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
<title>한가위 CGV,롯데시네마 2,000원 캐시백 이벤트 - 삼성카드</title>
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
	<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
	
	<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=applyChoosuckMovie" method="post"></form>
	
	<img src="/images/et/movie_event_09.jpg" alt="한가위 CGV,롯데시네마 2,000원 캐시백 이벤트" border="0" usemap="#event_100825" />
	<map name="event_100825" id="event_100825">
		<!--  <area shape="rect" coords="110,868,203,902" href="javascript:parent.goTabPage('NHPIMSSFAM001M001');" /> 
		<area shape="rect" coords="313,868,404,900" href="javascript:applyEvent()" />	goTabPageWithParam
		<area shape="rect" coords="489,1083,605,1119" href="javascript:parent.goTabPage('NHPIMSSFAM001M002');" /> 
		<area shape="rect" coords="399,904,466,925" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428');"/>
		<area shape="rect" coords="399,930,466,950" alt="자세히보기" href="http://shopping.samsungcard.com/ec/sp/spMain.do?method=selectSPMain" target="_blank"/>
		<area shape="rect" coords="399,959,466,978" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0286');"/>
		<area shape="rect" coords="340,1056,406,1075" alt="자세히보기" href="#" onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');"/>
		<area shape="rect" coords="340,1172,406,1192" alt="자세히보기" href="http://travel.samsungcard.com" target="_blank"/>
		<area shape="rect" coords="233,1259,500,1322" alt="응모하기" href="javascript:applyEvent()" /> -->
		
<area shape="circle" alt="응모하기" coords="623,348,42" href="javascript:applyEvent()" />
<area onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0169')" shape="rect" alt="빅앤빅아멕스카드 자세히 보기" coords="496,674,573,694" href="#" />
<area onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505')" shape="rect" alt="카앤모아카드 자세히 보기" coords="374,703,452,722" href="#" />
<area onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428')" shape="rect" alt="쇼핑앤모아카드 자세히 보기" coords="374,727,452,745" href="#" />
<area onclick="parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0161')" shape="rect" alt="블루아멕스카드 자세히 보기" coords="374,750,453,768" href="#" />
<area onclick="parent.goTabPage('NHPIMCDCPS001');" shape="rect" alt="애니패스포인트카드, 지엔미포인트 카드 자세히 보기" coords="497,795,574,812" href="#" />
<area shape="rect" alt="롯데시네마 할인(매주 목요일 2,000원 현장 할인) 자세히 보기" coords="401,931,478,949" href="#" onclick="parent.goTabPageWithParam('NHPIMETEVTDTL','cmsSeq=9627');" />
<area shape="rect" target="_blank" alt="롯데시네마 할인(삼성모바일기프트카드 이용시) 자세히 보기" coords="472,1013,550,1031" href="http://giftmall.samsungcard.com//ec/sw/mg/fr/cs/cardPurchase.do?method=selectPurchaseList&amp;frontGoodCode=15504&amp;goodGpCode=1000" title="새창" />
		
		
	</map>
	
	<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>
</body>
</html>