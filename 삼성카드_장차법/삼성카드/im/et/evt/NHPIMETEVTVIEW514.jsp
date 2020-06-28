
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='/WEB-INF/anyframe-page.tld' prefix='anyframe' %>
<%@page import="com.scard.hp.im.mh.kvp.vo.NHPIMMHKVP002VO"%>
<%@page import="com.scard.hp.im.mh.kvp.vos.NHPIMMHKVP001VOS"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.adobe.agl.text.DecimalFormat"%>

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<title>승인번호 등록 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	
	DecimalFormat df=new DecimalFormat("###,###.##");
	NHPIMMHKVP002VO cvo = new NHPIMMHKVP002VO();
	NHPIMMHKVP001VOS vos = (NHPIMMHKVP001VOS)request.getAttribute("vos");
	if ( vos == null ) {
		vos = new NHPIMMHKVP001VOS();
	}
	ArrayList<NHPIMMHKVP002VO> resultList = (ArrayList<NHPIMMHKVP002VO>)vos.getListPage();
	if ( resultList == null ) {
		resultList = new ArrayList();
	}
	
%>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			self.close();
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//window.open('/hp/im/et/evt003.do?method=setExpo201205', 'expop201205', 'width=470px, height=439px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}

	function three_event(card_no,approve_no,approve_amount,approve_date) {
		document.frm.approve_no.value = approve_no;
		document.frm.approve_amount.value = approve_amount;
		document.frm.card_no.value = card_no;
		document.frm.approve_date.value = approve_date;
		var winl = (screen.width - 400) / 2;
		var wint = (screen.height - 350) / 2;
        var url = "/hp/im/et/evt003.do?method=set500ma&amp;approve_no="+approve_no+"&amp;approve_amount="+approve_amount+"&amp;card_no="+card_no+"&amp;approve_date="+approve_date;
        open(url,'500ma','width=470,height=439, scrollbars=no,toolbar=no,status=no,reize=no,menubar=no');
	}
</script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css">
#pop_content3{width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}

