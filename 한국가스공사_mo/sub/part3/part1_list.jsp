<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part1_list.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

//실명인증 풀기
session.removeAttribute("uID");

int no = 0;
String title	= null;
String writer	= null;
String regdate	= null;
String cnt		= null;
String gubun	= null;
int process  = 0;
String open_type = null;
String detail_gubun = null;

int ListPage = 0;					//게시물 페이지 번호
int TotalList = 0;					//전체 리스트 수
int ListPerPage = 10;				//페이지 당 출력할 리스트 수
int TotalPage = 1;					//전체 페이지 수
int PageLinkNum = 10; 				//페이지 링크 표시 수
int idx = 0;

if (request.getParameter("ListPage") != null)
{
	ListPage = Integer.parseInt(requestXssCheck(request.getParameter("ListPage")));
}
else
{
	ListPage = 1;
}

Connection			conn		= null;
PreparedStatement	pstmtCnt	= null;
PreparedStatement	pstmtLst	= null;
ResultSet			rsCnt		= null;
ResultSet			rsLst		= null;

//3년 이내의 게시물만 보여줍니다. ex) 2004 ~ 2006
Calendar cal = Calendar.getInstance();
java.sql.Date appDate = new java.sql.Date(cal.get(cal.YEAR) - 2 - 1900, 0, 1);

try
{	
	conn = openDBcon();
	
	pstmtCnt = conn.prepareStatement(getQuery(11), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	pstmtCnt.setDate(1, appDate);
	
	pstmtLst = conn.prepareStatement(getQuery(12), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
	pstmtLst.setDate(1, appDate);
	
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
		</div>		
	</div>
	
	<div class="cont_pn"> 
		<div class="write">
			<!-- <a href="part1_write.jsp"> --><a href="http://m.epeople.go.kr/"><img src="../../images/write.png" alt="글쓰기"></a>
		</div>
		<!-- 목록 표시 -->
		<ul class="liT02">
		<% if(TotalList < 1) { %>
			<li class="nolist">  
			리스트 없음	 	    
		    </li>
		<% 
			} else { 
			for (int i = 0; i < ListPerPage; i ++ ) {

				if (rsLst.next()) {

					no = rsLst.getInt("info_seq");
					writer = rsLst.getString("info_writer");
					title = viewXssCheck(rsLst.getString("info_title"));//XSS 역변환
					regdate = rsLst.getString("regdate");
					cnt  = rsLst.getString("info_cnt");
					process = rsLst.getInt("report_process") + 1 ;
					open_type = rsLst.getString("open_type");						

					if (title.length() > 35) {
						title = title.substring(0, 32) + "....";
					}
		%>
		    <li>  
				<a href="part1_view.jsp?idx=<%=no%>&ListPage=<%=ListPage%>&open_type=<%=open_type%>"><%=title%></a>
				<ul class="liT03">
				    <li><%=regdate%></li>
				    <li>조회 <%=cnt%></li>
				    <li><%=writer%></li>
			    <% if(open_type!=null && open_type.equals("0")) { %>
					<li class="pcolor_green">공개</li>
				<% } else { %>
					<li>비공개</li>
				<% } %>
				
				<% if(process == 3) { %>
					<li class="pcolor_blue">처리완료</li>
				<% } else if(process == 2) { %>
					<li class="pcolor_orange">처리중</li>
				<% } else { %>
					<li class="pcolor_orange">접수중</li>
				<% } %>
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