<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("SELECT A.*, ")
			.append("(SELECT COUNT(*) FROM UNI_ATT_FILE WHERE NT_ID=20 AND NT_SEQ=A.SEQ) S_ATT_FILE ")
			.append(" FROM UNI_NOTICE_DATA A  WHERE NT_ID=20  AND SEQ=? ");
		break;
		
	case 12:
		sql.append("SELECT FILE_ID, FILE_NAME, FILE_PATH, FILE_REAL_NM FROM UNI_ATT_FILE WHERE NT_ID=20 AND NT_SEQ=?");
		break;

	case 13:
		sql.append("SELECT * FROM  v_homepage_bid@biddb_mobile WHERE NOTICE_CODE=?");
		break;

	}
	
	return sql.toString();
}
%>