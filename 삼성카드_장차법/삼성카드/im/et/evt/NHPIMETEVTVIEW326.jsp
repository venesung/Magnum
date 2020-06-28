<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 추석 전사 이벤트 처리
 * File Name: NHPIMETEVTVIEW321.jsp
 * Author: "IDS 소재민 대리"
 * Created on 2010. 8. 30.
 * 추석 전사 이벤트 처리
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
 <%@page import="com.scard.common.util.StringUtil"%>
 <%@ page import="com.scard.hp.common.util.HpCommonUtil"%>  
<%
	//cross-domain 처리
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	
	//no cache 처리
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if("HTTP/1.1".equals(request.getProtocol())){
		response.setHeader("Cache-control","no-cache");
	}

	String resultMsg = (String) request.getAttribute("resultMsg");
	String loginYN = (String) request.getAttribute("loginYN");
	String strItem01 = (String) request.getAttribute("item01");
	String strItem02 = (String) request.getAttribute("item02");
	String strItem03 = (String) request.getAttribute("item03");
	String strItem04 = (String) request.getAttribute("item04");
	String strItem05 = (String) request.getAttribute("item05");
	String strItem06 = (String) request.getAttribute("item06");
	String strItem07 = (String) request.getAttribute("item07");
	String strItem08 = (String) request.getAttribute("item08");
	String strItem09 = (String) request.getAttribute("item09");
	String user_name = (String) request.getAttribute("user_name");
	
	String segNo = strItem02.substring(2,5);

	int intItem06 = StringUtil.StringToInteger(StringUtil.replace(strItem06,",","").trim()) ;
	int intItem07 = StringUtil.StringToInteger(StringUtil.replace(strItem07,",","").trim()) ;
	
	intItem06 = 1200 - intItem06;
	intItem07 = 960 - intItem07;
	
	String str1200 = StringUtil.amountToString(intItem06);
	String str960 = StringUtil.amountToString(intItem07);
	
	if (intItem06 < 1) {
		str1200 = "-";
	}
	if (intItem07 < 1) {
		str960 = "-";
	}	
	/*int intItem01 = StringUtil.StringToInteger(StringUtil.replace(strItem01,",","").trim()) ;	
	int intItem02 = StringUtil.StringToInteger(StringUtil.replace(strItem02,",","").trim()) ;
	int intItem03 = StringUtil.StringToInteger(StringUtil.replace(strItem03,",","").trim()) ;
	int intItem04 = StringUtil.StringToInteger(StringUtil.replace(strItem04,",","").trim()) ;
	int intItem05 = StringUtil.StringToInteger(StringUtil.replace(strItem05,",","").trim()) ;
	int intItem06 = StringUtil.StringToInteger(StringUtil.replace(strItem06,",","").trim()) ;
	int intItem07 = StringUtil.StringToInteger(StringUtil.replace(strItem07,",","").trim()) ;
	int intItem08 = StringUtil.StringToInteger(StringUtil.replace(strItem08,",","").trim()) ;
	int intItem09 = StringUtil.StringToInteger(StringUtil.replace(strItem09,",","").trim()) ;*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>프리미엄 회원 이벤트 - 삼성카드</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	
	}
img  {border:0;}
p, div, span {margin:0; padding:0}
ul, ol, li, dl, dt, dd {margin:0; padding:0; list-style:none}
.mt5 {margin-top:5px !important}
.mt10 {margin-top:10px}
.al_top {vertical-align:top}
.al_middle {vertical-align:middle}
.premium201010 {position:relative}
.premium201010 .memberID {position:absolute; top:191px; left:60px}
.premium201010 .memberID span {color:#259fec; font:bold 14px Tahoma; padding:0px 5px 0px 10px; vertical-align:top}
.premium201010 .member2010 {position:absolute; top:279px; left:288px}
.premium201010 .member2011 {position:absolute; top:279px; left:473px}
.premium201010 .member2010 li, .premium .member2011 li {margin-bottom:12px; color:#259fec; font:bold 11px Tahoma; vertical-align:top; line-height:14px}
.premium201010 .membership {position:absolute; top:24px; left:193px; vertical-align:top}
.premium201010 .membership .memberid {color:#fdff67; font:bold 14px 'Tahoma'; padding-right:5px; vertical-align:top}
.premium201010 .membership span {color:#fdff67; font:bold 12px 'Tahoma'; padding-right:5px; vertical-align:top}
		
	-->
	</style>
	<script type="text/javascript">
	<%
		if(loginYN == "N")
		{
	%>
            parent.parent.scardLogin('/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=10581','eventLogin');
	<%
		}
		else
		{
			if (resultMsg != null && resultMsg.length() > 0) {
	%>
				alert("<%=resultMsg %>");
				
				//parent.parent.submit_eventLog(); 
	<%		}
		}
	%>
	</script>
</head>

<body>
<p><img src="/images/et/upse/event_premium01.jpg" alt="2011년 프리미엄 회원으로의 초대" /></p>
<div class="premium201010">
	<div class="membership">
		<p><span class="memberid"><%=user_name %></span><img src="/images/et/upse/txt_premium_member_01.gif" alt="회원님이" class="al_top" /><br />
			<img src="/images/et/upse/txt_premium_member_02.gif" alt="2011년 프리미엄 회원으로 선정되시려면?" class="al_top" /></p>
		<p class="mt10"><img src="/images/et/upse/txt_premium_member_03.gif" alt="2010년 9월 ~ 10월까지 (2개월간) 개인신용카드로 일시불 + 할부를" class="al_top" /></p>
		<p><span>
		<%if ("001".equals(segNo)) {%>
			<%=HpCommonUtil.getCommaStringForMoney(strItem08)%>
		<%} else {%>
			<%=HpCommonUtil.getCommaStringForMoney(strItem09)%>
		<%}
		%>
		</span><img src="/images/et/upse/txt_premium_member_04.gif" alt="만원 이상 이용하시면 됩니다." class="al_top" /></p>
		<p class="mt10"><img src="/images/et/upse/txt_premium_member_05.gif" alt="2011년 프리미엄 회원은 자동 선정되며, 2011년 1월에 이메일, 청구서, 홈페이지를 통해 알려드립니다." class="al_top" /></p>
	</div>
	<div class="memberID"><img src="/images/et/upse/txt_premium_id_01.gif" alt="현재까지" class="al_top" /><span><%=user_name %></span><img src="/images/et/upse/txt_premium_id_02.gif" alt="회원님의 이용실적" class="al_top" /></div>
	<div class="member2010">
		<ul>
			<li><%=HpCommonUtil.getCommaStringForMoney(strItem06)%><img src="/images/et/upse/txt_premium_01.gif" alt="만원" class="al_top"/></li>
			<li><%=HpCommonUtil.getCommaStringForMoney(strItem07)%><img src="/images/et/upse/txt_premium_01.gif" alt="만원" class="al_top" /></li>
		</ul>
	</div>
	<div class="member2011">
		<ul>
			<li>
			<%if (intItem06 < 1) { %>
			<%=str1200%>
			<%} else {%>
			<%=HpCommonUtil.getCommaStringForMoney(str1200)%>
			<%} %>
			<img src="/images/et/upse/txt_premium_02.gif" alt="만원" class="al_top" /></li>
			<li>
			<%if (intItem07 < 1) { %>
			<%=str960%>
			<%} else {%>			
			<%=HpCommonUtil.getCommaStringForMoney(str960)%>
			<%} %>
			<img src="/images/et/upse/txt_premium_02.gif" alt="만원" class="al_top" /></li>
		</ul>
	</div>
	<p><img src="/images/et/upse/event_premium02.jpg" alt="" /></p>
</div>
<p><img src="/images/et/upse/event_premium03.jpg" alt="2011년 프리미엄 회원이 되시면 받게 될 혜택" /></p>

<map name="event_premium" id="event_premium">
<area shape="rect" coords="60,297,256,375" alt="프리미엄, 그들 만의 여행! 해외 무료 여행" href="#" />
<area shape="rect" coords="260,297,455,375" alt="신라면세점 5~15% 할인 + 세일시 추가 5%" href="#" />
<area shape="rect" coords="460,297,658,375" alt="해외 여행 특전" href="#" />
<area shape="rect" coords="60,380,256,457" alt="해외 무료 여행자 보험 서비스! " href="#" />
<area shape="rect" coords="260,380,455,457" alt="만원으로 떠나는 국내 테마 여행" href="#" />
<area shape="rect" coords="460,380,658,457" alt="영숙씨도 반해 버린 영화데이트 무비무비" href="#" />
</map>
</body>
</html>
