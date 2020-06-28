<%@ page contentType="text/html; charset=euc-kr" %>

<%
String uID = "";
String pwd = "";

if(session.getAttribute("uID")==null || ((String)(session.getAttribute("uID"))).trim().equals("")){

	request.setAttribute("ex", request.getRequestURL().toString());
	RequestDispatcher dispatcher = request.getRequestDispatcher("../etc/aut.jsp");
	dispatcher.forward(request, response);
	
	return;
} else {
	uID = (String)session.getAttribute("uID"); 
}

%>