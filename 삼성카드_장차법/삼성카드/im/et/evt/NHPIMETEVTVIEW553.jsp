<%
/*
 * Project Name: 삼성 가족 나눔 캠페인 컬투쇼/뮤지컬 초대 이벤트
 * File Name: NHPIMETEVTVIEW553.jsp
 * Author: 삼양데이타시스템 모정서
 * Created on 2012. 11. 15.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header2.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@ page import="com.scard.common.util.StringUtil"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.io.*" %>
<%
	String loginYN		= (String)request.getAttribute("loginYN");		// 로그인여부
	String event_ok		= (String)request.getAttribute("eventYN");		// 이벤트참여여부
	String beginDateYN	= (String)request.getAttribute("beginDateYN");	// 이벤트 응모가능기간여부
	String endDateYN	= (String)request.getAttribute("endDateYN");	// 이벤트 응모가능기간여부
	String beginMsg		= (String)request.getAttribute("beginMsg");		// 이벤트 시작 알림 메시지
	String endMsg		= (String)request.getAttribute("endMsg");		// 이벤트 종료 알림 메시지

	String eventNo		= (String)request.getAttribute("eventNo");		// 이벤트 No
	String beginDate	= (String)request.getAttribute("beginDate");	// 이벤트 시작일
	String endDate		= (String)request.getAttribute("endDate");		// 이벤트 종료일

	String errorYn		= (String)request.getAttribute("errorYn");		// 에러여부체크
	String item03		= (String)request.getAttribute("item03");		// 응모건

	String scriptStr	= "apply();";
	String onloadStr	= "";

	// 에러여부 체크
	if(errorYn.equals("Y")){
		onloadStr = "alert('지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.');";
	}
	else{
		if(!loginYN.equals("Y")){
			onloadStr = "alert('로그인후 이용가능 합니다.');";
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
						if(item03.equals("01")){
							scriptStr = "alert('이미 컬투 크리스말쇼 2012년 12월 23일(일) 4시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[0].checked=true;";
						}
						else if(item03.equals("02")){
							scriptStr = "alert('이미 컬투 크리스말쇼 2012년 12월 23일(일) 8시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[1].checked=true;";
						}
						else if(item03.equals("03")){
							scriptStr = "alert('이미 컬투 크리스말쇼 2012년 12월 25일(화) 3시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[2].checked=true;";
						}
						else if(item03.equals("04")){
							scriptStr = "alert('이미 컬투 크리스말쇼 2012년 12월 25일(화) 7시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[3].checked=true;";
						}
						else if(item03.equals("05")){
							scriptStr = "alert('이미 뮤지컬 캐치미 이프유캔 2012년 12월 23일(일) 3시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[4].checked=true;";
						}
						else if(item03.equals("06")){
							scriptStr = "alert('이미 뮤지컬 캐치미 이프유캔 2012년 12월 30일(일) 3시 공연에 응모하셨습니다.');document.frmFamily201211.ITEM03[5].checked=true;";
						}
					}
				}
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성가족 나눔 캠페인 컬투 크리스말쇼/뮤지컬 초대 - 삼성카드</title>
<xecure:scardEnc xecobj='<%=xservlet %>' needClientEncryption='<%=needClientEncryption %>'>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

input {width: 13px; height: 13px; margin: 0; padding: 0;}
.event_family {position: relative;}

/* 121011 수정 */
.event_family	.event_input_1	{
	position:absolute;
	z-index:2;
	left:170px;
	top:1630px;
}
.event_family	.event_input_2	{
	position:absolute;
	z-index:2;
	left:170px;
	top:1655px;
}
.event_family	.event_input_3	{
	position:absolute;
	z-index:2;
	left:170px;
	top:1681px;
}

.event_family	.event_input_4	{
	position:absolute;
	z-index:2;
	left:170px;
	top:1707px;
}
.event_family	.event_input_6	{
	position:absolute;
	z-index:2;
	left:482px;
	top:1657px;
}

