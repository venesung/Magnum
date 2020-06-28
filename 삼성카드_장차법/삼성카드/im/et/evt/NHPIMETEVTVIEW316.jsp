<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>스카이72 드림골프레인지 이벤트 - 삼성카드</title>
<script language="javascript" type="text/javascript">

	function go_login()
	{
		//parent.document.getElementById("wrap").focus();
        parent.scardLogin('/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=9668','eventLogin');

    }

	function goDetail(cmsSeq,newSeq){
		try {
                 parent.tabSubmit("/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq="+cmsSeq+"&amp;newSeq="+newSeq,"");
	 			parent.submit_eventLog(); 
	 		} catch (e) {
                 parent.parent.tabSubmit("/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq="+cmsSeq+"&amp;newSeq="+newSeq,"true");
	 		} 

	}

	function goSaigon()
	{
		
		window.open("http://www.miss-saigon.co.kr/", "saigon");

		try{
			parent.submit_eventLog(); 
		}catch (e) {
		}
	}
	function applyEvent(evtgubun) {
		document.evtFrm.eventgubun.value = evtgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	</script>

<%
	String loginYN = (String)request.getAttribute("loginYN");
	String eventIngYNa = (String)request.getAttribute("eventIngYNa");
	String eventIngYNb = (String)request.getAttribute("eventIngYNb");
	//String premiumYn = (String)request.getAttribute("premiumYn");
	String strGubun = (String)request.getAttribute("strGubun");

%>
</head>

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyShotgame" method="post">
<input type="hidden" name="eventgubun" id="eventgubun" value=""/>
</form>

<div style="position:relative; width:728px; height:936px">
	<p id="lay_shortmsshool01" style="display:none; position:absolute; left:50px; top:180px"><img src="/images/et/shotgame/event_shortmschool01.png" alt="제이슨강 : 미국 PGA Class A 멤버 1999, PGA golf professional 1988-현재, 타이거우즈 재단 지도자, SBS골프채널 골프아카데미 진행, SBS골프채널 사이버 레슨 진행 / 에디조 : 미국 PGA Class A 멤버 1999~현재, NCAA(전미 대학연맹) 토너먼트 단체전 우승, SBS 골프채널 JUST 진행, 현 SBS 골프채널 골프아카데미 진행" border= "0" usemap="#map_pop01" /></p>
	<p id="lay_shortmsshool02" style="display:none; position:absolute; left:50px; top:180px"><img src="/images/et/shotgame/event_shortmschool02.png" alt="행사일정" border= "0" usemap="#map_pop02" /></p>
	<map name="map_pop01" id="map_pop01"><area shape="rect" alt="레이어닫기" coords="601,10,630,39" href="#1" onclick="document.getElementById('lay_shortmsshool01').style.display='none';" /></map>
	<map name="map_pop02" id="map_pop02"><area shape="rect" alt="레이어닫기" coords="601,10,630,39" href="#2" onclick="document.getElementById('lay_shortmsshool02').style.display='none';" /></map>

<div style="position:relative">
		<div style="position:absolute; top:588px; left:210px; font:normal 12px '돋움'; line-height:16px; color:#8f4e15"><a href="#" target="_blank" style="text-decoration:none" title="새창"><font style="color:#8f4e15">스카이72 드림골프레인지 <br />숏게임컴플렉스</font></a> &amp; <a href="#" target="_blank" style="text-decoration:none" title="새창"><font style="color:#8f4e15">스카이듄스코스</font></a></div>
		<div style="position:absolute; top:588px; left:450px; font:normal 12px '돋움'; line-height:16px; color:#8f4e15"><a href="#" target="_blank" style="text-decoration:none" title="새창"><font style="color:#8f4e15">스카이72 드림골프레인지 <br />숏게임컴플렉스</font></a> &amp; <a href="#" target="_blank" style="text-decoration:none" title="새창"><font style="color:#8f4e15">스카이듄스코스</font></a></div>

	<img src="/images/et/shotgame/event_shortmschool.jpg" alt="프리미엄회원 초청 삼성카드 숏게임 마스터스쿨" border="0" usemap="#sm_event100823" />
	<map name="sm_event100823" id="sm_event100823">
	<area shape="rect" alt="PROFILE" coords="252,556,307,572" href="#1" onclick="document.getElementById('lay_shortmsshool01').style.display='block';" title="에디조PROFILE" />
	<area shape="rect" alt="PROFILE" coords="506,556,562,572" href="#1" onclick="document.getElementById('lay_shortmsshool01').style.display='block';" title="제이슨강 PROFILE" />
	<area shape="rect" alt="행사일정보기" coords="461,666,626,715" href="#2" onclick="document.getElementById('lay_shortmsshool02').style.display='block';" /><!--
	<area shape="rect" alt="스카이72 드림골프레인지" coords="205,586,350,604" href="http://www.sky72.com/kr/dream/dream_index.jsp" target="_blank" title="새창" />
	<area shape="rect" alt="스카이72 드림골프레인지" coords="448,586,591,604" href="http://www.sky72.com/kr/dream/dream_index.jsp" target="_blank" title="새창"/>
	<area shape="rect" alt="숏게임컴플렉스 스카이듄코스" coords="205,605,394,622" href="http://www.sky72.com/kr/dunes/index.jsp" target="_blank" title="새창"/>
	<area shape="rect" alt="숏게임컴플렉스 스카이듄코스" coords="448,605,638,622" href="http://www.sky72.com/kr/dunes/index.jsp" target="_blank" title="새창"/>	
	
	--><%
		if(eventIngYNa.equals("before"))
		{
	%>	
	<area shape="rect" alt="1차행사응모하기" coords="102,666,277,715" href="#" onclick="alert('이벤트 응모는 2010년 08월 27일부터 가능합니다.');"/>	
	<%
		}
		if(eventIngYNa.equals("after"))
		{
	%>	
	<area shape="rect" alt="1차행사응모하기" coords="102,666,277,715" href="#" onclick="alert('이벤트가 종료되었습니다');"/>
	<%
		}
		if(loginYN.equals("N"))
		{
	%>
	<area shape="rect" alt="1차행사응모하기" coords="102,666,277,715" href="#" onclick="go_login();" />
	<%
		}
		if( loginYN.equals("Y"))
		{
			if( strGubun.equals("I") || strGubun.equals("V") || strGubun.equals("W") || strGubun.equals("S")|| strGubun.equals("P"))
			{
	%>
	<area shape="rect" alt="1차행사응모하기" coords="102,666,277,715" href="javascript:applyEvent('a')" />
			<%
			}
			else
			{
		%>
	<area shape="rect" alt="1차행사응모하기" coords="102,666,277,715" href="#" onclick="alert('프리미엄 회원을 위한 전용 이벤트입니다.\n\n회원님께서도 삼성카드 프리미엄 회원으로 선정되시어 풍성한 혜택과 서비스를 누리시기 바랍니다');"/>
		<%
			}
		}
	%>	
		

	<%
		if(eventIngYNb.equals("before"))
		{
	%>	
	<area shape="rect" alt="2차행사응모하기" coords="281,666,456,715" href="#" onclick="alert('이벤트 응모는 2010년 09월 06일부터 가능합니다.');"/>	
	<%
		}
		if(eventIngYNb.equals("after"))
		{
	%>	
	<area shape="rect" alt="2차행사응모하기" coords="281,666,456,715" href="#" onclick="alert('이벤트가 종료되었습니다');"/>
	<%
		}
		if(loginYN.equals("N"))
		{
	%>
	<area shape="rect" alt="2차행사응모하기" coords="281,666,456,715" href="#" onclick="go_login();" />
	<%
		}
		if( loginYN.equals("Y"))
		{
			if( strGubun.equals("I") || strGubun.equals("V") || strGubun.equals("W") || strGubun.equals("S")|| strGubun.equals("P"))
			{
	%>
	<area shape="rect" alt="2차행사응모하기" coords="281,666,456,715" href="javascript:applyEvent('b')" />
			<%
			}
			else
			{
		%>
	<area shape="rect" alt="2차행사응모하기" coords="281,666,456,715" href="#" onclick="alert('프리미엄 회원을 위한 전용 이벤트입니다.\n\n회원님께서도 삼성카드 프리미엄 회원으로 선정되시어 풍성한 혜택과 서비스를 누리시기 바랍니다');"/>
		<%
			}
		}
	%>		
	</map>
</div>


</div>

</body>

</html>

