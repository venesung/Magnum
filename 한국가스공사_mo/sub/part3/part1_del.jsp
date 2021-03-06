<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*, inno_util.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part1_del.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String passwd = request.getParameter("checkpasswd") != null ? request.getParameter("checkpasswd") : "";
String idx = request.getParameter("idx");

Connection conn = null;
PreparedStatement stmtUpd = null;
PreparedStatement stmtView = null;
ResultSet rsView = null;

int delResult = 0;
String msgResult = "";
String pageResult = "./part1_list.jsp";

try 
{
	conn = openDBcon();
	conn.setAutoCommit(false);
	
	stmtView = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	stmtView.setInt(1, Integer.parseInt(idx));
	rsView = stmtView.executeQuery();
	
	String checkResult = "false";
	
	if(rsView.next()){
		////////////////////////////////////////////
		String passwdCheck = rsView.getString("info_passwd") != null ?rsView.getString("info_passwd"):"";
		if(!passwdCheck.trim().equals(passwd.trim())){
			checkResult = "false";
		}else{
			checkResult = "true";
		}
		///////////////////////////////////////////		
	}
	if(checkResult.trim().equals("true")){
		
		// 삭제처리.
		stmtUpd = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		stmtUpd.setInt(1, Integer.parseInt(idx));
		delResult = stmtUpd.executeUpdate();
		conn.commit();
	}else{	
		conn.rollback();		
	}

	if(delResult > 0){
		msgResult = "해당 글을 삭제하였습니다.";		
	}else{
		msgResult = "해당 글을 삭제하지 못하였습니다. 다시  실명인증을 하시거나 비밀번호를 확인해주세요.";		
	}

	if(rsView != null)rsView.close();
	if(stmtView != null)stmtView.close();
	if(stmtUpd != null)stmtUpd.close();		
	if(conn != null)conn.close();

}
catch(Exception e) 
{
	conn.rollback();
	throw e;
} 
finally 
{
	try {
	    if (rsView != null) {
		    rsView.close();
		}
	}catch(Exception ee) {}
	try {
	    if (stmtView != null) {
		    stmtView.close();
		}
	}catch(Exception ee) {}
	try {
	    if (stmtUpd != null) {
		    stmtUpd.close();
		}
	}catch(Exception ee) {}
	try {
	    if (conn != null) {
		    conn.close();
		}
	}catch(Exception ee) {}
}
%>

<script type="text/javascript" language="JavaScript">
	alert("<%=msgResult%>");
	location.href="<%=pageResult%>";
</script>