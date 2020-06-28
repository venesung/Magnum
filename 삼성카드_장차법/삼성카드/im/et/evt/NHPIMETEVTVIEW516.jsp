<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>승인번호 등록 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>

<script language="javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			self.close();
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

</script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
#pop_wrap{width: 460px; padding: 39px 0 24px 0; text-align: center; overflow: hidden; margin: 0 0 0 5px; }
#pop_wrap h2{padding: 0 0 20px 0;}
#pop_wrap .membershipText{padding: 0 0 142px 0;}
</style>

</head>

<body topmargin="0" leftmargin="0" onload="opener.location.reload();">
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/500ma/h1_point2.png" alt="승인번호 등록" /></h1>
	</div>
	<!-- content -->
	<div id="pop_wrap">
		<p><img src="/images/et/500ma/txt_point2.png" alt="여수에서 행운의3을 찾아라!" /></p>
		<p class="mt10"><img src="/images/et/500ma/txt_point4.png" alt="승인번호 등록이 완료되었습니다." /></p>
		<p class="mt10 mb20">포인트 적립일은 <strong class="t_point">수시적립</strong>(매출전표 삼성카드 접수시) 됩니다.</p>
			<p class="cBtn mt20"><a href="#" onclick="self.close();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p>
	</div>
	<!-- footer -->
	<div id="pop_s_footer2">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
</body>

</html>

