<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/layer_pop_header.jsp"%>

<script language="javascript" type="text/javascript">
	function closeWin(){
		hide_con('id_layer03');
		show_select();
		closeLayerPopup();
	}
</script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/fs.css" />
<!-- layer_pop_script -->
<div id="wrap">


	<!-- layer_popup 메세지 -->
	<div id="id_layer03" class="pop_l_position pop_l_wrap_alert">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeWin();" value="" title="" />
			<p class="pop_tit"><img src="/images/fs/layer_tit_youlose.png" alt="꽝! 다음기회를 이용해주세요" /></p>
			<div class="pop_l_content">
				<p class="pop_l_alert">응모기간 중 매일매일 응모가능 합니다.</p>

				<p class="btnc"><a href="#" onclick="closeWin();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p>

			</div>
		</div>
	</div>


</div>
<script type="text/javascript" src="/js/common.js"></script>
