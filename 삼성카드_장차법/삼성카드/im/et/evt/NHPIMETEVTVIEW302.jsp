<%/*
 * Project Name : 삼성카드 웹 이노베이션 프로젝트
 * File Name    : NHPIMMHPIT058.jsp 이마트포인트 상세팝업조회
 * Author       : 삼성SDS 김효정선임
 * Created on 2010. 5. 16.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>경품이벤트 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/event.css" />
</head>
<%
	//호출창 (foward -> fromEvent인경우 이벤트창에서 호출한 것)
	String foward = request.getParameter("foward");	
	String gubunNo = request.getParameter("gubunNo");	
	//총 응모건수
	int apply_cnt = 0;
	if(request.getParameter("apply_cnt") != null && !request.getParameter("apply_cnt").equals("")){
		apply_cnt = Integer.parseInt(request.getParameter("apply_cnt"));
	}	
	
	//로그인 여부
	String login_yn = request.getParameter("login_yn");	
	//로그인안내화면에 보석5개
	if(login_yn.equals("N")){
		apply_cnt = 5;
	}
	
%>

<body>
 
	<div id="popup">
	
		<h1>내가 찾은 보물 내역</h1>
	
		<div id="popupBody">
	
<% if(login_yn.equals("Y") && apply_cnt == 5){ %>
			<h2><img src="/images/et/p-msg2.gif" alt="축하 합니다!" /></h2>
			<p class="hint"><em>모든 보물을 찾으셨어요!</em></p>
<%}else if(login_yn.equals("Y") && apply_cnt == 0){ %>
			<h2><img src="/images/et/p-msg1.gif" alt="아직 보물을 하나도 못 찾으셨어요!" /></h2>
			<dl class="hint">
				<dt><img src="/images/et/popup-hint.gif" alt="힌트" /></dt>
				<dd><em>아이콘을 클릭</em>하여 보물 찾고 푸짐한 경품도 받아보세요!</dd>
			</dl>
<%}else if(login_yn.equals("Y") && apply_cnt < 5){ %>
			<h2><img src="/images/et/p-msg2.gif" alt="축하 합니다!" /></h2>
			<p class="hint"><em><%=apply_cnt %>개</em>의 보물을 찾으셨습니다.</p>
<%}else if(login_yn.equals("N")){ %>                
			 <h2><img src="/images/et/p-msg4.gif" alt="로그인 후 이용해 주세요!" /></h2>
			 <p class="hint">로그인 하신 후 5개의 <em>보물을 모두 찾아보세요!</em></p>
<%} %>

	
			<div id="popupJewel">
				<div class="jewel">
				<% for(int i = 0; i < apply_cnt ; i++){  
						if( i == 5 ) return;					%>
					<img src="/images/et/popup-je.gif" alt="보석 이미지" />
				<%} %>	
				</div>
				
<% if(login_yn.equals("Y") && apply_cnt == 5){ %>
			<p class="adv">경품 이벤트에 <strong>자동으로 응모</strong>되었습니다!</p>
<%}else if(login_yn.equals("Y") && apply_cnt < 5){ %>
			<p class="adv"><strong><%=5-apply_cnt%>개</strong>만 더 찾으시면 자동으로 경품 이벤트에 응모됩니다.</p>
<%}else if(login_yn.equals("N")){ %>                
			 <p class="adv">추첨을 통하여 <strong><em>크루즈 여행, 삼성 PAVV 3D TV</em></strong> 등 푸짐한 경품을 드립니다.</p>
<%} %>				
				
				
			</div>

<% if(login_yn.equals("N")){  %>
			<div id="popupConfirm"><input type="image" src="/images/et/popup-bt1.gif" alt="확인"  onclick="opener.login_pop('<%=gubunNo%>');window.close();"/></div>
<%} else if(foward.equals("fromEvent")){%>       
			<div id="popupConfirm"><input type="image" src="/images/et/popup-bt1.gif" alt="확인"  onclick="window.close()"/></div>
<%} else { %>                
			<div id="popupConfirm"><input type="image" src="/images/et/popup-bt2.gif" alt="이벤트 보기"  onclick="opener.parent.goTabPageWithParam('NHPIMETEVTDTL','cmsSeq=9538');window.close();"/></div>
<%} %>		
			</div>
		
		
	<div id="popupFoot"><button type="button" onclick="window.close()">닫기</button></div>

</div>

</body>
</html>
