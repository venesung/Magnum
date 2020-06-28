<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 몬테크리스토 전석 50% 할인 이벤트 - 삼성카드</title>
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
body, p {margin:0; padding:0}
img {border:0 none}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start(type) {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11314');
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
						window.open("http://ticket.yes24.com/Home/Perf/PerfDetailInfo.aspx?IdPerf=8937");
					<% } %>	
				}else{
					<%if( premiumYn.equals("Y")){ %>
						alert("일반회원님을 위한 40% 할인 티켓입니다.\n프리미엄 회원님께서는 50% 할인 구매를 선택해 주세요.");
					<%}else{ %>
						window.open("http://ticket.yes24.com/Home/Perf/PerfDetailInfo.aspx?IdPerf=8938");
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
</script>


</head>

<body style="margin:0;">
<img src="/images/event/monteCristo20101102.jpg" alt="삼성카드DAY 최대 50%할인 뮤지컬 몬테크리스토" usemap="#monte" />
<map name="monte" id="monte">
		<area shape="rect" coords="318,277,440,319" href="http://www.musicalmonte.com" target="_blank" alt="공연 자세히 보기" title="새창" />
		<area shape="rect" coords="400,684,480,724" href="javascript:goalert();" alt="프리미엄회원 예매하기" />
		<area shape="rect" coords="589,684,670,724" href="javascript:goalert();" alt="일반회원 예매하기" />
		<area shape="rect" coords="245,800,485,840" href="https://www.yes24.com/Templates/FTLogin.aspx?ReturnURL=http://ticket.yes24.com/Home/MyPage/OrderTicketList.aspx?Gcode=009_003_010" target="_blank" alt="삼성카드DAY 예매확인 및 취소" title="새창" />
		<area shape="rect" coords="569,1077,650,1118" href="http://ticket.yes24.com/Home/Perf/PerfDetailInfo.aspx?IdPerf=8803" target="_blank" alt="YES24공연 예매하기" title="새창" />
		<area shape="rect" coords="569,1122,650,1162" href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=11000259" target="_blank" alt="인터파크티켓 예매하기" title="새창" />
</map>

</body>

</html>

