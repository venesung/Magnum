<%@ include file="ipin/nice.nuguya.oivs.jsp" %>
<%
	//========================================================================================
	//=====	▣ 키스트링 80자리 세팅 ▣
	//========================================================================================
	String athKeyStr = "sx8pwv8JBjrQSSoqXXwzvcFdVf1VKR9Fn6Elzj0i9vFRBkam5lYiSuiSNL8ZleCNN2RXWGJd6ae7IsQ6";

	OivsObject oivsObject = new OivsObject(athKeyStr);

	String strRecvData 	= request.getParameter( "SendInfo" );
	boolean blProc = oivsObject.resolveClientData( strRecvData );

	String ssOrderNo = session.getAttribute("niceOrderNo") == null ? "" : (String) session.getAttribute("niceOrderNo");

	session.setAttribute("niceOrderNo" , "");
	
	String uID=oivsObject.niceNm;
	String pwd=oivsObject.dupeInfo;

	session.setAttribute("uID",uID);
	System.out.println("========================");
	System.out.println(session.getAttribute("url"));
	System.out.println("========================");
%>

<script type="text/javascript">
window.opener.location.href="<%=session.getAttribute("url")%>";
self.close();
</script>