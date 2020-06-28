<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>프리미엄 회원 단독 40% 할인 혜택! - 삼성카드</title>
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
				window.open("http://www.ntok.go.kr/etc/2012/ntok_samsung_p.html","","");
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
<img src="/images/et/prefest/120919_event.jpg" alt="공연문화의 중심 삼성카드 프리미엄 회원 단독 40% 할인 혜택!" border="0" usemap="#p" />

	<div class="hidden">
		<p>삼성카드 제휴 문화공연 할인 안내</p>
		<h1>공연문화의 중심 삼성카드 프리미엄 회원 단독 40% 할인 혜택</h1>
		<p>문화공연도 즐기고 할인혜택도 받으세요</p>
        <p><a href="#none" onclick="go_start();return false;" >예매하기</a></p>
		
		<h2>2012세계 국립극장 페스티벌 해외 초청작</h2>
		
		<h3>경극 - 쉐린낭</h3>
		<ul>
			<li>공연일시 - 2012년 9월 26일(수) ~ 9월 27일(목) 오후 8시</li>
			<li>공연장소 - 해오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - VIP석 7만원 , R석 5만원 , S석 3만원 , A석 2만원</li>
			<li>공연출연 - 중국 국립경극원</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h3>연극 - 안티고네</h3>
		<ul>
			<li>공연일시 - 2012년 10월 5일(금) ~ 10월 6일(토) 평일 오후 8시, 토요일 오후 2시, 7시</li>
			<li>공연장소 - 달오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - R석 5만원 , S석 3만원 , A석 2만원</li>
			<li>공연출연 - 터키 국립경극원</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h3>현대무용 - K이야기</h3>
		<ul>
			<li>공연일시 - 2012년 10월 13일(토) ~ 10월 14일(일) 토요일 오후 7시, 일요일 오후 4시</li>
			<li>공연장소 - 해오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - R석 5만원 , S석 3만원 , A석 2만원</li>
			<li>공연출연 - 홍콩현대무용단</li>
			<li>관람등급 - 중학생 이상</li>
		</ul>
		
		<h3>발레 - 홍등</h3>
		<ul>
			<li>공연일시 - 2012년 10월 18일(목) ~ 10월 19일(금) 오후 8시</li>
			<li>공연장소 - 해오름극장</li>
			<li>공연혜택 - 모든회원 20% 할인</li>
			<li>티켓가격 - VIP석 12만원 , R석 9만원 , S석 6만원 , A석 4만원 , B석 2만원</li>
			<li>공연출연 - 중국 국가발레단</li>
			<li>관람등급 - 만 6세 이상</li>
		</ul>
		
		<h3>연극 - 인간 혐오자</h3>
		<ul>
			<li>공연일시 - 2012년 10월 18일(목) ~ 10월 20일(토) 평일 오후 8시, 토요일 오후 3시</li>
			<li>공연장소 - 달오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - R석 5만원 , S석 3만원 , A석 2만원</li>
			<li>공연출연 - 슬로바키아 마틴시립극장</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h2>2012 세계국립극장 페스티벌 국내 초청작</h2>
		
		<h3>연극 - 난 집에 있었지 그리고 비가 오기를 기다리고 있었지</h3>
		<ul>
			<li>공연일시 - 2012년 9월 18일(화) ~ 10월 7일(일) 평일 오후 8시 , 토요일 오후 3시 7시, 일요일 오후 3시, 10월 3일(수) 오후 3시 7시</li>
			<li>공연장소 - 별오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - 전석 30,000원</li>
			<li>공연출연 - 극단 프랑코포니</li>
			<li>관람등급 - 만 7세 이상 (월요일 및 추석 9월 30일 공연은 쉽니다.) </li>
		</ul>
		
		<h3>연극 - 템페스트</h3>
		<ul>
			<li>공연일시 - 2012년 9월 21일(금) ~ 10월 7일(일) 평일 오후 8시 금,토 오후 3시 8시 / 일요일 오후 4시, 9월 21일(금) 오후 8시 , 10월 3일(수) 오후 3시 8시</li>
			<li>공연장소 - KB국민은행청소년 하늘극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - 전석 30,000원</li>
			<li>공연출연 - 극단 목화레퍼토리</li>
			<li>관람등급 - 만 7세 이상 (월요일 및 추석 9월 30일 공연은 쉽니다.)</li>
		</ul>
		
		<h3>창작콘서트 - 돌에 새긴 사랑</h3>
		<ul>
			<li>공연일시 - 2012년 9월 27일(목) ~ 9월 28일(금) 오후 8시</li>
			<li>공연장소 - 달오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - 전석 20,000원</li>
			<li>공연출연 - 가온누리 예술기획</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h3>한국무용 - 처용</h3>
		<ul>
			<li>공연일시 - 2012년 10월 6일(토) 오후 5시</li>
			<li>공연장소 - 해오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - VIP석 5만원 , R석 3만원 , S석 1만원 </li>
			<li>공연출연 - 대전시립무용단</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h3>복합장르 - 네 개의 벽/4분 33초</h3>
		<ul>
			<li>공연일시 - 2012년 10월 18일(목) ~ 10월 19일(금) 오후 8시</li>
			<li>공연장소 - KB국민은행 청소년 하늘극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - VIP석 4만원 , R석 3만원 , S석 2만원</li>
			<li>공연출연 - 웃는돌 무용단</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
		<h3>무용 - 이외수의 들개</h3>
		<ul>
			<li>공연일시 - 2012년 10월 24일(수) ~ 10월 27일(토) 오후 8시, 토요일 오후 5시</li>
			<li>공연장소 - 별오름극장</li>
			<li>공연혜택 - 프리미엄 회원 40% 할인, 일반 회원 30% 할인</li>
			<li>티켓가격 - 전석 20,000원</li>
			<li>공연출연 - 팩토리 1+1</li>
			<li>관람등급 - 만 7세 이상</li>
		</ul>
		
        <p><a href="#none" onclick="go_start();return false;" >예매하기</a></p>
		<p>공연문의 - 국립극장 02-2280-4114  ~ 6</p>
		
		<ul>
			<li>- 국립그장 로그인 후 에매하실 수 있습니다.</li>
			<li>- 취급수수료 및 예매수수료는 예매처의 정책에 따릅니다.</li>
			<li>- 티켓을 변경, 취소, 환불사실 경우, 예매하신 사이트를 통해서만 가능합니다.</li>
			<li>- 티켓분실, 파손시 재발권되지 않으며, 어떤 이유로도 입장하실 수 없으니 주의하시기 바랍니다.</li>
			<li>- 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 샂어으로 변경 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
		</ul>
		
		
	
	</div>


<map name="p" id="p">
<area shape="rect" coords="579,246,687,274" href="#" onclick="go_start();" alt="예매하기" />
<area shape="rect" coords="287,3532,442,3570" href="#" onclick="go_start();" alt="예매하기" />
</map>

</body>

</html>

