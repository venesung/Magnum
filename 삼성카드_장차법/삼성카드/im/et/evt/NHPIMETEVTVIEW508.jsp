<%
/*
 * Project Name: 삼성카드 Gift Special 6탄
 * File Name: NHPIMETEVTVIEW456.jsp (Gift Special 6탄 이벤트)
 * Author: 삼양데이타시스템 모정서
 * Created on 2012. 01. 27.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<%

	String loginYN		= (String)request.getAttribute("loginYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");

	String grade01 = (String)request.getAttribute("grade01");
	String grade02 = (String)request.getAttribute("grade02");
	String grade03 = (String)request.getAttribute("grade03");
	String grade04 = (String)request.getAttribute("grade04");
	String grade11 = (String)request.getAttribute("grade11");
	String grade12 = (String)request.getAttribute("grade12");
	String grade13 = (String)request.getAttribute("grade13");
	String grade14 = (String)request.getAttribute("grade14");
	String grade21 = (String)request.getAttribute("grade21");
	String grade22 = (String)request.getAttribute("grade22");
	String grade23 = (String)request.getAttribute("grade23");
	String grade24 = (String)request.getAttribute("grade24");
	String grade31 = (String)request.getAttribute("grade31");
	String grade32 = (String)request.getAttribute("grade32");
	String grade33 = (String)request.getAttribute("grade33");
	String grade34 = (String)request.getAttribute("grade34");
	String grade41 = (String)request.getAttribute("grade41");
	String grade42 = (String)request.getAttribute("grade42");
	String grade43 = (String)request.getAttribute("grade43");
	String grade44 = (String)request.getAttribute("grade44");

	String item03 = (String)request.getAttribute("item03"); //선택한 선물
	String item04 = (String)request.getAttribute("item04"); //설정금액
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

		curApproveSum = bigcurApproveSum.toString();
		if (StringUtil.StringToInteger(bigremainAmt.toString()) < 0) {
			leftAmt = "0";
		} else {
			leftAmt = bigremainAmt.toString();
		}
	}

	String beginDateYN = (String)request.getAttribute("beginDateYN");
	String endDateYN = (String)request.getAttribute("endDateYN");
	String beginMsg = (String)request.getAttribute("beginMsg");
	String endMsg = (String)request.getAttribute("endMsg");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>휴가때도 참 실용적인 삼성카드 Gift Special - 삼성카드</title>
<style type="text/css">
body, p	{margin:0; padding:0; color:#666; font:normal 12px '돋움'; line-height:16px}
img  {border:0;}

#special_gift	{position:relative; width:728px}

.giftevent_btm	{width:728px; height:20px; background:url('/html/et/spcialgift8/images/bg_tmp_btm.gif') no-repeat}
.giftevent	{height:100%; background:url('/html/et/spcialgift8/images/bg_tmp_mid.gif') repeat-y; padding:0 49px}

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

.gift_bg	{position:relative; width:630px; height:205px; background:url('/html/et/spcialgift8/images/bg_event_gift.jpg') no-repeat; margin-bottom:10px}
.gift_bg	img	{height:85px}
.gift_bg	.gift1	{position:absolute; top:10px; left:13px; width:150px}
.gift_bg	.gift2	{position:absolute; top:10px; left:171px; width:150px}
.gift_bg	.gift3	{position:absolute; top:10px; left:332px; width:150px}
.gift_bg	.gift4	{position:absolute; top:10px; left:494px; width:150px}
.gift_bg	.gift_tit	{position:relative; padding-left:15px; vertical-align:top; line-height:16px; height:55px; margin-top:23px; letter-spacing:-1px}
.gift_bg	.gift_tit	.gift_rdo	{position:absolute; top:0px; left:-3px; vertical-align:top}
.gift_bg	.gift_txt	{padding-left:15px; line-height:16px; color:#e67e17; font-size:11px}

.box_white_btm	.agree_s {position:relative;width:620px; height:80px; overflow:auto; overflow-x:hidden}
.agree_s_info {width:570px; height:30px; padding:5px 8px; } /* 110729 수정*/
.line_lgray	{width:100%; height:0; margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}

