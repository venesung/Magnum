<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part6/part1_list.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

//�׺���̼� ���� ���� �ʱ�ȭ ����
int ListPage = 0;					//�Խù� ������ ��ȣ
int TotalList = 0;					//��ü ����Ʈ ��
int ListPerPage = 10;				//������ �� ����� ����Ʈ ��
int TotalPage = 1;					//��ü ������ ��
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

	//������ ����Ʈ ��ġ ã��
	if (rsCnt.next())
	{
		TotalList = Integer.parseInt(rsCnt.getString(1));	//��ü �޽��� ��

		if (TotalList % ListPerPage > 0)
		{
			TotalPage = TotalList / ListPerPage + 1;		//��ü ������ ���
		}
		else
		{
			TotalPage = TotalList / ListPerPage;
		}

		pstmtLst.setMaxRows(ListPage*ListPerPage);
		rsLst = pstmtLst.executeQuery() ;

		if (ListPage > 1)
		{
			rsLst.absolute((ListPage-1)*ListPerPage);		//���� �ε��� ���ڵ�� �̵�
		}
		else
		{
		    rsLst.beforeFirst();
		}

		idx = TotalList - (ListPage - 1) * ListPerPage;
	}
%>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_6.gif" alt="�˸�����"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit6_1_on.png"></a></li>				
				<li><a href="part2_list.jsp"><img src="../../images/stit6_2_off.png"></a></li>				
				<li><a href="part3_list.jsp"><img src="../../images/stit6_3_off.png"></a></li>
				<li class="none"><a href="part4_1.jsp"><img src="../../images/stit6_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>��������</h3>
		</div>		
	</div>
	
	<div class="cont_pn"> 
		<ul class="liT02">
		<% if(TotalList < 1) { %>
			<li class="nolist">  
			��ϵ� ���� �����ϴ�.	 	    
		    </li>
		<% 
		} else { 
		
			for (int i = 0; i < ListPerPage; i ++ ) {
	
			if (rsLst.next()) {
	
				no = rsLst.getInt("news_idx");
				//XSS ����ȯ
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
				    <li>��ȸ <%= cnt %></li>
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
			<a href="?ListPage=1"><img src="../../images/btn_pre1.gif" alt="ó������ ������ �̵�"/></a>
			<a href="?ListPage=<%=ListPage-1%>"><img src="../../images/btn_pre.gif" alt="���� ������ �̵�"/></a>
			<%  } %>
			
			<span><em><%=ListPage%></em> / <%=TotalPage%></span>
			
			<%
				if (ListPage < TotalPage) {
			%>
			<a href="?ListPage=<%=ListPage+1%>"><img src="../../images/btn_nx.gif" alt="���� ������ �̵�"/></a>
			<a href="?ListPage=<%=TotalPage%>"><img src="../../images/btn_nx1.gif" alt="������ ������ �̵�"></a>
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