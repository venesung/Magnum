<%
/*
 * Project Name: 롯데시네마 샤롯데 초대 이벤트
 * File Name: NHPIMETEVTVIEW555.jsp
 * Author: 삼양데이타시스템 모정서
 * Created on 2012. 11. 23.
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

	// 타워
	String beginDateYN1	= (String)request.getAttribute("beginDateYN1");	// 이벤트 응모가능기간여부(시작일)
	String endDateYN1	= (String)request.getAttribute("endDateYN1");	// 이벤트 응모가능기간여부(종료일)
	String beginMsg1	= (String)request.getAttribute("beginMsg1");	// 이벤트 응모가능기간 시작 알림 메시지
	String endMsg1		= (String)request.getAttribute("endMsg1");		// 이벤트 응모가능기간 종료 알림 메시지
	String beginDate1	= (String)request.getAttribute("beginDate1");	// 이벤트 시작일
	String endDate1		= (String)request.getAttribute("endDate1");		// 이벤트 종료일
	
	// 클라우드 아틀라스
	String beginDateYN2	= (String)request.getAttribute("beginDateYN2");	// 이벤트 응모가능기간여부(시작일)
	String endDateYN2	= (String)request.getAttribute("endDateYN2");	// 이벤트 응모가능기간여부(종료일)
	String beginMsg2	= (String)request.getAttribute("beginMsg2");	// 이벤트 응모가능기간 시작 알림 메시지
	String endMsg2		= (String)request.getAttribute("endMsg2");		// 이벤트 응모가능기간 종료 알림 메시지
	String beginDate2	= (String)request.getAttribute("beginDate2");	// 이벤트 시작일
	String endDate2		= (String)request.getAttribute("endDate2");		// 이벤트 종료일

	String cmsSeq		= (String)request.getAttribute("cmsSeq");		// ITCMEVENTTT.CMS_SEQ
	String eventNo		= (String)request.getAttribute("eventNo");		// 이벤트 No
	
	String item03		= StringUtil.nvlt((String)request.getAttribute("item03"));	// 타원 응모 영화관
	String item04		= StringUtil.nvlt((String)request.getAttribute("item04"));	// 클라우드 아틀라스 응모 영화관
	String item05		= StringUtil.nvlt((String)request.getAttribute("item05"));	// 타원 응모 일자
	String item06		= StringUtil.nvlt((String)request.getAttribute("item06"));	// 타원 응모 일시
	String item07		= StringUtil.nvlt((String)request.getAttribute("item07"));	// 클라우드 아틀라스 응모 일자
	String item08		= StringUtil.nvlt((String)request.getAttribute("item08"));	// 클라우드 아틀라스 응모 일시
	
	String regGubun		= "U";	// 신규/수정 구분
	if(item03=="" && item04==""){
		regGubun = "I";
	}

	// 타워 응모 극장명
	String cinema01 = "";
	String imgSrc01 = "";
	String imgAlt01 = "";
	String checked0101 = "";
	String checked0102 = "";
	String checked0103 = "";
	String checked0104 = "";
	String checked0105 = "";
	String checked0106 = "";
	String checked0107 = "";
	String checked0108 = "";
	String checked0109 = "";
	int intItem03 = 0;
	if(item03.equals("")){
		intItem03 = 0;
		imgSrc01 = "btn_applicatiton.png";
		imgAlt01 = "응모하기";
	}
	else{
		intItem03 = Integer.parseInt(item03);
		imgSrc01 = "btn_modify.png";
		imgAlt01 = "수정하기";
	}
	switch(intItem03) {
		case  1 : cinema01 = "사롯데 에비뉴엘(명동)"; checked0101 = "checked";	break;
		case  2 : cinema01 = "사롯데 인천";			checked0102 = "checked";	break;
		case  3 : cinema01 = "사롯데 광주";			checked0103 = "checked";	break;
		case  4 : cinema01 = "사롯데 건대입구";		checked0104 = "checked";	break;
		case  5 : cinema01 = "사롯데 안산(롯데마트)";	checked0105 = "checked";	break;
		case  6 : cinema01 = "사롯데 센텀시티";		checked0106 = "checked";	break;
		case  7 : cinema01 = "사롯데 김포공항";		checked0107 = "checked";	break;
		case  8 : cinema01 = "사롯데 평촌";			checked0108 = "checked";	break;
		case  9 : cinema01 = "사롯데 동성";			checked0109 = "checked";	break;
		default : cinema01 = ""; break;
	}

	// 클라우드 아틀라스 응모 극장명
	String cinema02 = "";
	String imgSrc02 = "";
	String imgAlt02 = "";
	String checked0201 = "";
	String checked0202 = "";
	String checked0203 = "";
	String checked0204 = "";
	String checked0205 = "";
	String checked0206 = "";
	String checked0207 = "";
	String checked0208 = "";
	String checked0209 = "";
	int intItem04 = 0;
	if(item04.equals("")){
		intItem04 = 0;
		imgSrc02 = "btn_applicatiton.png";
		imgAlt02 = "응모하기";
	}
	else{
		intItem04 = Integer.parseInt(item04);
		imgSrc02 = "btn_modify.png";
		imgAlt02 = "수정하기";
	}
	switch(intItem04) {
		case  1 : cinema02 = "사롯데 에비뉴엘(명동)"; checked0201 = "checked";	break;
		case  2 : cinema02 = "사롯데 인천";			checked0202 = "checked";	break;
		case  3 : cinema02 = "사롯데 광주";			checked0203 = "checked";	break;
		case  4 : cinema02 = "사롯데 건대입구";		checked0204 = "checked";	break;
		case  5 : cinema02 = "사롯데 안산(롯데마트)";	checked0205 = "checked";	break;
		case  6 : cinema02 = "사롯데 센텀시티";		checked0206 = "checked";	break;
		case  7 : cinema02 = "사롯데 김포공항";		checked0207 = "checked";	break;
		case  8 : cinema02 = "사롯데 평촌";			checked0208 = "checked";	break;
		case  9 : cinema02 = "사롯데 동성";			checked0209 = "checked";	break;
		default : cinema02 = ""; break;
	}

	// 에러여부 체크
	String eventChk	= "";
	String eventChk1= "";
	String eventChk2= "";

	if(errorYn.equals("Y")){
		eventChk = "E02";
	}
	else{
		// 로그인 체크
		if(loginYN.equals("N")){
			eventChk = "E00";
		}
		else{
			// 타워
			// 이베트 종료 체크
			if( endDateYN1.equals("N")){
				eventChk1 = "E041";
			}
			else{
				// 이베트 시작 체크
				if( beginDateYN1.equals("N")){
					eventChk1 = "E031";
				}
				else{
					// 이벤트 대상자 체크
					if(!eventMemYn.equals("Y")){
						eventChk = "E05";
					}
				}
			}
			// 클라우드 아틀라스
			// 이베트 종료 체크
			if( endDateYN2.equals("N")){
				eventChk2 = "E042";
			}
			else{
				// 이베트 시작 체크
				if( beginDateYN2.equals("N")){
					eventChk2 = "E032";
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
<title>삼성카드2,삼성카드2+회원님만을 위한 롯데시네마 샤롯데 초대 이벤트! - 삼성카드</title>
<xecure:scardEnc xecobj='<%=xservlet %>' needClientEncryption='<%=needClientEncryption %>'>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
a.btn_link:link, a.btn_link:visited {color: #5a96c8; text-decoration: underline;}
a.btn_link:hover, a.btn_link:active {color: #5a96c8; text-decoration: underline;}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.mt5	{margin-top:5px}
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 10px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 , dtable02   td.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
/* popup_layer */
/*120627 2차 삭제*/
/*.pop_l_position	{position:absolute; left:40%; _left:480px; top:233px; _top:333px; z-index:600} 
.pop_l_position640	{left:30%; _left:380px}*/
/*//120627 2차 삭제*/
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/lotte201211/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:29px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:24px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_sub_desc	{margin-bottom:10px; color:#666; font:normal 12px "돋움"; line-height:16px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin:0 auto; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{height:175px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert02,
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert02	{height:122px; word-break:keep-all}
.mt20 {margin-top:20px}
.mt30 {margin-top:30px}
.al_center {text-align:center}
.cinema {border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;overflow:hidden;padding:10px 0;margin-top:5px;}
.clear {clear:both;}
#lay_1,#lay_2,#lay_3,#lay_4	{ display:none;position:absolute; z-index:2; left:137px; top:900px; width:470px; }
.pos_rel {position:relative;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">
	// 레이어 제어
	function ctrlLayer(val){
		document.lotte201211.reset();
		// 타워 응모내역
		document.getElementById('lay_1').style.display='none';
		// 타워 응모
		document.getElementById('lay_3').style.display='none';
		// 클라우드 아틀라스 응모내역
		document.getElementById('lay_2').style.display='none';
		// 클라우드 아틀라스 응모
		document.getElementById('lay_4').style.display='none';

		if(val==1){
			// 타워 응모내역
			document.getElementById('lay_1').style.display='block';
		}
		else if(val==3){
			// 타워 응모
			document.getElementById('lay_3').style.display='block';
		} 
		else if(val==2){
			// 클라우드 아틀라스 응모내역
			document.getElementById('lay_2').style.display='block';
		} 
		else if(val==4){
			// 클라우드 아틀라스 응모
			document.getElementById('lay_4').style.display='block';
		}
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
		alert("삼성카드 2, 2+ 회원님만 응모 가능 합니다.");
	}

	// 로그인 레이어
	function loginLayer(){
		parent.eventLogin("<%=cmsSeq%>");
	}

	// 이벤트 시작전 (타워)
	function eventStart1(){
		alert("<%=beginMsg1%>");
	}

	// 이벤트 종류후 (타워)
	function eventEnd1(){
		alert("<%=endMsg1%>");
	}

	// 이벤트 시작전 (클라우드 아틀라스)
	function eventStart2(){
		alert("<%=beginMsg2%>");
	}

	// 이벤트 종류후 (클라우드 아틀라스)
	function eventEnd2(){
		alert("<%=endMsg2%>");
	}

	// 이벤트 체크(공통)
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
			return false;
		}
		if(eventChk == "E05"){
			eventMem();
			return false;
		}
		return true;
	}

	// 이벤트 체크(기간 - 타워)
	function checkMovie1(eventChk1,gubun){
		if(eventChk1 == "E031"){
			eventStart1();
			return false;
		}
		if(gubun=="01"){
			if(eventChk1 == "E041"){
				eventEnd1();
				return false;
			}
		}
		return true;
	}

	// 이벤트 체크(기간 - 클라우드 아틀라스)
	function checkMovie2(eventChk2,gubun){
		if(eventChk2 == "E032"){
			eventStart2();
			return false;
		}
		if(gubun=="01"){
			if(eventChk2 == "E042"){
				eventEnd2();
				return false;
			}
		}
		return true;
	}

	// 타워 영화관 선택
	function setItem03(item03){
		document.lotte201211.ITEM03.value=item03;
	}
	// 클라우드 아틀라스 영화관 선택
	function setItem04(item04){
		document.lotte201211.ITEM04.value=item04;
	}

	// 타워 응모하기 레이어
	function goMovie01(regGubun){
		var frmEvt    = document.lotte201211;
		var item03    = frmEvt.ITEM03.value;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk1 = frmEvt.eventChk1.value;

		if(checkEvent(eventChk)){
			if(checkMovie1(eventChk1,'01')){
				if(regGubun== "I"){
					if(item03 != ""){
						alert("이미 이벤트에 응모 하셨습니다.");
						return;
					}
				}
				ctrlLayer(3);
			}
		}
	}

	// 클라우드 아틀라스 응모하기 레이어
	function goMovie02(regGubun){
		var frmEvt    = document.lotte201211;
		var item04    = frmEvt.ITEM04.value;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk2 = frmEvt.eventChk2.value;

		if(checkEvent(eventChk)){
			if(checkMovie2(eventChk2,'01')){
				if(regGubun== "I"){
					if(item04 != ""){
						alert("이미 이벤트에 응모 하셨습니다.");
						return;
					}
				}
				ctrlLayer(4);
			}
		}
	}

	// 타워 응모내역 확인
	function myMovie01(){
		var frmEvt    = document.lotte201211;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk1 = frmEvt.eventChk1.value;
		var item03    = frmEvt.ITEM03.value;

		if(checkEvent(eventChk)){
			if(checkMovie1(eventChk1,'02')){
				if(item03 == ""){
					ctrlLayer(3);
				}
				else{
					ctrlLayer(1);
				}
			}
		}
	}

	// 클라우드 아틀라스 응모내역 확인
	function myMovie02(){
		var frmEvt    = document.lotte201211;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk2 = frmEvt.eventChk2.value;
		var item04    = frmEvt.ITEM04.value;

		if(checkEvent(eventChk)){
			if(checkMovie2(eventChk2,'02')){
				if(item04 == ""){
					ctrlLayer(4);
				}
				else{
					ctrlLayer(2);
				}
			}
		}
	}

	// 타워 응모
	function applyMovie01(){
		var frmEvt    = document.lotte201211;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk1 = frmEvt.eventChk1.value;

		if(checkEvent(eventChk)){
			if(checkMovie1(eventChk1,'01')){
				frmEvt.evtGubun.value="1";
				apply(1);
			}
		}
	}

	// 클라우드 아틀라스 응모
	function applyMovie02(){
		var frmEvt    = document.lotte201211;
		var eventChk  = frmEvt.eventChk.value;
		var eventChk2 = frmEvt.eventChk2.value;

		if(checkEvent(eventChk)){
			if(checkMovie2(eventChk2,'01')){
				frmEvt.evtGubun.value="2";
				apply(2);
			}
		}
	}

	// 이벤트 응모
	var cnt = 0;
	function apply(arg) {
		var frmEvt = document.lotte201211;
		var checkedYn = "N";
		var item03 = frmEvt.ITEM03.value;
		var item04 = frmEvt.ITEM04.value;
		var item05 = frmEvt.ITEM05.value;
		var item06 = frmEvt.ITEM06.value;
		var item07 = frmEvt.ITEM07.value;
		var item08 = frmEvt.ITEM08.value;
		var regGubun = frmEvt.regGubun.value;
		var evtGubun = frmEvt.evtGubun.value;

		if(arg==1){
			checkedYn = "N";
			for(i=0; i<9; i++){
				if(frmEvt.MOVIE03[i].checked){
					checkedYn = "Y";
					item03 = frmEvt.MOVIE03[i].value;
				}
			}
		}
		else if(arg==2){
			checkedYn = "N";
			for(i=0; i<9; i++){
				if(frmEvt.MOVIE04[i].checked){
					checkedYn = "Y";
					item04 = frmEvt.MOVIE04[i].value;
				}
			}
		}

		if(checkedYn !="Y" ){
			alert("영화관 선택 후 응모해 주세요.");
			if(arg==1){
				frmEvt.MOVIE03[0].focus();
			}
			else if(arg==2){
				frmEvt.MOVIE04[0].focus();
			}
		}
		else{
			cnt++;
			if(cnt == 1){
				var parameter  = "eventNo=<%=eventNo%>&regGubun="+regGubun+"&evtGubun="+evtGubun;
					parameter += "&ITEM03="+item03+"&ITEM04="+item04;
					parameter += "&ITEM05="+item05+"&ITEM06="+item06;
					parameter += "&ITEM07="+item07+"&ITEM08="+item08;
				callJson("lotte", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "applyLotte201211Event", parameter, "lotte201211CallBack");
				cnt = 0;
			}
		}

	}

	// 이벤트 응모 콜백
	function lotte201211CallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)
		var frmEvt = document.lotte201211;
		var regGubun = frmEvt.regGubun.value;

		if(resultCnt==1){
			alert("이벤트에 응모 되었습니다.");
			XecureNavigate("/hp/im/et/evt.do?method=getLotte201211Event",'_self','');
		}
		else{
			checkEvent(resultCnt);
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
<body>
<form name="lotte201211" method="post" action="">
<input type="hidden" name="eventChk"  value="<%=eventChk%>" />
<input type="hidden" name="eventChk1" value="<%=eventChk1%>" />
<input type="hidden" name="eventChk2" value="<%=eventChk2%>" />
<input type="hidden" name="ITEM03"    value="<%=item03%>" />
<input type="hidden" name="ITEM04"    value="<%=item04%>" />
<input type="hidden" name="ITEM05"    value="<%=item05%>" />
<input type="hidden" name="ITEM06"    value="<%=item06%>" />
<input type="hidden" name="ITEM07"    value="<%=item07%>" />
<input type="hidden" name="ITEM08"    value="<%=item08%>" />
<input type="hidden" name="regGubun"  value="<%=regGubun%>" />
<input type="hidden" name="evtGubun"  value="" />
<div class="pos_rel" >
<img src="/images/et/lotte201211/event_lotte.jpg" alt="삼성카드2,삼성카드2+회원님만을 위한 롯데시네마 샤롯데 초대 이벤트!" border="0" usemap="#lotte" />
<map name="lotte" id="lotte">
  <area shape="rect" coords=" 66,1230,173,1251" href="http://towersky2012.interest.me/index.htm" target="_blank" alt="영화 자세히 보기"  title="새창"/>
  <area shape="rect" coords="185,1230,322,1251" href="#"  onclick="myMovie01();return false;" alt="나의 응모내역 확인하기" />
  <area shape="rect" coords="111,1261,280,1298" href="#"  onclick="goMovie01('I');return false;" alt="이벤트 응모하기" />
  <area shape="rect" coords="407,1230,512,1251" href="http://www.cloudatlas.kr/index.htm" target="_blank" alt="영화 자세히 보기"  title="새창"/>
  <area shape="rect" coords="523,1230,661,1251" href="#"  onclick="myMovie02();return false;" alt="나의 응모내역 확인하기" />
  <area shape="rect" coords="448,1261,617,1298" href="#"  onclick="goMovie02('I');return false;"  alt="이벤트 응모하기" />
  <area shape="rect" coords="442,1475,568,1497" href="https://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001 " target="_blank" alt="핸드폰 번호 확인하기" title="새창" />
  <area shape="rect" coords="127,1866,208,1888" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1216')" alt="자세히보기" />
</map>
 <div class="hidden">
	<h1>롯데시네마 샤롯데 초대 이벤트!</h1>
	<p>
		최신 영화를 더 특별하게 감상하실 수 있는 기회! 제 3&middot;4차 롯데시네마 샤롯데 이벤트에 응모해 보세요.
		대상카드 : 삼성카드 2, 삼성카드 2+, 삼성카드 BIZ 2 및 그 제휴카드
	</p>
	<h2>올 겨울, 단 하나의 감동 영화! 타워</h2>
	<dl>
		<dt>응모기간</dt>
		<dd>2012년 11월 29일(목) ~ 12월 12일(수)</dd>
		<dt>행사대상</dt>
		<dd>응모기간 동안 해당 카드로 일시불 및 할부 합산 50만원 이상 이용하신 회원님 - 행사 응모일과 관계없이 응모기간동안 실적 합산</dd>
		<dt>행사내용</dt>
		<dd>이벤트에 응모하신 회원님 중 총 147분을 추첨하여 샤롯데관 시사회 초청 - 동반 1인 포함</dd>
		<dt>관람일</dt>
		<dd>2012년 12월 22일(토)</dd>
		<dt>상영영화</dt>
		<dd>타워(설경구, 손예진, 김상경 등 출연)</dd>
	</dl>
	<a href="http://towersky2012.interest.me/index.htm" target="_blank" title="새창">영화 자세히 보기</a>
	<h2>아바타 이후 최고의 혁명! 클라우드 아틀라스</h2>
	<dl>
		<dt>응모기간</dt>
		<dd>2012년 11월 29일(목) ~ 12월 31일(목)</dd>
		<dt>행사대상</dt>
		<dd>응모기간 동안 해당 카드로 일시불 및 할부 합산 70만원 이상 이용하신 회원님 - 행사 응모일과 관계없이 응모기간동안 실적 합산</dd>
		<dt>행사내용</dt>
		<dd>이벤트에 응모하신 회원님 중 총 147분을 추첨하여 샤롯데관 시사회 초청 - 동반 1인 포함</dd>
		<dt>관람일</dt>
		<dd>2012년 1월 12일(토)</dd>
		<dt>상영영화</dt>
		<dd>클라우드 아틀라스(톰 행크스, 휴 그랜트, 배두나 등 출연)</dd>
	</dl>
	<a href="http://www.cloudatlas.kr/index.htm" target="_blank" title="새창">영화 자세히 보기</a>
	
	<p>
		당첨자 발표일 : 3차 2012년 12월 14일(금)/4차 2012년 1월 4일(금) 홈페이지 이벤트 당첨자 발표란
		- 이벤트 당첨 회원님께는 초청일 3일 전에 당첨 내용을 휴대폰 문자메시지로 전송해드리며, 행사 당일 샤롯데에서 당첨 회원님 확인 및 자리 배치가 이루어 집니다.
		- 회원님께서 등록하신 휴대폰번호가 다를 경우 경품이 다른 사람에게 발송될 수 있으므로, 반드시 확인해 주시기 바랍니다.
	</p>
	
	<h2>삼성카드2</h2>
	<p>친구많고, 즐길것 많아 더 스마트하게 쓰고 싶은 당신께~ 트렌드와 실속, 두가지를 동시에</p>
	<ul>
		<li>대중교통, 이동통신요금 10% 청구할인</li>
		<li>패션, 커피, 편의점 등 1%~5% 빅포인트 적립, 1%: 할인점, 백화점, 음식점, 학원 등, 3% : 커피, 제과점, 편의점 등, 5% : 8SECOND, 유니클로, 자라 등</li>
		<li>롯데시네마 삼성 모바일 GIFT 관람권 2매 증정</li>
		<li>롯데시네마 동반 1인 50% 청구할인</li>
		<li>놀이공원 및 워터파크 20~50% 할인</li>
	</ul>
	
	<ul>
		<li>행사기간 내 두 가지 영화에 모두 응모 가능하며, 응모기간 내에 변경하실 수 있습니다.</li>
		<li>회원님께서 삼성카드에 등록하신 휴대폰번호가 다를 경우, 당첨시 자동 취소됩니다.</li>
		<li>휴대폰번호 오류 및 당첨자 발표 미확인으로 인한 불이익은 책임지지 않습니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 &middot; 중단 될 수 있으며, 그 내용은 사전에 알려 드립니다.</li>
	</ul>
</div>
<!-- 타워 응모내역확인 S -->
	<div id="lay_1" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="width:470px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="ctrlLayer(0);" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/lotte201211/tit_result.png" alt="회원님께서 응모하신 영화 및 장소는 아래와 같습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<p class="pop_sub_desc"><strong><%=userName %> </strong>회원님께서 응모하신 공연일시는 아래와 같습니다.</p>
					<table summary=" 응모하신 공연일시입니다" class="dtable02"> 
						<caption> 응모하신 공연일시입니다</caption>
						<colgroup><col width="20%"/><col width="80%"/></colgroup>
						<tbody>
						<tr>
							<th class=""><p>영화명</p></th>
							<td class="cell_l10">타워</td>
						</tr>
						<tr>
							<th class=""><p>초청일시</p></th>
							<td class="cell_l10">2012년 12월 22일 오후 4시</td>
						</tr>
						<tr>
							<th class=""><p>장소</p></th>
							<td class="cell_l10"><%=cinema01 %></td>
						</tr>
						</tbody>
					</table>
					<p class="t_desc04 mt5">응모내역 변경을 원하시면 수정 버튼을 클릭 후 , 다시 선택해 주세요.</p>
					<p class="mt20 al_center"><a href="javascript:ctrlLayer(0);"><img src="/images/et/lotte201211/btn_ok.png" alt="확인" /></a><a href="javascript:goMovie01('U');"><img src="/images/et/lotte201211/btn_modify2.png" alt="수정" /></a></p>
				</div>
			</div>
		</div>
	</div>
<!-- 타워 응모내역확인 E -->

<!-- 클라우드 아틀라스 응모내역확인 S -->
	<div id="lay_2" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="width:470px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="ctrlLayer(0);" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/lotte201211/tit_result.png" alt="회원님께서 응모하신 영화 및 장소는 아래와 같습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<p class="pop_sub_desc"><strong><%=userName %> </strong>회원님께서 응모하신 공연일시는 아래와 같습니다.</p>
					<table summary=" 응모하신 공연일시입니다" class="dtable02"> 
						<caption> 응모하신 공연일시입니다</caption>
						<colgroup><col width="20%"/><col width="80%"/></colgroup>
						<tbody>
						<tr>
							<th class=""><p>영화명</p></th>
							<td class="cell_l10">클라우드 아틀라스</td>
						</tr>
						<tr>
							<th class=""><p>초청일시</p></th>
							<td class="cell_l10">2013년 1월 12일 오후 4시</td>
						</tr>
						<tr>
							<th class=""><p>장소</p></th>
							<td class="cell_l10"><%=cinema02 %></td>
						</tr>
						</tbody>
					</table>
					<p class="t_desc04 mt5">응모내역 변경을 원하시면 수정 버튼을 클릭 후 , 다시 선택해 주세요.</p>
					<p class="mt20 al_center"><a href="javascript:ctrlLayer(0);"><img src="/images/et/lotte201211/btn_ok.png" alt="확인" /></a><a href="javascript:goMovie02('U');"><img src="/images/et/lotte201211/btn_modify2.png" alt="수정" /></a></p>
				</div>
			</div>
		</div>
	</div>
<!-- 클라우드 아틀라스 응모내역확인 E -->

<!-- 타워 희망영화관 선택하기 S  -->
	<div id="lay_3" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="width:470px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="ctrlLayer(0);" value="레이어닫기" title="희망영화관 선택 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/lotte201211/layer_tit_tower.png" alt="타워 희망영화관 선택하기" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<div class="cinema">
						<ul style="float: left; width: 140px;margin-top:7px">
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="01" id="one_1" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 에비뉴엘(명동) 선택" <%=checked0101 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema1.png" alt="샤롯데 에비뉴엘(명동)" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="02" id="one_2" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 인천 선택" <%=checked0102 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema2.png" alt="샤롯데 인천" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="03" id="one_3" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 광주 선택" <%=checked0103 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema3.png" alt="샤롯데 광주" /></label>
						</li>
					
					</ul>
					<ul style="float: left; width: 140px;margin-top:7px">
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="04" id="one_4" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 건대입구 선택" <%=checked0104 %> onclick="setItem03(this.value);" />
						<img src="/images/et/lotte201211/cinema4.png" alt="샤롯데 건대입구" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="05" id="one_5" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 안산(롯데마트) 선택" <%=checked0105 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema5.png" alt="샤롯데 안산(롯데마트)" /></label>
						</li>
					
						<li style="list-style:none;">
							<label><input type="radio" name="MOVIE03" value="06" id="one_6" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 센텀시티 선택" <%=checked0106 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema6.png" alt="샤롯데 센텀시티" /></label>
						</li>
					</ul>
					<ul style="float: left; width: 110px;margin-top:7px">
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="07" id="one_7" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 김포공항 선택" <%=checked0107 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema7.png" alt="샤롯데 김포공항" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="08" id="one_8" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 평촌 선택" <%=checked0108 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema8.png" alt="샤롯데 평촌" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE03" value="09" id="one_9" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 동성 선택" <%=checked0109 %> onclick="setItem03(this.value);" />
							<img src="/images/et/lotte201211/cinema9.png" alt="샤롯데 동성" /></label>
						</li>
					</ul>
					</div>
					<p class="mt30 al_center clear"><a href="javascript:applyMovie01();"><img src="/images/et/lotte201211/<%=imgSrc01 %>" alt="<%=imgAlt01 %>" /></a></p>
					<!-- 수정하기 버튼입니다.<p class="mt30 al_center clear"><a href="#"><img src="/images/et/lotte201211/btn_modify.png" alt="수정하기" /></a></p> -->
				</div>
			</div>
		</div>
	</div>
<!--// 타워 희망영화관 선택하기 E  -->

<!-- 클라우드 아틀라스 희망영화관 선택하기 S -->
	<div id="lay_4" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="width:470px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="ctrlLayer(0);" value="레이어닫기" title="클라우드 아틀라스 희망영화관 선택 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/lotte201211/layer_tit_cloud.png" alt=" 클라우드 아틀라스 희망영화관 선택하기" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<div class="cinema">
						<ul style="float: left; width: 140px;margin-top:7px"">
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE04" value="01" id="one_1" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 에비뉴엘(명동) 선택" <%=checked0201 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema1.png" alt="샤롯데 에비뉴엘(명동)" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<label><input type="radio" name="MOVIE04" value="02" id="one_2" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 인천 선택" <%=checked0202 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema2.png" alt="샤롯데 인천" /></label>
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="03" id="one_3" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 광주 선택" <%=checked0203 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema3.png" alt="샤롯데 광주" />
						</li>
					</ul>
					<ul style="float: left; width: 140px;margin-top:7px"">
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="04" id="one_4" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 건대입구 선택" <%=checked0204 %> onclick="setItem04(this.value);" />
						<img src="/images/et/lotte201211/cinema4.png" alt="샤롯데 건대입구" />
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="05" id="one_5" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 안산(롯데마트) 선택" <%=checked0205 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema5.png" alt="샤롯데 안산(롯데마트)" />
						</li>
					
						<li style="list-style:none;">
							<input type="radio" name="MOVIE04" value="06" id="one_6" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 센텀시티 선택" <%=checked0206 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema6.png" alt="샤롯데 센텀시티" />
						</li>
					</ul>
					<ul style="float: left; width: 110px;margin-top:7px"">
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="07" id="one_7" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 김포공항 선택" <%=checked0207 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema7.png" alt="샤롯데 김포공항" />
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="08" id="one_8" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 평촌 선택" <%=checked0208 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema8.png" alt="샤롯데 평촌" />
						</li>
						<li style="margin-bottom: 10px; list-style:none;">
							<input type="radio" name="MOVIE04" value="09" id="one_9" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 동성 선택" <%=checked0209 %> onclick="setItem04(this.value);" />
							<img src="/images/et/lotte201211/cinema9.png" alt="샤롯데 동성" />
						</li>
					</ul>
					</div>
					<p class="mt30 al_center clear"><a href="javascript:applyMovie02();"><img src="/images/et/lotte201211/<%=imgSrc02 %>" alt="<%=imgAlt02 %>" /></a></p>
					<!-- 수정하기 버튼입니다.<p class="mt30 al_center clear"><a href="#"><img src="/images/et/lotte201211/btn_modify.png" alt="수정하기" /></a></p> -->
				</div>
			</div>
		</div>
	</div>
<!--// 클라우드 아틀라스 희망영화관 선택하기  E -->
</div>
</form>
</xecure:scardEnc>
</body>
</html>