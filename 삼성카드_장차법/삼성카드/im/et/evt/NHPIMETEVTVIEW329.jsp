<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>감나무이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String eventIngResult = (String)request.getAttribute("eventIngResult");
	String cmsSeq = (String)request.getAttribute("cmsSeq");
	String item03 = (String)request.getAttribute("item03");
	String dupRegist = (String)request.getAttribute("dupRegist");
	String targetUser = (String)request.getAttribute("targetUser");
	
%>
<script language="javascript" type="text/javascript">AC_FL_RunContent = 0;</script>
<script src="/event/worldcup/js/AC_RunActiveContent.js" language="javascript" type="text/javascript"></script>
<style type="text/css">
body {
	margin:0;
	padding:0;
}
img {
	border: 0px;
}
.content_01 {
	background:url(/images/event/event1010_01.jpg) no-repeat left top;
	width: 728px;
	height: 635px;
}
.content_02 {
	vertical-align:top;
	background:url(/images/event/event1010_02.jpg) no-repeat left top;
	width: 728px;
	height: 618px;
}
.content_03 {
	background:url(/images/event/event1010_03.jpg) no-repeat left top;
	width: 728px;
	height: 359px;
}
.link {
	padding: 374px 0px 0px 277px;
}
.flash {
	padding : 0px 0px 0px 20px;
}

</style>
<script language="javascript" type="text/javascript">

// 플래시에서 받는 함수 flashPointSaveGet()

function thisMovie(movieName) {

    if (navigator.appName.indexOf("Microsoft") != -1) {

        return window[movieName];

    } else {

        return document[movieName];

    }

}

// 플래시에서에서호출 // 결과값출력

function flashVarSend (num){



	var goalnum = num[0];
	var point = num[1];

		var frm = document.mainForm;
		frm.goalnum.value = goalnum;
		frm.point.value = point;
		frm.target = "hiddenFrame";
		frm.submit();

		return str;

}



// 플래시에서에서호출 // 로그인

function setLogin(msg){

	//alert("로그인 하셔야 응모가 가능합니다.");
	//parent.document.getElementById("wrap").focus();
	parent.eventLogin('${cmsSeq}');

}



// 플래시 에서 호출 // 꼴기회 소진 & 9꼴 성공

function gameDenial(msg){
	alert(msg);
}



function cardHistory(msg){

	var theURL ="/hp/im/et/evt003.do?method=worldCupCardInfo";
	 features = "width=700,height=490"
	 window.open(theURL,"카드이용내역1",features);

}

function flashPointSaveGet(){
	alert("d");
}

function apply(flag)
{
	if(flag == "false")
    {

		alert("응모에 실패하였습니다.");
		//mav.addObject("successYn", "Y");
		location.reload();
		return;
    }
	parent.submit_eventLog();
	thisMovie("bingoEvent").flashPointSaveGet(flag);
}
function reloadpages() {
	location.reload();
}

function apply2(flag)
{
	parent.submit_eventLog();
   if(flag == "false")
   {
		alert("응모 가능한 기회가 없습니다.");
		location.reload();
		return;
   }
 }

function apply3(flag)
{
	parent.submit_eventLog();
   if(flag == "false")
   {
		alert("해당 골에는 이미 응모가 완료되었습니다.");
   }

   thisMovie("bingoEvent").flashPointSaveGet(flag);

}

function endDay(){

	alert("이벤트가 종료되었습니다.");
	return;

}
function submitEvent201010()
{
	
	var frm = document.mainForm;
	//frm.goalnum.value = goalnum;
	//frm.point.value = point;
	frm.target = "hiddenFrame";
	frm.submit();	
// 당첨된 등수를 플래시 내부에 있는 'receiveRank' function 으로 보냄
//game.receiveRank("1");
}
</script>
</head>

  

<body style="margin:0;overflow:hidden;background:#fff;">
<div class="content_01">
<a href="javascript:parent.goTabPage('NHPIMMHEPP001');">
<img src="/images/event/event1010_btn.gif" alt="이메일명세서 신청하기" width="179" height="31" class="link" /></a></div>
<div class="content_02">
  <div class="flash">


	
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="668" height="440" id="game" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
<!-- (result=0 : 게임가능, result=1 : 이벤트 대상 아님, result=2 : 이미 응모한 user, result=3 : 이벤트 시작전, result=4 : 이벤트 종료) -->
	<% if (loginYN.equals("n")) { %>
	<param name="movie" value="/flash/event/game.swf?result=5" /> <!-- 로그인 필요 -->
	<% } else if (eventIngResult.equals("before")) { %>
	<param name="movie" value="/flash/event/game.swf?result=3" />
	<% } else if (eventIngResult.equals("after")) { %>
	<param name="movie" value="/flash/event/game.swf?result=4" />
	<% } else if (dupRegist.equals("Y")) { %>
	<param name="movie" value="/flash/event/game.swf?result=2&rank=<%=item03%>" />
	<% } else if (targetUser.equals("N")) { %>
	<param name="movie" value="/flash/event/game.swf?result=1" />
	<% } else {%>
	<param name="movie" value="/flash/event/game.swf?result=0" />	
	<% } %>
	
	
	<param name="wmode" value="transparent" />
	<param name="quality" value="high" />
	<param name="bgcolor" value="#ffffff" />

<embed src="/flash/event/game.swf" quality="high" bgcolor="#ffffff" width="668" height="440" name="game" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object> 
	
</div>
</div>
<div class="content_03"> </div>

<form name="mainForm" id="mainForm" method="post" action="/hp/im/et/evt003.do?method=getGamEventApply" autocomplete="off">
<input type="hidden" name="point" id="point" value="" />
<input type="hidden" name="goalnum" id="goalnum" value="" />
</form>

<iframe name="hiddenFrame" id="hiddenFrame" src="" width="0" height="0" title="빈프레임"></iframe>
</body>
</html>

