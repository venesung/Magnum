<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/layer_pop_header.jsp"%>
<script type="text/javascript" src="/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/fs.css" />
<%@ page import="com.scard.hp.im.et.evt.vo.*" %>
<%
	ITFSEVENTLOGTT eventInfo = (ITFSEVENTLOGTT)request.getAttribute("eventInfo");
%>

<script language="javascript" type="text/javascript">
	function closeWin(){
		hide_con('id_layer03');
		show_select();
		closeLayerPopup();
	}
</script>
<div id="layer_pop_script">
	<!-- layer_popup 메세지 -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_alert">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeWin();"  />
			<p class="pop_tit"><strong class="t_black t_no">회원님은  <%=eventInfo.getApplyDt() %>일에 서비스 포인트 <%=eventInfo.getGoodsName() %>점에 이미 당첨되셨습니다.</strong></p>
			<div class="pop_l_content">
				<p class="pop_l_alert">이벤트 당첨은 응모기간 중 1회만 가능합니다.<br />당첨된 포인트는 8 월 10일 확인 가능합니다.</p>

				<p class="btnc"><a href="#" onclick="closeWin();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p>

			</div>
		</div>
	</div>
</div>