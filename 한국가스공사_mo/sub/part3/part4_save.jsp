<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*, inno_util.*, com.mail.SendMail, java.math.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part3_save.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String writer = request.getParameter("writer") == null ? "" : request.getParameter("writer");

String post_cd1 = request.getParameter("post_cd1")==null?"":request.getParameter("post_cd1");
String post_cd2 = request.getParameter("post_cd2")==null?"":request.getParameter("post_cd2");
String postno = post_cd1+"-"+post_cd2;

String addr = request.getParameter("addr")==null?"":request.getParameter("addr");

String phone = request.getParameter("phone")==null?"":request.getParameter("phone");
String email = request.getParameter("email")==null?"":request.getParameter("email");
String mailyn = request.getParameter("mailyn")==null?"N":request.getParameter("mailyn");
String wmode = request.getParameter("wmode") == null ? "A" : request.getParameter("wmode");
String passwd = request.getParameter("passwd");

String ipAddr = request.getRemoteAddr();

//XSS 체크
String title = requestXssCheck(request.getParameter("title")==null?"":request.getParameter("title"));
String content = requestXssCheck(request.getParameter("content")==null?"":request.getParameter("content"));

Connection conn = null;
PreparedStatement stmtIns = null;

PreparedStatement stmtView = null;
ResultSet rsView = null;

int result = 0;
String msgResult = "";
String pageResult = "./part4_input.jsp";

//내용글에 욕설이 있을경우
if (isSlander(content)) {
	out.println("<script type=\"text/javascript\">");
	out.println("		alert (\"글중에 올리실수 없는 욕설이 있습니다. 욕설을 지우고 올려주십시요.\");");
	out.println("		history.back();");
	out.println("</script>");
	return;
}

//내용글이 길경우
String content_ext = "";
if(content != null && content.length() > 2000)
{
	String tmpstr = content;
	content = tmpstr.substring(0,1999);
	content_ext = tmpstr.substring(1999);
}

try
{
	conn = openDBcon();
	conn.setAutoCommit(false);
	
	//추가
	stmtIns = conn.prepareStatement(getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	int rowcnt = 0;
	stmtIns.setString(++rowcnt, writer);
	stmtIns.setString(++rowcnt, phone);
	stmtIns.setString(++rowcnt, email);
	stmtIns.setString(++rowcnt, postno);
	stmtIns.setString(++rowcnt, addr);
	stmtIns.setString(++rowcnt, title);
	stmtIns.setString(++rowcnt, content);
	stmtIns.setString(++rowcnt, passwd);
	stmtIns.setString(++rowcnt, ipAddr);
	stmtIns.setString(++rowcnt, wmode);
	stmtIns.setString(++rowcnt, mailyn);
	
	result = stmtIns.executeUpdate();
	
	if(result > 0){
		conn.commit();
		msgResult = "해당 글을 추가하였습니다.\\n";
		
		stmtView = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		
		rsView = stmtView.executeQuery();

		while(rsView.next()) {
			BigDecimal cnt = rsView.getBigDecimal("CNT");
			if( cnt != null )
				msgResult += "등록하신 접수번호는 KOGAS" + rsView.getBigDecimal("CNT") + " 입니다.\\n" +
				"접수결과를 PC에서 확인하시기 바랍니다.";
		}
		
		
		/* 메일 서버 에러로 인해 주석 처리 - 2011.09.27
		SendMail sm = new SendMail();
		sm.setHost(host);

	    try {
	            String mtoMail    = "drum@kogas.or.kr";
	            String mfromMail  = email;
	            String mtitle     = "[ 윤리경영-비리신고센터 ] 메뉴에 새글이 등록되었습니다.";
	            String mcontents = "";
	            
				mcontents  = mcontents + writer + "님이 글을 남기셨습니다.<br>";
				mcontents  = mcontents + "<a href='http://www.kogas.or.kr:9002' target='_blank'>관리자모드</a>에서 확인하시고 조치바랍니다.";
				
	            sm.setFrom(mfromMail);
	            sm.setTo(mtoMail);
	            sm.setTitle(mtitle);
	            sm.setContents(mcontents);
	            sm.sendMail();
	     } catch (Exception e) {
	         out.println(e.toString());
	     }
		 */
	     
	}else{
		conn.rollback();
		msgResult = "해당 글을 추가하지 못하였습니다.";		
	}

	if(stmtIns != null)stmtIns.close();
	/* 2011.09.28 추가 */
	if(stmtView != null)stmtView.close();
	if(rsView != null)rsView.close();
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
	    if (stmtIns != null) {
	    	stmtIns.close();
		}
	}catch(Exception ee) {}
	try {
		if(stmtView != null)stmtView.close();
	}
	catch(Exception ee) {}
	try {
		if(rsView != null)rsView.close();
	}
	catch(Exception ee) {}
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