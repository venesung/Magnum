<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("SELECT * FROM kogas_infocenter WHERE info_delete='N' AND info_seq= ? ");
		break;
		
	case 12:
		sql.append("UPDATE kogas_infocenter SET info_cnt = info_cnt + 1 WHERE info_delete='N' AND info_seq= ?");
		break;
	}
	
	return sql.toString();
}
%>