.event_family	.event_input_5	{
	position:absolute;
	z-index:2;
	left:482px;
	top:1631px;
}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">

	// 이벤트 에러여부
	function eventChk(){
		<%=onloadStr%>
	}

	// 이벤트 기응모 체크
	function applyChk(){
		var loginYn = "<%=loginYN%>";
		var eventOk = "<%=event_ok%>";

		if(loginYn != "Y"){
			alert('로그인후 이용가능 합니다.');
		}
		else{
			if(eventOk == "Y"){
				go();
			}
		}
	}

	// 응모하기버튼을 눌렀을 때 호출하는 함수
	function go () {
		<%=scriptStr%>
	}
	// 이벤트 응모
	var cnt = 0;
	function apply() {
		var loginYn = "<%=loginYN%>";
		if(loginYn != "Y"){
			alert('로그인후 이용가능 합니다.');
		}
		else{
			var checkedYn = "N";
			var item03 = "";
			for(i=0; i<6; i++){
				if(document.frmFamily201211.ITEM03[i].checked){
					checkedYn = "Y";
					item03 = document.frmFamily201211.ITEM03[i].value;
				}
			}

			if(checkedYn !="Y" ){
				alert("공연 선택 후 응모해 주세요.");
				document.frmFamily201211.ITEM03[0].focus();
			}
			else{
				cnt++;
				if(cnt == 1){
					var parameter = "eventNo=<%=eventNo%>&ITEM03="+item03;
					callJson("cultwo", "com.scard.hp.im.et.evt.web.NHPIMETEVT003Ctrl", "applyFamily201211Event", parameter, "cultwo201211CallBack");
				}
			}
		}
	}

	// 이벤트 응모 콜백
	function cultwo201211CallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			alert("응모 되셨습니다.");
			document.location.href="/hp/im/et/evt003.do?method=getFamily201211Event";
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

	/**
	 * JSON 형식으로 AJAX Request
	 *
	 * @param callId		호출 ID (페이지 내 고유값으로 콜백 함수에서 사용)
	 * @param mvcBeanId	컨트롤러 ID
	 * @param methodName	컨트롤러 메소드명
	 * @param params		호출 파라미터 (QueryString 형식 or JSON 형식)
	 * @param callback		콜백 함수명 (default: jsonCallback) [optional]
	 * @param errorHandler	에러핸들러 함수명 (default: jsonErrorHandler) [optional]
	 * @param addQueryString	쿼리스트링에 들어갈 내용 [optional]
	 * @param withoutXecure	탭 Xecure 적용여부와 무관하게 Xecure를 사용하지 않음 [optional]
	 * @return
	 */
	function callJson(callId, mvcBeanId, methodName, params, callback, errorHandler, addQueryString, withoutXecure) {
		if (callId == null || mvcBeanId == null || methodName == null) {
			alert("Invalid Call");
			return;
		}

		if (params == null) {
			params = "";
		}

		if (callback == null) {
			callback = "jsonCallback";
		}

		if (errorHandler == null) {
			errorHandler = "jsonCallback";
		}

		var uri = "/json/request.json?mvcBeanId=" + mvcBeanId;
		uri += "&methodName=" + methodName;

		if (addQueryString) {
			uri += "&" + addQueryString;
		}

		try {
			_resetTimeout();
		} catch(e) {}

		var xecureParams = convertXecureParams(uri, params);
		uri = xecureParams[0];
		params = "p=" + xecureParams[1];

		/*
		if (!withoutXecure && params && params != "" && getTabObject($tabCurrentIdx).attr("xecure") == "Y") {
			var xecureParams = convertXecureParams(uri, params);

			if (xecureParams) {
				uri = xecureParams[0];
				params = "p=" + xecureParams[1];
			} else {
				return;
			}
		}
		*/

		$.post(uri, params, function(data) {
			_jsonCallback(callback, errorHandler, callId, data);
		}, "json");
	}

	function _jsonCallback(callbackFunction, errorHandlerFunction, callId, data) {
		var _errorCode = null;

		try {
			_errorCode = data._errorCode;
		} catch (e) {
			// Ignore
		}

		if (_errorCode == null) {
			eval(callbackFunction + "(callId, data)");
		} else {
			try {
				eval(errorHandlerFunction + "(callId, _errorCode, data._errorMsg)");
			} catch (e) {
				alert("처리중 오류가 발생하였습니다.("+_errorCode+")\n" + data._errorMsg);
			}
		}
	}

	function jsonErrorHandler(callId, errorCode, errorMsg) {
		alert(errorCode);
	}

	/**
	 * Xecure 적용된 Parameter String으로 바꾼다.
	 *
	 * @param action    	원래 action
	 * @param params		평문 params (&로 연결)
	 * @return				[0]:xecure action, [1]:xecure params
	 */
	function convertXecureParams(action, params) {
		var qs ;
		var path ;
		var cipher;

		try {
			qs_begin_index = action.indexOf('?');
			// if action is relative url, get base url from window location
			path = getPath(action);
			// get path info & query string & hash from action url
			if ( qs_begin_index < 0 ) {
				qs = "";
			} else {
				qs = action.substring(qs_begin_index + 1, action.length );
			}
		} catch (e) {
			alert("errno = 1\n\n" + e + e.number + e.description);
			return false;
		}

		var enc_xaddr = "";

		try {
			// encrypt QueryString of action field
			if( gIsContinue == 0 ) {
				gIsContinue = 1;
				if( IsNetscape60() ) {		// Netscape 6.0
					cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
				} else {
					cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
				}
				gIsContinue = 0;
			} else {
				alert(busy_info);
				return false;
			}
		} catch (e) {
			alert("errno = 4\n\n" + e + e.number + e.description);
			return false;
		}

		if( cipher == "" )	return XecureWebError() ;

		try {
			action = path + "?q=" + escape_url(cipher);
		} catch (e) {
			alert("errno = 5\n\n" + e + e.number + e.description);
			return false;
		}
		// adding character set information
		if(usePageCharset)
			action += "&charset=" + document.charset;
		try {
			posting_data = params;
			if (isDebugMode) {
				var debugList = posting_data.split("&");
				var debugMessage = "";

				for(i=0; i<debugList.length; i++) {
					debugMessage+=("["+i+"] "+debugList[i]+"\n\r");
				}
				var lineStr = "-------------------------------------------\n\r";
				alert("[Running under DEBUG MODE] post data list\n\r"+lineStr+debugMessage+lineStr+"Total: "+debugList.length);
			}
		} catch (e) {
			alert("errno = 6\n\n" + e + e.number + e.description);
			return false;
		}

		try {
			if( gIsContinue == 0 ) {
				gIsContinue = 1;
				if( IsNetscape60() ) {		// Netscape 6.0
					cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc ( xgate_addr, path, XecureEscape(posting_data), "POST" );
				} else {
					cipher = document.XecureWeb.BlockEnc ( xgate_addr, path, XecureEscape(posting_data), "POST" );
				}
				gIsContinue = 0;
			} else {
				alert(busy_info);
				return false;
			}
		} catch (e) {
			alert("errno = 7\n\n" + e + e.number + e.description);
			return false;
		}

		if( cipher == "" )	return XecureWebError() ;

		var returnObj = new Array();
		returnObj[0] = action;
		returnObj[1] = escape_url(cipher);

		return returnObj;
	}
