<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%/*
 * Project Name: 이벤트 내역페이지
 * File Name: NHPIMETEVTVIEW366.jsp
 * Author: "소재민 과장"
 * Created on 2011. 11. 07.
 * 이벤트 내역페이지
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.scard.hp.common.util.*" %>
<%@ page import="com.scard.common.security.util.DesManager" %>
<%@ page import="com.scard.hp.im.et.evt.vos.*" %>
<%@ page import="com.scard.hp.im.et.evt.vo.*" %>
<%
	//cross-domain 처리
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	
	//no cache 처리
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);

	String event_insert = (String) request.getAttribute("event_insert");
	String count01 = (String) request.getAttribute("count01");
	String count02 = (String) request.getAttribute("count02");
	String count03 = (String) request.getAttribute("count03");
	String count04 = (String) request.getAttribute("count04");
	String count05 = (String) request.getAttribute("count05");
	String count06 = (String) request.getAttribute("count06");
	String count07 = (String) request.getAttribute("count07");
	EVENTCARDINFO001VOS vos = (EVENTCARDINFO001VOS) request.getAttribute("vos");
	ArrayList<NM2011EVT001VO> cardInfo = (ArrayList<NM2011EVT001VO>)vos.getListPage();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>생활에 더 많은 도움이 되는 참 실용적인 삼성카드 이벤트 - 삼성카드</title>
<%
	String chanceCnt = (String)request.getAttribute("intchanceCnt");//응모가능 횟수
	String usedCount = (String)request.getAttribute("usedCount");
%>

<style type="text/css">
/*공통*/
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align: top; font-size:0; line-height:0}
ul, ol, li	{list-style:none; list-style-position:outside}
.org_bold {color:#EE8F09; font:bold 12px "돋움"; letter-spacing:-1px}
.t_point	{color:#333; font:bold 12px "돋움"; letter-spacing:-1px}
a	{color:#666; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}
.al_top	{vertical-align:top}

/*팝업*/
#pop_wrap	{width:710px}
#pop_header	 {width:100%; height:60px; background:url('/images/et/number2011/pop_bg_body.jpg') no-repeat left top}
#pop_header	 h1	{padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/number2011/pop_bg_body.jpg') no-repeat 663px 0}
#pop_footer	.nottoday	{position:absolute; right:33px; top:6px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}	/* 110223 */
#pop_content	 {position:relative; width:100%; height:292px; margin:20px 0; overflow:auto}
#pop_content.h445	 {height:445px; overflow:auto; overflow-x:hidden}
#pop_content.h445	h2	 {margin-top:0}
#pop_footer	{position:relative; width:100%; height:30px; background:url('/images/et/number2011/pop_bg_body.jpg') no-repeat left bottom}
#pop_content	 .content_block	{width:650px; _height:100%; margin:30px 0 0 30px; padding-top:30px; border-top:1px solid #E6E6E6}
#pop_content	 .content_block2 	{width:650px; margin:30px 0 0 30px; padding-top:30px; border-top:1px solid #E6E6E6} /* 100826 */
#pop_content	 .content_block_card	{margin-top:0; padding-top:0; border-top:0 none}
#pop_content	 .content_block_tab	{padding-top:0; border-top:0 none;}
#pop_content	 .content_block	h2	 {float:left; width:150px; margin-top:0}
#pop_content	 .content_block	.content_block_inner	{float:left; width:500px; margin-top:0}
#pop_content	 h2.t_black {margin-bottom:10px; color:#333; font:bold 12px "돋움"; float:none;}
#pop_content	 .agree {width:650px; height:339px; overflow:hidden; overflow-y:scroll}
#pop_content	 .btn_print {text-align:right; border-bottom:1px solid #e6e6e6; padding-bottom:20px; margin-top:-30px;}
#pop_content	 .btn_print02 {text-align:center; border-top:1px solid #e6e6e6; margin-top:10px; padding-top:20px;}
#pop_content	 .btn_print03 {margin-top:15px; padding-right:15px; text-align:right;}
#pop_content	 .print_content {margin:25px 0; width:650px;}
#pop_content	 .print_content .logo {margin:0 0 45px 3px;}
#pop_content	 .print_content h2 {text-align:center; margin:0 0 45px 0; width:650px !important; float:none !important}
#pop_content	.winpop_sub_desc02	{padding-bottom:20px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px; line-height:12px}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/number2011/pop_bg_body.jpg') no-repeat 663px 0}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.bg_input	{position:relative; display:inline-block; height:30px; padding-left:13px; background:url('/images/et/number2011/bg_input.png') no-repeat 0 0}
.bg_input	input	{display:inline-block; height:20px; margin:5px 0; padding:0; border:0 none; background:; color:#333; ime-mode:inactive}
.bg_input	em	{position:absolute; right:0; right:-1px; top:0; display:inline-block; width:13px; height:30px; background:url('/images/et/number2011/bg_input.png') no-repeat right top; vertical-align:top}
.bg_input_on	{background-position:0 -40px}
.bg_input_on	em	{background-position:right -40px}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}

.textImg{margin-top: 15px;}
.textImg01{margin-top: 19px;}
.eventTable{margin-top: 30px; overflow:hidden;}
.eventTable01{margin-top: 20px; overflow:hidden;}

/*테이블*/
table	{width:100%; border-collapse:collapse; border-spacing:0;  width: 100%;}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
th.cell_bg, td.cell_bg, .dtable01	tr.cell_bg	td, .dtable02 tr.cell_bg td	{background:#FAFAFA; color:#333}
th.toline, td.toline	{border-top:1px solid #d7d7d7}
th.riline, td.riline	{border-right:1px solid #E6E6E6}
th.boline_b0, td.boline_b0	{border-bottom:0 !important}
td.boline_c, th.boline_c	{border-bottom:1px solid #CCC}
th.boline, td.boline	{border-bottom:1px solid #E6E6E6}
tr.nodata	td	{padding:7px 0 5px; background:#FAFAFA; color:#999; font:normal 11px "돋움"; letter-spacing:-1px; text-align:center}
.dtable01   {border-collapse:separate; *border-collapse:collapse}
.dtable01   th  {padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #CCC; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01   th  p   {color:#333}
.dtable01   td  {padding:2px 0 1px; border-bottom:1px solid #F3F3F3; text-align:center; line-height:18px; word-break:keep-all}
.dtable01   td.break  {word-break:break-all;} /* 110621 */
.dtable01   tbody   th  {border-top:0 none; border-right:1px solid #E6E6E6; border-bottom:1px solid #F3F3F3}
.dtable01   tfoot   td  {padding-top:5px; padding-bottom:4px; color:#333; font:bold 12px "돋움"}
.dtable01   tfoot   td.repay    {padding-top:5px; padding-bottom:4px; color:#333; font:bold 12px "돋움"; letter-spacing:-1px; text-align:left; padding-left:10px; padding-right:10px}  
.dtable01   tfoot   td  em  {font:bold 11px "돋움"; letter-spacing:-1px}
.dtable01   tfoot   td  em.t_ls0    {font:bold 11px "돋움"; letter-spacing:0}   /* 110324 */
.dtable01   tfoot   td  em.t_normal, .dtable01  tfoot   td.t_normal {font-weight:normal}
.dtable01   th.cell_r10, .dtable01  td.cell_r10 {padding-right:10px; text-align:right}
.dtable01   th.cell_r, .dtable01    td.cell_r   {padding-right:5px; text-align:right}
.dtable01   tfoot   td.cell_r, .dtable01    tbody   td.cell_r   {text-align:right}
.dtable01   td.noline   { word-break:keep-all; border:none;}
.dtable01   th  .t_desc03   {color:#999}
.dtable01   .list_no01  {margin-left:-10px}
.dtable01   th.inner_tbl {border-top:1px solid #CCC; border-bottom:1px solid #CCC; border-right:0 none; color:#333} /* PVI 적용 수정 101208 */
.dtable01   th.riline {border-right:1px solid #E6E6E6} /* PVI 적용 수정 101208 */
.dtable01   th.line_btm {border-bottom:1px solid #e6e6e6} /* 101231 */
.dtable01   th.noline_top   {border-top:0 none} /* 101231 */
.dtable01	th.cell_l, .dtable01	td.cell_l, #cs	.board_view	.prenext_article	.dtable01	td.cell_l	{padding-left:0; text-align:left}
.dtable01	th.cell_l10, .dtable01	td.cell_l10,	.dtable02	td.cell_l10, .dtable03	td.cell_l10	{padding-left:10px; padding-right:0; text-align:left}
.dtable01	th.cell_r10,	.dtable01	td.cell_r10, .dtable02	td.cell_r10, .dtable03	td.cell_r10	{padding-right:10px; padding-left:0; text-align:right}

.paginate	{position:relative}
.paging_line	{border-top:1px solid #F4F4F4}
.paginate	.paging	{padding-top:18px; text-align:center}
.paginate	.paging	.btn	{margin:0 9px 0 8px}
.paginate	.num	 {overflow:hidden}
.paginate	.num	 a:first-child	{background:0 none}
.paginate	.num	 a	{display:inline-block; width:20px; height:20px; background:url('/images/et/number2011/ppage_bar.png') no-repeat 0 center; font:normal 11px "돋움"; line-height:20px; text-align:center}
.paginate	.num	 strong	{height:20px; color:#333; font:bold 11px "돋움"; line-height:20px}
.paginate	p.p_page	{position:absolute; left:15px; top:22px; color:#666; font:normal 11px "돋움"; text-align:left}
.paginate	p.p_page	em	{color:#333; font:normal 11px "돋움"}
.paginate	.btnr	{position:absolute; right:0; top:2px}
.paginate	.btnl	{position:absolute; left:0; top:2px}

/* button */
.btnl	{margin-top:11px}
.btnr	{margin-top:11px; text-align:right}
.btnc	{margin-top:11px; text-align:center}
.btnc_30	{margin-top:30px; text-align:center}
.btnc_50	{margin-top:50px; text-align:center}
.btnset	{width:100%; overflow:auto; overflow:hidden}
.btnset	.btnl	{display:inline; float:left}
.btnset	.btnr	{float:right}
.btnset	.t_desc04	{padding-left:10px}
.btnset	.list_desc	{float:left; margin-top:0}
.btnset	.list_desc	li	p	{display:inline-block}
.btnset	.list_desc	p	{/*width:100%;*/ break-word:keep-all}
.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn	{cursor:pointer; vertical-align:middle}
span.btn	{cursor:default}
span.btn, span.btn	span	{color:#999}
.btn_white	{background:url('/images/et/number2011/bg_button.png') no-repeat}
.btn_white span, .btn_white input {left:12px; height:26px; padding:0 13px 0 0; background:url('/images/et/number2011/bg_button.png') no-repeat right top; letter-spacing:-1px; line-height:26px}
.bg_input .btn_white	 {background-position:0 -150px}
.bg_input .btn_white input	{height:30px; padding:0 27px 0 13px; background-position:right -150px; font-weight:bold; letter-spacing:-1px}
.btn_blue	{background:url('/images/et/number2011/bg_button.png') no-repeat 0 -30px}
.btn_blue span, .btn_blue input {left:12px; height:26px; padding:0 13px 0 0; background:url('/images/et/number2011/bg_button.png') no-repeat right -30px; color:white; letter-spacing:-1px; line-height:26px}
.btn_s_white	{background:url('/images/et/number2011/bg_button.png') no-repeat 0 -60px}
.btn_s_white span, .btn_s_white input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/et/number2011/bg_button.png') no-repeat right -60px; line-height:21px; font-size:11px; letter-spacing:-1px; cursor:pointer}
.btn_s_gray	{background:url('/images/et/number2011/bg_button.png') no-repeat 0 -90px}
.btn_s_gray span, .btn_s_gray input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/et/number2011/bg_button.png') no-repeat right -90px; line-height:21px; color:white; font-size:11px; letter-spacing:-1px}
.btn_s_blue	{background:url('/images/et/number2011/bg_button.png') no-repeat 0 -120px}
.btn_s_blue span, .btn_s_blue input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/et/number2011/bg_button.png') no-repeat right -120px; line-height:21px; color:white; font-size:11px; letter-spacing:-1px}
.mt_btn	{*margin-top:1px}
</style>
</head>
<body>

<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header"><!-- 010311_버튼footer로 -->
		<h1><img src="/images/et/number2011/lunching_pop_title.png" alt="응모내역 보기" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h445 yscroll">
		<div class="content_block content_block_card clfix">
			<p class="textImg"><img src="/images/et/number2011/lunching_pop_text01.png" alt="생활에 더 많은 도움이 되는 참 실용적인 삼성카드!" /></p>
			<p class="textImg01"><img src="/images/et/number2011/lunching_pop_text02.png" alt="행사기간인 2011년 11월 11일 ~ 12월 10일 동안의 삼성카드 이용금액을 합산하여 10만원당 1회의 경품선택의 기회가 주어집니다." /></p>
			<div class="eventTable">
			<table class="dtable01" summary="총 응모횟수 및 응모가능횟수 확인하실 수 있습니다.">
				<caption>응모횟수 확인</caption>
				<colgroup><col width="17%" /><col width="16%" /><col width="9%" /><col width="9%" /><col width="9%" /><col width="9%" /><col width="9%" /><col width="9%" /><col width="9%" /></colgroup>
				<thead>
					<tr>
						<th scope="col" class="cell_bg">총 응모횟수</th>
						<th scope="col" class="cell_bg">응모가능횟수</th>
						<th scope="col" class="cell_bg">1</th>
						<th scope="col" class="cell_bg">2</th>
						<th scope="col" class="cell_bg">3</th>
						<th scope="col" class="cell_bg">4</th>
						<th scope="col" class="cell_bg">5</th>
						<th scope="col" class="cell_bg">6</th>
						<th scope="col" class="cell_bg">7</th>
					</tr>
				</thead>
				<tbody>
					<!-- loop -->
					<tr>
						<td><span class="t_point"><%=usedCount %></span> 회</td>
						<td><span class="org_bold"><%=chanceCnt %></span> 회</td>
						<td><%=count01 %>번</td>
						<td><%=count02 %>번</td>
						<td><%=count03 %>번</td>
						<td><%=count04 %>번</td>
						<td><%=count05 %>번</td>
						<td><%=count06 %>번</td>
						<td><%=count07 %>번</td>
					</tr>
					<!-- //loop -->
					<tr>
				</tbody>
				</table>
			</div>
			<div class="eventTable01">
			<table class="dtable01" summary="응모일자, 응모숫자, 응모경품 등 응모내역을 확인하실 수 있습니다.">
				<caption>응모내역</caption>
				<colgroup><col width="15%" /><col width="15%" /><col width="70%" /></colgroup>
				<thead>
					<tr>
						<th scope="col" class="cell_bg">응모일자</th>
						<th scope="col" class="cell_bg">응모숫자</th>
						<th scope="col" class="cell_bg cell_l10">응모경품</th>
					</tr>
				</thead>
				<tbody>
					<!-- loop -->
					<!-- @ loop -->
					<%
						int listCnt =0;
						int i = 0;
						
						for(NM2011EVT001VO vo : cardInfo){
							listCnt++;
					%>
					<tr>
						<td class="al_top"><%=HpCommonUtil.convertYYMMDDComma(vo.getApproveDate()) %></td>
						<td class="al_top"><%=vo.getGoodsNo()%></td>
						<td class="cell_l10 al_top">
						<%
						String[] arrItemName = vo.getGoodsName().split(",");
						for (i=0;i<arrItemName.length;i++) {
							if (arrItemName[i].equals("101")) { %>
								삼성 하이브리드 카메라 NX11B2L/BS<br/><%
							} else if (arrItemName[i].equals("102")) { %>
								삼성 지펠 홈바형 냉장고 SRS75HCBGG<br/><%
							} else if (arrItemName[i].equals("103")) { %>
							삼성 기프트카드 100만원권<br/><%
							} else if (arrItemName[i].equals("104")) { %>
							삼성 LED TV UN32D5550RF<br/><%
							} else if (arrItemName[i].equals("105")) { %>
							삼성 지펠아삭 김치냉장고 KRS281WQVB<br/><%
							} else if (arrItemName[i].equals("201")) { %>
							필립스 센소터치3D RQ1280cc<br/><%
							} else if (arrItemName[i].equals("202")) { %>
							쿠첸 명품철장 10인용 WHA-BT1000iD<br/><%
							} else if (arrItemName[i].equals("203")) { %>
							신세계백화점 상품권 50만원<br/><%
							} else if (arrItemName[i].equals("204")) { %>
							벤타 에어워셔 LW24 PLUS<br/><%
							} else if (arrItemName[i].equals("205")) { %>
							illy커피머신 mitaca i-1<br/><%
							} else if (arrItemName[i].equals("206")) { %>
							삼성 스마트 탱고 로봇 청소기 VC-RM52V<br/><%
							} else if (arrItemName[i].equals("301")) { %>
							삼천리 2011년형 MTB형 팀콤프2.9D 26인치 자전거<br/><%
							} else if (arrItemName[i].equals("302")) { %>
							샘소나이트 가죽서류가방<br/><%
							} else if (arrItemName[i].equals("303")) { %>
							정관장 홍삼톤 리미티드<br/><%
							} else if (arrItemName[i].equals("304")) { %>
							필립스 커피머신 HD 8323<br/><%
							} else if (arrItemName[i].equals("305")) { %>
							필립스 센소터치3D RQ1250/16<br/><%
							} else if (arrItemName[i].equals("306")) { %>
							삼성 디카 Samsung EC-WB700<br/><%
							} else if (arrItemName[i].equals("401")) { %>
							오쿠 만능요리기 OC-8300RN<br/><%
							} else if (arrItemName[i].equals("402")) { %>
							WMF 디아뎀플러스 후라이팬 2종<br/><%
							} else if (arrItemName[i].equals("403")) { %>
							D&G WATCH DW0484(M)<br/><%
							} else if (arrItemName[i].equals("404")) { %>
							D&G WATCH DW0520(W)<br/><%
							} else if (arrItemName[i].equals("405")) { %>
							테팔 전기그릴 엑셀리오 엠비언스 멀티그릴 TG601051<br/><%
							} else if (arrItemName[i].equals("406")) { %>
							삼성 트윈챔버(스텔스) 청소기 VC-BR836<br/><%
							} else if (arrItemName[i].equals("407")) { %>
							삼천리 2011년형 레스포 MTB형 팝콘 MT 26인치 자전거<br/><%
							} else if (arrItemName[i].equals("408")) { %>
							독일 치보 카피시모 에스프레소 캡슐커피머신<br/><%
							} else if (arrItemName[i].equals("501")) { %>
							샘소나이트 콤보서류가방<br/><%
							} else if (arrItemName[i].equals("502")) { %>
							정관장 홍삼추출액-양<br/><%
							} else if (arrItemName[i].equals("503")) { %>
							필립스 소니케어 HX6972<br/><%
							} else if (arrItemName[i].equals("504")) { %>
							테팔 심플리 롱글라이드 코팅 블랙 세트 <br/><%
							} else if (arrItemName[i].equals("505")) { %>
							삼성 방수 캠코더 HMX-W200TD<br/><%
							} else if (arrItemName[i].equals("506")) { %>
							테팔 베르살리오 디럭스 멀티쿠커 FR402373<br/><%
							} else if (arrItemName[i].equals("507")) { %>
							정관장 홍삼톤 리미티드 30포<br/><%
							} else if (arrItemName[i].equals("508")) { %>
							천호식품 흑마늘 진액 오리지널80ml*60*2박스<br/><%
							} else if (arrItemName[i].equals("509")) { %>
							CJ 외식 상품권 20만원권<br/><%
							} else if (arrItemName[i].equals("510")) { %>
							SILIT 실리트 바리아노바 곰솥 26cm<br/><%
							} else if (arrItemName[i].equals("601")) { %>
							정관장 아이패스 H<br/><%
							} else if (arrItemName[i].equals("602")) { %>
							정관장 홍삼톤골드<br/><%
							} else if (arrItemName[i].equals("603")) { %>
							드롱기 무선 전기주전자 KBO2001<br/><%
							} else if (arrItemName[i].equals("604")) { %>
							kochstar 에코 다이아몬드 코팅 세트<br/><%
							} else if (arrItemName[i].equals("605")) { %>
							샘소나이트 Saffiano 지갑+벨트 세트<br/><%
							} else if (arrItemName[i].equals("606")) { %>
							쿠첸 듀얼스팀청소기 CSC-D910<br/><%
							} else if (arrItemName[i].equals("607")) { %>
							한경희생활과학 SVRT-6200GD<br/><%
							} else if (arrItemName[i].equals("608")) { %>
							SILIT 실리트 콰드로 곰솥 24cm<br/><%
							} else if (arrItemName[i].equals("609")) { %>
							삼성 전자레인지 RE-C23BRZ <br/><%
							} else if (arrItemName[i].equals("610")) { %>
							삼성 디카 Samsung EC-ST65<br/><%
							} else if (arrItemName[i].equals("611")) { %>
							쿠첸 6인용 압력밥솥 CPP-Q06LB11F<br/><%
							} else if (arrItemName[i].equals("612")) { %>
							삼성카드 서비스포인트 16만점<br/><%
							} else if (arrItemName[i].equals("701")) { %>
							정관장 홍삼톤 마일드 30포<br/><%
							} else if (arrItemName[i].equals("702")) { %>
							정관장 홍이장군 올튼<br/><%
							} else if (arrItemName[i].equals("703")) { %>
							지멘스 커피메이커 TC60203V<br/><%
							} else if (arrItemName[i].equals("704")) { %>
							삼성 디카 Samsung EC-ES80<br/><%
							} else if (arrItemName[i].equals("705")) { %>
							테팔 심플리 롱글라이드 코팅 블랙 세트<br/><%
							} else if (arrItemName[i].equals("706")) { %>
							kochstar 블루다이아몬드 후라이팬 세트<br/><%
							} else if (arrItemName[i].equals("707")) { %>
							SKK 세라믹 냄비 3종 세트(18편수, 20양수, 24전골)<br/><%
							} else if (arrItemName[i].equals("708")) { %>
							천호식품 산수유1000 프리미엄 4g X 60포 X 2박스<br/><%
							} else if (arrItemName[i].equals("709")) { %>
							드롱기 토스터기 CTO2003<br/><%
							} else if (arrItemName[i].equals("710")) { %>
							WMF 2종세트 16cm Low, 16cm 편수<br/><%
							} else if (arrItemName[i].equals("711")) { %>
							한경희생활과학 살균스팀다리미 HISP-6000G<br/><%
							} else if (arrItemName[i].equals("712")) { %>
							필립스 쥬서기 HR1861<br/><%
							} else if (arrItemName[i].equals("713")) { %>
							삼성카드 서비스포인트 14만점<br/><%
							} else if (arrItemName[i].equals("714")) { %>
							삼성카드 캐시백 14만원<br/><%
							}
						}
						%>
						</td>
					</tr>
					<%
						}

					%>
					<tr>
				</tbody>
				</table>
				<!-- paginate -->
				
				<div class="paginate">
				<%if (cardInfo.isEmpty()) {%>
				<div class="pgaing" align="center">
					응모내역이 없습니다
					</div>
				<%} else {%>
				${_page}
				<%} %>
				
				</div>
				<!-- <div class="paginate">
					<div class="paging">
                        <a href="#" class="btn btn_s_white" title="이전" ><span>이전</span></a>
						<span class="num">
							<a href="#" class="first_none">1</a><a href="#">2</a><a href="#">3</a><a href="#"><strong>4</strong></a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a>
						</span>
                        <a href="#" class="btn btn_s_white" title="다음" ><span>다음</span></a>
					</div>
				</div>-->
			</div>
		</div>
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> <!-- 100311 -->
	</div>

</div>

</body>
</html>
