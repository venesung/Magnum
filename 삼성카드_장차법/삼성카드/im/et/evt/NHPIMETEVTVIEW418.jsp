<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성 그룹 임직원 복지포탈 블루베리 7월 1일 오픈 기념 행운 이벤트 - 삼성카드</title>
<%
	String loginYN		= (String)request.getAttribute("loginYN");

	String eventOk1		= (String)request.getAttribute("eventYN1");		//이벤트참여여부
	String beginDateYN1	= (String)request.getAttribute("beginDateYN1");	//이벤트 응모가능기간여부
	String endDateYN1	= (String)request.getAttribute("endDateYN1");	//이벤트 응모가능기간여부
	String beginMsg1	= (String)request.getAttribute("beginMsg1");	//이벤트 응모가능기간여부
	String endMsg1		= (String)request.getAttribute("endMsg1");		//이벤트 응모가능기간여부
	String eventNo1		= (String)request.getAttribute("eventNo1");		//이벤트 No

	String eventOk2		= (String)request.getAttribute("eventYN2");		//이벤트참여여부
	String beginDateYN2	= (String)request.getAttribute("beginDateYN2");	//이벤트 응모가능기간여부
	String endDateYN2	= (String)request.getAttribute("endDateYN2");	//이벤트 응모가능기간여부
	String beginMsg2	= (String)request.getAttribute("beginMsg2");	//이벤트 응모가능기간여부
	String endMsg2		= (String)request.getAttribute("endMsg2");		//이벤트 응모가능기간여부
	String eventNo2		= (String)request.getAttribute("eventNo2");		//이벤트 No
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

</style>

<script language="javascript" type="text/javascript">
	
	function goStart777() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11736');
		<%
			}else{
		%>
			<%if( endDateYN1.equals("N")){ %>
				alert("<%=endMsg1 %>");
			<%}else if( beginDateYN1.equals("N")){ %>
			  	alert("<%=beginMsg1 %>");
			<%}else if(eventOk1.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
				document.evtFrm.eventNo.value=document.evtFrm.eventNo1.value;
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function goStart77() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11736');
		<%
			}else{
		%>
			<%if( endDateYN2.equals("N")){ %>
				alert("<%=endMsg2 %>");
			<%}else if( beginDateYN2.equals("N")){ %>
			  	alert("<%=beginMsg2 %>");
			<%}else if(eventOk2.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
			document.evtFrm.eventNo.value=document.evtFrm.eventNo2.value;
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
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value=""/>
<input type="hidden" name="eventNo1" value="<%=eventNo1%>"/>
<input type="hidden" name="eventNo2" value="<%=eventNo2%>"/>
</form>

<img src="/images/event/event_blueberry_728.jpg" usemap="#event_blueberry_728" alt="삼성 그룹 임직원 복지포탈 블루베리 7월 1일 오픈 기념 행운 이벤트" />
<map name="event_blueberry_728" id="event_blueberry_728">
	<area shape="rect" coords="134,781,246,814" alt="블루베리이용 삼성가족 선착순 777분 상품 이벤트 응모하기" href="javascript:goStart777();" />
	<area shape="rect" coords="448,1245,563,1275" alt="SFC카드 신청하기" href="javascript:parent.goTabPage('NHPIMCDCPS00204','');" />
	<area shape="rect" coords="318,1575,428,1606" alt="캐리비안베이 썸머웨이브 페스티벌 77분 추첨 이벤트 응모하기" href="javascript:goStart77();" />
	<area shape="rect" coords="192,1634,268,1665" alt="캐리비안베이 썸머웨이브 페스티벌 자세히 보기" href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=11006686" target="_blank"  title="새창"/>
	<area shape="rect" coords="46,2013,171,2048" alt="아파트관리비 신청하기 이벤트 자세히 보기" href="javascript:parent.goTabPage('NHPIMMHJFY');" />
</map>

</body>

</html>

