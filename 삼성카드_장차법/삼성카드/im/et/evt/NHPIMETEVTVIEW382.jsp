<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>서프라이즈 웨딩 Festival - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	
	String dupEventA = (String)request.getAttribute("dupEventA");
	String dupEventB = (String)request.getAttribute("dupEventB");
	
%>
<style type="text/css">
body, p	{margin:0; padding:0}
img  {border:0;}

#sfccard	 {position:relative}
#sfccard	 .sfcevent_ars	{position:absolute; top:1014px; left:182px}
#sfccard	 .sfcevent	{position:absolute; top:1014px; left:247px}
.pl10	{padding-left:10px}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start(eventGubun) {
		
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11368');
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
		  		
			  	if (eventGubun == "A") {
			  		<%if(dupEventA.equals("Y")){%>
					alert("이미 이벤트에 응모하셨습니다.");
					return;
					<%}%>
				} else if (eventGubun == "B") {
					<%if(dupEventB.equals("Y")){%>
					alert("이미 이벤트에 응모하셨습니다.");
					return;
					<%}%>
				}
				applyEvent(eventGubun);
			<% } %>	
				  	
						
		<%
			}
		%>
	}

	function applyEvent(eventGubun) {
		  Top  = (window.screen.availHeight - 600) / 2;
		  Left = (window.screen.availWidth  - 780) / 2; 
		  Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=600,height=572";
		  newsWindow = window.open("/hp/im/et/evt.do?method=getWeddingEventPop&eventGubun="+eventGubun, "weddingevt" , Future); 
		  newsWindow.focus();
		  
		//document.evtFrm.target = "applyResultFrame";
		//document.evtFrm.submit();
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventGubun" value=""/>

</form>

<img src="/images/et/wedding/event_wedding.jpg" alt="서프라이즈 웨딩 Festival" usemap="#wedding" />
<map name="wedding" id="wedding">
		<area shape="rect" coords="139,747,266,778" href="#" onclick="go_start('A')" alt="유리상자 축가 응모하기" />
		<area shape="rect" coords="463,747,589,778" href="#" onclick="go_start('B')" alt="윤형빈 사회 응모하기" />
		<area shape="rect" coords="348,1099,445,1119" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1114');" alt="수퍼S카드 자세히보기" />
		<area shape="rect" coords="348,1264,445,1285" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0179');" alt="삼성유포인트카드 자세히보기" />
		<area shape="rect" coords="80,1314,651,1449" href="http://www.s-wed.com/FrontEventAction.do?method=detail&seq=67&TID1=sscard&TID2=ssfam41" target="_blank" alt="S웨딩 바로가기" title="새창" />
</map>


</body>

</html>

