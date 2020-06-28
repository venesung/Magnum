<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 레미제라블 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>

<script type="text/javascript">

	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('<%=cmsSeq%>');
		<%
			}else{
		%>
				if(parent.event_check()){
					//링크
					fnTicketBooking("13002147");	
				}
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
		if(parent.event_check()){
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
	      		win = window.open(loc,"wndCancel","top=10, left=10, width=770, height=600, scrollbars=yes");
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
	} 

	function eventpop(){
		window.open('/html/event/event130227/event_pop.html', 'popup', 'width=660px, height=550px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}

	
</script>
</head>

<body topmargin="0" leftmargin="0">
<img src="/images/et/event_130227.jpg" alt="SAMSUNGCARD SELECT12 뮤지컬 Les Miserables" border="0" usemap="#card" />
<map name="card" id="card">
  <area shape="rect" coords="475,1443,668,1481" href="javascript:fnTicketCancel();"  alt="예매확인 및 취소하기" title="예매확인 및 취소하기 새창"  />
  <area shape="rect" coords="295,1443,469,1481" href="javascript:go_start();" alt="티켓예매 바로가기" title="티켓예매 바로가기 새창"  />
  <area shape="rect" coords="60,1443,291,1480" href="javascript:eventpop();" title="1+1 예매 및 티켓 수령 방법 새창" alt="1+1예매 및 티켓 수령 방법" />
</map>

<div style="font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;">
	<h1>뮤지컬 레미제라블</h1>
	<p>삼성카드 셀렉트의 열두번째 선택 0 227년만에 국내 초연되는 세계 4대 뮤지컬 레미제라블!</p>

	<h2>공연일시</h2>
	<p>
		2013년 4월 23일(화) ~ 4월 26일(금) 오후 8시
		2013년 4월 27일(토) ~ 오후 2시, 7시
		2013년 4월 28일(일) ~ 오후 3시
	</p>
	<h2>공연장소</h2>
	<p>블루스퀘어 삼성전자홀</p>
	<h2>혜택내용</h2>
	<p>소중한 분과 함께하실 수 있는 1+1 혜택</p>
	<h2>티켓가격</h2>
	<p>VIP석 13만원/R석 11만원/S석 9만원/A석 7만원/B석 5만원</p>
	<h2>티켓오픈</h2>
	<p>
		프리미엄 회원 : 2013년 3월 21일(목) 오후 2시
		일반 회원 : 2013년 3월 22일(금) 오후 2시
	</p>
	<h2>티켓예매</h2>
	<p>삼성카드 홈페이지(프리미엄 회원 선예매는 프리미엄라운지에서 가능)</p>
	<h2>예매문의</h2>
	<p>삼성카드 대표전화 1588-8700</p>
	<h2>캐스팅</h2>
	<p>
		장발장 : 정성화, 김성민
		자베르 : 문종원
		판틴 : 조정은
		- 김성민(장발장)은 전체 7회 공연중 4월 27일(토) 오후 2시 공연만 출연합니다.
	</p>
	<p>
		공연에 꼭 필요한 것만 챙겨 드리는, 삼성카드 셀렉트!
		1. 1+1 혜택으로 소중한 사람과 특별한 시간을 함께하고!
		2. 폴라로이드 사진으로 추억을 나누고!
		3. 더 쉽고 편하게 즐길 수 있도록 사전해설과 리플렛을 더하여!
		보다 깊은 공연의 감동을 드립니다.
	</p>
	<h2>예매 전, 반드시 읽어주세요!</h2>
	<ul>
		<li>반드시 티켓 오픈일 2시 정각에 로그인을 하셔야 예매를 하실 수 있습니다. 로그인을 미리 하신 후 2시에 티켓 예매 창이 열리지 않을 경우, 새로고침 또는 재로그인을 하셔야 합니다.</li>
		<li>좌석을 선택하신 후 3분 이내 결제를 하셔야 결제가 완료됩니다. 3분이 지나면 다른 회원님께 기회가 제공됩니다.</li>
		<li>잔여석이 있더라도 좌석표가 모드 흰색이면 현재 다른 회원님이 선태갛여 결제 중인 상태이므로, 예매를 하실 수 없습니다.</li>
		<li>1+1 혜택은 동일 날짜, 동일 등급, 동일 층수의 좌석으로만 제공되며 예매 시 직접 선택하실 수 있습니다.</li>
		<li>예매 완료 후 1+1 혜택의 사후 적용은 불가능하므로, 반드시 예매 전 '예매 및 티켓 수령방법'을 클릭하여 확인하시기 바랍니다.</li>
	</ul>

	<p>
		- 삼성카드 홈페이지를 통해서만 예매 가능합니다.
		- 티켓은 한정 수량 판매로 인해 조기 종료될 수 있으니, 예매를 서둘러 주시기 바랍니다.
		- 티켓은 삼성카드(신용/체크/법인카드)로 1인 2매까지 구입하실 수 있으며, 2매 구입시 4매가 제공됩니다.(올앳/선불/기프트카드 제외)
		- 7세 미만 미취학 아동은 관람할 수 없으며, 관람 연령이 되는 청소년은 티켓을 구입해야 입장할 수 있습니다.
		- 티켓 분실 &middot; 파손 시 재발권되지 않으며, 어떤 이유로도 입장하실 수 없으니 주의하시기 바랍니다.
		- 티켓을 변경, 취소, 환불하실 경우 인터파크 티켓을 통해서만 가능합니다.
		- 티켓 취소는 공연일 전일 오후 5시까지 가능합니다.
		- 취급수수료와 예매수수료는 예매처인 인터파크 정책에 따릅니다.
		- 예매처를 통해 정식 구매 절차를 거치지 않은 티켓은 취소 및 환불되지 않으며 이로 인한 문제 발생 시 삼성카드와 제작사는 책임을 지지 않습니다.
		- 카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.
	</p>
</div>


</body>
</html>

