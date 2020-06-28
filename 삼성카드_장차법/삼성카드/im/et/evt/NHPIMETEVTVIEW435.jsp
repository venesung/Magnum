<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 제주 ZONE 시즌2 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); 
	
	String event_ok2 = (String)request.getAttribute("eventYN2"); //이벤트참여여부
	String beginDateYN2 = (String)request.getAttribute("beginDateYN2"); //이벤트 응모가능기간여부
	String endDateYN2 = (String)request.getAttribute("endDateYN2"); //이벤트 응모가능기간여부
	String beginMsg2 = (String)request.getAttribute("beginMsg2"); //이벤트 응모가능기간여부
	String endMsg2 = (String)request.getAttribute("endMsg2"); //이벤트 응모가능기간여부
	String eventNo2 = (String)request.getAttribute("eventNo2"); //이벤트 No
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one {position:relative; z-index:1;}
.event_bonus_one .event_input_1 {position:absolute; z-index:2; left: 164px; top:622px;}
.event_bonus_one .event_input_2 {position:absolute; z-index:2; left: 285px; top:622px;}
.event_bonus_one .event_input_3 {position:absolute; z-index:2; left: 407px; top:622px;}
.event_bonus_one .event_input_4 {position:absolute; z-index:2; left: 530px; top:622px;}
.event_bonus_one .e_input input {width:15px; height:15px}
</style>
<script language="javascript" type="text/javascript">
	
function go_start() {
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('11906');
	<%
		}else{
	%>
		<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
		<%}else if( beginDateYN.equals("N")){ %>
		  	alert("<%=beginMsg %>");
		<%}else if(event_ok.equals("Y")){%>
			//alert("이미 이벤트에 응모하셨습니다.");
			<%if (item03.equals("1")) {%>
			alert("이미 베스킨라빈스 10,000원 모바일기프트카드를 응모하셨습니다. 감사합니다.");
			<%} else if (item03.equals("2")) { %>
			alert("이미 미스터피자 10,000원 모바일기프트카드를 응모하셨습니다. 감사합니다.");
			<%} else if (item03.equals("3")) { %>
			alert("이미 스타벅스 10,000원 모바일기프트카드를 응모하셨습니다. 감사합니다.");
			<%} else if (item03.equals("4")) { %>
			alert("이미 삼성카드 10,000원 서비스포인트를 응모하셨습니다. 감사합니다.");
			<%} %>	
		<%}else{ %>
			applyEvent();
		<% } %>	
	<%
		}
	%>
}

	function applyEvent() {
		
		var frm = document.frm1;
		var item03 = "";
		
		for(var j=0;j<frm.id_event_input_1.length; j++) {
			if (frm.id_event_input_1[j].checked == true) {
				item03 = frm.id_event_input_1[j].value;
			}
		}

		if(item03 == ""){
			alert("4가지 이벤트 중 한가지를 선택해주시기 바랍니다.");
		}
		else{
			document.evtFrm.item03.value = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		}
	}

	function go_start2() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11906');
		<%
			}else{
		%>
			<%if( endDateYN2.equals("N")){ %>
				alert("<%=endMsg2 %>");
			<%}else if( beginDateYN2.equals("N")){ %>
			  	alert("<%=beginMsg2 %>");
			<%}else if(event_ok2.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");
			<%}else{ %>
				applyEvent2();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent2() {
			document.evtFrm.eventNo.value = "<%=eventNo2%>";
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
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<div class="event_bonus_one">
<img src="/html/popup/jeju201110/images/event_cheju_zone2.jpg" usemap="#cheju_zone2" alt="삼성카드 제주 ZONE 시즌2 이벤트" />
	<map name="cheju_zone2" id="cheju_zone2">
		<area shape="rect" coords="54,226,270,277" alt="제주ZONE 자세히보기" href="#" onclick="parent.goTabPage('NHPIMSSJJZ001M001');"/>
		<area shape="rect" coords="506,722,642,777" alt="응모하기 " href="#" onclick="go_start();"/>
		<area shape="rect" coords="506,1273,642,1328" alt="응모하기 " href="#" onclick="go_start2();"/>
		<area shape="rect" coords="476,2149,642,2204" alt="할인쿠폰받기 " onclick="window.open('https://www.samsungcard.com/cms_content/popup/jeju02_coupon.html','','width=710,height=570');" href="#" title="새창" />
		<area shape="rect" coords="476,2594,642,2649" alt="할인쿠폰받기 " onclick="window.open('https://www.samsungcard.com/cms_content/popup/jeju02_coupon02.html','','width=710,height=570');" href="#" title="새창" />
	</map>
	<form name="frm1" method="post" action="">
	<p class="e_input event_input_1"><label><input type="radio" name="id_event_input_1" title="베스킨라빈스" value="1" <%if (item03.equals("1")) {%> checked="checked" <%}%>/></label></p>
	<p class="e_input event_input_2"><label><input type="radio" name="id_event_input_1" title="미스터피자" value="2" <%if (item03.equals("2")) {%> checked="checked" <%}%>/></label></p>
	<p class="e_input event_input_3"><label><input type="radio" name="id_event_input_1" title="스타벅스" value="3" <%if (item03.equals("3")) {%> checked="checked" <%}%>/></label></p>
	<p class="e_input event_input_4"><label><input type="radio" name="id_event_input_1" title="삼성카드" value="4" <%if (item03.equals("4")) {%> checked="checked" <%}%>/></label></p>
	</form>
</div>
</body>

</html>

