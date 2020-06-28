<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery(int sqlNo, String SearchData)
{
	StringBuffer sql = new StringBuffer();
	
	switch(sqlNo)
	{
	case 11:
		sql.append(" SELECT news_idx, news_title FROM kogas_news ")
			.append(" WHERE  news_gubun=? AND news_idx > ? AND ")
			.append(SearchData)
			.append(" LIKE ? ORDER BY news_idx");
		break;
		
	case 12:
		sql.append(" SELECT news_idx, news_title FROM kogas_news ")
			.append(" WHERE news_gubun=? AND news_idx > ? ORDER BY news_idx");
		break;
		
	case 21:
		sql.append(" SELECT news_idx, news_title FROM kogas_news ")
			.append(" WHERE  news_gubun=? AND news_idx < ? AND ")
			.append(SearchData)
			.append(" LIKE ? ORDER BY news_idx DESC");
		break;
		
	case 22:
		sql.append(" SELECT news_idx, news_title FROM kogas_news ")
			.append(" WHERE  news_gubun= ? AND news_idx < ? ORDER BY news_idx DESC");
		break;
		
	case 31:
		sql.append("SELECT * FROM kogas_news WHERE news_gubun=? AND news_idx=? ");
		break;
		
	case 32:
		sql.append("UPDATE kogas_news SET news_cnt = news_cnt + 1 WHERE news_idx= ")
			.append(SearchData);
		break;
		
	case 41:
		sql.append("SELECT  B.* ")
			.append("FROM    KOGAS_NEWS A ")
			.append("LEFT OUTER JOIN KOGAS_BBSFILE B ON A.NEWS_IDX = B.BBS_IDX ")
			.append("AND     B.TABLE_NM = 'KOGAS_NEWS' ")
			.append("WHERE A.NEWS_IDX = ? AND B.BBSFILE_SEQ IS NOT NULL");
		break;
	}
	
	return sql.toString();
}
%>