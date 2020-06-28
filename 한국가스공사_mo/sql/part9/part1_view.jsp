<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo, String SearchField)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append(" SELECT * FROM kogas_ir_news WHERE  news_gubun = ? AND news_idx = ? ORDER BY news_idx");
		break;
		
	case 21:
		sql.append("SELECT news_idx, news_title FROM kogas_ir_news WHERE news_gubun= ? AND news_idx > ? AND ")
			.append(SearchField)
			.append(" LIKE ? ORDER BY news_idx");
		break;
		
	case 22:
		sql.append("SELECT news_idx, news_title FROM kogas_ir_news WHERE news_gubun= ? AND news_idx > ? ORDER BY news_idx");
		break;
		
	case 31:
		sql.append("SELECT news_idx, news_title FROM kogas_ir_news WHERE news_gubun= ? AND news_idx < ? AND ")
			.append(SearchField)
			.append(" LIKE ? ORDER BY news_idx DESC ");
		break;
		
	case 32:
		sql.append("SELECT news_idx, news_title FROM kogas_ir_news WHERE news_gubun= ? AND  news_idx < ? ORDER BY news_idx DESC ");
		break;
	}
	
	return sql.toString();
}
%>