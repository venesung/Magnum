<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>받고 싶은 혜택 하나를 골라 이벤트 응모하세요. 제주도 보너스원 이벤트 - 삼성카드</title>
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
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one	{position:relative; z-index:1;}
.event_bonus_one	#lay_1,	.event_bonus_one	#lay_2,	.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:60px; top:405px; width:608px; height:254px;}
.event_bonus_one	.event_input_1	{position:absolute; z-index:2; left:151px; top:443px;}
.event_bonus_one	.event_input_2	{position:absolute; z-index:2; left:356px; top:443px;}
.event_bonus_one	.event_input_3	{position:absolute; z-index:2; left:563px; top:443px;}
.event_bonus_one	.e_input	input	{width:25px; height:28px}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11689');
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
		
		var frm = document.frm1;
		var item03 = "";
		for(var j=0;j<frm.id_event_input.length; j++) {
			if (frm.id_event_input[j].checked == true) {
				item03 = frm.id_event_input[j].value;
			}
		}

		if(item03 == ""){
			alert("3가지 보너스중 1가지를 선택하세요.");
		}
		else{
			document.evtFrm.item03.value = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		}
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>


<div class="event_bonus_one">

<script type="text/javascript">
	function layeropen(num){
		for (i=1; i<4; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
</script>

	<map name="bonus_one" id="bonus_one">
		<area shape="rect" coords="290,693,445,752" alt="제주도 Bonus One 이벤트 응모하기" href="javascript:go_start();" />
		<area shape="rect" coords="132,605,220,625" alt="콘도, 호텔 캐시백 5%" onclick="" href="javascript:layeropen(1)" />
		<area shape="rect" coords="340,605,430,625" alt="LPG 충전소 캐시백 5%" href="javascript:layeropen(2)" />
		<area shape="rect" coords="548,605,635,625" alt="면세점 캐시백 5%" href="javascript:layeropen(3)" />
	</map>
	<img src="/images/event/20110701_event_bonus_one.jpg" usemap="#bonus_one" alt="받고 싶은 혜택 하나를 골라 이벤트 응모하세요. 제주도 보너스원 이벤트" />
	<form name="frm1" method="post" action="">
	<p class="e_input event_input_1"><label><input type="radio" name="id_event_input" title="id_event_input" value="1" /></label></p>
	<p class="e_input event_input_2"><label><input type="radio" name="id_event_input" title="id_event_input" value="2" /></label></p>
	<p class="e_input event_input_3"><label><input type="radio" name="id_event_input" title="id_event_input" value="3" /></label></p>
	</form>
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="560,15,595,45" alt="콘도·호텔 캐시백 이벤트 레이어팝업 닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/event/20110701_layer_bonus_one_1.jpg" usemap="#bonus_one_lay_1" alt="이벤트 응모하고 행사기간 동안 제주도 숙박업종 이용시 전체 이용금액의 5% 캐시백" /></div>

	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="560,15,595,45" alt="LPG 주유 캐시백 이벤트 레이어팝업 닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/event/20110701_layer_bonus_one_2.jpg" usemap="#bonus_one_lay_2" alt="5월 통신 요금  최대 5% 캐시백! " /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="560,15,595,45" alt="면세점 캐시백 이벤트 레이어팝업 닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/event/20110701_layer_bonus_one_3.jpg" usemap="#bonus_one_lay_3" alt="이벤트 응모하고 행사기간 동안 제주도 면세점 이용시 전체 이용금액의 5% 캐시백" /></div>
</div>

</body>

</html>