.paginate01{padding: 18px 0 0 16px;}
.paginate01 .ppage{width: 73px; overflow: hidden; padding: 3px 86px 0 0; float: left;}
.paginate01 .ppaging{width: 474px; overflow: hidden;float: left;}
.paginate_line	{border-top:1px solid #F4F4F4}
.paginate01	.ppaging	.btn	{margin:0 9px 0 8px}
.paginate01	.num	 {overflow:hidden}
.paginate01	.num	 a:first-child	{background:0 none}
.paginate01	.num	 a	{display:inline-block; width:20px; height:20px; background:url('/images/common/page_bar.png') no-repeat 0 center; font:normal 11px "돋움"; line-height:20px; text-align:center}
.paginate01	.num	 strong	{height:20px; color:#333; font:bold 11px "돋움"; line-height:20px}
.paginate01	.ppage	em	{color:#333; font:normal 11px "돋움"}
.paginate01	.btnr	{position:absolute; right:0; top:2px}
.paginate01	.btnl	{position:absolute; left:0; top:2px}
.dtable01 td {font-size:11px;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

</head>

<body>
<form name="frm" autocomplete="off" action="">
<input type="hidden" name="approve_no" value=""/>
<input type="hidden" name="approve_amount" value=""/>
<input type="hidden" name="card_no" value=""/>
<input type="hidden" name="chain_no" value=""/>
<input type="hidden" name="installments" value=""/>
<input type="hidden" name="approve_date" value=""/>
<input type="hidden" name="blue_chain_no" value=""/>
</form>
<!-- 팝업사이즈 710*649 -->
<div id="pop_wrap" style="overflow:auto;width:710px;" >

	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/500ma/h1_point1.png" alt="승인번호 등록하기" /></h1>		
	</div>

	<!-- content -->

	<div id="pop_content3" >

		<div class="content_block content_block_card clfix">
				<p><img src="/images/et/500ma/txt_point1.png" alt="500만포인트!를 잡아라!" /></p>  
				<ol class="list_no01 mt10 mb20">
					<li><p>카드 이용일 기준 30일 이내에 회원님께서 방문하신 500만 포인트 행사 가맹점에서 <strong class="t_point">결제 영수증의 승인번호 3</strong>을 확인하세요.</p></li>
					<li><p>보너스클럽 또는 블루라인가맹점 결제건 승인번호는 ‘왕대박 3을 잡아라!’ 이벤트에서 등록 가능합니다.!</p></li>
				</ol>
				<table class="dtable01 dtable_inputfield" summary="이용일, 카드명, 이용 가맹점, 승인번호, 승인금액, 등록/완료 등 500만포인트!를 잡아라 조회하실 수 있습니다.">
			<caption>500만포인트!를 잡아라 조회</caption> 
			<colgroup><col width="" /><col width="" /><col width="" /><col width="" /><col width="" /><col width="" /></colgroup> 
			<thead>
				<tr>
					<th scope="col" class="cell_l10">이용일</th>
					<th scope="col" class="cell_l10">카드명</th>
					<th scope="col" class="cell_l10">이용 가맹점</th>
					<th scope="col">승인번호</th>
					<th scope="col" class="cell_r10">승인금액</th>
					<th scope="col">등록/완료</th>
				</tr>
			</thead>
			<tbody>
				<!-- loop -->
				<!--<tr>
					<td class="cell_l10">2010.10.10</td>
					<td class="cell_l10">삼성올앳카드</td>
					<td class="cell_l10">교보문고</td>
					<td>6861201</td>
					<td class="cell_r10">50,000</td>
					<td><a href="#" onclick="go_start();" class="btn btn_s_white"><span>등록</span></a></td>
				</tr>
				-->
							<!-- loop -->
							<%if(resultList.size()> 0){%>

							<%
							int size = resultList.size();
							for(int i=0 ; i<size ; i++){
							cvo = (NHPIMMHKVP002VO)resultList.get(i);
							%>
								<tr>
									<td class="cell_l10">
									<%=cvo.getApproveDate().substring(0,4)%>.
									<%=cvo.getApproveDate().substring(4,6)%>.
									<%=cvo.getApproveDate().substring(6,8)%>
									</td>
									<td class="cell_l10"><%=cvo.getCardName().substring(0,3)%>***</td>
									<td class="cell_l10"><%=cvo.getChainName()%></td>
									<td><%=cvo.getApproveNo().replace("3","<strong>3</strong>")%></td>
									<td class="cell_l10">
									<%
									String amount=cvo.getApproveAmount();
									amount=df.format(Integer.parseInt(amount));
									%>
									<%=amount%>
									</td>
									<%if((cvo.getApproveNo().indexOf("3") > -1)&&(Integer.parseInt(cvo.getApproveAmount().replace(",","")) > 0)){ %>
										<%if(cvo.getGubun().equals("Y")){ %>
										<!-- 등록 -->
                                        <td><a href="javascript:three_event('<%=cvo.getCardNo()%>','<%=cvo.getApproveNo()%>','<%=cvo.getApproveAmount().replace(",","")%>','<%=cvo.getApproveDate()%>');" class="btn btn_s_white"  ><span>등록</span></a></td>
										<%}else{ %>
										<!-- 완료 -->
										<td><span>완료</span></td>
										<%}%>
									<%}else{%>
									<td>&nbsp;</td>
									<%} %>
									
								</tr>
								<%} %>
							<%}else{%>
							<tr>
							<td colspan="6">30일 이내에 이용내역이 없습니다.</td>
							</tr>
							<%} %>				
			</tbody>
		</table>
		<!-- paginate --><!--
		<div class="paginate01">
			<p class="ppage">Page 1/73</p>
			<div class="ppaging">
				<a href="#"><img src="/images/pop/btn_prev_off.png" alt="이전" /></a>
				<span class="num">
					<a href="#" class="first_none"><strong>1</strong></a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a>
				</span>
				<a href="#"><img src="/images/pop/btn_next_on.png" alt="다음" /></a>
			</div>
		</div>

				-->
						<%
						if(resultList != null && resultList.size() >0){
						%>
						<!-- paginate -->
						<!-- 페이징 -->
						<div class="paginate">
							${_page}
						</div>
						<!-- //페이징 -->
						<%}%>				
				
				</div>
		</div>
		
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<p style="text-align:right;padding:6px 40px 5px 0px; color:#999;letter-spacing:-1px;" class="t_no"></p>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>

</div>
</body>

</html>

