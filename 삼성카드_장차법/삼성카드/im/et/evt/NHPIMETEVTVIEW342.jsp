<%
/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW342.jsp (하이패스 캐시백 이벤트)
 * Author: 인투데이타시스템 이중건
 * Created on 2011. 1. 6.
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


<title>설맞이 후불하이패스카드 캐시백 이벤트 - 삼성카드</title>
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
					parent.eventLogin('11205');
		<%		}
			} else if(eventIngYN.equals("before")) {	%>
				alert('이벤트 응모는 2011년 1월 11일부터 가능합니다.');
		<%	} else if(eventIngYN.equals("after")) {		%>
				alert('이벤트가 종료되었습니다');
		<%	}	%>
		}
		
		function postponePop() {
			setCookie("HIPASSCASHBACK_201101", "Y", 1);
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

<img src="/images/et/event_hipasscashback.jpg" alt="설맞이 후불하이패스 카드 캐시백 이벤트" usemap="#hipasscashback" />

<map name="hipasscashback" id="hipasscashback" >
 <area shape="rect" coords="246,595,377,618" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0598');" alt="삼성후불하이패스카드 혜택 상세보기" />
 <area shape="rect" coords="246,850,377,873" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');" alt="삼성카앤모아카드 혜택 상세보기" />
 <area shape="rect" coords="261,928,474,972" href="javascript:applyEvent();" alt="응모하기" />
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyHipassCashbackEvent" method="post">
</form>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>
<%	}	%>

</body>

</html>

