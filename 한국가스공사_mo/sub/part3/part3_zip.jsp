<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part3_zip.jsp" %>

<script type="text/javascript" language="JavaScript">
	function toSel(post1, post2, addr1, addr2)
	{
		var f = document.frm;
		
		f.post1.value = post1;
		f.post2.value = post2;
		f.addr1.value = addr1;
		f.addr2.value = addr2;

		f.action = "part3_input.jsp";
		f.submit();
	}
</script>

<%
String keyword = request.getParameter("keyword");
String post="", post1="", post2="", address1="", address2="";

String phone = request.getParameter("phone")==null?"":request.getParameter("phone");
String email_1 = request.getParameter("email_1")==null?"":request.getParameter("email_1");
String email_2 = request.getParameter("email_2")==null?"":request.getParameter("email_2");
String mailyn = request.getParameter("mailyn")==null?"":request.getParameter("mailyn");
String title = request.getParameter("title")==null?"":request.getParameter("title");
String content = request.getParameter("content")==null?"":request.getParameter("content");
%>
<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_3.gif" alt="고객지원"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit3_1_off.png"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit3_2_off.png"></a></li>				
				<li class="none"><a href="part2_1.jsp"><img src="../../images/stit3_4_on.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>우편번호 검색</h3>
			<div class="btn_pre">
				<span  onclick="history.back(1);" class="npointer">이전화면</span>
			</div> 
		</div>		
	</div>
	
	<form name="frm" method="post" action="part3_zip.jsp">
		<input type="hidden" name="post1"/>
		<input type="hidden" name="post2"/>
		<input type="hidden" name="addr1"/>
		<input type="hidden" name="addr2"/>
		
		<input type="hidden" name="phone" value="<%=phone%>"/>
		<input type="hidden" name="email_1" value="<%=email_1%>"/>
		<input type="hidden" name="email_2" value="<%=email_2%>"/>
		<input type="hidden" name="mailyn" value="<%=mailyn%>"/>
		<input type="hidden" name="title" value="<%=title%>"/>
		<input type="hidden" name="content" value="<%=content%>"/>
		
	<div class="cont"> 
		<div class="srchbar mab20">
			<div class="srchbar_in">					
				<label for="" class="bold">검색동명</label>
				<input type="text" name="keyword" class="input50">
				<input type="image" src="../../images/btn_srch.gif"/>		
			</div>
		</div>

		<table cellspacing="0" summary="" class="tbT04">
			<caption>우편번호</caption>
			<col width="30%"/>
			<col width=""/>			
			<thead>
				<th>우편번호</th>
				<th class="none">주소</th>			
			</thead>
			<tbody>
			<%
			if(keyword != null && !keyword.equals(""))
			{
				Connection			conn		= null;
				PreparedStatement	stmtView	= null;
				ResultSet			rsView		= null;
				
				try 
				{
					conn = openDBcon();
					conn.setAutoCommit(false);
					
					SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
					
					// 컨텐츠 조회	
					stmtView = conn.prepareStatement(getQuery(keyword), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
					rsView = stmtView.executeQuery();
					
					boolean flag = false;
					while(rsView.next())
					{
						flag = true;
						
						post 		= rsView.getString("post");
						address1 	= rsView.getString("address")==null?"":rsView.getString("address");
						address2 	= rsView.getString("address2")==null?"":rsView.getString("address2");
						post1		= post.substring(0,3);
						post2		= post.substring(3,6);
			%>
			<tr>
				<th><%=post1%> - <%=post2%></th>
				<td><a href="javascript:toSel('<%=post1%>', '<%=post2%>', '<%=address1%>', '<%=address2%>')"><%= address1 + address2%></a></td>	
			</tr>
			<%
					}
					
					if(!flag)
					{
			%>
			<tr class="none">
				<td colspan="2" class="noli">검색결과가 없습니다. </td>	
			</tr>
			<%
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
			}
			else
			{
			%>
			<tr class="none">
				<td colspan="2" class="noli">&nbsp;</td>	
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
	</form>

	<%@ include file="../../inc/footer.jsp"%>

</div>
</body>
</html>

<%		

%>