<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<%

	String loginYN		= (String)request.getAttribute("loginYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");
	String cmsSeq		= (String)request.getAttribute("eventEtc1");	// ITCMEVENTTT.CMS_SEQ

	String grade01 = StringUtil.nvlTo0((String)request.getAttribute("grade01"));
	String grade02 = StringUtil.nvlTo0((String)request.getAttribute("grade02"));
	String grade03 = StringUtil.nvlTo0((String)request.getAttribute("grade03"));
	String grade04 = StringUtil.nvlTo0((String)request.getAttribute("grade04"));
	String grade11 = StringUtil.nvlTo0((String)request.getAttribute("grade11"));
	String grade12 = StringUtil.nvlTo0((String)request.getAttribute("grade12"));
	String grade13 = StringUtil.nvlTo0((String)request.getAttribute("grade13"));
	String grade14 = StringUtil.nvlTo0((String)request.getAttribute("grade14"));
	String grade21 = StringUtil.nvlTo0((String)request.getAttribute("grade21"));
	String grade22 = StringUtil.nvlTo0((String)request.getAttribute("grade22"));
	String grade23 = StringUtil.nvlTo0((String)request.getAttribute("grade23"));
	String grade24 = StringUtil.nvlTo0((String)request.getAttribute("grade24"));
	String grade31 = StringUtil.nvlTo0((String)request.getAttribute("grade31"));
	String grade32 = StringUtil.nvlTo0((String)request.getAttribute("grade32"));
	String grade33 = StringUtil.nvlTo0((String)request.getAttribute("grade33"));
	String grade34 = StringUtil.nvlTo0((String)request.getAttribute("grade34"));
	String grade41 = StringUtil.nvlTo0((String)request.getAttribute("grade41"));
	String grade42 = StringUtil.nvlTo0((String)request.getAttribute("grade42"));
	String grade43 = StringUtil.nvlTo0((String)request.getAttribute("grade43"));
	String grade44 = StringUtil.nvlTo0((String)request.getAttribute("grade44"));

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>열두번째 기프트스페셜 - 삼성카드</title>
<style type="text/css">

