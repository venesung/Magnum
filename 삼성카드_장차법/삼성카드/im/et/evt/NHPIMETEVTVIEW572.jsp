<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW551.jsp
 * Author: 모정서 과장
 * Created on 2012.11.06.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page import="com.scard.common.util.StringUtil"%>
<%
	String loginYN		= StringUtil.nvlt((String)request.getAttribute("loginYN"));		// 로그인여부
	String applyDateYN	= StringUtil.nvlt((String)request.getAttribute("applyDateYN"));	// 이벤트 응모가능기간여부
	String dataYN		= StringUtil.nvlt((String)request.getAttribute("dataYN"));		// ITEVDATATT 데이타 유무
	String eventNo		= StringUtil.nvlt((String)request.getAttribute("eventNo"));		// 이벤트번호
	String item04		= StringUtil.nvlt((String)request.getAttribute("item04"));		// 이벤트 응모여부
	String totCnt		= StringUtil.nvlt((String)request.getAttribute("totCnt"));		// 경험횟수
	String userName		= StringUtil.nvlt((String)request.getAttribute("userName"));	// 회원성명

	String beginDate	= StringUtil.nvlt((String)request.getAttribute("beginDate"));	// 이벤트 시작일자
	String endDate		= StringUtil.nvlt((String)request.getAttribute("endDate"));		// 이벤트 종료일자
	String beginMsg		= StringUtil.nvlt((String)request.getAttribute("beginMsg"));	// 이벤트 시작 안내 메세지
	String endMsg		= StringUtil.nvlt((String)request.getAttribute("endMsg"));		// 이벤트 종료 안내 메세지
	String beginDateYN	= StringUtil.nvlt((String)request.getAttribute("beginDateYN"));	// 이벤트 응모가능기간여부(시작일자)
	String endDateYN	= StringUtil.nvlt((String)request.getAttribute("endDateYN"));	// 이벤트 응모가능기간여부(종료일자)
	String eventEtc1	= StringUtil.nvlt((String)request.getAttribute("eventEtc1"));	// 이벤트 CMS 번호
	String evtMemYN		= StringUtil.nvlt((String)request.getAttribute("evtMemYN"));	// 이벤트 참여 대상여부
	String errorYN		= StringUtil.nvlt((String)request.getAttribute("errorYN"));		// 에러여부

	String campagin01 = StringUtil.nvlt((String)request.getAttribute("campagin01"));	// 이메일 명세서 여부
	String campagin02 = StringUtil.nvlt((String)request.getAttribute("campagin02"));	// 페이백 서비스
	String campagin03 = StringUtil.nvlt((String)request.getAttribute("campagin03"));	// ID-Secure
	String campagin04 = StringUtil.nvlt((String)request.getAttribute("campagin04"));	// 웹회원
	String campagin05 = StringUtil.nvlt((String)request.getAttribute("campagin05"));	// 숫자카드
	String campagin06 = StringUtil.nvlt((String)request.getAttribute("campagin06"));	// CGV
	String campagin07 = StringUtil.nvlt((String)request.getAttribute("campagin07"));	// 쇼핑
	String campagin08 = StringUtil.nvlt((String)request.getAttribute("campagin08"));	// 현금서비스, 카드론
	String campagin09 = StringUtil.nvlt((String)request.getAttribute("campagin09"));	// 가족카드 이벤트
	String campagin10 = StringUtil.nvlt((String)request.getAttribute("campagin10"));	// My패밀리서비스
	String campagin11 = StringUtil.nvlt((String)request.getAttribute("campagin11"));	// 사랑의펀트
	String campagin12 = StringUtil.nvlt((String)request.getAttribute("campagin12"));	// 주유

	String chk01 = "";
	String chk02 = "";
	String chk03 = "";
	String chk04 = "";
	String chk05 = "";
	String chk06 = "";
	String chk07 = "";
	String chk08 = "";
	String chk09 = "";
	String chk10 = "";
	String chk11 = "";
	String chk12 = "";

	String chkT01 = "false";
	String chkT02 = "false";
	String chkT03 = "false";
	String chkT04 = "false";
	String chkT05 = "false";
	String chkT06 = "false";
	String chkT07 = "false";
	String chkT08 = "false";
	String chkT09 = "false";
	String chkT10 = "false";
	String chkT11 = "false";
	String chkT12 = "false";

	if(campagin01.equals("Y")){
		chk01  = "checked";
		chkT01 = "true";
	}
	if(campagin02.equals("Y")){
		chk02  = "checked";
		chkT02 = "true";
	}
	if(campagin03.equals("Y")){
		chk03  = "checked";
		chkT03 = "true";
	}
	if(campagin04.equals("Y")){
		chk04  = "checked";
		chkT04 = "true";
	}
	if(campagin05.equals("Y")){
		chk05  = "checked";
		chkT05 = "true";
	}
	if(campagin06.equals("Y")){
		chk06  = "checked";
		chkT06 = "true";
	}
	if(campagin07.equals("Y")){
		chk07  = "checked";
		chkT07 = "true";
	}
	if(campagin08.equals("Y")){
		chk08  = "checked";
		chkT08 = "true";
	}
	if(campagin09.equals("Y")){
		chk09  = "checked";
		chkT09 = "true";
	}
	if(campagin10.equals("Y")){
		chk10  = "checked";
		chkT10 = "true";
	}
	if(campagin11.equals("Y")){
		chk11  = "checked";
		chkT11 = "true";
	}
	if(campagin12.equals("Y")){
		chk12  = "checked";
		chkT12 = "true";
	}

	if("".equals(totCnt)) totCnt = "0";
	String score1 = totCnt; // 경험횟수
	String score2 = ""; // 획득점수
	String score3 = ""; // 당첨확률
	String layer  = ""; // 결과
	switch(Integer.parseInt(totCnt)){
		case  0 : score2 =  "0"; score3 =  "0"; layer = "1"; break;
		case  1 : score2 =  "0"; score3 =  "0"; layer = "1"; break;
		case  2 : score2 =  "0"; score3 =  "0"; layer = "1"; break;
		case  3 : score2 =  "1"; score3 =  "1"; layer = "2"; break;
		case  4 : score2 =  "2"; score3 =  "2"; layer = "2"; break;
		case  5 : score2 =  "3"; score3 =  "3"; layer = "2"; break;
		case  6 : score2 =  "4"; score3 =  "4"; layer = "2"; break;
		case  7 : score2 =  "5"; score3 =  "5"; layer = "2"; break;
		case  8 : score2 =  "6"; score3 =  "6"; layer = "2"; break;
		case  9 : score2 =  "7"; score3 =  "7"; layer = "2"; break;
		case 10 : score2 =  "8"; score3 =  "8"; layer = "2"; break;
		case 11 : score2 =  "9"; score3 =  "9"; layer = "2"; break;
		case 12 : score2 = "10"; score3 = "10"; layer = "2"; break;
	}

	// 버튼 샛팅(로그인전/참여하기/내점수확인하기)
