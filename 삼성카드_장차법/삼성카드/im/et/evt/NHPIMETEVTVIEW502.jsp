
<%@ page import="java.util.ArrayList"%>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	
	String approve_no = (String)request.getAttribute("approve_no");
	String approve_amount = (String)request.getAttribute("approve_amount");
	String card_no = (String)request.getAttribute("card_no");
	String cardNoEnc = (String)request.getAttribute("cardNoEnc");
	String maskCardNo = (String)request.getAttribute("maskCardNo");
	maskCardNo=maskCardNo.replace("-","");
	int length = card_no.length();
	
%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<title>승인번호 등록 - 삼성카드</title>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			self.close();
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		///hp/im/et/evt003.do?method=applyExpo201205
        document.insertForm.submit();
		
	}


</script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
#pop_wrap{width: 460px; padding: 39px 0 24px 0; text-align: center; overflow: hidden; margin: 0 0 0 5px; }
#pop_wrap h2{padding: 0 0 20px 0;}
#pop_wrap .membershipText{padding: 0 0 142px 0;}

</style>

</head>

<body>

<form name="insertForm" method="post" action="/hp/im/et/evt003.do?method=applyExpo201205"
autocomplete="off" onsubmit='return applyEvent();'>
<input type="hidden" name="input"/>
<input type="hidden" name="CARD_NO" value="<%=card_no%>"/>
<input type="hidden" name="CARD_NO_ENC" value="<%=cardNoEnc%>"/>
<input type="hidden" name="APPROVE_NO2" value="<%=approve_no%>"/>
<input type="hidden" name="APPROVE_AMMOUNT2" value="<%=approve_amount%>"/>
<div id="pop_s_wrap">
	<!-- header -->
	<div id="pop_s_header">
		<h1><img src="/images/et/expo201205/h1_expo2.png" alt="승인번호 등록" /></h1>
	</div>
	<!-- content -->
	<div id="pop_wrap">
		<p><img src="/images/et/expo201205/txt_expo2.png" alt="여수에서 행운의3을 찾아라!" /></p>
		<p class="mt10"><img src="/images/et/expo201205/txt_expo3.png" alt="승인번호 등록" /></p>
		<p class="mt10 mb20">아래의 정보를 확인하시고, 확인 버튼을 클릭하시면 <br /><strong class="t_point">행운의 3 영수증 승인번호</strong> 등록이 완료 됩니다.</p>
		<table class="dtable02" summary="카드번호, 승인번호, 매출금액 등 승인번호등록하실 수 잇습니다." style="width:420px" >
				<caption>승인번호등록</caption>
				<colgroup><col width="20%" /><col width="80%" /></colgroup>
				<tbody>
					<tr>
						<th scope="row"><p> 카드번호</p></th>
						<td class="cell_l10"><input title="카드번호1" class="txt" type="text" value="<%=maskCardNo.substring(0,4) %>" style="ime-mode:disabled;width:45px;" disabled="disabled"/> -  
						<input title="카드번호2" class="txt" type="text" value="<%=maskCardNo.substring(4,8) %>" style="ime-mode:disabled;width:45px;" disabled="disabled"/> -  
						<input title="카드번호3" class="txt" type="text" value="<%=maskCardNo.substring(8,12) %>" style="ime-mode:disabled;width:45px;" disabled="disabled"/> -  
						<input title="카드번호4" class="txt" type="text" value="<%=maskCardNo.substring(12,length)%>" style="ime-mode:disabled;width:45px;" disabled="disabled"/> </td>
					</tr>
					<tr>
						<th scope="row"><p>승인번호</p></th>
						<td class="cell_l10"><input title="승인번호" class="txt" type="text" value="<%=approve_no%>" style="ime-mode:disabled;width:270px;" disabled="disabled"/></td>
					</tr>
					<tr>
						<th scope="row"><p>매출금액</p></th>
						<td class="cell_l10"><input title="매출금액" class="txt" type="text" value="<%= approve_amount %>" style="ime-mode:disabled;width:270px;" disabled="disabled"/></td>
					</tr>
				</tbody>
			</table>
            <p class="cBtn mt20"><a href="#" onClick="go_start();return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a> <a href="#" onClick="window.close();"><img src="/images/common/btn_s_cancel.png" alt="취소" /></a></p>
	</div>
	<!-- footer -->
	<div id="pop_s_footer2">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" class="btn_s_close btn_input" onclick="window.close();" title="창닫기" />
	</div>
</div>
</form>

<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>
</body>

</html>

