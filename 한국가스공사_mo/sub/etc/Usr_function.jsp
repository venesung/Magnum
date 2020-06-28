<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*, java.math.*,
				java.sql.Timestamp,
				java.text.ParseException,
				java.text.SimpleDateFormat,
				java.util.Calendar,
				java.util.Random" 
%>

<%!


//String host = "172.19.5.17";
//String Url = "http://172.19.9.2";
//String recruit_server_path = "/usr2/inthome/main";
//String host = "210.124.38.5";
/*
String host = "172.19.16.35";
String Url = "172.19.16.35";
String recruit_server_path = "C:\\kogas\\main";
*/

String host = "mailsrv.kogas.or.kr";
//String host = "172.19.5.20";
String Url = "http://www.kogas.or.kr";
String recruit_server_path = "/home/kogas/main";

/*
String url = "http://172.19.16.35/main";
String admin_root = "/usr2/inthome/admin";
String recruit_server_path = "/usr2/inthome/main";
String host = "172.19.16.35";*/

String[] categoryTitle = {"2002","2003","2004","2005","2006","2007","2008", "2009", "2010","2011","2012","2013"};


Connection openDBcon(){
	Connection conn = null;
	
	try{
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("jdbc/OracleDS");
		conn = ds.getConnection();
		/*
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDS");
		conn = ds.getConnection();
		*/
	}catch(Exception e){
		e.printStackTrace();
	}
	return conn;
}

Connection smsDBcon(){
	Connection conn = null;
	
	try{	
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("bisang");
		conn = ds.getConnection();
		
	}catch(Exception e){
	
		e.printStackTrace();
	}
	
	return conn;
}

/*

�ۼ��� : �����
�ۼ��� : 2009-04-23
Method Name : sendAdminMailList(String)
Return Type :	ArrayList

-Variable-
 String sendMailPage[][] : {{������ �������ϴ� ������ ��ġ,KOGAS_ADMIN_MENU�� ��ϵ� �� �������� �޴��̸�},{.. , ..} }
 ArrayList mailListArray : �߼��ؾ��� �����ڵ� �����ּ�.


-����-
������ ��ġ�� �Ѱ� �޾� �ش� �������� ������ ���Ź��� �����ڰ� �ִ��� �����ϴ� �޼ҵ�.
sendMailListArray�� �ִ� ��������η� KOGAS_ADMIN_MENU.MENU_NAME �� ��.
�ش� �������� ������ �ִ� KOGAS_ADMIN_AUTH.AUTH_ADMIN_SABUN �� KOGAS_ADMIN.ADMIN_SABUN�� JOIN�Ͽ�
KOGAS_ADMIN.ADMIN_EMAIL, �� ������ ���� �����ڸ� ��ȯ�Ѵ�.
*/

