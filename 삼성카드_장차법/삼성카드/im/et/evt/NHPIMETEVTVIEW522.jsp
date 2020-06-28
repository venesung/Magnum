<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW518.jsp
 * Author: 모정서 과장
 * Created on 2012. 6. 25.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String rank		= (String)request.getAttribute("rank");
	String userId	= (String)request.getAttribute("userId");
	String cnt2		= (String)request.getAttribute("cnt2");
	String score	= (String)request.getAttribute("score");
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>나의 순위 보기 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

.t_black     {color:#333}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
select	{font-size:12px; letter-spacing:-1px}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px}
html:first-child	input.chk, input.rdo	{display:inline-block}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}

.d_easy  .dtable01  th.cell_r10, .d_easy    .dtable01   td.cell_r10 {padding-right:5px; text-align:right}
.dtable01   {border-collapse:separate; *border-collapse:collapse}
.dtable01   th  {padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #CCC; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01   th  p   {color:#333}
.dtable01   td  {padding:3px 0 3px; border-bottom:1px solid #F3F3F3; text-align:center; line-height:18px; word-break:keep-all}
.dtable01   tbody   th  {border-top:0 none; border-right:1px solid #E6E6E6; border-bottom:1px solid #F3F3F3}
.dtable01   tfoot   td  {padding-top:5px; padding-bottom:4px; color:#333; font:bold 12px "돋움"}
.dtable01   th.cell_l, .dtable01    td.cell_l, #cs  .board_view .prenext_article    .dtable01   td.cell_l   {padding-left:0; text-align:left}
.dtable01   th.cell_l10, .dtable01  td.cell_l10,    .dtable02   td.cell_l10, .dtable03  td.cell_l10 {padding-left:10px; padding-right:0; text-align:left}
.dtable01   th.cell_r10,    .dtable01   td.cell_r10, .dtable02  td.cell_r10, .dtable03  td.cell_r10 {padding-right:10px; padding-left:0; text-align:right}


#pop_s_wrap	{width:470px}
#pop_s_header	{width:100%; height:60px; background:url('/images/et/archery2012/popup_bg_s_body.jpg') no-repeat left top}
#pop_s_header	h1	{padding:19px 0 0 25px; font-size:0; line-height:0}
#pop_s_footer	{position:relative; width:470px; height:30px; background:url('/images/et/archery2012/popup_bg_s_body.jpg') no-repeat left bottom}
#pop_s_footer	.btn_s_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/archery2012/popup_bg_s_body.jpg') no-repeat 663px 0}
#pop_s_footer	.nottoday	{position:absolute; right:12px; top:6px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
#pop_s_content	{position:relative; width:425px; margin:25px 0 30px 30px; padding-right:10px;}

.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
.nottoday2	{position:absolute; right:42px; top:8px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
.nottoday2	.chk	{width:11px; height:11px}

.mt10	{margin-top:10px}
.mt15	{margin-top:15px}
.mt20	{margin-top:20px}
.mt30   {margin-top:30px}
.mt50   {margin-top:50px}
.mt5		{margin-top:5px}
.sel_m	{margin-left:5px; margin-right:10px}
.pl10	{padding-left:10px}

.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.t_point	{color:#333; font:bold 12px "돋움"; letter-spacing:-1px; line-height:18px}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.btnc	{text-align:center}
.cardno	{width:50px}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}

</style>
</head>
<body>

<!-- popup size: 470 * 302 -->
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/archery2012/h1_evenpopttitle.jpg" alt="나의 순위 보기" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content">
			<p>현재 <strong><%=userId %></strong> 회원님의 순위는 <strong><%=rank %></strong>등 입니다.</p>

			<table class="dtable01 mt5" summary="순위, 아이디, 명중수, 점수 등 나의 순위를 확인하실수 있습니다.">
			<caption>나의 순위 보기</caption>
			<colgroup><col width="25%" /><col width="25%" /><col width="25%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th scope="col" class="cell_l10">순위</th>
					<th scope="col" class="cell_l10">아이디</th>
					<th scope="col">명중수</th>
					<th scope="col">점수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10"><%=rank %>등</td>
					<td class="cell_l10"><%=userId %></td>
					<td><%=cnt2 %></td>
					<td><%=score %></td>
				</tr>
			</tbody>
			</table>

			<p class="mt50 btnc">
				<a href="javascript:window.close();"><img src="/images/et/archery2012/btn_confirm.png" alt="확인" /></a>
			</p>
	</div>

	<!-- footer -->
	<div id="pop_s_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
</body>
</html>
