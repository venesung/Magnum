<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part9/part3_list.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

//네비게이션 관련 변수 초기화 시작
int ListPage = 0;					//게시물 페이지 번호
int TotalList = 0;					//전체 리스트 수
int ListPerPage = 10;				//페이지 당 출력할 리스트 수
int TotalPage = 1;					//전체 페이지 수
int idx = 0;

if (request.getParameter("ListPage") != null)
{
	ListPage = Integer.parseInt(request.getParameter("ListPage"));
}
else
{
	ListPage = 1;
}

int seq = 0;
String title	= null;
String writer	= null;
String regdate	= null;
int cnt = 0;

Connection			conn		= null;
PreparedStatement	pstmtCnt	= null;
PreparedStatement	pstmtLst	= null;
ResultSet			rsCnt		= null;
ResultSet			rsLst		= null;

try
{	
	conn = openDBcon();
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");

	pstmtCnt = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	pstmtLst = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);

	rsCnt = pstmtCnt.executeQuery();

	//보여줄 리스트 위치 찾기
	if (rsCnt.next())
	{
		TotalList = Integer.parseInt(rsCnt.getString(1));	//전체 메시지 수

		if (TotalList % ListPerPage > 0)
		{
			TotalPage = TotalList / ListPerPage + 1;		//전체 페이지 계산
		}
		else
		{
			TotalPage = TotalList / ListPerPage;
		}

		pstmtLst.setMaxRows(ListPage*ListPerPage);
		rsLst = pstmtLst.executeQuery() ;

		if (ListPage > 1)
		{
			rsLst.absolute((ListPage-1)*ListPerPage);		//시작 인덱스 레코드로 이동
		}
		else
		{
		    rsLst.beforeFirst();
		}

		idx = TotalList - (ListPage - 1) * ListPerPage;
	}
%>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_9.gif" alt="투자정보"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit9_1_off.png" alt="IR정보"></a></li>			
				<li><a href="part2_1.jsp"><img src="../../images/stit9_2_off.png" alt="재무정보"></a></li>				
				<li class="over"><a href="part3_list.jsp"><img src="../../images/stit9_3_on.png" alt="공고"></a></li>  
                <li><a href="part4_1.jsp"><img src="../../images/stit9_4_off.png" alt="경영공시"></a></li>
			</ul>
		</div>
		<div class="hd_bt">
			<h3>공고</h3>
		</div>		
	</div>
	
	<div class="cont_pn"> 
		<ul class="liT02">
		<% if(TotalList < 1) { %>
			<li class="nolist">  
			등록된 글이 없습니다.	 	    
		    </li>
		<%
		} else { 
			for (int i = 0; i < ListPerPage; i ++ ) {
				if (rsLst.next()) {
					seq = rsLst.getInt("SEQ");
					regdate = formatter.format(rsLst.getTimestamp("REG_DATE"));
					cnt = rsLst.getInt("S_VIEW_CNT");
					
					//XSS 역변환
					title = viewXssCheck(rsLst.getString("S_TITLE"));
					
					if (title.length() > 20)
					{
						title = title.substring(0, 20) + "....";
					}
		%>
		    <li>  
				<a href="part3_view.jsp?idx=<%=seq%>&ListPage=<%=ListPage%>"><%=title %> </a>
				<ul class="liT03"> 			
				    <li><%=regdate %></li>
				    <li>조회 <%=cnt%></li>
				</ul>
		    </li>
		<%
				}
				idx = idx - 1;
			}
		}
		%>
		</ul>	 
		<div class="btn">
			<%
				if (ListPage > 1) {
			%>
			<a href="?ListPage=1"><img src="../../images/btn_pre1.gif" alt="처음으로 페이지 이동"/></a>
			<a href="?ListPage=<%=ListPage-1%>"><img src="../../images/btn_pre.gif" alt="이전 페이지 이동"/></a>
			<%  } %>
			
			<span><em><%=ListPage%></em> / <%=TotalPage%></span>
			
			<%
				if (ListPage < TotalPage) {
			%>
			<a href="?ListPage=<%=ListPage+1%>"><img src="../../images/btn_nx.gif" alt="다음 페이지 이동"/></a>
			<a href="?ListPage=<%=TotalPage%>"><img src="../../images/btn_nx1.gif" alt="마지막 페이지 이동"></a>
			<%	} %>
		</div>

	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>
<%
	rsCnt.close();
	rsLst.close();

	pstmtCnt.close();
	pstmtLst.close();

	conn.close();
}
catch(Exception e)
{
	throw e;
}
finally
{
	try {
	    if (rsCnt != null) {
		    rsCnt.close();
		}
	}catch(Exception ee) {}
	try {
	    if (rsLst != null) {
		    rsLst.close();
		}
	}catch(Exception ee) {}
	try {
	    if (pstmtCnt != null) {
		    pstmtCnt.close();
		}
	}catch(Exception ee) {}
	try {
	    if (pstmtLst != null) {
		    pstmtLst.close();
		}
	}catch(Exception ee) {}
	try {
	    if (conn != null) {
		    conn.close();
		}
	}catch(Exception ee) {}
}
%>