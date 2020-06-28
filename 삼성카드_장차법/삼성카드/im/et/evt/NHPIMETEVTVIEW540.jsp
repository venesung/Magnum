<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 혜택의 재발견 6 - 삼성카드</title>
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
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/html/event/hae201209/images/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}

#lay_1, #lay_2{position:absolute; top:1000px;left:125px; /*display:none;*/}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script src="/html/event/hae201209/embedswf.js" language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
	var done_yn = "N";
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('32308'); 
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
		if (done_yn == 'Y') {
			alert("이미 이벤트에 응모하셨습니다.");
			location.reload();
		}
		done_yn = "Y";
		<%
		if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('32308');
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
				
					parent.submit_eventLog();
					document.evtFrm.target = "applyResultFrame";
					document.evtFrm.submit();

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


</script>


</head>

<body <%if(loginYN.equals("Y")){%>onload="EmbedFlash();"<%}%>>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value="" />
<input type="hidden" name="eventNo" value="<%=eventNo%>" />


<div id="wrap" class="landWrap">

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

function EmbedFlash( )
{
	var flashVars =
	{
		// debug : "true"
	};

	embedSWF( "flashLayer" , "/html/event/hae201209/main.swf" , "646" , "799" ,
	{
		id : "flash"
	} ,
	{
		allowScriptAccess : "always" ,
		allowFullscreen : "true" ,
		wmode : "transparent"
	} , flashVars );
}

function fStart()
{
	flash.fStart( );
}

function fCallResult()
{
	flash.fCallResult( );
}

function fResult( bool )
{
	<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			return;
	<%}else if( beginDateYN.equals("N")){ %>
	  	alert("<%=beginMsg %>");
	  	return;
 	<%} %>
	// -- true/false 로 분기처리
	<%if(event_ok.equals("Y")){%>
		alert("이미 이벤트에 응모하셨습니다.");
		return;
	<%} %>
	
	if (bool) {
		go_start();
	} else {
		layeropen(2);
	}
} 
 
</script>
<%
			if(loginYN.equals("N")){ 
%>
<img src="/html/event/hae201209/images/120824_eventno.png" alt="삼성카드 혜택의 재발견 6" border="0" usemap="#episode" />

	<div class="hidden">
		<h1>삼성카드 혜택의 재발견 6</h1>
		<p>참 실용적인 삼성카드의 새로운 얼굴, 숫자카드 -  꼭 기억해야 할 혜택의 숫자가 바로 카드의 이름입니다. 숫자카드 혜택 찾기 퀴즈에 응모해 보세요 추첨을 통해 총 100분께 푸짐한 경품을 드립니다.</p>
		
		<p>quiz</p>
		<h2>각 숫자카드의 대표혜택은 무엇일까요?</h2>
		<p>왼쪽의 숫자카드와 오른쪽의 혜택을 연결시켜주세요(클릭 후 드래그) 모두 연결하고 '응모하기'버튼을 누르면 이벤트 응모 완료 <a href="/showroom/shw.do?method=getNumber" target="_blank" title="새창">힌트보기</a></p>
		
		<div>퀴즈영역</div>
		
		<p>
            <a href="#none" onclick="parent.eventLogin('32308');return false;">응모하기</a>
            <a href="/showroom/shw.do?method=getNumber" target="_blank" title="새창">힌트보기</a>
		</p>
		
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 9월 12일(수) ~ 10월 7일(일)</dd>
			<dt>당첨자발표</dt>
			<dd>2012년 10월 17일 (수) 홈페이지 당첨자 발표란</dd>
			<dt>경품안내</dt>
			<dd>
				<ul>
					<li>1등(1명) - 50만원 삼성기프트카드</li>
					<li>2등(2명) - 30만원 삼성기프트카드</li>
					<li>3등(87명) - 10,000P 서비스 포인트</li>
					<li>특별상(10명) - 20,000P 서비스 포인트</li>
					<li>추첨대상 : 퀴즈 정답을 맞힌 회원</li>
					<li>추첨대상 : 퀴즈 정답을 맞히고 행사기간 동안 숫자카드를 이용한 회원</li>
				</ul>
			</dd>
		</dl>
		
		<p>주의사항</p>
		<ul>
			<li>- 경품 배송 시작일 및 포인트 적립예정일 : 10월 23일(화)</li>
			<li>- 1,2등 경품의 제세공과금(22%)은 당첨회원님 본인 부담입니다.</li>
			<li>- 서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스 포인트 및 빅포인트와 합산해 사용하실 수 있습니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단 될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
		</ul>
		
		
		
	</div>

	<map name="episode" id="episode">
		<area shape="rect" coords="224,1437,362,1475" href="#" onclick="parent.eventLogin('32308');" alt="응모하기" />
		<area shape="rect" coords="512,558,585,577" href="/showroom/shw.do?method=getNumber" target="_blank" title="새창" alt="힌트보기" />
		<area shape="rect" coords="368,1438,505,1476" href="/showroom/shw.do?method=getNumber" target="_blank" title="새창" alt="힌트보기" />
	</map>
<%
			}else{
%>
<img src="/html/event/hae201209/images/120824_event.png" alt="삼성카드 혜택의 재발견 6" border="0" usemap="#episode" />
	<map name="episode" id="episode">
		<area shape="rect" coords="224,1437,362,1475" href="#" onclick="flash.fCallResult();" alt="응모하기" />
		<area shape="rect" coords="512,558,585,577" href="/showroom/shw.do?method=getNumber" target="_blank" title="새창" alt="힌트보기" />
		<area shape="rect" coords="368,1438,505,1476" href="/showroom/shw.do?method=getNumber" target="_blank" title="새창" alt="힌트보기" />
	</map>
	<!-- 플래시영역 --><div id="flashLayer" style="position:absolute; top:609px; left:40px;"></div><!-- //플래시영역 -->
<% } %>
		<!-- 이벤트 응모 -->
		<div id="lay_1" style="display:none;">
			<div class="pop_l_wrap" style="width:470px;height:300px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 30px 30px;">
					<p><img src="/html/event/hae201209/images/120824_eventpop1txt.png" alt="이벤트에 응모 되셨습니다." border="0" usemap="#Map01" />
						<map name="Map01" id="Map01">
						  <area shape="rect" coords="115,169,266,201" href="/showroom/shw.do?method=getNumber" target="_blank" title="새창" alt="숫자카드 신청하기" />
					  </map>
					</p>
				</div>
			</div>
		</div><!-- //lay_1 -->

		<!-- 정답이 아닙니다 -->
		<div id="lay_2" style="display:none">
			<div class="pop_l_wrap" style="width:470px;height:300px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="응모하기 레이어 닫기" />
				<div class="pop_l_content" style="padding:50px 130px 30px;">
					<p><img src="/html/event/hae201209/images/120824_eventpop2title.png" alt="정답이 아닙니다. 다시 한번 도전해보세요!" border="0" /></p>
				</div>
                <p style="margin:5px 210px 30px; text-decoration:underline;"><a href="/showroom/shw.do?method=getNumber" target="_blank" style="color:#5a96c8;">힌트보기</a></p>
				<p style="text-align:center;"><a href="#" onclick="this.parentNode.parentNode.parentNode.style.display='none';"><img src="/html/event/hae201209/images/120824_eventpop2btn.png" alt="다시 응모하기" /></a></p>		
			</div>
		</div><!-- //lay_2 -->

</div><!-- //wrap -->
	
</form>
</body>

</html>