body, p	{margin:0; padding:0; color:#666; font:normal 12px '돋움'; line-height:16px}
img  {border:0;}

#special_gift	{position:relative; width:728px}

.giftevent_btm	{width:728px; height:65px; background:url('/images/et/giftspecial12/bg_tmp_btm.gif') no-repeat}
.giftevent	{height:100%; background:url('/images/et/giftspecial12/bg_tmp_mid.gif') repeat-y; padding:0 40px}

.al_center	{text-align:center}
.mb10	{margin-bottom:10px}
h1	 {margin-bottom: 15px; padding-top: 20px; font:normal 12px '돋움'}
h1	 img	{padding-bottom:5px; padding-right:3px; vertical-align:middle}
h2	 {margin:10px 0 10px 0; padding-top:10px; font:normal 12px '돋움'}
h2.gift1	 {margin:10px 0 10px 0; padding-top:0px; font:normal 12px '돋움'}
strong	{font-weight:bold}
.t_point_org	{color: #d14900}
.mt10	{margin-top:10px}
.mt30	{margin-top:30px}
.mt60	{margin-top:60px}
.mb55	{margin-bottom:55px}
.w640	{width:630px}

table	{width:100%; border-collapse:collapse; border-spacing:0}
th, td	 {word-break: break-all}
th	{color:#333; padding:6px 0 5px 10px; text-align:left; font:normal 12px '돋움'; border:1px solid #dadada; line-height:18px}
td	{padding:4px 0 3px 10px; text-align:left; font:normal 12px '돋움'; border-top:1px solid #dadada; border-bottom:1px solid #dadada;  line-height:18px}

.gift_bg	{position:relative; width:648px; height:200px; background:url('/images/et/giftspecial12/bg_event_gift.jpg') no-repeat;}
.gift_bg	img	{}
.gift_bg	.gift1	{position:absolute; top: 1px; left: 1px; width:160px}
.gift_bg	.gift2	{position:absolute; top: 1px; left:162px; width:160px}
.gift_bg	.gift3	{position:absolute; top: 1px; left:324px; width:160px}
.gift_bg	.gift4	{position:absolute; top: 1px; left:486px; width:160px}
.gift_bg	.gift_tit	{position:relative; padding-left:17px; vertical-align:top; line-height:16px; height:55px; margin-top:15px; margin-left: 13px;}
.gift_bg	.gift_tit	.gift_rdo	{position:absolute; top:0px; left:-3px; vertical-align:top}
.gift_bg	.gift_txt	{margin-left:30px; line-height:16px; color:#d14900; font-size:12px}

.box_white_btm	.agree_s {position:relative;width:620px; height:80px; overflow:auto; overflow-x:hidden}
.agree_s_info {width:570px; height:30px; padding:5px 8px; } /* 110729 수정*/
.line_lgray	{width:100%; height:0; margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}

.box_white	 {position:relative; background: url('/images/et/giftspecial12/box_white.gif') no-repeat}
.box_white	 .flag_tr	 {position:absolute; right:0; top:0; width:5px; height:5px; background-position:right top; font-size:0; line-height:0}
.box_white	 .flag_bl	 {position:absolute; left:0; bottom:0; width:5px; height:5px; background-position:left bottom; font-size:0; line-height:0}
.box_white_btm	 {padding:10px; background:url('/images/et/giftspecial12/box_white.gif') no-repeat right bottom}

.btnset	{width:100%; overflow:auto; overflow:hidden}
.btnset	.btnl	{display:inline; float:left}
.btnset	.btnr	{float:right}

.t_default	 {color:#666; font-size:12px}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.t_black{color: #333;}

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

strong	{font-weight:bold; color: #333;}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.pop_l_position	{position:absolute; left:40%; _left:480px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */

.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #245FB3; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/giftspecial12/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:20px 33px 19px 33px; vertical-align:top; z-index:513; text-align:center}	/* 110223 */
.pop_l_wrap	.pop_tit2	{padding:20px 0 5px 0; text-align:center}
.pop_l_wrap	.pop_txt	{padding:0 0 5px 0; text-align:center}

.pop_l_wrap_alert	.pop_tit	{margin-bottom:0; padding-top:30px; text-align:center}

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
.dtable01	th	{padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #F2f2f2; color:#333; font:normal 12px "돋움"; line-height:14px; text-align:center;}
.dtable01	th	p	{color:#333}
.dtable01	td	{padding:2px 0 1px; text-align:center; line-height:18px; word-break:keep-all}
.dtable01	td.line	{border-top:1px solid #CCC;}
.dtable01	th.cell_l10,		.dtable01	td.cell_l10	{padding-left:10px; text-align:left}
.dtable01	th.cell_r10,	.dtable01	td.cell_r10	{padding-right:10px; text-align:right}


.mt10	{margin-top:10px}
.t_point_org	{color:#d04900}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}	/* 110223 */
.mt20	{margin-top:20px}
.t_point {color:#000}
.conts_hidden {font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
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

	function popGiftList() {
		window.open('/html/et/specialGift12_List.html','specialGift12_List','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function applyEvent() {
		var chkCheckbox = "N";
		if(parent.event_check()){
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
	
	
			if ((document.form1.gift1[2].checked) ||
					(document.form1.gift1[3].checked) ||
					(document.form1.gift1[6].checked) ||
				    (document.form1.gift1[7].checked) ||
				    (document.form1.gift1[10].checked) ||
				    (document.form1.gift1[11].checked) ||
				    (document.form1.gift1[13].checked) ||
				    (document.form1.gift1[14].checked) ||
				    (document.form1.gift1[15].checked) ||
				    (document.form1.gift1[18].checked) ||
				    (document.form1.gift1[19].checked)) {
			} else {
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
			}	
	
			if ((document.form1.gift1[2].checked) ||
				(document.form1.gift1[3].checked) ||
				(document.form1.gift1[6].checked) ||
			    (document.form1.gift1[7].checked) ||
			    (document.form1.gift1[10].checked) ||
			    (document.form1.gift1[11].checked) ||
			    (document.form1.gift1[13].checked) ||
			    (document.form1.gift1[14].checked) ||
			    (document.form1.gift1[15].checked) ||
			    (document.form1.gift1[18].checked) ||
			    (document.form1.gift1[19].checked)) {
			} else { 	    
				if ( document.form1.agree_info(0).checked) {
				} else {
					alert("배송동의를 선택해주시기 바랍니다.");
					document.form1.agree_info(0).focus() ;
					return;
				}
			}
			
			document.form1.method = "post";
			document.form1.action="/hp/im/et/evt003.do?method=applySpecialGiftEvent12";
			document.form1.target="formhidden"
			document.form1.submit();
		}
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
		alert("회원님께서 설정하신 목표금액은 "+msg+"만원입니다.\n목표 달성에 실패하실 경우 선택하신 선물은 물론 하위단계의 선물도 받으실 수 없습니다.\n2013년 5월 31일까지 응모내역 수정하기 버튼을 클릭하여 목표 및 선물 변경이 가능합니다")
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
			if(chkFlage == 1) document.form1.gift1[0].focus(); 
		} else if (amount == "300") {
			for(var i=4;i<8;i++) {
				document.form1.gift1[i].disabled=false;
			}
			if(chkFlage == 1) document.form1.gift1[4].focus(); 
		} else if (amount == "200") {
			for(var i=8;i<12;i++) {
				document.form1.gift1[i].disabled=false;
			}
			document.form1.gift1[8].focus(); 
		} else if (amount == "100") {
			for(var i=12;i<16;i++) {
				document.form1.gift1[i].disabled=false;
			}
			if(chkFlage == 1) document.form1.gift1[12].focus(); 
		} else if (amount == "50") {
			for(var i=16;i<20;i++) {
				document.form1.gift1[i].disabled=false;
			}
			if(chkFlage == 1) document.form1.gift1[16].focus(); 
		} else {
			for(var i=16;i<20;i++) {
				document.form1.gift1[i].disabled=false;
			}
			if(chkFlage == 1) document.form1.gift1[16].focus(); 
		}
	}

	function eventPayView(){
		<% if("0".equals(item03) || "0".equals(item04)){ %>
				alert('이벤트에 응모하셔야 조회가 가능합니다.');
		<% }else if(String.valueOf(leftAmt).equals("0") ){ %>
				document.getElementById('id_layer1').style.display='block';
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

<body onLoad="setAmount();">

<form name="form1" method="post">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value="" />
<input type="hidden" name="ActionMode" value="" />
<input type="hidden" name="eventNo" value="${eventNo}" />
<input type="hidden" name="cmsSeq" value="${cmsSeq}" />

<h1 class="conts_hidden">열두번째 기프트스페셜</h1>

<div id="special_gift">
		<p><img src="/images/et/giftspecial12/event_gift_special_12.jpg" alt="가족과 함께라면, 행운도 함께합니다! GIFT Special 가장 소중한 건 가족이라 말하는 당신께- 가족모두가 즐거워할, 행운 가득 선물을 드립니다." /></p>
	
		<div class="conts_hidden">
			<h2>행사기간</h2>
			<p>2013년 4월 15일(월) ~ 5월 31일(금)</p>
			<h2>행사내용</h2>
			<p>
				회원님께서 직접 원하시는 선물과 목표금액을 선택하시고 행사기간 동안 정해진 목표금액 이상 이용 시 추첨을 통해 선물 증정
				- 목표금액은 2013년 2~3월 월평균 일시불 및 할부 이용금액보다 높은 금액으로만 응모하실 수 있습니다.
			</p>
			<h2>당첨자발표</h2>
			<p>2013년 6월 12일(수) 삼성카드 홈페이지 이벤트 당첨자발표란</p>
			<h2>포인트적립 및 경품 배송</h2>
			<p>2013년 6월 19일(수) 예정</p>
			<h2>참여방법</h2>
			<ol>
				<li>자신이 원하는 선물 확인</li>
				<li>목표금액 및 선물 선택</li>
				<li>기간 내 목표금액 달성</li>
				<li>추첨 후 당첨 회원님께 선물 제공</li>
			</ol>
		</div>	
	
	<div class="giftevent">
		<p class="al_center mb10"><a id="NHPIMETEVTVIEW571_L01" href="#" onClick="eventPayView();fnSetReturnFocusId('NHPIMETEVTVIEW571_L01','id_layer1');"><img src="/images/et/giftspecial12/btn_payview.gif" alt="현재까지 이용금액 보기" /></a></p>
		<br/><br/><br/>
		<!-- 목표금액 설정 -->
		<h1 ><img src="/images/et/giftspecial12/h1_step02.gif" alt="STEP 01. 목표금액을 설정해주세요." />지난 2개월동안 회원님의 월평균 이용금액은 <strong class="t_point_org t_no"><%=StringUtil.replace(approveSum,".5","") %></strong>원 입니다.</h1>
		<table summary="목표금액을 설정하는 화면입니다.">
		<caption>목표금액 설정</caption>
			<colgroup><col width="35%" /><col width="65%" /></colgroup>
			<tbody>
				<tr>
					<th scope="row">행사기간 동안 목표 이용 금액</th>
					<td>
						<select name="objectAmount" style="width:200px" onChange="chgSel(this.value,1);" title="행사기간 동안 목표 이용 금액">
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
		<h1><img src="/images/et/giftspecial12/h1_step01.gif" alt="STEP 01. 경품을 선택 헤주세요." />&nbsp;&nbsp;<a href="#" onClick="popGiftList();"><img src="/images/et/giftspecial12/btn_countryview2.gif" alt="경품 자세히 보기" /></a></h1>

		<!-- 500만원 이상 -->
		<h2 class="gift1"><img src="/images/et/giftspecial12/h2_gift_500.gif" alt="01. 목표금액이 500만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 삼성 스마트에어컨 -->
			<div class="gift1">
				<p><img src="/images/et/giftspecial12/img_gift_1001.gif" alt="삼성 스마트에어컨" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="01" <% if(item03.equals("01")){ %> checked="checked" <% } %>  title="삼성 스마트에어컨" />삼성 스마트에어컨<br />Q9000<br/>(AF15FVFH1WK) <span class="t_black">(1명)</span></label></p>
<%-- 				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></p> --%>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=grade01%>' inputCss="" /></p>
			</div>
			<!-- // 삼성 스마트에어컨  -->
			<!-- 삼성 ATIV 스마트PC -->
			<div class="gift2">
				<p><img src="/images/et/giftspecial12/img_gift_1002.gif" alt="삼성 ATIV 스마트PC" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="02" <% if(item03.equals("02")){ %> checked="checked" <% } %> title="삼성 ATIV 스마트PC" />삼성 ATIV 스마트PC<br />(XQ701T1C-A301Z)<br /><span class="t_black">(2명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></p>
			</div>
			<!-- // 삼성 ATIV 스마트PC -->
			<!-- 50,000원 캐시백 -->
			<div class="gift3">
				<p><img src="/images/et/giftspecial12/img_gift_1021.gif" alt="50,000원 캐시백" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="03" <% if(item03.equals("03")){ %> checked="checked" <% } %> title="50,000원 캐시백" />50,000원 캐시백<br /><span class="t_black">(10명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></p>
			</div>
			<!-- // 50,000원 캐시백 -->
			<!-- 30,000 포인트 -->
			<div class="gift4">
				<p><img src="/images/et/giftspecial12/img_gift_1004.gif" alt="30,000 포인트" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="04" <% if(item03.equals("04")){ %> checked="checked" <% } %> title="30,000 포인트" />30,000 포인트<br /><span class="t_black">(30명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='30' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></p>
			</div>
		</div>
		<!-- // 500만원 이상 -->

		<!-- 300만원 이상 -->
		<h2><img src="/images/et/giftspecial12/h2_gift_300.gif" alt="02. 목표금액이 300만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 삼성 스마트TV 50인치 -->
			<div class="gift1">
				<p><img src="/images/et/giftspecial12/img_gift_1005.gif" alt="삼성 스마트TV 50인치" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="11" <% if(item03.equals("11")){ %> checked="checked" <% } %>  title="삼성 스마트TV 50인치" disabled="disabled" />삼성 스마트TV 50인치<br />LED TV UN50ES6350F<br /><span class="t_black">(1명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade11) %>' inputCss="" /></p>
			</div>
			<!-- // 삼성 스마트TV 50인치 -->
			<!-- 삼성 갤럭시카메라 -->
			<div class="gift2">
				<p><img src="/images/et/giftspecial12/img_gift_1006.gif" alt="삼성 갤럭시카메라" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="12" <% if(item03.equals("12")){ %> checked="checked" <% } %> title="삼성 갤럭시카메라" disabled="disabled" />삼성 갤럭시카메라<br />EK-GC110ZWAKOO<br />WiFi <span class="t_black">(2명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade12) %>' inputCss="" /></p>
			</div>
			<!-- // 삼성 갤럭시카메라 -->
			<!-- 30,000원 캐시백 -->
			<div class="gift3">
				<p><img src="/images/et/giftspecial12/img_gift_1003.gif" alt="30,000원 캐시백" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="13" <% if(item03.equals("13")){ %> checked="checked" <% } %> title="30,000원 캐시백"  disabled="disabled" />30,000원 캐시백<br /><span class="t_black">(30명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='30' req_cnt='<%=String.valueOf(grade13) %>' inputCss="" /></p>
			</div>
			<!-- // 30,000원 캐시백 -->
			<!-- 20,000 포인트 -->
			<div class="gift4">
				<p><img src="/images/et/giftspecial12/img_gift_1007.gif" alt="20,000 포인트" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="14" <% if(item03.equals("14")){ %> checked="checked" <% } %> title="20,000 포인트"  disabled="disabled" />20,000 포인트<br /><span class="t_black">(50명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(grade14) %>' inputCss="" /></p>
			</div>
		</div>
		<!-- // 300만원 이상 -->
		
		<!-- 200만원 이상 -->
		<h2><img src="/images/et/giftspecial12/h2_gift_200.gif" alt="02. 목표금액이 200만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 삼성 지펠 냉장고 -->
			<div class="gift1">
				<p><img src="/images/et/giftspecial12/img_gift_1008.gif" alt="삼성 지펠 냉장고" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="21" <% if(item03.equals("21")){ %> checked="checked" <% } %> title="삼성 지펠 냉장고" disabled="disabled" />삼성 지펠 냉장고<br />RS75EEALCSA<br /><span class="t_black">(1명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade21) %>' inputCss="" /></p>
			</div>
			<!--// 삼성 지펠 냉장고 -->
			<!-- 뉴 타프빅돔(오토캠핑) -->
			<div class="gift2">
				<p><img src="/images/et/giftspecial12/img_gift_1009.gif" alt="뉴 타프빅돔(오토캠핑)" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="22" <% if(item03.equals("22")){ %> checked="checked" <% } %> title="뉴 타프빅돔(오토캠핑)"  disabled="disabled" />[KOVEA] 홈쇼핑 상품<br />뉴 타프빅돔(오토캠핑)<br />텐트 KL8MT0101 <span class="t_black">(2명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade22) %>' inputCss="" /></p>
			</div>
			<!-- // 뉴 타프빅돔(오토캠핑) -->
			<!-- 20,000원 캐시백 -->
			<div class="gift3">
				<p><img src="/images/et/giftspecial12/img_gift_1010.gif" alt="20,000원 캐시백" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="23" <% if(item03.equals("23")){ %> checked="checked" <% } %> title="20,000원 캐시백"  disabled="disabled" />20,000원 캐시백<br /><span class="t_black">(40명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='40' req_cnt='<%=String.valueOf(grade23) %>' inputCss="" /></p>
			</div>
			<!-- // 20,000원 캐시백 -->
			<!-- 10,000 포인트-->
			<div class="gift4">
				<p><img src="/images/et/giftspecial12/img_gift_1011.gif" alt="10,000 포인트" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="24" <% if(item03.equals("24")){ %> checked="checked" <% } %> title="10,000 포인트" disabled="disabled" />10,000 포인트<br /><span class="ls0">(80명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='80' req_cnt='<%=String.valueOf(grade24) %>' inputCss="" /></p>
			</div>
		</div>
		<!-- // 200만원 이상 -->
		
		<!-- 100만원 이상 -->
		<h2><img src="/images/et/giftspecial12/h2_gift_100.gif" alt="04. 목표금액이 100만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- SR 20130415 일반영  시작-->
			<!-- 신세계상품권 50,000원 -->
			<div class="gift1">
				<p><img src="/images/et/giftspecial12/img_gift_1012.gif" alt="삼성 스마트 탱고" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="31" <% if(item03.equals("31")){ %> checked <% } %> title="삼성 스마트 탱고"  disabled="disabled" />삼성 스마트 탱고<br />로봇청소기<br />VC-RM72VS <span class="ls0">(1명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade31) %>' inputCss="" /></p>
			</div>
			<!-- 도미노피자 -->
			<div class="gift2">
				<p><img src="/images/et/giftspecial12/img_gift_1013.gif" alt="필립스 에어프라이어" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="32" <% if(item03.equals("32")){ %> checked <% } %> title="필립스 에어프라이어 "  disabled="disabled" />필립스 에어프라이어 <br />튀김기 HD9220<br /><span class="ls0">(2명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade32) %>' inputCss="" /></p>
			</div>
			<!-- CJ 모바일상품권 -->
			<div class="gift3">
				<p><img src="/images/et/giftspecial12/img_gift_1014.gif" alt="10,000원 캐시백" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="33" <% if(item03.equals("33")){ %> checked <% } %> title="10,000원 캐시백"  disabled="disabled" />10,000원 캐시백<br /><span class="ls0">(80명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='80' req_cnt='<%=String.valueOf(grade33) %>' inputCss="" /></p>
			</div>
			<!-- 5,000 서비스포인트 -->
			<div class="gift4">
				<p><img src="/images/et/giftspecial12/img_gift_1015.gif" alt="5,000 포인트" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="34" <% if(item03.equals("34")){ %> checked <% } %>  title="5,000 포인트"  disabled="disabled" />5,000 포인트<br /><span class="ls0">(150명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='150' req_cnt='<%=String.valueOf(grade34) %>' inputCss="" /></p>
			</div>
			<!-- SR 20130415 일반영 종료 -->
		</div>
		<!-- // 100만원 이상 -->

		<!-- 50만원 이상 -->
		<h2><img src="/images/et/giftspecial12/h2_gift_50.gif" alt="05. 목표금액이 50만원 이상인 경우" /></h2>
		<div class="gift_bg">
			<!-- 아이리버 FullHD -->
			<div class="gift1">
				<p><img src="/images/et/giftspecial12/img_gift_1016.gif" alt="아이리버 FullHD" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="41" <% if(item03.equals("41")){ %> checked="checked" <% } %> title="아이리버 FullHD" disabled="disabled" />아이리버 FullHD<br />블랙박스 X750 2CH <br />8G + 상시케이블 <span class="t_black">(1명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade41) %>' inputCss="" /></p>
			</div>
			<!-- // 아이리버 FullHD -->
			<!-- 필립스 소닉케어 -->
			<div class="gift2">
				<p><img src="/images/et/giftspecial12/img_gift_1018.gif" alt="필립스 소닉케어" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="42" <% if(item03.equals("42")){ %> checked="checked" <% } %>title="필립스 소닉케어" disabled="disabled" />필립스 소닉케어<br />FlexCare 충전식 <br />음파칫솔 HX6932 <span class="t_black">(2명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='2' req_cnt='<%=String.valueOf(grade42) %>' inputCss="" /></p>
			</div>
			<!-- // 필립스 소닉케어 -->
			<!-- 5,000원 캐시백 -->
			<div class="gift3">
				<p><img src="/images/et/giftspecial12/img_gift_1020.gif" alt="5,000원 캐시백" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="43" <% if(item03.equals("43")){ %> checked="checked" <% } %>title="5,000원 캐시백" disabled="disabled" />5,000원 캐시백<br /><span class="ls0">(100명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='100' req_cnt='<%=String.valueOf(grade43) %>' inputCss="" /></p>
			</div>
			<!-- // 5,000원 캐시백 -->
			<!-- 3,000 포인트 -->
			<div class="gift4">
				<p><img src="/images/et/giftspecial12/img_gift_1019.gif" alt="3,000 포인트" /></p>
				<p class="gift_tit"><label><input type="radio" id="gift1" name="gift1" class="gift_rdo" value="44" <% if(item03.equals("44")){ %> checked="checked" <% } %> title="3,000 포인트" disabled="disabled" />3,000 포인트<br /><span class="ls0">(200명)</span></label></p>
				<p class="gift_txt"><fileTag:emzCommon pdt_cnt='200' req_cnt='<%=String.valueOf(grade44) %>' inputCss="" /></p>
			</div>
		</div>
		<!-- // 경품선택 -->
		
		<!-- 배송지 주소 -->
		<h1><img src="/images/et/giftspecial12/h1_step03.gif" alt="STEP 03. 배송받으실 주소를 입력해주세요." /></h1>
		<table summary="배송받으실 주소를 입력하는 화면입니다.">
		<caption>배송주소 입력</caption>
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
			<tbody>
				<tr>
					<th scope="row">배송받으실 주소</th>
					<td>
						<p class="input_address">
						<!-- 20130411 웹접근성(장차법)  onfocus="this.blur()" 제거-->
						<input type="text" name="home_zip_1" maxlength="3" class="txt post" value="" title="우편번호 앞자리" onClick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />&nbsp;-&nbsp;
						<input type="text" name="home_zip_2" maxlength="3" class="txt post" value="" title="우편번호 뒷자리" onClick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" />
						<a href="javascript:searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);" title="새창">
						<img src="/html/et/spcialgift11/images/btn_add_search.gif" alt="우편번호검색" /></a><br />
						<span class="detail"><input name="home_addr_area" type="text" class="txt" readonly="readonly" value="" title="주소" onClick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);"/>
						<input name="home_addr_dist" type="text" class="txt" readonly="readonly" value="" title="주소 상세입력" maxlength="35" onClick="searchZip(form1.home_zip_1, form1.home_zip_2, form1.home_zip_seq, form1.home_addr_area, form1.home_addr_dist);"/>
						</span>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 배송지 주소 -->
		<!-- 경품배송 동의안내 -->
		<h1><img src="/images/et/giftspecial12/h1_step04.gif" alt="STEP 04. 경품 배송 동의 안내입니다." /></h1>
		<div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
			<div class="agree_s_info">
				<p>경품 배송을 위해 등록된 회원님의 주소, 전화번호, 휴대폰번호가 삼성카드 제휴 배송업체<br />
					(인터파크 비즈마켓, 쿠프마케팅)로 전달 됩니다.</p>
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
		<p class="al_center"><a href="#" onClick="parent.eventLogin('${cmsSeq}');return false;"><img src="/html/et/spcialgift11/images/btn_app.gif" alt="응모하기" /></a></p>
		<%		} else {	%>
		<% if("0".equals(item03) || "0".equals(item04)){ %>
		<p class="al_center"><a href="#" onClick="applyEvent();"><img src="/html/et/spcialgift11/images/btn_app.gif" alt="응모하기" /></a></p>
		<% }else{ %>
		<p class="al_center"><a href="#" onClick="applyEvent();"><img src="/html/et/spcialgift11/images/btn_modify.gif" alt="수정하기" /></a></p>
		<% } %>
		<% } %>
		<!-- 삼성카드 special event란? -->
		<p class="mt30"><img src="/images/et/giftspecial12/txt_giftspecial_event2.gif" alt="삼성카드 Gift Special 이벤트는 삼성카드를 이용하시는 회원님들께 감사의 마음을 담아 준비한 이벤트로, 정기적으로 회원님을 찾아가려 합니다. 의미있는 상품으로 회원님께 최고의 가치를 제공하려 항상 노력하겠습니다." /></p>
		<!-- 13.04.30 SR 일반영 -->
		<p class="mt30"><a href="/2013campaign" target="_blank" title="새창"><img src="/images/et/giftspecial12/micro.gif" alt=">마이크로 사이트 바로가기" /></a></p><!-- 130429 추가 -->
		<!-- // 삼성카드 special event란? -->
	</div>
	<div class="giftevent_btm">&nbsp;</div>

</div>

	<div class="pop_l_position pop_l_wrap_alert" id="id_layer" style="display:none;left:150px">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p>
			<p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p>
			<input type="button" class="img_l_pop btn_close btn_input" onClick="this.parentNode.parentNode.style.display='none'; closeLayerPopup();"   value="레이어닫기" title="이용금액 안내 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/giftspecial12/lay_tit_giftspecial.gif" alt="삼성카드 Gift Special" /></p>
			<p class="pop_tit2">목표금액을 달성하셔야 선택하신 경품의 추첨 대상이 될 수 있습니다.</p>
			<div class="pop_l_content2">
				<div class="pop_l_alert">
					<p><strong>이용금액 안내(2013. 4. 15 ~ 5. 31 누적 이용금액)</strong></p>
					<table class="dtable01 mt10" summary="목표금액, 현재까지 도달 금액, 목표달성까지로 구성된 이용금액 안내">
					<caption>이용금액 안내</caption>
						<colgroup><col width="33%" /><col width="34%" /><col width="33%" /></colgroup>
						<thead>
							<tr>
								<th scope="col" class="cell_l10">목표금액</th>
								<th scope="col">현재까지 도달 금액</th>
								<th scope="col" class="cell_r10">목표달성까지</th>
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
									삼성 스마트에어컨(1명)
									<%} else if (item03.equals("02")) {%>
									삼성 ATIV 스마트PC(2명)
									<%} else if (item03.equals("03")) {%>
									50,000원 캐시백(10명)
									<%} else if (item03.equals("04")) {%>
									30,000 포인트(30명)
									<%} else if (item03.equals("11")) {%>
									삼성 스마트TV 50인치(1명)
									<%} else if (item03.equals("12")) {%>
									삼성 갤럭시카메라(2명)
									<%} else if (item03.equals("13")) {%>
									30,000원 캐시백(30명)
									<%} else if (item03.equals("14")) {%>
									20,000 포인트(50명)
									<%} else if (item03.equals("21")) {%>
									삼성 지펠 냉장고(1명)
									<%} else if (item03.equals("22")) {%>
									[KOVEA] 홈쇼핑 상품 뉴 타프빅돔(오토캠핑)텐트(2명)
									<%} else if (item03.equals("23")) {%>
									20,000원 캐시백(40명)
									<%} else if (item03.equals("24")) {%>
									10,000 포인트(80명)
									<%} else if (item03.equals("31")) {%>
									삼성 스마트 탱고 로봇청소(1명)
									<%} else if (item03.equals("32")) {%>
									필립스 에어프라이어 튀김기 (2명)
									<%} else if (item03.equals("33")) {%>
									10,000원 캐시백(80명)
									<%} else if (item03.equals("34")) {%>
									5,000 포인트(150명)
									<%} else if (item03.equals("41")) {%>
									아이리버 FullHD 블랙박스 X750 2CH 8G + 상시케이블 (1명)
									<%} else if (item03.equals("42")) {%>
									필립스 소닉케어 FlexCare 충전식 음파칫솔 (2명)
									<%} else if (item03.equals("43")) {%>
									5,000원 캐시백(100명)
									<%} else if (item03.equals("44")) {%>
									3,000 포인트(200명)
									<%} %>
								</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="btnc mt20"><a href="#" onClick="document.getElementById('id_layer').style.display='none';closeLayerPopup();"><img src="/images/et/giftspecial12/btn_s_confirm.gif" alt="확인" /></a></p>
			</div>
		</div>
	</div>
	
	<!-- layer_popup -->
	<div class="pop_l_position pop_l_wrap_alert" id="id_layer1" style="display:none;left:150px">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onClick="this.parentNode.parentNode.style.display='none'; show_select();closeLayerPopup();" value="레이어닫기" title="경품응모 완료 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/giftspecial12/lay_tit_giftspecial.gif" alt="삼성카드 Gift Special" /></p>
			<div class="pop_l_content">
				<div class="pop_l_alert">
					<p><strong class="t_point">목표금액 달성을 축하드립니다.</strong><br />
						선택하신 경품에 응모가 완료되었습니다.</p>
				</div>
				<p class="btnc"><a href="#" onClick="document.getElementById('id_layer1').style.display='none';closeLayerPopup();"><img src="/images/et/giftspecial12/btn_s_confirm.gif" alt="확인" /></a></p>
			</div>
		</div>
	</div>

</form>




<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈 프레임"></iframe>
</body>

</html>

