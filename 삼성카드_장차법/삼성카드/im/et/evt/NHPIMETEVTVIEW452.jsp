<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMSSSBCVIEW001.jsp
 * Author: 소재민 대리
 * Created on 2011. 12. 28.
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
<title>행사대상 가맹점 카드 이용내역 조회 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
p {margin:0; padding:0}
/* 111227 추가 */
h1 {margin:0; padding:0;font-size: 0;}
/* //111227 추가 */
ul, ol, li	{list-style:none; list-style-position:outside}

#pop_wrap .pop_2_wrap{background: url("/images/et/yoot2012/laypopimg02.jpg") no-repeat left top; width: 700px; height: 850px; position: relative;}
.pop_2_wrap .btn_close01{background-position: left top; height: 22px; right: 328px; top: 819px; width: 69px; position: absolute;}
/* 111227 수정 */
.pop_2_wrap .img_l_pop{background:url("/images/et/yoot2012/laypopbtn01.png") no-repeat 0 0; overflow: hidden; z-index: 513;}
/* //111227 수정 */
.btn_input{border: 0 none; cursor:pointer; overflow: hidden; text-indent: -5000px;}

.pop_2_wrap .lay_pop_h1{padding: 117px 0 0 38px;}
.border_r{border-right: 1px solid #d9d4d4;}
.border_none{border-right: none;}
.left01{text-align: left; padding: 0 0 0 12px;}
table	{width:624px; border-collapse:collapse; border-spacing:0; margin:20px 0 0 38px; }
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
table th{padding: 7px 0; background: #e0dcdc; border-top: 1px solid #d9d4d4; border-bottom: 1px solid #d9d4d4; text-align: center;}
table td{padding: 5px 0; border-bottom: 1px solid #d9d4d4; text-align: center; font-size: 12px; color: #b9b0b0;}
th, td	 {word-break: break-all}
.paging * {vertical-align: top; line-height: 1em;}
.paginate	{position:relative;}
.paginate_line	{border-top:1px solid #f4f4f4}
.paginate	.paging	{padding-top:10px; text-align:center}
.paginate	.paging	.btn	{margin:3px 0 0 5px}
.paginate	.num	 {overflow:hidden;vertical-align: top;}
.paginate	.num	 a:first-child	{background:0 none}
.paginate	.num	 a	{display:inline-block; width:20px; height:17px; font:normal 11px "돋움"; line-height:20px; text-align:center}
.paginate	.num	 strong	{height:20px; color:#b9b0b0; font:bold 11px "돋움"; line-height:20px}
.paginate	p.p_page	{position:absolute; left:15px; top:22px; color:#666; font:normal 11px "돋움"; text-align:left}
.paginate	p.p_page	em	{color:#333; font:normal 11px "돋움"}
.paginate	.btn	{display: inline-block;margin: 5px 0 0;}
.ulList{ padding: 10px 0 0 38px;}
.ulList li{font-size: 11px; color: #a49898; line-height: 1.2em;}
a	{color:#b9b0b0; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}
</style>
</head>

<body>
<div id="pop_wrap">
	<div class="pop_2_wrap">
	<input type="button" title="창닫기" value="닫기" onclick="self.close();" class="img_l_pop btn_close01 btn_input" />
	<h1 class="lay_pop_h1"><img src="/images/et/yoot2012/laypop01_title.png" alt="행사대상 가맹점 카드 이용내역 조회" /></h1>
		<table summary="남은 용 개수, 윷 던질 기회, 총 획득 포인트 등 행사대상 가맹점 카드 이용내역입니다." border="0" cellspacing="0" cellpadding="0">
		<colgroup><col width="33%" /><col width="33%" /><col width="34%" /></colgroup>
			<caption>행사대상 가맹점 카드 이용내역</caption>
<!-- //111227 수정 -->
			<thead>
			<tr>
<!-- 111227 수정 -->
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text01.png" alt="남은 용 개수" /></th>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text02.png" alt="윷 던질 기회" /></th>
<!-- //111227 수정 -->
				<th scope="col" class="border_r border_none"><img src="/images/et/yoot2012/laypop01_table_text03.png" alt="총 획득 포인트" /></th>
			</tr>
			</thead>			
			<tbody>
			<tr>
				<td class="border_r"><%=eventInfo.getGoodsNo() %>개</td>
				<td class="border_r">${shootChance}개</td>
<!-- 111227 수정 -->
				<td class="border_r border_none"><%=eventInfo.getKeyValue() %>P</td>
<!-- //111227 수정 -->
			</tr>
			</tbody>
		</table>
		
		<table summary="이용일, 카드명, 이용가맹점, 승인번호, 이용기회, 윷 던질 기회 등 행사대상 가맹점 카드 이용내역입니다" border="0" cellspacing="0" cellpadding="0">
		<colgroup><col width="12%" /><col width="25%" /><col width="29%" /><col width="11%" /><col width="10%" /><col width="13" /></colgroup>
			<caption>행사대상 가맹점 카드 이용내역</caption>
<!-- //111227 수정 -->
			<thead>
			<tr>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text04.png" alt="이용일" /></th>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text05.png" alt="카드명" /></th>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text06.png" alt="이용가맹점" /></th>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text07.png" alt="승인번호" /></th>
				<th scope="col" class="border_r"><img src="/images/et/yoot2012/laypop01_table_text08.png" alt="이용기회" /></th>
<!-- 111227 수정 -->
				<th scope="col" class="border_r border_none"><img src="/images/et/yoot2012/laypop01_table_text02.png" alt="윷 던질 기회" /></th>
<!-- //111227 수정 -->
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
					<td class="border_r"><%=HpCommonUtil.convertYYMMDDComma(vo.getApproveDate()) %></td>
					<td class="border_r left01"><%=HpCommonUtil.convCardNo(desManager.decryptNumber(vo.getCardNo())) %></td>
					<td class="border_r left01"><%=vo.getChainName() %></td>
					<td class="border_r"><%=vo.getApproveNo() %></td>
					<td class="border_r"><%=HpCommonUtil.getCommaStringForMoney(vo.getApproveAmount()+"") %></td>
					<td class="border_r border_none"><%=vo.getTotalCount() %></td>
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
							<td class="border_r">&nbsp;</td>
							<td class="border_r left01">&nbsp;</td>
							<td class="border_r left01">&nbsp;</td>
							<td class="border_r">&nbsp;</td>
							<td class="border_r">&nbsp;</td>
							<td class="border_r border_none">&nbsp;</td>
						</tr>
				<%
					}
				%>				
	
	
		</tbody>
		</table>
	<div class="paginate">
		<%if(listCnt > 0){ %>
			
				${_page}
			
			<%}else{ %>
			
			<%} %>
	</div>					
	
	<ul class="ulList">
			<li>* 응모하신 본인카드의 이용승인/결제건이 승인 취소/매출 취소가 될 경우 해당 경품 당첨이 무효처리 됩니다.</li>
			<li>* 법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
	</ul>
</div>

</body>
</html>	


