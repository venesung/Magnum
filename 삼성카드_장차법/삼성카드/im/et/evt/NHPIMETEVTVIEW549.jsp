<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>컬투 크리스말쇼 - 삼성카드</title>
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

<script language="javascript" type="text/javascript">
	
	function go_start(type) {
		
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
			    if(type == '2'){
			    	alert("공연 예매는 11월 7일 오후 2시부터 가능합니다.");
			    } else {
			    	alert("<%=beginMsg %>");
			    }
			  	return;
		  	<%}else{ %>
		  		 if (type == '1'){
		  			window.open('/html/event/cultwo/popup_p.html', 'popup', 'width=710px, height=576px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no');
		  		 }else if(type == '2'){
		  			var frmTicketBooking;
		  			frmTicketBooking = document.createElement("form");
		  			frmTicketBooking.name = "frmBooking";
		  			frmTicketBooking.action = "http://ticket.interpark.com/Partner/Certify/NonBooking.asp";
		  			frmTicketBooking.target = "wndBooking";
		  			frmTicketBooking.method = "post";
		  			document.body.appendChild(frmTicketBooking);
		  			
		  			var o1;
		  			o1 = document.createElement("input");
		  			o1.name = "bp1";
		  			o1.type = "hidden";
		  			o1.value = "18588";
		  			frmTicketBooking.appendChild(o1);
		  			
		  			o1 = document.createElement("input");
		  			o1.name = "bp2";
		  			o1.type = "hidden";
		  			o1.value = "12018841";
		  			frmTicketBooking.appendChild(o1);

		  			try {
		  				var loc1 = "";
		  				win1 = window.open(loc1,"wndBooking","top=10, left=10, width=900, height=682, scrollbars=no");  //예매확인취소는 scrollbars=yes
		  				
		  				if(win1 == null) {
		  					alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
		  				} else {
		  					frmTicketBooking.submit();
		  					win1.focus();
		  				}
		  			} catch(e) {
		  			    alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
		  			}
				 }else{
					var frmTicketCancel;
					frmTicketCancel = document.createElement("form");
					frmTicketCancel.name = "frmCancel";
					frmTicketCancel.action = "http://ticket.interpark.com/Partner/MyTicket/NonMyPage.asp";
					frmTicketCancel.target = "wndCancel";
					frmTicketCancel.method = "post";
					document.body.appendChild(frmTicketCancel);
					
					var o2;
					o2 = document.createElement("input");
					o2.name = "cp1";
					o2.type = "hidden";
					o2.value = "18588";
					frmTicketCancel.appendChild(o2);

					try {
						var loc2 = "";
						win2 = window.open(loc2,"wndCancel","top=10, left=10, width=770, height=682, scrollbars=yes");
					
						if(win2 == null) {
							alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
						} else {
							frmTicketCancel.submit();
							win2.focus();
						}
					} catch(e) {
						alert("팝업창이 제한되어 있어서 예매창을 열 수 없습니다.");
					}
				 }
					
			<% } %>	
				  	
						
		<%
			}
		%>
	}


</script>


</head>

