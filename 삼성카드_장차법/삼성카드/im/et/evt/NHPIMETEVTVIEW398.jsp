<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>페이백서비스 착한 이벤트 - 삼성카드</title>
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
p {margin:0; padding:0}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11523');
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

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<img src="/images/event/event_payback.jpg" width="728" height="1408" border="0" usemap="#payback" alt="페이백서비스 착한 이벤트" />
<map name="payback" id="payback">
  <area shape="rect" coords="114,599,185,665" href="http://www.tgif.co.kr" target="_blank" alt="TGIF" title="새창" />
  <area shape="rect" coords="248,603,336,668" href="http://www.outback.co.kr" target="_blank" alt="아웃백" title="새창" />
  <area shape="rect" coords="389,603,479,670" href="http://www.bennigans.co.kr" target="_blank" alt="베니건스" title="새창" />
  <area shape="rect" coords="533,599,627,674" href="http://www.sizzler.co.kr" target="_blank" alt="씨즐러" title="새창" />
  <area shape="rect" coords="114,684,183,760" href="http://www.sevensprings.co.kr" target="_blank" alt="세븐스프링스" title="새창" />
  <area shape="rect" coords="245,684,337,761" href="http://www.pji.co.kr" target="_blank" alt="파파존스" title="새창" />
  <area shape="rect" coords="392,680,479,763" href="http://www.dominos.co.kr" target="_blank" alt="도미노피자" title="새창" />
  <area shape="rect" coords="532,683,628,762" href="http://www.bulgogibros.com" target="_blank" alt="불고기브라더스" title="새창" />
  <area shape="rect" coords="248,1072,478,1114" href="javascript:go_start();" alt="페이백 100% 적립받기"  />
  <area shape="rect" coords="547,1239,644,1263" href="javascript:parent.goTabPage('NHPIMSSSBC001M016');" alt="자세히 보기" />
</map>
</body>

</html>

