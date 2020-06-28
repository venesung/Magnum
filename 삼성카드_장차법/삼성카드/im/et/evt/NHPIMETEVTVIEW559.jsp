<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>국립극장 프리미엄회원  단독할인,삼성카드 공연혜택! - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");

	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
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
				//링크
				window.open("http://www.ntok.go.kr/etc/2012/ntok_samsung_p3.html","","");
		<%
			}
		%>
	}
	
</script>


</head>

<body style="margin:0;">
<img src="/images/et/event_premium.jpg" alt="국립극장 프리미엄회원  단독할인,삼성카드 공연혜택!" border="0" usemap="#ntok" />
<map name="ntok" id="ntok">
<area shape="rect" coords="298,1229,430,1265" href="#" onclick="go_start();" alt="예매하기" />
</map>
 <div class="hidden">
	<h1>국립극장 연말 공연 삼성카드 프리미엄회원 단독 할인</h1>
	<h2>화선 김홍도(국립레퍼토리시즌 가무악극)</h2>
	<dl>
		<dt>공연일시</dt>
		<dd>2012년 12월 5일(수) ~ 12월 9일(일) 수&middot;토요일 오후 3시, 8시/목&middot;금요일 오후 8시/일요일 오후 3시</dd>
		<dt>공연장소</dt>
		<dd>해오름극장</dd>
		<dt>공연혜택</dt>
		<dd>일반 회원 30% 할인, 프리미엄 회원 40% 할인</dd>
		<dt>티켓가격</dt>
		<dd>VIP석 7만원, R석 5만원, S석 3만원, A석 2만원</dd>
		<dt>공연출연</dt>
		<dd>국립극장</dd>
		<dt>관람등급</dt>
		<dd>만 7세 이상</dd>
	</dl>
	<h2>베비장전(국립레퍼토리시즌 창극)</h2>
	<dl>
		<dt>공연일시</dt>
		<dd>2012년 12월 8일(토) ~ 12월 16일(일) 평일 오후 8시/주말 오후 3시</dd>
		<dt>공연장소</dt>
		<dd>달오름극장</dd>
		<dt>공연혜택</dt>
		<dd>일반 회원 30% 할인, 프리미엄 회원 40% 할인</dd>
		<dt>티켓가격</dt>
		<dd>R석 5만원, S석 3만원, A석 2만원</dd>
		<dt>공연출연</dt>
		<dd>국립창극단</dd>
		<dt>관람등급</dt>
		<dd>만 7세 이상</dd>
	</dl>
	<h2>시나위 프로젝트1(국립레퍼토리시즌 국악)</h2>
	<dl>
		<dt>공연일시</dt>
		<dd>2012년 12월 16일(일) 오후 4시</dd>
		<dt>공연장소</dt>
		<dd>KB청소년하늘극장</dd>
		<dt>공연혜택</dt>
		<dd>일반 회원 30% 할인, 프리미엄 회원 40% 할인</dd>
		<dt>티켓가격</dt>
		<dd>R석 3만원, S석 2만원</dd>
		<dt>공연출연</dt>
		<dd>국립국악관현악단</dd>
		<dt>관람등급</dt>
		<dd>만 7세 이상</dd>
	</dl>
	
	<p>공연문의 국립극장 02-2280-4114~6</p>
	
	<ul>
		<li>국립극장 로그인 후 예매하실 수 있습니다.</li>
		<li>취급수수료 및 예매수수료는 예매처의 정책에 따릅니다.</li>
		<li>티켓을 변경&middot;취소&middot;환불하실 경우, 예매하신 사이트를 통해서만 가능합니다.</li>
		<li>티켓 분실&middot;파손 시 재발권되지 않으며, 어떤 이유로도 입장하실 수 없으니 주의하시기 바랍니다.</li>
		<li>법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>


</body>

</html>

