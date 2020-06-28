<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>해외 7대도시 항공권 할인 혜택 이벤트 - 삼성카드</title>
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
			parent.eventLogin('22964');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
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
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<img src="/images/et/120126_onlinetour.jpg" border="0" usemap="#Map" alt="" />

<div class="hidden">
	<h1>해외 7대도시 항공권 할인 혜택을 드립니다.</h1>
	<p>2012년 3월 1일 시작되는 여섯번째 Global Select의 프리오픈 이벤트로 인터파크투어에서 예매 시 7대 도시 항공권 할인 헤택을 드립니다.</p>
	
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 2월 1일(수) ~ 2월 29일(수)</dd>
		<dt>행사대상</dt>
		<dd>행사기간 동안 행사도시로 3-5월에 출발하는 왕복항공권을 인터파크 투어를 통해 온라인 예약 및 결제하신 회원</dd>
		<dt>행사도시</dt>
		<dd>뉴욕, 샌프란시스코, 런던, 파리, 로마, 홍콩, 도쿄</dd>
		<dt>행사내용</dt>
		<dd>삼성카드 기본 2% 할인 또는 Global Select 프로모션 최대 4-8% 추가 할인(도시별 할인율 상이)</dd>
		<dt>이용방법</dt>
		<dd>온라인투어에서 삼성카드 Global Select 행사 가격 선택 시 할인</dd>
	</dl>
	
	<p><a href="http://www.onlinetour.co.kr/event/view.asp?idx=1478&_C_=20384" target="_blank" title="새창">온라인투어 바로가기</a></p>
	
	<h2>세계인이 사랑하는 그곳으로 Global Select Landmark</h2>
	<p>삼성카드만의 차별화된 해외우대서비스 Global Select의 6번째 시리즈 Landmark! 국내에서 뉴욕 샌프란시스코, 런던, 파리, 로마, 홍콩, 도쿄까지의 황복항공권 특별 할인 혜택을 비롯해 삼성카드 회원만을 위해 더욱 특별해진 Global Select Landmark, 2012년 3월 1일을 기대해 주세요</p>
	
	<ul>
		<li>자세한 내용은 2012년 3월 1일(목) 홈페(<a href="https://www.samsungcard.com" title="삼성카드 사이트 바로가기" >http://www.samsungcard.com</a>)를 통해 안내됩니다.</li>
		<li>Global Select Landmark혜택은 이벤트 기간 중 신처하신 회원님에 한해 제공되며, 프리오픈 이벤트 기간에 미리 신청 가능합니다.</li>
	</ul>
	<p><a href="#none" onclick="go_start();;return false;" title="Global Select Landmark 신청하기">Global Select Landmark 신청하기</a></p>

	<ul>
		<li>삼성카드 결제 시 제공되며, 법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
	</ul>

</div>


<map name="Map" id="Map">
  <area shape="rect" coords="264,1167,465,1206" alt="온라인투어 바로가기" href="http://www.onlinetour.co.kr/event/view.asp?idx=1478&_C_=20384" target="_blank" title="새창" />
	<area shape="rect" coords="197,1758,530,1794" alt="Global Select Landmark 신청하기" href="#" onclick="go_start();return false;" />
</map>

</body>

</html>

