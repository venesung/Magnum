<%
/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW363.jsp (스템프 프로모션)
 * Author:  
 * Created on 2011. 1. 25.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%

	String resultMsg	= (String)request.getAttribute("resultMsg");
	String loginYN		= (String)request.getAttribute("loginYN");
	String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String beginMessage	= (String)request.getAttribute("beginMessage");
	String endMessage	= (String)request.getAttribute("endMessage");

	String dataEXist = (String)request.getAttribute("dataEXist");
	String item03 = (String)request.getAttribute("item03");
	String item10 = (String)request.getAttribute("item10");
	String user_name = (String)request.getAttribute("user_name");

	String kind01 = (String)request.getAttribute("kind01");
	String kind02 = (String)request.getAttribute("kind02");
	String kind03 = (String)request.getAttribute("kind03");
	String kind04 = (String)request.getAttribute("kind04");
	String kind05 = (String)request.getAttribute("kind05");
	String kind06 = (String)request.getAttribute("kind06");
	String kind07 = (String)request.getAttribute("kind07");
	String kind08 = (String)request.getAttribute("kind08");
	
	String sum02 = (String)request.getAttribute("sum02");
	String sum03 = (String)request.getAttribute("sum03");
	String sum04 = (String)request.getAttribute("sum04");
	String currentYYYMM = (String)request.getAttribute("currentYYYMM");
	
	String stamp2 = "";
	String stamp3 = "";
	String stamp4 = "";

	if (sum02 == "") sum02 = "0";
	if (sum03 == "") sum03 = "0";
	if (sum04 == "") sum04 = "0";
		
	if (currentYYYMM.equals("201102")) {  
		if (Integer.parseInt(sum02) >= 1000000) { 
			stamp2 = "Y";
		}
	} else if (currentYYYMM.equals("201103")) {
		if (Integer.parseInt(sum02) >= 1000000) { 
			stamp2 = "Y";
		}	
		if (Integer.parseInt(sum03) >= 1000000) { 
			stamp3 = "Y";
		}
	} else if (currentYYYMM.equals("201104")) { 
		if (Integer.parseInt(sum02) >= 1000000) { 
			stamp2 = "Y";
		}
		if (Integer.parseInt(sum03) >= 1000000) { 
			stamp3 = "Y";
		}
		if (Integer.parseInt(sum04) >= 1000000) { 
			stamp4 = "Y";
		}
	} else if (currentYYYMM.equals("201105")) { 
		if (Integer.parseInt(sum02) >= 1000000) { 
			stamp2 = "Y";
		}
		if (Integer.parseInt(sum03) >= 1000000) { 
			stamp3 = "Y";
		}
		if (Integer.parseInt(sum04) >= 1000000) { 
			stamp4 = "Y";
		}
	}

%>
<!--<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
<title>패밀리 스탬프 이벤트 - 삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0; font:normal 12px '돋움'; color:#666}
img {border:0 none}

