<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo, String SearchDomain)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append("SELECT /*+INDEX_DESC(kogas_news)*/ news_idx, news_title, TO_CHAR(regdate,'YYYY-MM-DD')")
			.append(" as regdate, news_contents, news_upimage, use_html")
			.append(" FROM kogas_news")
			.append(" WHERE news_gubun=? and ROWNUM <= 1");
		break;
		
	case 21:
		sql.append(" SELECT count(*) FROM kogas_news WHERE news_gubun=? AND ")
			.append(SearchDomain)
			.append(" LIKE ? ");
		break;
		
	case 22:
		sql.append(" SELECT news_idx, news_title, TO_CHAR(regdate,'YYYY-MM-DD') as regdate, news_cnt ")
			.append(" FROM kogas_news ")
			.append(" WHERE news_gubun=? AND ")
			.append(SearchDomain)
			.append(" LIKE ? ")
			.append(" ORDER BY news_idx DESC ");
		break;
		
	case 31:
		sql.append(" SELECT count(*) FROM kogas_news WHERE news_gubun=?");
		break;
		
	case 32:
		sql.append(" SELECT news_idx, news_title, TO_CHAR(regdate,'YYYY-MM-DD') as regdate, news_cnt ")
			.append(" FROM kogas_news ")
			.append(" WHERE news_gubun=?")
			.append(" ORDER BY news_idx DESC ");
		break;
	}
	
	return sql.toString();
}
%>