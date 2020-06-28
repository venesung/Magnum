<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String user_name = (String)request.getAttribute("user_name");
String idenNo = (String)request.getAttribute("idenNo");
String hand_phone = (String)request.getAttribute("hand_phone1")+(String)request.getAttribute("hand_phone2")+(String)request.getAttribute("hand_phone3");
String email = (String)request.getAttribute("emailid")+"@"+(String)request.getAttribute("emailaddr");
String dupapply = (String)request.getAttribute("dupapply");
%>

<title>삼성카드 S클래스 무료시사회 이벤트 응모하기 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
textarea{border:0 none; background:transparent}
textarea.txt    {border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
select	{font-size:12px; letter-spacing:-1px}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px}
html:first-child	input.chk, input.rdo	{display:inline-block}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}

.list_rice  li  {padding:0 0 4px 16px; background:url('/images/et/sclass/bul_billards.png') no-repeat 0 4px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px; line-height:16px}

.line_lgray {width:100%; height:0; margin-bottom:25px; padding-bottom:25px; border-bottom:1px solid #F5F5F5; font-size:0; line-height:0; overflow:auto; overflow:hidden}

.dtable02	{border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}	/* 110518 */
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}	/* 110518 */
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all; letter-spacing:-1px}	/* 110518 */

.dtable02	td.al_mid	{vertical-align:middle}
.dtable02	th	p, .dtable02	th	label	{color:#333; font-weight:normal; letter-spacing:-1px;}
.dtable02	th	p,	.dtable02	td	p, .dtable02	td	ul, .dtable02	th	label	{padding-left:10px;}
.dtable02	th.cell_r10, .dtable02	td.cell_r10	{text-align:right}
.dtable02	th.cell_r10	p, .dtable02	td.cell_r10	p	{padding-right:10px; padding-left:0}
.dtable02	th	label	{display:inline-block; padding-left:10px}
.dtable02	td.bo_no_line {border-bottom:0px}
.dtable02	td.p0 {padding:0px 0 5px; line-height:14px}
.dtable02	th.cell_l10 {padding-left:10px; text-align:left}
.dtable02	td	textarea.txt	{margin-left:10px; width:480px; height:50px; padding:10px;}

#pop_wrap   {width:710px}
#pop_header  {width:100%; height:60px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat left top}
#pop_header  h1 {padding:19px 0 0 25px; font-size:0; line-height:0; background:transparent}
#pop_footer {position:relative; width:100%; height:30px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat left bottom}
#pop_footer  .btn_close {position:absolute; right:12px; top:4px; width:24px; height:24px; background:url('/images/et/sclass/pop_bg_body.jpg') no-repeat 663px 0}
#pop_footer .nottoday   {position:absolute; right:33px; top:6px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
#pop_content     {position:relative; width:670px; height:455px; margin:20px 0 30px 30px; overflow:hidden; overflow-y:scroll}
#pop_content	.pop_conts	{width:650px;}
#pop_content h2	{font-size:12px; color:#333; letter-spacing:-1px;}


.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
.nottoday2	{position:absolute; right:42px; top:8px; color:#999; font:normal 11px "돋움"; letter-spacing:-1px}
.nottoday2	.chk	{width:11px; height:11px}

.mt10	{margin-top:10px}
.mt15	{margin-top:15px}
.mt20	{margin-top:20px}
.mt5		{margin-top:5px}
.sel_m	{margin-left:5px; margin-right:10px}
.pl10	{padding-left:10px}

.t_point_blue   {color:#245FB3}
.t_gray {color:#999}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.t_point	{color:#333; font:bold 12px "돋움"; letter-spacing:-1px; line-height:18px}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.btnc	{margin-top:30px; text-align:center}
</style>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script language="javascript" type="text/javascript">

function applyEvent() {
	
	if ( document.evtFrm.sclassMovie5Text.value == '' ) {
		alert('삼성카드 S클래스에 대한 느낌을 입력해 주세요.');
		document.evtFrm.sclassMovie5Text.focus();
		return false;
	}
	
	
	if ( document.evtFrm.sclassMovieText.value == '' ) {
		alert('설명을 입력해 주세요.');
		document.evtFrm.sclassMovieText.focus();
		return false;
	}	
	if ( document.evtFrm.areamovie.value == '' ) {
		alert('관람지역을 선택해 주세요.');
		document.evtFrm.areamovie.focus();
		return false;
	}	
	if (confirm("응모하시겠습니까?")) {
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	} 
	
	
			
}


function maxLengthCheck(maxSize, lineSize, obj, remainObj){ 
	 var temp;
	 var f = obj.value.length;
	 var msglen = parseInt(maxSize);
	 var tmpstr = "";
	 var enter = 0;
	 var strlen;
	 //alert(f+","+maxSize+","+enter);
	 if (f == 0)//남은 글자 byte 수 보여 주기
	 {  
	  if (remainObj != null)//null 옵션이 아닐 때 만 보여준다.
	  {
	   remainObj.value = msglen;
	  }  
	 }
	 else{
	  for(k = 0; k < f ; k++){
	   temp = obj.value.charAt(k);
	   if(temp =="\n"){
	    enter++;
	   }
	   if(escape(temp).length > 4)
	    msglen -= 2;
	   else
	    msglen--;
	   
	   if(msglen < 0){
	    //alert("총 영문 "+(maxSize*2)+"자 한글 "+maxSize+"자 까지 쓰실 수 있습니다.");
	    alert("총 영문 "+(maxSize)+"자 한글 "+(maxSize/2)+"자 까지 쓰실 수 있습니다.");
	    obj.value = tmpstr;
	    break;
	   }
	   else if (lineSize != null & enter > parseInt(lineSize))// lineSize 옵션이 nulldl 아닐 때만 사용
	   {
	    alert("라인수 "+lineSize+"라인을 넘을 수 없습니다.")
	    enter = 0;
	    strlen = tmpstr.length -1;
	    obj.value = tmpstr.substring(0, strlen);
	    break;
	   }
	   else{
	    if (remainObj != null)
	    {
	     remainObj.value = msglen;
	    }      
	    tmpstr += temp;
	   }
	  }  
	 }
	} 

function resultAlert(gubun) {
	if (gubun == "false") {
	alert("이벤트 응모가 실패하였습니다.");
	location.href='/hp/im/et/evt.do?method=getSclassMovieEvent';
	} else if (gubun == "ok") {
		alert("이벤트 응모가 완료되었습니다");
		location.href='/hp/im/et/evt.do?method=getSclassMovieEvent';
		self.close();
	}
}


<% if("Y".equals(dupapply)){ %>
alert("이미 응모하셨습니다.");
location.href="/hp/im/et/evt.do?method=getSclassMovieEvent";
self.close();
<%}%>
</script>


</head>

<body style="margin:0;">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=getSclassMovieEventThi" method="post">
<input type="hidden" name="user_name" value="<%=user_name %>"/>
<input type="hidden" name="idenNo" value="<%=idenNo %>"/>
<input type="hidden" name="hand_phone" value="<%=hand_phone %>"/>
<input type="hidden" name="email" value="<%=email %>"/>


<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/sclass/h1_sclass_feel_app.png" alt="삼성카드 S클래스 무료시사회 이벤트 응모하기" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content">
		<div class="pop_conts">
			
			<h2>삼성카드 S클래스에 대한 느낌을 5글자로 표현해 주세요!</h2>
			<table class="dtable02 mt10" summary="삼성카드 S클래스에 대한 느낌을 5글자로 표현주시고 설명을 해주세요.">
			<caption>삼성카드 S클래스에 대한 느낌 입력</caption>
            <colgroup><col width="130" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th><p><strong class="t_point_blue">삼성카드 S클래스는,</strong></p></th>
					<td><p><input type="text" class="txt" maxlength="5" id="sclassMovie5Text" name="sclassMovie5Text" title="삼성카드 S클래스에 대한 느낌을 5글자로 표현해 주세요!" /> <strong class="t_point_blue">!</strong></p></td>
				</tr>
				<tr>
					<th><p>설명<br /><span class="t_gray t_no">
					<input type="text" size="4" name="remain_intro" value="2000" class="txttest" />
					/2000byte</span></p></th>
					<td>
						<textarea name="sclassMovieText" cols="80" rows="6" class="txt" onchange="javascript:maxLengthCheck('2000', null, this, remain_intro);" onkeyup="javascript:maxLengthCheck('2000', null, this, remain_intro);"></textarea>
					</td>
				</tr>
			</tbody>
			</table>
			
			<ul class="list_rice mt5">
				<li>선정적인 문구 및 사회적 문제가 야기될 수 있는 단어 및 문장 사용 시 관리자가 임의로 삭제할 수 있습니다.</li>
				<li>제세공과금은 당사 부담입니다.</li>
			</ul>

			<div class="line_lgray"></div>

			<h2>관람을 원하는 영화와 장소를 선택해 주세요</h2>
			<table class="dtable02 mt10" summary="영화선택 및 관림지역 그리고 관람일시를 선택해 주세요.">
            <caption>관람을 원하는 영화 정보 입력</caption>
			<colgroup><col width="130" /><col width="*" /></colgroup>
			<tbody>
				<tr>
					<th><p>영화선택</p></th>
					<td><p>엑스맨</p></td>
				</tr>
				<tr>
					<th><p>관람지역</p></th>
					<td><p>
							<select name="areamovie" style="width:135px;">
								<option value = "영등포">영등포</option>
								<option value = "왕십리">왕십리</option>
								<option value = "명동">명동</option>
								<option value = "대학로">대학로</option>
								<option value = "압구정">압구정</option>
								<option value = "목동">목동</option>
								<option value = "죽전">죽전</option>
								<option value = "일산">일산</option>
								<option value = "인천">인천</option>
								<option value = "수원">수원</option>
								<option value = "춘천">춘천</option>
								<option value = "순천">순천</option>
								<option value = "전주">전주</option>
								<option value = "창원더시티">창원더시티</option>
								<option value = "대전">대전</option>
								<option value = "천안">천안</option>
								<option value = "광주터미널">광주터미널</option>
								<option value = "서면">서면</option>
								<option value = "센텀시티">센텀시티</option>
								<option value = "대구">대구</option>
								<option value = "포항">포항</option>
								<option value = "울산">울산</option>
								<option value = "제주">제주</option>
							</select>
						</p></td>
				</tr>
				<tr>
					<th><p>관람일시</p></th>
					<td><p>2011.06.02(목) 19:30</p></td>
				</tr>
			</tbody>
			</table>

			<div class="btnc"><a href="#" onclick="applyEvent();">
			<img src="/images/et/sclass/btn_app.png" alt="응모하기" /></a></div>
		</div>
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
</form>
</body>

</html>