strong	{font-weight:bold}
.t_point {color:#333}

.mt5 {margin-top:5px}
.stamp {position:relative}

.stamp1 {position:absolute; top:945px; left:60px}
.stamp2 {position:absolute; top:945px; left:215px}
.stamp3 {position:absolute; top:945px; left:372px}
.stamp4 {position:absolute; top:945px; left:528px}
.stamp5 {position:absolute; top:1094px; left:60px}
.stamp6 {position:absolute; top:1094px; left:215px}
.stamp7 {position:absolute; top:1094px; left:372px}
.stamp8 {position:absolute; top:1094px; left:528px}
.stamp_sel {position:absolute; top:506px; left:217px; letter-spacing:-1px}
.sucess1 {position:absolute; top:651px; left:182px; width:113px; height:113px; background:url('/images/et/img_stamp1.png') no-repeat}
.sucess2 {position:absolute; top:651px; left:308px; width:113px; height:113px; background:url('/images/et/img_stamp2.png') no-repeat}
.sucess3 {position:absolute; top:651px; left:437px; width:113px; height:113px; background:url('/images/et/img_stamp3.png') no-repeat}


.stamp_rdo {float:left; vertical-align:top; margin-right:5px}
.stamp_prd {float:left; vertical-align:top; margin-top:2px}
.stamp_prd p {font:bold 11px '돋움'; color:#999; letter-spacing:-1px}
.blank {width:25px; height:25px}
.conts_hidden {font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">

<% if (resultMsg != null && resultMsg.length() > 0) { %>
       alert("<%=resultMsg %>");
<% } %>

function receiveMsg(msg) {
	if (msg == '01') {
		alert("응모가 완료되었습니다. 감사합니다.");
	} else if (msg == '02') {
		alert("이벤트 참여에 실패하였습니다.다시 시도해주세요.");
	} else if (msg == '03') {
		alert("이미 응모 하셨습니다.");
	} else if (msg == '04') {
		alert("이벤트 응모는 2011년2월 1일부터 가능합니다.");
	} else if (msg == '05') {
		alert("본 행사는 응모가 종료되었습니다.");
	} else if (msg == '06') {
		alert("로그인 하신 후, 응모 가능합니다.");
	}				
}	

function applyEvent() {
	
<%	if(eventIngYN.equals("")) {
		if(loginYN.equals("Y")) { 	
			if(dataEXist.equals("Y")) { %>
				alert('이미 응모 하셨습니다.');
				return;
		  <%}%>		  
			if (document.evtFrm.p_item03.value == '00') {
				alert('원하시는 선물을 선택해 주세요.');
				return;
			}		  
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
<%		} else {	%>
			parent.eventLogin('11243');
<%		}
	} else if(eventIngYN.equals("before")) {	%>
		alert('<%=beginMessage%>');
<%	} else if(eventIngYN.equals("after")) {		%>
		alert('<%=endMessage%>');
<%	}	%>

}

function setData(parm) {
	document.evtFrm.p_item03.value = parm;
}

</script>
</head>

<body>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applySFCStampEvent" method="post">
<input type="hidden" name="p_item03" value="00"/>

<div class="stamp">
	<!-- 응모하신 선물 -->
	<% if (dataEXist.equals("Y")) { %>
	<div class="stamp_sel"><span class="t_point"><%= user_name %></span> 회원님께서 <%=item10.substring(0,4)%>년<%=item10.substring(4,6)%>월 <%=item10.substring(6,8)%>일 <strong class="t_point"><% if (item03.equals("01")) {%>SAM여행상품권
	                                                                                                                                                                                              <% } else if (item03.equals("02")) {%>루이비통  백
	                                                                                                                                                                                              <% } else if (item03.equals("03")) {%>네스프레소 커피머신 + 커피캡슐
	                                                                                                                                                                                              <% } else if (item03.equals("04")) {%>닌텐도 위핏 플러스
	                                                                                                                                                                                              <% } else if (item03.equals("05")) {%>구찌 머니클립
	                                                                                                                                                                                              <% } else if (item03.equals("06")) {%>기프트카드 5만원권
	                                                                                                                                                                                              <% } else if (item03.equals("07")) {%>서비스포인트 30,000P
	                                                                                                                                                                                              <% } else if (item03.equals("08")) {%>서비스포인트 3,000P
	                                                                                                                                                                                              <% } %></strong>에 응모하셨습니다.</div>
	<% } %>
	<!-- // 응모하신 선물 -->
	<!-- stamp -->

	<p class="sucess1">&nbsp;</p> <!-- 1회 성공 시 (무조건 스템프 2월꺼 적용 20110309 순미-->

<%  if (stamp3.equals("Y")) { %>
	<p class="sucess2">&nbsp;</p> <!-- 2회 성공 시 -->
<% } %>
<%  if (stamp4.equals("Y")) { %>
	<p class="sucess3">&nbsp;</p> <!-- 3회 성공 시 -->
<% } %>
	<!-- // stamp -->
	<!-- 도전 선물 선택 -->
	<div class="stamp1">
		<div class="stamp_rdo"><label for="stamp1"><input type="radio" class="rdo" id="stamp1" title="SAM여행상품권 500만원권 1명" name="stamp" onClick="setData('01');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp1.png" alt="SAM여행상품권 500만원권 1명" /><span class="conts_hidden">SAM여행상품권 500만원권 1명</span></p>
			<p class="mt5">당첨확률<fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(kind01) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp2">
		<div class="stamp_rdo"><label for="stamp2"><input type="radio" class="rdo" title="루이비통  백  5명" id="stamp2" name="stamp" onClick="setData('02');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp2.png" alt="루이비통  백  5명" /><span class="conts_hidden">루이비통  백  5명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='5' req_cnt='<%=String.valueOf(kind02) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp3">
		<div class="stamp_rdo"><label for="stamp3"><input type="radio" class="rdo" id="stamp3" title="네스프레소 커피머신 + 커피캡슐 250개 10명" name="stamp" onClick="setData('03');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp3.png" alt="네스프레소 커피머신 + 커피캡슐 250개 10명" /><span class="conts_hidden">네스프레소 커피머신 + 커피캡슐 250개 10명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(kind03) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp4">
		<div class="stamp_rdo"><label for="stamp4"><input type="radio" class="rdo" title="닌텐도 위핏 플러스 15명" id="stamp4" name="stamp" onClick="setData('04');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp4.png" alt="닌텐도 위핏 플러스 15명" /><span class="conts_hidden">닌텐도 위핏 플러스 15명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='15' req_cnt='<%=String.valueOf(kind04) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp5">
		<div class="stamp_rdo"><label for="stamp5"><input type="radio" class="rdo" title="구찌 머니클립 20명" id="stamp5" name="stamp" onClick="setData('05');" /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp5.png" alt="구찌 머니클립 20명" /><span class="conts_hidden">구찌 머니클립 20명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='20' req_cnt='<%=String.valueOf(kind05) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp6">
		<div class="stamp_rdo"><label for="stamp6"><input type="radio" class="rdo" title="기프트카드 5만원권 50명" id="stamp6" name="stamp" onClick="setData('06');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp6.png" alt="기프트카드 5만원권 50명" /><span class="conts_hidden">기프트카드 5만원권 50명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='50' req_cnt='<%=String.valueOf(kind06) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp7">
		<div class="stamp_rdo"><label for="stamp7"><input type="radio" class="rdo" title="서비스포인트 30,000P 100명" id="stamp7" name="stamp" onClick="setData('07');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp7.png" alt="서비스포인트 30,000P 100명" /><span class="conts_hidden">서비스포인트 30,000P 100명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='100' req_cnt='<%=String.valueOf(kind07) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="stamp8">
		<div class="stamp_rdo"><label for="stamp8"><input type="radio" class="rdo" title="서비스포인트 3,000P 4,800명" id="stamp8" name="stamp" onClick="setData('08');"  /></label></div>
		<div class="stamp_prd">
			<p><img src="/images/et/txt_stamp8.png" alt="서비스포인트 3,000P 4,800명" /><span class="conts_hidden">서비스포인트 3,000P 4,800명</span></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='4800' req_cnt='<%=String.valueOf(kind08) %>' inputCss="" /></p>
		</div>
	</div>
	<!-- // 도전 선물 선택 -->
</div>

<img src="/images/et/bg_stamp.jpg" alt="3번의 도전! Family Stamp" usemap="#stamp" />
<map name="stamp" id="stamp">
		<area shape="rect" coords="246,1169,482,1215" href="javascript:applyEvent();" alt="Stamp 이벤트 응모하기" />
</map>

</form>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>
</body>

</html>

