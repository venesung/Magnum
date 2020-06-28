<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>국립극장 프리미엄회원  단독할인,삼성카드 공연혜택! -  삼성카드</title>
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
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script type="text/javascript" language="javascript">
	
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
		  		
				//링크
				fnTicketBooking("12017768");
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

	
</script>


</head>

<body>

<img src="/images/event/event_ntok.jpg" alt="국립극장 프리미엄회원  단독할인,삼성카드 공연혜택!" border="0" usemap="#ntok" />
<map name="ntok" id="ntok">
<area shape="rect" coords="287,1749,441,1788" href="#" onclick="go_start();" alt="예매하기" />
</map>

</body>

</html>

