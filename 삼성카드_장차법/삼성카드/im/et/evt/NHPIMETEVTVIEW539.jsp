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

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>악어룰렛 GAME 이벤트 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}
.t_point	{color:#333; font:bold 12px "돋움"; letter-spacing:-1px}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.t_point_org	{color:#EE8F09}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
.mt5	{margin-top:5px}
.mt10	{margin-top:10px}
.mt15	{margin-top:15px}
.mt25	{margin-top:25px}
.list_rice  li  {padding:0 0 4px 16px; background:url('/html/event/croc/images/bul_billards.png') no-repeat 0 4px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px; line-height:16px} 
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn	{cursor:pointer; vertical-align:middle}
a	{color:#666; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}

#pop_wrap	{width:710px}
#pop_header	 {width:100%; height:60px; background:url('/html/event/croc/images/pop_bg_body.jpg') no-repeat left top}
#pop_header	 h1	{padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/html/event/croc/images/pop_bg_body.jpg') no-repeat 663px 0}
#pop_content	 {position:relative; width:100%; height:292px; margin:35px 0 20px 0; overflow:auto}
#pop_content.h460	 {height:460px; overflow:auto; overflow-x:hidden}
#pop_footer	{position:relative; width:100%; height:30px; background:url('/html/event/croc/images/pop_bg_body.jpg') no-repeat left bottom}
#pop_content	 .content_block	{width:650px; _height:100%; margin:30px 0 0 30px; padding-top:30px; border-top:1px solid #E6E6E6}
#pop_content	 .content_block_card	{margin-top:0; padding-top:0; border-top:0 none}
#pop_content	 .content_block	h2	 {float:left; width:150px; margin-top:0}
#pop_content	 .content_block	.content_block_inner	{float:left; width:500px; margin-top:0}

.dtable01   {border-collapse:separate; *border-collapse:collapse}
.dtable01   th  {padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #CCC; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01	th.cell_l, .dtable01	td.cell_l, #cs	.board_view	.prenext_article	.dtable01	td.cell_l	{padding-left:0; text-align:left}
.dtable01	th.cell_l10, .dtable01	td.cell_l10,	.dtable02	td.cell_l10, .dtable03	td.cell_l10	{padding-left:10px; padding-right:0; text-align:left}
.dtable01   th.cell_r10, .dtable01  td.cell_r10 {padding-right:10px; text-align:right}
.dtable01   td  {padding:2px 0 1px; border-bottom:1px solid #F3F3F3; text-align:center; line-height:18px; word-break:keep-all}
.dtable01   tfoot   td  {padding-top:5px; padding-bottom:4px; color:#333; font:bold 12px "돋움"}
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   td.al_mid   {vertical-align:middle}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_r10, .dtable02  td.cell_r10 {text-align:right}
.dtable02   th.cell_r10 p, .dtable02    td.cell_r10 p   {padding-right:10px; padding-left:0}
.dtable02   td.bo_no_line {border-bottom:0px} 
.dtable02   td.p0 {padding:0px 0 5px; line-height:14px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} 
th.riline, td.riline	{border-right:1px solid #E6E6E6}

.btn_s_white	{background:url('/html/event/croc/images/bg_button.png') no-repeat 0 -60px}
.btn_s_white span, .btn_s_white input {left:9px; height:21px; padding:0 10px 0 0; background:url('/html/event/croc/images/bg_button.png') no-repeat right -60px; line-height:21px; font-size:11px; letter-spacing:-1px; cursor:pointer}
.paginate	{position:relative}
.paginate	.paging	{padding-top:18px; text-align:center}
.paginate	.paging	.btn	{margin:0 9px 0 8px}
.paginate	.num	 {overflow:hidden}
.paginate	.num	 a:first-child	{background:0 none}
.paginate	.num	 a	{display:inline-block; width:20px; height:20px; background:url('/html/event/croc/images/page_bar.png') no-repeat 0 center; font:normal 11px "돋움"; line-height:20px; text-align:center}
.paginate	.num	 strong	{height:20px; color:#333; font:bold 11px "돋움"; line-height:20px}
.paginate	p.p_page	{position:absolute; left:15px; top:22px; color:#666; font:normal 11px "돋움"; text-align:left}
.paginate	p.p_page	em	{color:#333; font:normal 11px "돋움"}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
</head>

<body>
<!--  -->
<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/html/event/croc/images/pop_h1_game.png" alt="악어룰렛 GAME 이벤트" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h460">
		<div class="content_block content_block_card">
			<p><strong class="t_point">악어룰렛 GAME 이용 내역 및 도전 기회</strong></p>
			<table class="dtable02 dtable_expand mt10" summary="남은악어개수, 악어룰렛도전기회, 획득포인트를 알 수 있는 게시판입니다.">
			<caption>악어룰렛이벤트 게시판</caption>
			<colgroup><col width="100" /><col width="115" /><col width="120" /><col width="115" /><col width="85" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th scope="row" class="riline"><p>남은 악어 개수</p></th>
					<td class="riline"><p><strong class="t_point_org"><%=eventInfo.getGoodsNo() %></strong>마리</p></td>
					<th scope="row" class="riline"><p>악어룰렛 도전 기회</p></th>
					<td class="riline"><p><strong class="t_point_org">${shootChance}</strong>회</p></td>
					<th scope="row" class="riline"><p>획득 포인트 </p></th>
					<td><p><strong class="t_point_org"><%=eventInfo.getKeyValue() %></strong>P</p></td>
				</tr>
			</tbody>
			</table>

			<table class="dtable01 mt10" summary="이용일, 카드명, 이용가맹점명, 승인번호, 이용금액, 악어룰렛도전기회를 알 수 있는 게시판입니다.">
			<caption>악어룰렛 이용내역 상세 알림 게시판</caption>
			<colgroup><col width="85" /><col width="155" /><col width="160" /><col width="75" /><col width="60" /><col width="*" /></colgroup>
			<thead>
				<tr>
					<th scope="col">카드 이용일</th>
					<th scope="col" class="cell_l10">카드명</th>
					<th scope="col" class="cell_l10">이용가맹점</th>
					<th scope="col" class="cell_r10">승인번호</th>
					<th scope="col" class="cell_r10">이용금액</th>
					<th scope="col">악어룰렛 도전 기회</th>
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
					<td><p class="t_no"><%=HpCommonUtil.convertYYMMDDComma(vo.getApproveDate()) %></p></td>
					<td class="cell_l10"><p><%=HpCommonUtil.convCardNo(desManager.decryptNumber(vo.getCardNo())) %></p></td>
					<td class="cell_l10"><p><%=vo.getChainName() %></p></td>
					<td class="cell_r10"><p class="t_no"><%=vo.getApproveNo() %></p></td>
					<td class="cell_r10"><p class="t_no"><%=HpCommonUtil.getCommaStringForMoney(vo.getApproveAmount()+"") %></p></td>
					<td><p class="t_no"><%=vo.getTotalCount() %></p></td>
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
					<td><p class="t_no">&nbsp;</p></td>
					<td class="cell_l10"><p>&nbsp;</p></td>
					<td class="cell_l10"><p>&nbsp;</p></td>
					<td class="cell_r10"><p class="t_no">&nbsp;</p></td>
					<td class="cell_r10"><p class="t_no">&nbsp;</p></td>
					<td><p class="t_no">&nbsp;</p></td>
				</tr>						
				<%
					}
				%>		
							
				<!-- loop -->
			</tbody>
			</table>

			<!-- paginate -->
			<div class="paginate">
			<%if(listCnt > 0){ %>
			
				${_page}
			
			<%}else{ %>
			
			<%} %>			
			</div>
			<!-- <div class="paginate">
				<div class="paging">
					<a href="#" class="btn btn_s_white"><span>이전</span></a>
					<span class="num">
						<a href="#" class="first_none"><strong>1</strong></a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a>
					</span>
					<a href="#" class="btn btn_s_white"><span>다음</span></a>
				</div>
			</div>-->
		
			<ul class="list_rice mt25">
				<li>응모한 본인카드 승인 및 결제 건의 승인 취소 혹은 매출 취소 시, 본 이벤트의 포인트 적립 및 당첨 사실이 무효처리 됩니다.</li>
				<li>본 이벤트는 개인신용카드 및 가족카드만 해당되며 법인카드, 체크카드, 올앳카드, 기프트카드는 제외됩니다.</li>
			</ul>

		</div>

	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
<!-- 신규 끝 -->


</body>
</html>	