//	<div class="btn"><a href="javascript:apply();" title="새창" ><img src="/images/et/2013campaign/btn_apply.gif" alt="참여하기"/></a></div>
//	<div class="btn"><a href="javascript:score();"  title="새창"><img src="/images/et/2013campaign/btn_mylevel.gif" alt="내 점수 확인하기"/></a></div>
	
	String btnSrc	= "/images/et/2013campaign/btn_apply.gif";
	String btnAlt	= "참여하기";
	String scriptStr= "";
	String viewStr	= "none;";
	// 에러여부 체크
	if(errorYN.equals("Y")){
		scriptStr = "alert('지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.');";
	}
	else{
		// 로그인 체크
		if(!loginYN.equals("Y")){
			scriptStr = "parent.eventLogin('"+eventEtc1+"');";
		}
		else{
			viewStr = "inline;";
			// 이베트 종료 체크
			if( !endDateYN.equals("Y")){
				scriptStr = "alert('"+endMsg+"');";
			}
			else{
				// 이베트 시작 체크
				if(! beginDateYN.equals("Y")){
					scriptStr = "alert('"+beginMsg+"');";
				}
				else{
					// 이벤트 대상자 체크
					if(!evtMemYN.equals("Y")){
						scriptStr = "alert('법인/체크/선불/올앳/기프트카드 회원님들은 이벤트에 참여하실 수 없습니다.');";
					}
					else{
						// 이벤트 응모여부 체크
						if(item04.equals("Y")){
							scriptStr	= "score();";
							btnSrc		= "/images/et/2013campaign/btn_mylevel.gif";
							btnAlt		= "내 점수 확인하기";
						}
						else{
							scriptStr = "apply();";
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
<title>삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>
<!-- 레이어팝업 스크립트 -->
<script type="text/javascript">
	function layeropen(num){
		for (i=1; i<=2; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
	function open_layer(id) {
		hide_select();
		document.getElementById(id).style.display = "block";
	}
	function close_layer(id) {
		show_select();
		document.getElementById(id).style.display = "none";
	}
	function show_sitemap(idName,a) {
		var obj_btn = document.getElementById(a);
		open_layer(idName);
		obj_btn.src = obj_btn.src.replace("_off","_on");
	}
	function hide_sitemap(idName,a) {
		var obj_btn = document.getElementById(a);
		close_layer(idName);
		obj_btn.src = obj_btn.src.replace("_on","_off");
	}

	function apply(){
		var parameter = "eventNo=<%=eventNo%>";
		callJson("archery", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "apply2013Campaign", parameter, "campaignCallBack",null,null,true);
	}
	function campaignCallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			layeropen(<%=layer%>);
			document.getElementById("btnLnk").innerHTML  ="<a href='javascript:score();' title='새창' ><img src='/images/et/2013campaign/btn_mylevel.gif' alt='내 점수 확인하기'/></a></div>";
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
			}
			else if(resultCnt == "E"){
				alert("법인/체크/선불/올앳/기프트카드 회원님들은 이벤트에 참여하실 수 없습니다.");
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
			}
		}
	}
	function score(){
		layeropen(<%=layer%>);
	}

	function setChk01(){
		document.CampaignF.CHK01.checked = <%=chkT01%>;
	}
	function setChk02(){
		document.CampaignF.CHK02.checked = <%=chkT02%>;
	}
	function setChk03(){
		document.CampaignF.CHK03.checked = <%=chkT03%>;
	}
	function setChk04(){
		document.CampaignF.CHK04.checked = <%=chkT04%>;
	}
	function setChk05(){
		document.CampaignF.CHK05.checked = <%=chkT05%>;
	}
	function setChk06(){
		document.CampaignF.CHK06.checked = <%=chkT06%>;
	}
	function setChk07(){
		document.CampaignF.CHK07.checked = <%=chkT07%>;
	}
	function setChk08(){
		document.CampaignF.CHK08.checked = <%=chkT08%>;
	}
	function setChk09(){
		document.CampaignF.CHK09.checked = <%=chkT09%>;
	}
	function setChk10(){
		document.CampaignF.CHK10.checked = <%=chkT10%>;
	}
	function setChk11(){
		document.CampaignF.CHK11.checked = <%=chkT11%>;
	}
	function setChk12(){
		document.CampaignF.CHK12.checked = <%=chkT12%>;
	}
</script>
<style type="text/css"> 
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
input {padding:0;margin:0;width:13px; height:13px;}
/* 130425 수정 */
.input01 {position:absolute;top:1625px;left:65px;}
.input02 {position:absolute;top:1742px;left:64px;}
.input03 {position:absolute;top:1857px;left:65px;}
.input04 {position:absolute;top:1990px;left:65px;}
.input05 {position:absolute;top:1625px;left:280px;}
.input06 {position:absolute;top:1742px;left:280px;}
.input07 {position:absolute;top:1857px;left:280px;}
.input08 {position:absolute;top:1990px;left:280px;}
.input09 {position:absolute;top:1625px;left:497px;}
.input10 {position:absolute;top:1742px;left:497px;}
.input11 {position:absolute;top:1857px;left:497px;}
.input12 {position:absolute;top:1990px;left:497px;}
.btn {position:absolute;top:2177px;left:263px;}
/* //130425 수정 */
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.pop_l_wrap	{position:relative; width:464px; height:295px; border:3px solid #5a96c8; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/2013campaign/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:50px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:30px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512; text-align: center;}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin: 30px auto 0 auto; text-align:center;}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{word-break:keep-all}
.t_blue{color: #255db2;}
.t_black{color: #333333;;}
.mb10{margin-bottom: 10px;}
.mt20{margin-top: 20px;}
#lay_1{display:none; position:absolute; z-index:2; left:110px; top:1830px;  }
#lay_2{display:none; position:absolute; z-index:2;  left:110px; top:1830px;  }
 
</style>
</head>
<body>
<form name="CampaignF">
<div style="position:relative ">
<img src="/images/et/2013campaign/event_130417.jpg" alt="실용의 경험 캠페인 론칭 이벤트" border="0" usemap="#Map_et1" />
<p class="input01" style="display: <%=viewStr %>"><input type="checkbox" name="CHK01" value="<%=campagin01 %>" class="chk" title="이메일 명세서 신청하기"		id="experience01" <%=chk01 %> onClick="javascript:setChk01();" /></p>
<p class="input02" style="display: <%=viewStr %>"><input type="checkbox" name="CHK02" value="<%=campagin02 %>" class="chk" title="페이벡서비스 자세히보기"	id="experience02" <%=chk02 %> onClick="javascript:setChk02();" /></p>
<p class="input03" style="display: <%=viewStr %>"><input type="checkbox" name="CHK03" value="<%=campagin03 %>" class="chk" title="ID-Secure 바로가기"		id="experience03" <%=chk03 %> onClick="javascript:setChk03();" /></p>
<p class="input04" style="display: <%=viewStr %>"><input type="checkbox" name="CHK04" value="<%=campagin04 %>" class="chk" title="웹회원 가입하기"			id="experience04" <%=chk04 %> onClick="javascript:setChk04();" /></p>
<p class="input05" style="display: <%=viewStr %>"><input type="checkbox" name="CHK05" value="<%=campagin05 %>" class="chk" title="숫자카드 자세히보"			id="experience05" <%=chk05 %> onClick="javascript:setChk05();" /></p>
<p class="input06" style="display: <%=viewStr %>"><input type="checkbox" name="CHK06" value="<%=campagin06 %>" class="chk" title="CGV 이벤트 자세히보기"		id="experience06" <%=chk06 %> onClick="javascript:setChk06();" /></p>
<p class="input07" style="display: <%=viewStr %>"><input type="checkbox" name="CHK07" value="<%=campagin07 %>" class="chk" title="삼성카드쇼핑 바로가기"		id="experience07" <%=chk07 %> onClick="javascript:setChk07();" /></p>
<p class="input08" style="display: <%=viewStr %>"><input type="checkbox" name="CHK08" value="<%=campagin08 %>" class="chk" title="금융상품자세히보기"		id="experience08" <%=chk08 %> onClick="javascript:setChk08();" /></p>
<p class="input09" style="display: <%=viewStr %>"><input type="checkbox" name="CHK09" value="<%=campagin09 %>" class="chk" title="가족카드 이벤트 자세히보기"	id="experience09" <%=chk09 %> onClick="javascript:setChk09();" /></p>
<p class="input10" style="display: <%=viewStr %>"><input type="checkbox" name="CHK10" value="<%=campagin10 %>" class="chk" title="My패밀리서비스 바로가기"	id="experience10" <%=chk10 %> onClick="javascript:setChk10();" /></p>
<p class="input11" style="display: <%=viewStr %>"><input type="checkbox" name="CHK11" value="<%=campagin11 %>" class="chk" title="사랑의 펀드 바로가기"		id="experience11" <%=chk11 %> onClick="javascript:setChk11();" /></p>
<p class="input12" style="display: <%=viewStr %>"><input type="checkbox" name="CHK12" value="<%=campagin12 %>" class="chk" title=""						id="experience12" <%=chk12 %> onClick="javascript:setChk12();" /></p>

<div id="btnLnk" class="btn"><a href="javascript:<%=scriptStr %>" title="새창" ><img src="<%=btnSrc %>" alt="<%=btnAlt %>"/></a></div>
<map name="Map_et1" id="Map_et1">
<!-- 130425 수정 -->
  <area shape="rect" coords="100,1697,243,1717" href="/index.do?menuId=NHPIMMHEPP001" target="_blank" alt="이메일 명세서 신청하기" title="새창"/>
  <area shape="rect" coords="93,1812,244,1833"  href="/index.do?menuId=NHPIMSSSBC001M016" target="_blank" alt="페이백서비스 자세히보기" title="새창"/>
  <area shape="rect" coords="114,1944,243,1964" href="/index.do?menuId=NHPIMSSSIS001M001" target="_blank" alt="ID-Secure 바로가기" title="새창"/>
  <area shape="rect" coords="136,2095,244,2114" href="/index.do?menuId=NHPIMMSCRN001" target="_blank" alt="웹회원 가입하기" title="새창"/>
  <area shape="rect" coords="328,1698,457,1718" href="/showroom/shw.do?method=getNumber" target="_blank" alt="숫자카드 자세히보기" title="새창"/>
  <area shape="rect" coords="310,1811,459,1832" href="/link/index.jsp?url=EVENT?eventNo=39940" target="_blank" alt="CGV 이벤트 자세히보기"title="새창" />
  <area shape="rect" coords="314,1943,456,1964" href="https://shopping.samsungcard.com/ec/sp/spMain.do?method=selectSPMain" target="_blank" alt="삼성카드쇼핑 바로가기" title="새창"/>
  <area shape="rect" coords="327,2093,457,2114" href="/index.do?menuId=NHPIMFSCOM001" target="_blank" alt="금융상품자세히보기" title="새창"/>
  <area shape="rect" coords="507,1696,671,1717" href="/link/index.jsp?url=EVENT?eventNo=39615" target="_blank" alt="가족카드 이벤트 자세히보기" title="새창"/>
  <area shape="rect" coords="517,1811,673,1832" href="/index.do?menuId=NHPIMSSFAM001M002" target="_blank" alt="My패밀리서비스 바로가기" title="새창"/>
  <area shape="rect" coords="540,1943,674,1963" href="/hp/ci/ps/lfd/loveFund.do?method=viewLoveFundMain" target="_blank" alt="사랑의 펀드 바로가기" title="새창"/>
  <!-- 130503  수정 -->
  <area shape="rect" coords="244,2419,430,2439" href="/index.do?menuId=NHPIMMHUFM001M001" target="_blank" alt="휴대폰번호 확인하기 및 수정하기"  title="새창"/>
  <area shape="rect" coords="502,2720,659,2741" href="/2013campaign" target="_blank" alt="마이크로 사이트 바로가기" title="새창"/>
  <!-- //130503  수정 -->
<!-- //130425 수정 -->
</map>
<!-- 레이어팝업-획득점수01 -->
	<div id="lay_1" class="pop_l_position pop_l_wrap_mix " >
		<div class="pop_l_wrap" ><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="레이어 닫기" />
			<p class="pop_tit" style="position: relative:"><strong class="t_blue" style="font-size: 20px; position:absolute; top:2px;"><%=userName %></strong> <span style="margin-left: 70px;"><img src="/images/et/2013campaign/lay_txt01.png" alt="회원님의 획득 점수 입니다." /></span></p>
				<div class="pop_l_content">
					<div class="pop_l_alert">
					<p class="mb10">혜택 경험 횟수 : <strong class="t_black"><%=score1 %> 개</strong></p>
					<p  style="line-height:16px;">획득 점수 : <strong  class="t_black"><%=score2 %> 점</strong><br />(당첨 확률 <%=score3 %> 배)</p>
					<p class="mt20"  style="line-height:16px;">응모 점수가 부족합니다.<br />더 많은 혜택을 경험하셔서 점수를 획득해 보세요.</p>
					<p class="btnc"><a href="javascript:layerclose(1);"><img src="/images/et/2013campaign/btn_ok.png" alt="확인" /></a></p>
				</div>
			</div>
		</div>
	</div>
<!-- //레이어팝업-획득점수01 -->
 
<!-- 레이어팝업-획득점수02 -->
	<div id="lay_2" class="pop_l_position pop_l_wrap_mix ">
		<div class="pop_l_wrap" ><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="레이어 닫기" />
			<p class="pop_tit" style="position: relative:"><strong class="t_blue" style="font-size: 20px; position:absolute; top:2px;"><%=userName %></strong> <span style="margin-left: 70px;"><img src="/images/et/2013campaign/lay_txt01.png" alt="회원님의 획득 점수 입니다." /></span></p>
				<div class="pop_l_content">
					<div class="pop_l_alert">
					<p class="mb10">혜택 경험 횟수 : <strong class="t_black"><%=score1 %> 개</strong></p>
					<p style="line-height:16px;">획득 점수 : <strong  class="t_black"><%=score2 %> 점</strong><br />(당첨 확률 <%=score3 %> 배)</p>
					<p class="mt20">참여해 주셔서 감사합니다.</p>
					<p class="btnc"><a href="javascript:layerclose(2);"><img src="/images/et/2013campaign/btn_ok.png" alt="확인" /></a></p>
				</div>
			</div>
		</div>
	</div>
<!-- //레이어팝업-획득점수02 --></div>
<div class="conts_hidden">
	<h2>5월, 당신께 꼭 필요한 것만 모아서 드리는-실용의 경험 캠페인 론칭 이벤트</h2><!-- 130503 수정 -->
	<p>꼭 필요한 것, 놓치고 있던 것이 있다면 5월에 두루 챙겨 보세요.필요한 혜택을 더 많이 경험하실수록 선물 당첨의 기회도 더욱 높아집니다.</p>
	<dl>
		<dt>행사기간</dt>
		<dd>2013년 5월 2일(목) ~ 5월 31일(금)</dd>
		<dt>행사내용</dt>
		<dd>참여하기 버튼을 누르신 후 아래 12개 혜택 중 3회 경험 시 1점 획득, 이후 1회 추가 경험 시 1점씩 추가되며, <strong>획득 점수에 따라 높아지는 당첨 확률(최대 10배) 적용 후 추첨을 통해 다양한 경품 증정</strong> <br />- 참여하기 버튼을 누른 시점과 관계없이 행사기간 동안 경험하신 모든 혜택이 경험횟수에 포함됩니다.<!-- 130425 수정 -->
		<table summary="경험횟수별 획득점수,당첨확률 안내표입니다.">
		<caption>행사내용</caption>
		<tbody>
			<tr>
				<th scope="row">경험횟수</th>
				<td>1·2회</td>
				<td>3회</td>
				<td>4회</td>
				<td>5회</td>
				<td>6회</td>
				<td>7회</td>
				<td>8회</td>
				<td>9회</td>
				<td>10회</td>
				<td>11회</td>
				<td>12회</td>
			</tr>		
			<tr>
				<th scope="row">획득 점수</th>
				<td>0점</td>
				<td>1점</td>
				<td>2점</td>
				<td>3점</td>
				<td>4점</td>
				<td>5점</td>
				<td>6점</td>
				<td>7점</td>
				<td>8점</td>
				<td>9점</td>
				<td>10점</td>
			</tr>		
			<tr>
				<th scope="row">당첨 확률</th>
				<td>0</td>
				<td>1배</td>
				<td>2배</td>
				<td>3배</td>
				<td>4배</td>
				<td>5배</td>
				<td>6배</td>
				<td>7배</td>
				<td>8배</td>
				<td>9배</td>
				<td>10배</td>
			</tr>		
		</tbody>
		</table>
		</dd>
		<dt>경품내용</dt>
		<dd>
			<ol>
				<li><strong>1등(1명)</strong>하와이여행 2인(500만원 상당)</li>
				<li><strong>2등(2명)</strong>S-Oil 주유권(100만원)</li>
				<li><strong>3등(3명)</strong>엘파마 자전거(ROSA 596D)</li>
				<li><strong>4등(100명)</strong>CGV 영화관람권 2매</li>
				<li><strong>5등(200명)</strong>스타벅스 아이스아메리카노 2잔</li>
			</ol>
		</dd>
		<dt>당첨자발표</dt>
		<dd>2013년 6월 14일(금) 삼성카드 홈페이지 이벤트 당첨자발표란(1~3등 당첨 회원님께는 개별 안내)</dd>
		<dt>경품발송</dt>
		<dd>2013년 6월 17일(월) </dd>
	</dl>
	<h3>회원님께 꼭 필요한 실용적인 혜택을 모았습니다!</h3>
	<dl>
		<dt>매일매일 필요한 것에 집중!</dt>
		<dd>
			<ul>
				<li>
					<p><input type="checkbox" class="chk" title="이메일 명세서 신청하기"  id="experience01"/>분실 염려 적고, 환경도 보호하는 이메일 명세서 신청하기!</p>
					<p><a href="/showroom/shw.do?method=getNumber"  target="_blank" title="새창">이메일 명세서 신청하기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="페이벡서비스 자세히보기"  id="experience02"/>사용포인트의 33.3%~50%를 되돌려주는 페이백서비스 이용하기!</p>
					<p><a href="/index.do?menuId=NHPIMSSSBC001M016"  target="_blank" title="새창">페이백서비스 자세히보기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="ID-Secure 바로가기"  id="experience03"/>회원님의 신용과 개인정보를 지켜 주는 알림 서비스, ID-Secure 신청하기!</p>
					<p><a href="/index.do?menuId=NHPIMSSSIS001M001"  target="_blank" title="새창">ID-Secure 바로가기</a></p>
				</li>
				
				
			</ul>
		</dd>
		<dt>특별한 날 필요한 것에 집중!</dt>
		<dd>
			<ul>
				<li>
					<p><input type="checkbox" class="chk" title="웹회원 가입하기"  id="experience04"/>홈페이지 또는 스마트폰 App으로  카드이용내역을 확인하고,  다양한 혜택 응모를 위한 웹회원 가입하기!</p>
					<p><a href="/index.do?menuId=NHPIMMSCRN001"  target="_blank" title="새창">웹회원 가입하기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="숫자카드 자세히보"  id="experience05"/>당신께 참 실용적인삼성카드 숫자카드 발급받기!</p>
					<p><a href="/showroom/shw.do?method=getNumber"  target="_blank" title="새창">숫자카드 자세히보기</a></p>
				</li>
				
				<li>
					<p><input type="checkbox" class="chk" title="CGV 이벤트 자세히보기"  id="experience06"/>CGV에서 삼성카드로 영화 보기!</p>
					<p><a href="/link/index.jsp?url=EVENT?eventNo=39940"  target="_blank" title="새창">CGV 이벤트 자세히보기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="삼성카드쇼핑 바로가기"  id="experience07"/>삼성카드 쇼핑에서 감사 선물 10만원 이상 구입하기!(포인트몰, TheSocial, 모바일쿠폰몰)</p>
					<p><a href="https://shopping.samsungcard.com/ec/sp/spMain.do?method=selectSPMain"  target="_blank" title="새창">삼성카드 쇼핑 바로가기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="금융상품자세히보기"  id="experience08"/>필요할 때 힘이 되어 드리는현금서비스 또는 삼성카드론 이용하기! (10만원 이상 이용 시 참여 가능)</p>
					<p><a href="/index.do?menuId=NHPIMFSCOM001"  target="_blank" title="새창">금융상품 자세히보기</a></p>
				</li>
			</ul>
		</dd>
		<dt>함께할 때 필요한 것에 집중!</dt>
		<dd>
			<ul>
				<li>
					<p><input type="checkbox" class="chk" title="가족카드 이벤트 자세히보기"  id="experience09"/>우리 가족 모두에게도 실용적인 가족카드 발급하기!</p>
					<p><a href="/link/index.jsp?url=EVENT?eventNo=39615"  target="_blank" title="새창">가족카드 이벤트 자세히보기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="My패밀리서비스 바로가기"  id="experience10"/>가족끼리 모여 더 큰혜택, My패밀리서비스 가입하기!</p>
					<p><a href="/index.do?menuId=NHPIMSSFAM001M002"  target="_blank" title="새창">My패밀리서비스 바로가기</a></p>
				</li>
				<li>
					<p><input type="checkbox" class="chk" title="사랑의 펀드 바로가기"  id="experience11"/>따뜻한 계절, 따뜻한 마음을 전하는 사랑의 펀드 기부하기!</p>
					<p><a href="/hp/ci/ps/lfd/loveFund.do?method=viewLoveFundMain"  target="_blank" title="새창">사랑의 펀드 바로가기</a></p>
				</li>		
				<li>
					<p><input type="checkbox" class="chk" title=""  id="experience12"/>가족과 함께하는 5월,  마음도 주유도 든든하게 채워보기 (7만원 이상 결제시 참여 가능, 당사 주유업종 기준)</p>
				</li>
			</ul>
		</dd>
	</dl>
	<div ><a href=""  target="_blank" title="새창"><img src="/images/et/2013campaign/btn_apply.gif" alt="참여하기"/></a></div>
<!-- <div><a href=""  target="_blank" title="새창"><img src="/images/et/2013campaign/btn_mylevel.gif" alt="내 점수 확인하기"/></a></div>-->
<ul>
	<li>참여하기 버튼을 1회만 누르시면 이벤트대상자로 등록되며, 경험하신 항목이 자동 체크되어 점수가 산정됩니다.</li>
	<li>이메일 명세서, 웹회원, ID-Secure,My패밀리서비스는 행사기간 이전부터 가입되어 있는 경우도 경험횟수에 포함됩니다.</li><!-- 130503 수정 -->
	<li>동일한 혜택을 여러 번 경험하셔도 1회만 인정됩니다.</li>
<!-- 130425 수정 -->
	<li>당사 시스템 사정에 따라 경험한 혜택은 영업일 기준 1~2일 후에 반영되어 보여질 수 있습니다.</li>
	<li>회원님의 휴대폰번호와 등록된 휴대폰번호가 다를 경우 경품이 다른 사람에게 발송될 수 있으므로 반드시 확인해 주시기 바랍니다. <a  href="/index.do?menuId=NHPIMMHUFM001M001" target="_blank" title="새창" >휴대폰번호 확인하기 및 수정하기</a><br />(휴대폰번호가 잘못 등록되어 있거나, 1~3등 경우 통화 연결이 되지 않을 경우 담첨이 취소됩니다.)</li>
<!-- //130425 수정 -->
	<li>1~3등 당첨 시 제세공과금(22%)은 당첨 회원님 본인 부담이며, 안내해 드리는 삼성카드 계좌로 기간 내 제세공과금을 입금하시지 않을 경우 당첨이 취소됩니다.</li>
	<li>법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
</ul>
<h3>5월, 당신께 꼭 필요한 것만 모아서 드리는-2013 삼성카드 실용의 경험</h3><!-- 130425 수정 -->
<p>고객님의 라이프스타일에 맞춰 꼭 필요한 것에 집중하는, 참 실용적인 삼성카드!매일매일, 특별한 날, 함께할 때 필요한 다양한 혜택들을 경험해 보세요. <br />
<!-- 130502 수정 --> 
<A title="마이크로사이트 바로가기" onclick="window.open('/2013campaign', 'popup', 'width=980px, height=620px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" href="#">마이크로 사이트 바로가기</a>
<!-- //130502 수정 --> 
</p>
<p>카드사 및 제휴사의 사정으로 변경ㆍ중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</p>
</div>
</form>
</body>
</html>  
