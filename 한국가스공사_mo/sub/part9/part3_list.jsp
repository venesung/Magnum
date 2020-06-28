<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part9/part3_list.jsp" %>

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

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_9.gif" alt="��������"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit9_1_off.png" alt="IR����"></a></li>			
				<li><a href="part2_1.jsp"><img src="../../images/stit9_2_off.png" alt="�繫����"></a></li>				
				<li class="over"><a href="part3_list.jsp"><img src="../../images/stit9_3_on.png" alt="����"></a></li>  
                <li><a href="part4_1.jsp"><img src="../../images/stit9_4_off.png" alt="�濵����"></a></li>
			</ul>
		</div>
		<div class="hd_bt">
			<h3>����</h3>
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
					seq = rsLst.getInt("SEQ");
					regdate = formatter.format(rsLst.getTimestamp("REG_DATE"));
					cnt = rsLst.getInt("S_VIEW_CNT");
					
					//XSS ����ȯ
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
				    <li>��ȸ <%=cnt%></li>
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