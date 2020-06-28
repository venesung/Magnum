<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 2, 삼성카드 2+ 롯데시네마 샤롯데관 초대 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String card2YN = (String)request.getAttribute("card2YN"); // 카드2 시리즈 소지여부
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_lotte	{position:relative; z-index:1;}

.event_lotte	.event_input {}
.event_lotte	.event_input_1	{
	position:absolute;
	z-index:2;
	left:259px;
	top:1102px;
}
.event_lotte	.event_input_2	{
	position:absolute;
	z-index:2;
	left:391px;
	top:1102px;
}
.event_lotte	.event_input_3	{
	position:absolute;
	z-index:2;
	left:523px;
	top:1102px;
}
.event_lotte	.event_input_4	{
	position:absolute;
	z-index:2;
	left:259px;
	top:1133px;
}
.event_lotte	.event_input_5	{
	position:absolute;
	z-index:2;
	left:391px;
	top:1133px;
}
.event_lotte	.event_input_6	{
	position:absolute;
	z-index:2;
	left:523px;
	top:1133px;
}
.event_lotte	.event_input_7	{
	position:absolute;
	z-index:2;
	left:259px;
	top:1163px;
}
.event_lotte	.event_input_8	{
	position:absolute;
	z-index:2;
	left:391px;
	top:1163px;
}
.event_lotte	.event_input_9	{
	position:absolute;
	z-index:2;
	left:523px;
	top:1163px;
}
.event_lotte	.e_input	input	{width:28px; height:28px}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12292');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(card2YN.equals("N")){%>
				alert("삼성카드 2, 삼성카드 2+를 소지하신 회원만 응모 가능합니다.");
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
			alert("희망 영화관 선택 후 응모해주세요.");
		}
		else{
			frm.gubun.value = gubun;
			frm.method = "post";
			frm.target = "formhidden";
			frm.action = '/hp/im/et/evt002.do?method=EventInsertLotte';
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

	function msgBefore() {
		alert("이벤트기간이 아닙니다.");
	}
	function msgEnd() {
		alert("이벤트가 종료되었습니다.");
	}
	function msgDup() {
		alert("이미 이벤트에 응모하셨습니다.");
	}
	function applyOk(chitem) {
		alert("이벤트 응모가 완료되었습니다.");
	}

</script>


</head>

<body style="margin:0;">
<form id="evtFrm" name="evtFrm" method="post" action="">
<input type="hidden" name="gubun" value=""/>

<div class="event_lotte">
<img src="/images/et/120326_lotte.jpg" alt="삼성카드 2, 삼성카드 2+ 롯데시네마 샤롯데관 초대 이벤트" border="0" usemap="#lotte" />


	<div class="hidden">
		<h1>삼성카드 2, 삼성카드 2+ 롯데시네마 샤롯데관 초대 이벤트</h1>
		<p>최신 영화를 더 특별하게 감상할 수 있는 기회! 삼성카드가 특별한 시간을 선물합니다.</p>
		
		<dl>
			<dt>행사일</dt>
			<dd>2012년 5월 19일(토) 오후 4시</dd>
			<dt>응모기간</dt>
			<dd>2012년 3월 30일 ~ 2012년 4월 30일</dd>
			<dt>행사대상</dt>
			<dd>삼성카드 2 / 삼성카드 2+ 카드 보유 회원 중 행사기간동안 일시불 및 할부 50만원 이상 이용회원</dd>
			<dt>상영영화</dt>
			<dd>백설공주(주연:계모왕비 - 줄리아로버츠, 백설공주 - 릴리 콜린스) <a href="http://www.snowwhite2012.co.kr/" target="_blank" title="새창">백설공주 자세히 보기 </a></dd>
			<dt>행사내용</dt>
			<dd>행사 응모회원 중 추첨을 통해 전국 롯데시네마 샤롯데관 무료초대 행운을 드립니다.(총 148명, 1인 2매)
				<p>초청회원님에게는 별도로 푸짐한 음료/다과를 제공해 드립니다.</p>
			</dd>
			<dt>당첨자 발표</dt>
			<dd>2012년 5월 8일</dd>
		</dl>
		
				
		<p>희망영화관 선택하기</p>
		<div>영화관 선택</div>
		
		<ul>
			<li>샤롯데 에비뉴엘</li>
			<li>샤롯데 건대입구</li>
			<li>샤롯데 김포공항</li>
			<li>샤롯데 인천</li>
			<li>샤롯데 안산</li>
			<li>샤롯데 평촌</li>
			<li>샤롯데 센텀시티</li>
			<li>샤롯데 동성로</li>
			<li>샤롯데 마산</li>
			
		</ul>
		
		
		
	<p><a href="#none" onclick="go_start();return false;">응모하기</a></p>
		
	
	
	</div>





	<map name="lotte" id="lotte">
		<area shape="rect" coords="176,849,311,869" href="http://www.snowwhite2012.co.kr/" alt="백설공주 자세히보기" target="_blank" title="새창" />
		<area shape="rect" coords="276,1250,430,1288" href="#" onclick="go_start();return false;" alt="응모하기" />
	</map>
		<p class="e_input event_input_1">
		<label><input type="radio" name="quiz" class="quiz1" value="1" /></label></p>
		<p class="e_input event_input_2">
		<label><input type="radio" name="quiz" class="quiz2" value="2" /></label></p>
		<p class="e_input event_input_3">
		<label><input type="radio" name="quiz" class="quiz3" value="3" /></label></p>
		<p class="e_input event_input_4">
		<label><input type="radio" name="quiz" class="quiz4" value="4" /></label></p>
		<p class="e_input event_input_5">
		<label><input type="radio" name="quiz" class="quiz5" value="5" /></label></p>
		<p class="e_input event_input_6">
		<label><input type="radio" name="quiz" class="quiz6" value="6" /></label></p>
		<p class="e_input event_input_7">
		<label><input type="radio" name="quiz" class="quiz7" value="7" /></label></p>
		<p class="e_input event_input_8">
		<label><input type="radio" name="quiz" class="quiz8" value="8" /></label></p>
		<p class="e_input event_input_9">
		<label><input type="radio" name="quiz" class="quiz9" value="9" /></label></p>
</div>



</form>
<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="컨텐츠 프레임"></iframe>
</body>

</html>

