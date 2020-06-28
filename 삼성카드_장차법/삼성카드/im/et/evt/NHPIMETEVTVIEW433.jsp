<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 보너스 클럽이란? - 삼성카드</title>
<%
	String quiz = (String)request.getAttribute("gubun");
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
#pop_s_content2 .txt {letter-spacing: -1px;margin: 5px 0 20px;text-align: center;}
#pop_s_content2 .txt img {margin: 5px 0 0;}
.visual_img {text-align: center;margin: 30px 0 0;}
.txt_answer {background: url("/images/et/quiz201109/round_answer.png") no-repeat left top;width: 310px;height: 61px;margin: 0 auto 25px;padding: 17px 0 0;}
.txt_answer .img {text-align: center;}
.txt_answer .input_txt {text-align: center;margin: 10px 0 0;}
.txt_answer .input_txt label {margin: 0 20px 0 0;}
.pay_line {border-bottom: 1px solid #f1f1f1;text-align: center;margin: 20px 0 0;padding: 0 0 10px;line-height: 1em;}
.payback_txt {text-align: center;margin: 10px 0 20px;line-height: 1em;}
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
			document.evtFrm.gubun.value=gubun;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		} else if(item03 == "1") {
			window.close();
		}
				

	}

	function msgBefore() {
		alert("이벤트는 9월 28일부터 시작입니다.");
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
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=EventInsert" method="post">
<input type="hidden" name="gubun" value=""/>


<%if( quiz.equals("1")){ %>
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/quiz201109/pop_h1_bonusclub.png" alt="삼성카드 보너스 클럽이란?" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201109/img_bonusclub.jpg" alt="" /></p>
		<p class="txt">
			결제할 때마다 <span class="t_point_org">최대 5% 보너스포인트가 적립</span>되며 보유 포인트한도 내에서 <br />금액의 <span class="t_point_org">100% 포인트 결제</span>가 가능한 포인트 적립형/사용형 가맹점입니다. 
		</p>
		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201109/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니깐?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('1');"><img src="/images/et/quiz201109/btn_subscription.png" alt="응모하기" /></a>
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
		<h1><img src="/images/et/quiz201109/pop_h1_blueline.png" alt="삼성카드 블루라이이란?" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201109/img_blueline.jpg" alt="" /></p>
		<p class="txt">
			블루라인 멤버십 회원이면 누구나 블루라인 제휴 가맹점에서 <span class="t_point_org">5~10% 청구할인</span>을  <br />받으실 수 있는 멤버십 전용 서비스입니다. (할인횟수 및 금액제한 없음)
			<img src="/images/et/quiz201109/txt_call.png" alt="블루라인 멤버십 회원 무료 가입 (ARS)1688-1015" />
		</p>
		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201109/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니깐?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('2');"><img src="/images/et/quiz201109/btn_subscription.png" alt="응모하기" /></a>
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
		<h1><img src="/images/et/quiz201109/pop_h1_payback.png" alt="삼성카드 블루라이이란?" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content2">
		<p class="visual_img"><img src="/images/et/quiz201109/img_payback.jpg" alt="" /></p>
		<p class="pay_line">페이백 가맹점에 따라 <span class="t_point_org">최대 30%를 포인트로 결제</span>하고 <br />이용하신 포인트의 33.3%~50%를 재적립 해 드리는 서비스입니다.</p>
		<p class="payback_txt">매주 <span class="t_point_org">수요일</span>은 삼성카드 <span class="t_point_org">40% 페이백</span> DAY! <br /><span class="t_point_org">40%포인트 결제</span> 가능하며, <span class="t_point_org">사용한 포인트의 50%</span>를 <br />되돌려 드립니다. (단, 일부 가맹점에 한함)</p>

		<div class="txt_answer">
			<p class="img"><img src="/images/et/quiz201109/txt_answer.png" alt="정답으로 선택 후 응모하시겠습니깐?" /></p>
			<p class="input_txt">
				<label for="yes"><input type="radio" class="type-radio" id="yes" name="answer" value="0"/> 예</label>
				<label for="no"><input type="radio" class="type-radio" id="no" name="answer" value="1" checked="checked"/> 아니오</label>
			</p>
		</div>
		<div class="btnc mb30">
			<a href="#" onclick="applyEvent('3');"><img src="/images/et/quiz201109/btn_subscription.png" alt="응모하기" /></a>
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

