<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	
	<% if (event_insert == "A") { //기응모쿠폰일 경우%>
		parent.applyCheckNo(); 
	<% }else if (event_insert == "C"){ //대상쿠폰번호가 아닐경우 	%>
		parent.applyCouponNo(); 
	<% }else if (event_insert == "Y"){ //응모정상처리	%>
		parent.applyOk(); 		
	<% }else { //응모처리오류%>
		parent.applyNo();
	<%}%>
	</script>
</head>

<body>
</body>
</html>
