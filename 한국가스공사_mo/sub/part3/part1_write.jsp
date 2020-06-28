<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*, javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part1_view.jsp" %>
<%@ include file="../etc/realname.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

int ListPage = 0, idx = 0;
String pageIf = request.getParameter("pageIf");

if (request.getParameter("ListPage") != null) 
	ListPage = Integer.parseInt(request.getParameter("ListPage"));  
else
	ListPage = 1;

if (request.getParameter("idx") != null) 
	idx = Integer.parseInt(request.getParameter("idx"));

if(!session.getAttribute("pageIf").equals("")){
	idx = Integer.parseInt((String)session.getAttribute("idx"));

	pageIf = (String)session.getAttribute("pageIf");

	ListPage = Integer.parseInt((String)session.getAttribute("ListPage"));
}
String passwordRequest = request.getParameter("checkpasswd") != null ? request.getParameter("checkpasswd"):"";

String title		= "";
String contents		= "";
String contents_ext	= "";
String use_html		= "";
String writer		= "";
String info_realnamenum = "";
String phone	= "";
String answer_type	 = "";
String email	= "";
String open_type = "";
String gubun_code = "";
String detail_code = "";
String email1 = "";
String email2 = "";

boolean checkResult = true;
String passwordValue = "";

if(pageIf != null && pageIf.equals("MOD"))
{
	Connection			conn		= null;
	PreparedStatement	stmtView	= null;
	ResultSet			rsView		= null;
	
	try 
	{
		conn = openDBcon();
		conn.setAutoCommit(false);
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
		
		// ������ ��ȸ	
		stmtView = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		stmtView.setInt(1, idx) ;
		rsView = stmtView.executeQuery();

		if (rsView.next())
		{
			gubun_code = rsView.getString("gubun_code");
			detail_code = rsView.getString("detail_code");
			
			if(gubun_code.equals("02013"))
				gubun_code = detail_code;
			
			writer = rsView.getString("info_writer")==null?"":rsView.getString("info_writer");
			info_realnamenum  = rsView.getString("info_realnamenum")==null?"":rsView.getString("info_realnamenum");
			open_type = rsView.getString("open_type")==null?"":rsView.getString("open_type");				
			use_html		= rsView.getString("use_html")==null?"":rsView.getString("use_html");
			
			//XSS ����ȯ
			title			= viewXssCheck(rsView.getString("info_title")==null?"":rsView.getString("info_title"));
			contents		= viewXssCheck(brDecoding(rsView.getString("info_contents"))==null?"":brDecoding(rsView.getString("info_contents")));
			contents_ext	= viewXssCheck(brDecoding(rsView.getString("info_contents_ext"))==null?"":brDecoding(rsView.getString("info_contents_ext")));
			
			contents = contents + contents_ext;

			phone = rsView.getString("phone")==null?"":rsView.getString("phone");
			answer_type = rsView.getString("answer_type")==null?"":rsView.getString("answer_type");
			email = rsView.getString("info_email")==null?"":rsView.getString("info_email");
			
			String emails[]	= email.split("@");
			email1 = emails[0];
			email2 = emails[1];
			
			passwordValue = rsView.getString("info_passwd") != null ? rsView.getString("info_passwd"):"";
			if(passwordValue.trim().equals("") || !passwordRequest.trim().equals(passwordValue.trim())){
				checkResult = false;
			}
		}
		
		if(rsView != null) rsView.close();
		if(stmtView != null) stmtView.close();
		if(conn != null) conn.close();
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
		    if (conn != null) {
			    conn.close();
			}
		}catch(Exception ee) {}
	}
} else {
	writer = (String)session.getAttribute("uID");
}
%>

<script type="text/javascript" src="../etc/js/inc_flash.js"></script>
<script type="text/javascript" src="../etc/js/default.js"></script>
<script type="text/javascript" src="../etc/js/util.js"></script>
<script type="text/javascript" src="../etc/js/common.js"></script>

<script type="text/javascript" language="JavaScript">
function CheckEmail(){
	var f = document.frm;
	var selectemail = f.email_3[f.email_3.selectedIndex].value;
	
	if(selectemail==""){
		f.email_2.value="";
		f.email_2.readOnly=false;
	}else{
		f.email_2.value=selectemail;
		f.email_2.readOnly=true;
   }
}

