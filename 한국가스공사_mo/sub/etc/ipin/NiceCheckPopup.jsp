<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%@ include file="nice.nuguya.oivs.jsp" %>

<%
	//========================================================================================
	//=====	�� Ű��Ʈ�� 80�ڸ� ���� ��
	//========================================================================================
	String athKeyStr = "";

	OivsObject oivsObject = new OivsObject(athKeyStr);

	String strRecvData 	= request.getParameter( "SendInfo" );
	boolean blProc = oivsObject.resolveClientData( strRecvData );
	
	
	// ��ŷ������ ���� ���ǿ� ����� ���� �� .. 
	String ssOrderNo = session.getAttribute("niceOrderNo") == null ? "" : (String) session.getAttribute("niceOrderNo");
	if(!ssOrderNo.equals(oivsObject.ordNo)){
			out.println("���������� �������� �ʽ��ϴ�.");
	}
	session.setAttribute("niceOrderNo" , "");

//!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
//��翡�� �����Ͽ� ��ȣȭ�� ������ 
//SSL�̳� ������ ���ȸ���� ����Ǿ� ���� ���� ȯ�濡�� 
//�������� �����ϴ� ���� ���ȿ� �ɰ��� ������ �߱��� �� �ֽ��ϴ�. 

//���� ȯ���� ���߾����� ���� ��ü������, �ʿ��� ���� 
//���� ������� �ٸ� ������ �̿��Ͽ� ����� �ֽñ� �ٶ��ϴ�. 
//�� ������ �ؼ����� �ʾƼ� �߻��ϴ� ���Ȼ�� ���ؼ��� 
//��翡�� å���� ���� �ʻ����, ���Ǹ� ��￩ �ֽñ� �ٶ��ϴ�. 

%>

<LINK href="./nice.nuguya.oivs.css" type=text/css rel=stylesheet>
<table width="100%" cellpadding="3" cellspacing="1" bgcolor="#999900">
	<tr><td class="td_left">ȸ���� ���̵�</td>
		<td class="td_content"><%=oivsObject.niceId%></td>
	</tr>
	<tr><td class="td_left">�ֹ���ȣ</td>
		<td class="td_content"><%=oivsObject.ordNo + "("+ ssOrderNo +")"%></td>
	</tr>
	<tr><td class="td_left">�ŷ���ȣ</td>
		<td class="td_content"><%=oivsObject.trNo%></td>
	</tr>
	<tr><td class="td_left">�����ڵ�</td>
		<td class="td_content"><%=oivsObject.retCd%></td>
	</tr>
	<tr><td class="td_left">������ڵ�</td>
		<td class="td_content"><%=oivsObject.retDtlCd%></td>
	</tr>
	<tr><td class="td_left">����޽���</td>
		<td class="td_content"><%=oivsObject.message%></td>
	</tr>
	<tr><td class="td_left">�����ɹ�ȣ</td>
		<td class="td_content"><%=oivsObject.paKey%></td>
	</tr>
	<tr><td class="td_left">�ѱ��ſ����� ��ϼ���</td>
		<td class="td_content"><%=oivsObject.niceNm%></td>
	</tr>
	<tr><td class="td_left">�������</td>
		<td class="td_content"><%=oivsObject.birthday%></td>
	</tr>
	<tr><td class="td_left">����</td>
		<td class="td_content"><%=oivsObject.sex%>(1: ��, 2: ��)</td>
	</tr>
	<tr><td class="td_left">���ܱ��α���</td>
		<td class="td_content"><%=oivsObject.foreigner%>(1: ������, 2: �ܱ���)</td>
	</tr>
	<tr><td class="td_left" colspan="2">�ߺ�����Ȯ������</td></tr>
	<tr>
		<td class="td_content" colspan="2"><font style="font-size:10px"><%=oivsObject.dupeInfo%></font> <BR>�� �����ɹ�ȣ�� �����ο��� ���� �� �ο��� �� ������ ȸ�������� PK�� �ߺ�����Ȯ�������� �̿��Ͽ� �ֽñ� �ٶ��ϴ�.</td>
	</tr>
</table>