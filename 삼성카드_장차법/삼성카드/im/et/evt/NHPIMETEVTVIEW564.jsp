<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW564.jsp
 * Author: 김경숙 차장
 * Created on 2013.01.15.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%
	String loginYN		= (String)request.getAttribute("loginYN");		// 로그인여부
	String eventYn		= (String)request.getAttribute("eventYn");		// 이벤트참여여부
	String eventNo		= (String)request.getAttribute("eventNo");		// 이벤트 No
	String snakeYearYn		= (String)request.getAttribute("snakeYearYn");		// 뱀띠여부
	String cmsSeq		= (String)request.getAttribute("cmsSeq");		// 뱀띠여부
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>더블 포인트 적립 이벤트 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>
<script type="text/javascript" language="javascript">

	// 응모하기버튼을 눌렀을 때 호출하는 함수 
	function  eventApply() {
		<%if(loginYN.equals("N")){%>
			parent.eventLogin("<%=cmsSeq%>");
		<%}else{%>
				if(parent.event_check()){
					<%if(eventYn.equals("Y")){%>
						alert("이미 응모하신 이벤트입니다.");
						return ;
					<%}%>
					<%if(snakeYearYn.equals("N")){%>
						alert("본 이벤트는 뱀띠 회원님만 참여 가능합니다.\n(89/77/65/53/41/29/17년생 - 주민등록번호 기준)");
						return ;
					<%}%>
					var parameter = "eventNo=<%=eventNo%>";
					callJson("picture", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "insertSnakeYearEvent", parameter, "snakeYearEventCallBack",null,null,true);
				}
		<%}%>
	}
	
	function snakeYearEventCallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			alert("참여해주셔서 감사합니다. 정상적으로 응모하셨습니다.");
			location.reload();
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
				parent.goList('<%=eventNo%>');
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
				parent.goList('001');
			}
		}
	}
</script>
</head>
<body>
<div class="">

	<img src="/images/et/event_130114.jpg" alt="더블 포인트 적립 이벤트" border="0" usemap="#Map" />
	<map name="Map" id="Map">
		<area shape="rect" coords="288,1181,441,1217" href="javascript:eventApply();" alt="응모하기" title="새창"/>
	</map>
	<div class="conts_hidden">
		<h2>뱀띠라서 행복한 이유! 더블 포인트 적립 이벤트</h2>
		<p>2013년 계사년, 뱀띠 회원님들 화이팅~ <strong>포인트 더블 적립으로, 삼성카드가 응원합니다!</strong></p>
		<dl>
			<dt>행사기간</dt>
			<dd>2013년 1월 21일(월) ~ 2월 28일(목)</dd>
			<dt>행사대상</dt>
			<dd>뱀띠 회원 (89/77/65/53/41/29/17년생-주민등록번호 기준) 중 행사기간 동안 일시불 및 할부 50만원 이상 이용하신 회원님</dd>
			<dt>행사내용</dt>
			<dd>이벤트에 응모하신 후 행사기간 동안 적립하신 보너스포인트/빅포인트에 대해 동일한 서비스포인트를 추가 적립해 드립니다.(최대 10,000포인트)<br />(예) 이벤트에 응모하신 회원님이 행사기간 동안 보너스포인트 10,000P를 적립하시면 행사 종료 후 서비스포인트 10,000P 추가 적립</dd>
			<dt>당첨자 발표</dt>
			<dd>2013년 3월 15일(금) 홈페이지 당첨자 발표란</dd>
			<dt>포인트 적립 및 경품 배송</dt>
			<dd>2013년 3월 22일(금)</dd>
		</dl>
		<h3>Bonus 혜택!</h3>
		<p><strong>6명의 뱀띠 회원님</strong>께 추첨을 통해 <strong>푸짐한 경품</strong>을 드립니다!</p>
		<table summary="6명의 뱀띠 회원님께 추첨을 통해 드리는 경품 정보입니다.">
			<caption>6명의 뱀띠 회원님께 추첨을 통해 드리는 경품</caption>
			<thead>
				<tr>
					<th scope="col">등수</th>
					<th scope="col">추첨 회원수</th>
					<th scope="col">경품내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><strong>1등</strong></th>
					<td>1명</td>
					<td><strong>삼성 기프트 카드 100만원</strong></td>
				</tr>
				<tr>
					<th scope="row"><strong>2등</strong></th>
					<td>2명</td>
					<td><strong>삼성 기프트 카드 50만원</strong></td>
				</tr>
				<tr>
					<th scope="row"><strong>3등</strong></th>
					<td>3명</td>
					<td><strong>삼성 기프트 카드 30만원</strong></td>
				</tr>
			</tbody>
		</table>
		<a href="javascript:eventApply();" title="새창">응모하기</a>
		<ul>
			<li>카드 이용 후 이벤트에응모하셔도 추첨대상이 되실 수 있습니다.</li><!-- SR내역 13.01.29 -->
			<li>보너스포인트/빅포인트에 한해 적용되며(세이브포인트, 서비스포인트 등 제외) 법인 / 올앳 / 선불 / 체크 / 기프트카드는 제외됩니다.</li>
			<li>카드사 및 제휴사의 사정으로 인해 변경 · 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
			<li><strong>5만원 초과 경품의 제세공과금(22%)은 당첨 회원님 본인 부담</strong>이며, 당첨자 발표 후 안내해 드리는 당사 계좌로 일주일 내에 미입금 시 당첨이 취소됩니다.</li>
		</ul>
	</div>


</div>
</body>
</html>