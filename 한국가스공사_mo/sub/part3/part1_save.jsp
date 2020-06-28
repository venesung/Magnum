<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*, inno_util.*, com.mail.SendMail" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part1_save.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String pageIf = request.getParameter("pageIf");

String idx = request.getParameter("idx");
String phone = replaceStringAll(request.getParameter("phone"));
String email =  replaceStringAll(request.getParameter("email"));
String answer_type = request.getParameter("answer_type");
String ipAddr = request.getRemoteAddr();
String passwd =request.getParameter("passwd");
String gubun = request.getParameter("gubun_cd");
String detail_code = "";
String open_type = request.getParameter("open_type");
String writer = (String)session.getAttribute("uID");

if(gubun.length() == 6)
{
	detail_code = gubun;
	gubun = detail_code.substring(0, 5);
}

//XSS üũ
String title = requestXssCheck(request.getParameter("title"));
String content = requestXssCheck(replace(request.getParameter("content"), "'", "''"));
System.out.println("-------- "+request.getParameter("content"));

Connection conn = null;
PreparedStatement stmtView = null;
PreparedStatement stmtUpd = null;
PreparedStatement stmtIns = null;
ResultSet rsView = null;

int result = 0;
String msgResult = "";
String pageResult = "./part1_list.jsp";

//����ۿ� �弳�� �������
if (isSlander(content)) {
	out.println("<script type=\"text/javascript\">");
	out.println("		alert (\"���߿� �ø��Ǽ� ���� �弳�� �ֽ��ϴ�. �弳�� ����� �÷��ֽʽÿ�.\");");
	out.println("		history.back();");
	out.println("</script>");
	return;
}

