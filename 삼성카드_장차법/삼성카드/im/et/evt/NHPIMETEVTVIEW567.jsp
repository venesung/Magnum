<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/base.css" />

<title>삼성카드 멘토링 클래스 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
	String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
	String name = (String)request.getAttribute("name"); //name
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
#lay_1{display:none; position:absolute; z-index:2; left:131px; top:1110px; }

/*120627 추가*/
.al_center {text-align:center;}
.mb20 {margin-bottom:20px}
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
.dtable02   th  {padding:7px 0 7px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:7px 0 7px 10px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #245fb3; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
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

</style>

<!-- 레이어팝업 스크립트 -->
<script type="text/javascript"> 
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
</script>

<script type="text/javascript">
var sel_item = "";
function go_start() {
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('<%=cmsSeq%>');
	<%
		}else{
	%>
		if(parent.event_check()){
			<%if(event_ok.equals("Y")){%>
				alert("이미 응모하신 이벤트 입니다.");
			<%}else{ %>
				layeropen(1);
			<% } %>		
		}
	<%
		}
	%>
}

function applyEvent() {
	
	var frm = document.frm1;
	var item03 = "";

	for(var j=0;j<frm.choice.length; j++) {
		if (frm.choice[j].checked == true) {
			item03 = frm.choice[j].value;
		}
	}

	if(item03 == ""){
		alert("3가지 혜택 중 한가지를 선택해주시기 바랍니다.");
	}
	else{
		parent.submit_eventLog();
		document.evtFrm.item03.value = item03;
		sel_item = item03;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
}

function applyOk(){
	alert("참여해주셔서 감사합니다. 정상적으로 응모하셨습니다.");
	location.reload();
}

function applyNo(){
	alert("이벤트 응모가 실패하였습니다.");
	location.reload();
}
</script>

</head>
<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="item03" value="" />
<input type="hidden" name="eventNo" value="<%=eventNo%>" />
</form>

<img src="/images/et/event_mento.jpg" alt="삼성카드 멘토링 클래스" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="291,1529,438,1566" alt="응모하기"  href="javascript:go_start();" title="새창" />
  <area shape="rect" coords="158,2112,287,2132" href="javascript:parent.goTabPage('NHPIMMHUFM001M001');" alt="휴대폰번호 확인하기"  title="새창" />
</map>
<!-- 레이어팝업-최초응모시 -->
<form id="frm1" name="frm1" autocomplete="off" method="post">
<div id="lay_1" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="height:280px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; show_select();" value="레이어닫기" title="삼성카드 멘토링 클래스 참가 신청서 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/tit_mento.gif" alt="삼성카드 멘토링 클래스 참가 신청서" /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<table summary="회원명,자녀학년 선택하는 표입니다." class="  dtable02"> 
						<caption> 삼성카드 멘토링 클래스 참가신청서</caption>
						<colgroup><col width="30%"/><col width="70%"/></colgroup>
						<tbody>
						<tr>
							<th class="" scope="row"><p>회원명</p></th>
							<td class="pop_sub_desc"><%=name%></td>
						</tr>
						<tr>
							<th class=""  scope="rowgroup" rowspan="2"><p>자녀 학년(3월 기준)</p></th>
							<td class="pop_sub_desc" style="border-bottom:0">
							<label for="md1"><input name="choice" type="radio" class="rdo" id="md1" value="중1" title="중1"/>중1</label>
							<label for="md2"><input name="choice" type="radio" class="rdo" id="md2" value="중2" title="중2"/>중2</label>
							<label for="md3"><input name="choice" type="radio" class="rdo" id="md3" value="중3" title="중3"/>중3</label>
							</td>
						</tr>
						<tr>
							<td class="pop_sub_desc">
							<label for="md4"><input name="choice" type="radio" class="rdo" id="md4" value="고1" title="고1"/>고1</label>
							<label for="md5"><input name="choice" type="radio" class="rdo" id="md5" value="고2" title="고2"/>고2</label>
							<label for="md6"><input name="choice" type="radio" class="rdo" id="md6" value="고3" title="고3"/>고3</label>
							</td>
						</tr>
						</tbody>
					</table>
					<p class="mt5"><strong class="t_black">신청 후 변경하실수 없으니 유의 바랍니다.</strong></p><!-- 130215 수정 -->
					<p class="al_center" style="margin-top:40px"><a href="javascript:applyEvent();" ><img src="/images/et/btn_mento.gif" alt="참가 신청하기" /></a></p>
				</div>
			</div>
		</div>
</div>
</form>
<!-- //레이어팝업-최초응모시 -->
<div class="conts_hidden">
	<h2>KBS '도전! 골든벨' 장학생과 함께하는 삼성카드 멘토링 클래스</h2>
	<p>어른들도 맞히기 힘든 문제를 모두 통과한 골든벨 장학생들! 그들의 학창시절은 어땠을까요? <br />또 지금은 어떤 꿈을 향해 도전하고 있을까요? <strong>이제 직접 들어보세요. 회원님의 소중한 자녀를 초대합니다.</strong></p>
	<dl>
		<dt>행사기간</dt>
		<!-- 20130219 수정 -->
		<dd>2013년 2월 21일(화) ~ 3월 15일(금)</dd>
		<dt>행사내용</dt>
		<dd>행사기간 동안, 중고생 자녀를 두신 삼성카드 회원님께서 학원ㆍ서적ㆍ교복 업종에서 삼성카드로 일시불 및 할부 30만원 이상 결제하시고 응모하시면,40분을 <strong>추첨하여 자녀 1인 동반으로 '삼성카드 멘토링 클래스'에 초대</strong> <br /> 먼저 삼성카드로 결제하신 후, 이벤트에 응모하셔도 추첨 대상이 됩니다. <br /> 기간 내 업종 이용실적은 합산됩니다. 예)보습학원 22만원 + 서적 8만원 = 30만원으로 추첨대상</dd>
		<!-- //20130219 수정 -->
		<dt>당첨자 발표</dt>
		<dd>2013년 3월 22(금) 삼성카드 홈페이지 이벤트 당첨자발표란 및 개별 안내</dd>
	</dl>
	<h3>삼성카드 멘토링 클래스란?</h3>
	<p>삼성카드 멘토링 클래스는, 삼성카드 회원님의 자녀분들만을 위해 마련한, 특별한 자리입니다. 삼성카드가 후원하고 있는 KBS '도전! 골든벨' 장학생들과 함께 학업, 진로 등 생활 전반에 걸친 선배의 성공 노하우를 공유하고, 자유로운 상담을 자녀의 꿈과 희망을 새롭게 발견할 수 있는 소중한 기회를 드리고자 합니다.</p>
	<h3>삼성카드 멘토링 클래스!!</h3>
	<dl>
		<dt>행사일시</dt>
		<dd>2013년 3월 30일(토) , 오후 2시 ~ 5시</dd>
		<dt>행사장소</dt>
		<dd>삼성카드 본사(서울시 중구 태평로2가 삼성본관빌딩)</dd>
		<dt>시간표</dt>
		<dd>  
			<ol>
				<li>1부 -<strong> KBS '도전! 골든벨' 장학생의 학교 생활 노하우 공개(60분)</strong> <br /> 노트 정리 비법, 시간 관리 방법, 독서 방법 및 추천 도서 등      성적 향상을 위한 노하우를 알려 드리는 강의 시간을 가집니다.</li>
				<!-- 20130219 수정 -->
				<li>2부 - <strong>자녀와의 그룹 멘토링(90분)</strong><br /> 멘토와 자녀들이 조를 이루어 공부습관 지도와 함께, 부모님께 말 못하는 학교 생활에 대해 진솔한 대화의 시간을 가집니다. </li>
				<!-- //20130219 수정 -->
			</ol>
			<p>세부 일정은 당첨자 선정 후 개별 통보 예정입니다. </p>
		</dd>
	</dl>
	<a href="javascript:layeropen(1)"   title="새창">응모하기</a>
	<h3>삼성카드는 지난 2001년부터, KBS '도전! 골든벨'을 후원하고 있습니다.</h3>
	<p>삼성카드는 청소년들의 도전 정신을 고취하고 차세대 리더를 육성하기 위한 '골든벨 장학사업'을 진행하고 있습니다. 골든벨 장학생 및 참여 학생들의 커뮤니티인 '골든벨이 맺어준 사람들(골맺사)'과 더불어, 지역사회와 함께하는 다양한 사회공헌활동을 펼쳐 가고 있습니다.</p>
	<ul>
		<li>초청 회원 1인당 동반 자녀 1인으로 제한하며, 응모 시의 등록 자녀에 한해 참여가 가능합니다.</li>
		<li>참가 자녀에 관한 사전 설문조사 및 행사 당일 참가 준비를 위해, 당첨 회원님께 개별 연락을 드립니다.</li>
		<li>통화 연결이 되지 않을 경우 당첨이 취소될 수 있으므로, 회원님께서 등록하신 휴대폰번호를 확인해 주시기 바랍니다.
		<a href="https://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001" target="_blank"   title="새창">휴대폰번호 확인하기</a></li>
		<li>당첨되신 행사 참여의 권리는 다른 사람에게 양도하실 수 없습니다.</li>		
		<li>학원·서적·교복 업종은 삼성카드 가맹점 업종 분류 기준에 의한 등록 가맹점에 한합니다.</li>
		<li>법인/체크/선불/올앳/기프트카드는 제외됩니다. </li>
	</ul>
</div>
</body>
</html>  