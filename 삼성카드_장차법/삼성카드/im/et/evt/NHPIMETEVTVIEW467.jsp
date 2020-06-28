<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 혜택의 재발견 에피소드3 더블혜택 Quiz Event! - 삼성카드</title>
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
#lay_1,#lay_2{ display:none;position:absolute; z-index:2; left:30px; top:1020px; width:661px; height:316px;}
input.radio_type {width:13px; height:13px; vertical-align:top;}
#wrap {position:relative; z-index:1; width: 728px;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}


/*선택하기 라디오 버튼 */
#wrap .event_input_1{
	position:absolute;
	left:135px;
	top:1028px;
}
#wrap .event_input_2{
	position:absolute;
	left:298px;
	top:1028px;
}
#wrap .event_input_3{
	position:absolute;
	left:531px;
	top:1028px;
}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('24352');
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
		//document.evtFrm.target = "applyResultFrame";
		//document.evtFrm.submit();
		var frm = document.evtFrm;
		var gubun = "";
		
		for(var j=0;j<frm.quiz.length; j++) {
			if (frm.quiz[j].checked == true) {
				gubun = frm.quiz[j].value;
			}
		}

		if(gubun == ""){
			alert("정답을 선택하신 후 응모해 주세요.");
		}
		else{
			frm.gubun.value = gubun;
			if (gubun == "1") {
				window.open('','pop201203','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');
			} else if (gubun == "2") {
				window.open('','pop201203','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');
			} else if (gubun == "3") {
				window.open('','pop201203','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');
			}
			
			frm.target = 'pop201203';
			frm.action = '/hp/im/et/evt002.do?method=getQuiz201203pop';
			frm.submit();
		}		
	}


	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
	function pop201107() {
		window.open('/html/event/jeju/popup_cheju_zone.html','pop201107','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function pop20110726() {
		window.open('/html/event/jeju/popup_cheju_zone_20110726.html','pop20110726','menubar=0,resizable=0,scrollbars=0,width=710,height=590,left=0,top=0');
	}
</script>


</head>

<body>
<form id="evtFrm" name="evtFrm" method="post"  action="">
<input type="hidden" name="gubun" value=""/>

<div id="wrap">
	<img src="/images/et/quiz201203/120227_episode.jpg" alt="삼성카드 혜택의 재발견 에피소드3 더블혜택 Quiz Event!" border="0" usemap="#episode" />
	
	<div class="hidden">
		<h1>더블혜택 Quiz Event!</h1>
		<p>회원님의 다양한 LIFE Style을 만족시켜주는 삼성카드의 풍성한 혜택을 확인해 보세요 추첨을 통해 총 100분께 푸짐한 경품이 쏟아집니다.</p>
		
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 3월 6일 (화) ~ 3월 31일(토)</dd>
			<dt>당첨자발표</dt>
			<dd>2012년 4월 9일 (월) 홈페이지에 공지</dd>
		</dl>
		
		<p>외식 헤택이 가득한 삼성카드의 페이백 서비스!</p>
		<p>페이백 가맹점에서는 최대 30%를 포인트로 결제하고, 이용한 포인트는 33.3%~50%까지 재적립됩니다.</p>
		<p>tip! 매주 수요일은 삼성카드 40% 페이백 Day! 최대 40% 포인트 결제가능, 사용한 포인트의 50%는 재적립!</p>
		
		<h2>삼성카드 혜택의 재발견 에피소드3 quiz</h2>
		<p>다음중 매주 수요일 40% 페이백 서비스를 받을 수 있는 가맹점은 어디일까요?</p>
		<p>정답을 아시는 분은 지금 바로 클릭하세요</p>
		<p><a href="https://www.samsungcard.com/index.do?menuId=NHPIMSSSBC001M017" target="_blank" title="페이백 대표 가맹점 자세히 보기 새창">페이백 대표 가맹점 자세히 보기</a></p>
		
		<ul>
			<li>파파존스<p class="e_input event_input_1">
				 <label><input type="radio" name="quiz" id="one_1" value="1" class="radio_type" title="파파존스" /></label></p>
			 </li>
			 <li>아웃백 스테이크 하우스<p class="e_input event_input_2">
				<label><input type="radio" name="quiz" id="one_2" value="2" class="radio_type" title="아웃백 스테이크하우스" /></label></p>
			</li>
			<li>베니건스<p class="e_input event_input_3">
			<label><input type="radio" name="quiz" id="one_3" value="3" class="radio_type" title="베니건스" /></label></p>
			</li>
		</ul>
		
		<p>경품내역</p>
		
		<table summary="경품내역을 나타내는 표 - Gift, 추첨방법이 있습니다.">
			<caption>경품내역</caption>
			<colgroup>
				<col width="50%" />
				<col width="50%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">GIFT</th>
					<th scope="col">추첨방법</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1등(1명) - 100만원 삼성기프트 카드</td>
					<td rowspan="3">퀴즈에 응모하고 정답을 맞춘 회원 중 추첨</td>
				</tr>
				<tr>
					<td>2등(2명) - 30만원 삼성 기프트카드</td>
				</tr>
				<tr>
					<td>3등(87명) - 10,000P 서비스 포인트</td>
				</tr>
				<tr>
					<td>특별상(10명) - 외식비 지원 50,000P 서비스 포인트</td>
					<td>퀴즈에 응모 후 행사기간 내 페이백 서비스를 이용한 회원 중 추첨</td>
				</tr>
			</tbody>
		</table>
		
		<ul>
			<li>- 5만원을 초과한 1등 2등 경품의 제세공과금(22%)은 당첨자 부담이며 경품배송 시작 및 서비스포인트 적립 예정일은 4월 10일 입니다.</li>
			<li>- 서비스 포인트의 유효기간은 1년이며, 보너스 포인트와합산하여 이용하실 수 있습니다.</li>
			<li>- 카드사 또는 제휴사의 사정으로 변경 중단 될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
		</ul>
		
	</div>
	
	
		<map name="episode" id="episode">
			<area shape="rect" coords="425,861,592,874" href="https://www.samsungcard.com/index.do?menuId=NHPIMSSSBC001M017" target="_blank" title="새창" alt="페이백 대표 가맹점 자세히 보기" />
			<area shape="rect" coords="296,1071,433,1110" href="#" alt="응모하기" onclick="go_start();return false;" />
		</map>

		<!-- 선택하기 라디오 버튼 -->
		<p class="e_input event_input_1">
			 <input type="radio" name="quiz" id="one_1" value="1" class="radio_type" title="파파존스" /></p>
		<p class="e_input event_input_2">
			<input type="radio" name="quiz" id="one_2" value="2" class="radio_type" title="아웃백 스테이크하우스" /></p>
		<p class="e_input event_input_3">
			<input type="radio" name="quiz" id="one_3" value="3" class="radio_type" title="베니건스" /></p>
		<!-- //선택하기 라디오 버튼 -->
</div>

</form>
</body>

</html>

