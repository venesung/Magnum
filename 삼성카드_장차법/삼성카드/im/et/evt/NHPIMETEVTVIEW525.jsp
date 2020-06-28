<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>가계 부담을 덜어 드리는. 삼성카드의 보너스! 생활비 Bonus one 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one	{position:relative; z-index:1;}
.event_bonus_one	#lay_1{ display:none; position:absolute; z-index:2; left:137px; top:710px; width:470px; height:294px;}
.event_bonus_one	#lay_2	{display:none; position:absolute; z-index:2; left:137px; top:785px; width:470px; height:294px;}
.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:137px; top:785px; width:470px; height:294px;}
input {width: 13px; height: 13px; margin: 0; padding: 0;}

.event_bonus_one	.event_input_1	{
	position:absolute;
	z-index:2;
	left:132px;
	top:1134px;
}
.event_bonus_one	.event_input_2	{
	position:absolute;
	z-index:2;
	left:357px;
	top:1134px;
}
.event_bonus_one	.event_input_3	{
	position:absolute;
	z-index:2;
	left:577px;
	top:1134px;
}
</style>

<script language="javascript" type="text/javascript">
	var sel_item = "";
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('29420');
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
				alert("이미 워터파크 캐시백 행사에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 3대 할인점 캐시백 행사에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 학원비 캐시백에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
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
			alert("3가지 선물 중 한가지를 선택해주시기 바랍니다.");
		}
		else{
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
				return;
			<%}%>
			parent.submit_eventLog();
			document.evtFrm.item03.value = item03;
			sel_item = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		}
	}

	function applyOk(){
		if (sel_item == "1") {
			alert("워터파크 캐시백 행사에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "2") {
			alert("3대 할인점 캐시백 행사에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "3") {
			alert("학원비 캐시백 행사에 응모해 주셔서 감사합니다.");
		} else {
			alert("이벤트 응모가 완료되었습니다");
		}
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
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
		<area shape="rect" coords="96,1098,182,1119" alt="자세히보기" href="javascript:layeropen(1)" /> 
		<area shape="rect" coords="319,1098,405,1119" alt="자세히보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="541,1099,627,1120" alt="자세히보기" href="javascript:layeropen(3)" />
		<area shape="rect" coords="294,1217,431,1255" alt="응모하기" href="javascript:go_start();" />
  </map>
	<img src="/images/et/bonusone201207/bonusoneimg.jpg" usemap="#bonus_one" alt="가계 부담을 덜어 드리는. 삼성카드의 보너스! 생활비 Bonus one 이벤트" border="0"/>
		<form name="frm1" method="post" action="">
		<p class="e_input event_input_1">		  
		  <label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="워터파크 5,000원 캐시백" /></label>
		 </p>
		<p class="e_input event_input_2">
		  <label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="3대할인점 5,000원 캐시백" /></label>
		 </p>
		<p class="e_input event_input_3">
		  <label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="학원비 5,000원 캐시백" /></label>
		 </p>
	</form>
<!-- 레이어팝업 -->
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(1)" />
			<area shape="rect" coords="146,348,322,375" href=" http://www.samsungcard.com/link/index.jsp?url=EVENT?eventNo=29212"  target="_blank" alt="지정 워터파크 확인하기" title="새창" />
		</map>
		<img src="/images/et/bonusone201207/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="워터파크 5,000원 캐시백" /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201207/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="3대할인점 5,000원 캐시백" /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201207/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="학원비 5,000원 캐시백" />
	</div>
<!-- //레이어팝업 -->
</div>

	

</body>

</html>

