<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part6/part3_view.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String idx = request.getParameter("idx");

if(idx == null || idx.equals("") || idx.equals("0"))
{
%>
	<script type="text/javascript">
		location.href = "part3_list.jsp";
	</script>
<%
}
else
{
	if(digitCheck(replaceStringAll(idx)) == false)
	{
%>
	<script type="text/javascript">
		location.href = "part3_list.jsp";
	</script>
<%
		return;
	}
}

String title		= "";
String notice_code  = "";
String work_typecd   = "";
String notice_name   = "";
String bid_typecd    = "";
String cont_methodcd = "";
String select_methodcd = "";
String notice_dt       = "";
String end_dt          = "";
String open_dt         = "";


String contents		= "";
String contents_ext	= "";
String use_html		= "";
String regdate		= "";
int cnt = 0;

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
ResultSet			rsView		= null;
ResultSet			rsFile		= null;

HashMap<String, String> hmFile = new HashMap<String, String>();
String logicalFile="", physicalFile="";

try{
	conn = openDBcon();
	conn.setAutoCommit(false);
    SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd-HH:mm");
    
 	// 컨텐츠 조회
	stmtView = conn.prepareStatement(getQuery(13), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
    stmtView.setString(1, idx);

    rsView = stmtView.executeQuery();
	if (rsView.next())
	{
		//XSS 역변환
		title = viewXssCheck(rsView.getString("TITLE"));
		notice_code = viewXssCheck(rsView.getString("NOTICE_CODE"));
		work_typecd = viewXssCheck(rsView.getString("WORK_TYPECD"));
		notice_name = viewXssCheck(rsView.getString("NOTICE_NAME"));
		bid_typecd = viewXssCheck(rsView.getString("BID_TYPECD"));
		cont_methodcd = viewXssCheck(rsView.getString("CONT_METHODCD"));
		select_methodcd = viewXssCheck(rsView.getString("SELECT_METHODCD"));
		notice_dt = formatter.format(rsView.getTimestamp("NOTICE_DT"));
		end_dt = formatter.format(rsView.getTimestamp("END_DT"));
		open_dt = formatter.format(rsView.getTimestamp("OPEN_DT"));
		//cnt = rsView.getInt("S_VIEW_CNT");
		
		//CLOB ////////////////////////////////////////////////
		
		/**
		StringBuffer output = new StringBuffer();
			 
		if(rsView.getCharacterStream("CONTEXT") != null) {
		
			Reader input = rsView.getCharacterStream("CONTEXT");
			char[] buffer = new char[1024];
			int byteRead;
			 
			if(input!=null) {
				while((byteRead=input.read(buffer,0,1024))!=-1){
					output.append(buffer,0,byteRead);
				}
			}
		}
		 
		contents = output.toString();
		*/
		//////////////////////////////////////////////// CLOB//
	}
	rsView.close();
	stmtView.close();
	
	// 파일 조회
	//stmtFile = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	//stmtFile.setInt(1, Integer.parseInt(idx));
	
	//rsFile = stmtFile.executeQuery();
	
	//while(rsFile.next())
	//{
		//physicalFile = rsFile.getString("FILE_NAME");
		//logicalFile = rsFile.getString("FILE_REAL_NM");
		
		//hmFile.put(logicalFile, physicalFile);
	//}
	//rsFile.close();
	//stmtFile.close();
	
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

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_6.gif" alt="알림마당"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit6_1_off.png"></a></li>				
				<li><a href="part2_list.jsp"><img src="../../images/stit6_2_off.png"></a></li>				
				<li><a href="part3_list.jsp"><img src="../../images/stit6_3_on.png"></a></li>
				<li class="none"><a href="part4_1.jsp"><img src="../../images/stit6_4_off.png"></a></li>					
			</ul>
		</div>
		<div class="hd_bt">
			<h3>입찰정보</h3>
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
					<li>제목 : <%= title %></li>
					<li>공고번호 : <%= notice_code %></li>
					<li>구분 : <%= work_typecd %></li>
					<li>공고명 : <%= notice_name %></li>
					<li>입찰방식 : <%= bid_typecd %></li>
					<li>계약방법 : <%= cont_methodcd %></li>
					<li>낙찰자 선정 방법 : <%= select_methodcd %></li>
					<li>공고일시 : <%= notice_dt %></li>
					<li>마감일시 : <%= end_dt %></li>
					<li>개찰일시 : <%= open_dt %></li>
					<!--
					<li class="clear">
				<%
					String upfile="", upfilereal="";
					Set<String> set = hmFile.keySet();
				    Object [] hmKey = set.toArray();
				    for(int i = 0; i < hmKey.length; i++)
				    {
				    	if(i>0) out.print("<br/>");
						upfile = (String)hmKey[i];
				    	upfilereal = (String)hmFile.get(upfile);
			         %>
			        	<a href="/common/fildn.jsp?fn=<%=upfilereal%>&dnname=<%=upfile%>">
						<img src="../../images/ico_pdf.gif"><%=upfile!=null?upfile:""%></a>
						&nbsp;
			        <%
				    }
					%>-->


				</ul>
				<div>
				<br>
				※자세한 내용은 PC에서 확인바랍니다.
			    </div>
			</div>
			
			<!--
			<div class="bd_cont">   
			   <%=contents%>
			</div>
			-->
		</div>
		
		<div class="btn mat15">
			<a href="part3_list.jsp"><img src="../../images/btn_list.gif"></a>
		</div>

	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>