<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>생활비 Bonus One 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one	{position:relative; z-index:1;}
.event_bonus_one	#lay_1,	.event_bonus_one	#lay_2,	.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:41px; top:368px; width:634px; height:350px;}
.event_bonus_one	.event_input_1	{position:absolute; z-index:2; left:130px; top:666px;}
.event_bonus_one	.event_input_2	{position:absolute; z-index:2; left:351px; top:667px;}
.event_bonus_one	.event_input_3	{position:absolute; z-index:2; left:566px; top:666px;}
.event_bonus_one	.e_input	input	{width:28px; height:28px}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11873');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				//alert("이미 이벤트에 응모하셨습니다.");
				<%if (item03.equals("1")) {%>
				alert("이미 외식비 10,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 주유소 10,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 3대할인점 캐시백을 응모하셨습니다. 감사합니다.");
				<%} %>	
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
		
		for(var j=0;j<frm.id_event_input_1.length; j++) {
			if (frm.id_event_input_1[j].checked == true) {
				item03 = frm.id_event_input_1[j].value;
			}
		}

		if(item03 == ""){
			alert("3가지 이벤트 중 한가지를 선택해주시기 바랍니다.");
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
		<area shape="rect" coords="288,760,436,814" alt="생활비 Bonus One 이벤트 응모하기" href="javascript:go_start();" />
		<area shape="rect" coords="188,560,258,584" alt="외식비 자세히 보기" onclick="" href="javascript:layeropen(1)" />
		<area shape="rect" coords="295,627,366,650" alt="주유소 자세히 보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="626,560,697,584" alt="3대 할인점 자세히 보기" href="javascript:layeropen(3)" />
	</map>
	<img src="/images/et/bonusone201109/event_bonus_one9_1.jpg" usemap="#bonus_one" alt="작지만 알뜰하게 도움되는 캐시백 혜택! 생활비 Bonus One 이벤트" />
	<form name="frm1" method="post" action="">
	<p class="e_input event_input_1"><label><input type="radio" name="id_event_input_1" value="1" title="외식비 10,000원 캐시백" /></label></p>
	<p class="e_input event_input_2"><label><input type="radio" name="id_event_input_1" value="2" title="주유소 10,0000원 캐시백" /></label></p>
	<p class="e_input event_input_3"><label><input type="radio" name="id_event_input_1" value="3" title="3대 할인점 10,000원 캐시백" /></label></p>
	</form>
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1"> 
			<area shape="rect" coords="581,12,619,47" alt="외식비이벤트레이어팝업 닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/bonusone201109/layer_bonus_one_1_1.jpg" usemap="#bonus_one_lay_1" alt="외식비 Bonus ONE 이벤트 10,000원 캐시백 " /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="581,12,619,47" alt="주유소이벤트레이어팝업 닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201109/layer_bonus_one_2_1.jpg" usemap="#bonus_one_lay_2" alt="주유소 Bonus ONE 이벤트 10,000원 캐시백 " /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="581,12,619,47" alt="3대 할인점이벤트레이어팝업 닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201109/layer_bonus_one_3_1.jpg" usemap="#bonus_one_lay_3" alt="3대 할인점 Bonus ONE이벤트 10,000원 캐시백" /></div>
</div>

</body>

</html>

