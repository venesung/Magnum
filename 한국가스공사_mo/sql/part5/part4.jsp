<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo, String data)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("select max(calo_idx_group) as initial_group ")
			.append(", substr(max(calo_idx_group),0,4) as latest_year ")
			.append(", substr(max(calo_idx_group),5,2) as latest_month from kogas_calo");
		break;
		
	case 12:
		sql.append("select calo_idx_num, region, calory from kogas_calo where rownum < 10 and calo_idx_group = '")
			.append(data)
			.append("' order by calo_idx_num");
		break;
		
	case 21:
		sql.append("select calo_idx_num, region, calory from kogas_calo where rownum < 10 and calo_idx_group like '" )
			.append(data)
			.append("' order by calo_idx_num");
		break;
	}
	
	return sql.toString();
}
%>