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


<title>항공권 결제 이벤트 - 삼섬카드 </title>
<style type="text/css">
body, p	{margin:0; padding:0}
img  {border:0;}

#asiana	 {position:relative}
#asiana	 .asiana_agree	{position:absolute; top:660px; left:50px}
.pl10	{padding-left:10px}
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

					if(!document.form2.agree(0).checked){
						alert("동의에 체크해 주세요.");
						//document.form2.agree.focus();
						return;
					} 
					
					document.evtFrm.submit();
		<%		} else {	%>
					parent.eventLogin('11310');
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
<form id="form2" name="form2" method="post" action="">
<div id="asiana">
	<div class="asiana_agree">
		<label><input type="radio" name="agree"  title="동의" checked="checked" /><img src="/images/et/txt_agree.gif" alt="동의" /></label>
		<label><input type="radio" class="pl10" name="agree"  title="동의안함" /><img src="/images/et/txt_agreeno.gif" alt="동의안함" /></label>
	</div>
	<p><img src="/images/et/event_asiana.jpg" alt="추가적립 최대2,000마일+무이자2~3개월 삼성카드로 아시아나 항공권 결제하고 혜택 받으세요!" usemap="#asiana2" /></p>
</div>
</form>
<map name="asiana2" id="asiana2">
 <area shape="rect" coords="224,698,508,763" href="javascript:applyEvent();" alt="응모하기" />
 <area shape="rect" coords="50,800,680,935" href="http://flyasiana.com/sub/event/event20110302/event20110302.asp" target="_blank" alt="이스탄불이벤트 응모하기" title="새창" />
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyAsianaEvent" method="post">
</form>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>

<%	}	%>

</body>

</html>

