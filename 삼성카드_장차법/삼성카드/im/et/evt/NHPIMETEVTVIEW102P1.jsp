
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="com.scard.hp.common.util.HpCommonUtil"%>
<%@page import="com.scard.hp.im.et.evt.vo.NHPIMETEVT001VO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<%
	ArrayList<NHPIMETEVT001VO> resultList = (ArrayList<NHPIMETEVT001VO>)request.getAttribute("resultList");

%>

<title>신용카드 복권 이벤트 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/et.css" />
<style type="text/css">.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}</style>
</head>
<body>

<div id="pop_s_wrap">
	<!-- header -->
	<%if(resultList.size() > 1){ 
	%>
	<div id="pop_s_header3">
		<h1 class="al_center"><img alt="축하드립니다. 신용카드복권에 당첨되셨습니다." src="/images/et/layer_tit_prize_win.png" /></h1>
	</div>

	<!-- content -->
	<div id="pop_s_content3">
		<div class="pop_l_wrap">
			<% for(NHPIMETEVT001VO resultVo01 : resultList){ 
					if(!"".equals(resultVo01.getIdenNo())){%>
			<p class="mb5">신용카드 영수증 복권제 <span class="t_no"><%=resultVo01.getYyyy() %></span>년 <span class="t_no"><%=resultVo01.getMm() %></span>월 추첨에서 당첨되셨습니다. </p>
			<%}
			} %>
			<table class="dtable02 mb10" summary="당첨확인을 하실 수 있습니다.">
			<caption class="hidden">당첨확인</caption>
			<colgroup><col width="115" /><col width="*" /></colgroup>
			<tbody>
				<!-- loop -->
				<% for(NHPIMETEVT001VO resultVo : resultList){ 
					if(!"".equals(resultVo.getIdenNo())){%>
				<tr>
					<th scope="row"><p><%=resultVo.getGrade()%>등</p></th>
					<td><p><strong class="t_point_org"><span class="t_no t_point_org"><%=HpCommonUtil.getCommaStringForMoney(resultVo.getAmount())%></span> 원</strong></p></td>
				</tr>
				<%}
				} %>
				<!-- //loop -->
			</tbody>
			</table>
			<p class="t_desc03">당첨금 수령은 <a href="javascript:goTabPageWithParam('NHPIMETEVT101','menuIdx=1');" class="a_point">영수증 복권제도 시행안내</a>를 참고하시기 바랍니다.<br />앞으로도 저희 삼성카드에 변함없는 성원 부탁 드립니다. </p>
		</div>
			
		<p class="btnc"><a href="javascript:window.close()"><img alt="확인" src="/images/common/btn_s_confirm02.png" /></a></p>	
	</div>

	<!-- footer -->
	<div id="pop_s_footer2">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<input type="button" title="창닫기" onClick="window.close();" class="btn_s_close btn_input" />
	</div>
	<%}else{ %>
		<%NHPIMETEVT001VO faultVo = (NHPIMETEVT001VO)resultList.get(0); %>
	<!-- header -->
		<div id="pop_s_header3">
			<h1 class="al_center"><img alt="죄송합니다. 당첨되지 않으셨습니다." src="/images/et/layer_tit_prize_fail.png" /></h1>
		</div>
	
		<!-- content -->
		<div id="pop_s_content3">
			<div class="pop_l_wrap">
				<p class="al_center">신용카드 영수증 복권제  <span class="t_no"><%=faultVo.getYyyy() %></span>년 <span class="t_no"><%=faultVo.getMm() %></span>월  추첨에서  당첨되지 않으셨습니다. <br />앞으로도 저희 삼성카드에 변함없는 성원 부탁 드립니다.</p>
			</div>
				
			<p class="btnc"><a href="javascript:window.close()"><img alt="확인" src="/images/common/btn_s_confirm02.png" /></a></p>	
		</div>
	
		<!-- footer -->
		<div id="pop_s_footer2">
			<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
			<input type="button" title="창닫기" onClick="window.close();" class="btn_s_close btn_input" />
		</div>
	
	<%} %>
</div>
</body>
</html>