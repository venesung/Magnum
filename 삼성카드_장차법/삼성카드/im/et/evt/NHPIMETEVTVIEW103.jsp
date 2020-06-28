 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="tab_title"></div>
<%@include file="/WEB-INF/jsp/common/tab_header.jsp" %>

<!-- tab_script -->
<div id="tab_script">
	<link rel="stylesheet" type="text/css" href="/css/et.css" />
	<link rel="stylesheet" type="text/css" href="/css/main.css" />
</div>
<!-- top_visual -->
<div class="top_visual">
<!-- 2012.12.28 VOC 삭제 추가 start -->
<!-- 	<h1><img src="/images/et/h1_event.png" alt="삼성카드와 다양한 이벤트를 즐기세요" /></h1> -->
	<h1><img src="/images/et/h1_event_4.gif" alt="럭투유카드" /></h1>
<!-- 2012.12.28 VOC 삭제 추가 end -->
</div>
<!-- content_block -->
<div class="content_block content_block_card">
	<div class="tab01 w810 h60">
		<ul id="tab">
<!-- 2012.12.28 VOC 삭제 start -->
<!-- 
            <li><a href="javascript:goTabPage('NHPIMETEVT001',true);return false;">진행중인 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT002',true);return false;">종료된 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT003',true);return false;">당첨자발표</a></li>
 -->
            <!--<li><a href="javascript:goTabPage('NHPIMETEVT101',true);return false;">생활영수증복권제도</a></li>
            -->
<!-- 
            	<li class="on"><a href="javascript:goTabPage('NHPIMETEVT103',true);return false;">럭투유카드</a>
				<ul class="sub_tab">
                    <li class="on"><a href="javascript:goTabPage('NHPIMETEVT103',true);return false;">럭투유카드 안내</a></li>
                    <li><a href="javascript:goTabPage('NHPIMETEVT104',true);return false;">이용 및 혜택 안내</a></li>
                    <li><a href="javascript:goTabPage('NHPIMETEVT105',true);return false;">당첨여부확인</a></li>
				</ul>
			</li>
 -->
<!-- 2012.12.28 VOC 삭제 end -->
<!-- 2012.12.28 VOC 추가 start -->
             <li class="on"><a href="javascript:goTabPage('NHPIMETEVT103',true);">럭투유카드 안내</a></li>
             <li><a href="javascript:goTabPage('NHPIMETEVT104',true);">이용 및 혜택 안내</a></li>
             <li><a href="javascript:goTabPage('NHPIMETEVT105',true);">당첨여부확인</a></li>
<!-- 2012.12.28 VOC 추가 end -->
		</ul>
	</div>
</div>

<!--cms_content시작-->
<div id="cma_content">
	<cms:include page="/cms_content/hp/im/et/evt/NHPIMETEVTVIEW103C1.html" flush="false" />
</div>
<!--cms_content끝-->
<%@ include file="/WEB-INF/jsp/common/tab_footer.jsp" %>