<body style="margin:0;">
<img src="/html/event/cultwo/images/121029_event.jpg" alt="컬투 크리스말쇼 25% 단독 할인!" border="0" usemap="#p" />
<map name="p" id="p">
<area shape="rect" coords="61,895,301,934" href="javascript:go_start(1);" alt="티켓 수령 및 한정 우대석 안내" />
<area shape="rect" coords="307,896,477,935" href="javascript:go_start(2);" alt="티켓예매 바로가기" />
<area shape="rect" coords="482,897,667,935" href="javascript:go_start(3);" alt="예매확인 및 취소하기" />
</map>

 <div class="hidden">
	<h1>컬투 크리스말쇼 5~25% 단독 할인!</h1>
	<dl>
		<dt>공연일시</dt>
		<dd>2012년 12월 30일(일) 오후 5시 30분, 12월 31일(월) 오후 7시, 11시</dd>
		<dt>공연장소</dt>
		<dd>코엑스 Hall C</dd>
		<dt>행사내용</dt>
		<dd>삼성카드로 공연 티켓 결제 시, 일반 회원 5%, 프리미엄 회원 25% 단독 할인!</dd>
		<dt>티켓가격</dt>
		<dd>
			<table summary="각 좌석별 티켓가격입니다.">
				<caption>티켓가격</caption>
				<thead>
					<tr>
						<th scope="col">구분</th>
						<th scope="col">VIP석</th>
						<th scope="col">R석</th>
						<th scope="col">S석</th>
						<th scope="col">A석</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>정상가</td>
						<td>99,000원</td>
						<td>88,000원</td>
						<td>77,000원</td>
						<td>66,000원</td>
					</tr>
					<tr>
						<td>25% 할인가(프리미엄 회원)</td>
						<td>74,250원</td>
						<td>66,000원</td>
						<td>57,750원</td>
						<td>49,500원</td>
					</tr>
					<tr>
						<td>5% 할인가(일반 회원)</td>
						<td>94,050원</td>
						<td>83,500원</td>
						<td>73,150원</td>
						<td>62,700원</td>
					</tr>
				</tbody>
			</table>
		</dd>
		<dt>티켓오픈</dt>
		<dd>2012년 11월 7일(수) 오후 2시</dd>
		<dt>티켓예매</dt>
		<dd>
			- 일반회원 : 인터파크 티켓
			- 프리미엄 회원 : 삼성카드 홈페이지 프리미엄 라운지 &gt; 문화공연
		</dd>
		<dt>문의</dt>
		<dd>삼성카드 대표전화 1588-8700</dd>
	</dl>
	
	<h2>예매 전, 반드시 읽어 주세요!</h2>
	<ul>
		<li>반드시 티켓 오픈일 2시 정각에 로그인을 하셔야 예매를 하실 수 있습니다. 로그인을 미리 하신 후 2시에 티켓 예매 창이 열리지 않을 경우, 새로고침 또는 재로그인을 하셔야 합니다.</li>
		<li>좌석을 선택하신 후 3분 이내 결제를 하셔야 결제가 완료됩니다. 3분이 지나면 다른 회원님께 기회가 제공됩니다.</li>
		<li>잔여석이 있더라도 좌석표가 모두 흰색이면 현재 다른 회원님이 선택하여 결제 중인 상태이므로, 예매를 하실 수 없습니다.</li>
	</ul>
	
	<h2>주의사항</h2>
	<ul>
		<li>티켓을 한정 수량 판매로 인해 조기 종료될 수 있으니, 예매를 서둘러 주시기 바랍니다.</li>
		<li>티켓은 삼성카드(신용/체크/법인카드)로 1인 10매까지 구입하실 수 있습니다.(올앳/선불/기프트카드 제외)</li>
		<li>만 10세 미만 아동은 관람할 수 없으며, 관람 연령이 되는 청소년은 티켓을 구입해야 입장할 수 있습니다.</li>
		<li>티켓을 분실하실 경우 입장하실 수 없습니다.</li>
		<li>티켓을 변경, 취소, 환불하실 경우 프리미엄라운지 에매확인 및 취소하기 또는 인터파크 고객센터(1544-1555)를 통해서 가능합니다.</li>
		<li>티켓 예매 및 취소는 공연 하루 전 오후 5시까지 가능하며, 공연 당일에는 취소 및 환불하실 수 없습니다.</li>
		<li>이미 배송된 티켓의 경우 공연 전일까지 인터파크INT 티켓 고객센터로 반송되어야 취소 가능합니다.</li>
		<li>취급수수료와 예매수수료는 예매처인 인터파크 정책에 따릅니다.</li>
		<li>에매처를 통해 정식 구매 절차를 거치지 않은 티켓은 취소 및 환불되지 않으며 이로 인한 문제 발생 시 삼성카드와 제작사는 책임을 지지 않습니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>

</body>

</html>