ArrayList sendAdminMailList(String pageLocation){

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	System.out.println("pageLocation: " + pageLocation);
	ArrayList mailListArray = new ArrayList();
	/*
	String sendMailpage[][] = {
		{"/kogas_kr/html/customer/customer_10_write_trans.jsp","ä�� Q&A","IR ���� Q&A","�������� Q&A","��Ÿ Q&A",},
		{"report/declare_write_trans.jsp","���곶�� �Ű�"},
		{"report/paticipate_write_trans.jsp","���� �Ű�"},
		{"report/claim_write_trans.jsp","ģ��/��ģ�� �Ű�"},		
		{"proposal/proposal_write_trans.jsp","������"},
		{"request/request_write_trans.jsp","��������û��"}
	};
	*/
	//�����ۿ��۾�
	String sendMailpage[][] = {
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02014&detail_gubun=","ä�� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02012&detail_gubun=","IR ���� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020131","�������"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020132","���ð���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020133","CNG/���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020134","�������/����"},	
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02016&detail_gubun=","�Ǽ����� Q&A"},			
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02015&detail_gubun=","��Ÿ Q&A"},
			{"/kogas_kr/html/customer/customer_14_declare_write_trans.jsp","���곶�� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_paticipate_write_trans.jsp","���� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_claim_write_trans.jsp","ģ��/��ģ�� �Ű�"},		
			{"/kogas_kr/html/customer/customer_15_write_trans.jsp","������"},
			{"/kogas_kr/html/customer/customer_20_request_write_trans.jsp","��������û��"}
		};
	
	StringBuffer sql = new StringBuffer();
	sql.append(" select a.MENU_NAME, b.ADMIN_EMAIL from KOGAS_ADMIN b , (select AUTH_ADMIN_SABUN, MENU_NAME from  ");
	sql.append("  (select AUTH_ADMIN_SABUN, AUTH_MENU_IDX from KOGAS_ADMIN_AUTH ");
	sql.append("  where AUTH_MAIL_YN='Y' ");
	sql.append("  and AUTH_MENU_IDX in (select MENU_IDX from KOGAS_ADMIN_MENU where mail_yn = 'Y' and del_yn='N')) kadmin , ");
	sql.append("  KOGAS_ADMIN_MENU kmenu where kadmin.AUTH_MENU_IDX = kmenu.MENU_IDX) a where a.AUTH_ADMIN_SABUN = b.ADMIN_SABUN ");

	try{

		conn = openDBcon();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
		
		while(rs.next()){
			for(int i=0 ; i<sendMailpage.length ; i++){
				for(int k=0 ; k<sendMailpage[i].length ; k++){	
					if(sendMailpage[i][k].trim().equals(strNullCheck(rs.getString("MENU_NAME")))) {
						if(pageLocation.indexOf(sendMailpage[i][0]) >= 0){
		
							mailListArray.add(strNullCheck(rs.getString("ADMIN_EMAIL")).trim()+"|"+sendMailpage[i][k].trim());

						}//if
					}//if
				}//for k
			}//for i
		}//while rs

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();

		}catch(Exception ee){
			ee.printStackTrace();

		}finally{
			rs = null;
			stmt = null;
			conn = null;
		}
	}
	return mailListArray;
}


 ArrayList sendCustMailList(String pageLocation){

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList mailListArray = new ArrayList();
		System.out.println("pageLocation: " + pageLocation);
		String sendMailpage[][] = {
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02014&detail_gubun=","ä�� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02012&detail_gubun=","IR ���� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020131","�������"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020132","���ð���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020133","CNG/���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020134","�������/����"},	
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02016&detail_gubun=","�Ǽ����� Q&A"},			
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02015&detail_gubun=","��Ÿ Q&A"},
			{"/kogas_kr/html/customer/customer_14_declare_write_trans.jsp","���곶�� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_paticipate_write_trans.jsp","���� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_claim_write_trans.jsp","ģ��/��ģ�� �Ű�"},		
			{"/kogas_kr/html/customer/customer_15_write_trans.jsp","������"},
			{"/kogas_kr/html/customer/customer_20_request_write_trans.jsp","��������û��"}
		};

		
		StringBuffer sql = new StringBuffer();
		sql.append(" select a.MENU_NAME, b.ADMIN_EMAIL from KOGAS_ADMIN b , (select AUTH_ADMIN_SABUN, MENU_NAME from  ");
		sql.append("  (select AUTH_ADMIN_SABUN, AUTH_MENU_IDX from KOGAS_ADMIN_AUTH ");
		sql.append("  where AUTH_MAIL_YN='Y' ");
		sql.append("  and AUTH_MENU_IDX in (select MENU_IDX from KOGAS_ADMIN_MENU where mail_yn = 'Y' and del_yn='N')) kadmin , ");
		sql.append("  KOGAS_ADMIN_MENU kmenu where kadmin.AUTH_MENU_IDX = kmenu.MENU_IDX) a where a.AUTH_ADMIN_SABUN = b.ADMIN_SABUN ");

		try{

			conn = openDBcon();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()){				
				for(int i=0 ; i<sendMailpage.length ; i++){
					for(int k=0 ; k<sendMailpage[i].length ; k++){							
						if(sendMailpage[i][k].trim().equals(strNullCheck(rs.getString("MENU_NAME")))) {							
							if(pageLocation.indexOf(sendMailpage[i][0]) >= 0){								
								mailListArray.add(strNullCheck(rs.getString("ADMIN_EMAIL")).trim()+"|"+sendMailpage[i][k].trim());

							}//if
						}//if
					}//for k
				}//for i
			}//while rs

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();

			}catch(Exception ee){
				ee.printStackTrace();

			}finally{
				rs = null;
				stmt = null;
				conn = null;
			}
		}
		return mailListArray;
	} 

 //sms�� �߼��Ѵ�.
 //��ȭ��ȣ, title, �̸�, �޼���, ����(��)
 boolean smsSend(String tel, String title, String name, String message)
 {

	 System.out.println("tel: " + tel);
 	 System.out.println("tel: " + title);
 	 System.out.println("tel: " + name);
	 System.out.println("message: " + message);

	 boolean flag = false;
	 Connection conn = null;
	 PreparedStatement stmtIns1 = null;
	 PreparedStatement stmtIns2 = null;
	 PreparedStatement stmtIns3 = null;
	 
	 ResultSet rs = null;
	 
	 StringBuffer sql = new StringBuffer();
	 String rnd = randomNum();
	 //����
	 String ISQL1 = null;
	 String ISQL2 = null;
	 String ISQL3 = null;
	 	 
	 
	 try{
		 
		conn = smsDBcon();
		conn.setAutoCommit(false);
		
		ISQL1 = " insert into x_parent (sendID, sendDate, userid, subject, jobtype, subjobtype, reply_type, address_count, message) \n" +
		 	    " values(?, sysdate, 'kogas_cust', ? , 1, 2, 0, 1, ?) "; 
		 	    		 
		stmtIns1 = conn.prepareStatement(ISQL1);
		int seq = 0;		 	    		 
		
		stmtIns1.setString(++seq, rnd);
		stmtIns1.setString(++seq, title);
		stmtIns1.setString(++seq, title);
		stmtIns1.executeUpdate();
		
		
		ISQL2 = " insert into x_main (msg_id, jobtype, subjobtype, subject, schedule_stime, schedule_dtime, callback_no, address_count, address, sms_content, ment_type, reply_type, reply_count, relisten_no, sent, user1, user2) \n" +
	     		" values(X_MAIN_MSG_ID.nextval, 1, 2, ? , sysdate, sysdate, '1588-1604', 1, ? ,?,0,0,0,0, 'N', 'kogas_cust', ?) "; 
	    		 
		stmtIns2 = conn.prepareStatement(ISQL2);
		seq = 0;		 	    		 
		
		stmtIns2.setString(++seq, title + "����  ���");
		stmtIns2.setString(++seq, name+"^"+tel);
		stmtIns2.setString(++seq, title + message);
		stmtIns2.setString(++seq, rnd);
		stmtIns2.executeUpdate();
		
		ISQL3 = " insert into sendList (idx, sendID, name, address, template) \n" +
 				" values(SENDLIST_IDX.nextval, ?, ?, ?, '^') "; 
		 
		stmtIns3 = conn.prepareStatement(ISQL3);
		seq = 0;		 	    		 
		
		stmtIns3.setString(++seq, rnd);
		stmtIns3.setString(++seq, name);
		stmtIns3.setString(++seq, tel);		
		stmtIns3.executeUpdate();
		
		conn.commit();
		
		if(stmtIns1 != null)stmtIns1.close();
		if(stmtIns2 != null)stmtIns2.close();
		if(stmtIns3 != null)stmtIns3.close();
		if(conn != null)conn.close();
		flag = true;
		
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 flag = false;
	 }finally{
		 try{
				if(rs != null) rs.close();
				if(stmtIns1 != null) stmtIns1.close();
				if(stmtIns2 != null) stmtIns2.close();
				if(stmtIns3 != null) stmtIns3.close();
				if(conn != null) conn.close();

			}catch(Exception ee){
				ee.printStackTrace();

			}finally{
				rs = null;
				stmtIns1 = null;
				stmtIns2 = null;
				stmtIns3 = null;
				conn = null;
			}
	 }
	 
	 
	 return flag;
 }
 
 String randomNum()
 {
	 long milliSecond = System.currentTimeMillis();
	 Random oRandom = new Random();
	 
	 int i = oRandom.nextInt(10) + 1;
	 String pattern = "yyyyMMddHHmmssSSS";
	 SimpleDateFormat formatter = new SimpleDateFormat(pattern);	 
	 String date = (String)formatter.format(new Timestamp(milliSecond)) + String.valueOf(i);
	 return date;
 }
 
 
 ArrayList sendAdminSMSList(String pageLocation){

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList mailListArray = new ArrayList();
		
		System.out.println("pageLocation: " + pageLocation);
		String sendMailpage[][] = {			  
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02014&detail_gubun=","ä�� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02012&detail_gubun=","IR ���� Q&A"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020131","�������"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020132","���ð���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020133","CNG/���"},
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02013&detail_gubun=020134","�������/����"},	
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02016&detail_gubun=","�Ǽ����� Q&A"},			
			{"/kogas_kr/html/customer/customer_10_write_trans.jsp?gubun=02015&detail_gubun=","��Ÿ Q&A"},
			{"/kogas_kr/html/customer/customer_14_declare_write_trans.jsp","���곶�� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_paticipate_write_trans.jsp","���� �Ű�"},
			{"/kogas_kr/html/customer/customer_14_claim_write_trans.jsp","ģ��/��ģ�� �Ű�"},		
			{"/kogas_kr/html/customer/customer_15_write_trans.jsp","������"},
			{"/kogas_kr/html/customer/customer_20_request_write_trans.jsp","��������û��"}
		};

		
		StringBuffer sql = new StringBuffer();
		sql.append(" select a.MENU_NAME, b.ADMIN_EMAIL, b.CELLULAR, b.admin_name from KOGAS_ADMIN b , (select AUTH_ADMIN_SABUN, MENU_NAME from  ");
		sql.append("  (select AUTH_ADMIN_SABUN, AUTH_MENU_IDX from KOGAS_ADMIN_AUTH ");
		sql.append("  where AUTH_MAIL_YN='Y' ");
		sql.append("  and AUTH_MENU_IDX in (select MENU_IDX from KOGAS_ADMIN_MENU where mail_yn = 'Y' and del_yn='N')) kadmin , ");
		sql.append("  KOGAS_ADMIN_MENU kmenu where kadmin.AUTH_MENU_IDX = kmenu.MENU_IDX) a where a.AUTH_ADMIN_SABUN = b.ADMIN_SABUN ");

		try{

			conn = openDBcon();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()){				
				for(int i=0 ; i<sendMailpage.length ; i++){
					for(int k=0 ; k<sendMailpage[i].length ; k++){							
						if(sendMailpage[i][k].trim().equals(strNullCheck(rs.getString("MENU_NAME")))) {							
							if(pageLocation.indexOf(sendMailpage[i][0]) >= 0){								
								mailListArray.add(strNullCheck(rs.getString("CELLULAR")).trim()+"|"+sendMailpage[i][k].trim() +"|"+strNullCheck(rs.getString("ADMIN_NAME")).trim());
								

							}//if
						}//if
					}//for k
				}//for i
			}//while rs

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();

			}catch(Exception ee){
				ee.printStackTrace();

			}finally{
				rs = null;
				stmt = null;
				conn = null;
			}
		}
		return mailListArray;
	} 




