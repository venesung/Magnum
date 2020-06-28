<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo, String SearchField)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("SELECT count(*) FROM kogas_ir_news WHERE news_gubun= ? AND ")
			.append("( news_contents LIKE ? OR news_contents_ext LIKE ? ) ")
			.append("AND part = decode(?,'0',part,?) ");
		break;
		
	case 12:
		sql.append("SELECT news_idx, news_title, regdate, news_upfile, part FROM kogas_ir_news ")
			.append("WHERE news_gubun= ? AND ( news_contents LIKE ? OR news_contents_ext LIKE ? ) ")
			.append(" AND part = decode(?,'0',part,?) ORDER BY news_idx DESC ");
		break;
		
	case 21:
		sql.append("SELECT count(*) FROM kogas_ir_news WHERE news_gubun= ? AND ")
			.append(SearchField)
			.append(" LIKE ?  AND part = decode(?,'0',part,?) ");
		break;
		
	case 22:
		sql.append("SELECT news_idx, news_title, regdate, news_upfile, part FROM kogas_ir_news WHERE news_gubun= ? AND ")
			.append(SearchField)
			.append(" LIKE ?  AND part = decode(?,'0',part,?) ORDER BY news_idx DESC ");
		break;
		
	case 31:
		sql.append("SELECT count(*) FROM kogas_ir_news WHERE news_gubun= ?  AND part = decode(?,'0',part,?) ");
		break;
		
	case 32:
		sql.append("SELECT * FROM kogas_ir_news WHERE news_gubun= ?  AND part = decode(?,'0',part,?) ORDER BY news_idx DESC ");
		break;
	}
	
	return sql.toString();
}
%>