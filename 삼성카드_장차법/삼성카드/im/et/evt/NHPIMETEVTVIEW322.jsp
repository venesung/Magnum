<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>추석맞이 알뜰쇼핑 이벤트 - 삼성카드</title>
<script language="javascript" type="text/javascript">
	function Go() {
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
</script>
</head>

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyPremiumChoosuck" method="post">
<input type="hidden" name="eventgubun" id="eventgubun" value="" />
</form>

<img src="/images/et/eventMH_100825.jpg" alt="추석맞이 알뜰쇼핑 이벤트" usemap="#event_100825" border="0"/>

<map name="event_100825" id="event_100825">
<area shape="rect" coords="526,392,640,465" alt="이벤트 응모하기" href="javascript:Go();" />
<area shape="rect" coords="610,768,700,793" alt="이마트삼성쇼핑앤모아카드 자세히보기" href="/link/index.jsp?url=CARD?kindCode=P0428" target="_top" />
<area shape="rect" coords="610,1024,700,1048" alt="신세계지앤미포인트카드 자세히보기" href="/link/index.jsp?url=CARD?kindCode=P0292" target="_top" />
<area shape="rect" coords="528,1120,615,1135" alt="신상정보 조회/변경" href="/link/index.jsp?menuId=NHPIMMHUFM001M001" target="_top" />
</map>

</body>
</html>