String strNullCheck(String str){

	if(str == null || str.trim().equals("")){
		str = "";

	}
	return  str.trim();

}
	
	
StringBuffer select_box(String select_name){
	StringBuffer output = new StringBuffer();
		output.append("<select name='"+select_name+"' style='color:EE8E30;background-color:E6D494;font-size:11px;'"); output.append("onchange='document.searchForm.submit();'>");
		output.append("<option value=''>��ü</option>");
	
	for(int i=0;i<categoryTitle.length;i++){
		output.append("<option value='"+i+"'>"+categoryTitle[i]+"</option>");
	}
		output.append("</select>");
	return output;	
}


String koreanDecoding(String str) throws Exception
{
    if (str==null) {
        return "";
    } else {
        return str;
    }
}

String koreanEncoding(String str) throws Exception
{
    if (str==null)
    {
        return "";
    } else {
        return new String(str.getBytes("KSC5601"),"8859_1");
    }
}

String brDecoding(String str) {
   int qpos = 0 ;
   String qStrLeft = null;
   String qStrRight = null;

    if (str==null) {
        return "";
    } else {
	    while ((qpos = str.indexOf("\n")) != -1) {
		    qStrLeft = str.substring(0, qpos) ;
		    qStrRight = str.substring(qpos + 1, str.length()) ;
		    str = qStrLeft + "<BR>" + qStrRight ;
	    }
        return str.toString();
	}
}

