<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part6/part1_list.jsp" %>

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

int no = 0;
String title	= null;
String writer	= null;
String regdate	= null;
String cnt		= null;
String gubun	= "NO";

Connection			conn		= null;
PreparedStatement	pstmtCnt	= null;
PreparedStatement	pstmtLst	= null;
ResultSet			rsCnt		= null;
ResultSet			rsLst		= null;

try
{	conn = openDBcon();

	pstmtCnt = conn.prepareStatement(getQuery(31, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	pstmtLst = conn.prepareStatement(getQuery(32, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	pstmtCnt.setString(1, gubun);
	pstmtLst.setString(1, gubun);

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

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_6.gif" alt="알림마당"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit6_1_on.png"></a></li>				
				<li><a href="part2_list.jsp"><img src="../../images/stit6_2_off.png"></a></li>				
				<li><a href="part3_list.jsp"><img src="../../images/stit6_3_off.png"></a></li>
				<li class="none"><a href="part4_1.jsp"><img src="../../images/stit6_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>공지사항</h3>
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
	
				no = rsLst.getInt("news_idx");
				//XSS 역변환
				title = viewXssCheck(rsLst.getString("news_title"));
				regdate = rsLst.getString("regdate");
				cnt  = rsLst.getString("news_cnt");
	
				if (title.length() > 35) {
					title = title.substring(0, 32) + "....";
				}
		%>
			<li>  
				<a href="part1_view.jsp?idx=<%=no%>&ListPage=<%=ListPage%>"><%= title %></a>
				<ul class="liT03"> 			
				    <li><%= regdate %></li>
				    <li>조회 <%= cnt %></li>
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