<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼서카드 SFC5,삼성카드SFC5+탄생 이벤트 - 삼성카드</title>
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
p {margin:0; padding:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('26607');
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
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<img src="/images/et/payback/120425_payback.jpg" alt="삼서카드 SFC5,삼성카드SFC5+탄생 이벤트" border="0" usemap="#payback" />
<map name="payback" id="payback">
<area shape="rect" coords="249,1499,467,1537" href="#" onclick="go_start();" alt="페이백 100% 적립받기" />
<area shape="rect" coords="72,1666,162,1688" href="javascript:parent.goTabPage('NHPIMSSSBC001M016');"  alt="자세히 보기" />
</map>
<div class="hidden">
    <h1>삼성카드 2배 즐기기 100% 페이백 이벤트!</h1>
    <p>소중한 분들과 행복한 나들이 떠날 땐 삼성카드 페이백서비스로 결재해 보세요. 쓴 포인트를 100% 돌려받아 실속도, 행복도 커집니다.</p>
    
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 5월 1일(화) ~ 6월 3일(일)</dd>
        <dt>행사내용</dt>
        <dd>주차별 행사가맹점에서 페이백서비스로 결제하시고, 홈페이지를 통해 페이백 100% 적립받기를 등록하면 사용하신 포인트의 100% 재적립</dd>
    </dl>
    
    <h2>행사가맹점</h2>
    
    <ul>
        <li>첫째 주 - 5월1일(화) ~ 5월6일(일) 아웃백스테이크하우스, 도미노피자</li>
        <li>둘째 주 - 5월7일(월) ~ 5월13일(일) TGIF, 63시티</li>
        <li>셋째 주 - 5월14일(월) ~ 5월20일(일) 마르쉐, 롯데시네마</li>
        <li>넷째 주 - 5월 21일(월) ~ 5월27일(일) 불고기브라더스, 파파존스</li>
        <li>다섯째 주 - 5월28일(월) ~ 6월3일(일) 씨즐러, 온더보더</li>
    </ul>
    
    <h2>혜택예시(기존 30% 페이백서비스 가맹점일 경우)</h2>
    <p>예 - 30,000 포인트 보유 회원님이 행사기간 동안 10만원 결제 시</p>
    <p>식사금액 100,000중 30% 포인트 결제를 하시면 청구금액은 70,000원 됩니다. 사용하신 30,000포인트중 33.3% 포인트 재적립(기존 페이백 서비스)으로 9,900포인트, 66.7% 포인트 추가 재적립으로 20,010포인트 합하여 사용하신 
    30,000포인트가 100% 페이백(포인트 재적립)으로 다시 30,000포인트를 보유하게 되셨습니다.</p>
    <p>포인트 추가 재적립 - 2012년 6월 22일(금) 기존 페이백 서비스의 포인트 재적립은 포인트 사용하신 다음날 제공됩니다.</p>
    <p><a href="#none" onclick="go_start();return falfse;">페이백 100% 적립받기</a></p>

    <h2>포인트 사용하고 돌려받는 페이백서비스</h2>
    <p>이용금액의 최대 30%를 포인트로 결제하시면 사용하신 포인트의 33.3%를 돌려 드립니다.</p>
    <p><a href="#none" onclick="parent.goTabPage('NHPIMSSSBC001M016');">자세히보기</a></p>

    <h2>유의사항</h2>
    <ul>
        <li>- 이벤트 종료 시 기존 페이백서비스의 포인트 재적립률이 적용됩니다.</li>
        <li>- 법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
        <li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
    </ul>

</div>

</body>

</html>

