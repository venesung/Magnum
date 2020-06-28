<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part1_view.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String title		= "";
String contents		= "";
String contents_ext	= "";
String reply		= "";
String reply_ext	= "";
String replydate	= "";
String use_html		= "";
String writer		= "";
String info_realnamenum = "";
String admin		= "";
String dept			= "";
String regdate		= "";
String user_file	= "";
String admin_file	 = "";
String phone	= "";
String answer_type	 = "";
String info_idx = "";
String report_process = "";
int satisfaction = 0;
String email	= "";

//password Check/////////////////
String pageIf = request.getParameter("pageIf") != null ? request.getParameter("pageIf"):"";
String passwordRequest = request.getParameter("checkpasswd") != null ? request.getParameter("checkpasswd"):"";
String realNameCheck = "";
String passwordValue= "";
String checkResult = "false";
/////////////////password Check//

int ListPage = 0;
int view_count = 0;

String open_type = request.getParameter("open_type"); if(open_type == null) open_type = "0";
String idx = request.getParameter("idx");

if (request.getParameter("ListPage") != null) 
	ListPage = Integer.parseInt(request.getParameter("ListPage"));  
else 
	ListPage = 1;

Connection			conn		= null;
PreparedStatement	stmtView	= null;
PreparedStatement	stmtUpd		= null;
ResultSet			rsView		= null;

