<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드가 한가위 보너스를 드립니다. 한가위 귀성길 Bonus One 이벤트 - 삼성카드</title>
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
			parent.eventLogin('11824');
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
		<area shape="rect" coords="288,760,436,814" alt="한가위 귀성길 Bonus One 이벤트 응모하기" href="javascript:go_start();" />
		<area shape="rect" coords="183,622,258,652" alt="차량점검이벤트" onclick="" href="javascript:layeropen(1)" />
		<area shape="rect" coords="291,623,367,651" alt="주유소이벤트" href="javascript:layeropen(2)" />
		<area shape="rect" coords="622,622,698,653" alt="후불하이패스카드이벤트" href="javascript:layeropen(3)" />
	</map>
	<img src="/images/et/han201108/event_bonus_one9.jpg" usemap="#bonus_one" alt="삼성카드가 한가위 보너스를 드립니다. 한가위 귀성길 Bonus One 이벤트" />
	<form name="frm1" method="post" action="">
	<p class="e_input event_input_1"><label><input type="radio" name="id_event_input" title="id_event_input" value="1" /></label></p>
	<p class="e_input event_input_2"><label><input type="radio" name="id_event_input" title="id_event_input" value="2" /></label></p>
	<p class="e_input event_input_3"><label><input type="radio" name="id_event_input" title="id_event_input" value="3" /></label></p>
	</form>

	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="581,12,619,47" alt="차량점검이벤트레이어팝업 닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/han201108/layer_bonus_one_1.jpg" usemap="#bonus_one_lay_1" alt="차량점검 이벤트 5천원 캐시백 " /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="581,12,619,47" alt="주유소이벤트레이어팝업 닫기" href="javascript:layerclose(2)" />
			<area shape="rect" coords="326,250,447,277" alt="통신비 카드납부 신청" href="javascript:goTabPage('NHPIMSSTEL001M002');" />
		</map>
		<img src="/images/et/han201108/layer_bonus_one_2.jpg" usemap="#bonus_one_lay_2" alt="주유업종 이벤트 5천원 캐시백 " /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="581,12,619,47" alt="후불하이패스카드팝업 닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/han201108/layer_bonus_one_3.jpg" usemap="#bonus_one_lay_3" alt="삼성 후불하이패스카드 이벤트 5천원 캐시백" /></div>
</div>
	
</body>

</html>

