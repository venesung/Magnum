<%@ page contentType="text/html; charset=euc-kr"%>

<%@ include file="ipin/nice.nuguya.oivs.jsp" %>
<%@ include file="person/nice.nuguya.oivsperson.jsp" %>
<%String serverDomainName = request.getServerName();%>

<%@page import="java.sql.*, javax.sql.*,java.io.*, java.util.*,java.util.Date, javax.naming.*, java.text.*" %>

<%@ include file="../../inc/hd.jsp"%>

<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.crypto.js"></script>
<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.msg.js"></script>
<script type="text/javascript" src="http://secure.nuguya.com/nuguya/nice.nuguya.oivs.util.js"></script>

<script language="javascript" type="text/javascript">
<!--
		document.onkeydown = onKeyDown;

		function onKeyDown( event )
		{
			var e = event;
			if ( event == null ) e = window.event;

			if ( e.keyCode == 13 ) goIDCheck();
		}

		function lengthCheck( checkTag )
		{
			if ( checkTag.name == "num" )
			{
				if ( checkTag.value.length >= 13 )
				{
					checkTag.blur();
					document.all.num.focus();
				}
			}
		}

		function validate()
		{
			var userNm = document.pageForm.name;
			var userNo = document.pageForm.num1.value + document.pageForm.num2.value;
			var foreigner = document.pageForm.foreigner;

			if ( userNm.value == "" )
			{
				//alert( getCheckMessage( "S23" ) );
				userNm.focus();
				return false;
			}

			if ( userNo.value == "" )
			{
				if ( foreigner.value == "2" )
					alert( getCheckMessage( "S27" ) );
				else
					alert( getCheckMessage( "S21" ) );
				userNo1.value = "";
				userNo1.focus();
				return false;
			}

			if ( foreigner.value == "2" )
			{
				if ( checkForeignNm( userNm.value ) == false )
				{
					alert( getCheckMessage( "S28" ) );
					document.all.userNm.focus();
					return false;
				}

				if ( checkForeignNo( userNo ) == false )
				{
					alert( getCheckMessage( "S26" ) );
					document.all.userNo2.focus();
					return false;
				}
			}
			else
			{
				if ( checkString( userNm.value ) == false )
				{
					alert( getCheckMessage( "S24" ) );
					userNm.focus();
					return false;
				}

				if ( checkNumeric( userNo ) == false )
				{
					alert( getCheckMessage( "S25" ) );
					userNo1.focus();
					return false;
				}
			}

			return true;
		}

		function goIDCheck()
		{
			if ( validate() == true )
			{
				var strNm = document.pageForm.name.value;
				var strNo = document.pageForm.num1.value + document.pageForm.num2.value;
				var strRsn = document.pageForm.inqRsn.value;
				var strForeigner = document.pageForm.foreigner.value;
				//document.inputForm.SendInfo.value = makeSendInfo( strNm, strNo, strRsn, strForeigner );
				document.pageForm.SendInfo.value = makeSendInfo( strNm, strNo, strRsn, strForeigner );
				return;
				//var form = document.inputForm;
				//form.submit();
			}
			return false;
		}

		function validateIpin()
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

		function goIDCheckIpin()
		{
			if ( validateIpin() == true )
			{
				var strNiceId 	= document.getElementById( "NiceId" ).value;
				var strPingInfo	= document.getElementById( "PingInfo" ).value;
				var strOrderNo	= document.getElementById( "OrderNo" ).value;
				var strInqRsn	= document.getElementById( "InqRsn" ).value;
				var strReturnUrl	= "./ipin2.jsp"; //document.getElementById( "ReturnURL" ).value;
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
//-->
</script>

<%
String idx = request.getParameter("idx");
String pageIf = request.getParameter("pageIf");
String ListPage = request.getParameter("ListPage");
String checkpasswd = request.getParameter("checkpasswd");
String ex = request.getParameter("ex");
String nextPage;


session.setAttribute("idx",idx);
session.setAttribute("pageIf",pageIf);
session.setAttribute("ListPage",ListPage);
session.setAttribute("checkpasswd",checkpasswd);


if(idx.equals(""))
	nextPage = ex;
else
	nextPage = ex + "?idx="+idx+"&pageIf="+pageIf+"&ListPage="+ListPage+"&checkpasswd="+checkpasswd;

String flag = request.getParameter("flag");
if (flag == null) 
{
	flag ="";
}



if (flag.equals("Y"))
{
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

	String strNiceId = "Nkogas02";

	/****************************************************************************************
	 *****	��  NiceCheck.htm ���� �Ѱ� ���� SendInfo ���� ��ȣȭ �Ͽ� 
	 *****		�ֹι�ȣ,���� �� ������ ���� �����Ѵ� ��
	 ****************************************************************************************/

	OivsObjects oivsObjects = new OivsObjects();
	oivsObjects.clientData = request.getParameter( "SendInfo" );
	oivsObjects.desClientData();

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
	
	oivsObjects.niceId = strNiceId;
	oivsObjects.callService();


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
	//=================================================================================================================	//========================================================================================
	//=====	�� Ű��Ʈ�� 80�ڸ� ���� ��
	//========================================================================================
	String athKeyStr = "sx8pwv8JBjrQSSoqXXwzvcFdVf1VKR9Fn6Elzj0i9vFRBkam5lYiSuiSNL8ZleCNN2RXWGJd6ae7IsQ6";

	OivsObject oivsObject = new OivsObject(athKeyStr);

	String strRecvData 	= request.getParameter( "SendInfo" );
	boolean blProc = oivsObject.resolveClientData( strRecvData );
	
	
	// ��ŷ������ ���� ���ǿ� ����� ���� �� .. 
	String ssOrderNo = session.getAttribute("niceOrderNo") == null ? "" : (String) session.getAttribute("niceOrderNo");
/*	if(!ssOrderNo.equals(oivsObject.ordNo)){
			out.println("���������� �������� �ʽ��ϴ�.");
	}
	session.setAttribute("niceOrderNo" , "");*/

	//session.setAttribute("uID",oivsObjects.userNm);
	String retCd = oivsObjects.retCd;
	//retCd = retCd == "" ? "!" : retCd;
	String retDtlCd = oivsObjects.retDtlCd;
	String message = oivsObjects.message;
	String target = request.getRequestURI() + "?" + request.getQueryString();
	String paKey = oivsObject.paKey;
	if(retCd.equals("1")){
		String uID ="";
		String pwd ="";
		uID = oivsObjects.userNm;
		pwd = oivsObjects.dupeinfo;
		if(uID != null && !uID.equals("")) {
			session.setAttribute("uID",uID);
		}
	%>
			<script type="text/javascript">
				alert("�Ǹ�Ȯ�� ����.");
				location.href="<%=session.getAttribute("url")%>";
			</script><noscript><p><strong>�Ǹ�Ȯ�� ����!</strong>&nbsp;&nbsp;�� �������� ��ũ��Ʈ�� �۵����� �ʽ��ϴ�. ����Ͻ÷��� <a href="<%=session.getAttribute("url")%>"><strong>����</strong></a>�� Ŭ���ϼ���</p></noscript>
<%
		}else{
%>
			<script type="text/javascript">
				alert("�Ǹ�Ȯ�� ����.");
				//history.go(-2);
				location.href="/sub/etc/aut_id.jsp?flag=N";
			</script><noscript><p><strong>�Ǹ�Ȯ�� ����!</strong>&nbsp;&nbsp;�� �������� ��ũ��Ʈ�� �۵����� �ʽ��ϴ�. ����Ͻ÷��� <a href="/sub/etc/aut_id.jsp?flag=N"><strong>����</strong></a>�� Ŭ���ϼ���</p></noscript>
	<%

		}

} else {
	
	if(request.getServerPort() != 80){
		serverDomainName += ":"+request.getServerPort();
	}

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
	//String ReturnURL = "http://www.kogas.or.kr:8070/kogas_kr/01_customer/question/qna_write.jsp?domain="+domain +"&gubun="+gubun ;
	if (!flag.equals("N"))
	{
		System.out.println("url session set >> "+ex);
		session.setAttribute("url", ex);
	}
	//session.setAttribute("url",request.getHeader("Referer"));
	//out.println(request.getHeader("Referer"));
	//out.println(request.getRequestURL().toString());
	//out.println((String)request.getAttribute("ex"));
	
	String ReturnURL ="";

	ReturnURL ="http://"+serverDomainName+"/sub/etc/aut_id.jsp?flag=Y";
	//ReturnURL ="http://"+serverDomainName+"/kogas_kr/07_service/ipin/ipin2.jsp";
	
	String strOrderNo = "" ; //�ֹ���ȣ.. �� ��û���� �ߺ����� �ʵ��� ����
	
	//�ֹ���ȣ ��������
	Date d = new Date();
	strOrderNo =  (d.getYear()+1900) + ""
		+ ((d.getMonth() + 1) <10 ? "0" : "") + (d.getMonth() + 1) + ""
		+ (d.getDate() <10 ? "0" : "") + d.getDate() + ""
		+ Math.round(Math.random()*1000000000) + "";

	// ��ŷ������ ���� ��û���� ���ǿ� ����
	session.setAttribute("niceOrderNo" , strOrderNo);

	OivsObjects oivsObjects = new OivsObjects();
	OivsObject oivsObject = new OivsObject();

	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
	
	String mn = "1442";
	
	int no = 0;
	String title	= null;
	String writer	= null;
	String regdate	= null;
	String cnt		= null;
	
	String onMenu = "1";
	
	String left_menu = "";
	String list_gubun = "";
	String left_top_img = "";
	String left_top_alt = "";
	String content_top_alt = "";
	String content_top_img = "";
	list_gubun = request.getParameter("list_gubun"); //left menu ���� 
	
	if(list_gubun==null)
		list_gubun = "01";

	//�������������ư���(null�ϰ�� Ȩ����)
	String exUrl  = request.getHeader("referer");
	if(exUrl == null || exUrl.equals("")) { exUrl = "http://www.kogas.or.kr/kogas_kr/html/main/main.jsp"; } 
%>

	<h2 class="hdh2"><img src="../../images/tit_aut.png" alt="��������"></h2>  

		<div class="hd_bt">
			<h3>��������</h3>
			<div class="btn_pre">
				<span  onclick="history.back(1);" class="npointer">����ȭ��</span>
			</div> 
		</div>		
	</div>
	
	<div class="cont1"> 

		<form name="pageForm" method="post" action="<%=ReturnURL%>" onsubmit="return goIDCheck();">
			<input type="hidden" name="idx" value="<%=idx%>"/>
			<input type="hidden" name="pageIf" value="<%=pageIf%>"/>
			<input type="hidden" name="ListPage" value="<%=ListPage%>"/>
			<input type="hidden" name="checkpasswd" value="<%=checkpasswd%>"/>
			<input type="hidden" name="ex" value="<%=ex%>"/>
			
		<!--	��/�ܱ��� ������ �����Ͻʽÿ�. ( '1'-������, '2'-�ܱ��� )	-->
			<input type="hidden" id="foreigner" name="foreigner" value="1" />
		<!--	��ȸ������ �����Ͻʽÿ�. ( '10'-ȸ������, '20'-����ȸ�� Ȯ��, '30'-��������, '40'-��ȸ�� Ȯ��, '90'-��Ÿ ���� )	-->
			<input type="hidden" id="inqRsn" name="inqRsn" value="10" />
			<input type="hidden" name="SendInfo" />
			
		<strong class="bull01block">�̸�</strong>
		<input name="name" type="text" class="aut_input">
		<strong class="bull01block">�ֹε�Ϲ�ȣ</strong>
		<div class="aut_inputbx">
			<input name="num1" type="password" class="aut_input" style="min-width:20%;max-width:40%;" size="6">
			<img src="../../images/hyphen.gif">
			<input name="num2" type="password" class="aut_input" style="min-width:20%;max-width:40%;" size="7">
		</div>

		 <div class="text_center">
			<input type="image" src="../../images/btn_bigok.gif" alt="">
		</div>
		
		</form>
	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>
<%
}			
%>