try 
{
	conn = openDBcon();
	conn.setAutoCommit(false);
    SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");

	// 컨텐츠 조회	
	stmtView = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	stmtView.setInt(1, Integer.parseInt(idx)) ;
	rsView = stmtView.executeQuery();

	if (rsView.next())
	{
		writer = rsView.getString("info_writer")==null?"":rsView.getString("info_writer");
		info_realnamenum  = rsView.getString("info_realnamenum")==null?"":rsView.getString("info_realnamenum");
		//추가
		open_type = rsView.getString("open_type")==null?"":rsView.getString("open_type");				
		passwordValue	= rsView.getString("info_passwd") != null ? rsView.getString("info_passwd"):"";
		//추가
		use_html		= rsView.getString("use_html")==null?"":rsView.getString("use_html");
		
		//XSS 역변환
		title			= viewXssCheck(rsView.getString("info_title")==null?"":rsView.getString("info_title"));
		contents		= brDecoding(rsView.getString("info_contents"))==null?"":brDecoding(rsView.getString("info_contents"));
		contents_ext	= brDecoding(rsView.getString("info_contents_ext"))==null?"":brDecoding(rsView.getString("info_contents_ext"));
		contents 		= viewXssCheck(contents + contents_ext);
		//"/editorImage/"가 들어가있으면 "http://www.kogas.or.kr/editorImage/"로 수정
		contents = contents.replaceAll("/editorImage/", "http://www.kogas.or.kr/editorImage/");

		reply			= brDecoding(rsView.getString("info_reply"), use_html);
		reply_ext		= brDecoding(rsView.getString("info_reply_ext"), use_html);
		reply 			= viewXssCheck(reply + reply_ext);

		replydate = rsView.getString("regdate")==null?"":rsView.getString("regdate");
		writer = rsView.getString("info_writer")==null?"":rsView.getString("info_writer");
		view_count = rsView.getInt("info_cnt")==0?0:rsView.getInt("info_cnt");
		admin = rsView.getString("admin_sabun")==null?"":rsView.getString("admin_sabun");
		dept = delNull(rsView.getString("info_dept"));
		regdate = formatter.format(rsView.getTimestamp("info_regdate"));
		user_file = rsView.getString("info_user_upfile")==null?"":rsView.getString("info_user_upfile");
		admin_file = rsView.getString("info_upfile")==null?"":rsView.getString("info_upfile");
		phone = rsView.getString("phone")==null?"":rsView.getString("phone");
		answer_type = rsView.getString("answer_type")==null?"":rsView.getString("answer_type");
		email = rsView.getString("info_email")==null?"":rsView.getString("info_email");
		info_idx = rsView.getString("info_idx")==null?"":rsView.getString("info_idx");
		report_process = rsView.getString("report_process")==null?"":rsView.getString("report_process");
		satisfaction = rsView.getInt("satisfaction")==0?0:rsView.getInt("satisfaction");
		
		if(pageIf.trim().equals("DEL") || pageIf.trim().equals("MOD")){
			checkResult = "false";
		}else{
			if(open_type.trim().equals("1")){
				if(passwordValue.trim().equals("") || !passwordRequest.trim().equals(passwordValue.trim())){
						checkResult = "false";
					}else{
						checkResult = "true";
					}
						
			}else{
				checkResult = "true";
			}
		}//del, mod
	}	

	// 조회수 업데이트
	stmtUpd = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	stmtUpd.setInt(1, Integer.parseInt(idx));
  	stmtUpd.executeUpdate();

	conn.commit();
	
	if(rsView != null) rsView.close();
	if(stmtView != null) stmtView.close();
	if(stmtUpd != null) stmtUpd.close();	
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
	function toMod()
	{
		location.href = "part1_view.jsp?idx=<%=idx%>&ListPage=<%=ListPage%>&pageIf=MOD";
	}

	function toDel()
	{
		location.href = "part1_view.jsp?idx=<%=idx%>&ListPage=<%=ListPage%>&pageIf=DEL";
	}

	function toList()
	{
		location.href = "part1_list.jsp?ListPage=<%=ListPage%>";
	}
</script>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_3.gif" alt="고객지원"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit3_1_on.png"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit3_2_off.png"></a></li>				
				<li class="none"><a href="part2_1.jsp"><img src="../../images/stit3_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>고객의 소리</h3>
			<%@ include file="../../inc/func.jsp"%>
		</div>		
	</div>
	
	<% if(checkResult.trim().equals("false")){  %>
		<script type="text/javascript" language="JavaScript">
			location.href = "part1_pw.jsp?pageIf=<%=pageIf%>&idx=<%=idx%>";
		</script>
	<% } else { %>
	
	<div id="content" class="cont_pn"> 
		<div class="title">
			<h4><%=title%></h4>
		</div>

		<div class="board">
			<div class="qna_list">
				<ul class="liT04">
					<li class="left">등록일 : <%=regdate%></li>
					<li class="left">작성자 : <%=writer%></li>
					<li class="clear">답변방법 : <%if(answer_type != null){%><%=answer_type%><%}else{%>&nbsp;<%}%></li>
				</ul>
			</div>
			<div class="qna_q">
				<div class="img"><img src="../../images/ico_q.gif"></div>
				<div class="">
					<span class="">[질문]</span>
					<%=contents%>	
				</div> 
			</div>
			<div class="qna_list">
				<ul class="liT04">
					<li>답변등록 : <%
									String name = adminName(admin);
									if(dept != null && !dept.trim().equals("") && name != null && !name.trim().equals("")) {%>
									<%=dept%>/<%=name%>
								  <%} else { %>
								  	&nbsp;
								  <%} %>
					</li>
					<li>연락처 :  <%= adminTel(admin) %></li>
					<li>이메일 :  <%= adminEmail(admin) %></li>
					<li>첨부 : <% if (admin_file == null || admin_file.trim().equals("")) { %>&nbsp;<%}else{%><a href="http://www.kogas.or.kr/includes/downloads.jsp?savePathRef=4.<%= info_idx %>"><img src="../../images/ico_file.gif"><%=admin_file%></a><%}%>
					</li>
				</ul>
			</div>
			<div class="qna_q">
				<div class="img"><img src="../../images/ico_a.gif"></div>
				<div class="">
					<span class="">[답변]</span>
					<%= reply%>
				</div> 	
			</div>
		</div>
		
		<div class="btn mat15">
			<a href="javascript:toMod()"><img src="../../images/btn_mod.gif"></a>
			<a href="javascript:toDel()"><img src="../../images/btn_del.gif"></a>
			<a href="javascript:toList()"><img src="../../images/btn_list.gif"></a>
		</div>

	</div>
	<% } %>
	
	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>