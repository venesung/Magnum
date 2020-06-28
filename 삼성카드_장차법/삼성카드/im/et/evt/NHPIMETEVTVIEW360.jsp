<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>설맞이 소원성취 지원 프로젝트 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부
	String registStatus = (String)request.getAttribute("registStatus"); //당일웹가인여부(당일가입시 : N)
%>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11167');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
							  	
			<%}else{ %>
				<%if( premiumYn.equals("N")){ %>
					alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
				<%}else if( registStatus.equals("N")){ %>
					alert("죄송합니다. 웹멤버에 가입하신 다음날부터 참여하실 수 있습니다.\n※토/일요일,공휴일에 가입시 돌아오는 &lt;영업일+1일&gt;부터 참여 가능합니다.");
				<%}else{%>
					applyEvent();
				<%}%>
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}

	function applyOk(){
		alert("이벤트에 정상적으로 응모되셨습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=premiumDreamInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
</form>

<img src="/images/event/premiumDream_201101_01.jpg" alt="설맞이 소원성취지원 프로젝트" usemap="#myhome0107" />
<map name="myhome0107" id="myhome0107">
		<area shape="rect" coords="260,854,468,907" href="javascript:go_start();" alt="응모하기" />
		<area shape="rect" coords="305,971,390,987" href="javascript:parent.parent.goTabPage('NHPIMMHUFM001M001', true)" alt="신상정보 조회변경" />
		<area shape="rect" coords="232,1176,289,1193" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');"  alt="삼성카앤모아카드 자세히보기" />
		<area shape="rect" coords="497,1176,555,1193" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0169');"  alt="빅앤빅카드 자세히보기" />
		<area shape="rect" coords="426,1233,484,1248" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');"  alt="카앤모아카드 자세히보기" />
		<area shape="rect" coords="563,1233,620,1248" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428');"  alt="쇼핑앤모아카드 자세히보기" />
		<area shape="rect" coords="426,1269,490,1285" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0161');"  alt="아멕스블루카드 자세히보기" />
		<area shape="rect" coords="593,1267,652,1284" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0347');"  alt="할인카드 자세히보기" />
		<area shape="rect" coords="252,1340,311,1356" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0428');"  alt="이마트쇼핑앤모아카드 자세히보기" />
		<area shape="rect" coords="260,1405,318,1421" href="javascript:parent.parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0292');"  alt="신세계지앤미포인트카드 자세히보기" />
</map>

</body>

</html>