.box_white	 {position:relative; background:white url('/html/et/spcialgift8/images/box_white.gif') no-repeat}
.box_white	 .flag_tr	 {position:absolute; right:0; top:0; width:5px; height:5px; background-position:right top; font-size:0; line-height:0}
.box_white	 .flag_bl	 {position:absolute; left:0; bottom:0; width:5px; height:5px; background-position:left bottom; font-size:0; line-height:0}
.box_white_btm	 {padding:10px; background:url('/html/et/spcialgift8/images/box_white.gif') no-repeat right bottom}

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
.ls0	{letter-spacing:0}


body, p	{margin:0; padding:0; color:#666; font:normal 12px '돋움'; line-height:16px}
img  {border:0;}
strong	{font-weight:bold}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}

.pop_l_position	{position:absolute; left:40%; _left:150px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */

.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #245FB3; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/html/et/spcialgift8/images/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:20px 33px 19px 33px; vertical-align:top; z-index:513; text-align:center}	/* 110223 */
.pop_l_wrap	.pop_tit2	{padding:8px 0 10px 0; text-align:center}
.pop_l_wrap	.pop_txt	{padding:0 0 5px 0; text-align:center}

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

.dtable01	{border-collapse:separate; border-bottom:1px solid #CCC; *border-collapse:collapse}
.dtable01	th	{padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #F2f2f2; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01	th	p	{color:#333}
.dtable01	td	{padding:2px 0 1px; text-align:center; line-height:18px; word-break:keep-all}
.dtable01	td.line	{border-top:1px solid #CCC;}
.dtable01	th.cell_l10,		.dtable01	td.cell_l10	{padding-left:10px; text-align:left}
.dtable01	th.cell_r10,	.dtable01	td.cell_r10	{padding-right:10px; text-align:right}

.mt10	{margin-top:10px}
.t_point_org	{color:#e67e17}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}	/* 110223 */
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" language="javascript">
	function applyEvent() {
		document.evtFrm.target = "applyResultFrame";
		if(!document.form2.agree(0).checked){
			alert("동의에 체크해 주세요.");
			return;
		}
		document.evtFrm.submit();
		parent.eventLogin('27806');

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

		if(tcount>35) {
			return false;
		}
		return true;
	}

	function pop201202() {
		window.open('/html/et/spcialgift8/event.html','pop201205','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function applyEvent() {
		var chkCheckbox = "N";

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
				    alert("주소 상세주소 입력가능 길이를 초과하였습니다.\r\n상세주소는 한글/숫자 구분 없이 35글자까지만 입력이 가능합니다.");
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
		document.form1.action="/hp/im/et/evt.do?method=applySpecialGiftEvent8";
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
		alert("회원님께서 설정하신 목표금액은 "+msg+"만원입니다.\n목표 달성에 실패하실 경우 선택하신 선물은 물론 하위단계의 선물도 받으실 수 없습니다.\n2012년 06월 30일까지 응모내역 수정하기 버튼을 클릭하여 목표 및 선물 변경이 가능합니다")
		location.reload();
	}

	function chgSel(amount,chkFlage) {
		for(var i=0;i<20;i++) {
			document.form1.gift1[i].disabled=true;
			if(chkFlage == 1){
				document.form1.gift1[i].checked=false;
			}
		}

		if (amount == "500") {
			for(var i=0;i<4;i++) {
				document.form1.gift1[i].disabled=false;
			}
		} else if (amount == "300") {
			for(var i=4;i<8;i++) {
				document.form1.gift1[i].disabled=false;
			}
		} else if (amount == "200") {
			for(var i=8;i<12;i++) {
				document.form1.gift1[i].disabled=false;
			}
		} else if (amount == "100") {
			for(var i=12;i<16;i++) {
				document.form1.gift1[i].disabled=false;
			}
		} else if (amount == "50") {
			for(var i=16;i<20;i++) {
				document.form1.gift1[i].disabled=false;
			}
		} else {
			for(var i=16;i<20;i++) {
				document.form1.gift1[i].disabled=false;
			}
		}
	}

	function eventPayView(){
<% if("0".equals(item03) || "0".equals(item04)){ %>
		alert('이벤트에 응모하셔야 조회가 가능합니다.');
<% }else{ %>
		document.getElementById('id_layer').style.display='block';
<% } %>
	}

	function setAmount(){
		var item04 = "<%=item04%>";
		if(item04 != "0"){
			document.form1.objectAmount.value = item04;
			chgSel(item04,0);
		}
	}
	
	</script>
</head>

<body onload="setAmount();">

<form name="form1" method="post" action="">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value="" />
<input type="hidden" name="ActionMode" value="" />
<div id="special_gift">
	<!-- <div class="giftevent_top">&nbsp;</div>-->
	<p><img src="/html/et/spcialgift8/images/event_gift_special_top4.jpg" alt="미리 준비하는 가정의 달 선물 GIFT SPECIAL" /></p>	
    <div class="hidden">
        <h1>휴가때도 참 실용적인 삼성카드 Gift Special</h1>
        <p> 휴가가 기다려지는 6월 삼성카드가 드리는 특별한 선물과 함께 멋진 휴가 계획 세워 보세요.</p>
        
        <dl>
            <dt>행사기간</dt>
            <dd>2012년 6월 1일(금) - 6월 30일(토)</dd>
            <dt>행사내용</dt>
            <dd>회원님께서 직접 일시불과 할부 이용금액을 합한 목표금액을 선택하시고 행사기간 동안 정해진 목표금액 이상 이용 시 추첨을 통해 경품 증정
                <p>- 목표금액은 2012년 3,4월 일시불과 할부 이용금액을 합한 월평균 이용금액보다 많은 금액으로만 응모하실 수 있습니다.</p>
            </dd>
            <dt>당첨자 발표</dt>
            <dd>2012년 7월 13일(금) 삼성카드 홈페이지 당첨자 발표란</dd>
            <dt>포인트적립 및 경품배송일자</dt>
            <dd>2012년 7월 20일(금) 예정</dd>
            <dt>참여방법</dt>
            <dd>
                <ol>
                    <li>step1 - 자신이 원하는 선물확인</li>
                    <li>step2 - 목표금액 및 선물선택</li>
                    <li>step3 - 기간 내 목표금액 달성</li>
                    <li>step4 - 추첨 후 당첨 회원님께 선물제공</li>
                </ol>
            </dd>
        </dl>
    </div>
	
	<div class="giftevent">
        <p class="al_center mb10"><a id="NHPIMETEVTVIEW508_L01" href="#" onclick="eventPayView();fnSetReturnFocusId('NHPIMETEVTVIEW508_L01','id_layer');return false;"><img src="/html/et/spcialgift8/images/btn_payview.gif" alt="현재까지 이용금액 보기" /></a></p>
		<!-- 목표금액 설정 -->
		<h1><img src="/html/et/spcialgift8/images/h1_step01.gif" alt="STEP 01. 목표금액을 설정해주세요." />지난 2개월동안 회원님의 월평균 이용금액은 <strong class="t_point_org t_no"><%=StringUtil.replace(approveSum,".5","") %></strong>원 입니다.</h1>
		<table summary="행사기간 동안 목표 이용 금액을 선택하는 화면입니다.">
		<caption>목표금액 설정</caption>
			<colgroup><col width="35%" /><col width="65%" /></colgroup>
			<tbody>
				<tr>
					<th>행사기간 동안 목표 이용 금액</th>
					<td>
						<select name="objectAmount" style="width:200px" onchange="chgSel(this.value,1);" title="행사기간 동안 목표 이용 금액 설정">
							<%if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("3000000")) {%>
							<option value = "500">500만원 이상</option>

							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("2000000")) {%>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>

							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("1000000")) {%>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							<option value = "200">200만원 이상</option>

							<%} else if (Double.parseDouble(StringUtil.replace(approveSum,",","").trim()) >= Double.parseDouble("500000")) {%>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							<option value = "200">200만원 이상</option>
							<option value = "100">100만원 이상</option>

							<%} else {%>
							<option value = "500">500만원 이상</option>
							<option value = "300">300만원 이상</option>
							<option value = "200">200만원 이상</option>
							<option value = "100">100만원 이상</option>
							<option value = "50">50만원 이상</option>
							<%} %>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 목표금액 설정 -->
		<!-- 경품선택 -->
        <h1><img src="/html/et/spcialgift8/images/h1_step02.gif" alt="STEP 02. 경품을 선택 해주세요." /><a href="#" onclick="pop201202();"  title="새창" ><img src="/html/et/spcialgift8/images/btn_countryview2.gif" alt="경품 자세히 보기" /></a></h1>
		<!-- 500만원 이상 -->
		<h2 class="gift1"><img src="/html/et/spcialgift8/images/h2_gift_1000.gif" alt="01. 목표금액이 500만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 올림푸스 펜 E-P3 -->
			<div class="gift1">
				<p><img src="/html/et/spcialgift8/images/img_gift_0601.gif" alt="올림푸스 펜 E-P3" /></p>
				<p class="gift_tit"><label><input type="radio" title="올림푸스 펜 E-P3+14-42MM+SD 4GB(1명)" name="gift1" class="gift_rdo" value="01" <% if(item03.equals("01")){ %> checked="checked" <% } %> />올림푸스 펜 E-P3 <br /><span class="ls0">(실버) + 14-42MM</span> <br />+ SD 4GB(<span class="ls0">1</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></p>
			</div>
			<!-- // 올림푸스 펜 E-P3  -->
			<!-- 삼성전자 YEPP YP-GB70 -->
			<div class="gift2">
				<p><img src="/html/et/spcialgift8/images/img_gift_0602.gif" alt="삼성전자 YEPP YP-GB70" /></p>
				<p class="gift_tit"><label><input type="radio" title="삼성전자 YEPP YP-GB70 (갤럭시플레이어)5형 32G(3명)" name="gift1" class="gift_rdo" value="02" <% if(item03.equals("02")){ %> checked="checked" <% } %>  />삼성전자 YEPP YP-<br /> <span class="ls0">GB70 (갤럭시플레이어)</span><br />5형 32G (<span class="ls0">3</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='3' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></p>
			</div>
			<!-- // 삼성전자 YEPP YP GB70 -->
			<!-- 캐리비안베이 -->
			<div class="gift3">
				<p><img src="/html/et/spcialgift8/images/img_gift1000_03.gif" alt="캐리비안베이" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="캐리비안베이 2인 자유이용권(10명)" class="gift_rdo" value="03" <% if(item03.equals("03")){ %> checked="checked" <% } %>  />캐리비안베이 <br />2인 자유이용권 (<span class="ls0">10</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></p>
			</div>
			<!-- // 캐리비안베이 -->
			<!-- 서비스포인트 25,000P -->
			<div class="gift4">
				<p><img src="/html/et/spcialgift8/images/img_gift1000_04.gif" alt="서비스포인트 25,000P" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 25,000P(50명)" class="gift_rdo" value="04" <% if(item03.equals("04")){ %> checked="checked" <% } %>  />서비스포인트 <span class="ls0">25,000P</span> <br />(<span class="ls0">50</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 25,000P -->
		</div>
		<!-- // 500만원 이상 -->
		<!-- 300만원 이상 -->
		<h2><img src="/html/et/spcialgift8/images/h2_gift_500.gif" alt="02. 목표금액이 300만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 다이슨 에어멀티플라이어 -->
			<div class="gift1">
				<p><img src="/html/et/spcialgift8/images/img_gift_0603.gif" alt="다이슨 에어멀티플라이어" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="다이슨 에어멀티플라이어 AM-01(블루) (3명)" class="gift_rdo" value="11" <% if(item03.equals("11")){ %> checked="checked" <% } %> disabled="disabled" />다이슨<br />에어멀티플라이어 <br />AM-01(블루) (<span class="ls0">3</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='3' req_cnt='<%=String.valueOf(grade11) %>' inputCss="" /></p>
			</div>
			<!-- // 다이슨 에어멀티플라이어 -->
			<!-- 노비타 제습기(6ℓ)  -->
			<div class="gift2">
				<p><img src="/html/et/spcialgift8/images/img_gift_0604.gif" alt="노비타 제습기(6ℓ)" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="노비타 제습기(6ℓ) (10명)" class="gift_rdo" value="12" <% if(item03.equals("12")){ %> checked="checked" <% } %>  disabled="disabled" />노비타 제습기(6ℓ)<br /> (<span class="ls0">10</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade12) %>' inputCss="" /></p>
			</div>
			<!-- //노비타 제습기(6ℓ)  -->
			<!-- 콜드스톤 25,000원  아이스크림케이크 -->
			<div class="gift3">
				<p><img src="/html/et/spcialgift8/images/img_gift500_03.gif" alt="콜드스톤 25,000원  아이스크림케이크 " /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="콜드스톤 25,000원 아이스크림케이크 모바일 쿠폰 (25명)" class="gift_rdo" value="13" <% if(item03.equals("13")){ %> checked="checked" <% } %>  disabled="disabled" />콜드스톤 25,000원 <br /> 아이스크림케이크 <br/>모바일 쿠폰 (<span class="ls0">25</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='25' req_cnt='<%=String.valueOf(grade13) %>' inputCss="" /></p>
			</div>
			<!-- // 콜드스톤 25,000원  아이스크림케이크  -->
			<!-- 서비스포인트15,000P -->
			<div class="gift4">
				<p><img src="/html/et/spcialgift8/images/img_gift500_04.gif" alt="서비스포인트15,000P" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 15,000P(100명)" class="gift_rdo" value="14" <% if(item03.equals("14")){ %> checked="checked" <% } %> disabled="disabled" />서비스포인트 <span class="ls0">15,000P</span> (<span class="ls0">100</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='100' req_cnt='<%=String.valueOf(grade14) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트15,000P -->
		</div>
		<!-- // 300만원 이상 -->
		<!-- 200만원 이상 -->
		<h2><img src="/html/et/spcialgift8/images/h2_gift_300.gif" alt="02. 목표금액이 200만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!--후지필름 인스탁스 미니7 패키지 -->
			<div class="gift1">
				<p><img src="/html/et/spcialgift8/images/img_gift_0605.gif" alt="후지필름 인스탁스 미니7 패키지" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" title="후지필름 인스탁스 미니7 패키지(10명)" value="21" <% if(item03.equals("21")){ %> checked="checked" <% } %> disabled="disabled" />후지필름 인스탁스  <br />미니7 패키지 <br />(<span class="ls0">10</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade21) %>' inputCss="" /></p>
			</div>
			<!--//후지필름 인스탁스 미니7 패키지 -->
			<!-- 마이프랜드 박스펜 선풍기 -->
			<div class="gift2">
				<p><img src="/html/et/spcialgift8/images/img_gift_0606.gif" alt="마이프랜드 박스펜 선풍기" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" title="마이프랜드 박스펜 선풍기(20형, 신모델) (20명)" value="22" <% if(item03.equals("22")){ %> checked="checked" <% } %>  disabled="disabled" />마이프랜드 박스펜 <br /> 선풍기(20형, 신모델) <br /> (<span class="ls0">20</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='20' req_cnt='<%=String.valueOf(grade22) %>' inputCss="" /></p>
			</div>
			<!-- // 마이프랜드 박스펜 선풍기 -->
			<!-- 배스킨라빈스 패밀리아이스크림 -->
			<div class="gift3">
				<p><img src="/html/et/spcialgift8/images/img_gift300_03.gif" alt="배스킨라빈스 패밀리아이스크림" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" title="배스킨라빈스 패밀리아이스크림 모바일 쿠폰 (50명)" value="23" <% if(item03.equals("23")){ %> checked="checked" <% } %> disabled="disabled" />배스킨라빈스  <br />패밀리아이스크림<br /> 모바일 쿠폰 (<span class="ls0">50</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade23) %>' inputCss="" /></p>
			</div>
			<!-- // 배스킨라빈스 패밀리아이스크림 -->
			<!-- 서비스포인트 10,000 point -->
			<div class="gift4">
				<p><img src="/html/et/spcialgift8/images/img_gift300_04.gif" alt="서비스포인트 10,000 point" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 10,000P (200명)" class="gift_rdo" value="24" <% if(item03.equals("24")){ %> checked="checked" <% } %>  disabled="disabled" />서비스포인트 <span class="ls0">10,000P</span> (<span class="ls0">200</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='200' req_cnt='<%=String.valueOf(grade24) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 10,000 point -->
		</div>
		<!-- // 200만원 이상 -->
		<!-- 100만원 이상 -->
		<h2><img src="/html/et/spcialgift8/images/h2_gift_100.gif" alt="04. 목표금액이 100만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 스위스 밀리터리 라이트 여름침낭 -->
			<div class="gift1">
				<p><img src="/html/et/spcialgift8/images/img_gift_0607.gif" alt="스위스 밀리터리 라이트 여름침낭" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" class="gift_rdo" title="스위스 밀리터 라이트 여름침낭 (30명)" value="31" <% if(item03.equals("31")){ %> checked="checked" <% } %>  disabled="disabled" />스위스 밀리터 <br />라이트 여름침낭<br /> (<span class="ls0">30</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='30' req_cnt='<%=String.valueOf(grade31) %>' inputCss="" /></p>
			</div>
			<!-- // 스위스 밀리터리 라이트 여름침낭 -->
			<!-- 블루스카이 돔형텐트  -->
			<div class="gift2">
				<p><img src="/html/et/spcialgift8/images/img_gift_0608.gif" alt="블루스카이 돔형텐트" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="블루스카이 돔형텐트(2~3인용) (50명)" class="gift_rdo" value="32" <% if(item03.equals("32")){ %> checked="checked" <% } %>  disabled="disabled" />블루스카이 <br />돔형텐트(2~3인용) <br />(<span class="ls0">50</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade32) %>' inputCss="" /></p>
			</div>
			<!-- // 블루스카이 돔형텐트  -->
			<!-- 10,000원 모바일문화상품권 -->
			<div class="gift3">
				<p><img src="/html/et/spcialgift8/images/img_gift100_03.gif" alt="10,000원 모바일문화상품권" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="10,000원 모바일문화상품권 (100명)" class="gift_rdo" value="33" <% if(item03.equals("33")){ %> checked="checked" <% } %>  disabled="disabled" /><span class="ls0">10,000</span>원<br /> 모바일문화상품권 <br /> (<span class="ls0">100</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='100' req_cnt='<%=String.valueOf(grade33) %>' inputCss="" /></p>
			</div>
			<!-- // 10,000원 모바일문화상품권 -->
			<!-- 서비스포인트 5,000 point -->
			<div class="gift4">
				<p><img src="/html/et/spcialgift8/images/img_gift100_04.gif" alt="서비스포인트 5,000 point" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 5,000P (300명)" class="gift_rdo" value="34" <% if(item03.equals("34")){ %> checked="checked" <% } %>  disabled="disabled" />서비스포인트 <span class="ls0">5,000P</span><br />(<span class="ls0">300</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='300' req_cnt='<%=String.valueOf(grade34) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 5,000 point -->
		</div>
		<!-- // 100만원 이상 -->
		<!-- 50만원 이상 -->
		<h2><img src="/html/et/spcialgift8/images/h2_gift_50.gif" alt="05. 목표금액이 50만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 서비스포인트 2개월간 추가 3%적립 최대 월 30,000P -->
			<div class="gift1">
				<p><img src="/html/et/spcialgift8/images/img_gift_0611.gif" alt="서비스포인트 2개월간 추가 3%적립 최대 월 30,000P " /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 2개월동안 추가 3%적립 월 최대 30,000P (50명)" class="gift_rdo" value="41" <% if(item03.equals("41")){ %> checked="checked" <% } %>  disabled="disabled" />서비스포인트 2개월동안<br /> 추가 <span class="ls0">3</span>%적립<br />월 최대 <span class="ls0">30,000</span>P(<span class="ls0">50</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade41) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 2개월간 추가 3%적립 최대 월 30,000P -->
			<!-- 서비스포인트 2개월간 추가 1%적립 최대 월 20,000P -->
			<div class="gift2">
				<p><img src="/html/et/spcialgift8/images/img_gift_0609.gif" alt="서비스포인트 2개월간 추가 2%적립 최대 월 30,000P" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 2개월간 추가 2%적립 최대 월 30,000P (50명)" class="gift_rdo" value="42" <% if(item03.equals("42")){ %> checked="checked" <% } %>  disabled="disabled" />서비스포인트 2개월동안<br /> 추가 <span class="ls0">2</span>%적립<br /> 월 최대 <span class="ls0">20,000</span>P(<span class="ls0">50</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade42) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 2개월간 추가 2%적립 최대 월 30,000P -->
			<!-- 5,000원 모바일문화상품권 -->
			<div class="gift3">
				<p><img src="/html/et/spcialgift8/images/img_gift_0612.gif"  alt="5,000원 모바일문화상품권" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="5,000원 모바일문화상품권 (300명)" class="gift_rdo" value="43" <% if(item03.equals("43")){ %> checked="checked" <% } %>  disabled="disabled" /><span class="ls0">5,000</span>원<br />모바일문화상품권 <br />(<span class="ls0">300</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='300' req_cnt='<%=String.valueOf(grade43) %>' inputCss="" /></p>
			</div>
			<!-- // 5,000원 모바일문화상품권 -->
			<!-- 서비스포인트 3,000P  -->
			<div class="gift4">
				<p><img src="/html/et/spcialgift8/images/img_gift_0613.gif" alt="서비스포인트 3,000P" /></p>
				<p class="gift_tit"><label><input type="radio"  name="gift1" title="서비스포인트 3,000P (500명)" class="gift_rdo" value="44" <% if(item03.equals("44")){ %> checked="checked" <% } %>  disabled="disabled" />서비스포인트 <span class="ls0">3,000</span>P<br />(<span class="ls0">500</span>명)</label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='500' req_cnt='<%=String.valueOf(grade44) %>' inputCss="" /></p>
			</div>
			<!-- // 서비스포인트 3,000P  -->
		</div>
		<!-- // 50만원 이상 -->
		<!-- // 경품선택 -->
		<!-- 배송지 주소 -->
		<h1><img src="/html/et/spcialgift8/images/h1_step03.gif" alt="STEP 03. 배송받으실 주소를 입력해주세요." /></h1>
		<table summary="배송받으실 주소를 입력하실 수 있습니다.">
        	<caption>주소입력</caption>
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
			<tbody>
				<tr>
					<th>배송받으실 주소</th>
					<td>
						<p class="input_address">
                        <input type="text" name="home_zip_1" maxlength="3" class="txt post" value="" title="우편번호 앞자리" onclick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />&nbsp;-&nbsp;
                        <input type="text" name="home_zip_2" maxlength="3" class="txt post" value="" title="우편번호 뒷자리" onclick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />
						<a href="javascript:searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);">
						<img src="/html/et/spcialgift8/images/btn_add_search.gif" alt="우편번호검색" /></a><br />
						<span class="detail"><input name="home_addr_area" type="text" class="txt" readonly="readonly" value="" title="주소 상세입력" onclick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />
                        <input name="home_addr_dist" type="text" class="txt" readonly="readonly" value="" title="주소 상세입력2" maxlength="35" onclick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />
						</span>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 배송지 주소 -->
		<!-- 경품배송 동의안내 -->
		<h1><img src="/html/et/spcialgift8/images/h1_step04.gif" alt="STEP 04. 경품 배송 동의 안내입니다." /></h1>
		<div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
			<div class="agree_s_info">
				<p>당첨되신 경품의 배송은 삼성카드의 제휴 배송업체(STM NET, 쿠프마케팅)에 의해 이루어 집니다.<br /><!-- 120611 수정 -->
					경품 배송에 필요한 정보 주소, 전화번호, 핸드폰번호가 제공 됩니다.</p>
			</div>
		</div></div>

		<div class="btnset mt10">
			<div class="btnr">
				<label for="label_agr_private_credit1"><input type="radio" class="rdo" value="" id="label_agr_private_credit1" name="agree_info" /><strong> 동의함</strong></label>
				<label for="label_agr_private_credit2"><input type="radio" class="rdo" value="" id="label_agr_private_credit2" name="agree_info" checked="checked"/>동의안함</label>
			</div>
		</div>
		<!-- // 경품배송 동의안내 -->
		<div class="line_lgray">&nbsp;</div>
		<%if(loginYN.equals("N")) {	%>
		<p class="al_center"><a href="#" onclick="parent.eventLogin('27806');return false;"><img src="/html/et/spcialgift8/images/btn_app.gif" alt="응모하기" /></a></p>
		<%		} else {	%>
		<% if("0".equals(item03) || "0".equals(item04)){ %>
        <p class="al_center"><a href="#" onclick="applyEvent();return false;"><img src="/html/et/spcialgift8/images/btn_app.gif" alt="응모하기" /></a></p>
		<% }else{ %>
        <p class="al_center"><a href="#" onclick="applyEvent();return false;"><img src="/html/et/spcialgift8/images/btn_modify.gif" alt="수정하기" /></a></p>
		<% } %>
		<% } %>
		<!-- 삼성카드 special event란? -->
		<p class="mt30"><img src="/html/et/spcialgift8/images/txt_giftspecial_event2.gif" alt="삼성카드 Gift Special 이벤트는 삼성카드를 이용하시는 회원님들께 감사의 마음을 담아 준비한 이벤트로, 정기적으로 회원님을 찾아가려 합니다. 의미있는 상품으로 회원님께 최고의 가치를 제공하려 항상 노력하겠습니다." /></p>
		<!-- // 삼성카드 special event란? -->
	</div>
	<div class="giftevent_btm">&nbsp;</div>

</div>

	<div id="id_layer" class="pop_l_position pop_l_wrap_alert" style="display:none;">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p>
			<p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p>
			<input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeLayerPopup();" value="레이어닫기" title="삼성카드 기프트 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/spcialgift8/images/lay_tit_giftspecial.gif" alt="삼성카드 Gift Special" /></p>
			<p class="pop_tit2"><img src="/html/et/spcialgift8/images/lay_tit_winter4.gif" alt="제7탄 온 가족 만족 선물 " /></p>
			<p class="pop_txt">회원님께서 목표금액을 달성 하시고 선택하신 경품도 받아가세요!</p>
			<div class="pop_l_content2">
				<div class="pop_l_alert">
					<p><strong>이용금액 안내</strong></p>
					<table class="dtable01 mt10" summary="목표금액, 현재까지 도달 금액, 목표달성까지 등 목표금액 정보를 확인하실 수 있습니다.">
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
							<tr>
								<td colspan="3" class="line"><strong>응모경품 :
									<%if (item03.equals("01")) { %>
									올림푸스 펜 E-P3 (1명)
									<%} else if (item03.equals("02")) {%>
									삼성전자 YEPP YP-GB70 (3명)
									<%} else if (item03.equals("03")) {%>
									캐리비안베이 (10명)
									<%} else if (item03.equals("04")) {%>
									서비스포인트 25,000P (50명)
									<%} else if (item03.equals("11")) {%>
									다이슨 에어멀티플라이어 (3명)
									<%} else if (item03.equals("12")) {%>
									노비타 제습기(6ℓ) (10명)
									<%} else if (item03.equals("13")) {%>
									콜드스톤 25,000원  아이스크림케이크  (25명)
									<%} else if (item03.equals("14")) {%>
									서비스포인트 15,000P (100명)
									<%} else if (item03.equals("21")) {%>
									후지필름 인스탁스 미니7 패키지 (10명)
									<%} else if (item03.equals("22")) {%>
									마이프랜드 박스펜 선풍기 (20명)
									<%} else if (item03.equals("23")) {%>
									배스킨라빈스 패밀리아이스크림 (50명)
									<%} else if (item03.equals("24")) {%>
									서비스포인트 10,000P (200명)
									<%} else if (item03.equals("31")) {%>
									스위스 밀리터리 라이트 여름침낭 (30명)
									<%} else if (item03.equals("32")) {%>
									블루스카이 돔형텐트 (50명)
									<%} else if (item03.equals("33")) {%>
									10,000원 모바일문화상품권 (100명)
									<%} else if (item03.equals("34")) {%>
									서비스포인트 5,000P (300명)
									<%} else if (item03.equals("41")) {%>
									서비스포인트 2개월간 추가 3%적립 최대 월 30,000P (50명)
									<%} else if (item03.equals("42")) {%>
									서비스포인트 2개월간 추가 2%적립 최대 월 30,000P (50명)
									<%} else if (item03.equals("43")) {%>
									5,000원 모바일문화상품권 (300명)
									<%} else if (item03.equals("44")) {%>
									서비스포인트 3,000P (500명)
									<%} %>
								</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="btnc mt20"><a href="#" onclick="document.getElementById('id_layer').style.display='none';closeLayerPopup();"><img src="/html/et/spcialgift8/images/btn_s_confirm.gif" alt="확인" /></a></p>
			</div>
		</div>
	</div>

</div>
</form>




<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈 프레임"></iframe>
</body>

</html>

