<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.scard.common.web.LoginUtil, com.scard.common.login.session.entity.Member, java.util.ArrayList, com.scard.hp.common.main.vo.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.scard.hp.common.util.HpCommonUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/common/header2.jsp"%>
<%
	String search_result = (String)request.getAttribute("search_result"); 
	String name = (String)request.getAttribute("name");
	String yyyy = (String)request.getAttribute("yyyy");
	String mm   = (String)request.getAttribute("mm");
	String dd   = (String)request.getAttribute("dd");
	String tel  = (String)request.getAttribute("tel");
	String hp   = (String)request.getAttribute("hp");

	if(search_result == null) search_result = "";
	if(!"2".equals(search_result) && !"4".equals(search_result) && !"9".equals(search_result)) search_result = "0";
	if(hp == null){
		hp = "";
	}
	else{
		hp = "("+hp+")";	
	}
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


#info_content {width: 611px;height: 303px;margin: 150px auto;padding: 0 0 0 50px;background: url("/html/popup/20120106/bg_info_spillbox.png") no-repeat left top;}
.info_spill01 {padding: 50px 0 0;background: url("/html/popup/20120106/bg_info_spill01.jpg") no-repeat 432px 42px;}
.info_spill01 .info_tit,.info_spill02 .info_tit  {padding: 0 0 20px;}
.info_spill01 .info_txt,.info_spill02 .info_txt {padding: 0 0 35px;}
.info_spill01 .txt_img {color: #ccc;margin: 0 0 6px}
.info_spill01 .txt_img .name_txt {display: inline-block; width: 74px;}

.info_spill02 {background: url("/html/popup/20120106/bg_info_spill02.jpg") no-repeat left 58px;padding: 50px 0 0 130px; }


#info_content2 {width: 661px;margin: 50px auto 30px;background: url("/html/popup/20120106/bg_info_spillbox_top.png") no-repeat left top;}
.txt_delegate {text-align: right;padding: 0 50px 0 0;}
.box_cont {padding: 0 0 40px 50px;background: url("/html/popup/20120106/bg_info_spillbox_btm.png") no-repeat left bottom;}


#pop_m_header {width: 100%;height: 60px;background: url("/html/popup/20120106/pop_bg_body_m.jpg") no-repeat left top;}
#pop_m_header h1 {font-size: 0;line-height: 0;padding: 19px 0 0 25px;}
#pop_m_footer {background: url("/html/popup/20120106/pop_bg_body_m.jpg") no-repeat scroll left bottom transparent;height: 30px;position: relative;}
#pop_m_footer .close_bt label {left: 470px;position: absolute;top: 5px;}
</style>



<script language='javascript' type="text/javascript">
	function nameCheck(){
		<% if("9".equals(search_result)){ %>
		alert("정보를 정확하게 입력하여 주세요.");
		document.location.href = "/hp/im/et/evt.do?method=getInfoMain";
		<% } %>
	}
</script>
</head>
<body onload="nameCheck();">
<!-- 111004 수정 -->
<form name='xecure' action=""><input type="hidden" name='p' /></form>

<!-- 111004 수정 -->
<form id="evtFrm" name="evtFrm" method="post" action="">
<input type="hidden" name="search_result" value="<%=search_result %>" />
</form>
<% if("2".equals(search_result)){ %>
<!-- 111004추가 -->
		<div id="info_content2">
			<div class="box_cont">
				<div class="info_spill02">
					<p class="info_tit"><img src="/html/popup/20120106/tit_info_spill02.png" alt="개인정보 유출 가능성 여부 확인 결과" /></p>
					<p class="info_txt">삼성카드를 아껴주시는 <%=name %> 고객님, <br /><br />이번에 발생한 고객식별정보 유출 사고와 관련하여 경찰수사 결과 <br />				
					고객님의 <strong class="t_point">주민번호 앞 두 자리, 성명, 직장명, 휴대전화 번호</strong>가<br />
					유출되었을 가능성이 있는 것으로 확인되었습니다. <br /><br />궁금하신 사항에 대해서는 고객상담센터(☎ 1588-8700<!-- SR내역 13.02.14 -->)로 문의해 주시면 <br />성심 성의껏 안내 드리겠습니다. <br /><br />고객님께 심려를 끼쳐 드린 점, 다시 한 번 머리 숙여 사과 드립니다.<br /><br />이번 일을 계기로 고객정보 보호를 최우선의 가치로 여기고 <br />고객님께 신뢰를 드릴 수 있는 회사로 거듭날 것을 약속 드립니다.</p><p class="txt_delegate"><%=yyyy %>년 <%=mm %>월 <%=dd %>일 <br />삼성카드 대표이사 사장 <strong>최 치 훈</strong></p>
				</div>
			</div>
		</div>
<!-- //111004추가 -->
<% }else if("4".equals(search_result)){ %>
<!-- 111004추가 -->
		<div id="info_content2">
			<div class="box_cont">
				<div class="info_spill02">
					<p class="info_tit"><img src="/html/popup/20120106/tit_info_spill02.png" alt="개인정보 유출 가능성 여부 확인 결과" /></p>
					<p class="info_txt">삼성카드를 아껴주시는 <%=name %> 고객님, <br /><br />이번에 발생한 고객식별정보 유출 사고와 관련하여 경찰수사 결과 <br />				
					고객님의 <strong class="t_point">주민번호 앞 두 자리, 성명, 직장명, 휴대전화 번호</strong>가<br />
					유출되었을 가능성이 있는 것으로 확인되었습니다. <br /><br />궁금하신 사항에 대해서는 고객상담센터(☎ 1588-8700<!-- SR내역 13.02.14 -->)로 문의해 주시면 <br />성심 성의껏 안내 드리겠습니다. <br /><br />고객님께 심려를 끼쳐 드린 점, 다시 한 번 머리 숙여 사과 드립니다.<br /><br />이번 일을 계기로 고객정보 보호를 최우선의 가치로 여기고 <br />고객님께 신뢰를 드릴 수 있는 회사로 거듭날 것을 약속 드립니다.</p><p class="txt_delegate"><%=yyyy %>년 <%=mm %>월 <%=dd %>일 <br />삼성카드 대표이사 사장 <strong>최 치 훈</strong></p>
				</div>
			</div>
		</div>
<!-- //111004추가 -->
<% }else if("0".equals(search_result)){ %>
<!-- 111004추가 -->
		<div id="info_content2">
			<div class="box_cont">
				<div class="info_spill02">
					<p class="info_tit"><img src="/html/popup/20120106/tit_info_spill02.png" alt="개인정보 유출 가능성 여부 확인 결과" /></p>
<!-- 111005수정 -->
					<p class="info_txt">삼성카드를 아껴주시는 고객님, <br /><br />이번에 발생한 고객식별정보 유출 사고와 관련하여 경찰수사 결과 <br /><strong class="t_point">고객님의 정보는 유출되지 않은 것으로 확인</strong>되었습니다. <br /><br />고객님께 심려를 끼쳐 드린 점, 다시 한 번 머리 숙여 사과 드립니다. <br /><br />이번 일을 계기로 고객정보 보호를 최우선의 가치로 여기고 <br />고객님께 신뢰를 드릴 수 있는 회사로 거듭날 것을 약속 드립니다.</p>
					<p class="txt_delegate"><%=yyyy %>년 <%=mm %>월 <%=dd %>일 <br />삼성카드 대표이사 사장 <strong>최 치 훈</strong></p>
<!-- //111005수정 -->
				</div>
			</div>
		</div>
<!-- //111004추가 -->
<% } %>
<% if(!"9".equals(search_result)){ %>
		<p class="al_center"><a href="/" target="_top"><img src="/html/popup/20120106/btn_maingo.png" alt="메인 페이지 이동" /></a></p>
<% } %>

<!-- //111004 수정 -->

<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>	

<!---END_ENC--->

</body>
</html>
