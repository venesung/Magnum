<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>20%페이백 가맹점에서 받을 수 있는 혜택 이벤트 - 삼성카드</title>
<%
	String quiz = (String)request.getAttribute("gubun");
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
<%if( quiz.equals("1")){ %>
input.radio_type {width:13px; height:13px; vertical-align:top;}
.radio01{
	position:absolute;
	top:325px;
	left:268px;
}
.radio02{
	position:absolute;
	top:325px;
	left:336px;
}
<%} else if( quiz.equals("2")){ %>
input.radio_type {width:13px; height:13px; vertical-align:top;}
.radio01{
	position:absolute;
	top:331px;
	left:268px;
}
.radio02{
	position:absolute;
	top:331px;
	left:336px;
}
<%} else if( quiz.equals("3")){ %>
input.radio_type {width:13px; height:13px; vertical-align:top;}
.radio01{
	position:absolute;
	top:325px;
	left:268px;
}
.radio02{
	position:absolute;
	top:325px;
	left:336px;
}
<%} %>

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
		alert("이벤트는 3월 6일부터 시작입니다.");
		opener.location.reload();
		window.close();
	}
	function msgEnd() {
		alert("이벤트가 종료되었습니다.");
		opener.location.reload();
		window.close();
	}
	function msgDup() {
		alert("이미 이벤트에 응모하셨습니다.");
		opener.location.reload();
		window.close();
	}
	
	function applyOk(gubun){
		if (gubun == "1") {
			alert("'파파존스'로 정상 응모되었습니다.");
		} else if (gubun == "2") {
			alert("'아웃백 스테이크하우스'로 정상 응모되었습니다.");
		} else if (gubun == "3") {
			alert("'베니건스'로 정상 응모되었습니다.");
		} else {
			alert("이벤트에 정상 응모 되셨습니다. 감사합니다.");
		}
		opener.location.reload();
		window.close();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		opener.location.reload();
		window.close();
	}

</script>


</head>

<body style="margin:0;">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=EventInsertQuiz" method="post">
<input type="hidden" name="gubun" value=""/>


<%if( quiz.equals("1")){ %>
<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/quiz201203/h1_pop01.png" alt="20%페이백 가맹점에서 받을 수 있는 혜택은? " /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h445">
		<div class="content_block content_block_card clfix"  style="position:relative">
			<img src="/images/et/quiz201203/img_pop01.png" alt="20% 페이백 가맹점 : 파파존스, 세븐스프링스, 도미노피자, 씨즐러" border="0" usemap="#Map" />
			
			<div class="hidden">
				<ul>
					<li>파파존스</li>
					<li>세븐스프링스</li>
					<li>도미노피자</li>
					<li>씨즐러</li>
				</ul>
				
				<p>20% 페이백 가맹점에서 결제 시 삼성카드 페이백으로 결제해주세요 라고 말씀하시면 결제금액의 20%는 포인트로 결제되며 이용한 포인트의 50%를 재적립해드립니다. 행사기간중 페이백 서비스를 이용하시고 특별상(서비스포인트 5만P, 10명 추첨)에 도전하시는 것도 잊지 마세요!</p>
				
				<p>정답으로 선택 후 응모하시겠습니까?</p>
				<ul>
					<li>예 <p class="radio01">
					<label><input type="radio" name="answer" id="" class="radio_type" title="예" value="0"/></label></p>
					</li>
					<li>아니오 <p class="radio02">
					<label><input name="answer" type="radio" class="radio_type" id="" title="아니오" checked="checked" value="1"/></label></p>
					</li>
				</ul>
				
                <p><a href="#" onclick="applyEvent('1');return false;" title="이벤트 응모하기">확인</a></p>
			
			</div>
			
			
			<map name="Map" id="Map">
				<area shape="rect" coords="283,385,350,417" href="#" onclick="applyEvent('1');" alt="응모하기" />
			</map>
			<p class="radio01">
				<label><input type="radio" name="answer" id="" class="radio_type" title="예" value="0"/></label></p>
			<p class="radio02">
				<label><input name="answer" type="radio" class="radio_type" id="" title="아니오" checked="checked" value="1"/></label></p>
		</div>
  </div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" />
	</div>

</div>


<%} else if( quiz.equals("2")){ %>
<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/quiz201203/h1_pop02.png" alt="매주 수요일, 40% 페이백 가맹점에서 받을 수 있는 혜택은?" /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h445">
		<div class="content_block content_block_card clfix"  style="position:relative">
			<img src="/images/et/quiz201203/img_pop02.png" alt="매주 수요일 40% 페이백 가맹점 : 아웃백, 미스터피자, 도미노 피자, 불고기 브라더스" border="0" usemap="#Map" />
			<map name="Map" id="Map">
				<area shape="rect" coords="283,392,350,422" href="#" onclick="applyEvent('2');" alt="응모하기" />
			</map>
			<p class="radio01">
				<input type="radio" name="answer" value="0" id="" class="radio_type" checked="checked" title="예" /></p>
			<p class="radio02">
				<input type="radio" name="answer" value="1" id="" class="radio_type" title="아니오" /></p>
		</div>
  </div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" />
	</div>

</div>


<%} else if( quiz.equals("3")){ %>
<div id="pop_wrap">
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/quiz201203/h1_pop03.png" alt="30% 페이백 가맹점에서 받을 수 있는 혜택은? " /></h1>
	</div>

	<!-- content -->
	<div id="pop_content" class="h445">
		<div class="content_block content_block_card clfix"  style="position:relative">
		 <img src="/images/et/quiz201203/img_pop03.png" alt="30% 페이백 가맹점 : 빕스, T.G.I Fridays, 베니건스, 투썸 플레이스, 뚜레쥬르" border="0" usemap="#Map" />
			<map name="Map" id="Map">
                <area shape="rect" coords="283,385,350,416" href="#" onclick="applyEvent('3');return false;" alt="응모하기" />
			</map>
			<p class="radio01">
				<input type="radio" id="" name="answer" value="0" class="radio_type" title="예" /></p>
			<p class="radio02">
				<input type="radio" id="" name="answer" value="1" class="radio_type" title="아니오" checked="checked"  /></p>
		</div>
  </div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>

</div>

<%} %>
</form>
</body>

</html>

