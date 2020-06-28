<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 S클래스 무료시사회 이벤트 응모하기 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
textarea{border:0 none; background:transparent}
textarea.txt    {border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
select	{font-size:12px; letter-spacing:-1px}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px}
html:first-child	input.chk, input.rdo	{display:inline-block}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}

.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn    {cursor:pointer; vertical-align:middle}
span.btn    {cursor:default}
span.btn, span.btn  span    {color:#999}
.btn_s_white    {background:url('/images/et/sclass/bg_button.png') no-repeat 0 -60px}	/* 110518 */
.btn_s_white span, .btn_s_white input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/et/sclass/bg_button.png') no-repeat right -60px; line-height:21px; font-size:11px; letter-spacing:-1px; cursor:pointer}

.list_rice  li  {padding:0 0 4px 16px; background:url('/images/et/sclass/bul_billards.png') no-repeat 0 4px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px; line-height:16px}

.line_lgray {width:100%; height:0; margin-bottom:25px; padding-bottom:25px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}

.d_desc	{margin-top:10px;}
.box_white   {position:relative; background:white url('/images/et/sclass/box_white.gif') no-repeat}
.box_white   .flag_tr    {position:absolute; right:0; top:0; width:5px; height:5px; background-position:right top; font-size:0; line-height:0}
.box_white   .flag_bl    {position:absolute; left:0; bottom:0; width:5px; height:5px; background-position:left bottom; font-size:0; line-height:0}
.box_white_btm   {padding:10px; background:url('/images/et/sclass/box_white.gif') no-repeat right bottom}
.box_white_btm  .agree {position:relative; width:630px; height:100px; overflow:auto; overflow-x:hidden; font-size:11px; line-height:130%;}

.dtable02	{border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}	/* 110518 */
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}	/* 110518 */
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all; letter-spacing:-1px}	/* 110518 */

