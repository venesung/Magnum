<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>브로드웨이 뮤지컬 오즈의 마법사 - 삼성카드</title>
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
			parent.eventLogin('11466');
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
						window.open("http://ticket.interpark.com/event/partner/oz_pre_one.html");
					<% } %>	
				}else{
					<%if( premiumYn.equals("Y")){ %>
						alert("일반회원님을 위한 40% 할인 티켓입니다.\n프리미엄 회원님께서는 50% 할인 구매를 선택해 주세요.");
					<%}else{ %>
						window.open("http://ticket.interpark.com/event/partner/oz_ss_one.html");
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
<img src="/images/event/event_musical_oz.jpg" alt="브로드웨이 뮤지컬 오즈의 마법사" usemap="#event_oz" />
<map name="event_oz" id="event_oz">
		<area shape="rect" coords="310,307,420,345" href="http://www.musicaloz.co.kr/" target="_blank" alt="공연자세히보기" title="새창" />
		<area shape="rect" coords="410,715,490,755" href="javascript:go_start('P');" alt="프리미엄회원 예매하기" />
		<area shape="rect" coords="590,715,670,755" href="javascript:go_start('N');" alt="일반회원 예매하기" />
		<area shape="rect" coords="280,855,450,895" href="http://ticket.interpark.com/event/partner/oz_ss.html" target="_blank" alt="예매확인 및 취소하기" title="새창" />
		<area shape="rect" coords="577,1175,657,1215" href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=11002153" target="_blank" alt="삼성카드 예매하기" title="새창" />
</map>

</body>

</html>

