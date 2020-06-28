<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>최대 500만 포인트, 행운의3을 찾아라! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12762');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		window.open('/hp/im/et/evt003.do?method=get500maList', '500ma', 'width=710px, height=649px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}


</script>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>

</head>

<body style="margin:0;">

<img src="/images/et/500ma/event_500point.jpg" alt="최대 500만 포인트, 행운의3을 찾아라!" border="0" usemap="#point" />
<map name="point" id="point">
<area shape="rect" coords="506,234,688,264" href="#"  alt="영수증 승인번호 등록하기" onclick="go_start();"/>
<area shape="rect" coords="245,1063,481,1100" href="#"  alt="영수증 승인번호 등록하기" onclick="go_start();" />


</map>


</body>

</html>

