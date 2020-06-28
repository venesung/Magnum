<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%@ include file="nice.nuguya.oivs.jsp" %>

<%
	//#######################################################################################
	//#####
	//#####	����/�ܱ��� �Ǹ�Ȯ�� ���� �ҽ� (�Ǹ�Ȯ�ο�û)				�ѱ��ſ�����(��)
	//#####	( Java )
	//#####
	//#####	================================================================================
	//#####
	//#####	* �� �������� �ͻ��� ������ �����ؼ� �����Ͻʽÿ�.
	//#####	  ȸ���翡�� ������ �κ��� �����ϰ�� �����ϰų� �������� ���ʽÿ�.
	//#####	  (���� ����� ������ �˴ϴ�)
	//#####
	//#######################################################################################


	//=======================================================================================
	//=====	MAIN PROCESS
	//=======================================================================================

	/****************************************************************************************
	 *****	�� ȸ���� ID ���� : ���ÿ� �߱޵� ȸ���� ID�� �����Ͻʽÿ�. ��
	 ****************************************************************************************/

	String strNiceId = "";

	/****************************************************************************************
	 *****	��  NiceCheck.htm ���� �Ѱ� ���� SendInfo ���� ��ȣȭ �Ͽ� 
	 *****		�ֹι�ȣ,���� �� ������ ���� �����Ѵ� ��
	 ****************************************************************************************/

	OivsObject oivsObject = new OivsObject();
	oivsObject.clientData = request.getParameter( "SendInfo" );
	oivsObject.desClientData();

	// ��ȣȭ �� ���� �Ʒ� �ּ��� Ǯ�� Ȯ�� �����մϴ�. 
	// (���� ȸ�� üũ�� �� �κп��� �Ͻø� �˴ϴ�.)
	/*
	out.println("<BR>���� : "  + oivsObject.userNm);
	out.println("<BR>�ֹι�ȣ/�ܱ��ι�ȣ : "  + oivsObject.resIdNo);
	out.println("<BR>��ȸ�����ڵ� : "  + oivsObject.inqRsn);
	out.println("<BR>��/�ܱ��� �����ڵ� : "  + oivsObject.foreigner);
	*/

	/****************************************************************************************
	 *****	�� �Ǹ�Ȯ�� ���񽺸� ȣ���Ѵ�. ��
	 ****************************************************************************************/
	
	oivsObject.niceId = strNiceId;
	oivsObject.callService();


	/****************************************************************************************
	 *****	�� �Ǹ�Ȯ�� ���񽺸� ���䰪�� ó���Ѵ�. ��

	 *****	strRetCd �� strRetDtlCd�� �̿��Ͽ� �۾� �Ͻø� �˴ϴ�.
	 *****	��! strRetDtlCd �� Y,C�� ���� ������ ������ ���� �Ǹ�Ȯ���� ���� ���� �����̹Ƿ� 
	 *****	���ý�ũ��Ʈ�� �������� ���ñ� �ٶ��ϴ�.
	 ****************************************************************************************/

	//==================================================================================================================
	//				���信 ���� ��� �� �����鿡 ���� ����
	//------------------------------------------------------------------------------------------------------------------
	//
	//	< �ѱ��ſ����� �¶��� �ĺ� ���񽺿��� �����ϴ� ���� >
	//
	//	oivsObject.message			: ���� �Ǵ� ������ �޽���
	//	oivsObject.retCd			: ��� �ڵ�(�޴��� ����) // cf. �ѱ��ſ����� ���� ��� �� ���� ������ : https://www.nuguya.com
	//	oivsObject.retDtlCd			: ��� �� �ڵ�(�޴��� ����)
	//	oivsObject.minor 			: �������� ��� �ڵ�
	//									"1"	: ����
	//									"2"	: �̼���
	//									"9"	: Ȯ�� �Ұ�
	//
	//=================================================================================================================
%>

