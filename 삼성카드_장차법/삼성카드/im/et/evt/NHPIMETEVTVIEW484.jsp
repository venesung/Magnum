<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성sds가족의 Happy Donation! - 삼성카드</title>
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
			parent.eventLogin('12305');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 후원에 동참하셨습니다.");	
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

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/donation201204/event_sds.jpg" alt="삼성sds가족의 Happy Donation! Vol.2" border="0" usemap="#donation" />

<div class="hidden">
	<p>삼성카드가 삼성SDSdml 창립기념일을 진심으로 축하드립니다.</p>
	<h1>삼성SDS 가족의 Happy Donation! Vol.2</h1>
	
	<p>삼성SDS 27주년 창립기념일을 맞이하여, 삼성카드가 함께하는 이벤트를 준비하였습니다. 가족의 눈물을 희망으로 바꾸는 작은거인 서연이를 위한 Happy Donation! 4월 한 달 동안 후원에 동참하시는 삼성엔지니어링 임직원께서 사용하시는 삼성카드 이용금액의 0.1%를 모아 급성림프구성백혈병으로 항암치료 중인 서연이를 후원합니다. 후원 비용은 삼성카드에서 전액부담합니다. </p>
    <p><a href="#none" onclick="go_start();return false;" >후원하기</a></p>
	
	
	<p>삼성SDS happy donation 후원아동</p>
	<p>가족의 눈물을 희망으로 바꾸는 작은거인 서연이(여, 2세) 이야기</p>
	
	<p>
		<strong>작은 몸으로 감당하기 힘든 아픔</strong>
		건강하게 태어나 잘 자라던 서연이가 100일을 며칠 앞드고 갑자기 발등에 붉은 반점이 보였습니다. 별일 아니라 생각하며 찾았던 병원인데... 그길로 제주에서 서울의 큰 병원 응급실로 옮겨졌고 중환자실에 입원하게 되었습니다. 
		그로부터 어린 서연이가 감당하기 힘든 어려운 치료가 시작되었습니다. 서연이의 병명은 고위험군의 금성림프구성백혈병... 드라마에서만 보았던 백혈병이 어린 서연이에게 올지는 꿈에도 생각못했습니다. 어린 서연이는 폐에 출혈이 있어 호흡기에 의지하여 두달을 중환자실에서 거의 잠든 상태로 지내야했습니다. 그리고 어른들도 힘들다는 항암치료를 그 작은 몸으로 간신히 견디어내고 있었습니다.
		
		<strong>작은 몸에서 나오는 큰 희망</strong> 
		아파도 폐때문에 크게 울지도 못하는 서연이의 모습을 볼때마다 갖고들은 안타까워 눈물만 흘립니다. 하지만 힘들고 지친 상황에서도 서연이는 엄마 얼굴만 보면 환한 웃음으로 이겨낼 수 있다는 희망을 선물하는 작은 거인입니다. 
		아파하는 서연이에게 작은 희망의 불꽃이 생겼습니다. 바로 조혈모세포 이실 골수공여자를 만났기 때문입니다. 하늘의 별따기보다 어렵다는 골수공여자 찾기에 서연이는 하늘의 별을 딴것입니다. 
		하늘의 별이 희망이 된것처럼 서연이도 작은 몸에서 큰병을 이겨낼 희망이 생긴것입니다.
		
		위험한 순간도 많았지만 그때마다 든단한 아빠와 엄마.. 그리고 서연이를 너무나 사랑하는 할머니가 곁에 있어 작은 거인 서연이는 희망의 끈을 놓지 않았습니다. 비록 이식수술을 위해 많은 돈이 필요하지만 이번에도 서연이에게 또 하나의 희망을 기대하며 오늘도 힘차게 치료를 받아갑니다. 작은 거인 서연이에게 힘든 치료를 잘 받을 수 있도록 작은 희망의 꽃씨를 여러분들게서 심어주세요.
		
		삼성SDS 가족 여러분
		서연이와 갖고들이 힘든시간을 희망으로 이겨낼 수 있도록 힘을 모아주세요
	
	</p>

</div>

<map name="donation" id="donation">
<area shape="rect" coords="571,308,688,339" href="#" onclick="go_start();" alt="후원하기" />
<area shape="rect" coords="295,1512,450,1549" href="#" onclick="go_start();" alt="후원하기" />
</map>

</body>

</html>

