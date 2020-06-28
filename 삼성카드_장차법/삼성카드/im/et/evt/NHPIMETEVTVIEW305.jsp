
<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMSSSBCVIEW001.jsp
 * Author: 윤석범 대리
 * Created on 2009. 12. 29.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.scard.hp.common.util.*" %>
<%@ page import="com.scard.common.security.util.DesManager" %>
<%@ page import="com.scard.hp.im.et.evt.vos.*" %>
<%@ page import="com.scard.hp.im.et.evt.vo.*" %>
<%
	DesManager desManager = new DesManager("des.key.db");
	EVENTCARDINFO001VOS vos = (EVENTCARDINFO001VOS) request.getAttribute("vos");
	ArrayList<WORLDCUPEV003VO> cardInfo = (ArrayList<WORLDCUPEV003VO>)vos.getListPage();
	WORLDCUPEV004VO eventInfo = (WORLDCUPEV004VO) request.getAttribute("eventInfo");
%>

<title>한국축구 승리기념 이벤트 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/ss.css" />
<style type="text/css">
body
	{ margin: 0; font: normal 12px/ 1.2 돋움;  color: #666; }
h1
	{ display: none; }
#header
	{ background: no-repeat url(/event/worldcup/images/soccer_img_t.jpg); vertical-align: top; }
#infomation
	{ width: 650px; margin: 130px 30px 0 30px; font: bold 14px/30px 돋움; color: #fff; text-align: center; }
#infomation b
	{ color: #f8ff3d; }
#event
	{ width: 650px; margin: 0 30px; }
#event th, #event td
	{ padding: 5px; padding: 5px; text-align: center; }
#event th
	{ border-top: 1px #ccc solid; border-bottom: 1px #ccc solid; color: #000; }
#event td
	{  border-bottom:1px #f2f2f2 solid; }
#event .left
	{ text-align: left !important; }
#pagination
	{ margin-top: 15px; margin-bottom: 15px; }
#pagination td
	{ padding: 0 7px; border-left: 0px #ccc solid; }
#pagination td.end
	{ border-right: none !important; }
#pagination td a, #pagination td b
	{ color: #000; text-decoration: none; }
#description
	{ width: 650px; margin: 0 30px; padding: 0 0 20px 0; text-align: left;  font: normal 11px/18px 돋움; color: #999; }

}
</style>
</head>

<body>

<h1>한국 축구 승리기원 이벤트 나는 대한민국 스트라이커? Why not?</h1>
<table width="710" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="224"  id="header">
			<table id="infomation" border="0" cellspacing="0" cellpadding="0" summary="슛기회, 골인, 획득 포인트 등을 확인하실 수 있습니다.">
            <caption>스트라이커 슛기회 및 골인, 획득 포인트 확인</caption>
            <tbody>
				<tr>
					<td>슛기회 : <b>[<%=eventInfo.getShootChance() %>]</b>번</td>
					<td>골인 : <b>[<%=eventInfo.getGoalCnt() %>]</b>골</td>
					<td>획득 포인트 : <b>[<%=eventInfo.getPoint() %>]</b>P</td>
				</tr>
               </tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table id="event" border="0" cellspacing="0" cellpadding="0" summary="이용일, 카드번호, 이용가맹점, 승인번호, 이용금액, 슛팅기회 등을 확인하실 수 있습니다.">
            <caption>슛팅기회</caption>
            <tbody>
				<tr>
					<th class="left">이용일</th>
					<th>카드번호</th>
					<th class="left">이용가맹점</th>
					<th>승인번호</th>
					<th>이용금액</th>
					<th>슛팅기회</th>
				</tr>
				<!-- @ loop -->
				<%
					int listCnt =0;
					for(WORLDCUPEV003VO vo : cardInfo){
						listCnt++;
				%>
				<tr>
					<td class="left"><%=HpCommonUtil.convertYYMMDDComma(vo.getApproveDate()) %></td>
					<td><%=HpCommonUtil.convCardNo(desManager.decryptNumber(vo.getCardNo())) %></td>
					<td class="left"><%=vo.getChainName() %></td>
					<td><%=vo.getApproveNo() %></td>
					<td><%=HpCommonUtil.getCommaStringForMoney(vo.getApproveAmount()+"") %></td>
					<td><%=vo.getTotalCount() %></td>
				</tr>
				<%
					}
				%>
				<!-- @ loop ed -->
                </tbody>
			</table>

			<table id="event" border="0" cellspacing="0" cellpadding="0">
			<%
				for(int i=0; i < 5-listCnt; i++)
					{
				%>
						<tr>
							<td class="left">&nbsp;</td>
							<td>&nbsp;</td>
							<td class="left">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
				<%
					}
				%>
			</table>

			<table border="0" align="center" cellpadding="0" cellspacing="0" id="pagination">
			<tr><td>
			<%if(listCnt > 0){ %>
			<div class="paginate">
				${_page}
			</div>
			<%}else{ %>
			&nbsp;<br />
			<%} %>

			</td></tr>

			</table>

			<p id="description">
			* 응모한 본인 카드 사용 승인 및 결제 건의 승인 취소 혹은 매출 취소될 경우, 해당 당첨 사실이 무효처리 됩니다.<br />
			* 본 행사는 개인신용카드만 해당됩니다(법인, 올앳카드, 기프트카드, 체크카드 등은 제외)
			</p>
		</td>
	</tr>
	<tr>
		<td height="30"><img src="/event/worldcup/images/soccer_img_b.jpg" width="710" height="30" border="0" alt="Copyright ? 2010. samsungcard. All rights reserved." usemap="#footer" /></td>
	</tr>
</table>

<map name="footer" id="footer">
	<area shape="rect" coords="675,7,696,25" href="#" onclick="self.close();" alt="창 닫기" />
</map>
</body>
</html>
