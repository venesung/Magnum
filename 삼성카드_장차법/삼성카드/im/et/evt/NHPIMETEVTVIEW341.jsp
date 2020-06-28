<%
/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW341.jsp (설맞이 CGV/롯데시네마/메가박스 캐시백 이벤트)
 * Author: 인투데이타시스템 이중건
 * Created on 2011. 1. 5.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<%

	String isResult		= (String)request.getAttribute("isResult");		// 이벤트 신청 결과 페이지 여부
	String loginYN		= (String)request.getAttribute("loginYN");
	String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");

%>


<title>설맞이 CGV , 롯데시네마, 메가박스 캐시백 이벤트 -  삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
</style>
<script language="javascript" type="text/javascript">

<%	if(isResult.equals("Y")) {
		if(resultMsg != null && resultMsg.length() > 0) {	%>
		
			alert("<%=resultMsg %>");
			
<%		}
	} else {	%>
	
		function applyEvent() {
		<%	if(eventIngYN.equals("")) {
				if(loginYN.equals("Y")) {	%>
					document.evtFrm.target = "applyResultFrame";
					document.evtFrm.submit();
		<%		} else {	%>
					parent.eventLogin('11202');
		<%		}
			} else if(eventIngYN.equals("before")) {	%>
				alert('이벤트 응모는 2011년 1월 11일부터 가능합니다.');
		<%	} else if(eventIngYN.equals("after")) {		%>
				alert('이벤트가 종료되었습니다');
		<%	}	%>
		}
		
		function postponePop() {
			setCookie("MOVIECASHBACK_2011_NEW_YEAR", "Y", 1);
			window.close();
		}
	
		function setCookie(name, value, expiredays) {
		    var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + expiredays);
		    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		
<%	}	%>
	
	</script>
</head>

<body>

<%	if(isResult.equals("N")) {	%>

<img src="/images/et/event_moviecashback.jpg" alt="설 맞이 CGV / 롯데시네마 / 메가박스 캐시백 이벤트!" usemap="#moviecashback" />

<map name="moviecashback" id="moviecashback">
 <area shape="rect" coords="537,1002,599,1020" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0169');" alt="빅앤빅카드 자세히보기" />
 <area shape="rect" coords="380,1025,442,1042" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');" alt="카앤모아카드 자세히보기" />
 <area shape="rect" coords="380,1044,442,1061" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428');" alt="쇼핑앤모아카드 자세히보기" />
 <area shape="rect" coords="380,1063,442,1080" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0161');" alt="블루아멕스 자세히보기" />
 <area shape="rect" coords="380,1108,442,1125" href="javascript:parent.goTabPage('NHPIMCDCPS001');" alt="할인카드 자세히보기" />
 <area shape="rect" coords="323,1186,384,1203" href="javascript:parent.goTabPageWithParam('NHPIMETEVTDTL','cmsSeq=9627');" alt="롯데시네마 현장할인 자세히보기" />
 <area shape="rect" coords="472,1252,533,1270" href="https://giftmall.samsungcard.com/ec/sw/mg/fr/cs/cardPurchase.do?method=selectPurchaseList" target="_blank" title="새창" alt="롯데시네마 모바일기프트카드 사용 자세히보기" />
 <area shape="rect" coords="229,1342,501,1405" href="javascript:applyEvent();" alt="응모하기" />
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyMovieCashbackEvent" method="post">
</form>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>
<%	}	%>

</body>

</html>

