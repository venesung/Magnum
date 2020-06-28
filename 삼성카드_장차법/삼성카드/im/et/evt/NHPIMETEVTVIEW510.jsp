<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>당신만의 새로운 프리미엄,삼성카드1론칭이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
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
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('30855');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 응모 하셨습니다.");	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("응모해주셔서 감사합니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value="" />
<input type="hidden" name="eventNo" value="<%=eventNo%>" />
</form>

<img src="/images/et/event_card1.jpg" alt="당신만의 새로운 프리미엄,삼성카드1론칭이벤트" border="0" usemap="#lacage" />


	<div class="hidden">
		<p>합리적인 프리미엄의 시작</p>
		<h1>only one 삼성카드 1론칭 프로모션</h1>
		<p>프리미엄에 대한 세상의 기준보다, 스스로의 기준을 믿는 당신께 품격을 더한 실용적인 헤택과 이벤트를 만나 보세요</p>
		
		<h2>Event1. only one 삼성카드 1 프리미엄 다이닝 이벤트</h2>
		<p>전국 11개 프리미엄 레스토랑에서 최대 50% 할인 혜택으로 삼성카드 1의 현명한 프리미엄을 경험해 보세요.</p>
	
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 8월 1일(수) ~ 10월31일(수)</dd>
			<dt>행사내용</dt>
			<dd>행사기간 동안 전국 111개 제휴 레스토랑에서 삼성카드 1으로 결제하신 회원님께 10%  기본 현장할인 및 40% 추가 현장 할인 제공</dd>
			<dt>참여방법</dt>
			<dd>
				<ul>
					<li>사전 전화예약 - 원하시는 레스토랑에 전화예약을 하시고, 삼성카드1으로 결제할께요 라고 말씀해 주세요</li>
					<li>프리미엄 서비스 - 삼성카드1 회원님만을 위한 예약석에서 품격있는 서비스를 받으세요.</li>
					<li>최대 50% 할인 - 삼성카드 1으로 결제하시면 최대 50% 현장할인 혜택을 드립니다</li>
				</ul>
			</dd>
		</dl>
		<p><a href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1266" target="_blank" title="새창">레스토랑 확인 및 예약하기</a></p>
		<ul>
			<li>- 이동 페이지에서 다이닝 메뉴를 선택하시면 레스토랑 리스트가 나옵니다.</li>
			<li>- 일 1회 테이블 당 1회 제공됩니다.</li>
			<li>- 10%기본 현장할인은 삼성카드 1의 상시 서비스입니다.</li>
			<li>- 40% 추가현장할인은 1일 최대 40,000원까지 제공됩니다.</li>
			<li>- 최종 결제금액에 대해 할인이 제공되며, 부가세는 별도입니다.</li>
		</ul>
		
		
		<h2>Event2. only one 삼성카드 1 신세계 상품권 증정 이벤트</h2>
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 8월 1일(수) ~ 9월 30일(일)</dd>
			<dt>행사내용</dt>
			<dd>행사기간 동안 이벤트에 응모하신 후 해당 월에 삼성카드 1으로 일시불 및 할부 300만원 이상 결제하신 모든 회원님께 5만원권 신세계모바일상품권 증정</dd>
			<dt>경품 배송일</dt>
			<dd>2012년 9월 18일(화) / 10월 16일(화)</dd>
		</dl>
		
        <p><a href="#none" onclick="go_start();return false;">이벤트 응모하기</a></p>
		
		<ul>
			<li>- 상품권은 회원님이 웹 회원정보에 등록하신 휴대폰번호로 발송됩니다.</li>
			<li>- 행사기간 동안 상품권은 1회 제공되며, 9월 중복되지 않습니다.</li>
			<li>- 일시불 빛 할부 이용금액은 매출접수일 기준이며, 해외 이용시 국가에 따라 승인시간과 접수시간이 다를 수 있습니다.</li>
		</ul>
		
		<h2>삼성카드 1을 만나보세요 합리적인 프리미엄의 시작</h2>
		<ul>
			<li>포인트/마일리지 적립 : 기본 리워드에 추가 리워드 혜택 제공</li>
			<li>항공/호텔/쇼핑까지 합리적 소비생활을 추구하는 기프트 제공</li>
			<li>여행/다이닝/레저 등 프리미엄 라이프스타일 지원 서비스 제공</li>
		</ul>
		<p>상섬카드 1에 대한 자세한 내용은 홈페이지를 확인하세요 <a href="https://samsungcard.com/index.do?menuId=NHPIMCDCPS023" target="_blank" title="새창"> 자세히보기</a></p>
		<p>카드사 및 제휴사의 사정으로 변경 중단 될 수 있으며 그 내용을 사전에 알려 드립니다.</p>
	</div>



<map name="lacage" id="lacage">
<area shape="rect" coords="311,1011,501,1040" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1266" target="_blank" title="새창" alt="레스토랑확인&amp;예약하기" />
<area shape="rect" coords="339,1482,470,1513" href="#" onclick="go_start();" alt="이벤트응모하기" />
<area shape="rect" coords="291,1835,375,1856" href="https://samsungcard.com/index.do?menuId=NHPIMCDCPS023" target="_blank" title="새창" alt="자세히보기"/>

</map>

</body>

</html>

