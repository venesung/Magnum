<%
/*
 * Project Name: 삼성카드 웹 목표달성 이벤트
 * File Name: NHPIMETEVTVIEW371.jsp (목표달성 이벤트)
 * Author: 인투데이타시스템 소재민
 * Created on 2011. 2. 17.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.Properties" %>
<%

	//String isResult		= (String)request.getAttribute("isResult");		// 이벤트 신청 결과 페이지 여부
	String loginYN		= (String)request.getAttribute("loginYN");
	//String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");

	
	
	String item03 = (String)request.getAttribute("item03"); //선택한 선물
	String item04 = (String)request.getAttribute("item04"); //설정금액
	//String usedAmt = (String)request.getAttribute("usedAmt"); //현재까지 사용한금액
	String leftAmt = "0"; //남은 금액
	
	String approveSum = "0";
	String curApproveSum = "0";
	
	
	int intItem04 = StringUtil.StringToInteger(StringUtil.replace(item04+"0000",",","").trim()) ; 
	
	int intLeftAmt =  0;
	
	BigDecimal bigapproveSum = (BigDecimal)request.getAttribute("approveSum");
	approveSum = StringUtil.amountToString(bigapproveSum);
	
	if (intItem04 > 0 ) {
		
		
		BigDecimal bigcurApproveSum = (BigDecimal)request.getAttribute("curApproveSum");
		BigDecimal bigremainAmt = (BigDecimal)request.getAttribute("remainAmt");
		//intLeftAmt = intItem04 - StringUtil.StringToInteger(bigcurApproveSum.toString());
		
	
		//curApproveSum = StringUtil.amountToString(bigcurApproveSum.divide(divideAmtBig));
		curApproveSum = bigcurApproveSum.toString();
		leftAmt = bigremainAmt.toString();
	}
	
	//leftAmt = StringUtil.amountToString(intLeftAmt);
		
	String beginDateYN = (String)request.getAttribute("beginDateYN");
	String endDateYN = (String)request.getAttribute("endDateYN");
	String beginMsg = (String)request.getAttribute("beginMsg");
	String endMsg = (String)request.getAttribute("endMsg");
	
	String PROPERTIES_FILE_LOCATION = "properties/control/service/project.properties";
	Properties properties = new Properties();
	URL fileURL = this.getClass().getClassLoader().getResource(PROPERTIES_FILE_LOCATION);
	File file = new File(fileURL.getFile());
	properties.load(new FileInputStream(file));
	String newjusoYn = properties.getProperty("NEWJUSO_YN").trim();
	
%>


<title>신세계 백화점에서 선정한 지역 명품 특산물 콜렉션 이벤트 - 삼성카드</title>
<style type="text/css">
body, p	{margin:0; padding:0; color:#666; font:normal 12px '돋움'; line-height:16px}
img  {border:0;}

#special_gift	{position:relative; width:728px}

.giftevent_top	{width:728px; height:20px; background:url('/images/et/objective/bg_tmp_top.gif') no-repeat}
.giftevent_btm	{width:728px; height:20px; background:url('/images/et/objective/bg_tmp_btm.gif') no-repeat}
.giftevent	{height:100%; background:url('/images/et/objective/bg_tmp_mid.gif') repeat-y; padding:0 49px}

.al_center	{text-align:center}
.mb10	{margin-bottom:10px}
h1	 {margin:30px 0 15px 0; font:normal 12px '돋움'}
h1	 img	{padding-bottom:5px; padding-right:8px; vertical-align:middle}
h2	 {margin:10px 0 10px 0; padding-top:10px; font:normal 12px '돋움'}
h2.gift1	 {margin:10px 0 10px 0; padding-top:0px; font:normal 12px '돋움'}
strong	{font-weight:bold}
.t_point_org	{color:#e67e17}
.mt10	{margin-top:10px}
.mt30	{margin-top:30px}
.w640	{width:630px}

table	{width:100%; border-collapse:collapse; border-spacing:0}
th, td	 {word-break: break-all}
th	{background:#fafafa; color:#333; padding:6px 0 5px 10px; text-align:left; font:normal 12px '돋움'; border-top:1px solid #dadada; border-bottom:1px solid #dadada; line-height:18px}
td	{padding:4px 0 3px 10px; text-align:left; font:normal 12px '돋움'; border-top:1px solid #dadada; border-bottom:1px solid #dadada;  line-height:18px}

.gift_bg	{position:relative; width:630px; height:181px; background:url('/images/et/objective/bg_event_gift.jpg') no-repeat; margin-bottom:10px}
.gift_bg	img	{height:85px}
.gift_bg	.gift1	{position:absolute; top:10px; left:13px; width:133px}
.gift_bg	.gift2	{position:absolute; top:10px; left:171px; width:133px}
.gift_bg	.gift3	{position:absolute; top:10px; left:332px; width:133px}
.gift_bg	.gift4	{position:absolute; top:10px; left:494px; width:133px}
.gift_bg	.gift_tit	{position:relative; padding-left:20px; vertical-align:top; line-height:16px; height:35px; margin-top:23px; letter-spacing:-1px}
.gift_bg	.gift_tit	.gift_rdo	{position:absolute; top:0; left:0; vertical-align:top}
.gift_bg	.gift_txt	{padding-left:20px; line-height:16px; color:#e67e17; font-size:11px}

.box_white_btm	.agree_s {position:relative;width:620px; height:80px; overflow:auto; overflow-x:hidden}
.agree_s_info {width:570px; height:30px; overflow:hidden; padding:5px 8px; overflow-y:none}
.line_lgray	{width:100%; height:0; margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}

.box_white	 {position:relative; background:white url('/images/et/objective/box_white.gif') no-repeat}
.box_white	 .flag_tr	 {position:absolute; right:0; top:0; width:5px; height:5px; background-position:right top; font-size:0; line-height:0}
.box_white	 .flag_bl	 {position:absolute; left:0; bottom:0; width:5px; height:5px; background-position:left bottom; font-size:0; line-height:0}
.box_white_btm	 {padding:10px; background:url('/images/et/objective/box_white.gif') no-repeat right bottom}

.btnset	{width:100%; overflow:auto; overflow:hidden}
.btnset	.btnl	{display:inline; float:left}
.btnset	.btnr	{float:right}

.t_default	 {color:#666; font-size:12px}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}

input.rdo	{width:13px; height:13px; margin:2px; vertical-align:middle}
html:first-child	input.chk, input.rdo	{display:inline-block}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}

.input_address	{display:block; margin-top:2px} /* address */
.input_address	input.post	{width:88px; height:18px; ime-mode:active}
.input_address	img	{vertical-align:middle; padding-left:5px}
.input_address	.btn_white	{margin:0 0 0 7px}
.input_address	.detail	input	{width:200px; height:18px; margin:3px 5px 0 0}
.t_no	 {font:bold 12px 'Tahoma'}
.ls0	{letter-spacing:0}	/* 110217 */

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}

