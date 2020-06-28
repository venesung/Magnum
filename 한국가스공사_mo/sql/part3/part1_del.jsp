<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append(" SELECT info_passwd, info_realnamenum FROM kogas_infocenter ")
			.append(" WHERE info_seq = ? ");
		break;
		
	case 12:
		sql.append(" UPDATE kogas_infocenter SET ")
			.append(" info_delete='Y', info_uptdate=sysdate ")
			.append(" WHERE info_seq= ? ");
	}
	
	return sql.toString();
}
%>