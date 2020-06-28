<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2012 이사오 사사키 콘서트 단독 30%할인 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String userName = (String)request.getAttribute("userName");
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
	//String dupEventB = (String)request.getAttribute("dupEventB");
	
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
			<%if( premiumYn.equals("N")){ %>
			alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
			return ;
			<%}%>
		
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		
				//링크
				window.open("http://www.sacticket.co.kr/home/play/play_view.jsp?seq=8911","","");
				//fnTicketBooking("12012799");
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
	        o.value = "16863";
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
	        o.value = "16863";
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
<img src="/images/et/pre245/120807_event.jpg" alt="2012 이사오 사사키 콘서트 단독 30%할인" border="0" usemap="#you" />

	<div class="hidden">
		<p>삼성카드 프리미엄 회원 단독</p>
		<h1>2012 이사오 사사키 콘서트 단독 30% 할인</h1>
		<p>이사오 사사키가 들려주는 사랑과 그리움의 멜로디 - 삼성카드 혜택과 함께 소중했던 추억까지 만나 보세요</p>
		
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 10월 28일(일) 오후 5시</dd>
			<dt>공연장소</dt>
			<dd>예술의전당 콘서트홀</dd>
			<dt>행사내용</dt>
			<dd>프리미엄 회원께서 삼성카드로 공연티켓 결제 시 단독 30%할인 혜택 제공</dd>
			<dt>티켓가격</dt>
			<dd>
				<table summary="티켓가격 안내 표 - R석, S석, A석, B석의 할인가안내입니다.">
					<caption>티켓가격 안내</caption>
					<colgroup>
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>R석</th>
							<th>S석</th>
							<th>A석</th>
							<th>B석</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>정가</td>
							<td>99,000원</td>
							<td>88,000원</td>
							<td>66,000원</td>
							<td>44,000원</td>
						</tr>
						<tr>
							<td>30% 할인가</td>
							<td>69,300원</td>
							<td>61,600원</td>
							<td>46,200원</td>
							<td>30,800원</td>
						</tr>
					</tbody>
				</table>
				
			</dd>
			<dt>티켓예매</dt>
			<dd>삼성카드 홈페이지 - 로그인 - 마이홈 - 프리미엄 라운지 - 진행중인 이벤트 - 예매하기</dd>
			<dt>문의</dt>
			<dd>더 스톰프 02-2658-3546</dd>
		</dl>
		
        <p><a href="#none" onclick="go_start();return false;">예매하기</a></p>
		<p>예매하기</p>
		<ul>
			<li>- 본 공연은 한정수량 판매로 인해 조기 종료될 수 있으나, 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 취급수수료 및 예매수수료는 예매처인 인터파크의 정책을 따릅니다.</li>
			<li>- 티켓을 변경, 최소, 환불하실 경우 인터파크 티켓을 통해서만 가능합니다.</li>
			<li>- 티켓 분실 파손시 재발권되지 않으며, 어떤 이유로도 입장하실 수 없으니 주의하시기 바랍니다.</li>
			<li>- 선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단 될 수 있으며 그 내용을 사전에 알려드립니다.</li>
		</ul>
		
	</div>


<map name="you" id="you">
  <area shape="rect" coords="284,1058,445,1097" href="#" onclick="go_start();" alt="예매하기" />
</map>
</body>

</html>

