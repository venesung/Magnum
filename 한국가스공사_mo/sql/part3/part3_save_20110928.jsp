<%@ page contentType="text/html; charset=euc-kr" %>

<%!
String getQuery()
{
	StringBuffer sql = new StringBuffer();
	
	sql.append("INSERT INTO MORAL_VOICE(VOICE_IDX, VOICE_WRITER, VOICE_TEL, VOICE_EMAIL, ")
		.append("VOICE_POSTNO, VOICE_ADDR1, VOICE_TITLE, ")
		.append("VOICE_CONTENTS, VOICE_PASSWD, VOICE_REGDATE, VOICE_UPTDATE, VOICE_IP, ")
		.append("VOICE_DELETE, VOICE_CNT, VOICE_WMODE, VOICE_VIEW, VOICE_MAILYN, VOICE_RESULT, MOBILE) ")
		.append("VALUES ( (SELECT MAX(VOICE_IDX) AS CNT FROM MORAL_VOICE)+1, ")
		.append("?,?,?,?,?,?,?,?,SYSDATE,SYSDATE,?,'N', 0, ?, 'N', ?, 'N', 'Y')");
	
	return sql.toString();
}
%>