<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>samsungcard family card 출시 5주년 기념 이벤트 - 삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
</style>
<script language="javascript" type="text/javascript">

	function go_login()
	{
		//parent.document.getElementById("wrap").focus();
		parent.eventLogin('11197');

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
	function applyEvent() {
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	function postponePop() {
		setCookie("EVTOPENSHOP","Y",1);
		window.close();
	}

	function setCookie(name, value, expiredays){
	    var todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}	
	</script>

<%
	String loginYN = (String)request.getAttribute("loginYN");
	String eventIngYN = (String)request.getAttribute("eventIngYN");


%>
</head>

<body>

<img src="/images/et/sfccard_event.jpg" width="728" height="1800" border="0" usemap="#sfc_event" alt="Samsungcard Family Card 출시 5주년 555분계 화끈하게 쏩니다!" />
<map name="sfc_event" id="sfc_event">
	<!-- <area shape="rect" coords="470, 618, 567, 633" href="javascript:opener.goTabPage('NHPIMMHUFM001M001', true);" alt="회원정보조회/변경" /> -->

	<%
		if(eventIngYN.equals("before"))
		{
	%>
	
	<area shape="rect" coords="266,907,463,947" href="#" alt="이벤트 응모하기" onclick="alert('이벤트 응모는 2011년 1월 6일부터 가능합니다.');" />	
	<%
		}
		if(eventIngYN.equals("after"))
		{
	%>	
	<area shape="rect" coords="266,907,463,947" href="#" alt="이벤트 응모하기" onclick="alert('이벤트가 종료되었습니다');" />
	<%
		}
		if(loginYN.equals("N"))
		{
	%>
	<area shape="rect" coords="266,907,463,947" href="#" alt="이벤트 응모하기" onclick="go_login();" />
	<%
		}
		if( loginYN.equals("Y"))
		{
	%>
	<area shape="rect" coords="266,907,463,947" href="#" alt="이벤트 응모하기" onclick="applyEvent();" />
		<%
			}
	%>	
<!-- <area shape="rect" coords="144, 1043, 294, 1069" href="javascript:parent.tabSubmit('/hp/im/cd/app101.do?method=moveSpouseCardApplyInsertForm', document.form);" alt="SFC 배우자 카드 신청하기" />
<area shape="rect" coords="298, 1043, 414, 1069" href="javascript:parent.tabSubmit('/cps.do?method=getCardList&amp;scardSystemId=tab', document.form1);" alt="SFC 카드 신청하기" />
<area shape="rect" coords="144, 1216, 298, 1242" href="/html/popup/sfccard/index.html" target="_blank" alt="SFC 카드 혜택 자세히 보기" />
<area shape="rect" coords="303, 1216, 454, 1242" href="javascript:parent.goTabPage('NHPIMMHPMS001M002');" alt="프리미엄 회원 서비스 보기 " />-->
<area shape="rect" coords="270,1385,461,1416" href="https://www.samsungcard.co.kr/html/popup/sfccard/index.html" target="_blank" alt="SFC카드 혜택 자세히 보기" title="새창" />
<area shape="rect" coords="292,1602,482,1628" href="https://travel.samsungcard.com" target="_blank" alt="SFC여행 바로가기" title="새창" />	
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applySfc5Event" method="post">
</form>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>
<!-- <form name="form1">
				
				<input type="hidden" name="etc_code"       value='Y_SFCCARD' /> 
				<input type="hidden" name="etc_name"       value='삼성패밀리카드' /> 
				
				<input type="hidden" name="type1"          value='4'/>
				<input type="hidden" name="type2"          value='10'/>

</form> -->
</body>

</html>

