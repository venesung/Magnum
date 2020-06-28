<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.scard.common.web.LoginUtil, com.scard.common.login.session.entity.Member, java.util.ArrayList, com.scard.hp.common.main.vo.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.scard.hp.common.util.HpCommonUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/common/header2.jsp"%>
<%
	String search_gubun = (String)request.getAttribute("search_gubun");
	String search_result = (String)request.getAttribute("search_result"); //조회구분
%>
<!--!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>개인정보 유출 여부 확인 - 삼성카드</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
<style type="text/css">
#tabbrowse  {position:absolute; left:285px; top:30px; width:950px; z-index:500; display:none}
#tabbrowse_position	{position:relative; left:-8px; top:0px; width:950px}
#tab_title {display:none}

.pop_l_position	{position:relative; top:200px; left:0}
.pop_l_loading	{position:relative; width:470px; height:154px}
.pop_l_loading_bg	{position:relative; top:154px; width:470px; height:154px; background:url('/images/gr/bg_loading.png') no-repeat; _background:none; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/images/gr/bg_loading.png',sizingMethod='crop')}}
.pop_l_loading	.img_l_pop	 {position:relative; background:url('/images/common/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}


.main_layer_110707	{position:absolute; left:45px; top:0; z-index:200;}
.w1024	.main_layer_110707	{left:37px;}


#info_content {width: 611px;height: 303px;margin: 100px auto;padding: 0 0 0 50px;background: url("/html/popup/20120106/bg_info_spillbox.png") no-repeat left top;}
.info_spill01 {padding: 50px 0 0;background: url("/html/popup/20120106/bg_info_spill01.jpg") no-repeat 432px 42px;}
.info_spill01 .info_tit,.info_spill02 .info_tit  {padding: 0 0 20px;}
.info_spill01 .info_txt,.info_spill02 .info_txt {padding: 0 0 35px;}
.info_spill01 .txt_img {color: #ccc;margin: 0 0 6px}
.info_spill01 .txt_img .name_txt {display: inline-block; width: 74px;}

.info_spill02 {background: url("/html/popup/20120106/bg_info_spill02.jpg") no-repeat left 58px;padding: 50px 0 0 130px; }


#info_content2 {width: 661px;margin: 150px auto 30px;background: url("/html/popup/20120106/bg_info_spillbox_top.png") no-repeat left top;}
.txt_delegate {text-align: right;padding: 0 50px 0 0;}
.box_cont {padding: 0 0 40px 50px;background: url("/html/popup/20120106/bg_info_spillbox_btm.png") no-repeat left bottom;}


#pop_m_header {width: 100%;height: 60px;background: url("/html/popup/20120106/pop_bg_body_m.jpg") no-repeat left top;}
#pop_m_header h1 {font-size: 0;line-height: 0;padding: 19px 0 0 25px;}
#pop_m_footer {background: url("/html/popup/20120106/pop_bg_body_m.jpg") no-repeat scroll left bottom transparent;height: 30px;position: relative;}
#pop_m_footer .close_bt label {left: 470px;position: absolute;top: 5px;}
</style>

<script type="text/javascript" language="javascript" src="/js/sline/Form_Check.js"></script>
<script type="text/javascript" language='javascript' src='/js/sline/validation.js'></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>

<script type="text/javascript" language="javascript">
function goSearch(){
	var docForm = document.form1;
	docForm.search_gubun.value ="S";
	docForm.action = "/hp/im/et/evt.do?method=getInfoSearch";

	if(docForm.name.value == ""){
		alert("이름을 입력하여 주세요.");
		docForm.name.focus();
	}
	else if(docForm.iden_no1.value.length != 6){
		alert("주민번호를 입력하여 주세요.");
		docForm.iden_no1.focus();
	}
	else if(docForm.iden_no2.value.length != 7){
		alert("주민번호를 입력하여 주세요.");
		docForm.iden_no2.focus();
	}
	else{
		if(onlyKOEN(docForm.name) && onlyNumber(docForm.iden_no1) && onlyNumber(docForm.iden_no2)){
           docForm.submit();
		}
	}
}
function setFocus(){
	setTimeout("aa()", 1000);
}
function aa(){
	document.form1.name.focus();
}

/*숫자만 입력하게 하는  script */
function onlyNumber(obj){
	var inputStr = obj.value;
   	for (var i = 0; i < inputStr.length; i++){
		var oneChar = inputStr.charAt(i);
		if (!((oneChar >= "0" &&oneChar <= "9"))){
			alert("주민등록번호는 숫자만 입력 가능합니다.");
			obj.focus();
			return false;
		}
	}
	return true;
}
/*한글/영문만 입력하게 하는  script */
function onlyKOEN(obj){
	var inputStr = obj.value;
    for(var i = 0;i < inputStr.length; i++){
    	var keynum = inputStr.charCodeAt(i);
    	if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E) || (keynum >= 0x61 && keynum <= 0x7A) || (keynum >= 0x41 && keynum <= 0x5A))){
    		alert("이름은 한글/영문만 입력 가능합니다.");
    		obj.focus();
    		return false;
    	}
    }
	return true;
}

</script>


</head>
<body onload="setFocus();">
<!-- 111004 수정 -->
<form name='xecure' action=""><input type="hidden" name='p' /></form>
<form name="form1" method="post" autocomplete="off" action="">
<input type="hidden" name="search_gubun" value="<%=search_gubun%>" />
<input type="hidden" name="input" />

		<div id="info_content">
			<div class="info_spill01">
				<p class="info_tit"><img src="/html/popup/20120106/tit_info_spill01.png" alt="개인정보 유출 가능성 여부 확인하기" /></p>
				<p class="info_txt">고객님의 개인정보 유출 가능성 여부 확인을 위해 최소한의 정보확인이 필요합니다. <br />이름과 주민등록번호를 입력해주세요.</p>
				<p class="txt_img"><span class="name_txt"><img src="/html/popup/20120106/txt_name.gif" alt="이름" /></span><span class="bg_input"><input type="text" name="name" style="width:136px;ime-mode:active" id="label_id" title="이름" onkeyup="onlyKOEN(this);" /><em>&nbsp;</em></span></p>
                <p class="txt_img"><span class="name_txt"><img src="/html/popup/20120106/txt_resident.gif" alt="주민등록번호" /></span><span class="bg_input"><input type="text" name="iden_no1" style="width:136px;ime-mode:disabled"  title="주민등록번호 앞자리" maxlength="6" onkeyup="onlyNumber(this);" /><em>&nbsp;</em></span> - <span class="bg_input"><input type="password" name="iden_no2" maxlength="7" style="width:136px;ime-mode:disabled;"  title="주민등록번호 뒷자리" onkeyup="if(event.keyCode == 13) goSearch();onlyNumber(this);"/><em>&nbsp;</em></span><a href="javascript:goSearch()" class="ml10"><img src="/html/popup/20120106/btn_confirmation02.png" alt="확인" /></a></p>
			</div>
		</div>
</form>

<!-- //111004 수정 -->
<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>	

<!---END_ENC--->

</body>
</html>
