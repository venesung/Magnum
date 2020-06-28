<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW518.jsp
 * Author: 모정서 과장
 * Created on 2012. 6. 25.
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
<title>틀린 그림 찾기 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>
<script src="/images/et/archery2012/embedswf.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>
<script language="javascript" type="text/javascript">
	function make_flash(url, id, width, height, wmode, flashvars, allowfullscreen)
	{
		var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
		var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
		var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;
		var isFF = (navigator.userAgent.indexOf("Firefox") != -1) ? true : false;

		var str="";
		for(prop in flashvars )
		{
			var arg = flashvars[prop];
			str=str+"&"+prop+"="+arg;
		}

	   if(isIE && isWin && !isOpera)
	   {
			var obj = '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="' + width +'" height="' + height +'" id="' + id +'" align="middle">';
			obj += '<param name="allowScriptAccess" value="always" />';
			obj += '<param name="quality" value="high" />';
			obj += '<param name="src" value="' + url + '" />';
			obj += '<param name="wmode" value="' + wmode + '" />';
			obj += '<param name="flashvars" value="' + str + '" />';
			obj += '<param name="allowFullScreen" value="' + allowfullscreen + '" />';
			obj += '</object>';
	   } else
	   {
			obj = '<embed src="' + url + '" quality="high"  width="' + width +'" height="' + height +'" name="' + id +'" flashvars="'+str+'" align="middle" allowScriptAccess="always" allowFullScreen="' + allowfullscreen + '" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" wmode="' + wmode + '">';
	   }

	   document.getElementById("bannerDiv").innerHTML = obj;
	}

	function makePage (step){
		// 최초 플래시에 넘겨주는값 ( 로그인 여부, 활성표시될 card값
		var flashvars = {
		isLogin: <%=isLogin%>,	// 0: 비로그인  1: 로그인
		currentStep:step	//  카드1: "card1"  ~ 카트7:"card7"
		};

		make_flash("/images/et/picture201211/hiddenCatch.swf","hiddenCatch","728", "513","transparent",flashvars,"false");
	}

	// 로그인 레이어
	function loginCheck(){
		parent.eventLogin('<%=cmsSeq%>');
	};

	// 참여가능 여부
	function isJoin(step){ // step:String - 몸풀기1 : "ex1" , 몸풀기2: "ex2", 카드1: "card1"  ~ 카트7:"card7"
		var gameYn = document.form1.GAME_YN.value;
		if(gameYn == "Y" && step == document.form1.MISS_STEP.value){
			return 1;		// return 0 : 참여 불가, 1 :참여가능
		}
		else{
			return 0;
		}
	};

	//카드혜택보기
	function cardBene(cardName){ // 카드1: "card1"  ~ 카트7:"card7"
		window.open('/showroom/shw.do?method=getDetail&prodCode=P1266&category=A','_blank','');
				
	};

	//m포켓 자세히보기
	function mPocket(){
		window.open('/index.do?menuId=NHPIMMPK001','_blank','');
	}

	// 정답갯수
	var arrPictureStep = [ 7, 7, 1, 2, 3, 4, 5, 6, 7];
	// X좌표
	var arrPictureStepX = [
	            	[31,29,19,116,257,295,308],
	            	[101,140,25,138,33,220,310],
	            	[40],
	            	[93,174],
	            	[150,72,85],
	            	[30,93,50,221],
	            	[112,91,121,175,226],
	            	[190,91,246,310,136, 300],
	            	[28,30,58,204,197,316,307]
	               ];
	// Y좌표
	var arrPictureStepY = [
	            	[23,186,247,207,226,65,216],
	            	[23,107,167,153,265,220,100],
	            	[23],
	            	[23,170],
	            	[23,66,223],
	            	[23,75,189,186],
	            	[23,159,171,179,233],
	            	[23,79,68,77,238,237],
	            	[23,86,202,153,217,149,191]
		           ];
	var arrPictureFlag = [
	           		[false,false,false,false,false,false,false],
	           		[false,false,false,false,false,false,false],
	           		[false],
	           		[false,false],
	           		[false,false,false],
	           		[false,false,false,false],
	           		[false,false,false,false,false],
	           		[false,false,false,false,false,false],
	           		[false,false,false,false,false,false,false]
		          ];

	function isAnswer(obj) { // obj ={x: Number, y: Number}  - 이미지클리시 마우스 위치값(326x279) ]

		var arrSeq = 0;
		var currPoint = 0;
		var missStep = "";

		missStep = document.form1.MISS_STEP.value;
		currPoint = document.form1.CURR_POINT.value;

		if(missStep=="ex1"){
			currPoint = parseInt(currPoint)+500;
			arrSeq = 0;
		}
		else if(missStep=="ex2"){
			currPoint = parseInt(currPoint)+500;
			arrSeq = 1;
		}
		else if(missStep=="card1"){
			currPoint = parseInt(currPoint)+1000;
			arrSeq = 2;
		}
		else if(missStep=="card2"){
			currPoint = parseInt(currPoint)+1500;
			arrSeq = 3;
		}
		else if(missStep=="card3"){
			currPoint = parseInt(currPoint)+2000;
			arrSeq = 4;
		}
		else if(missStep=="card4"){
			currPoint = parseInt(currPoint)+2500;
			arrSeq = 5;
		}
		else if(missStep=="card5"){
			currPoint = parseInt(currPoint)+3000;
			arrSeq = 6;
		}
		else if(missStep=="card6"){
			currPoint = parseInt(currPoint)+5000;
			arrSeq = 7;
		}
		else if(missStep=="card7"){
			currPoint = parseInt(currPoint)+10000;
			arrSeq = 8;
		}


		var answerFlag = false;
		var chkSeq=0;
		for(var i=0; i<arrPictureStep[arrSeq]; i++){
			var x1 = arrPictureStepX[arrSeq][i]-15;
			var x2 = arrPictureStepX[arrSeq][i]+15;
			var y1 = arrPictureStepY[arrSeq][i]-15;
			var y2 = arrPictureStepY[arrSeq][i]+15;

			if(obj.x > x1 && obj.x < x2 && obj.y > y1 && obj.y < y2) {
				answerFlag = true;
				arrPictureFlag[arrSeq][i] = true;
				chkSeq = i;
				break;
			}
			else {
				answerFlag = false;
			}
		}

		var chkFlag = true;
		if(answerFlag == true){
			for(var i=0; i<arrPictureStep[arrSeq]; i++){
				if(arrPictureFlag[arrSeq][i]==false){
					chkFlag = false;
					break;
				}
			}

			if(chkFlag) {
				// 정답 위치 이면서 모든 정답을 맞추었을때
				updatePitcure201211();
				return {answer: 1, answerX: arrPictureStepX[arrSeq][chkSeq], answerY:arrPictureStepY[arrSeq][chkSeq], complete:1, point:currPoint};
			}
			else {
				// 정답 위치을 맞추었을때
				return {answer: 1, answerX: arrPictureStepX[arrSeq][chkSeq], answerY:arrPictureStepY[arrSeq][chkSeq], complete:0};
			}
		}
		else{
			//오답일때
			return {answer: 0}

		}
	};

	// 그만하기 클릭시 step1 화면을 위한 카드위치값
	function getStep(){
		arrPictureFlag = [
		  	           		[false,false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false],
		  	           		[false],
		  	           		[false,false],
		  	           		[false,false,false],
		  	           		[false,false,false,false],
		  	           		[false,false,false,false,false],
		  	           		[false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false]
		  		          ];
		var step = document.form1.MISS_STEP.value;
		return step;// 카드1: "card1"  ~ 카트7:"card7"
	};

	// 계속하기 클릭시 다음게임 값
	function nextGame(){
		arrPictureFlag = [
		  	           		[false,false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false],
		  	           		[false],
		  	           		[false,false],
		  	           		[false,false,false],
		  	           		[false,false,false,false],
		  	           		[false,false,false,false,false],
		  	           		[false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false]
		  		          ];
		var step = document.form1.MISS_STEP.value;
		return step;// 카드1: "card1"  ~ 카트7:"card7"
	};

	// 다시하기 클릭시 게임 값
	function rePlay(){
		arrPictureFlag = [
		  	           		[false,false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false],
		  	           		[false],
		  	           		[false,false],
		  	           		[false,false,false],
		  	           		[false,false,false,false],
		  	           		[false,false,false,false,false],
		  	           		[false,false,false,false,false,false],
		  	           		[false,false,false,false,false,false,false]
		  		          ];
		var step = document.form1.MISS_STEP.value;
		return step;// 카드1: "card1"  ~ 카트7:"card7"
	};

	// 계속하기 버튼 진행 여부
	function isNextGame(){
		var nextYn = document.form1.NEXT_YN.value;
		if(nextYn == "Y"){
			return true;	// 진행불가 :false , 진행가능 : true
		}
		else{
			return false;	// 진행불가 :false , 진행가능 : true
		}
	};

	// 경품수령
	function getGiveaway(){
		updatePoint();
	}

	function sendGiveaway(value){//( 1: 1,000, 2: 100,000, 3: 1,000,000
		thisMovie("hiddenCatch").sendGiveaway(value);
	}

	// 플래시 영역 selector
	function thisMovie(movieName){   // movieName  : 플래시 object id값
		if(navigator.appName.indexOf("Microsoft") != -1){
			return window[movieName];
		}
		else {
			return document[movieName];
		}
	}

	// 경품수령
	function updatePoint(){
<% if(loginYN.equals("Y")){ %>
		var parameter = "eventNo=<%=eventNo%>&cmsSeq=<%=cmsSeq%>";
		callJson("count", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "updatePicture201211Bonus", parameter, "bonusCallBack",null,null,true);
<% } %>
	};

	// 경품수령 callBack
	function bonusCallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1 || resultCnt==2 || resultCnt==3){
			//return resultCnt; //( 1: 1,000, 2: 100,000, 3: 1,000,000
			sendGiveaway(resultCnt);
			getMyStep();
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
			}
		}
	}

	// 경품 수령 후 확인버튼 클릭시
	function completeGame(){
		return "completeGame"; //(completeGame 값으로 step1 화면 모두 완료표시)
	};

	// 나의 단계
	function getMyStep(){
<% if(loginYN.equals("Y")){ %>
		var parameter = "eventNo=<%=eventNo%>&cmsSeq=<%=cmsSeq%>&approveDateF=<%=beginDate%>&approveDateT=<%=endDate%>";
		callJson("myScore", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "getPicture201211MyStep", parameter, "myScoreCallBack",null,null,true);
<% }else{ %>
		var flashvars = {
			isLogin: 0,	// 0: 비로그인  1: 로그인
			currentStep:"card0"	//  카드1: "card1"  ~ 카트7:"card7"
		};
		make_flash("/images/et/picture201211/hiddenCatch.swf","hiddenCatch","728", "513","transparent",flashvars,"false");
<% } %>
	}

	var isFirst = true;
	function myScoreCallBack(callId, data){
		var maxStepNum	= ""; // 가능단계표시
		var missStepNum	= ""; // 현재단계표시

		var maxStep		= data.maxStep;		// 가능단계
		var compStep	= data.compStep;	// 완료단계
		var currPoint	= data.currPoint;	// 획득포인트
		var bonusPoint	= data.bonusPoint;	// 보너스포인트
		var point		= 0;

		var missStep= "";				// 현재(미션)단계
		var gameYn	= "N";				// 참여가능여부 - isJoin(step)
		var nextYn	= "N";				// 계속하기 버튼 진행 여부 - isNextGame()

		var resultCnt = data.resultCnt; // 시스템체크
		if(resultCnt == "E"){
			alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
		}
		else if(resultCnt == "N"){
			alert("이벤트 대상자가 아닙니다.");
		}
		else{
			point = parseInt(currPoint)+parseInt(bonusPoint);
			point = point + "";
			// 가능단계
			if(maxStep=="0"){
				maxStepNum = "연습";
			}
			else{
				maxStepNum = maxStep;
			}
			// 현재단계
			if(compStep=="-2"){
				missStepNum = "연습";
				missStep	= "ex1";
			}
			else if(compStep=="-1"){
				missStepNum = "연습";
				missStep	= "ex2";
			}
			else if(compStep=="0"){
				missStepNum = "1";
				missStep	= "card"+missStepNum;
			}
			else if(compStep=="7"){
				missStepNum = "완료";
				missStep	= "product";
			}
			else if(compStep=="8"){
				missStepNum = "완료";
				missStep	= "completeGame";
			}
			else{
				missStepNum = parseInt(compStep)+1;
				missStep	= "card"+missStepNum;
			}

			document.getElementById("myScore").innerHTML  ="<p style='position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 272px; text-align:left; width:61px;'>"+maxStepNum+"단계</p>";
			document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 405px; text-align:left; width:61px;'>"+missStepNum+"단계</p>";
			document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 546px; text-align:left; width:128px;'>"+addComma(point)+" 포인트</p>";

			document.form1.MAX_STEP_TEXT.value = maxStepNum;
			document.form1.MISS_STEP_TEXT.value = missStepNum;

			if(parseInt(maxStep) > parseInt(compStep)){
				nextYn = "Y";
				gameYn = "Y";
			}

			document.form1.MAX_STEP.value	= maxStep;	// 가능단계
			document.form1.COMP_STEP.value	= compStep;	// 완료단계
			document.form1.CURR_POINT.value	= currPoint;	// 획득포인트
			document.form1.GAME_YN.value	= gameYn;	// 참여가능여부
			document.form1.NEXT_YN.value	= nextYn;	// 계속하기 버튼 진행 여부
			document.form1.MISS_STEP.value	= missStep;	// 현재단계
			document.form1.BONUS_POINT.value= bonusPoint;	// 보너스포인트
		}
		if(isFirst){
			makePage(missStep);
		}
		isFirst = false;
	}

	// 미션 성공
	function updatePitcure201211(){
		var compStep = document.form1.COMP_STEP.value;
		var parameter = "eventNo=<%=eventNo%>&cmsSeq=<%=cmsSeq%>&compStep="+compStep;
		callJson("picture", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "updatePicture201211", parameter, "pictureCallBack",null,null,true);
	}
	// 미션 성공 callBack
	function pictureCallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			getMyStep();
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
			}
		}
	}

	// 콤마추가
	function addComma(val){
		var num = val;
	
		if(num.length <= 3) return num;
	
		var loop = Math.ceil(num.length / 3);
		var offset = num.length % 3;
		if(offset == 0) offset = 3;
		var str = num.substring(0, offset);
	
		for(i=1; i<loop; i++) {
			str += "," + num.substring(offset, offset + 3);
			offset += 3;
		}
		
		return str;
	}
