<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.scard.common.util.RequestUtil"%>

<div id="tab_title">공지사항</div>
<%@ include file="/WEB-INF/jsp/common/tab_header.jsp"%>
<%
	String searchBoardId = RequestUtil.getStringParameter(request, "search_boardId", "");
%>

<div id="tab_script">
<link rel="stylesheet" type="text/css" href="/css/et.css" />

<script type="text/javascript">
//Main Body Resizing
function autoResize(i)
{
    var iframeHeight=
    (i).contentWindow.document.body.scrollHeight;
    (i).height=iframeHeight+50;
}

</script>
</div>

<!-- top_visual -->
<div class="top_visual">
	<h1><img src="/images/et/h1_news.png" alt="삼성카드 공지사항을 확인하세요" /></h1>
</div>

<div class="content_block content_block_m0 clfix">
	<div class="tb_exp mt30 clfix">
		<iframe height="100%" width="100%" name="iframe" onload="autoResize(this);"src="/hp/im/et/evt/viewNHPIMETEVT010F.do?search_boardId=<%=searchBoardId %>" frameborder="0" marginwidth="0" name="iframe" scrolling="no" title="컨텐츠 프레임"></iframe>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/common/tab_footer.jsp"%>
