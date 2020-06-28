<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("SELECT COUNT(*) FROM UNI_NOTICE_DATA WHERE NT_ID=20  AND DEL='0' ");
		break;
		
	case 12:
		sql.append("SELECT A.*, ")
			.append("(SELECT COUNT(*) FROM   UNI_ATT_FILE WHERE NT_ID=20 AND NT_SEQ=A.SEQ) S_ATT_FILE  ")
			.append(" FROM UNI_NOTICE_DATA A  WHERE NT_ID=20  AND DEL='0' ")
			.append(" ORDER BY  S_REG_DATE DESC, SEQ DESC");
		break;


    // DB VIEW 사용으로 인해 위 쿼리 11, 12에서 13, 14로 변경
    case 13:
		sql.append("SELECT COUNT(*) FROM  v_homepage_bid@biddb_mobile");
		break;

	case 14:
		sql.append("SELECT * FROM  v_homepage_bid@biddb_mobile");
		break;
	}
	return sql.toString();
}
%>