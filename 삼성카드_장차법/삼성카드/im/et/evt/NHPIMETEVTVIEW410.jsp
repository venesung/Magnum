<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드</title>
	<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	String eventNo = (String) request.getAttribute("eventNo");//이벤트종류확인
	String eventYN = (String) request.getAttribute("eventYN");//이미참여확인
	String event_insert = (String) request.getAttribute("event_insert");//적용여부확인
	%> 
	<script type="text/javascript"> 
		<%if (eventNo.equals("renewal2011060303")){%>
			parent.pstFaceBook();
		<%}else if( eventNo.equals("renewal2011060304")){ %>	
			parent.pstTwitter();
		<%}else if( eventNo.equals("renewal2011060305")){ %>	
			parent.pstMe2Day();
		<%}else{%> 
			<%if (eventYN == "Y") {%>
				parent.applyed();
			<%}else{%>
				<%if (event_insert == "Y") {%> 
					<%if (eventNo.equals("renewal2011060306")){%>
						parent.applyOkReload();//덧글
					<%}else{%>
						parent.applyOk(); //나머지
					<%}%>
				<%}else{%>
					parent.applyNo(); 
				<%}%>
			<%}%> 
		<%}%> 
	</script>
</head> 
<body>
</body>
</html>