</script>
</head>
<body onload="eventChk();">
<div class="event_family">

<img src="/images/et/cultwo201211/event_family.jpg" alt="삼성가족 나눔 캠페인 컬투 크리스말쇼/뮤지컬 초대" border="0" usemap="#family" />
<map name="family" id="family">
<area shape="rect" coords="285,507,439,544" href="https://www.samsungcard.com/hp/ci/ps/lfd/loveFund.do?method=viewLoveFundMain" target="_blank"  title="새창"/>
<area shape="rect" coords="530,1079,612,1099" href="https://www.samsungcard.com/hp/ci/ps/lfd/loveFund.do?method=viewLoveFundMain" target="_blank" title="새창" />
<area shape="rect" coords="215,1321,299,1341" href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=12018116" target="_blank" alt="자세히 보기" title="새창" />
<area shape="rect" coords="584,1321,669,1342" href="http://www.catchmeifyoucan.co.kr " target="_blank" alt="자세히 보기" title="새창" />
<area shape="rect" coords="296,1824,431,1859" href="javascript:go();" alt="응모하기" />
</map>
 <div class="hidden">
	<h1>컬투 크리스말쇼/뮤지컬 초대</h1>
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 11월 21일(수) ~ 12월 9일(일) (삼성카드 또는 복지포탈 이용일자 기준)</dd>
		<dt>행사내용</dt>
		<dd>행사기간 동안 이벤트에 응모하시고, 아래에 제안해 드리는 삼성 가족 나눔 켐페인 중 한 가지에 참여하시면, 추첨을 통해 선택한 공연 티켓 증정(1인 2매)</dd>
		<dt>당첨자 발표</dt>
		<dd>2012년 12월 13일(목) / 삼성카드 홈페이지 및 개별 연락</dd>
	</dl>
	
	<h2>삼성 가족 나눔 캠페인</h2>
	<ol>
		<li>삼성카드로 외식 또는 커피전문점 업종에서 1회 1만원 이상 이용하기 - 수고한 직장 동료에게, 따뜻한 식사와 커피로 고마움을 전해 보세요.</li>
		<li>복지포탈 복지포인트 기부 또는 백혈병 어린이 돕기 등 사랑의 펀드에 기부하기 - 이웃을 위한 작은 나눔으로 모두가 따뜻한 겨울을 만들어 보세요.</li>
	</ol>
	<p>회사별 복지제도 운영정책에 따라 복지포털 포인트 기부가 불가할 수 있으며, 이 경우 사랑의 펀드를 통해 기부에 참여하실 수 있습니다.</p>
	
	<h2>컬투 크리스말쇼</h2>
	<dl>
		<dt>추첨내용</dt>
		<dd>R석 2매(40명) - 회차별 각 10명</dd>
		<dt>공연일시</dt>
		<dd>2012년 12월 23일(일) 4시, 2012년 12월 23일(일) 8시, 2012년 12월 25일(화) 3시, 2012년 12월 25일(화) 7시</dd>
		<dt>공연장소</dt>
		<dd>코엑스 Hall C</dd>
	</dl>
	
	<h2>뮤지컬 캐치미 이프유캔</h2>
	<dl>
		<dt>추첨내용</dt>
		<dd>R석 2매(20명) - 회차별 각 10명</dd>
		<dt>공연일시</dt>
		<dd>2012년 12월 23일(일) 3시, 2012년 12월 30일(일) 3시</dd>
		<dt>공연장소</dt>
		<dd>성남아트센터 오페라하우스</dd>
	</dl>
	
	<ul>
		<li>응모 시 선택한 공연 및 일정은 변경 불가합니다.</li>
		<li>법인/체크/올앳/기프트카드 이용 건은 행사에서 제외됩니다.</li>
		<li>외식/커피전문점 업종은 삼성카드에 등록된 가맹점 정보 기준을 따릅니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>
