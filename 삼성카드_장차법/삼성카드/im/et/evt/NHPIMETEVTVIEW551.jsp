<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW551.jsp
 * Author: 모정서 과장
 * Created on 2012.11.06.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%
	String loginYN		= (String)request.getAttribute("loginYN");		// 로그인여부
	String event_ok		= (String)request.getAttribute("eventYN");		// 이벤트참여여부
	String beginDateYN	= (String)request.getAttribute("beginDateYN");	// 이벤트 응모가능기간여부
	String endDateYN	= (String)request.getAttribute("endDateYN");	// 이벤트 응모가능기간여부
	String beginMsg		= (String)request.getAttribute("beginMsg");		// 이벤트 응모가능기간여부
	String endMsg		= (String)request.getAttribute("endMsg");		// 이벤트 응모가능기간여부

	String cmsSeq		= (String)request.getAttribute("eventEtc1");	// ITCMEVENTTT.CMS_SEQ
	String eventNo		= (String)request.getAttribute("eventNo");		// 이벤트 No
	String beginDate	= (String)request.getAttribute("beginDate");	// 이벤트 시작일
	String endDate		= (String)request.getAttribute("endDate");		// 이벤트 종료일

	String wordEvtMemYn	= (String)request.getAttribute("wordEvtMemYn");	// 이벤트 참가가능여부(02,07 정회원)
	String errorYn		= (String)request.getAttribute("errorYn");		// 에러여부체크

	String scriptStr	= "";
	String onloadStr	= "";

	// 에러여부 체크
	if(errorYn.equals("Y")){
		onloadStr = "alert('지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.'); parent.goList('001');";
	}
	else{
		// 로그인 체크
		if(loginYN.equals("N")){
			scriptStr = "parent.eventLogin('"+cmsSeq+"');";
		}
		else{
			// 이베트 종료 체크
			if( endDateYN.equals("N")){
				scriptStr = "alert('"+endMsg+"');";
			}
			else{
				// 이베트 시작 체크
				if( beginDateYN.equals("N")){
					scriptStr = "alert('"+beginMsg+"');";
				}
				else{
					// 이벤트 참가여부 체크
					if(event_ok.equals("Y")){
						scriptStr = "alert('이미 이벤트에 응모하셨습니다.');";
					}
					else{
						// 이벤트 대상자 체크
						if(wordEvtMemYn.equals("Y")){
							scriptStr = "return 'Y';";
						}
						else{
							scriptStr = "alert('죄송합니다. 개인신용카드회원만 응모가 가능한 이벤트 입니다.');";
						}
					}
				}
			}
		}
	}

	String isLogin		= "0";
	String startStep	= "";
	if("Y".equals(loginYN)){
		isLogin = "1";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드공통서비스 S 혜택찾기 퀴즈 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
#flashContent { width:100%; height:100%; }
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>
<script type="text/javascript" language="javascript">

	function eventChk(){
		<%=onloadStr%>
	}

	// START 버튼 클릭시 발생
	function availableEvent () {
		<%=scriptStr%>
	}
	// 응모하기버튼을 눌렀을 때 호출하는 함수 
	function enter () {
		picture201211();
	}
	// 자세히보기 버튼을 눌렀을 때 호출하는 함수로 리턴되는 url을 새창으로 띄움
	function getDetail () {
		return 'https://www.samsungcard.com/index.do?menuId=NHPIMCD09'
	}


	// 이벤트 응모
	function picture201211(){
		var parameter = "eventNo=<%=eventNo%>&cmsSeq=<%=cmsSeq%>";
		callJson("picture", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "insertWord201211", parameter, "picture201211CallBack",null,null,true);
	}

	function picture201211CallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			alert("이벤트에 참여해 주셔서 감사합니다.");
			location.reload();
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
			}
			else if(resultCnt == "E"){
				alert("죄송합니다. 개인신용카드회원만 응모가 가능한 이벤트 입니다.");
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
				parent.goList('001');
			}
		}
	}
</script>
</head>
<body onload="eventChk();">
<div class="">
	

<img src="/images/et/word201211/event_word.jpg" usemap="#chestnut" alt="삼성카드 혜택의 재발견7" border="0"/>
<map name="chestnut" id="chestnut">
  <area shape="rect" coords="468,426,661,448" href="https://www.samsungcard.com/index.do?menuId=NHPIMCD09" target="_blank" alt="삼성카드공통서비스S 자세히보기" />
</map>
 <div class="hidden">
	<h1>삼성카드공통서비스 S 혜택찾기 퀴즈</h1>
	
	<strong>퀴즈설명</strong>
	<ol>
		<li>아래 퀴즈창의 START 버튼을 눌러 주세요.</li>
		<li>힌트를 참고 하시고 아래 보기에 있는 낱말들 중에서 정답이라고 생각되는 낱말을 드래그하여 해당 낱말판에 옮겨 주세요. - 힌트는 퀴즈창 하단 또는 퀴즈창 해당 문제번호에 마우스 오버하시면 확인 가능합니다.</li>
		<li>정답일 경우 자동으로 낱말이 완성됩니다.</li>
		<li>정답을 모두 맞히신 후 응모하기 버튼을 눌러 주시면, 이벤트 응모가 완료됩니다.</li>
	</ol>
	
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 11월 12일(월) ~ 12월 7일(금)</dd>
		<dt>당첨자발표</dt>
		<dd>2012년 12월 17일(월) 홈페이지 당첨자 발표란</dd>
		<dt>경품안내</dt>
		<dd>1등(1명) 50만원 삼성 Gift 카드, 2등(2명) 30만원 삼성 Gift 카드, 3등(87명) 10,000 서비스포인트 - 추첨대상 퀴즈 정답을 맞히신 회원</dd>
		<dd>특별상(10명) 20,000 서비스포인트 - 추첨대상 퀴즈 정답을 맞히고 행사기간 동안 삼성카드공콩서비스 S를 이용하신 회원</dd>
		<dt>경품발송 및 포인트적립일</dt>
		<dd>2012년 12월 21일(금)</dd>
	</dl>
	
	<ul>
		<li>1&middot;2등 경품의 제세공과금(22%)은 당첨 회원님 본인 부담입니다.</li>
		<li>서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스포인트 및 빅포인트와 합산해 사용하실 수 있습니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>



<div id="flashContent" style="position:absolute; top:677px; left:0px;">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="728" height="600" id="main" align="middle">
				<param name="movie" value="/images/et/word201211/main.swf" />
				<param name="wmode" value="transparent" />
				<param name="allowScriptAccess" value="always" />
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="/images/et/word201211/main.swf" width="728" height="600">
					<param name="movie" value="/images/et/word201211/main.swf" />
					<param name="wmode" value="transparent" />
					<param name="allowScriptAccess" value="always" />
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflash">
						<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
					</a>
				<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>


</div>
</body>
</html>