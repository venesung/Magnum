<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 금융부가서비스 이벤트 2차
 * File Name: NHPIMETEVTVIEW328.jsp
 * Author: "펜타 김경숙 과장"
 * Created on 2010. 8. 30.
 * 금융부가서비스 이벤트 처리
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%
	//cross-domain 처리
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	
	//no cache 처리
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);

	String event_insert = (String) request.getAttribute("event_insert");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>금융부가서비스 이벤트 2차 - 삼성카드</title>

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
		if (event_insert == "Y") {
	%>
			parent.applyOk(); 
	<%	}else{

	%>
			parent.applyNo(); 
	<%
		}
	%>
	//location.href="/hp/im/et/evt003.do?method=getShotgame";
	</script>
</head>

<body>
<!--<img src="/images/et/event100803.jpg" border="0" usemap="#Map" alt="" />
--></body>
</html>
