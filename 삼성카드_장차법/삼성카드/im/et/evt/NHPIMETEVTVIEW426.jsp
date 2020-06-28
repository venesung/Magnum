<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬&lt;렌트&gt; Premium회원 50% 할인 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부
	String registStatus = (String)request.getAttribute("registStatus"); //신규회원여부
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start(type) {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('264'); //운영계 
			//parent.eventLogin('157');   //개발계
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %> 
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				if(type == "P"){
					<%if( premiumYn.equals("N")){ %>
						alert("50% 할인구매는 프리미엄 회원만 가능합니다.\n회원님께서도 삼성카드 프리미엄으로 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다.");
					<%}else{ %>
						//window.open("http://ticket.interpark.com/event/partner/sd_mozart_40_one.html");
						interparkBooking('15160','01107','11010053');
					<% } %>	
				}else{
					<%if( premiumYn.equals("Y")){ %>
						alert("일반회원님을 위한 40% 할인 티켓입니다.\n프리미엄 회원님께서는 50% 할인 구매를 선택해 주세요.");
					<%}else{ %>
						//window.open("http://ticket.interpark.com/event/partner/sd_mozart_30_one.html");
						interparkBooking('15160','01107','11010058');
					<% } %>	
				}
				
			<% } %>	
		<%
			}
		%>
	}

	function goalert() {
		alert("죄송합니다. 본 공연은 판매 종료되었습니다. 더 좋은 삼성카드DAY를 준비하겠습니다.");
		
	}

	function interparkBooking(BizCode,SiteCode,GoodsCode)
	{
		var strURL = "http://ticket.interpark.com/othersite.2.1/bookingSession.asp?GroupCode="+ GoodsCode +"&SessionBizCode=" + BizCode + "&SiteCode="+ SiteCode;
		var WinChild = window.open(strURL, "", "width=900, height=680");
		WinChild.opener = self;
	}

	function PopReserveConfirm(sitecode, bizcode){
		var strURL = "http://ticket.interpark.com/OtherSite.2.0/NonMemberMyPage.asp?MFlag=Non&SiteCode=" + sitecode + "&BizCode=" + bizcode;
		var WinChild = window.open(strURL, "", "width=745, height=480, scrollbars=yes" );
		WinChild.opener = self;
	}
	
</script>


</head>

<body style="margin:0;">


	<!-- <map name="event_mozart">
		<area shape="rect" coords="276,797,454,846" alt="공연 자세히 보기" target="_blank" href="http://www.musicalmozart.co.kr/" />
		<area shape="rect" coords="409,1162,491,1205" href="javascript:go_start('P');" alt="프리미엄회원 예매하기" />
		<area shape="rect" coords="589,1162,671,1205" href="javascript:go_start('N');" alt="일반회원 예매하기" />
		<area shape="rect" coords="277,1288,453,1336" alt="예매확인 및 취소하기" href="javascript:PopReserveConfirm('01102','14800')" />
	</map>
	<img src="/images/event/event_mozart.jpg" usemap="#event_mozart" alt="대구에서 만나는 뮤지컬 모차르트" />-->
	<map name="rent" id="rent">
		<area shape="rect" coords="368,1044,456,1089" href="javascript:go_start('P');" alt="프리미엄회원 예매하기" />
		<area shape="rect" coords="368,1099,456,1125" alt="예매확인/취소" href="javascript:PopReserveConfirm('01107','15160')"/>
		<area shape="rect" coords="586,1044,674,1089" href="javascript:go_start('N');" alt="일반회원 예매하기"/>
		<area shape="rect" coords="586,1099,674,1125" alt="예매확인/취소" href="javascript:PopReserveConfirm('01107','15160')"/>		
	</map>
	<img src="/images/et/rent/event_rent_pre.jpg" usemap="#rent" alt="뮤지컬&lt;렌트&gt; Premium회원 50% 할인" />
	

</body>
</html>

