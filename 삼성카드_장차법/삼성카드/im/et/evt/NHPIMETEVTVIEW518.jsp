<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 혜택의 재발견 - 삼성카드</title>
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
input.checkbox_type {width:13px; height:13px; vertical-align:top;}
#wrap {position:relative; z-index:1; width: 728px;}
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/hae201207/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}



/*선택하기 라디오 버튼 */
#wrap .event_input_1{
	position:absolute;
	left:117px;
	top:945px;
}
#wrap .event_input_2{
	position:absolute;
	left:315px;
	top:945px;
}
#wrap .event_input_3{
	position:absolute;
	left:521px;
	top:945px;
}

#lay_1, #lay_2{position:absolute; top:680px;left:125px; display:none;}
</style>

<script language="javascript" type="text/javascript">
	var done_yn = "N";
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('28938');
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
		if (done_yn == 'Y') {
			alert("이미 이벤트에 응모하셨습니다.");
			location.reload();
		}
		<%
		if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('28938');
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
				var frm = document.evtFrm;
				
				if((frm.id_event_input_1[0].checked) && (frm.id_event_input_1[1].checked) && (frm.id_event_input_1[2].checked)){
					parent.submit_eventLog();
					document.evtFrm.target = "applyResultFrame";
					document.evtFrm.submit();
				}else if(!(frm.id_event_input_1[0].checked) && !(frm.id_event_input_1[1].checked) && !(frm.id_event_input_1[2].checked)){
					alert("정답 선택 후 응모 해주세요.");
				}else{
					layeropen(2);
				}
			<% } %>	
		<%
			}
		%>
		
	}

	function applyOk(){
		done_yn = "Y";
		layeropen(1);
		//location.reload();
		//alert("이벤트 응모가 완료되었습니다");
		
	}
	function applyDu(){
		alert("이미 이벤트에 응모하셨습니다.");
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
			parent.eventLogin('28938');
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
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>


<div id="wrap">

<script type="text/javascript">
function layeropen(num){
	for (i=1; i<3; i++)	{
		document.getElementById("lay_"+i).style.display = "none";
		if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
	}
}
function layerclose(num){
	document.getElementById("lay_"+num).style.display = "none";
}
</script>
  <img src="/images/et/hae201207/120625_event.jpg" alt="삼성카드 혜택의 재발견" border="0" usemap="#episode" />
  <map name="episode" id="episode">
	<area shape="rect" coords="295,1002,433,1040" href="javascript:applyEvent();" alt="응모하기" />
    <area shape="rect" coords="520,781,593,800" href="https://www.samsungcard.com/index.do?method=payment" target="_blank" alt="힌트보기" title="새창" />
	</map>

		<!-- 선택하기 라디오 버튼 -->
		<p class="e_input event_input_1">
  <label><input type="checkbox" name="id_event_input_1" class="checkbox_type" title="" /></label></p>
		<p class="e_input event_input_2">
  <label><input type="checkbox" name="id_event_input_1" class="checkbox_type" title="" /></label></p>
		<p class="e_input event_input_3">
  <label><input type="checkbox" name="id_event_input_1" class="checkbox_type" title="" /></label></p>
		<!-- //선택하기 라디오 버튼 -->

		<!-- 이벤트 응모 -->
		<div id="lay_1">
			<div class="pop_l_wrap" style="width:470px;height:300px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="location.reload();" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 30px 30px;">
					<p><img src="/images/et/hae201207/120625_eventpop1txt.png" alt="이벤트에 응모 되셨습니다." border="0" usemap="#Map01" />
						<map name="Map01" id="Map01">
						  <area shape="rect" coords="295,121,376,140" href="https://www.samsungcard.com/link/index.jsp?url=EVENT?eventNo=25865" target="_blank" alt="자세히보기" title="새창" />
						<area shape="rect" coords="157,179,228,206" href="#" onclick="location.reload();" alt="확인" />
					  </map>
					</p>
			  </div>			
			</div>
		</div>

		<!-- 정답이 아닙니다 -->
		<div id="lay_2">
			<div class="pop_l_wrap" style="width:470px;height:300px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 130px 30px;">
					<p><img src="/images/et/hae201207/120625_eventpop2title.png" alt="정답이 아닙니다. 다시 한번 도전해보세요!" border="0" /></p>
			  </div>
              <p style="padding:5px 210px 30px; text-decoration:underline;"><a href="https://www.samsungcard.com/index.do?method=payment" target="_blank" style="color:#5a96c8;" title="새창">힌트보기</a></p>
              <p style="text-align:center;"><a href="#" onclick="layerclose('2');"><img src="/images/et/hae201207/120625_eventpop2btn.png" alt="다시 응모하기" /></a></p>		
		  </div>
		</div>

</div>
	
</form>
</body>

</html>

