<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(String keyword)
{
	StringBuffer sql = new StringBuffer();
	
	sql.append("select post, district||' '||ward||' '||houses address, address address2 from srecruit_post_code where houses like '%%"+keyword+"%%'");
	
	return sql.toString();
}
%>