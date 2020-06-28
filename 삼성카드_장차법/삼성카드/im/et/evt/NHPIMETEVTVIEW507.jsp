<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>cj푸드빌과 함께 맛있는 혜택 100% 페이백 릴레이 이벤트! - 삼성카드</title>
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
			parent.eventLogin('27721');
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

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/event_foodvill.jpg" alt="cj푸드빌과 함께 맛있는 혜택 100% 페이백 릴레이 이벤트!" border="0" usemap="#foodvill" />
<map name="foodvill" id="foodvill">
<area shape="rect" coords="73,1687,163,1707" href="javascript:parent.goTabPage('NHPIMSSSBC001M016');" alt="자세히보기" />
<area shape="rect" coords="248,1428,468,1466" href="#" onclick="go_start();" alt="페이백100%적립받기" />
</map>
<div class="hidden">
	<p>CJ푸드빌과 함께하는 맛있는 혜택</p>
	<h1>100% 페이백 릴레이 이벤트!</h1>
	<p>신선한 재료로 본연의 맛을 살린 CJ푸드빌에서 삼성카드 페이백으로 결제해 보세요 맛도, 포인트도 실속있게 100%로 챙겨드립니다.</p>
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 6월 1일(금) ~ 7월 31일(화)</dd>
		<dd>6월 행사 - 6월 1일(금) ~ 7월 1일(일) / 7월 행사 - 7월 2일(월) ~ 7월 31일(화)</dd>
		<dt>행사내용</dt>
		<dd>기간별 행사가맹점에서 페이백서비스를 이용하시고, 홈페이지를 통해 페이백 100% 적립받기를 등록하시면 사용하신 포인트의 100% 재적립</dd>
		<dt>행사가맹점</dt>
		<dd>6월 - 빕스(6월 1일 - 6월 10일), 씨푸드오션(6월 11일 - 6월 16일), 차이나팩토리 (6월 18일 - 6월 24일), 피셔스마켓(6월 25일 - 7월 1일)</dd>
		<dd>7월 - 비비고(7월2일-7월8일), 투썸플레이스(7월9일-7월 15일), 더플레이스(7월 16일-7월22일), 뚜레쥬르(7월23일-7월 31일)</dd>
	</dl>
	
	<h2>혜택예시(기존 30% 페이백서비스 가맹점일 경우)</h2>
	<p>예)30,000 포인트 보유 회원님이 행사기간동안 10만원 결제시</p>
	<p>즐거운 식사를 100,000원에 하시고 30%포인트 결제를 통해 30,000원 할인을 받으시고 실제로 70,000원을 결제하시면 사용하신 30,000포인트에 대해 33.3% 포인트 재적립, 66.7%포인트 추가 재적립을 통해 100% 
	페이백 포인트 재적립 30,000포인트가 적립됩니다.</p>
	
	<h2>포인트 추가 재적립일</h2>
	<p>6월 행사 2012년 7월 20일(금) / 7월 행사 2012년 8월 24일(금)</p>
	<ul>
		<li>- 행사기간동안 페이백 100% 적립받기를 한번만 등록하시면 횟수 제한 없이 기간별 행사가맹점에서 헤택을 받으실 수 있습니다.</li>
		<li>- 6월 행사는 6월 행사ㅣ간 종료전에 페이백 100% 적립받기를 꼭 등록하셔야 혜택을 받으실 수 있습니다. </li>
	</ul>
	
    <p>포인트 사용하고 돌려받는 페이백 서비스 - 이용금액의 최대 30%를 포인트로 결제하시면 사용하신 포인트의 33.3%를 돌려드립니다. <a href="#none" onclick="parent.goTabPage('NHPIMSSSBC001M016');return false;">자세히보기</a></p>

	<dl>
		<dt>유의사항</dt>
		<dd>
			<ul>
				<li>- 이벤트 종료 시 기존 페이백서비스의 포인트 재적립률이 적용됩니다.</li>
				<li>- 법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
				<li>- 카드사 및 제휴사의 사정으로 변경 종단될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
			</ul>
		</dd>
	</dl>

</div>

</body>

</html>

