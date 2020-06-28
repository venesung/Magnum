<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 추석 전사 이벤트 처리
 * File Name: NHPIMETEVTVIEW321.jsp
 * Author: "IDS 소재민 대리"
 * Created on 2010. 8. 30.
 * 추석 전사 이벤트 처리
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
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
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>호두까기 인형 초대이벤트 - 삼성카드</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
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
<img src="/images/et/event100803.jpg" border="0" usemap="#Map" alt="조지발란신의 발레 &lt;호두까기 인형&gt; 삼성카드 Day초대 이벤트" />
</body>
</html>
