<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>제일기획가족의 Happy Donation! Vol.2 - 삼성카드</title>
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
			parent.eventLogin('12631');
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

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/donation201205s/event_cheil.jpg" alt="제일기획가족의 Happy Donation! Vol.2" border="0" usemap="#donation" />
<map name="donation" id="donation">
<area shape="rect" coords="571,308,689,338" href="#" onclick="go_start();" alt="후원하기" />
<area shape="rect" coords="295,1492,450,1529" href="#" onclick="go_start();" alt="후원하기" />
</map>
<div class="hidden">
	<p>삼성카드가 제일기획의 창립기념일을 진심으로 축하드립니다.</p>
	<h1>제일기획 가족의 Happy Donation Vol.2</h1>
	<p>제일기획의 39주년 창립기념일을 맞이하여 삼성카드가 함께하는 이벤트를 준비하였습니다. 힘겨운 희망의 산을 넘는 현우네 가족을 위한 Happy Donation! 제일기획 창립기념일부터 한 달(5/15~ 6/14) 동안 후원에 동참하시는 제일기획 임직원께서
		사용하시는 삼성카드 이용금액의 0.1%를 모아 측쇄 아미노산 대사장애를 앓고 있는 현우를 후원합니다.
		후원비용은 삼성카드에서 전액부담합니다.
        <a href="#none" onclick="go_start();return false;">후원하기</a>
	</p>
	<p>제일기획 happy donation 후원아동</p>
	<h2>힘겨운 희망의 산을 넘어 현우네 가족이야기</h2>
	
	<p>
        <strong>생후 7일째 부터 중환자실에서</strong>
        현우는 태어날 때부터 병명도 어려운 '측쇄 아미노산 대사장애'를 앓고있습니다. 단백질 흡수가 전혀 되지 않는 질환으로 성장하면서 여러 가지 후유증이 발생하는병 입니다. 생후 7일째부터 중환자실에 입원해 집중 치료를 받았으며, 분유도
        다른아이들과는 다르게 단백질을 제거하는 비싼 특수 분유만을 먹어야 했습니다. 하지만 부족한 단백질 공급으로 현우는 또래 아이들에 비해 성장 속도가 현저히 느리고, 안타깝게도 뇌 발달에도 장애가 나타나기 시작했습니다.
        <strong>매일매일 긴장 속에서</strong>
        세상에는 맛있는 것도 많은데 현우가 먹을수 있는 것은 오로지 야채 뿐입니다. 맛있는 음식을 냄새만 맡아야 하는 현우를 어머니는 그저 안타까운 마음으로 바라볼 수 밖에 없습니다. 현우가 음식의 유혹을 이기지 못하고 먹는 날에는 
        바로 응급상황이 벌어지기도 합니다. 이렇게 매일매일 긴장 속에서 현우는 지난 8년간을 살았습니다. 지능 발달이 늦은 현우는 특수학교에 입학해 교육을 받고 있습니다. 하지만 학교 생활 속에서도 종종 현우에게 응급 상황이 발생해 주위 사람들은 
        언제나 긴장을 풀 수가 없다고 합니다. 
        <strong>힘겨운 희망의 산을 넘는다</strong>
        현우와 누나를 홀로 키우고 있는 어머니에게 아이들은 큰 희망입니다. 현우의 병원생활로 누나는 친척집을 돌아다니며 생활하고 있지만 언제나 엄마에게 힘이 되어주는 딸입니다. 하나의 산을 넘으면 또 다른 큰 산이 버티고 있다고 말하는 
        현우 어머니 하지만 큰산을 넘으면 꼭 희망이 잡힐 것만 같다고 합니다. 하루 빨리 현우에게 맞는 약이 개발되어 마음껏 먹고 싶은거 먹을수 있는날을 항상 기도하는 현우 어머니는 오늘도 힘겨운 희망의 산을 넘습니다. 
        
    </p>
    
    <p>제일기획 가족 여러분 현우 가족이 힘겨운 희망의 산을 넘어 멋진 삶을 살아갈 수 있도록 여러 분들의 사랑을 나누어 주세요! </p>
    <p><a href="#none" onclick="go_start();return false;">후원하기</a></p>
    
    <ul>
        <li>- 기부금액은 후원에 참여하신 제일기획 임직원이 2012년 5월 한달간 사용하신 삼성카드 일시불+할부 이용금액의 0.1%입니다.</li>
        <li>- 제일기획 임직원이 모아주신 기부금은 6월에 소아암협회를 통해 현우에게 전달될 예정입니다.</li>
    </ul>
</div>

</body>

</html>