boolean digitCheck(String input) 
{
   for(int i = 0; i < input.length(); i++) 
   {
       char c = input.charAt(i);
       
       if( (c < '0' || c > '9') ) 
       {
       	return false;
       }
   }
   return true;
}

String brDecoding(String str, String apply)
{
	if (str == null)
    {
        return "";
    }
    else
    {
    	return brDecoding(str);
    }
}

String replace(String str, String pattern, String replace) {
	int s = 0;
	int e = 0;
	StringBuffer result = new StringBuffer();

	while ((e = str.indexOf(pattern, s)) >= 0) {
		result.append(str.substring(s, e));
		result.append(replace);
		s = e + pattern.length();
	}

	result.append(str.substring(s));
	return result.toString();
}

// 20070216 ���� XSS�����
String replaceStringAll(String str) {

java.util.regex.Pattern p = java.util.regex.Pattern.compile("(([0-9]{6})([-|\\| |[:space:]]+)([0-9]{7})|([0-9]{13}))", java.util.regex.Pattern.CASE_INSENSITIVE);
java.util.regex.Matcher m = p.matcher(str);
str = m.replaceAll("******-*******");

	str = replaceString("<", "&lt",str);
	str = replaceString(">", "&gt",str);
	str = replaceString("(", "&#40",str);
	str = replaceString(")", "&#41",str);
	str = replaceString("#", "&#35",str);
	str = replaceString("&", "&#38",str);
	
	return str.toString();
}

