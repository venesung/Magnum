<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>금요일엔 &lt;너와함께라면&gt; 만원의 행복! - 삼성카드</title>
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
				window.open("http://ticket.interpark.com/Partner/Closure/index.asp?BizCode=17008","","");
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
<img src="/images/et/play201208/120709_event2.jpg" alt="금요일엔&lt;너와 함께라면&gt;, 만원의 행복" border="0" usemap="#you" />

	<div class="hidden">
		<p>삼성카드 프리미엄 회원 단독</p>
		<h1>금요일엔 &gt;너와함께라면&lt; 만원의 행복!</h1>
		<p>상상초월 포복절도 러브 코미디~ 올여름 더위를 몰아낼 웃음 토네이도~ 삼성카드가 드리는 프리미엄 혜택과 즐거움을 누려보세요!</p>
		
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 8월 3일(금) ~ 8우러 31일(금)</dd>
			<dt>공연장소</dt>
			<dd>대학로 소리아트홀 1관</dd>
			<dt>행사내용</dt>
			<dd>프리미엄 회원께서 매주 금요일 공연을 삼성카드로 결제 시 단독 만원에 제공</dd>
			<dt>티켓가격</dt>
			<dd>10,000원</dd>
			<dt>티켓예매</dt>
			<dd>인터파크 티켓</dd>
			<dt>문의</dt>
			<dd>연극열전 02-766-6007</dd>
			<dt>출연진</dt>
			<dd>
				<ul>
					<li>아버지 - 김진수, 최대철</li>
					<li>어머니 - 이정은 이지해</li>
					<li>남자친구 - 이갑선, 최진석</li>
					<li>큰딸 - 손희승, 윤영민</li>
					<li>작은딸 - 류혜린, 장유리</li>
					<li>남자친구의 아들 - 이현응, 김혁</li>
					<li>이발소 종업원 - 김동현, 김민혁</li>
				</ul>
			</dd>
		</dl>
        <p><a href="#none" onclick="go_start();return false;">예매하기</a></p>
		
		<ul>
			<li>- 티켓은 한정 수량 판매로 인해 조기 종료될 수 있으니, 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 취급수수료 및 예매수수료는 예매처인 인터파크의 정책에 따릅니다.</li>
			<li>- 티켓을 변경, 취소, 환불하실 경우 인터파크 티켓을 통해서만 가능합니다.</li>
			<li>- 선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
			<li>- 예매 중 인증번호는 876296을 넣으시면 됩니다.</li>
		</ul>
		
	</div>

<map name="you" id="you">
  <area shape="rect" coords="287,1948,442,1985" href="#" onclick="go_start();" alt="예매하기" />
</map>
</body>

</html>

