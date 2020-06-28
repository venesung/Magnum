<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/layer_pop_header.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="com.scard.hp.im.et.evt.vo.*" %>
<%@ page import="com.scard.hp.common.util.*" %>
<%
	ITFSEVENTLOGTT eventInfo = (ITFSEVENTLOGTT)request.getAttribute("eventInfo");
%>

<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/fs.css" />
<script language="javascript" type="text/javascript">
	function closeWin(){
		hide_con('id_layer03');
		show_select();
		closeLayerPopup();
	}
</script>
<div id="wrap">


	<!-- layer_popup 메세지 -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_alert">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeWin();" />
			<p class="pop_tit"><img src="/images/fs/layer_tit_congraturation.png" alt="축하합니다" /></p>
			<div class="pop_l_content">
				<p class="pop_l_alert"><strong class="t_blaack"><%=eventInfo.getGoodsRank() %>등</strong> 서비스포인트 <span class="t_point_org"><%=eventInfo.getGoodsName()==null?"":HpCommonUtil.getCommaStringForMoney(eventInfo.getGoodsName()) %> point</span>에 당첨되셨습니다.<br />당첨된 서비스포인트는 <span class="t_no">2010</span>년 <span class="t_no">8</span>월 <span class="t_no">10</span>일 확인가능합니다.</p>

				<p class="btnc"><a href="#" onclick="closeWin();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p>

			</div>
		</div>
	</div>


</div>
<script type="text/javascript" src="/js/common.js"></script>

