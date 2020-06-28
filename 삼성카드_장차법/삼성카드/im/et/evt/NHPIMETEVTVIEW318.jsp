<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>퀴즈이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	
	System.out.println("################################");
	System.out.println("###### beginDateYN #######"+ beginDateYN);
	System.out.println("###### endDateYN #########" + endDateYN);
	System.out.println("################################");
%>
<script language="javascript" type="text/javascript">
	alert('종료된 이벤트입니다.');
	function go_start(){
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('10533');
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
		
		if(document.Form.radValue.value != "3"){
			document.getElementById("lay_message1").style.display="";
		}else{
			document.getElementById("lay_message1").style.display="none";
		<%
			if(event_ok.equals("Y")){ 
		%>
				document.getElementById("lay_message3").style.display="";
				
		<%
			}else{
		%>
				applyEvent();
		<%
			}
		%>
		}
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
*, body {margin:0;padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td{color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img {border:0;}
p {margin:0; padding:0}
ul, ol, li	{list-style:none; list-style-position:outside}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.chk, input.rdo {width:13px; height:13px; margin:2px; margin-right:10px}

.quiz_dim {width:728px; height:252px; background:url('/images/event/event_quiz100827_04.jpg') no-repeat}
.quiz {position:relative; width:728px; height:316px; background:url('/images/event/event_quiz100827_05.jpg') no-repeat}
.quizCont {padding:27px 79px 0px 79px}
.quizCont_dim {padding:27px 79px 0px 79px}
.mb12 {margin-bottom:12px}
.mt20 {margin-top:20px}
.mt50 {margin-top:50px}
.quizQ {padding:20px 0px 0px 25px}
ul.quizList {width:470px; margin-left:25px}
ul.quizList li {float:left; width:195px}
.quizBtn {clear:both; padding-top:15px; text-align:center}
.quizAlert {position:absolute; top:90px; left:250px; z-index:1000}
.quizAlert .quizLayer {width:230px; height:145px; background:url('/images/event/event_quizLayer.png') no-repeat; text-align:center; padding-top:50px}
</style>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=financeEvnetInsert" method="post">
<input type="hidden" name="eventgubun" id="eventgubun" value=""/>
</form>
<form name="Form" method="post" autocomplete="off" action="">
<input type="hidden" name="radValue" id="radValue" />
<p><img src="/images/event/event_quiz100827_01.jpg" alt="알아두면 편리한 금융 부가서비스 퀴즈이벤트" usemap="#event_100827" /></p>
<!-- 퀴즈풀기 -->
<div id="quiz"  class="quiz" style="display:none">
	<!-- message layer 1 -->
	<div id="lay_message1" class="quizAlert" style="display:none">
		<div class="quizLayer"  >
			<p>정답이 아닙니다. 다시 선택해 주세요.</p>
            <p class="mt20"><a href="#1" onclick="document.getElementById('lay_message1').style.display='none';return false;"><img src="/images/event/event_btnClose.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<!-- message layer 2 -->
	<div id="lay_message2" class="quizAlert" style="display:none">
		<div class="quizLayer" >
			<p>참여해 주셔서 감사합니다.</p>
			<p class="mt20"><a href="javascript:button_close();" ><img src="/images/event/event_btnClose.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<!-- message layer 3 -->
	<div id="lay_message3" class="quizAlert" style="display:none">
		<div class="quizLayer" >
			<p>이미 참여하셨습니다.</p>
            <p class="mt20"><a href="#1" onclick="document.getElementById('lay_message3').style.display='none';return false;"><img src="/images/event/event_btnClose.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
		<!-- message layer 4 -->
	<div id="lay_message4" class="quizAlert" style="display:none">
		<div class="quizLayer" >
			<p>이벤트 응모에 실패했습니다. 다시 시도해주세요</p>
            <p class="mt20"><a href="#1" onclick="document.getElementById('lay_message4').style.display='none';return false;"><img src="/images/event/event_btnClose.gif" alt="안내 레이어 닫기" /></a></p>
		</div>
	</div>
	<!-- // message layer -->
	<div class="quizCont" >
		<p class="mb12"><img src="/images/event/event_quizQ.gif" alt="Q. 다음의 괄호 안에 들어갈 알맞은 정답은?" /></p>
		<p><img src="/images/event/event_quizA.gif" alt="자금이 필요한 시기를 미리 등록하시면, 그 시기에 맞춰 이자율 할인 혜택을 제공해 드리는 고객맞춤 서비스는 () 서비스이고, 심사를 통해 현재 카드론 한도를 초과하여 최대 3,000만원까지 대출한도를 드리는 서비스는 () 서비스입니다." /></p>
		<p class="quizQ">
			<ul class="quizList">
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('1');" title="미니결제, 상환방식변경" />미니결제, 상환방식변경</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('2');" title="자유결제, 카드대금결제" />자유결제, 카드대금결제</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('3');" title="혜택예약, 대출한도증액" />혜택예약, 대출한도증액</label></li>
				<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('4');" title="세이브, 생활비재테크" />세이브, 생활비재테크</label></li>
			</ul>
		</p>
        <p class="quizBtn"><a href="javascript:go_answer();" onclick="document.getElementById('lay_message1').style.display='block';"><img src="/images/event/event_btnQuiz.gif" alt="퀴즈응모" /></a></p>
	</div>
</div>
<div id="quiz_dim"   class="quiz_dim" >
		<div class="quizCont">
			<p class="mb12"><img src="/images/event/event_quizQ.gif" alt="Q. 다음의 괄호 안에 들어갈 알맞은 정답은?" /><a href="javascript:go_start();"><img src="/images/event/event_quiz.gif" alt="퀴즈풀기" /></a></p>
			<p><img src="/images/event/event_quizA_dim.gif" alt="자금이 필요한 시기를 미리 등록하시면, 그 시기에 맞춰 이자율 할인 혜택을 제공해 드리는 고객맞춤 서비스는 () 서비스이고, 심사를 통해 현재 카드론 한도를 초과하여 최대 3,000만원까지 대출한도를 드리는 서비스는 () 서비스입니다." /></p>
			<p class="quizQ">
				<ul class="quizList">
					<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('1');" title="미니결제, 상환방식변경" />미니결제, 상환방식변경</label></li>
					<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('2');" title="자유결제, 카드대금결제" />자유결제, 카드대금결제</label></li>
					<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('3');" title="혜택예약, 대출한도증액" />혜택예약, 대출한도증액</label></li>
					<li><label><input type="radio" name="rad_ans" class="rdo" onclick="rad_value('4');" title="세이브, 생활비재테크" />세이브, 생활비재테크</label></li>
				</ul>
			</p>
		</div>
</div>
<!-- // 퀴즈풀기 -->
<p><img src="/images/event/event_quiz100827_02.jpg" alt="퀴즈 정답자 혜택" /></p>

<map name="event_100827" id="event_100827">
<area shape="rect" coords="160,220,230,242" alt="자세히보기" href="javascript:parent.goTabPage('NHPIMFSCDL010C1')" />
<area shape="rect" coords="390,220,460,242" alt="자세히보기" href="javascript:parent.goTabPage('NHPIMFSCDL020C1')" />
<area shape="rect" coords="625,220,692,242" alt="자세히보기" href="javascript:parent.goTabPage('NHIMWSVINDEX')" />
<area shape="rect" coords="160,425,230,448" alt="자세히보기" href="javascript:parent.goTabPage('NHPIMFSMIN001M001')" />
<area shape="rect" coords="625,425,692,448" alt="자세히보기" href="javascript:parent.goTabPage('NHIMCDSINDEX')" />
<area shape="rect" coords="37,485,132,580" alt="현금서비스 바로가기" href="javascript:parent.goTabPage('NHPIMFSCSH001M000')" />
<area shape="rect" coords="140,485,235,580" alt="카드론 바로가기" href="javascript:parent.goTabPage('NHPIMFSCDLM')" />
</map>
</form>

</body>

</html>

