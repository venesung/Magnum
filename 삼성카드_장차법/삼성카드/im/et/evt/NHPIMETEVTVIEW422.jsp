<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>제주Zone 런칭기념이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11741');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
	function pop201107() {
		window.open('/html/event/jeju/popup_cheju_zone.html','pop201107','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function pop20110726() {
		window.open('/html/event/jeju/popup_cheju_zone_20110726.html','pop20110726','menubar=0,resizable=0,scrollbars=0,width=710,height=590,left=0,top=0');
	}
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/html/event/jeju/images/event_cheju_zone.jpg" usemap="#cheju_zone" alt="제주Zone 런칭기념이벤트" />

	<map name="cheju_zone" id="cheju_zone">
		<area shape="rect" coords="459,205,681,264" href="#" onclick="parent.goTabPage('NHPIMSSJJZ001M001');" alt="제주Zone 자세히 보기" />
		<area shape="rect" coords="532,631,660,695" href="#" onclick="go_start();" alt="응모하기" />
		<area shape="rect" coords="496,1190,657,1246" href="#" alt="할인쿠폰 받기" onclick="pop20110726();" />
		<area shape="rect" coords="493,1629,660,1689" href="#" alt="할인쿠폰 받기" onclick="pop201107();" />
		<area shape="rect" coords="41,2617,691,2785" href="http://www.airbusan.com/" alt="에어부산 바로가기" target="_blank"  title="새창" />
	</map>


</body>

</html>

