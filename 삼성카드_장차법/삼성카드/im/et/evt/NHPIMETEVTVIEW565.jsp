<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>할부 이용금액 캐시백 이벤트! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
	String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
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
			parent.eventLogin('<%=cmsSeq%>');
		<%
			}else{
		%>
			if(parent.event_check()){
				<%if(event_ok.equals("Y")){%>
					alert("이미 응모하신 이벤트 입니다.");
				<%}else{ %>
					applyEvent();
				<% } %>		
			}
		<%
			}
		%>
	}

	function applyEvent() {
		
		<%if( chkUserGubun.equals("N")){ %>
			alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
			return;
		<%}%>
		parent.submit_eventLog();
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();

	}

	function applyOk(){
		alert("참여해주셔서 감사합니다. 정상적으로 응모하셨습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

</script>

</head>
<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<img src="/images/et/event_130115.jpg" alt="할부 이용금액 캐시백 이벤트!" border="0" usemap="#Map" />
<map name="Map" id="Map">
	<area shape="rect" coords="288,1137,442,1176" href="javascript:go_start();"  alt="응모하기" />
	<area shape="rect" coords="421,1250,546,1271" target="_blank" href="https://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001" title="새창"  alt="휴대폰번호 확인하기" />
	<area shape="rect" coords="66,1823,150,1845" target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1266" title="새창"  alt="삼성카드1 자세히보기" />
	<area shape="rect" coords="186,1822,270,1844" target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1229" title="새창"  alt="삼성카드3 자세히보기" />
	<area shape="rect" coords="307,1822,391,1844" target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1248" title="새창"  alt="삼성카드4 자세히보기" />
	<area shape="rect" coords="429,1821,513,1843" target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1257" title="새창"  alt="삼성카드5 자세히보기" />
	<area shape="rect" coords="552,1823,636,1845" target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1268" title="새창"  alt="삼성카드7 자세히보기" />
	<area shape="rect" coords="553,1881,637,1903" target="_blank" href="https://samsungcard.com/index.do?menuId=NHPIMMHPMS001M003" title="새창"  alt="프리미엄 자세히보기" />
</map>
<div class="hidden">
	<dl>
    	<dt>연휴 뒤에도 참 실용적인, 설 마무리 혜택~ 할부 이용금액 캐시백 이벤트!</dt>
        <dd>지출 많은 설 연휴 뒤엔, 할부 이용으로 부담을 나눠 보세요! 새해 더 알뜰한 생활하시라고, 삼성카드가 캐시백 및 포인트 혜택을 챙겨 드립니다! 혜택 꼭 받으시고, 새해 복도 더 많이 받으세요!</dd>
        <dd>
        	<dl>
            	<dt>응모기간</dt>
                <dd>2013년 2월 1일(금) ~ 2월 28일(목)</dd>
                <dt>행사기간</dt>
                <dd>2013년 2월 12일(화) ~ 2월 28일(목)</dd>
                <dt>행사내용</dt>
                <dd>이벤트 응모 후 행사기간 동안 삼성카드로 할부(유이자/무이자) 결제하신 회원님 중 추첨을 통해 캐시백 및 서비스포인트 적립 혜택 제공(법친/체크/선불/올앳/기프트카드는 제외됨)<p>- 카드 이용 후 이벤트에 응모하셔도 추첨 대상이 되실 수 있습니다.</p></dd>
                <dt>결품내용</dt>
                <dd>1등(1명) : 할부 이용금액 100% 캐시백(최대 100만원 제공)</dd>
                <dd>2등(2명) : 할부 이용금액 50% 캐시백(최대 50만원 제공)</dd>
                <dd>3등(10명) : 할부 이용금액 20% 캐시백(최대 10만원 제공)</dd>
                <dd>4등(50명) : 10,000 서비스포인트</dd>
                <dt>당첨자발표</dt>
                <dd>2013년 3월 15일(금) 홈페이지 이벤트 담첨자발표란 공지 및 개별 안내</dd>
                <dt>포인트제공</dt>
                <dd>2013년 3월 22일(금)</dd>
            </dl>
        </dd>
        <dd><a href="javascript:go_start();">응모하기</a></dd>
        <dd>
        	<strong>무이자할부, 삼성카드로 실속있게 이용하기!</strong>
            <dl>
            	<dt>당신에게 참 실용적인 무이자할부 혜택을 담은 숫자카드!</dt>
                <dd>삼성카드 1 : 모든 가맹점 2~4개월 무이자할부 <a target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1266" title="새창">자세히 보기</a></dd>
                <dd>삼성카드 3 : 백화점&middot;할인점 2~3개월 무이자할부 <a target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1229" title="새창">자세히 보기</a></dd>
                <dd>삼성카드 4 : 모든 가맹점 2~3개월 무이자할부 <a target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1248" title="새창">자세히 보기</a></dd>
                <dd>삼성카드 5 : 쇼핑&middot;교육 업종 2~3개월 무이자할부 - 2013.12.31까지 모든 가맹점 가능 <a target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1257" title="새창">자세히 보기</a></dd>
                <dd>삼성카드 7 : 모든 가맹점 주말 2~3개월 삼성 7대 관계사 3개월 무이자할부 <a target="_blank" href="https://www.samsungcard.com/link/index.jsp?url=CARD?kindCode=P1268" title="새창">자세히 보기</a></dd>
                <dd>프리미엄 회원이시라면! 홈페이지&gt;프리미엄라운지에서 2~4개월 무이자할부 신청(연간 신청횟수 제한 없음) <a target="_blank" href="https://samsungcard.com/index.do?menuId=NHPIMMHPMS001M003" title="새창">자세히 보기</a></dd>
            </dl>
        </dd>
        <dd>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</dd>
    </dl>
</div>


</body>
</html>  