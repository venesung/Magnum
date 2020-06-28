<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>알면 알수록 혜택이 쏟아지는 삼성카드~! 삼성카드 혜택의 재발견 4 - 삼성카드</title>
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
#lay_1,#lay_2{ display:none;position:absolute; z-index:2; left:30px; top:1020px; width:661px; height:316px;}
input.radio_type {width:13px; height:13px; vertical-align:top;}
#wrap {position:relative; z-index:1; width: 728px;}
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/quiz201205/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}



/*선택하기 라디오 버튼 */
#wrap .event_input_1{
	position:absolute;
	left:131px;
	top:704px;
}
#wrap .event_input_2{
	position:absolute;
	left:307px;
	top:704px;
}
#wrap .event_input_3{
	position:absolute;
	left:507px;
	top:704px;
}

#id_layer01,#id_layer02,#id_layer03{position:absolute; top:400px;left:125px;}
input.radio_type {width:13px; height:13px; vertical-align:top;}
.radio01{
	position:absolute;
	top:275px;
	left:181px;
}
.radio02{
	position:absolute;
	top:275px;
	left:249px;
}
.radio03{
	position:absolute;
	top:276px;
	left:181px;
}
.radio04{
	position:absolute;
	top:276px;
	left:249px;
}
.radio05{
	position:absolute;
	top:290px;
	left:181px;
}
.radio06{
	position:absolute;
	top:290px;
	left:249px;
}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('26736');
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
				alert("이미 보너스클럽에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 블루라인서비스에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 페이백서비스에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
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

		if((frm.select01[0].checked) || (frm.select02[0].checked) || (frm.select03[0].checked)){
			parent.submit_eventLog();
			document.evtFrm.item03.value = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
			
		}else{
			document.getElementById("id_layer01").style.display = "none";
			document.getElementById("id_layer02").style.display = "none";
			document.getElementById("id_layer03").style.display = "none";
		}
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

	function openlayer() {

		<%
		if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12475');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				<%if (item03.equals("1")) {%>
				alert("이미 보너스클럽에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 블루라인서비스에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 페이백서비스에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} %>	
			<%}else{ %>
			
					var frm = document.frm1;
					var item03 = "";
					
					for(var j=0;j<frm.id_event_input_1.length; j++) {
						if (frm.id_event_input_1[j].checked == true) {
							item03 = frm.id_event_input_1[j].value;
						}
					}
		
					if(item03 == ""){
						alert("3가지 혜택 중 한가지를 선택해주시기 바랍니다.");
					}
		
					layeropen(item03);
			
			<% } %>	
		<%
			}
		%>
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

<div id="wrap">

<script type="text/javascript">
	function layeropen(num){
		for (i=1; i<4; i++)	{
			document.getElementById("id_layer0"+i).style.display = "none";
			if (i==num) {		document.getElementById("id_layer0"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("id_layer0"+num).style.display = "none";
	}
</script><!--

	<map name="bonus_one">
		<area shape="rect" coords="96,1068,182,1089" alt="자세히보기" href="javascript:layeropen(1)" /> 
		<area shape="rect" coords="319,1068,405,1089" alt="자세히보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="540,1069,626,1090" alt="자세히보기" href="javascript:layeropen(3)" />
		<area shape="rect" coords="294,1187,431,1225" alt="응모하기" href="javascript:go_start();" />
  </map>
  --><img src="/images/et/quiz201205/120502_episode04.jpg" alt="알면 알수록 혜택이 쏟아지는 삼성카드~! 삼성카드 혜택의 재발견 4" border="0" usemap="#episode" />
   <map name="episode" id="episode">
	<area shape="rect" coords="295,756,433,794" href="javascript:openlayer();" alt="응모하기" />
	</map>
    <div class="hidden">		
		<p>알면 알수록 혜택이 쏟아지는 삼성카드</p>
		<h1>삼성카드 혜택의 재발견4</h1>
		<p>전국 어디서나 더 큰 실속으로 만나는 삼성카드 우대혜택 우대혜택 서비스를 꼼꼼히 살펴보시고, 퀴즈에 응모해 보세요. 정답을 맞히신 100분을 추첨하여 푸짐한 경품을 드립니다.</p>
		
		<h2>삼성카드 혜택의 재 발견 퀴즈</h2>
		
		<p>다음 중 3만원 이상 결제 시 5% 청구할인 혜택을 받으실 수 있는 우대혜택 서비스는 무엇일까요?</p>
		<p>정답을 체크하신 후 응모하기 버튼을 누르세요.</p>
		
	
		<ul>
			<li>보너스클럽</li>
			<li>블루라인서비스</li>
			<li>페이백서비스</li>
		</ul>
		
        <p><a href="#none" onclick="openlayer();return falfse;">응모하기</a></p>
		
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 5월 7일 (월) - 5월31일(목0)</dd>
			<dt>당첨자발표</dt>
			<dd>2012년 6월 12일(화) - 홈페이지 담첨자발표란</dd>
			<dt>경품안내</dt>
			<dd>
				<table summary="경품안내 표 - 경품내용과 추첨대상이 있습니다.">
					<caption>경품안내</caption>
					<thead>
						<tr>
							<th>경품</th>
							<th>추첨대상</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1등(1명) 50만원 삼성기프트카드</td>
							<td rowspan="3">퀴즈 정답을 맞힌 회원</td>
						</tr>
						<tr>
							<td>2등 (2명) 30만원 삼성기프트카드</td>
						</tr>
						<tr>
							<td>3등 (87명) 10,000P 서비스포인트</td>
						</tr>
						<tr>
							<td>특별상 (10명) 30,000원 캐시백</td>
							<td>퀴즈 정답을 맞힌 회원 중 행사기간 내 정답에 해당하는 서비스를 이용한 회원</td>
						</tr>
					</tbody>
					
				</table>
			
			</dd>
		</dl>
		
		<ul>
			<li>- 1,2등 경품의 제세공과금(22%)은 회원님 본인 부담입니다.</li>
			<li>- 경품배송 시작일 및 서비스포인트 적립, 캐시백 예정일은 6월 14일(목) 입니다.</li>
			<li>- 서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스포인트 및 빅포이트와함산해 사용하실 수 있습니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경, 중단될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
		</ul>
	</div>
	<form name="frm1" method="post" action="">
		<p class="e_input event_input_1">		  
		  <label><input type="radio" id="bonusone01" class="radio_type" name="id_event_input_1" value="1" title="파파존스" /></label>
		 </p>
		<p class="e_input event_input_2">
		  <label><input type="radio" id="bonusone02" class="radio_type" name="id_event_input_1" value="2" title="아웃백 스테이크하우스" /></label>
		 </p>
		<p class="e_input event_input_3">
		  <label><input type="radio" id="bonusone03" class="radio_type" name="id_event_input_1" value="3" title="베니건스" /></label>
		 </p>
	
<!-- 레이어팝업 --><!--
	<div id="lay_1">
		<map name="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="대중교통 10% 캐시백" /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="주유소 5,000원 캐시백" /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="이마트/홈플러스/롯데마트 5,000원 캐시백" />
	</div>
	
		--><div id="id_layer01" style="display:none">
			<div class="pop_l_wrap" style="width:470px;height:407px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 30px 30px;">
					<p><img src="/images/et/quiz201205/pop_01.jpg" alt="삼성카드 보너스클럽" border="0" usemap="#Map01" />
						<map name="Map01" id="Map01">
						  <area shape="rect" coords="152,285,259,314" href="#" onclick="applyEvent();" alt="응모하기" />
						</map>
					</p>
					<p class="radio01"><label><input type="radio" name="select01"  class="radio_type" title="예" /></label></p>
					<p class="radio02"><input name="select01" type="radio" class="radio_type"  title="아니오" checked="checked" /></p>
			  </div>			
			</div>
		</div>

		<!-- 삼성카드 블루라인 서비스 -->
		<div id="id_layer02"  style="display:none">
			<div class="pop_l_wrap" style="width:470px;height:407px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 30px 30px;">
					<p><img src="/images/et/quiz201205/pop_02.jpg" alt="삼성카드 블루라인 서비스" border="0" usemap="#Map02" />
						<map name="Map02" id="Map02">
						  <area shape="rect" coords="152,285,259,314" href="#" onclick="applyEvent();" alt="응모하기" />
						</map>
					</p>
				  <p class="radio03"><label><input type="radio" name="select02"  class="radio_type" title="예" /></label></p>
					<p class="radio04"><input name="select02" type="radio" class="radio_type"  title="아니오" checked="checked"/></p>
			  </div>			
			</div>
		</div>

		<!-- 삼성카드 페이백 서비스 -->
		<div id="id_layer03" style="display:none">
			<div class="pop_l_wrap" style="width:470px;height:407px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 30px 30px;">
					<p><img src="/images/et/quiz201205/pop_03.jpg" alt="삼성카드 페이백 서비스" border="0" usemap="#Map03" />
						<map name="Map03" id="Map03">
						  <area shape="rect" coords="152,299,259,328" href="#" onclick="applyEvent();" alt="응모하기" />
						</map>
					</p>
				  <p class="radio05"><label><input type="radio" name="select03"  class="radio_type" title="예" /></label></p>
					<p class="radio06"><input name="select03" type="radio" class="radio_type"  title="아니오" checked="checked" /></p>
			  </div>			
			</div>
		</div>	
		</form>
<!-- //레이어팝업 -->
</div>

	

</body>

</html>

