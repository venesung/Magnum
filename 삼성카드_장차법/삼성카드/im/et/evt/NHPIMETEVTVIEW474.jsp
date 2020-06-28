<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>쉼과 감동이 있는 삼성 가족만의 즐거운 시간 삼성카드 오토캠핑 樂 두 번째 이야기 - 삼성카드</title>
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
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('25154');
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
		Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=730,height=600,left=100,top=50";
		newsWindow = window.open("/hp/im/et/evt.do?method=getAutoCampingPop2012s", "autoCampings" , Future); 
		newsWindow.focus();
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

<img src="/images/et/auto2012/120315_autocamp_sfc.jpg" alt="쉼과 감동이 있는 삼성 가족만의 즐거운 시간 삼성카드 오토캠핑 樂 두 번째 이야기" border="0" usemap="#autocamp" />
<map name="autocamp" id="autocamp">
    <area shape="rect" coords="579,246,689,275" href="#" onclick="go_start();" alt="응모하기" />
    <area shape="rect" coords="273,1197,453,1235" href="#" onclick="go_start();" alt="이벤트 응모하기" />
</map>
<div class="hidden">
	<h1>쉼과 감동이 있는 삼서 가족만의 즐거운 시간 삼성카드 오토캠핑 락 두번째 이야기</h1>
	<p>푸른하늘 푸른 숲이 맞닿은 자연 속에서 사랑하는 가족과 함께 하는 휴식과 감동의 시간! 삼성카드 오토캠핑 락 두번째 이야기 이벤트에 참여하세요. 잊을 수 없는 가족의 추억을 만들어 드립니다.</p>
    <p><a href="#none" onclick="go_start();" >응모하기</a></p>
	
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 5월 12일(토) ~ 13일(일) 까지</dd>
		<dt>행사장소</dt>
		<dd>푸름유원지 오토캠핑장(경기도 가평)</dd>
		<dt>행사내용</dt>
		<dd>이벤트에 응모하시면 삼성카드 회원 100가족을 추첨해 오토캠핑 참여 혜택 제공
			<ol>
				<li>장비 보유 가족에게는 캠핑사이트 1구역이 제공이며, 제공된 사이트 내에서 본인의 장비를 설치하여 이용하실 수 있습니다.</li>
				<li>캠핑장비가 없으신 일부 회원님께는 (응모시 선택) 텐트, 타프 등 캠핑장비를 제공해 드립니다.</li>
			</ol>
		</dd>
		<dt>응모기간</dt>
		<dd>2012년 3월 28일(수) ~ 4월 22일(일)까지</dd>
		<dt>당첨자발표</dt>
		<dd>2012년 4월 25일(수) 삼성카드 홈페이지 및 개별 안내</dd>
		<dt>준비물</dt>
		<dd>침구류, 세면도구, 음식 및 기타 캠핑용품</dd>
		<dt>문의</dt>
		<dd>삼성카드 오토캠핑 사무국 02-475-6079</dd>
		<dt>tip</dt>
		<dd>응모기간 중 삼성 개인신용카드로 일시불+할부를 100만원 이상 이용하시면, 당첨 기회를 10배 더 부여드립니다.</dd>
	</dl>
    <p><a href="#none" onclick="go_start();">이벤트 응모하기</a></p>
	
	<ul>
		<li>- 오토캠핑 현장에서 생긴 에피소드 및 자료는 삼성카드 마케팅에 활용될 수 있습니다.</li>
		<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다. </li>
	</ul>
	
</div>
	
</body>

</html>