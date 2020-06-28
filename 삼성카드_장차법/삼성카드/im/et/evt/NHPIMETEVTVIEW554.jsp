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
	String cmsSeq = (String)request.getAttribute("eventEtc1");	// ITCMEVENTTT.CMS_SEQ


//	loginYN = "Y";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>12시에 만나요, 5,000 포인트의 행복! 삼성카드의 겨울, 눈(Noob) 이벤트 - 삼성카드</title>

<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

.event_noon_one {position:relative;}

.apply {position: absolute; left:296px; top:899px;}
.stamp {position: absolute;left:230px; top:899px;}

#stamp1_0,#stamp1_1,#stamp1_2,#stamp1_3,#stamp1_4,#stamp1_5 {position: relative;position: absolute;left:132px;	top:555px; display:none;}
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
				alert("삼성카드의 겨울,눈(Noon) 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
			<%} %>	
		<% } %>
	}
		
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin(<%=cmsSeq%>);
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				<%if (item03.equals("1")) {%>
				alert("삼성카드의 겨울,눈(Noon) 이벤트에 응모하셨습니다. \n 참여해 주셔서 감사합니다.");
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
		var item03 = "1"; 
		
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

	function applyOk(){
		if (sel_item == "1") {
			alert("이벤트에 응모해 주셔서 감사합니다.");
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
		callJson("stamp", "com.scard.hp.im.et.evt.web.NHPIMETEVT003Ctrl", "getNoon201212Stamp", parameter, "goStampViewCallBack",null,null,true);
	}

	function goStampViewCallBack(callId, data){
		var resultCnt = data.resultCnt; // 매출 COUNT

//		resultCnt = 0;
//		alert(resultCnt);
		
		if (resultCnt > 5) resultCnt = 5;

		if (document.evtFrm.item03.value == "1") {
			document.getElementById("stamp1_"+resultCnt).style.display = "block";
		}	
		document.evtFrm.resultCnt.value = resultCnt;

		if (resultCnt == 5) {
			alert("축하합니다! 스탬프를 모두 모으셨습니다!");
		}	

	}

</script>
</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value="<%=item03 %>"/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
<input type="hidden" name="eventNo" value="<%=endDateYN%>"/>
<input type="hidden" name="eventNo" value="<%=beginDateYN%>"/>
<input type="hidden" name="resultCnt" value=""/>
</form>

<script type="text/javascript">

	function stampclose1(){
		document.getElementById("stamp1_"+document.evtFrm.resultCnt.value).style.display = "none";
	}
	
</script>

<div class="event_noon_one">
<img src="/images/et/Noon201212/event_121115.jpg"  alt="12시에 만나요, 5,000 포인트의 행복! 삼성카드의 겨울, 눈(Noob) 이벤트" border="0"/>
 <div class="hidden">
	<h1>삼성카드의 겨울, 눈(NOON) 이벤트</h1>
	<p>점심시간에는 삼성카드와 함께하세요. 포인트가 눈처럼 쌓입니다.</p>
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 12월 3일(월) ~ 12월 31일(월)</dd>
		<dt>행사대상</dt>
		<dd>행사기간 동안 이벤트에 응모하시고 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원님(카드 이용 후 이벤트에 응모하셔도 혜택 제공)</dd>
		<dt>행사내용</dt>
		<dd>행사기간 동안 매일 정오 ~ 오후 2시 외식 업종에서 2만원 이상 결제하실 때마다 자동으로 하나씩 찍히는 스탬프를 5개 모두 모으시면 5,000 서비스포인트 제공</dd>
		<dt>포인트 적립일</dt>
		<dd>2013년 1월 18일(금)</dd>
	</dl>
	<ul>
		<li>스탬프는 1일 최대 1회까지 자동으로 적용됩니다.</li>
		<li>삼성카드 가맹점 업종 기준에 의한 등록 가맹점에 한합니다.</li>
		<li>법인/체크/올앳/기프트카드는 제외됩니다.</li>
		<li>카드사 및 제휴사의 사정으로 변경 &middot; 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
	</ul>
</div>
<!-- //스템프보기 레이어 -->

<% 
if (event_ok.equals("Y")) { %>
		<p class="stamp"><a href="javascript:goStampView();"><img src="/images/et/Noon201212/btn_stamp.jpg" alt="스템프 쿠폰 보기" /></a></p> 
<% } else { %>
		<p class="apply"><a href="javascript:go_start();"><img src="/images/et/Noon201212/btn_application.jpg" alt="응모하기" /></a></p>
<% } %> 

<!-- 스템프보기 레이어 스탬프!!!!!!!! 갯수에 따라 이미지 하나씩 나오면 됩니다~~~!!!!!!!!!-->
<!-- 삼성카드 눈(Noon) 스탬프 쿠폰 -->
	<div id="stamp1_0">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_0" />
		<map name="ok_stamp1_0" id="ok_stamp1_0"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
	</div> 

	<div id="stamp1_1">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_1" />
		<map name="ok_stamp1_1" id="ok_stamp1_1"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
		<span class="stamp01"><img src="/images/et/Noon201212/stamp.png" alt="스탬프" /></span>
	</div> 

	<div id="stamp1_2">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_2" />
		<map name="ok_stamp1_2" id="ok_stamp1_2"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
		<span class="stamp01"><img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" /></span>
	</div> 

	<div id="stamp1_3">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_3" />
		<map name="ok_stamp1_3" id="ok_stamp1_3"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
		<span class="stamp01"><img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" /></span>
	</div> 

	<div id="stamp1_4">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_4" />
		<map name="ok_stamp1_4" id="ok_stamp1_4"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
		<span class="stamp01"><img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" /></span>
	</div> 

	<div id="stamp1_5">
		<img src="/images/et/Noon201212/layer_noon.jpg" alt="삼성카드 눈(Noon) 스탬프 쿠폰!" border="0" usemap="#ok_stamp1_5" />
		<map name="ok_stamp1_5" id="ok_stamp1_5"><area shape="rect" coords="154,191,255,223" href="javascript:stampclose1()" alt="확인" />
		</map>
		<span class="stamp01"><img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" />
		                      <img src="/images/et/Noon201212/stamp.png" alt="스탬프" /></span>
	</div> 

 </div>

</body>

</html>

