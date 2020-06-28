<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드가 2012 설 보너스를 드립니다!-설맞이 Bonus ONE 이벤트 - 삼성카드</title>
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
.event_bonus_one	#lay_1,	.event_bonus_one	#lay_2,	.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:137px; top:900px; width:470px; height:294px;}
input {width: 13px; height: 13px; margin: 0; padding: 0;}

/* 120106 수정 */
.event_bonus_one	.event_input_1	{position:absolute; z-index:2; left:133px; top:1242px;}
.event_bonus_one	.event_input_2	{position:absolute; z-index:2; left:358px; top:1242px;}
.event_bonus_one	.event_input_3	{position:absolute; z-index:2; left:578px; top:1242px;}
/* //120106 수정 */

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12126');
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
				alert("이미 주유소 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 이마트/홈플러스/롯데마트 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 외식비 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
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
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
				return;
			<%}%>
			parent.submit_eventLog();
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
		<area shape="rect" coords="98,1206,184,1227" alt="자세히보기" href="javascript:layeropen(1)" /> 
		<area shape="rect" coords="321,1206,407,1227" alt="자세히보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="540,1206,626,1227" alt="자세히보기" href="javascript:layeropen(3)" />
		<area shape="rect" coords="294,1320,431,1355" alt="응모하기" href="javascript:go_start();" />
  </map>
	<img src="/images/et/bonusone201112/bonusoneimg.jpg" usemap="#bonus_one" alt="삼성카드가 2012 설 보너스를 드립니다!-설맞이 Bonus ONE 이벤트" />
    <div class="hidden">
		<p>삼성카드가 2012 설 보너스를 드립니다.</p>
		<h1>설 맞이 Bonus One 이벤트</h1>
		<p>명절에도 참 실용적인 삼성카드와 함께 실속있는 설 맞이 하세요!</p>
		
		<dl>
			<dt>응모기간</dt>
			<dd>2012년 1월 1일(일) ~ 1월 29일(일)</dd>
			<dt>행사기간</dt>
			<dd>2012년 1월 20일 ~ 1월 29일(일)</dd>
			<dt>행사내용</dt>
			<dd>3가지 Bonus 혜택 중 원하시는 업종에 응모하신 후 행사기간 동안 삼성카드를 이용하시면 5,000원 캐시백 혜택을 드립니다.</dd>
		</dl>
		
		<dl>
			<dt>주유소 5,000원 캐시백</dt>
			<dd><a href="#none" onclick="layeropen(1)" title="주유소 캐시백 자세히보기 바로가기">자세히보기</a></dd>
			<dd><p class="e_input event_input_1"><label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="주유소 5,000원 캐시백" /></label></p></dd>
			
			<dt>이마트/홈플러스/롯데마트 5,000원 캐시백</dt>
			<dd><a href="#none" onclick="layeropen(2)" title="이마트/홈플러스/롯데마트 캐시백 자세히보기 바로가기">자세히보기</a></dd>
			<dd><p class="e_input event_input_2"><label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="이마트/홈플러스/롯데마트 5,000원 캐시백" /></label></p></dd>
			
			<dt>외식비 5,000원 캐시백</dt>
			<dd><a href="#none" onclick="layeropen(2)" title="외식비 자세히보기 바로가기">자세히보기</a></dd>
			<dd><p class="e_input event_input_3"><label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="외식 5,000원 캐시백" /></label></p></dd>			
		</dl>
		
        <p><a href="#none" onclick="go_start();">응모하기</a></p>
		
		<ul>
			<li>3가지 혜택 중 1가지만 선택하실 수 있으며 응모 후 변경하실 수 없습니다.</li>
			<li>법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
			<li>카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
		</ul>		
	</div>
    
	<form name="frm1" method="post" action="">
		<p class="e_input event_input_1">		  
		  <label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="주유소 5,000원 캐시백" /></label>
		 </p>
		<p class="e_input event_input_2">
		  <label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="이마트/홈플러스/롯데마트 5,000원 캐시백" /></label>
		 </p>
		<p class="e_input event_input_3">
		  <label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="외식 5,000원 캐시백" /></label>
		 </p>
	</form>
<!-- 레이어팝업 -->
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="주유소 5,000원 캐시백 닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/bonusone201112/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="주유소 5,000원 캐시백" /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="이마트/홈플러스/롯데마트 5,000원 캐시백 닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201112/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="이마트/홈플러스/롯데마트 5,000원 캐시백" /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="외식 5,000원 캐시백 닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201112/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="외식 5,000원 캐시백" />
	</div>
<!-- //레이어팝업 -->
</div>

	

</body>

</html>