//������� ����
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
	
	int rowcnt = 0;
	if(pageIf != null && pageIf.equals("MOD"))
	{
		//��ȸ
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
			
			//����
			System.out.println("query>> "+getQuery(12));
			stmtUpd = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
			rowcnt = 0;
			stmtUpd.setString(++rowcnt, title);
			stmtUpd.setString(++rowcnt, content);
			stmtUpd.setString(++rowcnt, content_ext);
			stmtUpd.setString(++rowcnt, ipAddr);
			stmtUpd.setString(++rowcnt, email);
			stmtUpd.setString(++rowcnt, phone);
			stmtUpd.setString(++rowcnt, answer_type);
			stmtUpd.setString(++rowcnt, gubun);
			stmtUpd.setString(++rowcnt, detail_code);
			stmtUpd.setInt(++rowcnt, Integer.parseInt(idx));
			result = stmtUpd.executeUpdate();
			conn.commit();
		} else{	
			conn.rollback();
		}
	
		if(result > 0){
			msgResult = "�ش� ���� �����Ͽ����ϴ�.";		
		}else{
			msgResult = "�ش� ���� �������� ���Ͽ����ϴ�. �ٽ� �Ǹ������� �Ͻðų� ��й�ȣ�� Ȯ�����ּ���.";		
		}
	} else {
		//�߰�
		stmtIns = conn.prepareStatement(getQuery(21), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		rowcnt = 0;
		stmtIns.setString(++rowcnt, gubun);

		stmtIns.setString(++rowcnt, gubun);
		stmtIns.setString(++rowcnt, writer);
		stmtIns.setString(++rowcnt, passwd);
		stmtIns.setString(++rowcnt, email);
		stmtIns.setString(++rowcnt, title);
		stmtIns.setString(++rowcnt, content);
		stmtIns.setString(++rowcnt, content_ext);
		stmtIns.setString(++rowcnt, ipAddr);
		stmtIns.setString(++rowcnt, answer_type);
		stmtIns.setString(++rowcnt, phone);
		stmtIns.setString(++rowcnt, detail_code);
		stmtIns.setString(++rowcnt, open_type);
		
		result = stmtIns.executeUpdate();
		
		if(result > 0){
			conn.commit();
			msgResult = "�ش� ���� �߰��Ͽ����ϴ�.";		
		}else{
			conn.rollback();
			msgResult = "�ش� ���� �߰����� ���Ͽ����ϴ�.";		
		}
		
		//email Send//////////////////////////////////////////////////////////
		String questionName ="";
		if(gubun.trim().equals("02012")){
			questionName = "IR ���� Q&A";

		}else if(gubun.trim().equals("02013")){
			questionName = "�������� Q&A";
			
			if(detail_code.trim().equals("020131")){
				questionName = "���ð���";
			}else if(detail_code.trim().equals("020132")){
				questionName = "�������";
			}else if(detail_code.trim().equals("020133")){
				questionName = "CNG/���";
			}else if(detail_code.trim().equals("020134")){
				questionName = "�������/����";
			}

		}else if(gubun.trim().equals("02014")){
			questionName = "ä�� Q&A";

		}else if(gubun.trim().equals("02015")){
			questionName = "��Ÿ Q&A";

		}else if(gubun.trim().equals("02016")){
			questionName = "�Ǽ����� Q&A";
		}
		
		ArrayList<String> mailData = sendCustMailList(request.getRequestURI().trim()+"?gubun="+gubun+"&detail_gubun="+detail_code);
		Vector<String> mailList = new Vector<String>();
		
		SendMail sm = new SendMail();
		sm.setHost(host);
		
		if(mailData != null && mailData.size() > 0){
			for(int i =0 ; i<mailData.size() ; i++){			
				String []mailAddress = ((String)mailData.get(i)).split("\\|");		

				if(mailAddress != null && mailAddress.length >0){

					if(mailAddress[1].trim().equals(questionName)){
						mailList.add(mailAddress[0]);
						System.out.println("mailAddress:"+mailAddress[0]);
					}//if

				}//if
			}//for
		}//if

		for(int i=0 ; i<mailList.size() ; i++){
			sm.setTo((String)mailList.get(i));
			sm.setFrom("kogasmaster@kogas.or.kr");

			sm.setTitle("["+questionName+"] �� ������ ��� �Ǿ����ϴ�.");
			sm.setContents(writer+"���� ���� ����˽��ϴ�.<br/><a href='http://www.kogas.or.kr:9002' target='_blank'>�����ڸ��</a>���� Ȯ���Ͻð� ��ġ�ٶ��ϴ�.</a>");
			sm.sendMail();
		}
		//////////////////////////////////////////////////////////email Send//
		
		//SMS
		ArrayList<String> smsData = sendAdminSMSList(request.getRequestURI().trim()+"?gubun="+gubun+"&detail_gubun="+detail_code);
		Vector<String> smsList = new Vector<String>();
		Vector<String> smsName = new Vector<String>();
		Vector<String> smsTitle = new Vector<String>();
		
		if(smsData != null && smsData.size() > 0){
			for(int i =0 ; i<smsData.size() ; i++){			
				String []smsAddress = ((String)smsData.get(i)).split("\\|");		

				if(smsAddress != null && smsAddress.length >0){

					if(smsAddress[1].trim().equals(questionName)){
						smsList.add(smsAddress[0].replaceAll("-", ""));
						smsTitle.add(smsAddress[1]);
						smsName.add(smsAddress[2]);
						
						
					}//if

				}//if
			}//for
		}//if
		
		String message = "�� ���� ��ϵǾ����ϴ�.";
		boolean smsSendFlag = true;
		
		for(int i=0 ; i<smsList.size() ; i++){
			if(!((String)smsList.get(i)).equals(""))
			{
				if(smsSendFlag == true)
				{
					smsSendFlag = smsSend((String)smsList.get(i), (String)smsTitle.get(i), (String)smsName.get(i), message);
				}
				else
				{
					System.out.println("SMS�߼��� �����߽��ϴ�.");
				}
			}
		}
		//////////////////////////////////////////////////////////
	}

	if(rsView != null)rsView.close();
	if(stmtView != null)stmtView.close();
	if(stmtUpd != null)stmtUpd.close();
	if(stmtIns != null)stmtIns.close();
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
	    if (stmtIns != null) {
	    	stmtIns.close();
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