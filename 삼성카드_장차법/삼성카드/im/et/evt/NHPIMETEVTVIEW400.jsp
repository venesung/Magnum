<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>가족과 함께하면 캐리비안베이 이용권이 와르르!! - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String dupEvent = (String)request.getAttribute("dupEvent");
	String userName = (String)request.getAttribute("userName");
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
	//String dupEventB = (String)request.getAttribute("dupEventB");
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		
		<%
			if(loginYN.equals("N")){ 
		%>

		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		
			  		<%if(dupEvent.equals("Y")){%>
					alert("이미 이벤트에 응모하셨습니다.");
					return;
					<%}%>

				applyEvent();
			<% } %>	
				  	
						
		<%
			}
		%>
	}

	function applyEvent() {

		<%if( premiumYn.equals("N")){ %>
		alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
		return ;
		<%}%>
		
			 
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	
	function applyOk(){
		alert("응모가 완료되었습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>

<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=preCommonEventInsert" method="post">
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
<input type="hidden" name="eventgubun" value=""/>
		<!-- <area shape="rect" coords="512,785,600,802" href="#" onclick="parent.parent.goTabPage('NHPIMMHUFM001M001', true);" alt="회원정보조회/변경" />
		-->

<div class="event_family_caribbean">
	<map name="family_caribbean" id="family_caribbean">
		<area shape="rect" coords="327,474,481,512" onclick="go_start();" alt="응모하기" href="#" />
		<area shape="rect" coords="489,474,643,512" alt="가족카드 신청하기" href="javascript:parent.parent.goTabPage('NHPIMCDAPP201M002')" />
	</map>
	<img src="/images/event/pre201104/event_family_caribbean.jpg" usemap="#family_caribbean" alt="가족과 함께하면 캐리비안베이 이용권이 와르르!!" />
</div>

</form>
</body>

</html>

