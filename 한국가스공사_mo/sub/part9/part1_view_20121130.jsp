<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part9/part1_view.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String idx = request.getParameter("idx");

if(idx == null || idx.equals("") || idx.equals("0"))
{
	idx = "1";
}

else
{
	if(digitCheck(replaceStringAll(idx)) == false)
	{
%>
	<script type="text/javascript">
		location.href = "part1_list.jsp";
	</script>
<%
		return;
	}
}

String title		= "";
String contents		= "";
String contents_ext	= "";
String use_html		= "";
String regdate		= "";
String gubun	    = "DA";
String news_upfile = "";

int ListPage = 0;

if (request.getParameter("ListPage") != null)
{
	ListPage = Integer.parseInt(request.getParameter("ListPage"));
}
else
{
	ListPage = 1;
}

Connection			conn		= null;
PreparedStatement	stmtView	= null;
ResultSet			rsView		= null;

try{
	conn = openDBcon();
	conn.setAutoCommit(false);
    SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
    
 	// 컨텐츠 조회
	stmtView = conn.prepareStatement(getQuery(11, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
    stmtView.setString(1, gubun);
    stmtView.setInt(2, Integer.parseInt(idx));

    rsView = stmtView.executeQuery();

	if (rsView.next())
	{
	   //XSS 역변환
	   title = viewXssCheck(rsView.getString("news_title"));
	   contents = viewXssCheck(brDecoding(rsView.getString("news_contents"),rsView.getString("use_html"))+
			   					brDecoding(rsView.getString("news_contents_ext"),rsView.getString("use_html")));
	 	//"/editorImage/"가 들어가있으면 "http://www.kogas.or.kr/editorImage/"로 수정
		contents = contents.replaceAll("/editorImage/", "http://www.kogas.or.kr/editorImage/");
	   
	   news_upfile = rsView.getString("news_upfile");
	   regdate = formatter.format(rsView.getTimestamp("regdate"));
	}
	rsView.close();
	stmtView.close();
	
	conn.close();
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
%>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_9.gif" alt="투자정보"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit9_1_on.png" alt="IR정보"></a></li>				
				<li><a href="part2_1.jsp"><img src="../../images/stit9_2_off.png" alt="재무정보"></a></li>				
				<li><a href="part3_list.jsp"><img src="../../images/stit9_3_off.png" alt="공고"></a></li>  
                <li><a href="part4_1.jsp"><img src="../../images/stit9_4_off.png" alt="경영공시"></a></li>			
			</ul>
		</div>
		<div class="hd_bt">
			<h3>IR정보</h3>
			<%@ include file="../../inc/func.jsp"%>
		</div>		
	</div>
	
	<div id="content" class="cont_pn"> 
		<div class="title">
			<h4><%= title %></h4>
		</div>

		<div class="board">
			<div class="qna_list">
				<ul class="liT04">
					<li class="left">등록일 : <%= regdate %></li>
					<li class="clear"><% if (news_upfile == null || news_upfile.trim().equals("")) { %>&nbsp;<%}else{%><a href="http://www.kogas.or.kr/includes/downloads.jsp?savePathRef=2.<%= idx %>&gubun=IRNEWSDA"><img src="../../images/ico_pdf.gif"><%=news_upfile%></a><%}%>
					</li>
				</ul>
			</div>
			<div class="bd_cont">
			   <%= contents %>
			</div>
		
		</div>
		
		<div class="btn mat15">
			<a href="part1_list.jsp?ListPage=<%=ListPage %>"><img src="../../images/btn_list.gif"></a>
		</div>

	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>