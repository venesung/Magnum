<%
/*
 * Project Name: 뮤지컬 <오페라의 유령> 초대 이벤트
 * File Name: NHPIMETEVTVIEW556.jsp
 * Author: 삼양데이타시스템 모정서
 * Created on 2012. 11. 26.
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
	String errorYn		= (String)request.getAttribute("errorYn");		// 에러여부체크
	String loginYN		= (String)request.getAttribute("loginYN");		// 로그인여부
	String eventMemYn	= (String)request.getAttribute("eventMemYn");	// 이벤트 참가가능여부(02,07 정회원)
	String userName		= (String)request.getAttribute("userName");		// 회원 성명

	String beginDateYN	= (String)request.getAttribute("beginDateYN");	// 이벤트 응모가능기간여부(시작일)
	String endDateYN	= (String)request.getAttribute("endDateYN");	// 이벤트 응모가능기간여부(종료일)
	String beginMsg		= (String)request.getAttribute("beginMsg");		// 이벤트 응모가능기간 시작 알림 메시지
	String endMsg		= (String)request.getAttribute("endMsg");		// 이벤트 응모가능기간 종료 알림 메시지
	String beginDate	= (String)request.getAttribute("beginDate");	// 이벤트 시작일
	String endDate		= (String)request.getAttribute("endDate");		// 이벤트 종료일

	String cmsSeq		= (String)request.getAttribute("cmsSeq");		// ITCMEVENTTT.CMS_SEQ
	String eventNo		= (String)request.getAttribute("eventNo");		// 이벤트 No
	
	String item03		= StringUtil.nvlt((String)request.getAttribute("item03"));	// 응모번호
	String item07		= StringUtil.nvlt((String)request.getAttribute("item07"));	// 최초응모일자
	String item08		= StringUtil.nvlt((String)request.getAttribute("item08"));	// 최초응모일시
	
	String regGubun		= "U";	// 신규/수정 구분
	if(item03==""){
		regGubun = "I";
	}

	String applyInfo	= "";
	int intItem03 = 0;
	if(item03.equals("")){
		intItem03 = 0;
	}
	else{
		intItem03 = Integer.parseInt(item03);
	}
	switch(intItem03) {
		case  1 : applyInfo = "2012년 12월 24일(월) 오후 8시"; break;
		case  2 : applyInfo = "2012년 12월 25일(화) 오후 3시"; break;
		case  3 : applyInfo = "2012년 12월 27일(목) 오후 8시"; break;
		case  4 : applyInfo = "2012년 12월 28일(금) 오후 8시"; break;
		case  5 : applyInfo = "2012년 12월 29일(토) 오후 2시"; break;
		case  6 : applyInfo = "2012년 12월 30일(일) 오후 2시"; break;
		case  7 : applyInfo = "2012년 12월 30일(일) 오후 7시"; break;
		case  8 : applyInfo = "2012년 12월 31일(월) 오후 8시"; break;
		case  9 : applyInfo = "2013년 1월 1일(화) 오후 2시"; break;
		case 10 : applyInfo = "2013년 1월 1일(화) 오후 7시"; break;
		case 11 : applyInfo = "2013년 1월 3일(목) 오후 8시"; break;
		case 12 : applyInfo = "2013년 1월 4일(금) 오후 8시"; break;
		case 13 : applyInfo = "2013년 1월 5일(토) 오후 2시"; break;
		case 14 : applyInfo = "2013년 1월 5일(토) 오후 7시"; break;
		case 15 : applyInfo = "2013년 1월 6일(일) 오후 3시"; break;
		case 16 : applyInfo = "2013년 1월 8일(화) 오후 8시"; break;
		case 17 : applyInfo = "2013년 1월 9일(수) 오후 8시"; break;
		case 18 : applyInfo = "2013년 1월 10일(목) 오후 8시"; break;
		case 19 : applyInfo = "2013년 1월 11일(금) 오후 8시"; break;
		default : applyInfo = ""; break;
	}

	// 에러여부 체크
	String eventChk	= "";

	if(errorYn.equals("Y")){
		eventChk = "E02";
	}
	else{
		// 로그인 체크
		if(loginYN.equals("N")){
			eventChk = "E00";
		}
		else{
			// 이베트 종료 체크
			if( endDateYN.equals("N")){
				eventChk = "E04";
			}
			else{
				// 이베트 시작 체크
				if( beginDateYN.equals("N")){
					eventChk = "E03";
				}
				else{
					// 이벤트 대상자 체크
					if(!eventMemYn.equals("Y")){
						eventChk = "E05";
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
<title>응모하기-뮤지컬 오페라의 유령 - 삼성카드</title>

<style type="text/css"> 
/*120627 추가*/
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
a.btn_link:link, a.btn_link:visited {color: #5a96c8; text-decoration: underline;}
a.btn_link:hover, a.btn_link:active {color: #5a96c8; text-decoration: underline;}
.content_block_card	{margin-top:0; border-top:0 none}
.clfix {display:inline-block}
.clfix:after {content:"."; display:block; clear:both; height:0; visibility:hidden}
.mt20 { margin-top: 20px;}
.al_center	{text-align:center}
th.riline, td.riline	{border-right:1px solid #E6E6E6}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}/*120627 2차수정*/
 
/* popup_window */
#pop_wrap	{width:710px}
#pop_header	 {width:100%; height:60px; background:url('/images/et/phantom201211/pop_bg_body.jpg') no-repeat left top}
#pop_header	 h1	{padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('images/pop_bg_body.jpg') no-repeat 663px 0}
#pop_content	 {position:relative; width:100%; height:292px; margin:20px 0; overflow:auto}
#pop_footer	{position:relative; width:100%; height:30px; background:url('images/pop_bg_body.jpg') no-repeat left bottom}
#pop_content	 .content_block_card	{margin-top:0; padding-top:0; border-top:0 none}
#pop_content	 .content_block	.content_block_inner	{float:left; width:500px; margin-top:0}
 
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
 
 
 
/* popup_layer */
.pop_l_position	{position:absolute; left:40%; _left:480px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */
.pop_l_position640	{left:30%; _left:380px}
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/phantom201211/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:45px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:24px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_sub_desc	{margin-bottom:10px; color:#666; font:normal 12px "돋움"; line-height:16px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin:0 auto; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{height:175px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert02,
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert02	{height:122px; word-break:keep-all}
/*//120627  3차 수*/
 
h3{height:24px;}
#pop_content3{position:relative; width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}
#id_layer01,#id_layer02,#id_layer03 {left:120px;top:150px;}
</style>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">
	// 레이어 초기화
	function clearLayer(){
		document.phantom201211.reset();
		// 최초 응모시
		document.getElementById('id_layer01').style.display='none';
		// 응모전 마지막 확인시
		document.getElementById('id_layer02').style.display='none';
		// 응모건 수정시
		document.getElementById('id_layer03').style.display='none';
	}
	// 이벤트 에러
	function eventErr(){
		alert('지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.');
	}

	// 로그인 세션 만료
	function sessionEnd(){
		alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
	}

	// 이벤트 참여 대상이 아닐때
	function eventMem(){
		alert("죄송합니다. 개인신용카드(가족카드 포함) 이용자만 응모 가능 합니다.");
	}

	// 로그인 레이어
	function loginLayer(){
		parent.loginLayer();
		window.close();
	}

	// 이벤트 시작전
	function eventStart(){
		alert("<%=beginMsg%>");
	}

	// 이벤트 종류후
	function eventEnd(){
		alert("<%=endMsg%>");
	}

	// 이벤트 체크
	function checkEvent(eventChk){
		if(eventChk == "E00"){
			loginLayer();
			return false;
		}
		if(eventChk == "E01"){
			sessionEnd();
			loginLayer();
			return false;
		}
		if(eventChk == "E02"){
			eventErr();
			window.close();
			opener.eventReload();
			return false;
		}
		if(eventChk == "E03"){
			eventStart();
			window.close();
			opener.eventReload();
			return false;
		}
		if(eventChk == "E04"){
			eventEnd();
			window.close();
			opener.eventReload();
			return false;
		}
		if(eventChk == "E05"){
			eventMem();
			window.close();
			opener.eventReload();
			return false;
		}
		return true;
	}

	function setApplyInfo(){
		var frmEvt= document.phantom201211;
		var item03= frmEvt.ITEM03.value;
		if(item03 == ""){
			alert("공연일시 선택 후 응모해 주세요.");
			return false;
		}
		var applyInfo="";

		switch(parseInt(item03,10)){
			case  1 : applyInfo = "2012년 12월 24일(월) 오후 8시"; break;
			case  2 : applyInfo = "2012년 12월 25일(화) 오후 3시"; break;
			case  3 : applyInfo = "2012년 12월 27일(목) 오후 8시"; break;
			case  4 : applyInfo = "2012년 12월 28일(금) 오후 8시"; break;
			case  5 : applyInfo = "2012년 12월 29일(토) 오후 2시"; break;
			case  6 : applyInfo = "2012년 12월 30일(일) 오후 2시"; break;
			case  7 : applyInfo = "2012년 12월 30일(일) 오후 7시"; break;
			case  8 : applyInfo = "2012년 12월 31일(월) 오후 8시"; break;
			case  9 : applyInfo = "2013년 1월 1일(화) 오후 2시"; break;
			case 10 : applyInfo = "2013년 1월 1일(화) 오후 7시"; break;
			case 11 : applyInfo = "2013년 1월 3일(목) 오후 8시"; break;
			case 12 : applyInfo = "2013년 1월 4일(금) 오후 8시"; break;
			case 13 : applyInfo = "2013년 1월 5일(토) 오후 2시"; break;
			case 14 : applyInfo = "2013년 1월 5일(토) 오후 7시"; break;
			case 15 : applyInfo = "2013년 1월 6일(일) 오후 3시"; break;
			case 16 : applyInfo = "2013년 1월 8일(화) 오후 8시"; break;
			case 17 : applyInfo = "2013년 1월 9일(수) 오후 8시"; break;
			case 18 : applyInfo = "2013년 1월 10일(목) 오후 8시"; break;
			case 19 : applyInfo = "2013년 1월 11일(금) 오후 8시"; break;
			default : applyInfo = ""; break;
		}

		$("#id_layer01_info").html(applyInfo);
		$("#id_layer02_info").html(applyInfo);
		$("#id_layer03_info").html(applyInfo);
	}

	// 응모 레이어
	function goEvent(val){
		// 레이어 초기화
		clearLayer();
		var frmEvt   = document.phantom201211;
		var eventChk = frmEvt.eventChk.value;
		var chkItem03= frmEvt.CHK_ITEM03.value;
		frmEvt.ITEM03.value=val;
		setApplyInfo();

		if(checkEvent(eventChk)){
			if(chkItem03==""){
				// 최초 응모
				document.getElementById('id_layer01').style.display='block';
			}
			else{
				// 응모 수정
				document.getElementById('id_layer03').style.display='block';
			}
		}
	}

	// 응모 확인 레이어
	function confirmEvent(val){
		// 레이어 초기화
		var frmEvt   = document.phantom201211;
		var item03 = frmEvt.ITEM03.value;
		var eventChk = frmEvt.eventChk.value;
		clearLayer();
		frmEvt.ITEM03.value = item03;
		frmEvt.regGubun.value=val;
		applyEvent();
	}

	// 응모
	function applyEvent(){
		var frmEvt	= document.phantom201211;
		var eventChk= frmEvt.eventChk.value;

		if(checkEvent(eventChk)){
			apply();
		}
	}
	
	var cnt = 0;
	function apply() {
		var frmEvt = document.phantom201211;
		var item03 = frmEvt.ITEM03.value;
		var regGubun = frmEvt.regGubun.value;

		if(item03 =="" ){
			alert("공연일시 선택 후 응모해 주세요.");
		}
		else{
			cnt++;
			if(cnt == 1){
				var parameter  = "eventNo=<%=eventNo%>&regGubun="+regGubun+"&ITEM03="+item03+"&ITEM07=<%=item07%>&ITEM08=<%=item08%>";
				callJson("phantom", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "applyPhantom201211Event", parameter, "phantom201211CallBack");
				cnt = 0;
			}
		}

	}

	// 이벤트 응모 콜백
	function phantom201211CallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)
		var frmEvt = document.phantom201211;
		var regGubun = frmEvt.regGubun.value;

		if(resultCnt==1){
			document.getElementById('id_layer02').style.display='block';
			opener.eventReload();
		}
		else{
			checkEvent(resultCnt);
		}
	}

	function eventSuccess(){
		window.close();
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
<body>
<form name="phantom201211" method="post" action="">
<input type="hidden" name="eventChk"	value="<%=eventChk%>" />
<input type="hidden" name="regGubun"	value="<%=regGubun%>"/>
<input type="hidden" name="CHK_ITEM03"	value="<%=item03%>"/>
<input type="hidden" name="ITEM03"		value="" />
<!-- 팝업사이즈 730*589 -->
<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/phantom201211/h1_musical.png" alt="응모하기-뮤지컬 오페라의 유령" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content3" >
		<div class="content_block content_block_card clfix">
			<p><strong>공연장소</strong><span style="padding-left:30px;">블루스퀘어 삼성전자홀</span></p>	
			<p><strong>좌석</strong><span style="padding-left:58px;">VIP석</span></p>
			<p><strong>추첨인원</strong><span style="padding-left:30px;">총 97분 (1인 2매)</span></p>	
			<table summary="공연일시, 당첨인원, 응모하기 등 뮤지컬 오페라의 유령을 응모하실 수 있습니다. " class="mt20 dtable02">
			<caption>응모하기-뮤지컬 오페라 유령</caption>
			<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">12/24(월)<br />오후 8시</td>
				<td class="al_center">12/25(화)<br />오후 3시</td>
				<td class="al_center">12/27(목)<br />오후 8시</td>
				<td class="al_center">12/28(금)<br />오후 8시</td>
				<td class="al_center">12/29(토)<br />오후 2시</td>
				<td class="al_center">12/30(일)<br />오후 2시</td>
				<td class="al_center">12/30(일)<br />오후 7시</td>
				<td class="al_center"> </td>
			</tr>
			<tr>
				<th class="riline"><p>당첨인원</p></th>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">6명</td>
				<td class="al_center">6명</td>
				<td class="al_center"> </td>
			</tr>
			<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="javascript:goEvent('01');" class="btn_link"></>응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('02');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('03');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('04');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('05');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('06');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('07');" class="btn_link">응모</a></td>
				<td class="al_center"> </td>
			</tr>
			</tbody>
			</table>

			<table summary="공연일시, 당첨인원, 응모하기 등 뮤지컬 오페라의 유령을 응모하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 오페라 유령</caption>
			<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">12/31(월) <br />오후 8시</td>
				<td class="al_center">1/1(화)<br />오후 2시</td>
				<td class="al_center">1/1(화)<br />오후 7시</td>
				<td class="al_center">1/3(목) <br />오후 8시</td>
				<td class="al_center">1/4(금)<br />오후 8시</td>
				<td class="al_center">1/5(토)<br />오후 2시</td>
				<td class="al_center">1/5(토)<br />오후 7시</td>
				<td class="al_center">1/6(일)<br />오후 3시</td>
			</tr>
			<tr>
				<th class="riline"><p>당첨인원</p></th>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">4명</td>
				<td class="al_center">6명</td>
				<td class="al_center">5명</td>
			</tr>
			<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="javascript:goEvent('08');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('09');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('10');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('11');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('12');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('13');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('14');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('15');" class="btn_link">응모</a></td>
			</tr>
			</tbody>
			</table>

				<table summary="공연일시, 당첨인원, 응모하기 등 뮤지컬 오페라의 유령을 응모하실 수 있습니다." class="mt20  dtable02">
			<caption>응모하기-뮤지컬 오페라 유령</caption>
			<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">1/8(화) <br />오후 8시</td>
				<td class="al_center">1/9(수)<br />오후 8시</td>
				<td class="al_center">1/10(목)<br />오후 8시</td>
				<td class="al_center">1/11(금) <br />오후 8시</td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
			</tr>
			<tr>
				<th class="riline"><p>당첨인원</p></th>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center">5명</td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
			</tr>
			<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="javascript:goEvent('16');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('17');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('18');" class="btn_link">응모</a></td>
				<td class="al_center"><a href="javascript:goEvent('19');" class="btn_link">응모</a></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>
<!-- 레이어팝업-최초응모시 -->
	<div id="id_layer01" class="pop_l_position pop_l_wrap_mix" style="display:none;">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="clearLayer();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/phantom201211/layer_title_1.png" alt="아래의 공연일시를선택하셨습니다.응모하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:85px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;오페라 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="id_layer01_info"></strong></p>			
				</div>
 				<p class="btnc"><a href="#" onclick="confirmEvent('I'); return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="clearLayer(); return false;"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-최초응모시 -->


<!-- 레이어팝업-이벤트확인 클릭시 -->
	<div id="id_layer02" class="pop_l_position pop_l_wrap_mix" style="display:none;">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="eventSuccess();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/phantom201211/layer_tit_4.png" alt="아래와 같이 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;오페라 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="id_layer02_info"></strong></p>			
				</div>
 				<p class="btnc"><a href="#" onclick="eventSuccess(); return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-이벤트확인 클릭시 -->

<!-- 레이어팝업-이벤트 재응모시  -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_mix" style="display:none;">
		<div class="pop_l_wrap" style="height:400px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="clearLayer();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/phantom201211/layer_title_2.png" alt="회원님께선 이미 아래의 공연일시로 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:60px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;오페라 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong> <%=applyInfo %></strong></p>			
				</div>
			</div>
			<p class="pop_tit" style="margin-top:30px;"><img src="/images/et/phantom201211/layer_tit_3.png" alt="아래 공연일시로 변경하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:80px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;오페라 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="id_layer03_info"></strong></p>	
				</div>
 				<p class="btnc"><a href="#" onclick="confirmEvent('U'); return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="clearLayer(); return false;"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-이벤트 재응모시 -->

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<p style="text-align:right;padding:6px 40px 5px 0px; color:#999;letter-spacing:-1px;" class="t_no"></p>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>

</div>
</form>

</body>
</html>