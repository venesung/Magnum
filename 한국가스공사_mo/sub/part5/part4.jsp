<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*,  javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>
<%@ include file="../../inc/hd.jsp"%>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part5/part4.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

int fee = 0;

//�˻� �� ���� - YYYYMM%
String reload = "0";
String mon_value = null;
String year_value = null;
String select_value = null;
if(request.getParameter("reload") != null)
{
	reload = request.getParameter("reload");
	year_value = request.getParameter("year");
	mon_value = request.getParameter("month");
	select_value = year_value + mon_value + "%";
}

//�޺��ڽ� ��¥ �ʱ� �� - ��, �� ����
String[] total_year   = {"2007", "2008", "2009", "2010", "2011"};
String[] total_month = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};

//�����Ͱ� �޾ƿ���
String[] calo_n     = {"", "", "", "", "", "", "", "", "", ""};
String[] calo_r     = {"", "", "", "", "", "", "", "", "", ""};
String[] calo_v     = {"", "", "", "", "", "", "", "", "", ""};
String latest_year = null;
String latest_month = null;

Connection conn = null;
PreparedStatement pstmtLst = null;
ResultSet rsLst = null;
ResultSet rsDst = null;

try
{
	int arrayCount  = 0;
	int itmp        = 0;
	
	conn = openDBcon();

	if(reload.equals("0"))
	{
		  // �ʱ� ���� ���� �ֱ��� ���� ������ - ������ ó���ε���
		  String initial_group = "";
		  
		  pstmtLst = conn.prepareStatement(getQuery(11, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		  rsLst = pstmtLst.executeQuery();
		  while(rsLst.next()){
		         initial_group  = rsLst.getString("initial_group");
				 latest_year   = rsLst.getString("latest_year");
				 latest_month = rsLst.getString("latest_month");				 
		  }
		  rsLst.close();
			
		  // ��������Ÿ ������ �� �迭������	- ������ ó���ε���
		  pstmtLst = conn.prepareStatement(getQuery(12, initial_group), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		  rsLst = pstmtLst.executeQuery();
		  while(rsLst.next()) {
		         calo_n[arrayCount] = rsLst.getString("calo_idx_num");
		         calo_r[arrayCount] = rsLst.getString("region");
		         calo_v[arrayCount] = rsLst.getString("calory");
		         arrayCount++;
		  }
			
		  rsLst.close();
	}
	else
	{
		  pstmtLst = conn.prepareStatement(getQuery(21, select_value), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		  rsLst = pstmtLst.executeQuery();
		  while(rsLst.next()) {
		         calo_n[arrayCount] = rsLst.getString("calo_idx_num");
		         calo_r[arrayCount] = rsLst.getString("region");
		         calo_v[arrayCount] = rsLst.getString("calory");
		         arrayCount++;
		  }
          latest_year = year_value;
		  latest_month = mon_value;
		  
		  rsLst.close();

		  if ( arrayCount == 0 )
		 {
			  calo_r[0] = year_value + "�� " + mon_value + "�� ";
    		  calo_v[0] = "�˻��� �����Ͱ� �����ϴ�.";
			  latest_year = year_value;
			  latest_month = mon_value;
		 }	  
	}
%>

<script language="javascript" type="text/javascript">
function toSubmit()
{
	if(document.frm.year.value != '0' )
	{
		if(document.frm.month.value != '0')
		{
			document.frm.submit();
		}
	}
}
</script>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_5.gif" alt="��������"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1.jsp"><img src="../../images/stit5_1_off.png" alt="�������"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit5_2_off.png" alt="�ֽ�����"></a></li>				
				<li><a href="part3.jsp"><img src="../../images/stit5_3_off.png" alt="�������"></a></li>				
				<li class="none"><a href="part4.jsp"><img src="../../images/stit5_4_on.png" alt="������ȸ"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>õ������ ������ȸ</h3>
		</div>		
	<div align="center"><a href="http://www.kogas.or.kr/kogas_kr/html/info/info_08.jsp" target="_blank"><strong><br />
	  <br />
	  <br />
   ���ð��� ���޿�����ȸ<br />
    <br />
PC�������� �̵��ϱ�</strong></a></div>
</body>
</html>
<%
	pstmtLst.close();
	conn.close();
}

catch(Exception e) 
{
	throw e;
} 

finally 
{
     if(rsDst != null){
        try{
        	rsDst.close();
        }catch (Exception e){ }
    }
	if(rsLst != null){
        try{
        	rsLst.close();
        }catch (Exception e){ }
    }
	if(pstmtLst != null){
        try{
        	pstmtLst.close();
        }catch (Exception e){ }
    }
    if(conn != null){
        try{
        	conn.close();
        }catch (Exception e){ }
    }
}
%>