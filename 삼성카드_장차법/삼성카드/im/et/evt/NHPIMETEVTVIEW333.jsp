<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>스키장 이벤트 - 삼성카드</title>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
.premium_close {width:590px; height:27px; background:url('/images/et/shopopen/event_premium_close.jpg') repeat-x; text-align:right; padding-top:3px; padding-right:20px}
.nottoday {color:#999; font:normal 11px "돋움"; letter-spacing:-1px;}
input.chk, input.rdo	{width:13px; height:13px; margin:2px; vertical-align:middle}
</style>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/et.css" />
<script language="javascript" type="text/javascript">

	function go_login()
	{
		//parent.document.getElementById("wrap").focus();
        parent.scardLogin('/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=11070','eventLogin');  

    }

	function goDetail(cmsSeq,newSeq){
		try {
                 parent.tabSubmit("/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq="+cmsSeq+"&amp;newSeq="+newSeq,"");
	 			parent.submit_eventLog(); 
	 		} catch (e) {
                 parent.parent.tabSubmit("/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq="+cmsSeq+"&amp;newSeq="+newSeq,"true");
	 		} 

	}

	function goSaigon()
	{
		
		window.open("http://www.miss-saigon.co.kr/", "saigon");

		try{
			parent.submit_eventLog(); 
		}catch (e) {
		}
	}
	function applyEvent() {
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	function postponePop() {
		setCookie("EVTOPENSHOP","Y",1);
		window.close();
	}

	function setCookie(name, value, expiredays){
	    var todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}

	</script>

<%
	String loginYN = (String)request.getAttribute("loginYN");
	String eventIngYN = (String)request.getAttribute("eventIngYN");
	String strGubun = (String)request.getAttribute("strGubun");

%>
</head>

<body>

<div style="position:relative">
	<!-- 오크밸리 layer -->
	<div id="lay_oakvalley" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_oakvalley.jpg" alt="오크밸리"  usemap="#oakvalley" />
		<map name="oakvalley" id="oakvalley">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';" />
			<area shape="rect" coords="165,250,306,280" alt="오크밸리 바로가기" href="http://www.oakvalley.co.kr/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 오크밸리 layer -->
	<!-- 휘닉스파크 layer -->
	<div id="lay_phoenix" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_phoenixpark.jpg" alt="휘닉스파크"  usemap="#phoenixpark" />
		<map name="phoenixpark" id="phoenixpark">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_phoenix').style.display='none';" />

	<%
		if(loginYN.equals("N"))
		{
	%>
	<area shape="rect" coords="364,91,438,111" href="#" alt="쿠폰출력하기" onclick="go_login();" />
	<%
		}
		if( loginYN.equals("Y"))
		{
			if( strGubun.equals("I") || strGubun.equals("V") || strGubun.equals("W") || strGubun.equals("S")|| strGubun.equals("P"))
			{
	%>
				<area shape="rect" coords="364,91,438,111" alt="쿠폰출력하기" href="#" onclick="window.open('/hp/im/et/evt003.do?method=openSki2010Event', 'popup', 'width=710px, height=575px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" title="새창">
			<%
			}
			else
			{
		%>
			<area shape="rect" coords="364,91,438,111" alt="쿠폰출력하기" href="#" id="NHPIMETEVTVIEW333_L01" onclick="document.getElementById('id_layer03').style.display='block';fnSetReturnFocusId('NHPIMETEVTVIEW333_L01','id_layer03');" />
		<%
			}
		}
	%>	

			

			
			<area shape="rect" coords="165,250,317,280" alt="휘닉스파크 바로가기" href="http://www.phoenixpark.co.kr/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 휘닉스파크 layer -->
	<!-- 무주리조트 layer -->
	<div id="lay_muju" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_mujuresort.jpg" alt="무주리조트"  usemap="#mujuresort" />
		<map name="mujuresort" id="mujuresort">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_muju').style.display='none';" />
			<area shape="rect" coords="165,241,306,268" alt="무주리조트 바로가기" href="http://www.mujuresort.com/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 무주리조트 layer -->
	<!-- 알펜시아 layer -->
	<div id="lay_alpensia" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_alpensia.jpg" alt="알펜시아"  usemap="#alpensia" />
		<map name="alpensia" id="alpensia">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_alpensia').style.display='none';" />
			<area shape="rect" coords="165,234,306,262" alt="알펜시아 바로가기" href="http://www.alpensia.com/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 알펜시아 layer -->
	<!-- 베어스타운 layer -->
	<div id="lay_bears" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_bearstown.jpg" alt="베어스타운"  usemap="#bearstown" />
		<map name="bearstown" id="bearstown">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_bears').style.display='none';" />
			<area shape="rect" coords="164,251,318,277" alt="베어스타운 바로가기" href="http://www.bearstown.com/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 베어스타운 layer -->
	<!-- 에덴밸리 layer -->
	<div id="lay_eden" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_edenvalley.jpg" alt="에덴밸리"  usemap="#edenvalley" />
		<map name="edenvalley" id="edenvalley">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_eden').style.display='none';" />
			<area shape="rect" coords="165,214,306,241" alt="에덴밸리 바로가기" href="http://www.edenvalley.co.kr/" target="_blank" title="새창" />
		</map>
	</div>
	<!-- // 에덴밸리 layer -->
	<!-- 자세히보기 layer -->
	<div id="lay_benefit" style="display:none; position:absolute; top:220px; left:120px">
		<img src="/images/cm/ski2010/pop_img_skibenefit.jpg" alt="자세히보기"  usemap="#benefit" />
		<map name="benefit" id="benefit">
			<area shape="rect" coords="432,12,460,37" alt="CLOSE" href="#" onclick="document.getElementById('lay_benefit').style.display='none';" />
			<area shape="rect" coords="165,250,338,280" alt="자세히보기" href="javascript:parent.goTabPageWithParam('NHPIMMHPIT045','kind_code=P0505');" />
		</map>
	</div>
	<!-- // 자세히보기 layer -->
</div>
<!-- // 퀴즈풀기 -->
<p><img src="/images/cm/ski2010/event_ski101130.jpg" alt="스키장에서 무엇을 원하든, 삼성카드!" usemap="#event_101130" /></p>

<map name="event_101130" id="event_101130">
<area shape="rect" coords="82,334,263,455" alt="오크밸리" href="#" onclick="document.getElementById('lay_oakvalley').style.display='block';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="276,334,455,455" alt="휘닉스파크" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='block';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="468,334,647,455" alt="무주리조트" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='block';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="82,528,263,647" alt="알펜시아" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='block';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="276,528,455,647" alt="베어스타운" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='block';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="468,528,647,647" alt="에덴밸리" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='block';document.getElementById('lay_benefit').style.display='none';"/>
<area shape="rect" coords="513,478,615,501" alt="자세히보기" href="#" onclick="document.getElementById('lay_oakvalley').style.display='none';document.getElementById('lay_phoenix').style.display='none';document.getElementById('lay_muju').style.display='none';document.getElementById('lay_alpensia').style.display='none';document.getElementById('lay_bears').style.display='none';document.getElementById('lay_eden').style.display='none';document.getElementById('lay_benefit').style.display='block';"/>
<area shape="rect" coords="233,952,363,976" alt="삼성카앤모아카드 혜택 상세보기" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0505');" />
<area shape="rect" coords="233,1065,363,1088" alt="삼성후불하이패스카드 혜택 상세보기" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0598');" />
</map>




	<div id="id_layer03" class="pop_l_position pop_l_wrap_alert" style="display:none; position:absolute; top:220px; left:120px">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';closeLayerPopup();" value="레이어닫기" title="쿠폰안내 레이어 닫기" />
			<p class="pop_tit2"><img src="/images/cm/ski2010/layer_tit_premium_coupon.png" alt="프리미엄 회원을 위한 쿠폰입니다."/></p>
			<div class="pop_l_content">
				<p class="pop_l_alert">회원님께서도 <span class="t_point_org">삼성카드 프리미엄 회원</span>으로 꼭 선정되시어<br />풍성한 혜택과 서비스를 누리시기 바랍니다.</p>

                <p class="btnc"><a href="#" onclick="document.getElementById('id_layer03').style.display='none';closeLayerPopup();return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p>

			</div>
		</div>
	</div>
	

	

<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyShopOpenEvent" method="post">
</form>
</body>

</html>

