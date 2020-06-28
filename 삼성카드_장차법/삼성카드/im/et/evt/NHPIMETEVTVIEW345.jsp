<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMSSSBCVIEW001.jsp
 * Author: 소재민 대리
 * Created on 2010. 01. 15.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
	YOOT2011EV003VO eventInfo = (YOOT2011EV003VO) request.getAttribute("eventInfo");
%>

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>설 맞이 윷놀이 이벤트 - 삼성카드</title>
<style type="text/css">
p, body {margin:0; padding:0; color:#b9b0b0; font:normal 11px '돋움'; line-height:14px}
img  {border:0;}

a	{color:#b9b0b0; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}

ul, ol, li {list-style:none; margin:0; padding:0}

.event_bg {position:relative; width:700px; height:850px; background:url('/html/event/yoot2011/images/bg_event_game02.jpg') no-repeat; padding:117px 37px 0 38px}
h1, h2 {margin:0; padding:0}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
table	{width:625px; border-collapse:collapse; border-spacing:0; margin-top:20px; border-top:1px solid #d9d4d4; border-bottom:1px solid #cac3c3}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
th {background:#e1dcdc; padding:7px 0 7px 0; line-height:11px; text-align:center; border-bottom:1px solid #d8d3d3}
td {padding:8px 0 8px 0; text-align:center; line-height:14px; border-bottom:1px solid #e4e0e0}
th.riline {border-right:1px solid #d9d4d4}
td.riline {border-right:1px solid #e4e0e0}
td.cell_l10 {padding-left:10px; text-align:left}
td.cell_r20 {padding-right:20px; text-align:right}
.paging {margin:10px 0 8px 0; text-align:center; padding-right:40px}
.paging	 p	{display:inline-block; display:inline; padding:0 7px 0 7px;}
.paging	p.on {font-weight:bold}
.al_top {vertical-align:top}
.pt3 {padding-top:3px}

.btnclose {position:absolute; top:819px; left:302px}

</style>
</head>

<body>

<div class="event_bg">
	<h1 class="none">설 맞이 묘(卯)~한 윷놀이 게임!!</h1>
	<h2><img src="/html/event/yoot2011/images/h2_cardview.png" alt="행사 업종에서 이용한 카드내역" /></h2>
	<table summary="남은 토끼 개수, 윷 던지기 기회, 총 획득 포인트 등 행사 업종에서 이용한 카드내역을 확인하실 수 있습니다.">
    	<caption>행사 업종에서 이용한 카드내역</caption>
		<colgroup><col width="33%" /><col width="33%" /><col width="34%" /></colgroup>
		<thead>
		<tr>
			<th class="riline"><img src="/html/event/yoot2011/images/tit_event01.png" alt="남은 토끼 개수" /></th>
			<th class="riline"><img src="/html/event/yoot2011/images/tit_event02.png" alt="윷 던지기 기회" /></th>
			<th><img src="/html/event/yoot2011/images/tit_event03.png" alt="총 획득 포인트" /></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="riline"><%=eventInfo.getGoodsNo() %>개</td>
			<td class="riline">${shootChance}개</td>
			<td><%=eventInfo.getKeyValue() %>P</td>
		</tr>
		</tbody>
	</table>


	<table  summary="이용일, 카드명, 이용가맹점, 승인번호, 이용금액, 윷 던지기 기회 등 행사 업종에서 이용한 카드내역입니다.">
    <caption>행사 업종에서 이용한 카드내역</caption>
		<colgroup><col width="13%" /><col width="21%" /><col width="25%" /><col width="13%" /><col width="15%" /><col width="13%" /></colgroup>
		<thead>
		<tr>
			<th scope="col" class="riline"><img src="/html/event/yoot2011/images/tit_event04.png" alt="이용일" /></th>
			<th scope="col" class="riline"><img src="/html/event/yoot2011/images/tit_event05.png" alt="카드명" /></th>
			<th scope="col" class="riline"><img src="/html/event/yoot2011/images/tit_event06.png" alt="이용가맹점" /></th>
			<th scope="col" class="riline"><img src="/html/event/yoot2011/images/tit_event07.png" alt="승인번호" /></th>
			<th scope="col" class="riline"><img src="/html/event/yoot2011/images/tit_event08.png" alt="이용금액" /></th>
			<th scope="col"><img src="/html/event/yoot2011/images/tit_event09.png" alt="윷 던지기 기회" /></th>
		</tr>
		</thead>
		<tbody>

				<!-- @ loop -->
				<%
					int listCnt =0;
					for(WORLDCUPEV003VO vo : cardInfo){
						listCnt++;
				%>
				<tr>
					<td class="riline"><%=HpCommonUtil.convertYYMMDDComma(vo.getApproveDate()) %></td>
					<td class="cell_l10 riline"><%=HpCommonUtil.convCardNo(desManager.decryptNumber(vo.getCardNo())) %></td>
					<td class="cell_l10 riline"><%=vo.getChainName() %></td>
					<td class="riline"><%=vo.getApproveNo() %></td>
					<td class="cell_r20 riline"><%=HpCommonUtil.getCommaStringForMoney(vo.getApproveAmount()+"") %></td>
					<td><%=vo.getTotalCount() %></td>
				</tr>
				<%
					}
				%>
				<!-- @ loop ed -->
			<%
				for(int i=0; i < 10-listCnt; i++)
					{
				%>
						<tr>
							<td class="riline">&nbsp;</td>
							<td class="cell_l10 riline">&nbsp;</td>
							<td class="cell_l10 riline">&nbsp;</td>
							<td class="riline">&nbsp;</td>
							<td class="cell_r20 riline">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
				<%
					}
				%>				
						
		</tbody>
		</table>
		<!-- <p><a href="#"><img src="/html/event/yoot2011/images/ico_pre.png" alt="이전" class="al_top" /></a></p>
		<p><a href="#">1</a></p>
		<p class="on"><a href="#">2</a></p>
		<p><a href="#">3</a></p><p><a href="#">4</a></p><p><a href="#">5</a></p><p><a href="#">
		<img src="/html/event/yoot2011/images/ico_next.png" alt="다음" class="al_top" /></a></p>-->

		<%if(listCnt > 0){ %>
			
				${_page}
			
			<%}else{ %>
			
			<%} %>
					
	
	<ul>
		<li>* 응모한 본인카드의 승인 및 결제 건이 취소 될 경우, 해당 당첨 사실은 무효처리 됩니다.</li>
		<li>* 본 행사는 가족카드를 포함한 개인신용카드만 해당됩니다. (법인, 올댓, 기프트, 체크카드 등 제외)</li>
		<li>* 온라인 매출, 백화점 내 임대매장 및 해외매출은 제외됩니다.</li>
	</ul>
	<p class="btnclose"><a href="javascript:window.close()"><img src="/html/event/yoot2011/images/btn_close.png" alt="창닫기" /></a></p>
</div>

</body>
</html>	


