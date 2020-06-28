<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 오페라의 유령 - 삼성카드</title>
<%
	String applyDate = request.getAttribute("applyDate").equals("") ? " 년 월 일 오후 시":(String)request.getAttribute("applyDate");

	String eventYn = (String)request.getAttribute("eventYn");
	System.out.println("##################applyDate : " + applyDate);
	System.out.println("##################eventYn : " + eventYn);
%>
<!-- 120627 삭제 -->
<!-- <link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/class.css" / -->
<!-- //120627 삭제 -->
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<style type="text/css"> 
/*120627 추가*/
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
a.btn_link:link, a.btn_link:visited {color: #5a96c8; text-decoration: underline;}
a.btn_link:hover, a.btn_link:active {color: #5a96c8; text-decoration: underline;}
.content_block_card	{margin-top:0; border-top:0 none}
.clfix {display:inline-block}
.clfix:after {content:"."; display:block; clear:both; height:0; visibility:hidden}
.mt20 { margin-top: 20px;}
.al_center	{text-align:center}
th.riline, td.riline	{border-right:1px solid #E6E6E6}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}/*120627 2차수정*/
 
/* popup_window */
#pop_wrap	{width:710px}
#pop_header	 {width:100%; height:60px; background:url('/images/et/pop_bg_body.jpg') no-repeat left top}
#pop_header	 h1	{padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/pop_bg_body.jpg') no-repeat 663px 0}
#pop_content	 {position:relative; width:100%; height:292px; margin:20px 0; overflow:auto}
#pop_footer	{position:relative; width:100%; height:30px; background:url('/images/et/pop_bg_body.jpg') no-repeat left bottom}
#pop_content	 .content_block_card	{margin-top:0; padding-top:0; border-top:0 none}
#pop_content	 .content_block	.content_block_inner	{float:left; width:500px; margin-top:0}
 
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
 
 
 
/* popup_layer */
.pop_l_position	{position:absolute; left:40%; _left:480px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */
.pop_l_position640	{left:30%; _left:380px}
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/pop_bg_layer02.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:45px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:24px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_sub_desc	{margin-bottom:10px; color:#666; font:normal 12px "돋움"; line-height:16px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin:0 auto; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{height:175px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert02,
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert02	{height:122px; word-break:keep-all}
/*//120627  3차 수*/

 .t_black{color: #333333;}
h3{height:24px;}
#pop_content3{position:relative; width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}
#id_layer01,#id_layer02,#id_layer03 {display:none;left:120px;top:150px;}
</style>

<!-- 레이어팝업 스크립트 -->
<script type="text/javascript"> 

		function layeropen(num){
			for (i=1; i<4; i++)	{
				document.getElementById("id_layer0"+i).style.display = "none";
				if (i==num) {		document.getElementById("id_layer0"+num).style.display = "block";	}
			}
		}
		function layerclose(num){
			document.getElementById("id_layer0"+num).style.display = "none";
		}
		function open_layer(id) {
			document.getElementById(id).style.display = "block";
		}
		function close_layer(id) {
			document.getElementById(id).style.display = "none";
		}
		function show_sitemap(idName,a) {
			var obj_btn = document.getElementById(a);
			open_layer(idName);
			obj_btn.src = obj_btn.src.replace("_off","_on");
		}
		function hide_sitemap(idName,a) {
			var obj_btn = document.getElementById(a);
			close_layer(idName);
			obj_btn.src = obj_btn.src.replace("_on","_off");
		}

		function goApply(gubun) {
			<% if(eventYn.equals("Y")){ %>//중복응모일 경우
			document.evtFrm.sel_item.value = gubun;
			txt_value = getText(gubun);
			document.evtFrm.txt_value.value = txt_value;
			$('#sel_time_history').text('<%=applyDate%>');
			$('#sel_time_dup').text(txt_value);
			layeropen('3');
			<% } else { %>//신규 응모일 경우
			document.evtFrm.sel_item.value = gubun;
			txt_value = getText(gubun);
			document.evtFrm.txt_value.value = txt_value;
			$('#sel_time').text(txt_value);
			layeropen('1');
			<% } %>
		}

		function applyEvent(gubun) {

			opener.opener_val = document.evtFrm.sel_item.value;
			txt_value = getText(document.evtFrm.sel_item.value);

			$('#sel_time_done').text(txt_value);

			document.evtFrm.job_type.value = gubun;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.action = "/hp/im/et/evt.do?method=insertOperaEvent";
			document.evtFrm.submit();
		}

		function applyOk(){
			opener.opener_apply = "Y";
			opener.event_ok = "Y";
			layerclose(1);
			layerclose(3);
			layeropen(2);
			//location.reload();
			//alert("이벤트 응모가 완료되었습니다");
			
		}
		function applyDu(){
			alert("이미 이벤트에 응모하셨습니다.");
			location.reload();
		}
		function applyNo(){
			alert("이벤트 응모가 실패하였습니다.");
			location.reload();
		}

		function getText(gubun) {
			if (gubun == "1") {
				txt_value = "2013년 2월 1일 오후 8시";
			} else if (gubun == "2") {
				txt_value = "2013년 2월 2일 오후 2시";
			} else if (gubun == "3") {
				txt_value = "2013년 2월 2일 오후 7시";
			} else if (gubun == "4") {
				txt_value = "2013년 2월 3일 오후 2시";
			} else if (gubun == "5") {
				txt_value = "2013년 2월 3일 오후 7시";
			} else if (gubun == "6") {
				txt_value = "2013년 2월 6일 오후 8시";
			} else if (gubun == "7") {
				txt_value = "2013년 2월 7일 오후 8시";
			} else if (gubun == "8") {
				txt_value = "2013년 2월 8일 오후 8시";
			} else if (gubun == "9") {
				txt_value = "2013년 2월 9일 오후 2시";
			} else if (gubun == "10") {
				txt_value = "2013년 2월 9일 오후 7시";
			} else if (gubun == "11") {
				txt_value = "2013년 2월 10일 오후 6시";
			} else if (gubun == "12") {
				txt_value = "2013년 2월 11일 오후 2시";
			} else if (gubun == "13") {
				txt_value = "2013년 2월 11일 오후 7시";
			} else if (gubun == "14") {
				txt_value = "2013년 2월 13일 오후 8시";
			} else if (gubun == "15") {
				txt_value = "2013년 2월 14일 오후 8시";
			} else if (gubun == "16") {
				txt_value = "2013년 2월 15일 오후 8시";
			} else if (gubun == "17") {
				txt_value = "2013년 2월 16일 오후 2시";
			} else if (gubun == "18") {
				txt_value = "2013년 2월 16일 오후 7시";
			} else if (gubun == "19") {
				txt_value = "2013년 2월 17일 오후 2시";
			} else if (gubun == "20") {
				txt_value = "2013년 2월 17일 오후 7시";
			} else if (gubun == "21") {
				txt_value = "2013년 2월 19일 오후 8시";
			} else if (gubun == "22") {
				txt_value = "2013년 2월 20일 오후 8시";
			} else if (gubun == "23") {
				txt_value = "2013년 2월 21일 오후 8시";
			} else if (gubun == "24") {
				txt_value = "2013년 2월 22일 오후 8시";
			} else if (gubun == "25") {
				txt_value = "2013년 2월 23일 오후 2시";
			} else if (gubun == "26") {
				txt_value = "2013년 2월 23일 오후 7시";
			} 
			return txt_value;
		}

		function applyEvent2(){
			opener.applyEvent();
		}
		
</script>

</head>
<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm"  method="post" action="">
<input type="hidden" name="txt_value" value=""/>
<input type="hidden" name="job_type" value=""/>
<input type="hidden" name="sel_item" value=""/>

</form>
<!-- 팝업사이즈 730*722 -->
<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/h1_musical.png" alt="응모하기-뮤지컬 오페라의 유령" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content3" >
		<div class="content_block content_block_card clfix">
			<p><strong>공연장소</strong><span style="padding-left:30px;">블루스퀘어 삼성전자홀</span></p>
			<p><strong>좌석</strong><span style="padding-left:58px;">VIP석</span></p>
			<p><strong>추첨인원</strong><span style="padding-left:30px;">총 120분 (1인 2매)</span></p>

			<table summary="뮤지컬 오페라 유령 응모 정보입니다" class="mt20 dtable02">
				<caption>응모하기-뮤지컬 오페라 유령</caption>
				<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="riline"><p>공연일시</p></th>
						<td class="al_center">2/1(금)<br />오후 8시</td>
						<td class="al_center">2/2(토)<br />오후 2시</td>
						<td class="al_center">2/2(토)<br />오후 7시</td>
						<td class="al_center">2/3(일)<br />오후 2시</td>
						<td class="al_center">2/3(일)<br />오후 7시</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>당첨인원</p></th>
						<td class="al_center">1명</td>
						<td class="al_center">5명</td>
						<td class="al_center">2명</td>
						<td class="al_center">5명</td>
						<td class="al_center">2명</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>응모하기</p></th>
						<td class="al_center"><a href="#" onclick="goApply('1');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('2');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('3');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('4');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('5');" class="btn_link">응모</a></td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
				</tbody>
			</table>

			<table summary="뮤지컬 오페라 유령 응모 정보입니다" class="mt20 dtable02">
				<caption>응모하기-뮤지컬 오페라 유령</caption>
				<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="riline"><p>공연일시</p></th>
						<td class="al_center">2/6(수) <br />오후 8시</td>
						<td class="al_center">2/7(목)<br />오후 8시</td>
						<td class="al_center">2/8금)<br />오후 8시</td>
						<td class="al_center">2/9(토) <br />오후 2시</td>
						<td class="al_center">2/9(토) <br />오후 7시</td>
						<td class="al_center">2/10(일)<br />오후 6시</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>당첨인원</p></th>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>응모하기</p></th>
						<td class="al_center"><a href="#" onclick="goApply('6');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('7');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('8');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('9');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('10');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('11');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
					</tr>
				</tbody>
			</table>

			<table summary="뮤지컬 오페라 유령 응모 정보입니다" class="mt20  dtable02">
				<caption>응모하기-뮤지컬 오페라 유령</caption>
				<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="riline"><p>공연일시</p></th>
						<td class="al_center">2/11(월) <br />오후 2시</td>
						<td class="al_center">2/11(월)<br />오후 7시</td>
						<td class="al_center">2/13(수)<br />오후 8시</td>
						<td class="al_center">2/14(목) <br />오후 8시</td>
						<td class="al_center">2/15(금) <br />오후 8시</td>
						<td class="al_center">2/16(토) <br />오후 2시</td>
						<td class="al_center">2/16(토) <br />오후 7시</td>
						<td class="al_center">2/17(일) <br />오후 2시</td>
						<td class="al_center">2/17(일) <br />오후 7시</td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>당첨인원</p></th>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>응모하기</p></th>
						<td class="al_center"><a href="#" onclick="goApply('12');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('13');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('14');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('15');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('16');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('17');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('18');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('19');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('20');" class="btn_link">응모</a></td>
					</tr>
				</tbody>
			</table>

				<table summary="뮤지컬 오페라 유령 응모 정보입니다" class="mt20  dtable02">
				<caption>응모하기-뮤지컬 오페라 유령</caption>
				<colgroup><col width="77px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/><col width="70px"/></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="riline"><p>공연일시</p></th>
						<td class="al_center">2/19(화) <br />오후 8시</td>
						<td class="al_center">2/20(수)<br />오후 8시</td>
						<td class="al_center">2/21(목)<br />오후 8시</td>
						<td class="al_center">2/22(금) <br />오후 8시</td>
						<td class="al_center">2/23(토) <br />오후 2시</td>
						<td class="al_center">2/23(토) <br />오후 7시</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>당첨인원</p></th>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center">5명</td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
						<td class="al_center"> </td>
					</tr>
					<tr>
						<th scope="row" class="riline"><p>응모하기</p></th>
						<td class="al_center"><a href="#" onclick="goApply('21');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('22');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('23');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('24');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('25');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" onclick="goApply('26');" class="btn_link">응모</a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
						<td class="al_center"><a href="#" class="btn_link"> </a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!-- 레이어팝업-최초응모시 -->
	<div id="id_layer01" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/layer_title_1.png" alt="아래의 공연일시를선택하셨습니다.응모하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:85px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong class="t_black">뮤지컬 &lt;오페라의 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time"></strong></p>
				</div>
 				<p class="btnc"><a href="#" onclick="applyEvent('i');"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="layerclose(1);"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-최초응모시 -->


<!-- 레이어팝업-이벤트확인 클릭시 -->
	<div id="id_layer02" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/layer_tit_4.png" alt="아래와 같이 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong class="t_black">뮤지컬 &lt;오페라의 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_done"></strong></p>
				</div>
 				<p class="btnc"><a href="#" onclick="applyEvent2();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-이벤트확인 클릭시 -->

<!-- 레이어팝업-이벤트 재응모시  -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_mix">
		<div class="pop_l_wrap" style="height:400px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/layer_title_2.png" alt="회원님은 이미 아래의 공연일시로 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:60px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong class="t_black">뮤지컬 &lt;오페라의 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_history"></strong></p>
				</div>
			</div>
			<p class="pop_tit" style="margin-top:30px;"><img src="/images/et/layer_tit_3.png" alt="아래 공연일시로 변경하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:80px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong class="t_black">뮤지컬 &lt;오페라의 유령&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_dup"></strong></p>
				</div>
 				<p class="btnc"><a href="#" onclick="applyEvent('u');"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="layerclose(3);"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-이벤트 재응모시 -->

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<p style="text-align:right;padding:6px 40px 5px 0px; color:#999;letter-spacing:-1px;" class="t_no"></p>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>

</div>

</body>
</html>
