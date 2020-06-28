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
			var userNo = document.pageForm.num;
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
				var strNo = document.pageForm.num.value;
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
				//var strReturnUrl	= "./ipin2.jsp"; //document.getElementById( "ReturnURL" ).value;
				var strReturnUrl= "http://<%=serverDomainName%>/sub/etc/ipin2.jsp"
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
String flag = request.getParameter("flag");
if (flag == null) 
{
	flag ="";
}

if (flag.equals("Y"))
{
	//#######################################################################################
	//#####
	//#####	개인/외국인 실명확인 서비스 소스 (실명확인요청)				한국신용정보(주)
	//#####	( Java )
	//#####
	//#####	================================================================================
	//#####
	//#####	* 본 페이지는 귀사의 서버에 복사해서 관리하십시오.
	//#####	  회원사에서 설정할 부분을 제외하고는 수정하거나 변경하지 마십시오.
	//#####	  (서비스 장애의 원인이 됩니다)
	//#####
	//#######################################################################################


	//=======================================================================================
	//=====	MAIN PROCESS
	//=======================================================================================

	/****************************************************************************************
	 *****	▣ 회원사 ID 설정 : 계약시에 발급된 회원사 ID를 설정하십시오. ▣
	 ****************************************************************************************/

	String strNiceId = "Nkogas02";

	/****************************************************************************************
	 *****	▣  NiceCheck.htm 에서 넘겨 받은 SendInfo 값을 복호화 하여 
	 *****		주민번호,성명 등 각각의 값을 세팅한다 ▣
	 ****************************************************************************************/

	OivsObjects oivsObjects = new OivsObjects();
	oivsObjects.clientData = request.getParameter( "SendInfo" );
	oivsObjects.desClientData();

	// 복호화 된 값은 아래 주석을 풀어 확인 가능합니다. 
	// (기존 회원 체크는 이 부분에서 하시면 됩니다.)
	/*
	out.println("<BR>성명 : "  + oivsObject.userNm);
	out.println("<BR>주민번호/외국인번호 : "  + oivsObject.resIdNo);
	out.println("<BR>조회사유코드 : "  + oivsObject.inqRsn);
	out.println("<BR>내/외국인 구분코드 : "  + oivsObject.foreigner);
	*/

	/****************************************************************************************
	 *****	▣ 실명확인 서비스를 호출한다. ▣
	 ****************************************************************************************/
	
	oivsObjects.niceId = strNiceId;
	oivsObjects.callService();


	/****************************************************************************************
	 *****	▣ 실명확인 서비스를 응답값을 처리한다. ▣

	 *****	strRetCd 와 strRetDtlCd를 이용하여 작업 하시면 됩니다.
	 *****	단! strRetDtlCd 가 Y,C인 경우는 개인의 설정에 의해 실명확인을 막아 놓은 상태이므로 
	 *****	관련스크립트는 수정하지 마시기 바랍니다.
	 ****************************************************************************************/

	//==================================================================================================================
	//				응답에 대한 결과 및 변수들에 대한 설명
	//------------------------------------------------------------------------------------------------------------------
	//
	//	< 한국신용정보 온라인 식별 서비스에서 제공하는 정보 >
	//
	//	oivsObject.message			: 오류 또는 정보성 메시지
	//	oivsObject.retCd			: 결과 코드(메뉴얼 참고) // cf. 한국신용정보 성명 등록 및 정정 페이지 : https://www.nuguya.com
	//	oivsObject.retDtlCd			: 결과 상세 코드(메뉴얼 참고)
	//	oivsObject.minor 			: 성인인증 결과 코드
	//									"1"	: 성인
	//									"2"	: 미성년
	//									"9"	: 확인 불가
	//
	//=================================================================================================================	//========================================================================================
	//=====	▣ 키스트링 80자리 세팅 ▣
	//========================================================================================
	String athKeyStr = "sx8pwv8JBjrQSSoqXXwzvcFdVf1VKR9Fn6Elzj0i9vFRBkam5lYiSuiSNL8ZleCNN2RXWGJd6ae7IsQ6";

	OivsObject oivsObject = new OivsObject(athKeyStr);

	String strRecvData 	= request.getParameter( "SendInfo" );
	boolean blProc = oivsObject.resolveClientData( strRecvData );
	
	
	// 해킹방지를 위해 세션에 저장된 값과 비교 .. 
	String ssOrderNo = session.getAttribute("niceOrderNo") == null ? "" : (String) session.getAttribute("niceOrderNo");
/*	if(!ssOrderNo.equals(oivsObject.ordNo)){
			out.println("세션정보가 존재하지 않습니다.");
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
				alert("실명확인 성공.");
				location.href="<%=session.getAttribute("url")%>";
			</script><noscript><p><strong>실명확인 성공!</strong>&nbsp;&nbsp;이 페이지는 스크립트가 작동하지 않습니다. 계속하시려면 <a href="<%=session.getAttribute("url")%>"><strong>여기</strong></a>를 클릭하세요</p></noscript>
<%
		}else{
%>
			<script type="text/javascript">
				alert("실명확인 실패.");
				//history.go(-2);
				location.href="/sub/etc/aut_id.jsp?flag=N";
			</script><noscript><p><strong>실명확인 실패!</strong>&nbsp;&nbsp;이 페이지는 스크립트가 작동하지 않습니다. 계속하시려면 <a href="/sub/etc/aut_id.jsp?flag=N"><strong>여기</strong></a>를 클릭하세요</p></noscript>
	<%

		}

} else {
	
	if(request.getServerPort() != 80){
		serverDomainName += ":"+request.getServerPort();
	}

//#######################################################################################
	//#####
	//#####	나이스아이핀(대체인증키) 서비스 샘플 페이지 소스				한국신용정보(주)
	//#####
	//#####	================================================================================
	//#####
	//#####	* 본 페이지는 귀사의 화면에 맞게 수정하십시오.
	//#####	  단, Head 영역에 설정된 Javascript를 수정하거나 변경하시면 사용할 수 없습니다.
	//#####
	//#######################################################################################


	//========================================================================================
	//=====	▣ 회원사 ID 설정 : 계약시에 발급된 회원사 ID를 설정하십시오. ▣
	//========================================================================================

	String NiceId = "Nkogas01"; //회원사 ID
	String SIKey = "N01090003581"; // 사이트식별 번호 12자리

	//========================================================================================
	//=====	▣ 반환 결과를 수신할 URL을 설정하십시오. (단, 페이지는 그대로 사용하십시오)
	//=====	   한신정 서비스에 전달되어 사용되므로 반드시 절대 URL 경로를 설정하셔야 합니다.
	//========================================================================================

	//EX) http://귀사의도메인/NiceCheckPopup.jsp
	//String ReturnURL = "http://www.kogas.or.kr:8070/kogas_kr/01_customer/question/qna_write.jsp?domain="+domain +"&gubun="+gubun ;
	if (!flag.equals("N"))
		session.setAttribute("url",request.getAttribute("ex"));
	//session.setAttribute("url",request.getHeader("Referer"));
	//out.println(request.getHeader("Referer"));
	//out.println(request.getRequestURL().toString());
	//out.println((String)request.getAttribute("ex"));
	
	String ReturnURL ="";

	ReturnURL ="http://"+serverDomainName+"/sub/etc/aut_id.jsp?flag=Y";
	//ReturnURL ="http://"+serverDomainName+"/kogas_kr/07_service/ipin/ipin2.jsp";
	
	String strOrderNo = "" ; //주문번호.. 매 요청마다 중복되지 않도록 유의
	
	//주문번호 생성예시
	Date d = new Date();
	strOrderNo =  (d.getYear()+1900) + ""
		+ ((d.getMonth() + 1) <10 ? "0" : "") + (d.getMonth() + 1) + ""
		+ (d.getDate() <10 ? "0" : "") + d.getDate() + ""
		+ Math.round(Math.random()*1000000000) + "";

	// 해킹방지를 위해 요청정보 세션에 저장
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
	list_gubun = request.getParameter("list_gubun"); //left menu 구분 
	
	if(list_gubun==null)
		list_gubun = "01";

	//이전페이지돌아가기(null일경우 홈으로)
	String exUrl  = request.getHeader("referer");
	if(exUrl == null || exUrl.equals("")) { exUrl = "http://www.kogas.or.kr/kogas_kr/html/main/main.jsp"; } 
%>

	<h2 class="hdh2"><img src="../../images/tit_aut.png" alt="인증센터"></h2>  

		<div class="hd_bt">
			<h3>인증센터</h3>
			<div class="btn_pre">
				<span  onclick="history.back(1);" class="npointer">이전화면</span>
			</div> 
		</div>		
	</div>
	
	<div class="cont" style="min-height:300px;"> 	
		<div  style="padding-top:30px;">
			
			<input type="hidden" id="NiceId" name="NiceId" value="<%= NiceId %>" />
			<input type="hidden" id="SIKey" name="SIKey" value="<%= SIKey %>" />
			<input type="hidden" id="PingInfo" name="PingInfo" value="<%= oivsObject.pingInfo %>" />
			<input type="hidden" id="ReturnURL" name="ReturnURL" value="<%= ReturnURL %>" />
			<!--	조회사유를 설정하십시오 ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '50'-기타 사유 )	-->
			<input type="hidden" id="InqRsn" name="InqRsn" value="10" />
			<!--	주문번호를 설정하십시오. (최소 14자리, 20자리미만)	-->
			<input type="hidden" id="OrderNo" name="OrderNo" value="<%=strOrderNo%>" />
			
			<div class="btn">
			
				<form id="reqForm" name="reqForm" method="post" action="">
					<input class="small" type="hidden" name="SendInfo" />
					<input class="small" type="hidden" id="ProcessType" name="ProcessType" />
				</form>
				<form name="inputForm" method="post" action="<%=ReturnURL%>">
					<input type="hidden" name="SendInfo" />
				</form>
				<form name="ipinForm" method="post" action="">
					<input type="hidden" id="NiceId" name="NiceId" value="<%= NiceId %>" />
					<input type="hidden" id="SIKey" name="SIKey" value="<%= SIKey %>" />
					<input type="hidden" id="PingInfo" name="PingInfo" value="<%= oivsObject.pingInfo %>" />
					<input type="hidden" id="ReturnURL" name="ReturnURL" value="<%= ReturnURL %>" />
					<!--	조회사유를 설정하십시오 ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '50'-기타 사유 )	-->
					<input type="hidden" id="InqRsn" name="InqRsn" value="10" />
					<!--	주문번호를 설정하십시오. (최소 14자리, 20자리미만)	-->
					<input type="hidden" id="OrderNo" name="OrderNo" value="<%=strOrderNo%>" />
					
				<a href="#notice-list"  onclick="return goIDCheckIpin();" onkeypress="this.onclick()"><img src="../../images/btn_ipin.gif"></a>
				
				</form>
			</div>
			
			<p class="bull01 mab20"><span class="pcolor_bluebold">아이핀(I-PIN)</span>은 인터넷상의 개인식별번호를 의미하며, 대면확인이 어려운 인터넷에서 주민등록번호를 사용하지 않고도 본인임을 확인할 수 있는 수단입니다.</p>
			
			<form name="frm" method="post" action="../etc/aut_id.jsp">
			<%
			String idx = request.getParameter("idx")==null?"":request.getParameter("idx");
			String pageIf = request.getParameter("pageIf")==null?"":request.getParameter("pageIf");
			String ListPage = request.getParameter("ListPage")==null?"":request.getParameter("ListPage");
			String checkpasswd = request.getParameter("checkpasswd")==null?"":request.getParameter("checkpasswd");
			String ex = (String)request.getAttribute("ex");
			%>
			<input type="hidden" name="idx" value="<%=idx%>"/>
			<input type="hidden" name="pageIf" value="<%=pageIf%>"/>
			<input type="hidden" name="ListPage" value="<%=ListPage%>"/>
			<input type="hidden" name="checkpasswd" value="<%=checkpasswd%>"/>
			<input type="hidden" name="ex" value="<%=ex%>"/>
			<div class="btn">
				<!-- <a href="javascript:toMove()"><img src="../../images/btn_numaut.gif"></a> -->
				<input type="image" src="../../images/btn_numaut.gif"/>
			</div>
			<p class="bull01">입력하신 주민등록번호는 저장되지 않고 본인확인 절차를 위해서만 이용됩니다.</p>
			</form>
		</div>

	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>
<%
}			
%>