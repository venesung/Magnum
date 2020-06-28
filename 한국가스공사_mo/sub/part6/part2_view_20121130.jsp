<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part6/part2_view.jsp" %>

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
		location.href = "part2_list.jsp";
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
String upImage      = "";
String gubun	    = "DA";

int view_count		= 0;
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
PreparedStatement	stmtFile	= null;
Statement			stmtUpd		= null;
ResultSet			rsView		= null;
ResultSet			rsFile		= null;

HashMap<String, String> hmFile = new HashMap<String, String>();
String logicalFile="", physicalFile="";

try{
	conn = openDBcon();
	conn.setAutoCommit(false);
    SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
    
 	// 컨텐츠 조회
	stmtView = conn.prepareStatement(getQuery(31, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
    stmtView.setString(1, gubun);
	stmtView.setInt(2, Integer.parseInt(idx)) ;

	rsView = stmtView.executeQuery();

	if (rsView.next())
	{
		use_html		= rsView.getString("use_html").trim();

		//XSS 역변환
		title			= viewXssCheck(rsView.getString("news_title"));
		contents		= brDecoding(rsView.getString("news_contents"),use_html);
		contents_ext	= brDecoding(rsView.getString("news_contents_ext"),use_html);
		contents 		= viewXssCheck(contents + contents_ext);
		//"/editorImage/"가 들어가있으면 "http://www.kogas.or.kr/editorImage/"로 수정
		contents = contents.replaceAll("/editorImage/", "http://www.kogas.or.kr/editorImage/");
		
        upImage         = rsView.getString("news_upimage");
        if(use_html.equals("0"))
        {
    		contents = replace(replaceString(">", "&gt", replaceString("<", "&lt;", contents)), "&lt;BR&gt", "<br>");
        }
		view_count = rsView.getInt("news_cnt");
		regdate = formatter.format(rsView.getTimestamp("regdate"));

	}
	rsView.close();
	stmtView.close();
	
	// 첨부파일 조회 기존 방식으로 변경 2011. 09. 28
	stmtFile = conn.prepareStatement(getQuery(42, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	stmtFile.setString(1, gubun);
	stmtFile.setInt(2, Integer.parseInt(idx));
	rsFile = stmtFile.executeQuery();

	while(rsFile.next())
	{
		hmFile.put(rsFile.getString("NEWS_UPFILE"), rsFile.getString("NEWS_UPFILE"));
	}
	/*
	//첨부파일 조회
	stmtFile = conn.prepareStatement(getQuery(41, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	stmtFile.setString(1, gubun);
	stmtFile.setInt(2, Integer.parseInt(idx));
	rsFile = stmtFile.executeQuery();

	while(rsFile.next())
	{
		logicalFile = rsFile.getString("L_FILE_NM");
		physicalFile = rsFile.getString("P_FILE_NM");
		
		hmFile.put(logicalFile, physicalFile);
	}
	*/

	// 조회수 업데이트
	stmtUpd = conn.createStatement();

	stmtUpd.executeUpdate(getQuery(32, idx));
	conn.commit();

	stmtUpd.close();

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
	    if (rsFile!= null) {
	    	rsFile.close();
		}
	}catch(Exception ee) {}
	try {
	    if (stmtFile != null) {
	    	stmtFile.close();
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

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_6.gif" alt="알림마당"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit6_1_off.png"></a></li>				
				<li><a href="part2_list.jsp"><img src="../../images/stit6_2_on.png"></a></li>				
				<li><a href="part3_list.jsp"><img src="../../images/stit6_3_off.png"></a></li>
				<li class="none"><a href="part4_1.jsp"><img src="../../images/stit6_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>보도자료</h3>
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
					<li class="left">조회 : <%=view_count %></li>
					<li class="clear">첨부 : 
					<%
					String upfile="", upfilereal="";
					Set<String> set = hmFile.keySet();
				    Object [] hmKey = set.toArray();
				    
				    if(hmKey.length == 0)
				    {
				    	out.println("&nbsp;");
				    } else {
				    	for(int i = 0; i < hmKey.length; i++)
					    {
					    	if(i>0) out.print("<br/>");
					    	upfile = (String)hmKey[i];
					    	upfilereal = (String)hmFile.get(upfile);
				        %>
							<a href="http://www.kogas.or.kr/includes/downloads.jsp?savePathRef=1.<%= idx %>&gubun=NEWS<%=gubun%>">
							<img src="../../images/ico_file.gif"><%=upfile!=null?upfile:""%>
							</a>
							&nbsp;
				        <%
					    }
				    }
					%>
					</li>
				</ul>
			</div>
			<div class="bd_cont">   
				<%= contents %>
			</div>
		
		</div>
		
		<div class="btn mat15">
			<a href="part2_list.jsp?ListPage=<%=ListPage %>"><img src="../../images/btn_list.gif"></a>
		</div>

	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>