</script>
</head>
<body onload="getMyStep();">
<img src="/images/et/picture201211/event_picture.jpg" alt="참 실용적인 삼성카드 이벤트 숫자카드 속에 숨은, 틀린 그림을 찾아라!" border="0" usemap="#Map"  />
<map name="Map" id="Map"><area shape="rect" coords="556,1216,683,1238" href="/showroom/shw.do?method=getNumber&SITE=homeshowroom" target="_blank" title="새창" alt="숫자카드 자세히보기" /></map>

<div id="bannerDiv" style="position:absolute;top:595px; left:0;">
</div>
<div id="myScore">
<p style="position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 272px; text-align:left; width:61px;">XX단계</p>
<p style="position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 405px; text-align:left; width:61px;">XX단계</p>
<p style="position: absolute; color: #c96a19; top: 1118px; font-weight: bold; left: 546px; text-align:left; width:128px;">XXXXX 포인트</p>
</div>

<form name="form1" action="">
<input type="hidden" name="MAX_STEP"		value="" />
<input type="hidden" name="COMP_STEP"		value="" />
<input type="hidden" name="MISS_STEP"		value="" />
<input type="hidden" name="NEXT_YN"		value="" />
<input type="hidden" name="GAME_YN"		value="" />
<input type="hidden" name="CURR_POINT"		value="" />
<input type="hidden" name="BONUS_POINT"	value="" />
<input type="hidden" name="CURR_POINT_NUM"	value="" />

<input type="hidden" name="MAX_STEP_TEXT"	value="" />
<input type="hidden" name="MISS_STEP_TEXT"	value="" />

</form>

</body>
</html>