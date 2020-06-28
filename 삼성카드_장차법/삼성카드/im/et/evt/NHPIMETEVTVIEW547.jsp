<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>국립극장 프리미엄회원  단독할인,삼성카드 공연혜택! - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");

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
				//링크
				window.open("http://www.ntok.go.kr/etc/2012/ntok_samsung_p2.html","","");
				//fnTicketBooking("12012799");
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

<body topmargin="0" leftmargin="0">
<img src="/images/et/event_ntok.jpg" alt="국립극장 프리미엄회원  단독할인,삼성카드 공연혜택!" border="0" usemap="#p" />

	<div class="hidden">
		<p>삼성카드 회원만의 문화 특권!</p>
		<h1>국립극장 프리미엄 회원 단독 할인, 삼성카드 공연혜택!</h1>
		<p>삼성카드 공통서비스 S의 특별한 공연혜택에 프리미엄 추가 할인 혜택까지 가을의 깊이를 더해주는 감동을 만나 보세요!</p>
		
		<h2>만수산 드렁칡 - 양악과 국악, 시와 합창의 만남</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 11월 2일(금) ~ 11월 3일(토) 평일 오후 8시 / 토요일 오후 4시</dd>
			<dt>공연장소</dt>
			<dd>해오름극장</dd>
			<dt>공연혜택</dt>
			<dd>프리미엄 회원 40% 할인</dd>
			<dt>티켓가격</dt>
			<dd>R석 5만원, S석 3만원, A석 2만원</dd>
			<dt>공연출연</dt>
			<dd>국립국악관현악단</dd>
			<dt>관람등급</dt>
			<dd>만 7세 이상</dd>
		</dl>
		
		<h2>4색 콘서트 - 네 개의 스테이지로 만나는 합창의 즐거움</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 11월 6일(화) 오후 7시 30분</dd>
			<dt>공연장소</dt>
			<dd>해오름극장</dd>
			<dt>공연혜택</dt>
			<dd>프리미엄 회원 30% 할인</dd>
			<dt>티켓가격</dt>
			<dd>R석 5만원, S석 3만원, A석 2만원, B석 1만원</dd>
			<dt>공연출연</dt>
			<dd>국립합창단</dd>
			<dt>관람등급</dt>
			<dd>만 7세 이상</dd>
		</dl>
		
		<h2>왕자호동 - 대한민국을 넘어 세계로 향하는 발레</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 11월 11일(일) 오후 3시</dd>
			<dt>공연장소</dt>
			<dd>해오름극장</dd>
			<dt>공연혜택</dt>
			<dd>프리미엄 회원 30% 할인</dd>
			<dt>티켓가격</dt>
			<dd>R석 4만원, S석 5만원, A석 4만원, B석 3만원, C석 1만원, D석 5천원</dd>
			<dt>공연출연</dt>
			<dd>국립합창단</dd>
			<dt>관람등급</dt>
			<dd>만 7세 이상</dd>
		</dl>
		
		<h2>그대 논개여! - 한국 여인의 초상, 예술적 상상력 극치</h2>
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 11월 16일(금) ~ 11월 18일(일) 평일 오후 8시 / 토요일 오후 3시, 7시 / 일요일 3시</dd>
			<dt>공연장소</dt>
			<dd>해오름극장</dd>
			<dt>공연혜택</dt>
			<dd>프리미엄 회원 40% 할인</dd>
			<dt>티켓가격</dt>
			<dd>VIP석 7만원, R석 5만원, S석 3만원, A석 2만원</dd>
			<dt>공연출연</dt>
			<dd>국립무용단</dd>
			<dt>관람등급</dt>
			<dd>만 7세 이상</dd>
		</dl>
        <p><a href="#none" onclick="go_start();return false;">예매하기</a></p>
		<p>공연문의 - 국립극장 02-2280-4114~6</p>
		
		<ul>
			<li>- 국립극장 로그인 후 예매하실 수 있습니다.</li>
			<li>- 취급수수료 및 예매수수료는 예매처의 정책에 따릅니다.</li>
			<li>- 티켓을 변경, 취소, 환불하실 경우, 예매하신 사이트를 통해서만 가능합니다.</li>
			<li>- 티켓 분실 파손시 재발권 되지 않으며, 어떤 이유로도 입장하실 수 없으니 주의 하시기 바랍니다.</li>
			<li>- 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경, 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
		</ul>
		
	</div>



<map name="p" id="p">	
	<area shape="rect" coords="287,1500,441,1539" href="#" onclick="go_start();" alt="예매하기" title="새창" /><!-- 정기일반영 12.10.29 -->
</map>

</body>

</html>

