<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>삼 성 카 드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
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

<script language="javascript">

	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('13453');
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
	  		
					//링크
					fnTicketBooking("13000163");
				<% } %>	
		<%
			}
		%>		
	}
	
	function fnTicketBooking(GoodsCode)
	{	
	        var frmTicketBooking;
	        frmTicketBooking = document.createElement("form");
	        frmTicketBooking.name = "frmBooking";
	        frmTicketBooking.action = "http://ticket.interpark.com/Partner/Certify/NonBooking.asp";
	        frmTicketBooking.target = "wndBooking";
	        frmTicketBooking.method = "post";
	        document.body.appendChild(frmTicketBooking);

	        var o;
	        o = document.createElement("input");
	        o.name = "bp1";
	        o.type = "hidden";
	        o.value = "17234";
	        frmTicketBooking.appendChild(o);

	        o = document.createElement("input");
	        o.name = "bp2";
	        o.type = "hidden";
	        o.value = GoodsCode;
	        frmTicketBooking.appendChild(o);

	 		try {					
	      		var loc = "";
	      		win = window.open(loc,"wndBooking","top=10, left=10, width=900, height=682, scrollbars=no");  //예매확인취소는 scrollbars=yes
	      		if(win==null) {
	         		alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
	      		} else {
	         		frmTicketBooking.submit();
	         		win.focus();
	       		}					
	  		} catch(e) {
	     		alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
	  		}

	}    

	function fnTicketCancel()
	{	
	        var frmTicketCancel;
	        frmTicketCancel = document.createElement("form");
	        frmTicketCancel.name = "frmCancel";
	        frmTicketCancel.action = "http://ticket.interpark.com/Partner/MyTicket/NonMyPage.asp";
	        frmTicketCancel.target = "wndCancel";
	        frmTicketCancel.method = "post";
	        document.body.appendChild(frmTicketCancel);

	        var o;
	        o = document.createElement("input");
	        o.name = "cp1";
	        o.type = "hidden";
	        o.value = "17234";
	        frmTicketCancel.appendChild(o);


	 		try {					
	      		var loc = "";
	      		win = window.open(loc,"wndCancel","top=10, left=10, width=770, height=682, scrollbars=yes");
	      		if(win==null) {
	         		alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
	      		} else {
	         		frmTicketCancel.submit();
	         		win.focus();
	       		}					
	  		} catch(e) {
	     		alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
	  		}
	} 

	function eventpop(){
		window.open('/html/event/event130107/event_pop.html', 'popup', 'width=660px, height=550px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}

	
</script>


</head>

<body topmargin="0" leftmargin="0">

<img src="/images/et/event_130107.jpg" alt="SAMSUNGCARD SELECT11 뮤지컬 레베카" border="0" usemap="#card" />
<map name="card" id="card">
  <area shape="rect" coords="60,1537,291,1575" href="javascript:eventpop();" title="1+1 예매 및 티켓 수령 방법 새창" alt="1+1예매 및 티켓 수령 방법" />
  <area shape="rect" coords="295,1537,469,1575" href="javascript:go_start();" alt="티켓예매 바로가기" title="티켓예매 바로가기 새창" />
  <area shape="rect" coords="475,1537,668,1575" href="javascript:fnTicketCancel();" alt="예매확인 및 취소하기" title="예매확인 및 취소하기 새창" />
</map>
</body>

</html>