String delNull(String str) {
   if (str==null) {
        return "";
   } else {
        return str.toString();
   }
}

// request.getParameter() �� �ѱۺ�ȯ�Ͽ� ��´�.
String getParam(HttpServletRequest req, String name) throws Exception {
    String str = delNull(req.getParameter(name));
    return koreanDecoding(str);
}

//����� ������ ���ڸ� ��´�.
int getDaysOfMonth(int year, int month) {
    int days;
    switch (month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:
                days = 31;
                break;
        case 2:
                if ((year%4==0) && ((year%100!=0) || (year%400==0)))
                        days = 29;
                else
                        days = 28;
                break;
        case 4:case 6:case 9:case 11:
                days = 30;
                break;
        default:
                days = 99;
                break;
    }

    return days;
}


String replaceString(String oldS, String newS, String fullS)
{
    // Replaces oldS with newS in the string fullS
    	int i;
    	String tmpS="";

    	for (i=0; i<fullS.length(); i++)
    	{
        		if ( (fullS.substring(i,i+oldS.length())).equals(oldS))
        		{
	                tmpS = tmpS+newS;
            		i = i+ oldS.length()-1;
        		} else {
	                tmpS = tmpS+fullS.substring(i,i+1);
        		}
    	}
    return (String) tmpS;
}


String quot(String str)

{
	String chs ="";
	if (str != null )
	{
		chs = replaceString("\'","\"",str);
	}
	return chs;
}


String NullCheck(String str)
{
	if (str == null || str.equals("null")) return "";
	return str;
}