<form name="frmFamily201211" method="post" action="">
<p class="e_input event_input_1">
	<label><input type="radio" id="family1" name="ITEM03" value="01" title="2012년 12월 23일(일) 4시" onclick="applyChk();" <%if (item03.equals("01")) {%> checked="checked" <%}%> ></label>
</p>
<p class="e_input event_input_2">
	<label><input type="radio" id="family2" name="ITEM03" value="02" title="2012년 12월 23일(일) 8시" onclick="applyChk();" <%if (item03.equals("02")) {%> checked="checked" <%}%> ></label>
</p>
<p class="e_input event_input_3">
	<label><input type="radio" id="family3" name="ITEM03" value="03" title="2012년 12월 25일(화) 3시" onclick="applyChk();" <%if (item03.equals("03")) {%> checked="checked" <%}%> ></label>
</p>
<p class="e_input event_input_4">
	<label><input type="radio" id="family4" name="ITEM03" value="04" title="2012년 12월 25일(화) 7시" onclick="applyChk();" <%if (item03.equals("04")) {%> checked="checked" <%}%> ></label>
</p>
<p class="e_input event_input_5">
	<label><input type="radio" id="family5" name="ITEM03" value="05" title="2012년 12월 23일(일) 3시" onclick="applyChk();" <%if (item03.equals("05")) {%> checked="checked" <%}%> ></label>
</p>
<p class="e_input event_input_6">
	<label><input type="radio" id="family6" name="ITEM03" value="06" title="2012년 12월 30일(일) 3시" onclick="applyChk();" <%if (item03.equals("06")) {%> checked="checked" <%}%> ></label>
</p>
</form>
</div>
</xecure:scardEnc>
</body>
</html>