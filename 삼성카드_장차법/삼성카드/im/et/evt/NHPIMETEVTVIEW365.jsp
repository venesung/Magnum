<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>도서 구입비 지원 프로젝트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11308');
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

</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<img src="/images/event/bookcashbag_201102.jpg"  border="0"  alt="새학기 맞이!! 도서 구입비 지원 프로젝트" usemap="#book" />
<map name="book" id="book">
 <area shape="rect" coords="294,477,436,521" href="javascript:go_start();" alt="응모하기" />
 <area shape="rect" coords="205,959,288,995" href="http://www.kyobobook.co.kr/index.laf?emailCheck=true&couponId=5SzAB2J1RL4grgzlbKGBLQ~!" target="_blank" alt="교보문고 2천원 쿠폰다운" title="새창" />
 <area shape="rect" coords="299,959,381,995" href="http://www.kyobobook.co.kr/index.laf?emailCheck=true&couponId=ArpMMX4Y9vOKC4iICWB9Qg~!" target="_blank" alt="교보문고 3천원 쿠폰다운" title="새창" />
 <area shape="rect" coords="391,959,475,995" href="http://www.kyobobook.co.kr/index.laf?emailCheck=true&couponId=UzO3ZmDK!@ipy~@QMLnj!@!@EA~!" target="_blank" alt="교보문고 5천원 쿠폰다운" title="새창" />
 <area shape="rect" coords="205,1040,288,1061" href="http://www.ypbooks.co.kr/event_view.yp?HTMLPage=http://222.106.174.37/ypbooks/event/maintema/evt_201101samsung.jsp" target="_blank" alt="영풍문고 쿠폰다운" title="새창" />
</map>

</body>

</html>