//== ���� ��� ó�� ���� =======================================================
/*
  ������� ó�� (*** 2005.08.31���� statistics() ���ν��� ��� - ���� dummy ó��)
  statistics_old() ���ν����� ���� statistics()�� �� �ҽ��Դϴ�.
  2005.9.1 ���� statistics_new()�� ������ �������ó�� �մϴ�.
  ���� ����Ʈ�� statistics_eng()�� ó�� �߽��ϴ�.

  ���������� �� ���μ����� �������� �մϴ�.
  ���� ���� LOG �м� ���� ������ �ϱ⸦ �ٶ��ϴ�.
*/
void statistics_old(String mn) throws Exception {
	String SQL = null;

	Connection conn = null;
	Statement topstmtLst = null;
	Statement topstmt = null;
	ResultSet toprsLst = null;

	try {
		
		conn = openDBcon();

		conn.setAutoCommit(false);

		topstmtLst = conn.createStatement();
		SQL = "SELECT * FROM kogas_statistics WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + mn + "'";
		toprsLst = topstmtLst.executeQuery(SQL);

		if (toprsLst.next()) {
			SQL = "UPDATE kogas_statistics SET cnt=cnt+1 WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + mn + "'";
		} else {
			SQL = "INSERT INTO kogas_statistics(dates, gubun, cnt) VALUES (TO_CHAR(sysdate, 'YYYY-MM-DD'),'" + mn+ "',1)";
		}

		topstmt = conn.createStatement();
		topstmt.executeUpdate(SQL);

		conn.commit();
		toprsLst.close();
		topstmtLst.close();
		topstmt.close();
		conn.close();

	} catch(Exception e) {
		conn.rollback();
		throw e;
	} finally {
		try {
			if (toprsLst != null) {
				toprsLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmtLst != null) {
				topstmtLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmt != null) {
				topstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
                System.out.println(mn);
	}
}

/* ���� ���μ����� dummy ó���մϴ�.*/
void statistics(String mn) throws Exception {
}



/* �� �޴��� ����ī��Ʈ ó�� */
void statistics_new(String mn) throws Exception
{
	String SQL = null;

	Connection conn = null;
	Statement topstmtLst = null;
	Statement topstmt = null;
	ResultSet toprsLst = null;

	try
	{
		conn = openDBcon();

		conn.setAutoCommit(false);

		topstmtLst = conn.createStatement();
		SQL = " SELECT * FROM kogas_statistics_new"
		    + " WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + mn + "'";

		toprsLst = topstmtLst.executeQuery(SQL);

		topstmt = conn.createStatement();
		if (toprsLst.next())
		{
			SQL = " UPDATE kogas_statistics_new SET"
			    + " cnt=cnt+1 WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun= '"+ mn +"'";
		}
		else
		{
			SQL = " INSERT INTO kogas_statistics_new (dates, gubun, cnt) VALUES"
			    + " (TO_CHAR(sysdate, 'YYYY-MM-DD'),'" + mn+ "',1)";
		}

		topstmt.executeUpdate(SQL);

		conn.commit();
		toprsLst.close();
		topstmtLst.close();
		topstmt.close();
		conn.close();

	} catch(Exception e) {
		conn.rollback();
		throw e;
	} finally {
		try {
			if (toprsLst != null) {
				toprsLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmtLst != null) {
				topstmtLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmt != null) {
				topstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
                System.out.println(mn);
	}
}

/* ��������Ʈ ����ī��Ʈ ó�� */
void statistics_eng(String mn) throws Exception
{
	String SQL = null;

	Connection conn = null;
	Statement topstmtLst = null;
	Statement topstmt = null;
	ResultSet toprsLst = null;

	try
	{
		conn = openDBcon();

		conn.setAutoCommit(false);

		topstmtLst = conn.createStatement();
		SQL = " SELECT * FROM ekogas_statistics"
		    + " WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + mn + "'";

		toprsLst = topstmtLst.executeQuery(SQL);

		topstmt = conn.createStatement();
		if (toprsLst.next())
		{
			SQL = " UPDATE ekogas_statistics SET"
			    + " cnt=cnt+1 WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun= '"+ mn +"'";
		}
		else
		{
			SQL = " INSERT INTO ekogas_statistics (dates, gubun, cnt) VALUES"
			    + " (TO_CHAR(sysdate, 'YYYY-MM-DD'),'" + mn+ "',1)";
		}

		topstmt.executeUpdate(SQL);

		conn.commit();
		toprsLst.close();
		topstmtLst.close();
		topstmt.close();
		conn.close();

	} catch(Exception e) {
		conn.rollback();
		throw e;
	} finally {
		try {
			if (toprsLst != null) {
				toprsLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmtLst != null) {
				topstmtLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmt != null) {
				topstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
                System.out.println(mn);
	}
}
//== ���� ��� ó�� �� =========================================================





String adminEmail(String sabun) throws Exception {
	String SQL = null;
	String email = "";

    if (sabun==null) {
        return email;
    }

	Connection conn = null;
	Statement stmtLstAE = null;
	ResultSet rsLstAE = null;

	try {

		conn = openDBcon();


		stmtLstAE = conn.createStatement();
		SQL = "SELECT admin_email FROM kogas_admin WHERE admin_sabun='" + sabun + "'";
		rsLstAE = stmtLstAE.executeQuery(SQL);

		if (rsLstAE.next()) {
			email = "<a href='mailto:" + rsLstAE.getString("admin_email") + "'>" + rsLstAE.getString("admin_email") + "</a>";
		}

	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (rsLstAE != null) {
				rsLstAE.close();
			}
		}catch(Exception ee) {}
		try {
			if (stmtLstAE != null) {
				stmtLstAE.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}
	return email;
}


String adminName(String sabun) throws Exception {
	String SQL = null;
	String name = "";

    if (sabun==null) {
        return name;
    }

	Connection conn = null;
	Statement stmtLstAN = null;
	ResultSet rsLstAN = null;

	try {

		conn = openDBcon();


		stmtLstAN = conn.createStatement();
		SQL = "SELECT admin_name FROM kogas_admin WHERE admin_sabun='" + sabun + "'";
		rsLstAN = stmtLstAN.executeQuery(SQL);

		if (rsLstAN.next()) {
			name = rsLstAN.getString("admin_name");
		} else {
			name = sabun;
		}

	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (rsLstAN != null) {
				rsLstAN.close();
			}
		}catch(Exception ee) {}
		try {
			if (stmtLstAN != null) {
				stmtLstAN.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}
	return name;
}


String adminTel(String sabun) throws Exception {
	String SQL = null;
	String tel = "";

    if (sabun==null) {
        return tel;
    }

	Connection conn = null;
	Statement stmtLstAT = null;
	ResultSet rsLstAT = null;

	try {

		conn = openDBcon();


		stmtLstAT = conn.createStatement();
		SQL = "SELECT admin_tel FROM kogas_admin WHERE admin_sabun='" + sabun + "'";
		rsLstAT = stmtLstAT.executeQuery(SQL);

		if (rsLstAT.next()) {
			tel = rsLstAT.getString("admin_tel");
		}

	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (rsLstAT != null) {
				rsLstAT.close();
			}
		}catch(Exception ee) {}
		try {
			if (stmtLstAT != null) {
				stmtLstAT.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}
	return tel;
}
/**
void custIO(String ssn) throws Exception
{
	String SQL = null;

	Connection topconn = null;
	Statement topstmtLst = null;
	Statement topstmt = null;
	ResultSet toprsLst = null;

	try {
		InitialContext top_ic = new InitialContext();
		DataSource top_ds = (DataSource)top_ic.lookup("jdbc/OracleDS");
		topconn = top_ds.getConnection();
		topconn.setAutoCommit(false);

		topstmtLst = topconn.createStatement();
		SQL = "SELECT * FROM kogas_man WHERE jumin='" + ssn + "'";
		toprsLst = topstmtLst.executeQuery(SQL);

		if (toprsLst.next()) {
			SQL = "UPDATE kogas_customer SET cust_io='I' WHERE cust_ssn='" + ssn + "'";
		} else {
			SQL = "UPDATE kogas_customer SET cust_io='O' WHERE cust_ssn='" + ssn + "'";
		}

		topstmt = topconn.createStatement();
		topstmt.executeUpdate(SQL);

		topconn.commit();
		toprsLst.close();
		topstmtLst.close();
		topstmt.close();
		topconn.close();

	} catch(Exception e) {
		topconn.rollback();
		throw e;
	} finally {
		try {
			if (toprsLst != null) {
				toprsLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmtLst != null) {
				topstmtLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (topstmt != null) {
				topstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (topconn != null) {
				topconn.close();
			}
		}catch(Exception ee) {}
                //System.out.println(mn);
	}
}
**/


void prevURL_statistics(String site) throws Exception {
	String SQL = null;

	Connection conn = null;
	Statement prevURLstmtLst = null;
	Statement prevURLstmt = null;
	ResultSet prevURLrsLst = null;

	try {

		conn = openDBcon();

		conn.setAutoCommit(false);

		prevURLstmtLst = conn.createStatement();
		SQL = "SELECT * FROM kogas_prevurl_statistics WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + site + "'";
		prevURLrsLst = prevURLstmtLst.executeQuery(SQL);

		if (prevURLrsLst.next()) {
			SQL = "UPDATE kogas_prevurl_statistics SET cnt=cnt+1 WHERE dates=TO_CHAR(sysdate, 'YYYY-MM-DD') AND gubun='" + site + "'";
		} else {
			SQL = "INSERT INTO kogas_prevurl_statistics(dates, gubun, cnt) VALUES (TO_CHAR(sysdate, 'YYYY-MM-DD'),'" + site+ "',1)";
		}

		prevURLstmt = conn.createStatement();
		prevURLstmt.executeUpdate(SQL);

		conn.commit();
		prevURLrsLst.close();
		prevURLstmtLst.close();
		prevURLstmt.close();
		conn.close();

	} catch(Exception e) {
		conn.rollback();
		throw e;
	} finally {
		try {
			if (prevURLrsLst != null) {
				prevURLrsLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (prevURLstmtLst != null) {
				prevURLstmtLst.close();
			}
		}catch(Exception ee) {}
		try {
			if (prevURLstmt != null) {
				prevURLstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
                System.out.println(site);
	}
}


String getPath(int savePathRef) throws Exception {
	String savePath = null;
	String sSQL = null;
	Connection conn = null;
	PreparedStatement oPstmt = null;
	ResultSet oRS = null;

	try {

		conn = openDBcon();

		sSQL = "SELECT * FROM KOGAS_CONFIG WHERE CONFIG_IDX=?";
		oPstmt = conn.prepareStatement(sSQL, ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		oPstmt.setInt(1, savePathRef);
		oPstmt.setMaxRows(1);
		oRS = oPstmt.executeQuery();

		if (oRS.next()) {
			savePath = oRS.getString("CONFIG_ROOT") +"main"+oRS.getString("CONFIG_PATH");
			//savePath = oRS.getString("CONFIG_ROOT") +""+oRS.getString("CONFIG_PATH");
		} else {
			throw new Exception("Invalid Parameter!!");
		}
	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (oRS != null) {
				oRS.close();
			}
		}catch(Exception ee) {}
		try {
			if (oPstmt != null) {
				oPstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}

	return savePath;
}



/******************************** �޴� DTO ��й�ȣ *****************************/

private class BoardPwdDTO {
	String boardName;
	int boardIdx;
	String pwd;
}

boolean isPwdCompare(BoardPwdDTO boardPwdDTO) throws Exception {
	String SQL = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean flag = false;
	try {

		conn = openDBcon();

		SQL = "select PWD from KOGAS_BOARD_PWD where BOARD_NAME=? AND BOARD_IDX=?";
		pstmt = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		pstmt.setString(1, boardPwdDTO.boardName);
		pstmt.setInt(2, boardPwdDTO.boardIdx);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (boardPwdDTO.pwd.equals(rs.getString("PWD"))) {
				flag = true;
			}
		}

		return flag;

	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (rs != null) {
				rs.close();
			}
		}catch(Exception ee) {}
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}
}


boolean boardPassWord(Statement stmt, BoardPwdDTO boardPwdDTO) throws Exception {
	String SQL = null;
	boolean flag = false;
	try {

		SQL = "insert into KOGAS_BOARD_PWD(PWD_IDX,BOARD_NAME,BOARD_IDX,PWD)";
		SQL+= " values((select nvl(max(PWD_IDX),0)+1 from KOGAS_BOARD_PWD), '"+boardPwdDTO.boardName+"', "+boardPwdDTO.boardIdx+", '"+boardPwdDTO.pwd+"')";

		stmt.executeUpdate(SQL);

		flag = true;
		return flag;

	} catch(Exception e) {
		flag = false;
		throw e;
		
	} finally {
		try {
			if (stmt != null) {
				stmt.close();
			}
		}catch(Exception ee) {}
	}
}


/**
* �弳 ���͸�
*/
boolean isSlander(String content) throws Exception {
	String SQL = null;
	boolean flag = false;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		conn = openDBcon();

		stmt= conn.createStatement();
		SQL = "SELECT SLANDER_NAME FROM KOGAS_SLANDER ";
		rs = stmt.executeQuery(SQL);

		while (rs.next()) {
			if (content.indexOf(rs.getString("slander_name")) >= 0) {
				flag = true;
				break;
			}
		}
	} catch(Exception e) {
		throw e;
	} finally {
		try {
			if (rs != null) {
				rs.close();
			}
		}catch(Exception ee) {}
		try {
			if (stmt != null) {
				stmt.close();
			}
		}catch(Exception ee) {}
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception ee) {}
	}

	return flag;
}


/**
*	���� Ȯ���� �˻�.
*
****/
public boolean fileUrlCheck(String str){


	boolean result = false;


	if(str == null) str = "";

	if(str.indexOf("..")>=0 || str.indexOf("/")>=0 || str.indexOf("./")>=0 || str.indexOf("\\")>=0 || str.indexOf(".\\")>=0 ||
		str.indexOf("php")>=0 || str.indexOf("java")>=0 || str.indexOf("jsp")>=0 || str.indexOf("js")>=0 || str.indexOf("class")>=0){

		result = true;

	}


	return result;

}

/**
*	XSS Security
*	(Cross Site Scripting)
*****/
public String requestXssCheck(String str){
	String result = "";

	if(str == null){
		str = "";
	}else{
		str = str.replaceAll("<","&lt;");
		str = str.replaceAll(">","&gt;");
		str = str.replaceAll("\\(","&#40;");
		str = str.replaceAll("\\)","&#41;");
		str = str.replaceAll("\"","&quot;");
		str = str.replaceAll("'","&#039;");
		str = str.replaceAll("\\/","&#x2F;");
		str = str.replaceAll("#","&#35;");
		str = str.replaceAll("&","&#38;");
	}

	result = str;

	return result;
}

/**
* XSS ����ȯ
*/
public String viewXssCheck(String str) {
	String result = "";

	if(str == null){
		str = "";
	}else{
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		str = str.replaceAll("&#40;", "\\(");
		str = str.replaceAll("&#41;", "\\)");
		str = str.replaceAll("&quot;", "\"");
		str = str.replaceAll("&#039;", "'");
		str = str.replaceAll("&#x2F;", "\\/");
		str = str.replaceAll("&#35;", "#");
		str = str.replaceAll("&#38;", "&");
	}

	result = str;

	return result;
}

/**
* �ݾ׿� , ǥ�� (��: 12345 -> 12,345)
*/
public String makeMoneyString(double money) {
	
	DecimalFormat df = (DecimalFormat)NumberFormat.getInstance();
	df = new DecimalFormat("##,###"); //format����
	
	return (df.format( money )).toString();
}
%>