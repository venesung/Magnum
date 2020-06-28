<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>슈퍼S 이벤트 - 삼성카드</title>
<%
	//String loginYN = (String)request.getAttribute("loginYN");
	//String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
%>
<script language="javascript" type="text/javascript">

function eventGO(){

	if('${loginYN}' == "N"){
		setLogin();
		return;
	}

	<%if( endDateYN.equals("N")){ %>
		alert("<%=endMsg %>");
	<%}else if( beginDateYN.equals("N")){ %>
	  	alert("<%=beginMsg %>");
	<%}else{ %>	
	hiddenFrame.location.href="/hp/im/et/evt003.do?method=getSupersEventApply";
	<% } %>
	


}

function setLogin(){

	alert("로그인 하셔야 응모가 가능합니다.");
	parent.eventLogin('${cmsSeq}');
}

function resMsg(resCode){
	
	if(resCode == "12"){
		alert('이미 응모하셨습니다.');
		location.reload();
	}else if(resCode == "00"){
		alert('응모가 완료되었습니다.');
		location.reload();
	}else{
		alert('처리가 지연중입니다.');
		location.reload();
	}
	return;
}

</script>
<link rel="stylesheet" type="text/css" href="/css/cms/cms_carddetail.css" />
</head>



<body>
<img height="1020" src="/images/et/imagesscard_event_ci.jpg" width="728" useMap="#scard_event" border="0" alt="수퍼S카드 50%페이백 이벤트" />
<map id="scard_event" name="scard_event">
<area shape="rect" coords="111,913,277,954" href="javascript:eventGO();" alt="응모하기" />
<area shape="rect" coords="280,914,446,955" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1114');" alt="수퍼S카드 자세히 보기" />
<area shape="rect" coords="451,914,617,955" href="http://www.smartnbiz.co.kr/shoppingMall.aspx?no=SuperS_SKT" target="_blank" alt="갤럭시Tab 구매하기" title="새창" />
</map>
<iframe name="hiddenFrame" src="" width=0 height=0 title="빈프레임"></iframe>
</body>
</html>

