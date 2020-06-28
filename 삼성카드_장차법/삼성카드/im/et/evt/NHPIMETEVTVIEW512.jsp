<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 모차르트 1+1 이벤트 - 삼성카드</title>
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
				fnTicketBooking("12012864");
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
	        o.value = "16875";
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
	        o.value = "16875";
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

<img src="/html/et/moz201207/images/120612_mozart_premium.jpg" alt="SAMSUNGCARD SELECT06 뮤지컬 모차르트!" border="0" usemap="#mozart" />

	<div class="hidden">
		<h1>뮤지컬 모차르트</h1>
		<p>가치에 실속을 더한 1+1 문화혜택! 삼성카드 셀렉트 올 여름 음악에 미친 그가 온다!</p>
		
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 7월 24일(화) 오후 8시</dd>
			<dt>공연장소</dt>
			<dd>세종문화회관 대극장</dd>
			<dt>행사내용</dt>
			<dd>삼성카드로 결제시 1+1 혜택</dd>
			<dt>티켓가격</dt>
			<dd>VIP석 - 130,000원 , R석 - 110,000원 , S석 - 90,000원 , A석 - 70,000원 , B석 - 50,000원 , C석 - 30,000원</dd>
			<dt>티켓오픈</dt>
			<dd>프리미엄회원 : 7월 10일(화) 오후2시, 일반회원 : 7월 11일(수) 오후 2시
				<p>7월 11일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매가 잠시 불가하며, 일반회원에게 오픈되는 7월 11일 오후 2시 이후에도 프리미엄 회원은 계속 예매하실 수 있습니다.</p>
			</dd>
			<dt>티켓예매</dt>
			<dd>삼성카드 홈페이지</dd>
			<dt>문의</dt>
			<dd>1588-8700</dd>
			<dt>캐스팅</dt>
			<dd>
				<ul>
					<li>장현승 - 볼프강 모차르트</li>
					<li>최성희 - 콘스탄체 베버</li>
					<li>윤형렬 - 콜로레도 대주교</li>
					<li>이정열 - 레오폴트 모차르트</li>
					<li>김재만 - 임마누엘 쉬카네더</li>
				</ul>
			</dd>
		</dl>
		<p>
			<a href="#none" onclick="window.open('/html/et/moz201207/pop.html', 'popup', 'width=710px, height=595px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" title="새창">공연정보 자세히 보기</a>
            <a href="#none" onclick="go_start();return false;" >티켓예매 바로가기</a>
            <a href="#none" onclick="fnTicketCancel();return false;" >예매확인 및 취소하기</a>
		</p>
		
		<ul>
			<li>- 7월 11일 오전 11시 ~ 낮 2시는 시스템 점검관계로 예매가 잠시 불가합니다.</li>
			<li>- 1+1혜택은 동일날짜 동일 등급으로 받으실 수 있습니다.</li>
			<li>- 티켓은 한정 수량 판매로 인해 조기 종료될 수 있으니, 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 티켓은 삼성카드(신용/체크/법인카드)로 1인 2매까지 구입하실 수 있으며, 2매 구입 시 4매가 제공됩니다.(올앳/선불/기프트카드 제외)</li>
			<li>- 만 7세 미만의 미취학 아동은 관람할 수 없으며 관람 연령이 되는 어린이는 티켓을 구입해야 입장할 수 있습니다.</li>
			<li>- 티켓을 분실하실 경우 입장하실 수 없습니다.</li>
			<li>- 티켓을 변경, 취소, 환불하실 경우 삼성카드 홈페이지를 통해서만 가능합니다.</li>
			<li>- 티켓예매 및 취소는 공연 하루 전 오후 5시까지 간으하며, 공연 당일에는 티켓 일자 변경 및 환불하실 수 없습니다.</li>
			<li>- 취급수수료는 예매처인 인터파크 정책에 따릅니다.</li>
			<li>- 예매처를 통해 구매 저차를 거치지 않은 티켓은 취소 및 환불되지 않으며 이로 인한 문제 발생 시 삼성카드와 제작사는 책임을 지지 않습니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
		</ul>
		
		
	</div>


<map name="mozart" id="mozart">
  <area shape="rect" coords="58,1391,265,1429" href="#" onclick="window.open('/html/et/moz201207/pop.html', 'popup', 'width=710px, height=595px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" alt="공연정보 자세히 보기" title="새창" />
  <area shape="rect" coords="272,1392,456,1429" href="#" onclick="go_start();" alt="티켓예매 바로가기" />
  <area shape="rect" coords="464,1392,670,1429" href="#" onclick="fnTicketCancel();" alt="예매확인 및 취소하기" />
</map>

</body>

</html>

