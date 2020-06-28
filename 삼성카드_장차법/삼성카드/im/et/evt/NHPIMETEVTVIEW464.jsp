<%/*
 * Project Name: 삼성카드 웹
 * File Name: 골프 페이지
 * Author: 소재민 과장
 * Created on 2012. 02. 21.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="tab_title"></div>

<%@include file="/WEB-INF/jsp/common/tab_header.jsp" %>


<div id="tab_script">
<script type="text/javascript" src="/js/common-hp-ajax.js"></script>

<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/ss.css" />
</div>

<%
	String customer_no = (String)request.getAttribute("customer_no"); //customer_no
	String pageloadingtime = (String)request.getAttribute("pageloadingtime"); //pageloadingtime
	String loginYN = (String)request.getAttribute("loginYN"); //loginYN
%>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
		if(loginYN.equals("N")) {
		%>
			scardLogin('NHPIMSSSBC001M011','self');
		<%
		} else {
		%>
			window.open('http://samsung.xgolf.co.kr/xgolf_sso_request.asp?param1=<%=customer_no%>&param2=<%=pageloadingtime%>','','');
		<%
		} 
		%>
	}

	function $tabOnLoad() {
		//callCmsContentHtmlAjax('/cms_content/hp/im/ss/gfs/120221GFS02.html','cms_content')
	}
	

	
</script>


</head>

<body style="margin:0;">

				<div class="top_visual">
					<h1 class="none">삼성카드 골프 서비스</h1>
					<!-- 20130415 웹접근성(장차법)  수정  -->
					<div class="h1_desc"><img src="/images/ss/h1_golf_service.jpg" alt="삼성카드만 있다면, 누리실 수 있습니다!삼성카드 골프 서비스.무료 부킹, 그린피 면제, 플러스 혜택까지-골프를 사랑하는 삼성카드 회원님, 차원이 다른 혜택으로 골프 실력까지 업그레이드하세요!" /></div>
				</div>
				
				<cms:include page="/cms_content/hp/im/ss/gfs/120221GFS02.html" flush="false"></cms:include>


<%@ include file="/WEB-INF/jsp/common/tab_footer.jsp" %>
