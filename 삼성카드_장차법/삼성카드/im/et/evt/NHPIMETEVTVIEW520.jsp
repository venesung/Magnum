<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 유명 뮤지컬 무료 초대 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN");
	String eventNo = (String)request.getAttribute("eventNo");
	String item03 = (String)request.getAttribute("item03");
	
	
%>
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
#pop_header	 {width:100%; height:60px; background:url('/html/et/musical201207/images/pop_bg_body.jpg') no-repeat left top}
#pop_header	 h1	{padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer	 .btn_close	{position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/html/et/musical201207/images/pop_bg_body.jpg') no-repeat 663px 0}
#pop_content	 {position:relative; width:100%; height:292px; margin:20px 0; overflow:auto}
#pop_footer	{position:relative; width:100%; height:30px; background:url('/html/et/musical201207/images/pop_bg_body.jpg') no-repeat left bottom}
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
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/html/et/musical201207/images/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:29px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:24px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_sub_desc	{margin-bottom:10px; color:#666; font:normal 12px "돋움"; line-height:16px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin:0 auto; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{height:175px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert02,
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert02	{height:122px; word-break:keep-all}
/*//120627 추가*/
 
h3{height:24px;}
#pop_content3{position:relative; width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}
#id_layer01,#id_layer02,#id_layer03 {left:120px;top:150px;}
</style>

<script language="javascript" type="text/javascript">
	
	var frm = document.evtFrm;
	
	function applyEvent(gubun) {
		<%if (eventNo.equals("musical201207a")) { %>
			opener.opener_vala = document.evtFrm.sel_item.value;
		<%} else if (eventNo.equals("musical201207b")) {%>
			opener.opener_valb = document.evtFrm.sel_item.value;
		<%} %>
		txt_value = getText(document.evtFrm.sel_item.value);
		$('#sel_time_done').text(txt_value);
		
		document.evtFrm.job_type.value = gubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();;
	}

	
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
		<% if(event_ok.equals("Y")){ %>//중복응모일 경우
		document.evtFrm.sel_item.value = gubun;

		$('#sel_time_history').text(getText(<%=item03%>));//item03값
		$('#sel_time_dup').text(getText(gubun));
		layeropen('3');
		<% } else { %>//신규 응모일 경우
		document.evtFrm.sel_item.value = gubun;
		txt_value = getText(gubun);
		$('#sel_time').text(txt_value);
		layeropen('1');
		<% } %>
	}
	function applyOk(){
		<%if (eventNo.equals("musical201207a")) { %>
			opener.opener_applya = "Y";
			//opener.opener_vala = "2";
		<%} else if (eventNo.equals("musical201207b")) {%>
			opener.opener_applyb = "Y";
			//opener.opener_valb = "2";
		<%} %>
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
		<%if (eventNo.equals("musical201207a")) { %>
		if (gubun == "1") {
			txt_value = "2012년 8월 3일 오후 8시";
		} else if (gubun == "2") {
			txt_value = "2012년 8월 4일 오후 2시";
		} else if (gubun == "3") {
			txt_value = "2012년 8월 4일 오후 8시";
		} else if (gubun == "4") {
			txt_value = "2012년 8월 5일 오후 1시";
		} else if (gubun == "5") {
			txt_value = "2012년 8월 5일 오후 7시";
		} else if (gubun == "6") {
			txt_value = "2012년 8월 7일 오후 8시";
		} else if (gubun == "7") {
			txt_value = "2012년 8월 8일 오후 8시";
		} else if (gubun == "8") {
			txt_value = "2012년 8월 9일 오후 8시";
		} else if (gubun == "9") {
			txt_value = "2012년 8월 10일 오후 8시";
		} else if (gubun == "10") {
			txt_value = "2012년 8월 11일 오후 2시";
		} else if (gubun == "11") {
			txt_value = "2012년 8월 11일 오후 8시";
		} else if (gubun == "12") {
			txt_value = "2012년 8월 12일 오후 1시";
		} else if (gubun == "13") {
			txt_value = "2012년 8월 12일 오후 7시";
		} else if (gubun == "14") {
			txt_value = "2012년 8월 14일 오후 8시";
		} else if (gubun == "15") {
			txt_value = "2012년 8월 15일 오후 1시";
		} else if (gubun == "16") {
			txt_value = "2012년 8월 15일 오후 7시";
		} else if (gubun == "17") {
			txt_value = "2012년 8월 16일 오후 8시";
		} else if (gubun == "18") {
			txt_value = "2012년 8월 17일 오후 8시";
		} else if (gubun == "19") {
			txt_value = "2012년 8월 18일 오후 2시";
		} else if (gubun == "20") {
			txt_value = "2012년 8월 18일 오후 8시";
		} else if (gubun == "21") {
			txt_value = "2012년 8월 19일 오후 3시";
		} else if (gubun == "22") {
			txt_value = "2012년 8월 21일 오후 8시";
		} else if (gubun == "23") {
			txt_value = "2012년 8월 22일 오후 8시";
		} else if (gubun == "24") {
			txt_value = "2012년 8월 23일 오후 8시";
		} else if (gubun == "25") {
			txt_value = "2012년 8월 24일 오후 8시";
		} else if (gubun == "26") {
			txt_value = "2012년 8월 25일 오후 2시";
		} else if (gubun == "27") {
			txt_value = "2012년 8월 25일 오후 8시";
		} else if (gubun == "28") {
			txt_value = "2012년 8월 26일 오후 1시";
		} else if (gubun == "29") {
			txt_value = "2012년 8월 26일 오후 7시";
		} else if (gubun == "30") {
			txt_value = "2012년 8월 28일 오후 8시";
		} else if (gubun == "31") {
			txt_value = "2012년 8월 30일 오후 8시";
		} else if (gubun == "32") {
			txt_value = "2012년 8월 31일 오후 8시";
		}
		return txt_value;
		<%} else if (eventNo.equals("musical201207b")) {%>
		if (gubun == "1") {
			txt_value = "2012년 8월 1일 오후 8시";
		} else if (gubun == "2") {
			txt_value = "2012년 8월 2일 오후 8시";
		} else if (gubun == "3") {
			txt_value = "2012년 8월 3일 오후 8시";
		} else if (gubun == "4") {
			txt_value = "2012년 8월 4일 오후 3시";
		} else if (gubun == "5") {
			txt_value = "2012년 8월 4일 오후 7시";
		} else if (gubun == "6") {
			txt_value = "2012년 8월 5일 오후 2시";
		} else if (gubun == "7") {
			txt_value = "2012년 8월 5일 오후 6시";
		} else if (gubun == "8") {
			txt_value = "2012년 8월 7일 오후 8시";
		} else if (gubun == "9") {
			txt_value = "2012년 8월 8일 오후 8시";
		} else if (gubun == "10") {
			txt_value = "2012년 8월 9일 오후 8시";
		} else if (gubun == "11") {
			txt_value = "2012년 8월 10일 오후 8시";
		} else if (gubun == "12") {
			txt_value = "2012년 8월 11일 오후 3시";
		} else if (gubun == "13") {
			txt_value = "2012년 8월 11일 오후 7시";
		} else if (gubun == "14") {
			txt_value = "2012년 8월 12일 오후 2시";
		} else if (gubun == "15") {
			txt_value = "2012년 8월 12일 오후 6시";
		} else if (gubun == "16") {
			txt_value = "2012년 8월 14일 오후 8시";
		} else if (gubun == "17") {
			txt_value = "2012년 8월 15일 오후 8시";
		} else if (gubun == "18") {
			txt_value = "2012년 8월 16일 오후 8시";
		} else if (gubun == "19") {
			txt_value = "2012년 8월 17일 오후 8시";
		} else if (gubun == "20") {
			txt_value = "2012년 8월 18일 오후 3시";
		} else if (gubun == "21") {
			txt_value = "2012년 8월 18일 오후 7시";
		} else if (gubun == "22") {
			txt_value = "2012년 8월 19일 오후 2시";
		} else if (gubun == "23") {
			txt_value = "2012년 8월 19일 오후 6시";
		} else if (gubun == "24") {
			txt_value = "2012년 8월 21일 오후 8시";
		} else if (gubun == "25") {
			txt_value = "2012년 8월 22일 오후 8시";
		} else if (gubun == "26") {
			txt_value = "2012년 8월 23일 오후 8시";
		} else if (gubun == "27") {
			txt_value = "2012년 8월 24일 오후 8시";
		} else if (gubun == "28") {
			txt_value = "2012년 8월 25일 오후 3시";
		} else if (gubun == "29") {
			txt_value = "2012년 8월 25일 오후 7시";
		} else if (gubun == "30") {
			txt_value = "2012년 8월 26일 오후 2시";
		} else if (gubun == "31") {
			txt_value = "2012년 8월 26일 오후 6시";
		} else if (gubun == "32") {
			txt_value = "2012년 8월 28일 오후 8시";
		} else if (gubun == "33") {
			txt_value = "2012년 8월 29일 오후 8시";
		} else if (gubun == "34") {
			txt_value = "2012년 8월 30일 오후 8시";
		} else if (gubun == "35") {
			txt_value = "2012년 8월 31일 오후 8시";
		} else if (gubun == "36") {
			txt_value = "2012년 9월 1일 오후 3시";
		} else if (gubun == "37") {
			txt_value = "2012년 8월 1일 오후 7시";
		} else if (gubun == "38") {
			txt_value = "2012년 9월 2일 오후 2시";
		} else if (gubun == "39") {
			txt_value = "2012년 9월 2일 오후 6시";
		}
		return txt_value;
		<%} %>
	}

		
