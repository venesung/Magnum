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
<title>탄생 25주년! 꼭 한 번은 봐야할 세기의 공연! 뮤지컬&lt;오페라의 유령&gt; 초대 이벤트 - 삼성카드</title>
<xecure:scardEnc xecobj='<%=xservlet %>' needClientEncryption='<%=needClientEncryption %>'>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
#lay_1{display:none; position:absolute; z-index:2; left:131px; top:710px; }

/*120627 추가*/
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
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/phantom201211/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
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
/*//120627 추가*/
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">
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
		parent.eventLogin("<%=cmsSeq%>");
	}

	// 이벤트 시작전
	function eventStart(){
		alert("<%=beginMsg%>");
	}

	// 이벤트 종류후 
	function eventEnd(){
		alert("<%=endMsg%>");
	}

	// 이벤트 체크(공통)
	function checkEvent(eventChk,gubun){
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
		if(eventChk == "E03"){
			eventStart();
			return false;
		}
		if(gubun=="01"){
			if(eventChk == "E04"){
				eventEnd();
				return false;
			}
		}
		if(eventChk == "E05"){
			eventMem();
			return false;
		}
		return true;
	}

	// 응모내역 레이어 열기
	function myEvent(){
		var frmEvt	= document.phantom201211;
		var eventChk= frmEvt.eventChk.value;
		var item03	= frmEvt.ITEM03.value;
		if(checkEvent(eventChk,'02')){
			if(item03==""){
				goEvent();
			}
			else{
				document.getElementById("lay_1").style.display = "block";
			}
		}
	}

	// 응모내역 레이어 닫기
	function closeMyEvent(){
		document.getElementById("lay_1").style.display = "none";
	}
	
	// 응모하기 팝업
	function goEvent(){
		var frmEvt    = document.phantom201211;
		var eventChk  = frmEvt.eventChk.value;

		closeMyEvent();
		if(checkEvent(eventChk,'01')){
			XecureNavigate("/hp/im/et/evt.do?method=popupPhantom201211Event",'phantomoftheopera','width=730px, height=589px, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
		}
	}

	// 응모완료
	function eventReload(){
		XecureNavigate("/hp/im/et/evt.do?method=getPhantom201211Event",'_self','');
	}

</script>
</head>
<body>
<form name="phantom201211" method="post" action="">
<input type="hidden" name="eventChk"  value="<%=eventChk%>" />
<input type="hidden" name="ITEM03"  value="<%=item03%>" />
<img src="/images/et/phantom201211/event_musical.jpg" alt="탄생 25주년! 꼭 한 번은 봐야할 세기의 공연! 뮤지컬&lt;오페라의 유령&gt; 초대 이벤트" border="0" usemap="#musical" />
<map name="musical" id="musical">
<area shape="rect" coords="230,1008,338,1028" href="http://www.phantomoftheopera.co.kr/" target="_blank" alt="공연 자세히 보기"  title="새창"/>
<area shape="rect" coords="347,1009,498,1031" id="NHPIMETEVTVIEW557_L01" href="javascript:myEvent();fnSetReturnFocusId('NHPIMETEVTVIEW557_L01','lay_1');"  alt="내가 응모한 내역 확인하기" />
<area shape="rect" coords="287,962,441,1000" href="#" onclick="goEvent();return false;" alt="응모하기" />
<area shape="rect" coords="186,1178,381,1198" href="http://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001" target="_blank" alt="핸드폰번호 및 청구지 주소 수정하기" title="새창" />
</map>
<div class="hidden">
	<h1>뮤지컬 오페라의 유령 초대 이벤트</h1>
	<p>탄생 25주년! 꼭 한 번은 봐야할 세기의 공연! 설명이 필요 없는 뮤지컬, 오페라의 유령 25주년 기념 내한공연~ 삼성카드 회원님께 가장 황홀한 순간을 선사합니다. 지금 바로 응모하세요!</p>
	<dl>
		<dt>응모기간</dt>
		<dd>2012년 12월 3일(월)~12월 16일(수)</dd>
		<dt>행사대상</dt>
		<dd>응모기간 동안 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원님</dd>
		<dt>행사내용</dt>
		<dd>이벤트에 응모하신 회원님 중 추첨을 통해 97분께 뮤지컬 오페라의 유령 티켓 무료 제공(1인 2매)</dd>
		<dt>초대기간</dt>
		<dd>2012년 12월 24일(월) ~ 2013년 1월 11일(금)</dd>
		<dt>공연장소</dt>
		<dd>블루스퀘어 삼성전자홀</dd>
		<dt>당첨자발표</dt>
		<dd>2012년 12월 17일(월) 홈페이지 당첨자 발표란 게시 및 휴대폰으로 개별 안내</dd>
		<dt>티켓발송일</dt>
		<dd>2012년 12월 19일(수) 회원님께서 등록하신 휴대폰번호와 주소가 다를 경우 경품이 다른 사람에게 발송될 수 있으므로, 반드시 확인해 주시기 바랍니다.</dd>
	</dl>
	
	<ul>
		<li>공연일시는 하나만 선택하실 수 있으며, 응모기간 내 변경 가능합니다.</li>
		<li>티켓을 분실하실 경우 입장하실 수 없습니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>
<!-- 레이어팝업-최초응모시 -->
<div id="lay_1" class="pop_l_position pop_l_wrap_mix" >
	<div class="pop_l_wrap" style="height:220px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="closeMyEvent();closeLayerPopup();" value="레이어닫기" title="응모하기 레이어 닫기" />
		<p class="pop_tit" style="text-align:left;"><img src="/images/et/phantom201211/layer_tit_1.png" alt="회원님께서 응모하신 공연일시입니다." /></p>
			<div class="pop_l_content">
				<div class="pop_l_alert" style="">
				<p class="pop_sub_desc"><strong><%=userName %></strong> 회원님께서 응모하신 공연일시는 아래와 같습니다.</p>
				<table summary=" 응모하신 공연일시입니다" class="dtable02"> 
					<caption> 응모하신 공연일시입니다</caption>
					<colgroup><col width="20%"/><col width="80%"/></colgroup>
					<tbody>
					<tr>
						<th class=""><p>공연명</p></th>
						<td class="">뮤지컬 &lt;오페라의 유령&gt;</td>
					</tr>
					<tr>
						<th class=""><p>공연일시</p></th>
						<td class=""> <%=applyInfo %></td>
					</tr>
					</tbody>
				</table>
				<p class="t_desc04 mt5">변경을 원하시면 다시 공연일자를 선택 후 응모버튼을 클릭하시면, 변경 가능합니다.</p>
			</div>
		</div>
	</div>
</div>
<!-- //레이어팝업-최초응모시 -->
</form>
</xecure:scardEnc>
</body>
</html>