.dtable02	td.al_mid	{vertical-align:middle}
.dtable02	th	p, .dtable02	th	label	{color:#333; font-weight:normal; letter-spacing:-1px;}
.dtable02	th	p,	.dtable02	td	p, .dtable02	td	ul, .dtable02	th	label	{padding-left:10px;}
.dtable02	th.cell_r10, .dtable02	td.cell_r10	{text-align:right}
.dtable02	th.cell_r10	p, .dtable02	td.cell_r10	p	{padding-right:10px; padding-left:0}
.dtable02	th	label	{display:inline-block; padding-left:10px}
.dtable02	td.bo_no_line {border-bottom:0px}
.dtable02	td.p0 {padding:0px 0 5px; line-height:14px}
.dtable02	th.cell_l10 {padding-left:10px; text-align:left}
.dtable02	td	textarea.txt	{margin-left:10px; width:480px; height:50px; padding:10px;}

#pop_wrap   {width:710px}
#pop_header  {width:100%; height:60px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat left top}
#pop_header  h1 {padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer {position:relative; width:100%; height:30px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat left bottom}
#pop_footer  .btn_close {position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat 663px 0}
#pop_footer .nottoday   {position:absolute; right:33px; top:6px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
#pop_content     {position:relative; width:670px; height:455px; margin:20px 0 30px 30px; overflow:hidden; overflow-y:scroll}
#pop_content	.pop_conts	{width:650px;}
#pop_content h2	{font-size:12px; color:#333; letter-spacing:-1px;}


.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
.nottoday2	{position:absolute; right:42px; top:8px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
.nottoday2	.chk	{width:11px; height:11px}

.mr8	{margin-right:8px}	/* 110516 */
.mt10	{margin-top:10px}
.mt15	{margin-top:15px}
.mt20	{margin-top:20px}
.mt5		{margin-top:5px}
.sel_m	{margin-left:5px; margin-right:10px}
.pl10	{padding-left:10px}

.t_12   {font-size:12px;}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.t_point	{color:#333; font:bold 12px "돋움"; letter-spacing:-1px; line-height:18px}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.btnc	{margin-top:30px; text-align:center}
.btnset {width:100%; overflow:auto; overflow:hidden; margin-top:7px;}
.btnset .btnr   {float:right}
</style>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script language="javascript" type="text/javascript">

var chkIdenNo = "N";

function applyEvent() {

	<%if( endDateYN.equals("N")){ %>
		alert("<%=endMsg %>");
		return;
	<%}else if( beginDateYN.equals("N")){ %>
	  	alert("<%=beginMsg %>");
	  	return;
  	<%}else{ %>
	if ( document.evtFrm.agree_info(0).checked) {
	} else {
		alert("개인정보 수집 및 이용등에 대한 동의를 하셔야 본 이벤트에 참여하실 수 있습니다.");
		document.evtFrm.agree_info(0).focus() ;
		return;
	}	
	
	if ( document.evtFrm.user_name.value == '' ) {
		alert('성명을 확인하세요.');
		document.evtFrm.user_name.focus();
		return false;
	}
	
	if(!isNumeric(document.evtFrm.idenNo1) || document.evtFrm.idenNo1.value.length != 6){
		alert("주민번호를 확인하여 주십시오.");
		document.evtFrm.idenNo1.value = "";
		document.evtFrm.idenNo1.focus();
	    return false;
	}
	
	if(!isNumeric(document.evtFrm.idenNo2) || document.evtFrm.idenNo2.value.length != 7){
		alert("주민번호를 확인하여 주십시오.");
		document.evtFrm.idenNo2.value = "";
		document.evtFrm.idenNo2.focus();
	    return false;
	}

	
	if(!idenNoCheck(document.evtFrm.idenNo1.value, document.evtFrm.idenNo2.value)){
		return false;
	}

	if (chkIdenNo == "N") {
		alert("실명인증이 올바르게 되지 않았습니다.");
		return false;
	}

	if ( document.evtFrm.hand_phone1.value == '' ) {
		alert('핸드폰번호를 확인하세요.');
		document.evtFrm.hand_phone1.focus();
		return false;
	}	
	if ( document.evtFrm.hand_phone2.value == '' ) {
		alert('핸드폰번호를 확인하세요.');
		document.evtFrm.hand_phone2.focus();
		return false;
	}	
	if ( document.evtFrm.hand_phone3.value == '' ) {
		alert('핸드폰번호를 확인하세요.');
		document.evtFrm.hand_phone3.focus();
		return false;
	}	

	if ( document.evtFrm.emailid.value == '' ) {
		alert('이메일주소를 확인하세요.');
		document.evtFrm.emailid.focus();
		return false;
	}

	if ( document.evtFrm.emailaddr.value == '' ) {
		alert('이메일주소를 확인하세요.');
		document.evtFrm.emailaddr.focus();
		return false;
	}

	var frm = document.evtFrm;
	var movie_area_va = "";
	for(var j=0;j<frm.movie_area.length; j++) {
		if (frm.movie_area[j].checked == true) {
			movie_area_va = frm.movie_area[j].value;
		}
	}

	if(movie_area_va == ""){
		alert("관람지역을 선택하세요.");
		return false;
	} else {
		document.evtFrm.movie_area_va.value = movie_area_va;
	}
		
	document.evtFrm.action = "/hp/im/et/evt.do?method=setSclassMovieEventB";
	document.evtFrm.target = "applyResultFrame";
	document.evtFrm.submit();  		
	<% } %>	
		  	
				
	

			
}

//주민번호 체크.
function idenNoCheck(str_jumin1, str_jumin2){

    var i3 = 0;
    for (var i = 0; i < str_jumin1.length; i++){
        var ch1 = str_jumin1.substring(i, i+1);
        if (ch1<'0' || ch1>'9'){ 
            i3=i3+1
        }
    }

    if ((str_jumin1 == '') || ( i3 != 0 )){
      alert('주민번호를 확인하여 주십시오.');
      return false;
    }

    var i4 = 0;
    for (var i=0;i<str_jumin2.length;i++){
        var ch1 = str_jumin2.substring(i, i+1);
        if (ch1<'0' || ch1>'9'){
            i4=i4+1
        }
    }
    if ((str_jumin2 == '') || ( i4 != 0 )){
      alert('주민번호를 확인하여 주십시오.');
      return false;
    }

    if((str_jumin1.length > 7) || (str_jumin2.length > 8)){
    alert('주민번호를 확인하여 주십시오.');
        return false;
    }

    if ((str_jumin1 == '72') || ( str_jumin2 == '18')){
        alert('주민번호를 확인하여 주십시오.');
        return false;
    }

    var f1 = str_jumin1.substring(0, 1);
    var f2 = str_jumin1.substring(1, 2);
    var f3 = str_jumin1.substring(2, 3);
    var f4 = str_jumin1.substring(3, 4);
    var f5 = str_jumin1.substring(4, 5);
    var f6 = str_jumin1.substring(5, 6);    
    var hap = f1*2 + f2*3 + f3*4 + f4*5 + f5*6 + f6*7;
    var l1 = str_jumin2.substring(0, 1);
    var l2 = str_jumin2.substring(1, 2);
    var l3 = str_jumin2.substring(2, 3);
    var l4 = str_jumin2.substring(3, 4);
    var l5 = str_jumin2.substring(4, 5);
    var l6 = str_jumin2.substring(5, 6);
    var l7 = str_jumin2.substring(6, 7);
    
    hap = hap + l1*8 + l2*9 + l3*2 + l4*3 + l5*4 + l6*5;
    hap = hap%11
    hap = 11-hap
    hap = hap%10
    if(hap != l7){
      alert('주민번호를 확인하여 주십시오.');
      return false;
    }
    var i9=0;

    return true;
}

function chkIdenNo_btn() {
	if(!isNumeric(document.evtFrm.idenNo1) || document.evtFrm.idenNo1.value.length != 6){
		alert("주민번호를 확인하여 주십시오.");
		document.evtFrm.idenNo1.value = "";
		document.evtFrm.idenNo1.focus();
	    return false;
	}
	
	if(!isNumeric(document.evtFrm.idenNo2) || document.evtFrm.idenNo2.value.length != 7){
		alert("주민번호를 확인하여 주십시오.");
		document.evtFrm.idenNo2.value = "";
		document.evtFrm.idenNo2.focus();
	    return false;
	}
	if(!idenNoCheck(document.evtFrm.idenNo1.value, document.evtFrm.idenNo2.value)){
		return false;
	}
	chkIdenNo = "Y";
	alert("실명인증이 완료되었습니다.");
}
function clearField(f1,f2,f3){
	mf1=eval("document.evtFrm."+f1);
	mf2=eval("document.evtFrm."+f2);
	mf3=eval("document.evtFrm."+f3);
	if (mf1.selectedIndex==0){
		mf2.value="";
		mf3.value="";
	}else{
		if(mf2.value== "    "){
			mf2.value="";
			mf3.value="";
		}
	}
}
function sel(field)
{
	var str = field.value;
	document.evtFrm.emailaddr.value = str;
	// 20130411 웹접근성(장차법)  수정
	//if ( str == "")
	//	document.evtFrm.emailaddr.focus();
}

function resultAlert(gubun) {
	if (gubun == "false") {
	alert("이벤트 응모가 실패하였습니다.");
	location.href='/hp/im/et/evt.do?method=getSclassMovieEventB';
	
	} else if (gubun == "ok") {
		alert("이벤트 응모가 완료되었습니다");
		location.href='/hp/im/et/evt.do?method=getSclassMovieEventB';
		self.close();
	}
}

function noPerEvent() {
	alert('이벤트 기간이 아닙니다.');
	location.reload();	
}

function dupB() {
	alert('이미 응모하셨습니다.');
	location.reload();
}
</script>


</head>

<body style="margin:0;">
<form id="evtFrm" name="evtFrm" method="post" action="">

<input type="hidden" name="movie_area_va" value=""/>


<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/sclass/h1_sclass_feel_app.png" alt="삼성카드 S클래스 무료시사회 이벤트 응모하기" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content">
		<div class="pop_conts">
			
			<h2>개인정보 수집 및 이용등에 대한 동의</h2>
			<div class="d_desc">
				<div class="box_white bw650"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
										<div class="agree" tabindex="0">
삼성카드(주) 귀중<br /><br />

삼성카드 S클래스 영화무료시사회 이벤트와 관련하여 귀사가 취득한 본인의 아래 개인정보는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제22조, 
24조에 따라 개인정보 수집·이용시 본인의 동의를 얻어야 하는 정보입니다.<br />
이에 본인은 귀사가 아래 목적에 따라 본인의 개인정보를 수집ㆍ이용하는데 동의합니다.<br /><br />

<strong>개인정보 수집·이용 목적</strong><br />
삼성카드 S클래스 영화무료시사회 이벤트 참여에 따른 본인 확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지,가입 의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 및 확인, 본인의사 확인 등 의사소통 등<br /><br />

<strong>수집하는 개인정보의 항목</strong><br />
성명, 주민번호, 핸드폰, e-mail<br /><br />

<strong>개인정보의 보유 및 이용 기간</strong><br />
원칙적으로 개인정보의 수집 또는 제공받은 목적 달성 시 지체 없이 파기합니다. 다만, 이벤트 당첨자에 한해 주민등록번호를 3개월간 보유 할 수 있으며, 전자상거래에서의 소비자보호에 관한 법률 등 타 법률에 의해 보존할 필요가 있는 경우에는 일정기간 보존합니다.<br />
- 계약 또는 청약철회 등에 관한 기록 : 10년<br />
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br />
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br /><br />

<span class="t_12">※</span> 위 사항에 동의하셔야만 귀하가 신청하신 이벤트에 참여 하실 수 있습니다.
					</div>
					</div></div>
			</div>
			<!-- 약관동의 -->
			<div class="btnset">
				<div class="btnr">
					<label for="label_agree1"><input type="radio" class="rdo" value="" id="label_agree1" name="agree_info" />
					<strong class="t_point">동의</strong>&nbsp;&nbsp;&nbsp;</label>
					<label for="label_agree2"><input type="radio" class="rdo" value="" id="label_agree2" name="agree_info" checked="checked" />
					동의안함</label>
				</div>
			</div>

			<div class="line_lgray"></div>			
			
			<h2>개인정보입력</h2>
			<table class="dtable02 mt10">
			<colgroup><col width="130" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th><p>성명</p></th>
					<td><p><label><input type="text" class="txt" id="user_name" name="user_name" title="성명" maxlength="20" style="width:170px;" /></label></p></td>
				</tr>
				<tr>
					<th><p>주민등록번호</p></th>
					<td><p><label><input type="text" class="txt" id="idenNo1" name="idenNo1" maxlength="6" title="주민등록번호 앞자리"  onkeypress="checkLenN(this, 6, document.evtFrm.idenNo2);javascipt:checkTypes(this, 'NUMB');" onblur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled;width:90px;" onclick="document.evtFrm.idenNo1.value = '';"/></label>
					&nbsp;-&nbsp;
					<label><input type="password" class="txt" id="idenNo2" name="idenNo2" maxlength="7" title="주민등록번호 뒷자리"  onkeydown="checkLenB(this, document.evtFrm.idenNo1);" onkeypress="checkTypes(this, 'NUMB');" onblur="javascipt:checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled;width:90px;" onclick="document.evtFrm.idenNo2.value = '';"/></label>
					<a href="#" onclick="chkIdenNo_btn();" class="btn btn_s_white"><span>실명인증</span></a></p></td>
				</tr>
				<tr>
					<th><p>핸드폰번호</p></th>
					<td><p>
							<select name="hand_phone1" size = "1" onchange="clearField('hand_phone1','hand_phone2','hand_phone3')" title="휴대폰 앞자리" id="label_handphone" style="width:100px;">
								<option value = "">없음</option>
								<option value = "010">010</option>
								<option value = "011">011</option>
								<option value = "016">016</option>
								<option value = "017">017</option>
								<option value = "018">018</option>
								<option value = "019">019</option>
							</select>
							-
					<label><input type="text" name="hand_phone2" size="4" maxlength="4" value="" class="txt"  title="휴대폰 가운데자리" style="ime-mode:disabled;width:90px;" onkeypress="checkLenN(this, 4, document.evtFrm.hand_phone3);checkTypes(this, 'TELNO');" onblur="checkTypesOnBlur(this,'TELNO')" /></label>
							-
							<label><input type="text" name="hand_phone3" size="4" maxlength="4" value="" class="txt"  title="휴대폰 뒷자리" style="ime-mode:disabled;width:90px;" onkeydown="checkLenB(this, document.evtFrm.hand_phone2)" onkeypress="checkTypes(this, 'TELNO');" onblur="checkTypesOnBlur(this,'TELNO')" /></label>
						</p></td>
				</tr>
				<tr>
					<th><p>이메일주소</p></th>
					<td><p>
							<label><input name="emailid" type="text" size="10"  maxlength="48"  class="txt" value="" title="email" style="ime-mode:disabled;width:90px;" onkeypress="checkTypes2(this, 'EMAIL');" onblur="checkTypesOnBlur2(this,'EMAIL')" /></label>&nbsp;@&nbsp;
							<label><input name="emailaddr" size="18" maxlength="40" type="text" class="txt" value="" title="email 공급자 직접입력" style="ime-mode:disabled" onkeypress="checkTypes2(this, 'EMAIL');" onblur="checkTypesOnBlur2(this,'EMAIL')" /></label>
							<select name="selemail" title="email 공급자 선택" onchange="sel(this)" style="width:100px;">
								<option selected="selected" value="">선택하세요</option>
								<option value="dreamwiz.com">드림위즈</option>
								<option value="empal.com">엠팔</option>
								<option value="hanmail.net">한메일(다음)</option>
								<option value="hotmail.com">hotmail</option>
								<option value="korea.com">코리아</option>
								<option value="lycos.co.kr">라이코스</option>
								<option value="nate.com">네이트</option>
								<option value="naver.com">네이버</option>
								<option value="netian.com">네띠앙</option>
								<option value="orgio.net">오르지오</option>
								<option value="paran.com">파란</option>
								<!--option value="yahoo.co.kr">야후</option-->
								<option value="chollian.net">천리안</option>
								<option value="freechal.com">프리챌</option>
								<option value="kebi.com">깨비</option>
								<option value="unitel.co.kr">유니텔</option>
								<option value="weppy.com">웨피</option>
								<option value="samsung.com">삼성닷컴</option>
           						<option value="">직접입력</option>
							</select>
						</p></td>
				</tr>
				
				<tr>
					<th><p>관람지역</p></th>
					<td colspan="3">
						<p style="line-height:0;">
							<label for="yeongdeongpo" class="mr8"><input type="radio" class="rdo" value="yeongdeongpo" id="yeongdeongpo" name="movie_area" checked="checked" /> 영등포</label>
							<label for="yangsibri" class="mr8"><input type="radio" class="rdo" value="yangsibri" id="yangsibri" name="movie_area" /> 왕십리</label>
							<label for="myongdong" class="mr8"><input type="radio" class="rdo" value="myongdong" id="myongdong" name="movie_area" /> 명동</label>
							<label for="daehakro" class="mr8"><input type="radio" class="rdo" value="daehakro" id="daehakro" name="movie_area" /> 대학로</label>
							<label for="abgujung" class="mr8"><input type="radio" class="rdo" value="abgujung" id="abgujung" name="movie_area" /> 압구정</label>
							<label for="mokdong" class="mr8"><input type="radio" class="rdo" value="mokdong" id="mokdong" name="movie_area" /> 목동</label>
							<label for="jucjeon"><input type="radio" class="rdo" value="jucjeon" id="jucjeon" name="movie_area" /> 죽전</label>
							<label for="ilsan" class="mr8"><input type="radio" class="rdo" value="ilsan" id="ilsan" name="movie_area" /> 일산</label>
						</p>
						<p class="mt5">
							<label for="inchon" class="mr8"><input type="radio" class="rdo" value="inchon" id="inchon" name="movie_area" /> 인천</label>
							<label for="suwon" class="mr8"><input type="radio" class="rdo" value="suwon" id="suwon" name="movie_area" /> 수원</label>
							<label for="chuncheon" class="mr8"><input type="radio" class="rdo" value="chuncheon" id="chuncheon" name="movie_area" /> 춘천</label>
							<label for="suncheon" class="mr8"><input type="radio" class="rdo" value="suncheon" id="suncheon" name="movie_area" /> 순천</label>
							<!--<label for="dajeon" class="mr8"><input type="radio" class="rdo" value="dajeon" id="dajeon" name="movie_area" /> 대전</label>-->
							<label for="jeonju" class="mr8"><input type="radio" class="rdo" value="jeonju" id="jeonju" name="movie_area" /> 전주</label>
							<label for="changwon" class="mr8"><input type="radio" class="rdo" value="changwon" id="changwon" name="movie_area" /> 창원더시티</label>
							<label for="dajeon" class="mr8"><input type="radio" class="rdo" value="dajeon" id="dajeon" name="movie_area" /> 대전</label>
							<label for="cheonan" class="mr8"><input type="radio" class="rdo" value="cheonan" id="cheonan" name="movie_area" /> 천안</label>
						</p>

						
						<p class="mt5">
							<label for="kwangju" class="mr8"><input type="radio" class="rdo" value="kwangju" id="kwangju" name="movie_area" /> 광주터미널</label>
							<label for="seomyon" class="mr8"><input type="radio" class="rdo" value="seomyon" id="seomyon" name="movie_area" /> 서면</label>
							<label for="centeom" class="mr8"><input type="radio" class="rdo" value="centeom" id="centeom" name="movie_area" /> 센텀시티</label>
							<label for="daegu" class="mr8"><input type="radio" class="rdo" value="daegu" id="daegu" name="movie_area" /> 대구</label>
							<label for="pohang" class="mr8"><input type="radio" class="rdo" value="pohang" id="pohang" name="movie_area" /> 포항</label>
							<label for="ulsan" class="mr8"><input type="radio" class="rdo" value="ulsan" id="ulsan" name="movie_area" /> 울산</label>
							<label for="jeju" class="mr8"><input type="radio" class="rdo" value="jeju" id="jeju" name="movie_area" /> 제주</label>
						</p>
					</td>
				</tr>
								
			</tbody>
			</table>
			
			<ul class="list_rice mt5">
				<li>입력하신 정보는 당첨 시 연락 및 배송의 목적으로 기재하며, 이외의 다른 목적으로는 사용되지 않습니다.</li>
				<li>정확한 정보 미입력 시 당첨이 무효처리 될 수 있습니다.</li>
			</ul>

			<div class="btnc"><a href="#" onclick="applyEvent();">
			<img src="/images/et/sclass/btn_app.png" alt="다음" /></a></div>
		</div>
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
</form>
</body>

</html>

