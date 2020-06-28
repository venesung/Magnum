<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>토끼띠 회원 더블 포인트 적립 이벤트! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String rabbitYn = (String)request.getAttribute("rabbitYn"); //토끼띠 여부 
%>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11167');
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
				<%if( rabbitYn.equals("N")){ %>
					alert("토끼띠 회원만 응모가 가능합니다");
				<%}else{%>
					applyEvent();
				<%}%>
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
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=rabbitEvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
</form>
<img src="/images/event/rabbitevent_201101_01.jpg" width="728" height="840" border="0" usemap="#event_1229" alt="토끼띠 회원 더블 포인트 적립 이벤트!" />
<map name="event_1229" id="event_1229">
  <area shape="rect" coords="268,620,461,666" href="javascript:go_start();" alt="이벤트 응모하기" />
</map>
</body>

</html>

