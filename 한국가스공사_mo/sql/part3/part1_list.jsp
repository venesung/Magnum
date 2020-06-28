<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append(" SELECT count(*) FROM kogas_infocenter WHERE info_delete='N' AND info_regdate >= ?");
		break;
		
	case 12:
		sql.append(" SELECT gubun_code, info_seq, info_writer, info_title, TO_CHAR(info_regdate,'YYYY-MM-DD') as regdate, info_cnt, report_process, open_type ")
			.append(" FROM kogas_infocenter ")
			.append(" WHERE info_delete='N' ")
			.append(" AND info_regdate >= ? ")
			.append(" ORDER BY info_seq DESC ");
		break;
	}
	
	return sql.toString();
}
%>