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

//검색 값 설정 - YYYYMM%
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

//콤보박스 날짜 초기 값 - 년, 월 지정
String[] total_year   = {"2007", "2008", "2009", "2010", "2011"};
String[] total_month = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};

//데이터값 받아오기
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
		  // 초기 쿼리 가장 최근의 값을 보여줌 - 페이지 처음로딩시
		  String initial_group = "";
		  
		  pstmtLst = conn.prepareStatement(getQuery(11, ""), ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);
		  rsLst = pstmtLst.executeQuery();
		  while(rsLst.next()){
		         initial_group  = rsLst.getString("initial_group");
				 latest_year   = rsLst.getString("latest_year");
				 latest_month = rsLst.getString("latest_month");				 
		  }
		  rsLst.close();
			
		  // 열량데이타 가져온 후 배열에저장	- 페이지 처음로딩시
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
			  calo_r[0] = year_value + "년 " + mon_value + "월 ";
    		  calo_v[0] = "검색된 데이터가 없습니다.";
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

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_5.gif" alt="정보마당"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1.jsp"><img src="../../images/stit5_1_off.png" alt="요금정보"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit5_2_off.png" alt="주식정보"></a></li>				
				<li><a href="part3.jsp"><img src="../../images/stit5_3_off.png" alt="통계정보"></a></li>				
				<li class="none"><a href="part4.jsp"><img src="../../images/stit5_4_on.png" alt="열량조회"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>천연가스 열량조회</h3>
		</div>		
	<div align="center"><a href="http://www.kogas.or.kr/kogas_kr/html/info/info_08.jsp" target="_blank"><strong><br />
	  <br />
	  <br />
   도시가스 공급열량조회<br />
    <br />
PC버젼으로 이동하기</strong></a></div>
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