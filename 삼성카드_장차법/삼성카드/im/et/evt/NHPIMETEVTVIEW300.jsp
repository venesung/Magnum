<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>전쟁도 빗겨 간 가슴 아픈 사랑! 뮤지컬 미스사이공 삼성카드에서만 최대 40% 특별 할인 - 삼성카드</title>
<script language="javascript" type="text/javascript">

	function go_login()
	{
		//parent.document.getElementById("wrap").focus();
        parent.scardLogin('/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=9668','eventLogin');

    }

	function PopReserveConfirm(sitecode, bizcode){
        var strURL = "http://ticket.interpark.com/othersite/Site_CancelLogin.asp?Ca=CancelConfirm&amp;SiteCode=" + sitecode + "&amp;BizCode=" + bizcode;
		var WinChild = window.open(strURL, "", "width=720, height=480, scrollbars=yes" );
		WinChild.opener = self;
		try{
			parent.submit_eventLog(); 
		}catch (e) {
		}
		
			
		
	}

	function interparkBooking(BizCode,SiteCode,GoodsCode)
	{
        var strURL = "http://ticket.interpark.com/othersite.2.1/bookingSession.asp?GroupCode="+ GoodsCode +"&amp;SessionBizCode=" + BizCode + "&amp;SiteCode="+ SiteCode;
		var WinChild = window.open(strURL, "", "width=900, height=680");
		WinChild.opener = self;
		try{
			parent.submit_eventLog(); 
		}catch (e) {
		}
		
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
	</script>

<%
	String loginYN = (String)request.getAttribute("loginYN");
	String eventIngYN = (String)request.getAttribute("eventIngYN");
	//String premiumYn = (String)request.getAttribute("premiumYn");
	String strGubun = (String)request.getAttribute("strGubun");

%>
</head>

<body>

<table width="712" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/et/saigon_event.jpg" width="712" height="1455" border="0" usemap="#Map"  alt="전쟁도 빗겨 간 가슴 아픈 사랑! 뮤지컬 미스사이공 삼성카드에서만 최대 40% 특별 할인" /></td>
  </tr>
</table>

<map name="Map" id="Map">

	<%
		if(eventIngYN.equals("before"))
		{
	%>
  <area shape="rect" coords="440,639,552,670" href="#" onclick="alert('이벤트 응모는 2010년 06월 10일부터 가능합니다.');" alt="예매 확인" /><!--예매확인-->

  <area shape="rect" coords="286,640,436,670" href="#" onclick="alert('이벤트 응모는 2010년 06월 10일부터 가능합니다.');" alt="20% 할인 구매하기" /><!--20-->

  <area shape="rect" coords="278,540,337,562" href="#" onclick="alert('이벤트 응모는 2010년 06월 10일부터 가능합니다.');" alt="예매" /><!--30-->

	<area shape="rect" coords="279,515,338,537" href="#" onclick="alert('이벤트 응모는 2010년 06월 10일부터 가능합니다.');" alt="예매" /><!--35-->

	<area shape="rect" coords="278,484,337,506" href="#" onclick="alert('이벤트 응모는 2010년 06월 10일부터 가능합니다.');" alt="예매" /><!--40 -->
	<%
		}
		if(eventIngYN.equals("after"))
		{
	%>

  <area shape="rect" coords="440,639,552,670" href="#" onclick="alert('이벤트가 종료되었습니다.');" alt="예매 확인" /><!--예매확인-->

  <area shape="rect" coords="285,640,435,670" href="#" onclick="alert('이벤트가 종료되었습니다.');" alt="20% 할인 구매하기" /><!--20-->

  <area shape="rect" coords="278,540,337,562" href="#" onclick="alert('이벤트가 종료되었습니다.');" alt="예매" /><!--30-->

	<area shape="rect" coords="279,515,338,537" href="#" onclick="alert('이벤트가 종료되었습니다.');" alt="예매" /><!--35-->

	<area shape="rect" coords="278,484,337,506" href="#" onclick="alert('이벤트가 종료되었습니다.');" alt="예매" /><!--40 -->

	<%
		}
		if(loginYN.equals("N"))
		{
	%>

		  	<area shape="rect" coords="440,639,552,670" href="#" onclick="go_login();"  alt="예매 확인"/><!--예매확인-->
		  	<area shape="rect" coords="285,640,435,670" href="#" onclick="go_login();" alt="20% 할인 구매하기" /><!--20-->
		  	<area shape="rect" coords="278,540,337,562" href="#" onclick="go_login();" alt="예매" /><!--30-->
			<area shape="rect" coords="279,515,338,537" href="#" onclick="go_login();" alt="예매" /><!--35-->
			<area shape="rect" coords="278,484,337,506" href="#" onclick="go_login();" alt="예매" /><!--40 -->

	<%
		}

		if( loginYN.equals("Y"))
		{

			if( strGubun.equals("I") || strGubun.equals("V") || strGubun.equals("W") || strGubun.equals("S"))
			{

	%>


		  <area shape="rect" coords="440,639,552,670" href="#" onclick="PopReserveConfirm('01018','12707');" alt="예매 확인" /><!--예매확인-->

		  <area shape="rect" coords="285,640,435,670" href="#" onclick="goDetail('9637', '19');" alt="20% 할인 구매하기" /><!--20-->

		  <area shape="rect" coords="278,540,337,562" href="#" onclick="alert('회원님께서는 VIP 또는 슈퍼 프리미엄 회원이십니다.해당 메뉴를 이용해 주시기 바랍니다.');" alt="예매" /><!--30-->

			<area shape="rect" coords="279,515,338,537" href="#" onclick="alert('회원님께서는 VIP 또는 슈퍼 프리미엄 회원이십니다.해당 메뉴를 이용해 주시기 바랍니다.');" alt="예매" /><!--35-->

			<area shape="rect" coords="278,484,337,506" href="#" onclick="interparkBooking('12707','01018','10004025');"  alt="예매"/><!--40 -->

		<%
			}
			if( strGubun.equals("P"))
			{
		%>
		  <area shape="rect" coords="440,639,552,670" href="#" onclick="PopReserveConfirm('01018','12707');"  alt="예매 확인"/><!--예매확인-->

		  <area shape="rect" coords="285,640,435,670" href="#" onclick="goDetail('9637', '19');" alt="20% 할인 구매하기" /><!--20-->

		  <area shape="rect" coords="278,540,337,562" href="#" onclick="alert('회원님께서는 프리미엄 회원 이십니다.해당 메뉴를 이용해 주시기 바랍니다.');"  alt="예매"/><!--30-->

			<area shape="rect" coords="279,515,338,537" href="#" onclick="interparkBooking('12707','01018','10004028');" alt="예매" /><!--35-->

			<area shape="rect" coords="278,484,337,506" href="#" onclick="alert('회원님께서는 프리미엄 회원 이십니다.해당 메뉴를 이용해 주시기 바랍니다.');" alt="예매" /><!--40 -->

		<%
			}
			else
			{
		%>

		  <area shape="rect" coords="440,639,552,670" href="#" onclick="PopReserveConfirm('01018','12707');" alt="예매 확인"/><!--예매확인-->

		  <area shape="rect" coords="285,640,435,670" href="#" onclick="goDetail('9637', '19');" alt="20% 할인 구매하기" /><!--20-->

		  <area shape="rect" coords="278,540,337,562" href="#" onclick="interparkBooking('12707','01018','10004029');" alt="예매" /><!--30-->

			<area shape="rect" coords="279,515,338,537" href="#" onclick="alert('회원님께서는 일반 회원 이십니다.해당 메뉴를 이용해 주시기 바랍니다.');"  alt="예매"/><!--35-->

			<area shape="rect" coords="278,484,337,506" href="#" onclick="alert('회원님께서는 일반 회원 이십니다.해당 메뉴를 이용해 주시기 바랍니다.');" alt="예매" /><!--40 -->

		<%
			}
			}
			%>
	<area shape="rect" coords="168,639,280,670" href="#" onclick="goSaigon();"   alt="공연보기" title="새창" />

</map>

</body>

</html>

