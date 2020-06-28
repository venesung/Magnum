<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>금융 혜택 받고, 뮤지컬 행운 받고- 삼성카드론 문화 이벤트! - 삼성카드</title>
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
			parent.eventLogin('27063');
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

<img src="/images/et/120521_event.jpg" alt="금융 혜택 받고, 뮤지컬 행운 받고- 삼성카드론 문화 이벤트!" border="0" usemap="#finance" />
<map name="finance" id="finance">
<area shape="rect" coords="187,821,406,843" href="javascript:parent.goTabPage('NHPIMFSLMT');" alt="삼성카드론 가능 금액 및 이자율 확인하기" />
<area shape="rect" coords="414,822,539,843" href="javascript:parent.goTabPage('NHPIMFSCDLM');" alt="삼성카드론 신청하기" />
<area shape="rect" coords="288,987,441,1025" href="#" onclick="go_start();" alt="응모하기" />
</map>
<div class="hidden">
    <p>금융혜택 받고 뮤지컬 행운 받고</p>
    <h1>삼성카드론 문화 이벤트!</h1>
    <p>삼성카드론 최초 이용 회원님께 총 171분을 추첨하여 뮤지컬 '위키드 VIP석 티켓'을 드립니다(1인 2매)</p>
    
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 5월 21일 (월) ~ 6월 17일(일)</dd>
        <dt>행사내용</dt>
        <dd>행사기간 내 삼성카드론을 최초 이용하신 회원님(단, 총 100만원 이상 이용)중 이벤트에 응모하시면 총 171분을 추첨하여 뮤지컬 위키드 VIP석 티켓 증정(1인 2매)</dd>
        <dt>응모방법</dt>
        <dd>응모하기 버튼 클릭 후 삼성카드론 이용 <a href="#none" onclick="parent.goTabPage('NHPIMFSLMT');return false;">삼성카드론 가능 금액 및 이자율 확인하기</a>
            <a href="#none" onclick="parent.goTabPage('NHPIMFSCDLM');return false;">삼성카드론 신청하기 </a>
        </dd>
        <dt>당첨자발표</dt>
        <dd>2012년 6월 21일(목) 홈페이지 당첨자발표란 및 문자메세지로 개별 안내</dd>
        <dt>티켓 발송 예정일</dt>
        <dd>2012년 6월 25일 (월) 이후</dd>
        <dt>공연일정</dt>
        <dd>2012년 7월 1일 ~ 7월 31일(화)</dd>
    </dl>
    <p><a href="#none" onclick="go_start();return false;">응모하기</a></p>
    
    <ul>
        <li>- 자세한 공연일정 및 내용은 뮤지컬 위키드 홈페이지를 확인하세요
             (<a href="http://www.wickedthemnusical.co.kr/tickets.html" title="새창" target="_blank">www.wickedthemnusical.co.kr/tickets.html</a>)</li>
        <li>- 삼성카드론 이용 전 후에 관계없이 이벤트에 응모하실 수 있습니다.</li>
        <li>- 공연날짜 및 시간은 추첨을 통해 무작위로 결정되며, 회원님이 선택 및 변경하실 수 없습니다.</li>
    </ul>
    
    <h2>삼성카드론 최초 이용 회원 지연 입금안내</h2>
    <p>회원님의 소중한 금융 자산을 안전하게 보호하기 위해 아래와 같이 서비스가 변경됩니다.</p>
    <dl>
        <dt>변경내용</dt>
        <dd>최초 이용 당일 합산기준 300만원 이상 삼성카드론 신청 시 2시간 후 입금(현금지급기 이용금액 제외)</dd>
        <dt>변경일</dt>
        <dd>2012년 5월 17일(목) 부터</dd>
        <dd>- 자세한 내용은 삼성카드 홈페이지 또는 대표전화(1588-8700)를 통해 확인하세요</dd>
    </dl>
    <p>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</p>

</div>

</body>

</html>

