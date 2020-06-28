<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 Quiz Quiz Event - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align: top; font-size:0; line-height:0}
p {margin:0; padding:0}
.type-radio {width: 13px; height: 13px; margin: 0; padding: 0;}
.event_quiz {position: relative;}
.quiz1 {position: absolute; left: 134px;top: 923px;}
.quiz2 {position: absolute; left: 323px;top: 923px;}
.quiz3 {position: absolute; left: 514px;top: 923px;}
.quiz1 img,.quiz2 img,.quiz3 img {margin: 0 0 0 5px;display: inline-block;}
.event_quiz p * {vertical-align: top; display: inline-block;}
.event_quiz p input {margin: 5px 0 0;}
.conts_hidden {font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11888');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		//document.evtFrm.target = "applyResultFrame";
		//document.evtFrm.submit();
		var frm = document.evtFrm;
		var gubun = "";
		
		for(var j=0;j<frm.quiz.length; j++) {
			if (frm.quiz[j].checked == true) {
				gubun = frm.quiz[j].value;
			}
		}

		if(gubun == ""){
			alert("정답을 선택하신 후 응모해 주세요.");
		}
		else{
			frm.gubun.value = gubun;
			if (gubun == "1") {
				window.open('','pop201109','menubar=0,resizable=0,scrollbars=0,width=470,height=460,left=0,top=0');
			} else if (gubun == "2") {
				window.open('','pop201109','menubar=0,resizable=0,scrollbars=0,width=470,height=490,left=0,top=0');
			} else if (gubun == "3") {
				window.open('','pop201109','menubar=0,resizable=0,scrollbars=0,width=470,height=510,left=0,top=0');
			}
			
			frm.target = 'pop201109';
			frm.action = '/hp/im/et/evt002.do?method=getQuiz201109pop';
			frm.submit();
		}		
	}


	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
	function pop201107() {
		window.open('/html/event/jeju/popup_cheju_zone.html','pop201107','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function pop20110726() {
		window.open('/html/event/jeju/popup_cheju_zone_20110726.html','pop20110726','menubar=0,resizable=0,scrollbars=0,width=710,height=590,left=0,top=0');
	}
</script>


</head>

<body style="margin:0;">
<form id="evtFrm" name="evtFrm" method="post" action="">
<input type="hidden" name="gubun" value=""/>
<div class="event_quiz">
<map name="quiz_event" id="quiz_event">
	<area shape="rect" coords="123,951,252,976" href="javascript:parent.goTabPage('NHPIMSSSBC001M006');" alt="보너스클럽 자세히 보기"/>
	<area shape="rect" coords="123,982,252,1007" href="javascript:parent.goTabPage('NHPIMSSSBC001M002');" alt="우리 동네 보너스클럽은?"/>
	<area shape="rect" coords="293,951,445,976" href="javascript:parent.goTabPage('NHPIMSSSBC001M026');"  alt="블루라인 자세히 보기"/>
	<area shape="rect" coords="293,982,445,1007" href="javascript:parent.goTabPage('NHPIMSSSBC001M002');"  alt="우리 동네 블루라인 가맹점은?"/>
	<area shape="rect" coords="479,951,618,976" href="javascript:parent.goTabPage('NHPIMSSSBC001M016');"  alt="페이백 자세히 보기"/>
	<area shape="rect" coords="479,982,618,1007" href="javascript:parent.goTabPage('NHPIMSSSBC001M002');"  alt="우리 동네 패이백 가맹점은?"/>
	<area shape="rect" coords="257,1055,475,1110" href="#"  alt="응모하기"  onclick="go_start();"/>
</map>
<img src="/images/et/quiz201109/event_quiz.jpg" usemap="#quiz_event" alt="삼성카드 Quiz Quiz Event" />
<p class="quiz1"><label for="quiz1"><input type="radio" class="type-radio" id="quiz1" value="1" checked="checked" name="quiz"  /><img src="/images/et/quiz201109/txt_quiz1.png" alt="보너스클럽" /><span class="conts_hidden">보너스클럽</span></label></p>
<p class="quiz2"><label for="quiz2"><input type="radio" class="type-radio" id="quiz2" value="2" name="quiz" /><img src="/images/et/quiz201109/txt_quiz2.png" alt="블루라인" /><span class="conts_hidden">블루라인</span></label></p>
<p class="quiz3"><label for="quiz3"><input type="radio" class="type-radio" id="quiz3" value="3" name="quiz" /><img src="/images/et/quiz201109/txt_quiz3.png" alt="페이백" /><span class="conts_hidden">페이백</span></label></p>
</div>
</form>
</body>

</html>

