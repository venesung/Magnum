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
			.append(" info_title= ? , info_contents= ?, info_contents_ext= ?,")
			.append(" info_ip= ?, info_uptdate= sysdate, info_email=?, phone=?, answer_type=?,gubun_code=?, detail_code=?, mobile='Y'")
			.append(" WHERE info_seq= ? ");
		break;
		
	case 21:
		sql.append(" INSERT INTO kogas_infocenter ")
			.append(" (info_idx, info_seq, gubun_code, info_writer, info_passwd, info_email, info_title, info_contents,")
			.append(" info_contents_ext, info_regdate, info_uptdate, info_delete, info_cnt, info_ip, answer_type, phone, ")
			.append("detail_code, open_type, mobile ) ")
			.append(" VALUES ")
			.append(" ( (SELECT nvl(max(info_idx),0)+1 as cnt FROM kogas_infocenter WHERE gubun_code= ? ), ")
			.append(" (SELECT nvl(max(info_seq),0)+1 as cnt FROM kogas_infocenter), ")
			.append(" ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate, 'N', 0, ?, ?, ?, ?, ?, 'Y')");
		break;
	}
	
	return sql.toString();
}
%>