.pop_l_position	{position:absolute; left:100px; _left:100px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */

.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #245FB3; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/objective/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:20px 33px 19px 33px; vertical-align:top; z-index:513; text-align:center}	/* 110223 */
.pop_l_wrap	.pop_tit2	{padding:8px 0 10px 0; text-align:center}

.pop_l_wrap_alert	.pop_tit	{margin-bottom:0; padding-top:24px; text-align:center}

.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.btnc	{width:100%; margin:0 auto; text-align:center; margin-top:20px}
.pop_l_wrap_alert	.line_lgray	{width:100%; height:0; margin-bottom:14px; padding-bottom:7px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}
.pop_l_wrap_alert	.pop_l_content	{width:404px; text-align:center; padding-top:20px}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert	{height:55px; line-height:14px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content2	{width:404px; text-align:left; margin:0 30px;padding-top:10px}
.pop_l_wrap_alert	.pop_l_content2	.pop_l_alert	{line-height:14px; word-break:keep-all}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}

.dtable01	{border-collapse:separate; *border-collapse:collapse}
.dtable01	th	{padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #CCC; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01	th	p	{color:#333}
.dtable01	td	{padding:2px 0 1px; border-bottom:1px solid #F3F3F3; text-align:center; line-height:18px; word-break:keep-all}
.dtable01	th.cell_l10,		.dtable01	td.cell_l10	{padding-left:10px; text-align:left}
.dtable01	th.cell_r10,	.dtable01	td.cell_r10	{padding-right:10px; text-align:right}

.mt10	{margin-top:10px}
.t_point_org	{color:#e67e17}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script language="javascript" type="text/javascript">

			


	
		function applyEvent() {

					document.evtFrm.target = "applyResultFrame";

					if(!document.form2.agree(0).checked){
						alert("동의에 체크해 주세요.");
						//document.form2.agree.focus();
						return;
					} 
					
					document.evtFrm.submit();
		
					parent.eventLogin('11310');

		}
		
		function postponePop() {
			setCookie("HIPASSCASHBACK_201101", "Y", 1);
			window.close();
		}
	
		function setCookie(name, value, expiredays) {
		    var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + expiredays);
		    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		

		function cal_byte(tmpStr){
			var tmpStr;
			var temp=0;
			var onechar;
			var tcount;
			tcount = 0;

			temp = tmpStr.length;
			for (k=0;k<temp;k++)
			{
				onechar = tmpStr.charAt(k);
				if (escape(onechar) =='%0D') { } else{ tcount ++; }
			}

			if(tcount>40) {
				return false;
			}
			return true;
		}

		function pop201102() {
			window.open('/html/et/objective/pop.html','pop201102','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
		}
function applyEvent() {
		var chkCheckbox = "N";

/*if(document.form1.objectAmount.value =="000" ){
	alert('휴대폰번호를 확인해주시기 바랍니다.');
	return ;
}*/

<%
if (beginDateYN.equals("N")) {%>
		alert("<%=beginMsg%>");
		return;
<%}%>
<%if (endDateYN.equals("N")) {%>
		alert("<%=endMsg%>");
		return;
<%}%>


		for(i=0; i<20; i++){
			if(document.form1.gift1[i].checked){
				gift1 = document.form1.gift1[i].value;
				document.form1.selgift.value = gift1;
				chkCheckbox = "Y";
			}
		}

		if(chkCheckbox =="N" ){
			alert("선물을 선택하셔야 응모가 가능합니다.");
			return ;
		}
		
		
		if(document.form1.home_zip_1.value =="" ){
			alert('주소를 확인해주시기 바랍니다.');
			document.form1.home_zip_1.focus();
			return ;
		} else if (document.form1.home_zip_2.value =="") {
			alert('주소를 확인해주시기 바랍니다.');
			document.form1.home_zip_2.focus();
			return ;
		}	
		 if(document.form1.home_addr_area.value != ""  ||  document.form1.home_addr_dist.value != "" ){
			    if(!cal_byte(document.form1.home_addr_dist.value)){
				    alert("주소 상세주소 입력가능 길이를 초과하였습니다.\r\n상세주소는 한글/숫자 구분 없이 40글자까지만 입력이 가능합니다.");
				    document.form1.home_addr_dist.focus();
					return;
				}
			}	
				
		if ( document.form1.agree_info(0).checked) {
		} else {
			alert("배송동의를 선택해주시기 바랍니다.");
			document.form1.agree_info(0).focus() ;
			return;
		}	
		

		document.form1.method = "post";
		document.form1.action="/hp/im/et/evt.do?method=applyObjectiveEvent";
		document.form1.target="formhidden"
		document.form1.submit();
				
}
function resultAlert(msg) {
	if (msg=="ok") {
		
	} else if (msg=="false") {
		alert("이벤트 응모에 실패하셨습니다.");
	} else if (msg=="dup") {
		alert("이미 이벤트에 응모하셨습니다.");
	}
	location.reload();
}
function resultAlertok(msg) {
	if(msg=="1000") {
	alert("회원님께서 설정하신 목표금액은 1,000만원입니다.\n현재까지 이용금액보기를 통하여 경품 및 카드 이용금액을 확인할 수 있으며\n2011년 3월 31일까지 목표 및 선물 변경이 가능합니다.")
	} else {
	alert("회원님께서 설정하신 목표금액은 "+msg+"만원입니다.\n현재까지 이용금액보기를 통하여 경품 및 카드 이용금액을 확인할 수 있으며\n2011년 3월 31일까지 목표 및 선물 변경이 가능합니다.")
	}
	location.reload();
	
}
function chgSel() {
	for(var i=0;i<20;i++) {
		document.form1.gift1[i].disabled=true;
		document.form1.gift1[i].checked=false;
	}

	if (document.form1.objectAmount.value == "1000") {
		for(var i=0;i<4;i++) {
			document.form1.gift1[i].disabled=false;
		}
	} else if (document.form1.objectAmount.value == "500") {
		for(var i=4;i<8;i++) {
			document.form1.gift1[i].disabled=false;
		}
	} else if (document.form1.objectAmount.value == "300") {
		for(var i=8;i<12;i++) {
			document.form1.gift1[i].disabled=false;
		}		
	} else if (document.form1.objectAmount.value == "100") {
		for(var i=12;i<16;i++) {
			document.form1.gift1[i].disabled=false;
		}		
	} else if (document.form1.objectAmount.value == "50") {
		for(var i=16;i<20;i++) {
			document.form1.gift1[i].disabled=false;
		}
	} else {
		for(var i=16;i<20;i++) {
			document.form1.gift1[i].disabled=false;
		}
	}
	
}

	</script>
</head>

<body>
<%if(loginYN.equals("N")) {	%>

<div id="special_gift">
	<p><img src="/images/et/objective/event_gift_special.jpg" alt="Gift Special 지역 명품 특산물편" usemap="#gift" /></p>
</div>

<map name="gift" id="gift">
 <area shape="rect" coords="309,839,410,871" href="#" onClick="parent.eventLogin('11321');" alt="로그인" />
</map>

<%		} else {	%>
<form name="form1" method="post" action="">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value="" />
<input type="hidden" name="ActionMode" value=""/>
<div id="special_gift">
	<div class="giftevent_top">&nbsp;</div>
	<p><img src="/images/et/objective/event_gift_special_top.jpg" alt="Gift Special 지역 명품 특산물편" /></p>
	<div class="giftevent">
		<p class="al_center mb10"><a id="NHPIMETEVTVIEW380_L01" href="#" onClick="document.getElementById('id_layer').style.display='block';fnSetReturnFocusId('NHPIMETEVTVIEW380_L01','id_layer');"><img src="/images/et/objective/btn_payview.gif" alt="현재까지 이용금액 보기" /></a></p>
		<!-- 목표금액 설정 -->
		<h1><img src="/images/et/objective/h1_step01.gif" alt="STEP 01. 목표금액을 설정해주세요." />지난 2개월간 고객님의 평균 실적은 <strong class="t_point_org t_no"><%=StringUtil.replace(approveSum,".5","") %></strong>원 입니다.</h1>
		<table summary="행사기간 동안 목표 이용 금액을 설정해주세요.">
        <caption>행사기간 동안 목표 이용 금액</caption>
			<colgroup><col width="35%" /><col width="65%" /></colgroup>
			<tbody>
				<tr>
					<th>행사기간 동안 목표 이용 금액</th>
					<td>
<!-- 수정 110214 -->
						<select name="objectAmount" style="width:200px" onChange="chgSel();">
							<%if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("10000000")) {%>
							<option value = "1000">1000만원 이상</option>
							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("5000000")) {%>
							<option value = "1000">1000만원 이상</option>
							
							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("3000000")) {%>
							<option value = "1000">1000만원 이상</option>
							<option value = "500">500만원 이상</option>
							
							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("1000000")) {%>
							<option value = "1000">1000만원 이상</option>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							
							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("500000")) {%>
							<option value = "1000">1000만원 이상</option>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							<option value = "100">100만원 이상</option>
							
							<%} else {%>
							<option value = "1000">1000만원 이상</option>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							<option value = "100">100만원 이상</option>
							<option value = "50">50만원 이상</option>
							<%} %>
						</select>
<!-- // 수정 110214 -->
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 목표금액 설정 -->
		<!-- 경품선택 -->
		<h1><img src="/images/et/objective/h1_step02.gif" alt="STEP 02. 경품을 선택해 주세요." />
        <a href="#" onClick="pop201102();return false;"><img src="/images/et/objective/btn_countryview.gif" alt="지역 명품 특산물 자세히 보기" /></a></h1>
<!-- 수정 110217 -->
		<!-- 1000만원 이상 -->
		<h2 class="gift1"><img src="/images/et/objective/h2_gift_1000.gif" alt="01. 목표금액이 1000만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 경품1 -->
			<div class="gift1">
				<p><img src="/images/et/objective/img_gift1000_01.gif" alt="토판 재래굴비" /></p>
				<p class="gift_tit"><label><input type="radio" name="gift1" class="gift_rdo" value="01" title="토판 명품 재래굴비 1호 (5명) ￦750,000" />토판 재래굴비(<span class="ls0">5</span>명)<br />소비자가 : <span class="ls0">750,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품1 -->
			<!-- 경품2 -->
			<div class="gift2">
				<p><img src="/images/et/objective/img_gift1000_02.gif" alt="명품 수삼&amp;더덕" /></p>
				<p class="gift_tit"><label><input type="radio" name="gift1" class="gift_rdo" value="02" title="명품 수삼&더덕 혼합 1호 (10명) ￦300,000" />명품 수삼&amp;더덕(<span class="ls0">10</span>명)<br />소비자가 : <span class="ls0">300,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품2 -->
			<!-- 경품3 -->
			<div class="gift3">
				<p><img src="/images/et/objective/img_gift1000_03.gif" alt="삼성 기프트카드" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="03" title="삼성 기프트카드 10만원권 (20명)" />삼성 기프트카드 <br /><span class="ls0">10</span>만원권 (<span class="ls0">20</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품3 -->
			<!-- 경품4 -->
			<div class="gift4">
				<p><img src="/images/et/objective/img_gift1000_04.gif" alt="서비스포인트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="04" title="서비스포인트 50,000P (100명)" />서비스포인트<br /><span class="ls0">50,000P</span> (<span class="ls0">100</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품4 -->
		</div>
		<!-- // 1000만원 이상 -->
		<!-- 500만원 이상 -->
		<h2><img src="/images/et/objective/h2_gift_500.gif" alt="02. 목표금액이 500만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 경품1 -->
			<div class="gift1">
				<p><img src="/images/et/objective/img_gift500_01.gif" alt="제주 옥돔 세트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="11" title="제주 명품 옥돔 세트 (5명) ￦350,000" disabled="disabled"/>제주 옥돔 세트(<span class="ls0">5</span>명)<br />소비자가 : <span class="ls0">350,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품1 -->
			<!-- 경품2 -->
			<div class="gift2">
				<p><img src="/images/et/objective/img_gift500_02.gif" alt="기순도 전통 장" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="12" title="전통 장 명품 모음 (20명) ￦138,000" disabled="disabled"/>기순도 전통 장(<span class="ls0">20</span>명)<br />소비자가 : <span class="ls0">138,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품2 -->
			<!-- 경품3 -->
			<div class="gift3">
				<p><img src="/images/et/objective/img_gift500_03.gif" alt="캐시백" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="13" title="캐시백 5만원 (100명)" disabled="disabled"/>캐시백 <span class="ls0">5</span>만원 <br />(<span class="ls0">100</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품3 -->
			<!-- 경품4 -->
			<div class="gift4">
				<p><img src="/images/et/objective/img_gift500_04.gif" alt="서비스포인트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="14" title="서비스포인트 25,000P (200명)" disabled="disabled"/>서비스포인트 <br /><span class="ls0">25,000P</span> (<span class="ls0">200</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품4 -->
		</div>
		<!-- // 500만원 이상 -->
		<!-- 300만원 이상 -->
		<h2><img src="/images/et/objective/h2_gift_300.gif" alt="02. 목표금액이 300만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 경품1 -->
			<div class="gift1">
				<p><img src="/images/et/objective/img_gift300_01.gif" alt="한지함화고세트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="21" title="한지함화고세트(5명) ￦250,000" disabled="disabled"/>한지함화고세트(<span class="ls0">5</span>명)<br />소비자가 : <span class="ls0">250,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품1 -->
			<!-- 경품2 -->
			<div class="gift2">
				<p><img src="/images/et/objective/img_gift300_02.gif" alt="멸치 세트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="22" title="멸치 세트 (30명) ￦70,000" disabled="disabled"/>멸치 세트 (<span class="ls0">30</span>명)<br />소비자가 : <span class="ls0">70,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품2 -->
			<!-- 경품3 -->
			<div class="gift3">
				<p><img src="/images/et/objective/img_gift300_03.gif" alt="캐시백" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="23" title="캐시백 3만원 (150명)" disabled="disabled"/>캐시백 <span class="ls0">3</span>만원 <br />(<span class="ls0">150</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품3 -->
			<!-- 경품4 -->
			<div class="gift4">
				<p><img src="/images/et/objective/img_gift300_04.gif" alt="서비스포인트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="24" title="서비스포인트 15,000P (300명)" disabled="disabled"/>서비스포인트 <br /><span class="ls0">15,000P</span> (<span class="ls0">300</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품4 -->
		</div>
		<!-- // 300만원 이상 -->
		<!-- 100만원 이상 -->
		<h2><img src="/images/et/objective/h2_gift_100.gif" alt="04. 목표금액이 100만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 경품1 -->
			<div class="gift1">
				<p><img src="/images/et/objective/img_gift100_01.gif" alt="만전골드세트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="31" title="만전골드세트 (5명) 소비자가 ￦60,000" disabled="disabled"/>만전골드세트 (<span class="ls0">5</span>명)<br />소비자가 : <span class="ls0">60,000</span>원</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품1 -->
			<!-- 경품2 -->
			<div class="gift2">
				<p><img src="/images/et/objective/img_gift100_02.gif" alt="온누리상품권" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="32" title="온누리상품권 2만원권 (200명)" disabled="disabled"/>온누리상품권 <br /><span class="ls0">2</span>만원권 (<span class="ls0">200</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품2 -->
			<!-- 경품3 -->
			<div class="gift3">
				<p><img src="/images/et/objective/img_gift100_03.gif" alt="캐시백" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="33" title="캐시백 1만원 (250명)" disabled="disabled"/>캐시백 <span class="ls0">1</span>만원 <br />(<span class="ls0">250</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품3 -->
			<!-- 경품4 -->
			<div class="gift4">
				<p><img src="/images/et/objective/img_gift100_04.gif" alt="서비스포인트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="34" title="서비스포인트 5,000P" disabled="disabled"/>서비스포인트 <br /><span class="ls0">5,000P</span> (<span class="ls0">400</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품4 -->
		</div>
		<!-- // 100만원 이상 -->
		<!-- 50만원 이상 -->
		<h2><img src="/images/et/objective/h2_gift_50.gif" alt="05. 목표금액이 50만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 경품1 -->
			<div class="gift1">
				<p><img src="/images/et/objective/img_gift50_01.gif" alt="스타벅스" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="41" title="스타벅스 ⓜGift카드 3만원권(100명)" disabled="disabled"/>스타벅스 <span class="ls0">ⓜGift</span>카드 <span class="ls0">3</span>만원권(<span class="ls0">100</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품1 -->
			<!-- 경품2 -->
			<div class="gift2">
				<p><img src="/images/et/objective/img_gift50_02.gif" alt="온누리상품권" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="42" title="온누리상품권 1만원권 (250명)" disabled="disabled"/>온누리상품권 <br /><span class="ls0">1</span>만원권 (<span class="ls0">250</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품2 -->
			<!-- 경품3 -->
			<div class="gift3">
				<p><img src="/images/et/objective/img_gift50_03.gif" alt="캐시백" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="43" title="캐시백 5천원 (300명)" disabled="disabled"/>캐시백 <span class="ls0">5</span>천원 <br />(<span class="ls0">300</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품3 -->
			<!-- 경품4 -->
			<div class="gift4">
				<p><img src="/images/et/objective/img_gift50_04.gif" alt="서비스포인트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" value="44" title="서비스포인트 2,000P (550명)" disabled="disabled"/>서비스포인트 <br /><span class="ls0">2,000P</span> (<span class="ls0">550</span>명)</label></p>
				<p class="gift_txt"></p>
			</div>
			<!-- // 경품4 -->
		</div>
		<!-- // 50만원 이상 -->
<!-- // 수정 110217 -->
<!-- 추가 110217 -->
		<p class="t_desc04"><span class="t_default">※</span> 소비자가는 2011년 2월 기준입니다.</p>
<!-- // 추가 110217 -->
		<!-- // 경품선택 -->
		<!-- 배송지 주소 -->
		<h1><img src="/images/et/objective/h1_step03.gif" alt="STEP 03. 당첨 시 배송받으실 주소를 입력해주세요." /></h1>
		<table>
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
			<tbody>
				<tr>
					<th>배송받으실 주소</th>
					<td><p class="input_address">
                    <label><input type="text" name="home_zip_1" id="home_zip_1" maxlength="3" class="txt zip" value="" title="우편번호 앞자리" onClick="searchZipMain(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist, '<%=newjusoYn %>');" /></label>&nbsp;-&nbsp;
                    <label><input type="text" name="home_zip_2" id="home_zip_2" maxlength="3" class="txt zip" value="" title="우편번호 뒷자리" onClick="searchZipMain(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist, '<%=newjusoYn %>');" />
					<a href="javascript:searchZipMain(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist, '<%=newjusoYn %>');" id="label_work_address">
					<img src="/images/et/objective/btn_add_search.gif" alt="우편번호검색" /></a><br />
						<span class="detail"><label><input name="home_addr_area" id="home_addr_area" type="text" class="txt home_addr_area" readonly value="" title="주소" onClick="searchZipMain(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist, '<%=newjusoYn %>');"/></label>
						<label><input name="home_addr_dist" id="home_addr_dist" type="text" class="txt home_addr_dist" readonly value="" title="주소" maxlength="40" onClick="searchZipMain(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist, '<%=newjusoYn %>');"/></label>
						</p>							
					</td>

				</tr>
			</tbody>
		</table>
		<!-- // 배송지 주소 -->
		<!-- 경품배송 동의안내 -->
		<h1><img src="/images/et/objective/h1_step04.gif" alt="STEP 04. 경품 배송 동의 안내입니다." /></h1>

		<div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
			<div class="agree_s_info">
				<p>신청하신 경품 배송은 삼성카드의 제휴 배송업체에 의해 이루어집니다.<br />
					경품 배송에 필요한 정보 주소, 전화번호, 핸드폰번호가 제공 됩니다.</p>
			</div>
		</div></div>

		<div class="btnset mt10">
<!-- 수정 110214 -->
			<p class="btnl t_desc04"><span class="t_default">※</span> 제휴배송업체 : (주) 신세계</p>
<!-- // 수정 110214 -->
			<div class="btnr">
				<label for="label_agr_private_credit1"><input type="radio" class="rdo" value="" id="label_agr_private_credit1" title="약관동의" name="agree_info" /> <strong>약관동의</strong></label>
				<label for="label_agr_private_credit2"><input type="radio" class="rdo" value="" id="label_agr_private_credit2" title="동의안함" name="agree_info" checked="checked" /> 동의안함</label>
			</div>
		</div>
		<!-- // 경품배송 동의안내 -->
		<div class="line_lgray">&nbsp;</div>
        <p class="al_center"><a href="#" onClick="applyEvent();return false;"><img src="/images/et/objective/btn_app.gif" alt="응모하기/수정하기" /></a></p>
		<!-- 삼성카드 special event란? -->
		<p class="mt30"><img src="/images/et/objective/txt_giftspecial_event.gif" alt="삼성카드 Gift Special 이벤트는 삼성카드를 이요하는 회원님들께 감사의 마음을 담아 준비한 기프트 이벤트로 정기적으로 회원님을 찾아가려 합니다. 의미있는 상품으로 회원님께 최고의 가치를 제공하려 항상 노력하겠습니다." /></p>
		<!-- // 삼성카드 special event란? -->
	</div>
	<div class="giftevent_btm">&nbsp;</div>

</div>
	<div id="id_layer" class="pop_l_position pop_l_wrap_alert" style="display:none;"> 
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><label><input type="button" class="img_l_pop btn_close btn_input" onClick="this.parentNode.parentNode.style.display='none'; closeLayerPopup();" value="레이어닫기" title="삼성카드 기프트 레이어 닫기" /></label>
			<p class="pop_tit"><img src="/images/et/objective/lay_tit_giftspecial.gif" alt="삼성카드 Gift Special" /></p>
			<p class="pop_tit2"><img src="/images/et/objective/lay_tit_t01.gif" alt="제 1탄 지역 명품 특산물편" /></p>
			<div class="pop_l_content2">
				<div class="pop_l_alert">
					<p><strong>응모경품 :
					<%if (item03.equals("01")) { %> 
					토판 재래굴비
					<%} else if (item03.equals("02")) {%>
                    명품 수삼&amp;더덕
					<%} else if (item03.equals("03")) {%>
					삼성 기프트카드 10만원권 
					<%} else if (item03.equals("04")) {%>
					서비스포인트 50,000P 
					<%} else if (item03.equals("11")) {%>
					제주 옥돔 세트
					<%} else if (item03.equals("12")) {%>
					기순도 전통 장
					<%} else if (item03.equals("13")) {%>
					캐시백 5만원
					<%} else if (item03.equals("14")) {%>
					서비스포인트 25,000P 
					<%} else if (item03.equals("21")) {%>
					한지함화고세트
					<%} else if (item03.equals("22")) {%>
					멸치 세트
					<%} else if (item03.equals("23")) {%>
					캐시백 3만원
					<%} else if (item03.equals("24")) {%>
					서비스포인트 15,000P 
					<%} else if (item03.equals("31")) {%>
					만전골드세트
					<%} else if (item03.equals("32")) {%>
					온누리상품권 2만원권
					<%} else if (item03.equals("33")) {%>
					캐시백 1만원
					<%} else if (item03.equals("34")) {%>
					서비스포인트 5,000P
					<%} else if (item03.equals("41")) {%>
					스타벅스 ⓜGift카드 3만원권
					<%} else if (item03.equals("42")) {%>
					온누리상품권 1만원권
					<%} else if (item03.equals("43")) {%>
					캐시백 5천원
					<%} else if (item03.equals("44")) {%>
					서비스포인트 2,000P
					<%} %>
					</strong></p>
					<table class="dtable01 mt10" summary="목표금액, 현재까지 도달 금액, 목표달성까지 목표금액 관련정보입니다. ">
                    <caption>목표금액 정보</caption>
						<colgroup><col width="33%" /><col width="34%" /><col width="33%" /></colgroup>
						<thead>
							<tr>
								<th class="cell_l10">목표금액</th>
								<th>현재까지 도달 금액</th>
								<th class="cell_r10">목표달성까지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell_l10"><span class="t_point_org"><%=String.valueOf(item04) %></span>만원</td>
								<td><span class="t_point_org"><%=String.valueOf(curApproveSum) %></span>만원</td>
								<td class="cell_r10"><span class="t_point_org"><%=String.valueOf(leftAmt) %></span>만원</td>
							</tr>
						</tbody>
					</table>
				</div>
                <p class="btnc mt20"><a href="#" onClick="document.getElementById('id_layer').style.display='none';return false;closeLayerPopup();"><img src="/images/et/objective/btn_s_confirm.gif" alt="확인" /></a></p>
				<p class="t_desc04 mt10">목표금액은 2011년 3월 한달간 이용한 개인신용카드 이용금액(일시불+할부)입니다.</p>
			</div>
		</div>
	</div>
</form>


<%		} %>

<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈프레임"></iframe>
</body>

</html>