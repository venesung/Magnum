<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

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
.event_bonus_one	#lay_1{ display:none; position:absolute; z-index:2; left:137px; top:785px; width:470px; height:294px;}
.event_bonus_one	#lay_2	{display:none; position:absolute; z-index:2; left:137px; top:800px; width:470px; height:294px;}
.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:137px; top:800px; width:470px; height:294px;}
input {width: 13px; height: 13px; margin: 0; padding: 0;}

.event_bonus_one	.event_input_1	{
	position:absolute;
	z-index:2;
	left:132px;
	top:1130px;
}
.event_bonus_one	.event_input_2	{
	position:absolute;
	z-index:2;
	left:357px;
	top:1130px;
}
.event_bonus_one	.event_input_3	{
	position:absolute;
	z-index:2;
	left:577px;
	top:1130px;
}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	var sel_item = "";
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('31659');
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
				alert("이미 7대 온라인쇼핑몰 포인트 행사에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 3대 가전매장 포인트 행사에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 4대 백화점 포인트 행사에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
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
			alert("7대 온라인쇼핑몰 포인트 행사에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "2") {
			alert("3대 가전매장 포인트 행사에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "3") {
			alert("4대 백화점 포인트 행사에 응모해 주셔서 감사합니다.");
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

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value="" />
<input type="hidden" name="item03" value="" />
<input type="hidden" name="eventNo" value="<%=eventNo%>" />
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

  	<img src="/images/et/bonusone201209/bonusoneimg.jpg" usemap="#bonus_one" alt="가계 부담을 덜어 드리는. 삼성카드의 보너스! 생활비 Bonus one 이벤트" border="0" />
	
	
		<div class="hidden">
			<p>온가족이 함께하는 추석!</p>
			<h1>풍성한 한가위 Bonus One 이벤트</h1>
			<p>한가위를 준비하시는 회원님을 위해 참 실용적인 삼성카드가 준비한 Bonus One 이벤트 3가지 받고 싶은 혜택 중 하나를 선택하시고 행복한 한가위를 맞이하세요 </p>
			
			<dl>
				<dt>행사기간</dt>
				<dd>2012년 9월 3일(월) ~ 10월 14일(일)</dd>
				<dt>행사내용</dt>
				<dd>삼성카드로 일시불 및 할부 70만원 이상 이용한 회원중 해당 이벤트의 요건을 달성한 회원에게 5,000서비스포인트 적립(카드 이용 후 이벤트 응모하셔도 혜택 제공)</dd>
			</dl>
			
			<ul>
                <li>7대 온라인 쇼핑몰 5,000 서비스 포인트 <a href="#none" onclick="layeropen(1);return false;">자세히보기</a></li>
                <li>3대 가전매장 5,000 서비스포인트<a href="#none" onclick="layeropen(2);return false;"> 자세히보기</a></li>
                <li>4대백화점 5,000 서비스 포인트<a href="#none" onclick="layeropen(3);return false;">자세히보기</a></li>
			</ul>
			
            <p><a href="#none" onclick="go_start();return false;">응모하기</a></p>
			
			<ul>
				<li>- 3가지 혜택 중 1가지만 응모하실 수 있으며, 응모 후 선택 변경하실 수 없습니다.</li>
				<li>- 본 이벤트는 개인신용카드(가족카드 포함) 만 해당되며 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
				<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
			</ul>
			
		</div>
	
	
	<map name="bonus_one" id="bonus_one">
		<area shape="rect" coords="97,1087,183,1108" alt="자세히보기" href="javascript:layeropen(1)" /> 
		<area shape="rect" coords="321,1088,407,1109" alt="자세히보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="540,1088,626,1109" alt="자세히보기" href="javascript:layeropen(3)" />
		<area shape="rect" coords="295,1216,432,1254" alt="응모하기" href="javascript:go_start();" />
	</map>

		<form name="frm1" method="post" action="">
		<p class="e_input event_input_1">		  
		  <label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="7대 온라인쇼핑몰 5,000 서비스포인트" /></label>
		 </p>
		<p class="e_input event_input_2">
		  <label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="3대가전매장 5,000 서비스포인트" /></label>
		 </p>
		<p class="e_input event_input_3">
		  <label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="4대백화점 5,000 서비스포인트" /></label>
		 </p>
	</form>
<!-- 레이어팝업 -->
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/bonusone201209/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="7대 온라인쇼핑몰 5,000 서비스포인" /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201209/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="3대가전매장 5,000 서비스포인트" /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201209/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="4대백화점 5,000 서비스포인트" />
	</div>
<!-- //레이어팝업 -->
</div>

	

</body>

</html>

