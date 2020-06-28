<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>프리미엄 쇼핑몰 새단장 오픈 이벤트 - 삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
.premium_close {width:590px; height:27px; background:url('/images/et/shopopen/event_premium_close.jpg') repeat-x; text-align:right; padding-top:3px; padding-right:20px}
.nottoday {color:#999; font:normal 11px "돋움"; letter-spacing:-1px;}
input.chk, input.rdo	{width:13px; height:13px; margin:2px; vertical-align:middle}
</style>
<script language="javascript" type="text/javascript">

	function go_login()
	{
		//parent.document.getElementById("wrap").focus();
		parent.scardLogin('/link/index.jsp?url=PREMIUM_EVENT?eventNo=139','eventLogin');

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
	String strGubun = (String)request.getAttribute("strGubun");

%>
</head>

<body>

<p><img src="/images/et/shopopen/event_premium_shoppingmall.jpg" alt="프리미엄 쇼핑몰 새단장 OPEN EVENT" usemap="#shoppingmall" /></p>
<div class="premium_close">
	<label for="label_chk" class="nottoday">하루동안 이 창을 열지않음 <input type="checkbox" class="chk" id="label_chk" title="하루동안 이 창을 열지않음" onclick="postponePop();"/></label>
</div>
<map name="shoppingmall" id="shoppingmall">
	<area shape="rect" coords="470, 618, 567, 633" href="javascript:opener.goTabPage('NHPIMMHUFM001M001', true);" alt="회원정보조회/변경" />

	<%
		if(eventIngYN.equals("before"))
		{
	%>	
	<area shape="rect" coords="209, 664, 405, 710" href="#" alt="응모하기" onclick="alert('이벤트 응모는 2010년 11월 26일부터 가능합니다.');"/>	
	<%
		}
		if(eventIngYN.equals("after"))
		{
	%>	
	<area shape="rect" coords="209, 664, 405, 710" href="#" alt="응모하기" onclick="alert('이벤트가 종료되었습니다');"/>
	<%
		}
		if(loginYN.equals("N"))
		{
	%>
	<area shape="rect" coords="209, 664, 405, 710" href="#" alt="응모하기" onclick="go_login();" />
	<%
		}
		if( loginYN.equals("Y"))
		{
			if( strGubun.equals("I") || strGubun.equals("V") || strGubun.equals("W") || strGubun.equals("S")|| strGubun.equals("P"))
			{
	%>
	<area shape="rect" coords="209, 664, 405, 710" href="#" alt="응모하기" onclick="applyEvent();" />
			<%
			}
			else
			{
		%>
	<area shape="rect" coords="209, 664, 405, 710" href="#" alt="응모하기" onclick="alert('프리미엄 회원을 위한 전용 이벤트입니다.\n\n회원님께서도 삼성카드 프리미엄 회원으로 선정되시어 풍성한 혜택과 서비스를 누리시기 바랍니다');"/>
		<%
			}
		}
	%>	
	
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyShopOpenEvent" method="post">
</form>
</body>

</html>

