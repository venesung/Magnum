<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 프리미엄 추석 이벤트 처리
 * File Name: NHPIMETEVTVIEW323.jsp
 * Author: "SYD 모정서 과장"
 * Created on 2010. 8. 30.
 * 프리미엄 추석 이벤트 처리
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
	<title>프리미엄 추석 이벤트 - 삼성카드</title>

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
			if (resultMsg != null && resultMsg.length() > 0) {
	%>
				alert("<%=resultMsg %>");
	<%
			}
	%>
	</script>
</head>

<body>
</body>
</html>
