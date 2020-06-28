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

//	loginYN = "Y";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>달콤한 행운 Bonus One 이벤트 - 삼성카드</title>

<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one	{position:relative; z-index:1;}
.event_bonus_one	#lay_1{ display:none; position:absolute; z-index:2; left:137px; top:850px; width:470px; height:294px;}
.event_bonus_one	#lay_2	{display:none; position:absolute; z-index:2; left:137px; top:800px; width:470px; height:294px;}
.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:137px; top:800px; width:470px; height:294px;}
input {width: 13px; height: 13px; margin: 0; padding: 0;}

.event_bonus_one	.event_input_1	{
	position:absolute;
	z-index:2;
	left:132px;
	top:1234px;
}
.event_bonus_one	.event_input_2	{
	position:absolute;
	z-index:2;
	left:357px;
	top:1234px;
}
.event_bonus_one	.event_input_3	{
	position:absolute;
	z-index:2;
	left:577px;
	top:1234px;
}
.event_bonus_one	.event_input_4	{
	position:absolute;
	z-index:2;
	left:527px;
	top:1488px;
}
.event_bonus_one	.event_input_5	{
	position:absolute;
	z-index:2;
	left:595px;
	top:1488px;
}
.apply {position: absolute;left:297px;	top:1317px;}
.stamp {position: absolute;left:270px;	top:1317px;}
#stamp1_0,#stamp1_1,#stamp1_2,#stamp1_3,#stamp1_4,#stamp1_5,#stamp2_0,#stamp2_1,#stamp2_2,#stamp2_3,#stamp2_4,#stamp2_5,#stamp3_0,#stamp3_1,#stamp3_2,#stamp3_3,#stamp3_4,#stamp3_5 {position: relative;position: absolute;left:132px;	top:874px;,display:none}
.stamp01 {position: absolute;left: 47px;top: 105px;}
.stamp01 img {padding-right:5px;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>

<script language="javascript" type="text/javascript">
	var sel_item = "";

	function go_check() {
		<% if(event_ok.equals("Y")){ %>
			<% if (item03.equals("1")) { %>
				alert("이미 편의점 스탬프 쿠폰 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
			<% } else if (item03.equals("2")) { %>
				alert("이미 파리바게뜨/파리크라상/뚜레쥬르 스탬프 쿠폰 이벤트에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
			<% } else if (item03.equals("3")) { %>
				alert("이미 커피전문점 스탬프 쿠폰 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
			<%} %>	
		<% } %>
	}
		
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('31660');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				<%if (item03.equals("1")) {%>
				alert("이미 편의점 스탬프 쿠폰 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 파리바게뜨/파리크라상/뚜레쥬르 스탬프 쿠폰 이벤트에 응모하셨습니다.\n 참여해 주셔서 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 커피전문점 스탬프 쿠폰 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
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
		} else {

			if (item03 == "2" || item03 == "3") {
				if (frm.agree_1[0].checked == false) {
					alert("모바일쿠폰 발송을 위한 경품 발송 동의 후 응모 가능합니다.\n\n감사합니다.");
					return;
				}	
			}
			
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
			alert("편의점 스탬프 쿠폰 이벤트에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "2") {
			alert("파리바게뜨/파리크라상/뚜레쥬르 스탬프 쿠폰 이벤트에 응모해 주셔서 감사합니다.");
		} else if (sel_item == "3") {
			alert("커피전문점 스탬프 쿠폰 이벤트에 응모해 주셔서 감사합니다.");
		} else {
			alert("이벤트 응모가 완료되었습니다");
		}
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

	function goStampView() {
		var parameter = "";
		parameter = "item03=<%=item03%>";
		callJson("stamp", "com.scard.hp.im.et.evt.web.NHPIMETEVT003Ctrl", "getBonusone201211Stamp", parameter, "goStampViewCallBack",null,null,true);
	}

	function goStampViewCallBack(callId, data){
		var resultCnt = data.resultCnt; // 매출 COUNT

//		resultCnt = 0;
//		alert(resultCnt);
		
		if (resultCnt > 5) resultCnt = 5;

		if (document.evtFrm.item03.value == "1") {
			document.getElementById("stamp1_"+resultCnt).style.display = "block";
		} else if (document.evtFrm.item03.value == "2") {
			document.getElementById("stamp2_"+resultCnt).style.display = "block";
		} else if (document.evtFrm.item03.value == "3") {
			document.getElementById("stamp3_"+resultCnt).style.display = "block";
		}	
		document.evtFrm.resultCnt.value = resultCnt;

		if (resultCnt == 5) {
			alert("축하합니다! 스탬프를 모두 모으셨습니다!\n\n당첨 혜택은 행사기간 동안 삼성카드로 일시불 및 할부로 70만원 이상  이용하신 회원에 한해 제공됩니다.");
		}	

	}

	function init(){
		var item03 =  document.evtFrm.item03.value;
	
		if (item03 == "1") {
			document.frm1.id_event_input_1[0].checked = true;
		} else if (item03 == "2") {
			document.frm1.id_event_input_1[1].checked = true;
		} else if (item03 == "3") {
			document.frm1.id_event_input_1[2].checked = true;
		}
	
	}
</script>
</head>

<body onload="init();">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value="<%=item03 %>"/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
<input type="hidden" name="eventNo" value="<%=endDateYN%>"/>
<input type="hidden" name="eventNo" value="<%=beginDateYN%>"/>
<input type="hidden" name="resultCnt" value=""/>
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

	function stampclose1(){
		document.getElementById("stamp1_"+document.evtFrm.resultCnt.value).style.display = "none";
	}

	function stampclose2(){
		document.getElementById("stamp2_"+document.evtFrm.resultCnt.value).style.display = "none";
	}

	function stampclose3(){
		document.getElementById("stamp3_"+document.evtFrm.resultCnt.value).style.display = "none";
	}
	
</script>

<div class="" style="position:relative;">
	<p><img src="/images/et/bonusone201211/bonusoneimg.jpg" usemap="#bonus_one" alt="콕 찍어 더 달콤한 행운 보너스- 달콤한 행운 Bonus one 이벤트" border="0"/></p>
		<map name="bonus_one" id="bonus_one">
			<area shape="rect" coords="104,1205,190,1226" alt="편의점 자세히보기" href="javascript:layeropen(1)" /> 
			<area shape="rect" coords="321,1205,407,1226" alt="파리바게트/파리크라상 뚜레쥬르 자세히보기" href="javascript:layeropen(2)" />
			<area shape="rect" coords="540,1206,626,1227" alt="커피전문점 자세히보기" href="javascript:layeropen(3)" />
	 		<area shape="rect" coords="534,1557,657,1578" href="javascript:parent.goTabPage('NHPIMMHUFM001M001', true);" alt="개인정보수정하기" />  
  		</map>
		 <div class="hidden">
			<h1>달콤한 행운 Bonus ONE 이벤트</h1>
			<dl>
				<dt>행사기간</dt>
				<dd>2012년 11월 12일(월) ~ 12월 11일(화)</dd>
				<dt>행사대상</dt>
				<dd>행사기간 동안 삼성카드로 일시불 및 할부 70만원 이상 이용하신 회원</dd>
				<dt>행사내용</dt>
				<dd>아래 혜택 중 하나를 선택하여 이벤트에 응모 후, 조건을 달성하신 회원님께 서비스포인트 및 모바일쿠폰 제공(카드 이용 후 이벤트에 응모하셔도 혜택 제공)</dd>
				<dt>스탬프 참여방법</dt>
				<dd>선택 업종에서 일정 금액 이상 결제하실 때마다 스탬프가 하나씩 자동으로 찍힙니다. 스탬프를 모두 채우시면 맛있는 선물을 드립니다.</dd>
				<dt>경품내용</dt>
				<dd>
					- 편의점 5,000 서비스포인트
					- 파리바게뜨/파리크라상/뚜레쥬르 미니초코케익 모바일쿠폰
					- 커피전문점 카페라떼 모바일쿠폰
				</dd>
			</dl>
		</div>
		<form name="frm1" method="post"  action="">
		<p class="e_input event_input_1">
		  	<label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="편의점 5,000서빗스포인트"  onclick="go_check();" /></label>
		</p>
		<p class="e_input event_input_2">
			<label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="리바게뜨/파리크라상/뚜레쥬르 미니초코케익 모바일 쿠폰," onclick="go_check();" /></label>
		</p>
		<p class="e_input event_input_3">
			<label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="커피전문점 카페라떼 모바일쿠폰" onclick="go_check();" /></label>
		</p>
         <div class="hidden">
			경품 발송 동의 안내입니다.
			당첨되신 모바일쿠폰의 발송은 삼성카드 제휴업체인 쿠프마케팅에 의해 이루어집니다. 모바일쿠폰을 발송하기 위해, 회원님의 휴대폰번호가 제공됩니다.
			당첨 안내 및 모바일 쿠폰이 휴대폰 문자메시지로 발송되므로, 휴대폰 번호가 바뀐 회원님께서는 현재 번호로 수정해주시기 바랍니다.
		</div>

		<p class="e_input event_input_4">
			<label><input type="radio" id="agree" name="agree_1" title="동의함" /></label>
		</p>
		<p class="e_input event_input_5">
			<label><input type="radio" id="disagree" name="agree_1" checked="checked"  title="동의안함" /></label>
		</p>
	</form>        
         <div class="hidden">
            <ul>
                <li>3가지 혜택 중 1가지만 응모하실 수 있으며, 응모 후 변경 및 취소하실 수 없습니다.</li>
                <li>스탬프는 일 1회 결제건에 한해 제공됩니다.</li>
                <li>휴대폰번호 오류로 인한 불이익은 카드사에서 책임지지 않습니다.</li>
                <li>삼성카드 가맹점 업종 분류 기준에 의한 등록 가맹점에 한합니다.(백화점 입점매장, 역사 내 매장, 신규 오픈점 등 일부 가맹점은 제외될 수 있습니다.)</li>
                <li>온라인 결제건, 커피전문점의 선불카드 충전 및 상품권 구입건은 제외됩니다.</li>
                <li>개인신용카드(가족카드 포함)만 해당되며, 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
                <li>카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
            </ul>
        </div>

<!-- 레이어팝업 -->
  <!-- 스템프보기 레이어 스탬프!!!!!!!! 갯수에 따라 이미지 하나씩 나오면 됩니다~~~!!!!!!!!!-->
	<!-- 편의점 스탬프 쿠폰 -->
		<div id="stamp1_0">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_0" />
			<map name="ok_stamp1_0" id="ok_stamp1_0"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
		</div> 
		<div id="stamp1_1">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_1" />
			<map name="ok_stamp1_1" id="ok_stamp1_1"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp1_2">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_2" />
			<map name="ok_stamp1_2" id="ok_stamp1_2"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp1_3">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_3" />
			<map name="ok_stamp1_3" id="ok_stamp1_3"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
			<span class="stamp01">
            	<img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
                <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
                <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" />
             </span> 
		</div> 
		<div id="stamp1_4">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_4" />
			<map name="ok_stamp1_4" id="ok_stamp1_4"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp1_5">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp1.png" alt="편의점 스탬프 쿠폰" border="0" usemap="#ok_stamp1_5" />
			<map name="ok_stamp1_5" id="ok_stamp1_5"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span>
		</div> 


		
		<!-- 베이커리 스탬프 쿠폰 -->
		<div id="stamp2_0">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_0" />
			<map name="ok_stamp2_0" id="ok_stamp2_0"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
		</div> 
		<div id="stamp2_1">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_1" />
			<map name="ok_stamp2_1" id="ok_stamp2_1"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp2_2">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_2" />
			<map name="ok_stamp2_2" id="ok_stamp2_2"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp2_3">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_3" />
			<map name="ok_stamp2_3" id="ok_stamp2_3"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp2_4">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_4" />
			<map name="ok_stamp2_4" id="ok_stamp2_4"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp2_5">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp2.png" alt="베이커리 스탬프 쿠폰" border="0" usemap="#ok_stamp2_5" />
			<map name="ok_stamp2_5" id="ok_stamp2_5"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose2()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span>
		</div> 

		<!-- 커피 스탬프 쿠폰 -->
		<div id="stamp3_0">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_0" />
			<map name="ok_stamp3_0" id="ok_stamp3_0"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
		</div> 
		<div id="stamp3_1">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_1" />
			<map name="ok_stamp3_1" id="ok_stamp3_1"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp3_2">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_2" />
			<map name="ok_stamp3_2" id="ok_stamp3_2"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp3_3">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_3" />
			<map name="ok_stamp3_3" id="ok_stamp3_3"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp3_4">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_4" />
			<map name="ok_stamp3_4" id="ok_stamp3_4"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span> 
		</div> 
		<div id="stamp3_5">
			<img src="/images/et/bonusone201211/layer_bonus_one_stamp3.png" alt="커피 스탬프 쿠폰" border="0" usemap="#ok_stamp3_5" />
			<map name="ok_stamp3_5" id="ok_stamp3_5"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose3()" alt="확인" />
			</map>
			<span class="stamp01"><img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /> 
			                      <img src="/images/et/bonusone201211/stamp.png" alt="스탬프" /></span>
		</div> 

  <!-- //스템프보기 레이어 -->

<% 
if (event_ok.equals("Y")) { %>
		<p class="stamp"><a href="javascript:goStampView();"><img src="/images/et/bonusone201211/btn_stamp.png" alt="스템프 쿠폰 보기" /></a></p> 
<% } else { %>
		<p class="apply"><a href="javascript:go_start();"><img src="/images/et/bonusone201211/btn_application.png" alt="응모하기" /></a></p>
<% } %> 
 
 </div>
 

	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="자세히보기" href="javascript:layerclose(1)" />
	  </map>
		<img src="/images/et/bonusone201211/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="편의점 5,000서비스포인트" /></div>
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="자세히보기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201211/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="파리바게뜨/파리크라상/뚜레쥬르 미니초코케익 모바일 쿠폰" /></div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="자세히보기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201211/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="커피전문점 카페라떼 모바일쿠폰" />
	</div>

<!-- //레이어팝업 -->
</div>

</body>

</html>

