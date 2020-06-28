<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성물산가족의 Happy Donation! 2번째 이벤트 - 삼성카드</title>
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
			parent.eventLogin('12253');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 후원에 동참하셨습니다");	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("후원에 동참 해 주셔서 감사합니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/donation201203/event_donation.jpg" alt="삼성물산가족의 Happy Donation! Vol.2" border="0" usemap="#donation" />

<div class="hidden">
	<h1>삼성물산 가족의 happy donation vol.02</h1>
	<p>상성물산 74주년 창립기념일을맞이하여, 삼성카드가 함께하는 이벤트를 준비하였습니다. 2011년 뇌종양을 앓던 찬식이에 이어, 올해에는 대규를 위한 happy donation! 3월 한달동안 후원에 동참하시는 삼성물산 임직원께서 사용하시는 삼성카드 이용금액의 0.1%를 모아 버킷림프종으로 항암치료 중인 대규를 후원합니다. 후원비용은 삼성카드에서 전액 부담합니다.</p>
    <p><a href="#none" onclick="go_start();return false;">후원하러가기</a></p>
	
	<p>삼성물산 happy donation  후원 아동</p>
	<p>엄마를 너무나 사랑하는 엄마바보 대규(11세 , 남) 이야기</p>
	<p><strong>태어날때부터 병원이 놀이터인 아이 </strong>
		대규(11세, 남)는 태어나서 호흡곤란으로 중환자실에서 치료를 받았고, 이후 구순구개열 수술을 2회나 받았습니다. 대규는 성장하면서 지적장애 진단까지 받아 부모님의 보살핌을 많이 필요로 합니다. 그러나 큰 수술과 장애 진단까지 받은 대규에게 또 다른 시련이 왔습니다. 바로 몇개월 전에 버킷림프종 진단을 받아 항암치료를 시작하게 되었습니다.
		<strong>가족의 사랑을 듬뿍 받는 막둥이</strong>
		대규는 또래 아이들보다 지적 능력이 낮지만 힘든 항암치료를 하면서도 밝은 성격을 잃지 않는 스마일 보이입니다. 특히 옆에 엄마가 계시면 대규 웃음은 끊이지 않습니다. 비록 지금은 병원생활로 자주 만나지 못하지만 대규가 퇴원하는 날만 손꼽아 기다릴 정도로 막둥이를 보고싶어 하는 누나들 만나면 아웅다웅 다툴때도 있지만 누구보다 소중한 막둥이 대규입니다.
		
		<strong>엄마의 밥이 너무나 그리운 대규</strong>
		대규는 항암치료 후유증으로 중환자실에서 45일간 지내야 했습니다. 음식을 전혀 먹을 수 없는 금식기간을 보내면서 엄마가 해주는 맛있는 밥이 제일 먹고 싶다는 대규는 오늘도 엄마에게 먹고싶은 음식을 이것 저것 이야기합니다. 어서 퇴원해서 맛있는 밥을 해주고 싶은 엄마는 대규의 배고픈 응석도 다 받아줍니다. 
		<strong>대규는 엄마바보 입니다.</strong>
		아픈건 너무 싫지만 병원에 있는동안엔 엄마의 사랑을 독차지 할 수 있어서 너무나 좋은 대규는 오늘도 엄마가 자신의 곁에 있는 것만으로도 행복해 합니다. 항상 엄마만 있으면 기분이 좋아지는 대규의 순수한 마음, 밝은 마음이 변치않고 힘든 치료를 잘 견딜 수 있도록 화이팅을 외쳐주세요
	
	</p>
	
	<p>삼성물산 가족 여러분 대규와 가족들이 힘든 시간을 잘 보낼 수 있도록 힘을 모아주세요!</p>
	<p><a href="#none"  onclick="go_start();">후원하러 가기</a></p>

	<ul>
		<li>- 기부금액은 후원에 참여하신 삼성물산 임직원이 2012년 3월 한 달간 사용하신 삼성카드 일시불+할부 이용금액의 0.1% 입니다.</li>
		<li>- 삼성물산 가족이 모아주신 기부금은 4월에 소아암협회를 통해 대규에게 전달될 예정입니다.</li>
	</ul>
	

</div>


<map name="donation" id="donation">
<area shape="rect" coords="570,338,687,369" href="#" onclick="go_start();" alt="후원하러가기" />
<area shape="rect" coords="287,1504,442,1541" href="#" onclick="go_start();" alt="후원하러가기" />
</map>


</body>

</html>

