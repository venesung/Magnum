<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>아파트 관리비 자동이체 이벤트 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		
		<%
			if(loginYN.equals("N")){ 
		%>

		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		applyEvent();
			<% } %>	
				  	
						
		<%
			}
		%>
	}

	function applyEvent() {
		document.frm.method = "post";
		document.frm.action="/hp/im/ss/pay001.do?method=aptSubmit"; 
		document.frm.target="formhidden";
		document.frm.submit();
	}	


	function resultSubmit(rValue1,rValue2) {
		document.frm.iden_no.value = rValue1;
		document.frm.randomNo.value = rValue2;
		document.frm.target = "_blank";
		document.frm.action = "https://www.theaptcard.com/scapt/gateSvc1.jsp?url=scard.apt.frn.servlet.login.APITFL200.htm&siteName=60";
		document.frm.submit();
		
		
	}	
</script>
</head>

<body style="margin:0;">
<iframe id="formhidden" name="formhidden" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
 <form name="frm" id="frm" method="post" autocomplete="off" target="formhidden" action="">
	<input type="hidden" name="iden_no" value="" />
	<input type="hidden" name="randomNo" value="" />
</form>

<div class="event_automatic_apt">
	<map name="automatic_apt" id="automatic_apt">
		<area shape="rect" coords="252,864,477,927" alt="관리비 자동이체 신청하기" href="javascript:applyEvent()" />
		<area shape="rect" coords="559,1013,667,1035" alt="회원정보 변경하러 가기" href="javascript:parent.goTabPage('NHPIMMHUFM001M001', true);" />
	</map>
	<img src="/images/event/event_automatic_apt.jpg" usemap="#automatic_apt" alt="아파트 관리비 자동이체 이벤트" />
</div>

</body>
</html>

