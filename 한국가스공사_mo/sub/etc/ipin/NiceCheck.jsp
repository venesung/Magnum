<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%@ include file="nice.nuguya.oivs.jsp" %>

<%

	//#######################################################################################
	//#####
	//#####	���̽�������(��ü����Ű) ���� ���� ������ �ҽ�				�ѱ��ſ�����(��)
	//#####
	//#####	================================================================================
	//#####
	//#####	* �� �������� �ͻ��� ȭ�鿡 �°� �����Ͻʽÿ�.
	//#####	  ��, Head ������ ������ Javascript�� �����ϰų� �����Ͻø� ����� �� �����ϴ�.
	//#####
	//#######################################################################################


	//========================================================================================
	//=====	�� ȸ���� ID ���� : ���ÿ� �߱޵� ȸ���� ID�� �����Ͻʽÿ�. ��
	//========================================================================================

	String NiceId = "Nkogas01"; //ȸ���� ID
	String SIKey = "N01090003581"; // ����Ʈ�ĺ� ��ȣ 12�ڸ�

	//========================================================================================
	//=====	�� ��ȯ ����� ������ URL�� �����Ͻʽÿ�. (��, �������� �״�� ����Ͻʽÿ�)
	//=====	   �ѽ��� ���񽺿� ���޵Ǿ� ���ǹǷ� �ݵ�� ���� URL ��θ� �����ϼž� �մϴ�.
	//========================================================================================

	//EX) http://�ͻ��ǵ�����/NiceCheckPopup.jsp
	String ReturnURL = "http://172.19.5.19/kogas_kr/01_customer/question/qna_list.jsp" ;
	String strOrderNo = "" ; //�ֹ���ȣ.. �� ��û���� �ߺ����� �ʵ��� ����
	
	//�ֹ���ȣ ��������
	Date d = new Date();
	strOrderNo =  (d.getYear()+1900) + ""
		+ ((d.getMonth() + 1) <10 ? "0" : "") + (d.getMonth() + 1) + ""
		+ (d.getDate() <10 ? "0" : "") + d.getDate() + ""
		+ Math.round(Math.random()*1000000000) + "";

	// ��ŷ������ ���� ��û���� ���ǿ� ����
	session.setAttribute("niceOrderNo" , strOrderNo);

	OivsObject oivsObject = new OivsObject();

%>

<html>
	<head>
		<title>�ѱ��ſ������ֽ�ȸ�� ��������Ű(��ü����Ű) ���� ���� ������</Title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

		<!--	==========================================================	-->
		<!--	�ѱ��ſ������ֽ�ȸ�� ó�� ��� (���� �� �������� ���ʽÿ�)	-->
		<!--	==========================================================	-->
		<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.crypto.js"></script>
		<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.msg.js"></script>
		<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.util.js"></script>

		<LINK href="./nice.nuguya.oivs.css" type=text/css rel=stylesheet>
	</head>

	<script language="javascript">

		document.onkeydown = onKeyDown;

		function onKeyDown( event )
		{
			var e = event;
			if ( event == null ) e = window.event;

			if ( e.keyCode == 13 ) goIDCheck();
		}

		function loadAction()
		{
			if ( document.all.PingInfo.value == "" )
			{
				alert( "�ѱ��ſ�����(��)�� ��������Ű ���񽺰� �������Դϴ�.\n����� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.\n\n���°� ��ӵǸ� ����Ʈ�����ڿ��� �����Ͻʽÿ�" );
				return;
			}
		}

		function validate()
		{
			var NiceId		= document.getElementById( "NiceId" );
			var PingInfo	= document.getElementById( "PingInfo" );
			var ReturnURL	= document.getElementById( "ReturnURL" );

			if ( NiceId.value == "" )
			{
				alert( getCheckMessage( "S60" ) );
				NiceId.focus();
				return false;
			}

			if ( PingInfo.value == "" )
			{
				alert( getCheckMessage( "S61" ) );
				return false;
			}

			if ( ReturnURL.value == "" )
			{
				alert( getCheckMessage( "S64" ) );
				ReturnURL.focus();
				return false;
			}

			return true;
		}

		function goIDCheck()
		{
			if ( validate() == true )
			{
				var strNiceId 	= document.getElementById( "NiceId" ).value;
				var strPingInfo	= document.getElementById( "PingInfo" ).value;
				var strOrderNo	= document.getElementById( "OrderNo" ).value;
				var strInqRsn	= document.getElementById( "InqRsn" ).value;
				var strReturnUrl	= document.getElementById( "ReturnURL" ).value;
				var strSIKey 	= document.getElementById( "SIKey" ).value;

				document.reqForm.SendInfo.value = makeCertKeyInfoPA( strNiceId, strPingInfo, strOrderNo, strInqRsn, strReturnUrl, strSIKey );
//				document.reqForm.SendInfo.value = makeCertKeyInfo( strNiceId, strPingInfo, strOrderNo, strInqRsn, strReturnUrl );
				document.reqForm.ProcessType.value = strPersonalCertKey;

				var popupWindow = window.open( "", "popupCertKey", "top=100, left=200, status=0, width=417, height=490" );
				document.reqForm.target = "popupCertKey";
				document.reqForm.action = strCertKeyServiceUrl;
				document.reqForm.submit();
				popupWindow.focus();
			}

			return;
		}

	</script>

	<BODY onLoad="javascript:loadAction();" >
		<FORM id="reqForm" name="reqForm" method="POST" action="">
			<input class="small" type="hidden" id="SendInfo" name="SendInfo" >
			<input class="small" type="hidden" id="ProcessType" name="ProcessType" >
		</FORM>
		<FORM id="pageForm" name="pageForm" method="POST" action="">
	  		<INPUT type="hidden" id="NiceId" name="NiceId" value="<%= NiceId %>">
	  		<INPUT type="hidden" id="SIKey" name="SIKey" value="<%= SIKey %>">
			<INPUT type="hidden" id="PingInfo" name="PingInfo" value="<%= oivsObject.pingInfo %>">
	  		<INPUT type="hidden" id="ReturnURL" name="ReturnURL" value="<%= ReturnURL %>" >
			<!--	��ȸ������ �����Ͻʽÿ� ( '10'-ȸ������, '20'-����ȸ�� Ȯ��, '30'-��������, '40'-��ȸ�� Ȯ��, '50'-��Ÿ ���� )	-->
			<input type="hidden" id="InqRsn" name="InqRsn" value="10">
			<!--	�ֹ���ȣ�� �����Ͻʽÿ�. (�ּ� 14�ڸ�, 20�ڸ��̸�)	-->
			<input type="hidden" id="OrderNo" name="OrderNo" value="<%=strOrderNo%>">

			<INPUT name="Confirm" type="button" id="Confirm" value="���̽� ������ ����" style="width:150px;" onclick="javascript:goIDCheck();">
		</form>
	</BODY>

</html>
