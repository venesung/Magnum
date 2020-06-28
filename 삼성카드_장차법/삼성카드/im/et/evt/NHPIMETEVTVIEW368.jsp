<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2월의 SFC WEEK - 삼성카드</title>
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
body, p	{margin:0; padding:0}
img  {border:0;}

#sfccard	 {position:relative}
#sfccard	 .sfcevent_ars	{position:absolute; top:1014px; left:182px}
#sfccard	 .sfcevent	{position:absolute; top:1014px; left:247px}
.pl10	{padding-left:10px}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11312');
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

<body style="margin:0">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<div id="sfccard">
	<!-- 응모하기 -->
	<p class="sfcevent"><a href="javascript:go_start();"><img src="/images/event/btn_sfcweek.gif" alt="이벤트 응모하기" /></a></p>
	<!-- // 응모하기 -->
	<p><img src="/images/event/sfcweek_201102.jpg" alt="2월의 SFC WEEK" usemap="#sfccard" /></p>
</div>

<map name="sfccard" id="sfccard">
 <area shape="rect" coords="38,1093,362,1212" href="https://www.samsungcard.com/link/index.jsp?url=SFC_CARD" target="_blank" alt="SFC카드 외식할인혜택" title="새창" />
 <area shape="rect" coords="367,1093,690,1212" href="https://www.samsungcard.com/index.do?menuId=NHPIMMHPEVTSFC001" target="_blank" alt="삼성 가족만을위한 또하나의 이벤트" title="새창" />
</map>
</body>

</html>

