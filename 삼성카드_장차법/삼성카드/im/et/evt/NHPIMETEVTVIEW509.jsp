<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드프리미엄회원 단독40% 할인이벤트 - 삼성카드</title>
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
				//window.open("http://ticket.interpark.com/Partner/Gate/NonMemberBookingGate.asp?sp1=16456&sp2=12005565","","");
				fnTicketBooking("12012799");
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



<img src="/html/et/lacage/images/event_lacage.jpg" alt="삼성카드프리미엄회원 단독40% 할인이벤트" usemap="#select4"/>

	<div class="hidden">
		<p>화제의 뮤지컬 라카지 드디어 한국 초연!</p>
		<h1>삼성카드 프리미엄 회원 단독 40%할인이벤트</h1>
		<p>세계유일! 토니어워즈 작품상 3회 수상</p>
		
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 7월 11일(수) 오후 8시</dd>
			<dt>공연장소</dt>
			<dd>LG아트센터</dd>
			<dt>행사내용</dt>
			<dd>프리미엄 회원께서 삼성카드로 결제 시, 단독 40% 할인 혜택</dd>
			<dt>티켓가격</dt>
			<dd>
				<table summary="티켓가격 안내 표 - VIP석, R석, S석, A석이 있습니다. ">
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
							<td>130,000원</td>
							<td>110,000원</td>
							<td>80,000원</td>
							<td>60,000원</td>
						</tr>
						<tr>
							<td>40%할인가</td>
							<td>78,000원</td>
							<td>66,000원</td>
							<td>48,000원</td>
							<td>36,000원</td>
						</tr>
					</tbody>
				
				
				</table>
			</dd>
			<dt>티켓오픈</dt>
			<dd>2012년 6월 21일(목) 오후 2시</dd>
			<dt>문의처</dt>
			<dd>삼성카드 대표전화 1588-8700</dd>
			<dt>캐스팅</dt>
			<dd>7월 11일(수)
				<ul>
					<li>정성화 - (앨빈 역)</li>
					<li>남경주 - (조지 역)</li>
					<li>이창민2AM - (장미셀 역)</li>
					<li>천호진 - (에두아르 딩동 역)</li>
					<li>전수경 - (마담 당동 역)</li>
				</ul>
			</dd>
		</dl>
		
		<p><a href="#none" onclick="window.open('/html/et/lacage/event_info.html', 'popup', 'width=710px, height=595px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" title="새창">
		공연정보 자세히 보기</a>
        <a href="#none" onclick="go_start();return false;" >티켓예매 바로가기</a>
        <a href="#none" onclick="fnTicketCancel();return false;" >예매확인 및 취소하기</a>
		
		<ul>
			<li>- 본 공연은 한정 수량 판매로 인해 조기 종료 될 수 있으니 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 본공연의 티켓은 삼성카드(신용카드/체크카드/법인카드)로 1인 4매까지 구매하실 수 있습니다.(올앳, 기프트카드 제외)</li>
			<li>- 만 7세 미만의 미취학 아동은 관람할 수 없으며, 관람 연령이 되는 어린이도 티켓을 구매해야 입장할 수 있습니다.</li>
			<li>- 구입하신 티켓을 분실하실 경우 입장 하실 수 없습니다.</li>
			<li>- 예매처를 통한 정식 구입 절차를 거치지 않은 티켓은 취소 및 환불이 되지 않습니다.</li>
			<li>- 티켓을 변경 취소 환불은 프리미엄 라운지 예매확인 및 취소하기를 통해서만 가능합니다.</li>
			<li>- 본 공연은 카드사 및 제휴사의 사정으로 변경 중단 될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
			<li>- 티켓은 공연당일 일자 변경 및 환불이 불가합니다.</li>
			<li>- 예매처를 통한 정식 구매 절차를 걸치지 않은 티켓은 취소, 환불이 불가능 하며 이로 인한 문제발생 시 삼성카드와 제작사는 책임지지 않습니다.</li>
		</ul>
		
		</p>
	</div>

	<map name="select4" id="select4">
		<area shape="rect" coords="57,1268,263,1306" href="#" onclick="window.open('/html/et/lacage/event_info.html', 'popup', 'width=710px, height=595px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" alt="공연정보 자세히 보기" title="새창" />
		<area shape="rect" coords="272,1268,458,1307" href="#" onclick="go_start();" alt="티켓예매 바로가기" />
		<area shape="rect" coords="467,1269,671,1307" href="#" onclick="fnTicketCancel();" alt="예매확인 및 취소하기"  />
	</map>
	
	
</body>

</html>

