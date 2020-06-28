<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 시카고 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String userName = (String)request.getAttribute("userName");
	String beginDateYNs = (String)request.getAttribute("beginDateYNs");
	String endDateYNs = (String)request.getAttribute("endDateYNs");
	String beginMsgs = (String)request.getAttribute("beginMsgs");
	String endMsgs = (String)request.getAttribute("endMsgs");
	String beginDateYNd = (String)request.getAttribute("beginDateYNd");
	String endDateYNd = (String)request.getAttribute("endDateYNd");
	String beginMsgd = (String)request.getAttribute("beginMsgd");
	String endMsgd = (String)request.getAttribute("endMsgd");
	String beginDateYNb = (String)request.getAttribute("beginDateYNb");
	String endDateYNb = (String)request.getAttribute("endDateYNb");
	String beginMsgb = (String)request.getAttribute("beginMsgb");
	String endMsgb = (String)request.getAttribute("endMsgb");
	
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
			parent.eventLogin('32404');
		<%
			}else{
		%>
	
			<%if( endDateYNs.equals("N") && endDateYNd.equals("N") && endDateYNb.equals("N")){ %>
				alert("<%=endMsgs %>");
				return;
			<%}else if( beginDateYNs.equals("N") && beginDateYNd.equals("N") && beginDateYNb.equals("N")){ %>
			  	alert("<%=beginMsgs %>");
			  	window.open('/html/event/cicago/pop_02.html', 'popup2', 'width=540px, height=610px, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
			  	return;
		  	<%}else{ %>
		  		<%if ((endDateYNs.equals("Y")) && (beginDateYNs.equals("Y"))) { %>
		  		fnTicketBooking("12015577");
		  		<%} else if ((endDateYNd.equals("Y")) && (beginDateYNd.equals("Y"))) { %>
		  		fnTicketBooking("12015619");
		  		<%} else if ((endDateYNb.equals("Y")) && (beginDateYNb.equals("Y"))) { %>
		  		fnTicketBooking("12016121");
		  		//fnTicketBooking("12012864");
		  		<%} else {%>
		  		alert("<%=beginMsgs %>");
			  	window.open('/html/event/cicago/pop_02.html', 'popup2', 'width=540px, height=610px, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
			  	return;
		  		<% } %>
		  		 
				//링크
				//window.open("http://ticket.interpark.com/Partner/Gate/NonMemberBookingGate.asp?sp1=16456&sp2=12005565","","");
				
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
		<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			return;
		<%}else if( beginDateYN.equals("N")){ %>
		  	alert("<%=beginMsg %>");
		  	return;
	  	<%}else{ %>
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
		<% } %>	
	} 

	
</script>


</head>

<body>

<img src="/html/event/cicago/images/event_chicago.jpg" alt="SAMSUNGCARD SELECT08 뮤지컬 시카고" border="0" usemap="#rp" />

<div class="hidden">
		<h1>뮤지컬 시카고</h1>
		<p>가치에 실속을 더한 1+1 문화혜택, 삼성카드 셀렉트! 세상에서 가장 HOT한 무대, 삼성카드 헤택으로 만나보세요</p>
		
		<h2>서울공연!</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 9월 23일 (일) 오후 2시</dd>
			<dt>공연장소</dt>
			<dd>디큐브아트센터</dd>
			<dt>행사내용</dt>
			<dd>삼성카드로 결제 시 1+1 혜택</dd>
			<dt>티켓가격</dt>
			<dd>VIP석 - 110,000원 , R석 - 90,000원 , OP석 - 80,000원 , S석 - 70,000원 , A석 - 40,000원</dd>
			<dt>티켓오픈</dt>
			<dd>프리미엄 회원 : 9월 11일 (화) 오후 2시 / 일반회원 : 9월 12일 (수) 오후 2시
				
			</dd>
			<dt>티켓예매</dt>
			<dd>삼성카드 홈페이지</dd>
			<dt>문의</dt>
			<dd>삼성카드 대표전화 1588-8700</dd>
			<dt>캐스팅</dt>
			<dd>최정원, 아이비, 남경주</dd>
		</dl>
		<ul>
			<li>9월 12일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매하실수 없습니다.</li>
			<li>프리미엄 회원은 삼성카드 홈페이지 - 프리미엄 라운지 - 문화공연에서 예매하실 수 있습니다.</li>
		</ul>
		
		<h2>대구공연!</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 10월 14일 (일) 오후 2시</dd>
			<dt>공연장소</dt>
			<dd>계명아트센터</dd>
			<dt>행사내용</dt>
			<dd>삼성카드로 결제 시 1+1 혜택</dd>
			<dt>티켓가격</dt>
			<dd>VIP석 - 120,000원 , R석 - 100,000원 , S석 - 80,000원 , A석 - 60,000원</dd>
			<dt>티켓오픈</dt>
			<dd>프리미엄 회원 : 9월 25일 (화) 오후 2시 / 일반회원 : 9월 26일 (수) 오후 2시
				<p>9월 26일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매가 잠시 불가하며, 일반회원에게 오픈되는 9월 26일 오후 2시 이후에도 프리미엄 회원은 계속 예매하실 수 있습니다.</p>
			</dd>
			<dt>티켓예매</dt>
			<dd>삼성카드 홈페이지</dd>
			<dt>문의</dt>
			<dd>삼성카드 대표전화 1588-8700</dd>
			<dt>캐스팅</dt>
			<dd>최정원, 아이비, 남경주</dd>
		</dl>
		<ul>
			<li>9월 26일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매하실수 없습니다.</li>
			<li>프리미엄 회원은 삼성카드 홈페이지 - 프리미엄 라운지 - 문화공연에서 예매하실 수 있습니다.</li>
		</ul>
		
		
		<h2>부산공연!</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 11월 4일 (일) 오후 2시</dd>
			<dt>공연장소</dt>
			<dd>센텀시티 소향아트센터</dd>
			<dt>행사내용</dt>
			<dd>삼성카드로 결제 시 1+1 혜택</dd>
			<dt>티켓가격</dt>
			<dd>VIP석 - 120,000원 , R석 - 100,000원 , S석 - 80,000원 , A석 - 60,000원</dd>
			<dt>티켓오픈</dt>
			<dd>프리미엄 회원 : 10월 16일 (화) 오후 2시 / 일반회원 : 10월 17일 (수) 오후 2시
				<p>10월 17일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매가 잠시 불가하며, 일반회원에게 오픈되는 10월 17일 오후 2시 이후에도 프리미엄 회원은 계속 예매하실 수 있습니다.</p>
			</dd>
			<dt>티켓예매</dt>
			<dd>삼성카드 홈페이지</dd>
			<dt>문의</dt>
			<dd>삼성카드 대표전화 1588-8700</dd>
			<dt>캐스팅</dt>
			<dd>인순이, 아이비, 남경주</dd>
		</dl>
		<ul>
			<li>10월 16일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매하실수 없습니다.</li>
			<li>프리미엄 회원은 삼성카드 홈페이지 - 프리미엄 라운지 - 문화공연에서 예매하실 수 있습니다.</li>
		</ul>
		
		<p>
            <a href="#none" onclick="window.open('/html/event/precicago/pop_01.html', 'popup', 'width=660px, height=550px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no');" title="새창">1+1 예매 및 티켓수령 방법</a>
            <a href="#none" onclick="go_start();return false;">티켓예매 바로가기</a>
            <a href="#none" onclick="fnTicketCancel();return false;" >예매 확인 및 취소하기</a>
		</p>
		
		<p>프리미엄 회원이란? 매년 삼성카드 카드이용실적, 입회기간, 신용도를 바탕으로 선정되신 삼성카드의 특별한 회원으로 자세한 내용은 삼성카드 홈페이지 - 마이홈 - 프리미엄 라운지를 통해 확인하실 수 있습니다.</p>
		
		<ul>
			<li>- 9월 가이드S 및 프리미엄 S 일부에 기재된 대구, 부산 티켓가격이 위에 표시된 가격과 다를 수 있습니다. 매체 발송 후 기획사으 ㅣ사정으로 변경되었으므로, 양해바랍니다.</li>
			<li>- 티켓은 한정 수량 판매로 인해 조기 종료될 수 있으니 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 티켓은 삼성카드(신용/체크/법인카드)로 1인 2매까지 구입하실 수 있으며, 2매 구입 시 4매가 제공됩니다.(올앳/선불/기프트카드 제외)</li>
			<li>- 만 13세 미만 아동 및 청소년은 관람할 수 없으며, 관람 연령이 되는 청소년은 티켓을 구입해야 입장할 수 있습니다.</li>
			<li>- 티켓을 분실하실 경우 입장하실 수 없습니다.</li>
			<li>- 티켓을 변경 취소 환불하실 경우 인터파크 티켓을 통해서만 가능합니다.</li>
			<li>- 1+1혜택은 동일 날짜 동일 등급의 좌삭으로만 제공됩니다.</li>
			<li>- 티켓 예매 및 취소는 공연 하루 전 오전 11시까지 가능하며 공연 당일에는 취소 및 환불하실 수 없습니다.</li>
			<li>- 취급수수료와 예매 수수료는 예매처인 인터파크 정책에 따릅니다.</li>
			<li>- 예매처를 통해 정식 구매 절차를 거치지 않은 티켓은 취소 및 환불되지 않으며 이로 인한 문제 발생 시 삼성카드와 제작사는 책임을 지지 않습니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용은 사전에 알려 드립니다.</li>
		</ul>
	</div>


<map name="rp" id="rp">
<area shape="rect" coords="49,2572,287,2611" href="#" alt="1+1예매 및 티켓 수령 방법" onclick="window.open('/html/event/cicago/pop_01.html', 'popup', 'width=660px, height=550px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no');" title="새창" />
<area shape="rect" coords="294,2573,474,2612" href="#" alt="티켓예매 바로가기" onclick="go_start();" />
<area shape="rect" coords="481,2573,680,2610" href="#" alt="예매확인 및 취소하기" onclick="fnTicketCancel();" />
</map>

</body>

</html>

