<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2차 금융퀴즈 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부

%>
<script language="javascript" type="text/javascript">
	function go_start(){
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('10727');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				document.getElementById("quiz").style.display="";
				document.getElementById("quiz_dim").style.display="none";
			<% } %>	
		<%
			}
		%>

	}

	function go_answer(){
		<%if(event_ok.equals("Y")){	%>
			document.getElementById("lay_message3").style.display="";
			return;
		<%}	else {%>
				
		if(document.Form.radValue.value != "3"){
			document.getElementById("lay_message1").style.display="";
		}else{
			document.getElementById("lay_message1").style.display="none";
				applyEvent();
		}
		<% } %>
	}

	function rad_value(check_value){
		document.Form.radValue.value=check_value;
	}

	function applyEvent() {
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}

	function applyOk(){
		document.getElementById("lay_message2").style.display="";
	}

	function applyNo(){
		document.getElementById("lay_message4").style.display="";
	}

	function button_close(){
		document.getElementById("lay_message2").style.display="none";
		location.reload();
	}
		
</script>


<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img  {border:0;}
p {margin:0; padding:0}
ul, ol, li	{list-style:none; list-style-position:outside}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.chk, input.rdo	{width:13px; height:13px; margin:2px; margin-right:10px}

.quiz_dim {width:728px; height:325px; background:url('/images/event/event_quiz101006_02.jpg') no-repeat}
.quiz {position:relative; width:728px; height:325px; background:url('/images/event/event_quiz101006_02.jpg') no-repeat}
.quizCont {padding:57px 0px 0px 110px}
.mb7 {margin-bottom:7px}
.mt20 {margin-top:20px}
.mt50 {margin-top:50px}
.quizQ {padding:20px 0px 0px 25px}
ul.quizList {width:470px; margin-left:5px}
ul.quizList li {float:left; width:195px; color:#040404}
.quizBtn {position:absolute; top:215px; left:480px}
.quizAlert {position:absolute; top:90px; left:250px; z-index:1000}
.quizAlert .quizLayer {width:230px; height:145px; background:url('/images/event/event_quizLayer201010.png') no-repeat; text-align:center; padding-top:50px}
.clear {clear:both; line-height:0; font-size:0}
</style>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=financeEvnetInsert001" method="post">
<input type="hidden" name="eventgubun" id="eventgubun" value=""/>
</form>
<form name="Form" method="post" autocomplete="off" action="">
<input type="hidden" name="radValue" id="radValue" />
<p><img src="/images/event/event_quiz101006_01.jpg" alt="제 2차 금융퀴즈 이벤트" usemap="#event_101006" /></p>
<!-- 퀴즈풀기 -->
<div id="quiz"  class="quiz" style="display:none">
	<!-- message layer 1 -->
	<div id="lay_message1" class="quizAlert" style="display:none">
		<div class="quizLayer">
			<p>정답이 아닙니다. 다시 선택해 주세요.</p>
			<p class="mt20"><a href="#1" onclick="document.getElementById('lay_message1').style.display='none';"><img src="/images/event/event_btnClose201010.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<!-- message layer 2 -->
	<div id="lay_message2" class="quizAlert" style="display:none">
		<div class="quizLayer">
			<p>참여해 주셔서 감사합니다.</p>
			<p class="mt20"><a href="javascript:button_close();" onclick="document.getElementById('lay_message2').style.display='none';"><img src="/images/event/event_btnClose201010.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<!-- message layer 3 -->
	<div id="lay_message3" class="quizAlert" style="display:none">
		<div class="quizLayer">
			<p>이미 참여하셨습니다.</p>
            <p class="mt20"><a href="#" onclick="document.getElementById('lay_message3').style.display='none';return false;"><img src="/images/event/event_btnClose201010.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<div class="quizCont">
		<p class="mb7"><img src="/images/event/event_quizQ201010.gif" alt="다음의 네모 안에 들어갈 알맞은 정답은?" /></p>
		<p><img src="/images/event/event_quizA201010.gif" alt="자금이 필요한 시기를 미리 등록해 주시면, 그 시기에 맞춰 이자율 할인 혜택을 드리는 고객 맞춤 서비스는 () 서비스이고, 사용 중인 현금서비스나 카드론을 새로운 대출기간, 상환방법의 카드론으로 변경할 수 있는 서비스는 () 서비스입니다." /></p>
		<p class="quizQ">
			<ul class="quizList">
			<li><label><input type="radio" name="rad_ans" class="rdo"  onclick="rad_value('3');" title="혜택예약, 상환방식변경" />혜택예약, 상환방식변경</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo"  onclick="rad_value('2');" title="자유결제, 카드대금결제" />자유결제, 카드대금결제</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo"  onclick="rad_value('1');" title="미니결제, 대출한도증액" />미니결제, 대출한도증액</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo"  onclick="rad_value('4');" title="세이브, 생활비재테크" />세이브, 생활비재테크</label></li>
			</ul>
		</p>
        <p class="quizBtn"><a href="javascript:go_answer();"><img src="/images/event/event_btnQuiz.gif" alt="퀴즈응모" /></a></p>
	</div>
</div>
<div id="quiz_dim"   class="quiz_dim" >
	<div class="quizCont">
		<p class="mb7"><img src="/images/event/event_quizQ201010.gif" alt="다음의 네모 안에 들어갈 알맞은 정답은?" /></p>
		<p><a href="javascript:go_start();"><img src="/images/event/event_quizA_dim201010.gif" alt="자금이 필요한 시기를 미리 등록해 주시면, 그 시기에 맞춰 이자율 할인 혜택을 드리는 고객 맞춤 서비스는 () 서비스이고, 사용 중인 현금서비스나 카드론을 새로운 대출기간, 상환방법의 카드론으로 변경할 수 있는 서비스는 () 서비스입니다." /></a></p>
		<p class="quizQ">
			<ul class="quizList">
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('3');" title="혜택예약, 상환방식변경" />혜택예약, 상환방식변경</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('2');" title="자유결제, 카드대금결제" />자유결제, 카드대금결제</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('1');" title="미니결제, 대출한도증액" />미니결제, 대출한도증액</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('4');" title="세이브, 생활비재테크" />세이브, 생활비재테크</label></li>
			</ul>
		</p>
	</div>
</div>
<!-- // 퀴즈풀기 -->
<p><img src="/images/event/event_quiz101006_03.jpg" alt="퀴즈 정답자 중 500분을 추첨하여 푸짐한 혜택을 드립니다." /></p>

<map name="event_101006" id="event_101006">
<area shape="rect" coords="175,405,243,430" alt="카드대금결제서비스" href="javascript:parent.goTabPage('NHIMCDSINDEX');" />
<area shape="rect" coords="620,405,688,430" alt="대출한도 증액서비스" href="javascript:parent.goTabPage('NHPIMFSCDL020C1');" />
<area shape="rect" coords="620,573,688,598" alt="상환방식변경서비스" href="javascript:parent.goTabPage('NHIMWSVINDEX');" />
<area shape="rect" coords="175,573,230,598" alt="미니결제서비스" href="javascript:parent.goTabPage('NHPIMFSMIN001M001');" />
<area shape="rect" coords="399,573,467,598" alt="혜택예약서비스" href="javascript:parent.goTabPage('NHPIMFSCDL010C1');" />
<area shape="rect" coords="530,209,699,233" alt="현금서비스 바로가기" href="javascript:parent.goTabPage('NHPIMFSCSH001M000');" />
<area shape="rect" coords="530,235,699,259" alt="카드론 바로가기" href="javascript:parent.goTabPage('NHPIMFSCDLM');" />
</map>
</form>

</body>

</html>

