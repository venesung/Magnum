<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성빅앤빅카드란? - 삼성카드</title>
<%
	String quiz = (String)request.getAttribute("gubun");
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
#pop_s_content2 .txt {letter-spacing: -1px;margin: 13px 0 20px 10px;text-align: left;}
.visual_img {text-align: center;margin: 30px 0 0;}
.txt_answer {background: url("/images/et/quiz201110/round_answer.png") no-repeat left top;width: 310px;height: 61px;margin: 0 auto 25px;padding: 17px 0 0;}
.txt_answer .img {text-align: center;}
.txt_answer .input_txt {text-align: center;margin: 10px 0 0;}
.txt_answer .input_txt label {margin: 0 20px 0 0;}
</style>
<script language="javascript" type="text/javascript">
	
	function applyEvent(gubun) {
		var frm = document.evtFrm;
		var item03 = "";
		
		for(var j=0;j<frm.answer.length; j++) {
			if (frm.answer[j].checked == true) {
				item03 = frm.answer[j].value;
			}
		}

		if(item03 == "0"){
			opener.parent.submit_eventLog();
			document.evtFrm.gubun.value=gubun;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		} else if(item03 == "1") {
			window.close();
		}
				

	}

	function msgBefore() {
		alert("이벤트는 11월 1일부터 시작입니다.");
		window.close();
	}
	function msgEnd() {
		alert("이벤트가 종료되었습니다.");
		window.close();
	}
	function msgDup() {
		alert("이미 이벤트에 응모하셨습니다.");
		window.close();
	}
	
	function applyOk(){
		alert("이벤트에 정상 응모 되셨습니다. 감사합니다.");
		window.close();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=EventInsert10" method="post">
<input type="hidden" name="gubun" value=""/>


<%if( quiz.equals("1")){ %>
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/quiz201110/pop_h1_bigcard.png" alt="삼성빅앤빅카드란?" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201110/img_bigcard.jpg" alt="삼성빅앤빅카드-빅포인트 및 보너스 이벤트 최대 5%적립" /></p>
		<p class="txt">
			<span class="t_point_org">CGV 무료 관람에 놀이공원 자유이용권 무료 혜택까지, </span><br/>모든 것이 크고 강한 카드! 
		</p>
		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201110/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니까?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('1');"><img src="/images/et/quiz201110/btn_subscription.png" alt="응모하기" /></a>
		</div>
	</div>
	<!-- footer -->
	<div id="pop_s_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" /> <!-- 100311 -->
	</div>
</div>
<%} else if( quiz.equals("2")){ %>
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/quiz201110/pop_h1_tcard.png" alt="삼성티클래스카드란?"/></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201110/img_tcard.jpg" alt="삼성티클래스카드 -주말 0.8% 및 주중 0.4% 빅포인트 적립" /></p>
		<p class="txt">
			<span class="t_point_org">전국 모든 가맹점에서 0.4% 빅포인트 적립~<br/>주말에는 0.8% 더블 적립</span>으로 더욱 실속있게!
		</p>
		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201110/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니까?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('2');"><img src="/images/et/quiz201110/btn_subscription.png" alt="응모하기" /></a>
		</div>
	</div>
	<!-- footer -->
	<div id="pop_s_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" /> <!-- 100311 -->
	</div>
</div>
<%} else if( quiz.equals("3")){ %>
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/quiz201110/pop_h1_sclass.png" alt="삼성S클래스란?"/></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201110/img_sclass.jpg" alt="삼성S클래스-누려보세요 모여서 더 커진 특별한 혜택" /></p>
		<p class="txt">
			삼성 관계사&middot;제휴사에서 더 높아지는 포인트 적립 및 할인 혜택<br/><span class="t_point_org">S선포인트 이용 시 최대 10% S포인트 적립 혜택</span>
		</p>
		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201110/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니까?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('3');"><img src="/images/et/quiz201110/btn_subscription.png" alt="응모하기" /></a>
		</div>
	</div>
	<!-- footer -->
	<div id="pop_s_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" /> <!-- 100311 -->
	</div>
</div>
<%} %>
</form>
</body>

</html>

