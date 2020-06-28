<%@ page contentType="text/html; charset=euc-kr"%>
<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

int ListPage = 0, idx = 0;
String pageIf = request.getParameter("pageIf");
String target = "";

if (request.getParameter("ListPage") != null) 
	ListPage = Integer.parseInt(request.getParameter("ListPage"));  
else
	ListPage = 1;

idx = Integer.parseInt(request.getParameter("idx"));

if(pageIf == null) pageIf = "";



if(pageIf.equals("MOD")) target = "part1_write.jsp";
else if(pageIf.equals("DEL")) target = "part1_del.jsp";
else target = "part1_view.jsp";

%>

<%@ include file="../../inc/hd.jsp"%>

<script type="text/javascript" language="JavaScript">
	function toMove()
	{
		var f = document.pwform;
		location.href = "<%=target%>?idx=<%=idx%>&pageIf=<%=pageIf%>&ListPage=<%=ListPage%>&checkpasswd=" + f.passwd.value;
	}
</script>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_3.gif" alt="绊按瘤盔"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit3_1_on.png"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit3_2_off.png"></a></li>				
				<li class="none"><a href="part2_1.jsp"><img src="../../images/stit3_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>绊按狼家府</h3>
		</div>		
	</div>
	
	<div class="cont">
		<form name="pwform" method="post">
		<div class="txt_pw">
		    <p><img src="../../images/txt_pw.gif"></p>
		    <br>
		    <input type="password" name="passwd" class="sinput">
		    <div class="btn">
				<a href="javascript:toMove()" class="mar8"><img src="../../images/btn_ok.gif"></a><a href="part1_list.jsp?ListPage=<%=ListPage%>"><img src="../../images/btn_list.gif"></a>
			</div>
		</div>
		</form>
	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>