function CheckAndSubmit(f)  {

	if(IsNull(f.email_1.value)) {

		alert('email�� �Է��� �ּ���!');
		f.email_1.focus();
		return false;
	}

	if(!CheckString(f.email_1)) {
		alert('email ID�� Ư�����ڰ� �����ϴ�. email ID�� Ȯ�����ּ���!');
		return false;
	}

	if(IsNull(f.email_2.value)) {

		alert('email�� �Է��� �ּ���!');
		f.email_2.focus();
		return false;
	}

	if(IsNull(f.phone.value)) { 

		alert('��ȭ��ȣ�� �Է��� �ּ���!');
		f.phone.focus();
		return false;
	}

	
	if(IsNull(f.passwd.value)) {

		alert('��й�ȣ�� �Է��� �ּ���!');
		f.passwd.focus();
		return false;
   }

	if(IsNull(frm.title.value)) { 

		alert('������ �Է��� �ּ���!');
		f.title.focus();
		return false;
	}

	if(GetTextByte(f.title.value) > 200) {

       alert('������ �ѱ� 100��/���� 200���̳� �Դϴ�.');
       f.title.focus();
       return false;
   }

   if (IsNull(f.content.value)) {

       alert('���� ������ �Է��� �ּ���!');
       f.content.focus();
       return false;
   }

   if(GetTextByte(f.content.value) > 7000) {

       alert('���� ������ �ѱ� 3500��/���� 7000���̳� �Դϴ�..');
       f.content.focus();
       return false;
   }
	
	mail = f.email_1.value+'@'+ f.email_2.value;
	f.email.value=mail;
}
</script>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_3.gif" alt="������"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit3_1_on.png" alt="���ǼҸ�"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit3_2_off.png" alt="������"></a></li>				
				<li class="none"><a href="part2_1.jsp"><img src="../../images/stit3_4_off.png" alt="�񸮽Ű�"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>���� �Ҹ�</h3>
		</div>
	</div>
	
	<% if(!checkResult){  %>
		<script type="text/javascript" language="JavaScript">
			location.href = "part1_pw.jsp?pageIf=<%=pageIf%>&idx=<%=idx%>";
		</script>
	<% } else { %>
	
	<div class="cont_pn"> 
	
	<form name="frm" method="post" action="part1_save.jsp" onSubmit="return CheckAndSubmit(this)">
		<input type="hidden" name="pageIf" value="<%=pageIf%>"/>
		<input type="hidden" name="idx" value="<%=idx%>"/>
		<input type="hidden" name="email" value=""/>
		
		<table cellspacing="0" summary="" class="tbT03 tbnone">
			<caption></caption>
			<col width="25%"/>
			<col/>   
			<tbody>
			<tr>
				<th>�����з�</th>
				<td>
				<select name="gubun_cd">
					<option value="02014"  <%=gubun_code.equals("02014")?"selected='selected'":""%>>ä����� </option>
					<option value="020131" <%=gubun_code.equals("020131")?"selected='selected'":""%>>���ð�������</option>
					<option value="020132" <%=gubun_code.equals("020132")?"selected='selected'":""%>>������ݰ���</option>
					<option value="020133" <%=gubun_code.equals("020133")?"selected='selected'":""%>>CNG/��۰���</option>
					<option value="020134" <%=gubun_code.equals("020134")?"selected='selected'":""%>>�������/���а���</option>
					<option value="02012"  <%=gubun_code.equals("02012")?"selected='selected'":""%>>���ڰ���</option>
					<option value="02016"  <%=gubun_code.equals("02016")?"selected='selected'":""%>>�Ǽ�����</option>
					<option value="02015"  <%=gubun_code.equals("02015")?"selected='selected'":""%>>��Ÿ</option>
				</select>
				</td>	
			</tr>
			<tr>
				<th>�ۼ���</th>
				<td><%=writer%></td>	
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>
					<input type="text" name="phone" class="input" style="width:60%;" value="<%=phone%>">
				</td>	
			</tr>
			<tr>
				<th>�̸���</th>
				<td>
					<input type="text" name="email_1" class="input mab5" style="width:20%;" value="<%=email1%>"> @ <input type="text" name="email_2" class="input mab5" value="<%=email2%>" style="width:20%;"><br>
					<select name="email_3" onchange="CheckEmail();" class="select" style="width:100px;">
						<option value="" selected="selected">�����Է�</option>
						<option value="chol.com">chol.com</option>
						<option value="daum.net">daum.net</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="empas.com">empas.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hitel.net">hitel.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="megapass.net">megapass.net</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="paran.com">paran.com</option>
						<option value="sayclub.net">sayclub.net</option>
						<option value="shinbiro.com">shinbiro.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>	  			
				</td>	
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="passwd" class="input50" style="width:60%;"></td>	
			</tr>
			<tr>
				<th>�亯���</th>
				<td>
				<input type="radio" name="answer_type"  value="E-mail" <%if(answer_type.equals("E-mail")){%>checked="checked"<%}%>> e-mail
				<input type="radio" name="answer_type" value="sms" <%if(answer_type.equals("sms")){%>checked="checked"<%}%>> sms
				</td>	
			</tr>	
			<tr class="none">
				<th>��������</th>
				<td>
				<input type="radio" name="open_type" value="0" <%if(open_type.equals("0")){%>checked="checked"<%}%>> ���� 
				<input type="radio" name="open_type" value="1" <%if(open_type.equals("1")){%>checked="checked"<%}%>> �����
				</td>
			</tr>
			</tbody>
		</table>

		<table cellspacing="0" summary="" class="tbT03 mat10">
			<caption></caption>
			<col width="25%"/>
			<col/>   
			<tbody>
			<tr>
				<th>����</th>
				<td><input type="text" name="title" id="title" class="input97" value="<%=title%>"/></td>	
			</tr>
			<tr class="none">
				<th>��������</th>
				<td><textarea name="content" id="txtcontent" rows="2" cols="2" class="textarea"><%=contents%></textarea></td>	
			</tr>
			</tbody>
		</table>
		
		<div class="btn mat15">
			<input type="image" src="../../images/btn_save.gif" alt="">
			<a href="part1_list.jsp?ListPage=<%=ListPage%>"><img src="../../images/btn_list.gif"></a>
		</div>
	</form>
	</div>
	<% } %>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>