<html>
	<head>
		<title>�ѱ��ſ������ֽ�ȸ�� ����/�ܱ��� �Ǹ�Ȯ�� ���� ���� ������</Title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

		<!--	==========================================================	-->
		<!--	�ѱ��ſ������ֽ�ȸ�� ó�� ��� (���� �� �������� ���ʽÿ�)	-->
		<!--	==========================================================	-->

		<script type="text/javascript" charset="euc-kr" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.crypto.js"></script>
		<script type="text/javascript" charset="euc-kr" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.msg.js"></script>
		<script type="text/javascript" charset="euc-kr"  src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.util.js"></script>
	</head>

	<script type="text/javascript">

		function loadAction()
		{
			var strRetCd = "<%= oivsObject.retCd %>";
			var strRetDtlCd = "<%=oivsObject.retDtlCd %>";
			var strMsg = "<%= oivsObject.message %>";

			//	�ѱ��ſ������� ���� ����ڵ忡 �ش��ϴ� �޽����� �޾ƿ´�.
			//	(�ٸ� �޽����� ������ �޴��� ������ �����Ͽ�  strRetCd, strRetDtlCd �� �޽����� ������ �ش�.
			strProcessMessage = getMessage( strRetCd, strRetDtlCd ); 


			if ( strRetCd == "1" ) // �Ǹ���������
			{
				alert( strProcessMessage ); //��� �޽��� ���
			}
			else // �Ǹ���������
			{

				//	����� ���� �Ǹ�Ƚ����ܰ� ���ǵ��� ������ ó���Ѵ�.
				if ( strRetDtlCd == "Y" )
				{
					//	ó�� ����� �Ǹ�Ƚ����� ���������� Ȯ���Ѵ�.
					var retVal = confirm( strProcessMessage + "\n\n" + getCheckMessage( "S31" ) );
					if ( retVal == true )
					{
						history.go( -1 );
						goSafeBlockExpt();
						return;
					}
					else
					{
						history.go( -1 );
						return;
					}
				}
				else if ( strRetDtlCd == "C" )
				{
					//	ó�� ����� �Ǹ���ǵ������� ���������� Ȯ���Ѵ�.
					alert( getMessage( strRetCd, strRetDtlCd ) + "\n\n" + getCheckMessage( "S32" ) );
					document.getElementById( "Message" ).value = getMessage( strRetCd, strRetDtlCd );
				}
				else
				{
					if ( strMsg != "" )
					{
						alert( strMsg );
						document.getElementById( "Message" ).value = "<%= oivsObject.message %>";
						history.go( -1 );
						return;
					}
					else
					{

						alert( strProcessMessage );
						document.getElementById( "Message" ).value = strProcessMessage;
					}

				}
			}
		}

	</script>

	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="javascript:loadAction();" >
<BR><BR>
		<table align="center" width="740" border="0" cellSpacing="1" cellpadding="8" bgcolor="#afafaf">
			<tr bordercolor="#000000">
	  			<td height="31" colspan="2" bgcolor="#f4f4f4">
					<b>�ѱ��ſ�����(��) ����/�ܱ��� �Ǹ�Ȯ�� ���� ���� ������ (���� ���� ���) </b>
				</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC" width="240">����޽���</td>
			  	<td bgcolor="#FFFFFF" width="500">
			  		<input type="text" id="Message" name="Message" style="width:100%" value="<%= oivsObject.message %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">����ڵ�</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="RetCd" name="RetCd" size="30" value="<%= oivsObject.retCd %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">��� ���ڵ�</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="RetDtlCd" name="RetDtlCd" size="30" value="<%= oivsObject.retDtlCd %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">���ΰ�������ڵ�</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="Minor" name="Minor" size="30" value="<%= oivsObject.minor %>">
			  	</td>
			</tr>
			<tr bordercolor="#000000">
	  			<td height="31" colspan="2" bgcolor="#f4f4f4">
					<b>����� �Է� �� ȸ���� ���� ����</b>
				</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">�Ǹ�����</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="UserNm" name="UserNm" size="30" value="<%= oivsObject.userNm %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">�ֹε������/�ܱ��ε�Ϲ�ȣ</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="ResIdNo" name="ResIdNo" size="30" value="<%= oivsObject.resIdNo %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">��ȸ����</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="InqRsn" name="InqRsn" size="30" value="<%= oivsObject.inqRsn %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">��/�ܱ��α���</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="Foreigner" name="Foreigner" size="30" value="<%= oivsObject.foreigner %>">
			  	</td>
			</tr>
			<tr>
				<td align="right" bgcolor="#CCCCCC">�ߺ�����Ȯ������</td>
			  	<td bgcolor="#FFFFFF">
			  		<input type="text" id="DupeInfo" name="DupeInfo" size="30" value="<%= oivsObject.dupeinfo %>">
			  	</td>
			</tr>
		</table>

	</body>
</html>