</script>


</head>

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=setMusical201207" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="sel_item" value=""/>
<input type="hidden" name="job_type" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<%if (eventNo.equals("musical201207a")) { %>
<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/html/et/musical201207/images/h1_musical_1.png" alt="응모하기-뮤지컬 위키드" /></h1>		
	</div>

	<!-- content -->
<!-- 120321 수정 -->
	<div id="pop_content3" >
		<div class="content_block content_block_card clfix">
			<p><strong>공연장소</strong><span style="padding-left:30px;">블루스퀘어 삼성전자홀</span></p>	
			<p><strong>좌석</strong><span style="padding-left:58px;">VIP석(1인 2매)</span></p>	
			<p><strong>추첨인원</strong><span style="padding-left:30px;">회당 5명, 총 160분 추첨</span></p>	
			<table summary="뮤지컬 위키드의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 위키드</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center">8/3(금) <br />20:00</td>
				<td class="al_center">8/4(토)<br />14:00</td>
				<td class="al_center">8/4(토)<br />20:00</td>
				<td class="al_center">8/5(일)<br />13:00</td>
				<td class="al_center">8/5(일)<br />19:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
                <td class="al_center"><a href="#" onclick="goApply('1');return false;" class="btn_link">응모</a></td>
                <td class="al_center"><a href="#" onclick="goApply('2');return false;" class="btn_link">응모</a></td>
                <td class="al_center"><a href="#" onclick="goApply('3');return false;" class="btn_link">응모</a></td>
                <td class="al_center"><a href="#" onclick="goApply('4');return false;" class="btn_link">응모</a></td>
                <td class="al_center"><a href="#" onclick="goApply('5');return false;" class="btn_link">응모</a></td>
			</tr>
			</tbody>
			</table>

			<table summary="뮤지컬 위키드의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 위키드</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/7(화) <br />20:00</td>
				<td class="al_center">8/8(수)<br />20:00</td>
				<td class="al_center">8/9(목)<br />20:00</td>
				<td class="al_center">8/10(금) <br />20:00</td>
				<td class="al_center">8/11(토)<br />14:00</td>
				<td class="al_center">8/11(토)<br />20:00</td>
				<td class="al_center">8/12(일)<br />13:00</td>
				<td class="al_center">8/12(일)<br />19:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('6');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('7');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('8');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('9');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('10');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('11');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('12');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('13');return false;" class="btn_link">응모</a></td>
			</tr>
			</tbody>
			</table>

			<table summary="뮤지컬 위키드의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 위키드</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/14(화) <br />20:00</td>
				<td class="al_center">8/15(수)<br />13:00</td>
				<td class="al_center">8/15(수)<br />19:00</td>
				<td class="al_center">8/16(목) <br />20:00</td>
				<td class="al_center">8/17(금)<br />20:00</td>
				<td class="al_center">8/18(토)<br />14:00</td>
				<td class="al_center">8/18(토)<br />20:00</td>
				<td class="al_center">8/19(일)<br />15:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('14');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('15');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('16');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('17');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('18');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('19');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('20');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('21');return false;" class="btn_link">응모</a></td>
			</tr>
			</tbody>
			</table>

			<table summary="뮤지컬 위키드의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20  dtable02">
			<caption>응모하기-뮤지컬 위키드</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/21(화) <br />20:00</td>
				<td class="al_center">8/22(수)<br />20:00</td>
				<td class="al_center">8/23(목)<br />20:00</td>
				<td class="al_center">8/24(금) <br />20:00</td>
				<td class="al_center">8/25(토)<br />14:00</td>
				<td class="al_center">8/25(토)<br />20:00</td>
				<td class="al_center">8/26(일)<br />13:00</td>
				<td class="al_center">8/26(일)<br />19:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('22');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('23');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('24');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('25');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('26');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('27');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('28');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('29');return false;" class="btn_link">응모</a></td>
			</tr>
			</tbody>
			</table>


			
				<table summary="뮤지컬 위키드의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 mb20 dtable02"> 
			<caption>응모하기-뮤지컬 위키드</caption>
			<colgroup><col width="113" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/28(화) <br />20:00</td>
				<td class="al_center">8/30(목)<br />20:00</td>
				<td class="al_center">8/31(금)<br />20:00</td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
				<td class="al_center"></td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('30');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('31');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('32');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" class="btn_link"></a></td>
				<td class="al_center"><a href="#" class="btn_link"></a></td>
				<td class="al_center"><a href="#" class="btn_link"></a></td>
				<td class="al_center"><a href="#" class="btn_link"></a></td>
				<td class="al_center"><a href="#" class="btn_link"></a></td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>
<!-- 레이어팝업-최초응모시 -->
	<div id="id_layer01" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_5.png" alt="아래의 공연일시를선택하셨습니다.응모하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;위키드&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time"></strong></p>			
				</div>
                 <p class="btnc"><a href="#" onclick="applyEvent('i');return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="layerclose(1);"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-최초응모시 -->


<!-- 레이어팝업-이벤트확인 클릭시 -->
	<div id="id_layer02" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="self.close();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_4.png" alt="아래와 같이 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;위키드&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_done"></strong></p>			
				</div>
 				<p class="btnc"><a href="#" onclick="self.close();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
			</div>
		</div>
	</div>

<!-- //레이어팝업-이벤트확인 클릭시 -->

<!-- 레이어팝업-이벤트 재응모시  -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap" style="height:340px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_2.png" alt="회원님께선 이미 응모하셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:60px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;위키드&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_history"></strong></p>			
				</div>
			</div>
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_3.png" alt="아래 공연일시로 변경하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:80px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;위키드&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_dup"></strong></p>			
				</div>
                 <p class="btnc"><a href="#" onclick="applyEvent('u');return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="layerclose(3);"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
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
<%} else if (eventNo.equals("musical201207b")) {%>
<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/html/et/musical201207/images/h1_musical_2.png" alt="응모하기-뮤지컬 번지점프를하다" /></h1>		
	</div>

	<!-- content -->
<!-- 120321 수정 -->
	<div id="pop_content3" >
		<div class="content_block content_block_card clfix">
			<p><strong>공연장소</strong><span style="padding-left:30px;">블루스퀘어 삼성전자홀</span></p>	
			<p><strong>좌석</strong><span style="padding-left:58px;">VIP석(1인 2매)</span></p>	
			<p><strong>추첨인원</strong><span style="padding-left:30px;">회당 5명, 총 195분 추첨</span></p>	
			<table summary="뮤지컬 번지점프를하다의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 번지점프를하다</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center"></td>
				<td class="al_center">8/1(수) <br />20:00</td>
				<td class="al_center">8/2(목) <br />20:00</td>
				<td class="al_center">8/3(금) <br />20:00</td>
				<td class="al_center">8/4(토)<br />15:00</td>
				<td class="al_center">8/4(토)<br />19:00</td>
				<td class="al_center">8/5(일)<br />14:00</td>
				<td class="al_center">8/5(일)<br />18:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"></td>
				<td class="al_center"><a href="#" onclick="goApply('1');return false;" class="btn_link">응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('2');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('3');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('4');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('5');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('6');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('7');return false;" class="btn_link" >응모</a></td>
			</tr>
			</tbody>
			</table>

			<table summary="뮤지컬 번지점프를하다의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 번지점프를하다</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/7(화) <br />20:00</td>
				<td class="al_center">8/8(수)<br />20:00</td>
				<td class="al_center">8/9(목)<br />20:00</td>
				<td class="al_center">8/10(금) <br />20:00</td>
				<td class="al_center">8/11(토)<br />15:00</td>
				<td class="al_center">8/11(토)<br />19:00</td>
				<td class="al_center">8/12(일)<br />14:00</td>
				<td class="al_center">8/12(일)<br />18:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('8');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('9');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('10');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('11');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('12');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('13');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('14');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('15');return false;" class="btn_link" >응모</a></td>
			</tr>
			</tbody>
			</table>

			<table summary="뮤지컬 번지점프를하다의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 dtable02">
			<caption>응모하기-뮤지컬 번지점프를하다</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/14(화) <br />20:00</td>
				<td class="al_center">8/15(수)<br />20:00</td>
				<td class="al_center">8/16(목)<br />20:00</td>
				<td class="al_center">8/17(금) <br />20:00</td>
				<td class="al_center">8/18(토)<br />15:00</td>
				<td class="al_center">8/18(토)<br />19:00</td>
				<td class="al_center">8/19(일)<br />14:00</td>
				<td class="al_center">8/19(일)<br />18:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('16');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('17');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('18');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('19');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('20');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('21');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('22');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('23');return false;" class="btn_link" >응모</a></td>
			</tr>
			</tbody>
			</table>

				<table summary="뮤지컬 번지점프를하다의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20  dtable02">
			<caption>응모하기-뮤지컬 번지점프를하다</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/21(화) <br />20:00</td>
				<td class="al_center">8/22(수)<br />20:00</td>
				<td class="al_center">8/23(목)<br />20:00</td>
				<td class="al_center">8/24(금) <br />20:00</td>
				<td class="al_center">8/25(토)<br />15:00</td>
				<td class="al_center">8/25(토)<br />19:00</td>
				<td class="al_center">8/26(일)<br />14:00</td>
				<td class="al_center">8/26(일)<br />18:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('24');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('25');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('26');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('27');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('28');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('29');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('30');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('31');return false;" class="btn_link" >응모</a></td>
			</tr>
			</tbody>
			</table>


			
				<table summary="뮤지컬 번지점프를하다의 공연일시을 확인하시고 응모를 하실 수 있습니다." class="mt20 mb20 dtable02"> 
			<caption>응모하기-뮤지컬 번지점프를하다</caption>
			<colgroup><col width="130" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="64" /><col width="*"/></colgroup>
			<tbody>
			<tr>
				<th class="riline"><p>공연일시</p></th>
				<td class="al_center">8/28(화) <br />20:00</td>
				<td class="al_center">8/29(수)<br />20:00</td>
				<td class="al_center">8/30(목)<br />20:00</td>
				<td class="al_center">8/31(금)<br />20:00</td>
				<td class="al_center">9/1(토)<br />15:00</td>
				<td class="al_center">9/1(토)<br />19:00</td>
				<td class="al_center">9/2(일)<br />14:00</td>
				<td class="al_center">9/2(일)<br />18:00</td>
			</tr>
				<tr>
				<th class="riline"><p>응모하기</p></th>
				<td class="al_center"><a href="#" onclick="goApply('32');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('33');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('34');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('35');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('36');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('37');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('38');return false;" class="btn_link" >응모</a></td>
				<td class="al_center"><a href="#" onclick="goApply('39');return false;" class="btn_link" >응모</a></td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>
<!-- 레이어팝업-최초응모시 -->
	<div id="id_layer01" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_5.png" alt="아래의 공연일시를선택하셨습니다.응모하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;번지점프를하다&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time"></strong></p>			
				</div>
                 <p class="btnc"><a href="#" onclick="applyEvent('i');return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onclick="layerclose(1);"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p> 
			</div>
		</div>
	</div>
<!-- //레이어팝업-최초응모시 -->


<!-- 레이어팝업-이벤트확인 클릭시 -->
	<div id="id_layer02" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="self.close();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_4.png" alt="아래와 같이 응모되셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:100px;padding:30px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;번지점프를하다&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_done"></strong></p>			
				</div>
 				<p class="btnc"><a href="#" onclick="self.close();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
			</div>
		</div>
	</div>

<!-- //레이어팝업-이벤트확인 클릭시 -->

<!-- 레이어팝업-이벤트 재응모시  -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_mix" style="display:none">
		<div class="pop_l_wrap" style="height:340px"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_2.png" alt="회원님께선 이미 응모하셨습니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:60px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;번지점프를하다&gt;</strong></p>
					<p class="pop_sub_desc">공연일시 :<strong id="sel_time_history"></strong></p>			
				</div>
			</div>
			<p class="pop_tit"><img src="/html/et/musical201207/images/layer_tit_3.png" alt="아래 공연일시로 변경하시겠습니까?" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="height:80px;padding:0px 0 0 100px;">
					<p class="pop_sub_desc">공연명 :<strong>뮤지컬 &lt;번지점프를하다&gt;</strong></p>
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
<%} %>


</body>

</html>

