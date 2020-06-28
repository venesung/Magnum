<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 BIZ 퀴즈 이벤트 - 삼성카드</title>
<% 
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

input {width: 13px; height: 13px; margin: 0; padding: 0;}

/* 121011 수정 */
.event_quiz	.event_input_1	{
	position:absolute;
	z-index:2;
	left:119px;
	top:1372px;
}
.event_quiz	.event_input_2	{
	position:absolute;
	z-index:2;
	left:278px;
	top:1372px;
}
.event_quiz	.event_input_3	{
	position:absolute;
	z-index:2;
	left:437px;
	top:1372px;
}

.event_quiz	.event_input_4	{
	position:absolute;
	z-index:2;
	left:595px;
	top:1372px;
}
/* //121011 수정 */
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	var item = "";
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('33836'); 
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
				var frm = document.evtFrm;

				for(var j=0;j<frm.quiz01.length;j++) {
					if (frm.quiz01[j].checked == true) {
						item = j;
					}
				}
				if(item == "" || item != "3"){
					alert("정답을 선택하신 후 응모해 주세요.");
					return;
				}
				parent.submit_eventLog();
				document.evtFrm.target = "applyResultFrame";
				document.evtFrm.submit();
			<% } %>	
		<%
			}
		%>
	}

	function applyOk(){
		alert("응모 되셨습니다.");
		location.reload();
	}
	function applyDu(){
		alert("이미 응모하셨습니다.");
		location.reload();
	}
	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}


</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value="" />
<input type="hidden" name="eventNo" value="<%=eventNo%>" />

	<div class="event_quiz">
		<img src="/images/event/event_quiz.jpg" usemap="#quiz" alt="삼성카드 BIZ 퀴즈 이벤트" border="0" />
		
			<div class="hidden">
				<p>기분좋은 선물을 챙겨 드립니다.</p>
				<h1>삼성카드 BIZ 퀴즈 이벤트</h1>
				<p>개인사업에 힘을 실어 드리는 성공 파트너 삼성카드 BIZ에 관한 아래 퀴즈를 맞혀 보시고, 푸짐한 상품도 받아 가세요</p>
				
				<dl>
					<dt>행사기간</dt>
					<dd>2012년 10월 15일(월) ~ 2012년 11월 30일(금)</dd>
					<dt>응모대상</dt>
					<dd>삼성카드 전 회원님</dd>
					<dt>추첨대상</dt>
					<dd>퀴즈 응모 후 삼성카드 BIZ를 이용하신 고객님</dd>
					<dt>행사내용</dt>
					<dd>행사기간 내 아래 퀴즈의 정답을 맞히고, 삼성카드 BIZ를 이용하신 회원님 중 추첨을 통해 경품 증정(삼성카드 BIZ : BIZ1, 2, 3, 3+, 5, 7)</dd>
					<dt>당첨자 발표</dt>
					<dd>2012년 12월 14일(금) 삼성카드 홈페이지 이벤트 당첨자 발표란</dd>
					<dt>경품내용</dt>
					<dd>
						<ul>
							<li>1등(1명) - 50만원 삼성 Gift 카드</li>
							<li>2등(5명) - 10만원 삼성 Gift 카드</li>
							<li>3등(10명) - 30,000P 서비스 포인트</li>
							<li>4등(50명) - 5,000P 서비스 포인트</li>
						</ul>
					
					</dd>
				</dl>
				
				<p>부가세환급신고 편의지원서비스, 무이자 1개월 결제연장서비스, 사업비용절감 서비스 등 사업 운영에 꼭 필요한 맞춤 서비스와 혜택이 가득한 삼성카드 BIZ! 다음 중 삼성카드 BIZ가 아닌것은 무엇일까요? 
					정답을 아시는 분은 지금 바로 클릭하세요~
				</p>
				
				<ul>
					<li><label for="quiz01">삼성카드 BIZ1
					<p class="e_input event_input_1">
						<input type="radio"  name="quiz01" title="삼성카드 BIZ1" /></label>
					</p>
					</li>
					<li><label for="quiz01">삼성카드 BIZ3
						<p class="e_input event_input_2">
						<input type="radio"  name="quiz01" title="삼성카드 BIZ3" /></label>
						</p>
					</li>
					<li><label for="quiz01">삼성카드 BIZ7
						<p class="e_input event_input_3">
						<input type="radio"  name="quiz01" title="삼성카드 BIZ7" /></label>
					</p>
					</li>
					<li><label for="quiz01">삼성카드 BIZ9
							<p class="e_input event_input_4">
							<input type="radio"  name="quiz01" title="삼성카드 BIZ9" /></label>
						</p>
					</li>
				</ul>
                <p><a href="javascript:go_start();return false;" title="응모하기 바로가기">응모하기</a></p>
				
				<p>추천카드 ! 삼성카드 BIZ7 혜택 살펴보기
				<a href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1293');return false;" title="새창" target="_blank" >자세히 보기</a></p>
				<ul>
					<li>BIZ개인 사업지원 서비스 예 - 부가세환급신고 편의지원 서비스, 무이자 1개월 결제연장서비스, 5대 업종 5% 청구할인 서비스</li>
					<li>삼성카드 7의 가족을 위한 맞춤 혜택까지! - 0.5% ~ 3% 빅포인트 적립, 에버랜드 동반 소인 1인까지 50% 할인, CGV 온라인 예매 및 현장결제 3,000원 할인</li>
				</ul>
				
				<ul>
					<li>- 경품의 제세공과금은 당첨 회원님 본인부담입니다.</li>
					<li>- 경품 배송 및 서비스포인트 적립은 당첨자 발표 후 순차적으로 진행될 예정입니다.</li>
					<li>- 삼성Gift카드의 유효기간은 5년입니다.</li>
					<li>- 서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스포인트 및 빅포인트와 합산해 사용하실 수 있습니다.</li>
					<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용을 사전에 알려 드립니다. </li>
				</ul>
				
				
			
			</div>
		
		
		
			<map name="quiz" id="quiz">
			  <area shape="rect" coords="231,1605,316,1625" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1293');return false;" alt="자세히보기" target="_blank" title="새창" />
			  <area shape="rect" coords="298,1415,435,1453" href="javascript:go_start();" alt="응모하기" />
			</map>
			
	</div>
</form>

</body>
</html>

