<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>프리미엄 회원 뮤지컬 오페라의 유령 초대 이벤트 - 삼성카드</title>
<%
	String applyDate = (String)request.getAttribute("applyDate");
	String name = (String)request.getAttribute("name");
	String eventYn = (String)request.getAttribute("eventYn");
	System.out.println("##################applyDate : " + applyDate);
	System.out.println("##################name : " + name);
	System.out.println("##################eventYn : " + eventYn);
%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
#lay_1{display:none; position:absolute; z-index:2; left:131px; top:720px; }

/*120627 추가*/
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
a.btn_link:link, a.btn_link:visited {color: #5a96c8; text-decoration: underline;}
a.btn_link:hover, a.btn_link:active {color: #5a96c8; text-decoration: underline;}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.mt5	{margin-top:5px}
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/pop_bg_layer02.gif') no-repeat; overflow:hidden; z-index:513}
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

.t_black{color: #333333;}
.mt30{margin-top: 30px !important;}

</style>

<!-- 레이어팝업 스크립트 -->
<script type="text/javascript"> 
        var opener_apply = "N";
        var opener_val = "";
        var event_ok = '<%=eventYn%>';
        
		function layeropen(num){
			for (i=1; i<2; i++)	{
				document.getElementById("lay_"+i).style.display = "none";
				if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
			}
		}
		function layerclose(num){
			document.getElementById("lay_"+num).style.display = "none";
		}
</script>
 
<!--layerpop_open&close-->
<script type="text/javascript"> 
	function open_layer(id) {
		hide_select();
		document.getElementById(id).style.display = "block";
	}
	function close_layer(id) {
		show_select();
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

	function applyEvent() {

		if(parent.parent.event_check()){
			var frm = document.evtFrm;

			window.open('','popup','width=730px, height=722px, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
			frm.target = 'popup';
			frm.action = "/hp/im/et/evt.do?method=getOperaEventPop";	
			frm.submit();
		}
	}

	function openlayera() {
		if(event_ok == "Y"){
			if (opener_apply == "Y") {
				$('#pop_time').text(getText(opener_val));
				layeropen(1);
			}else{
				$('#pop_time').text('<%=applyDate%>');
				layeropen(1);
			}
		} else {
			alert("이벤트 응모하셔야 확인 가능합니다.");
		}	
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
	
</script>


</head>
<body>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=getOperaEventPop" method="post">
<img src="/images/et/event_musical02.jpg" alt="프리미엄 회원 뮤지컬&lt;오페라의 유령&gt; 초대 이벤트" border="0" usemap="#musical" />
<map name="musical" id="musical">
<area shape="rect" coords="286,982,440,1020" href="javascript:applyEvent()" title="새창" alt="응모하기" />
<area shape="rect" coords="230,1030,338,1050" href="http://www.phantomoftheopera.co.kr/" target="_blank" title="새창" alt="공연 자세히 보기" />
<area shape="rect" coords="347,1028,498,1050" href="javascript:openlayera()"  alt="내가 응모한 내역 확인하기" />
<area shape="rect" coords="177,1201,343,1222" href="javascript:parent.parent.goTabPage('NHPIMMHUFM001M001');" title="새창" alt="청구지 주소 확인 및 수정하기" />
</map>
<!-- 레이어팝업-최초응모시 -->
<div id="lay_1" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="height:255px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/layer_tit_1.png" alt="회원님께서 응모하신 공연일시입니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<p class="pop_sub_desc"><strong class="t_black"><%=name%></strong> 회원님께서 응모하신 공연일시는 아래와 같습니다.</p>
					<table summary=" 응모하신 공연일시입니다" class="  dtable02"> 
						<caption> 응모하신 공연일시입니다</caption>
						<colgroup><col width="20%"/><col width="80%"/></colgroup>
						<tbody>
						<tr>
							<th scope="row"><p>공연명</p></th>
							<td><p>뮤지컬 &lt;오페라의 유령&gt;</p></td>
						</tr>
						<tr>
							<th scope="row"><p>공연일시</p></th>
							<td class="" id="pop_time"></td>
						</tr>
						</tbody>
					</table>
					<p class="t_desc04 mt5">변경을 원하시면 다시 공연일자를 선택 후 응모버튼을 클릭하시면, 변경 가능합니다.</p>
 					<p class="btnc mt30"><a href="#" onclick="document.getElementById('lay_1').style.display = 'none';return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
				</div>
			</div>
		</div>
</div>
<!-- //레이어팝업-최초응모시 -->

<div class="conts_hidden">
	<h2>2013년 새해를 감동과 함께 시작하세요! 프리미엄 회원 뮤지컬 &lt;오페라의 유령&gt;초대 이벤트</h2>
	<p>설명이 필요 없응 뮤지컬, &lt;오페라의 유령&gt; 25주년 기념 내한공연 - <br />프리미엄 회원님을 벅찬 감동의 무대로 초대합니다. 지금 바로 응모하세요!</p>
	<dl>
		<dt>응모기간</dt>
		<dd>2013년 1월 9일(수) ~ 1월 18일(금)</dd>
		<dt>행사내용</dt>
		<dd>이벤트에 응모하신 회원님 중 <strong>추첨을 통해 130분께 뮤지컬 &lt;오페라의 유령&gt; 티켓 무료 제공</strong>(1인 2매)</dd>
		<dt>초대기간</dt>
		<dd>2013년 2월 1일(금) ~ 2월 23일(토)</dd>
		<dt>공연장소</dt>
		<dd>블루스퀘어 삼성전자홀</dd>
		<dt>당첨자발표</dt>
		<dd>2013년 1월 23일(수) 홈페이지 당첨자 발표란 게시</dd>
	</dl>
	<a href="javascript:applyEvent()" title="새창">응모하기</a><br />
	<a href="http://www.phantomoftheopera.co.kr" target="_blank" title="새창">공연 자세히 보기</a>
	<a href="javascript:layeropen(1)" target="_blank" title="새창">내가 응모한 내역 확인하기</a>
	<p><strong>티켓 발송일</strong>2013년 1월 24일(목) <strong>회원님께서 등록하신 주소가 다를 경우</strong> 경품이 다른 사람에게 발송될 수 있으므로, 반드시 확인해 주시기 바랍니다.<a href="#" target="_blank" title="새창">청구지 주소 확인 및 수정하기</a></p>
	<ul>
		<li>- <strong>공연일시는 하나만 선택하실 수 있으며, 응모기간 내 변경 가능</strong>합니다.</li>
		<li>- 티켓을 분실하실 경우 입장하실 수 없습니다.</li>
		<li>- 티켓은 당첨자 발표 후 개별 등기 발송 예정입니다.</li>
		<li>- 카드사 및 제휴사의 사정으로 변경·중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>
</form>
</body>

</html>  