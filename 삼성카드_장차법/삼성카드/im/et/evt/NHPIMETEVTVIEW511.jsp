<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<title>삼성카드 BIZ 오픈 기념 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	
	String event_ok2 = (String)request.getAttribute("eventYN2"); //이벤트참여여부
	String beginDateYN2 = (String)request.getAttribute("beginDateYN2"); //이벤트 응모가능기간여부
	String endDateYN2 = (String)request.getAttribute("endDateYN2"); //이벤트 응모가능기간여부
	String beginMsg2 = (String)request.getAttribute("beginMsg2"); //이벤트 응모가능기간여부
	String endMsg2 = (String)request.getAttribute("endMsg2"); //이벤트 응모가능기간여부
	String eventNo2 = (String)request.getAttribute("eventNo2"); //이벤트 No
	
	String leftAmt = "0";
	String approveSum = (String)request.getAttribute("approveSum");
	String curApproveSum = "0";
	
	BigDecimal bigcurApproveSum = (BigDecimal)request.getAttribute("curApproveSum");
	BigDecimal bigremainAmt = (BigDecimal)request.getAttribute("remainAmt");

	curApproveSum = bigcurApproveSum.toString();
	if (StringUtil.StringToInteger(bigremainAmt.toString()) < 0) {
		leftAmt = "0";
	} else {
		leftAmt = bigremainAmt.toString();
	}
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.btn_input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.t_point{font-weight:bold;color:black;}
.al_center{text-align:center;}

/* 레이어 */
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}

.pop_l_position	{position:absolute; left:130px; top:1160px; z-index:600}/* 120620 수정 */

.pop_l_wrap	{position:relative; width:404px; border:3px solid #245FB3; background:white; z-index:511;padding:30px;}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/biz201206/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{
	right:-3px;
	bottom:-3px;
	width:10px;
	height:10px;
	background-position:-10px -10px
}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative;vertical-align:top; z-index:513; text-align:center;margin:30px 0;}	
.pop_l_wrap	.pop_tit2	{padding:8px 0 10px 0; text-align:center}
/* 120620 수정 시작 */
.event_biz	.event_input {}
.event_biz	.event_input_1	{
	position:absolute;
	z-index:2;
	left:160px;
	top:732px;
}
.event_biz	.event_input_2	{
	position:absolute;
	z-index:2;
	left:346px;
	top:732px;
}
.event_biz	.event_input_3	{
	position:absolute;
	z-index:2;
	left:536px;
	top:732px;
}
.event_biz	.event_input_4	{
	position:absolute;
	z-index:2;
	left:206px;
	top:1735px;
}
.event_biz	.event_input_5	{
	position:absolute;
	z-index:2;
	left:496px;
	top:1735px;
}
/* 120620 수정 끝 */
.event_biz	.e_input	input	{width:28px; height:28px}
.btnc	{margin:30px 0 0; text-align:center}
.btnset {width:100%; overflow:auto; overflow:hidden; margin-top:7px;}
.btnset .btnl   {display:inline; float:left}
.dtable01{border-top:1px solid #ccc; border-bottom:1px solid #f2f2f2; width:100%;}
.dtable01 th{border-bottom:1px solid #ccc; font-weight:normal;}
.dtable01 td{padding:5px 0;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	var gift = "0";
	var chkCheckbox = "N";
	
	function go_starta() {
		

		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('28053');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 응모 하셨습니다.");	
			<%}else{ %>

				for(i=0; i<3; i++){
					if(document.evtFrm.id_event_input_1[i].checked){
						gift = document.evtFrm.id_event_input_1[i].value;
						document.evtFrm.selgift.value = gift;
						chkCheckbox = "Y";
					}
				}
				if(chkCheckbox =="N" ){
					alert("정답을 선택하셔야 응모가 가능합니다.");
					return ;
				}
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function go_startb() {
		
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('28053');
		<%
			}else{
		%>
			<%if( endDateYN2.equals("N")){ %>
				alert("<%=endMsg2 %>");
			<%}else if( beginDateYN2.equals("N")){ %>
			  	alert("<%=beginMsg2 %>");
			<%}else if(event_ok2.equals("Y")){%>
				alert("이미 응모 하셨습니다.");	
				
			<%}else{ %>
				for(i=0; i<2; i++){
					if(document.evtFrm.id_event_input_2[i].checked){
						gift = document.evtFrm.id_event_input_2[i].value;
						document.evtFrm.selgift.value = gift;
						chkCheckbox = "Y";
					}
				}
				if(chkCheckbox =="N" ){
					alert("목표금액을 선택하셔야 응모가 가능합니다.");
					return ;
				}
				applyEvent2();
			<% } %>	
		<%
			}
		%>
	}
	
	function applyEvent() {
		parent.submit_eventLog();
		document.evtFrm.eventgubun.value='a';
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	function applyEvent2() {
		parent.submit_eventLog();
		document.evtFrm.eventgubun.value='b';
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}

	
	function applyOk(){
		alert("감사합니다.\n이벤트 응모 되셨습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

	function show_lay_pop() {
		<%if(event_ok2.equals("Y")){%>
			document.getElementById('id_layer03').style.display='block';
		<%} else { %>
			alert('이벤트에 응모하셔야 조회가 가능합니다.');
		<%} %>
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=BizInsert" method="post">
<input type="hidden" name="eventgubun" value="" />
<input type="hidden" name="eventNo" value="" />
<input type="hidden" name="selgift" value="" />


<span class="event_biz"><img src="/images/et/biz201206/120612_event.jpg" alt="개인사업자를 위한 맞춤 혜택 홈페이지, 삼성카드 BIZ 오픈 기념 이벤트" border="0" usemap="#biz" /></span>

<div class="hidden">
    <p>개인사업자를 위한 맞춤혜택 홈페이지</p>
    <h1>삼성카드 BIZ오픈 기념 이벤트</h1>
    <p>삼성카드 BIZ를 만나보세요 지금 이벤트에 참여하시면, 다양한 선물의 행운까지 함께합니다.</p>
    
    <p>1. 아래 퀴즈에 응모해 보세요. 정답을 맞히신 50분을 추첨해 푸짐한 선물을 드립니다.</p>
    
    <p>개인사업자를 위한 맞춤 혜택을 드리는 삼성카드 개인사업자 전용 홈페이지의 일믕느 삼성카드 OOO입니다. 정답을 아시는 분은 지금 바로 클릭하세요!</p>
    <ul>
        <li>BIZ
            <p class="e_input event_input_1">
            <label><input type="radio" name="id_event_input_1" value="1" title="BIZ" /></label></p>
        </li>
        <li>CEO
            <p class="e_input event_input_2">
            <label><input type="radio" name="id_event_input_1" value="2" title="CEO" /></label></p>
        </li>
        <li>TOP
            <p class="e_input event_input_3">
            <label><input type="radio" name="id_event_input_1" value="3" title="TOP" /></label></p>
        </li>
    </ul>
    <p><a href="#none" onclick="go_starta();return false;" title="응모하기">응모하기</a></p>
    
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 6월 29일(금) ~ 2012년 7월 31일(화)</dd>
        <dt>당첨자발표</dt>
        <dd>2012년 8월 16일(목) 삼성카드 홈페이지</dd>
        <dt>경품안내</dt>
        <dd>
            <ul>
                <li>1등(1명) - 30만원 삼성Gift 카드</li>
                <li>2등(5명) - 10만원 삼성Gift 카드</li>
                <li>3등(10명) - 50,000원 삼성Gift 카드</li>
                <li>4등(34명) - 10,000P 서비스포인트</li>
            </ul>
        </dd>
    </dl>
    
    <ul>
        <li>- 당첨된 경품의 제세공과금은 회원님 본인 부담입니다.</li>
        <li>- 경품배송 및 서비스포인트 적립은 당첨자 발표 후 순차적으로 진행될 예정입니다.</li>
        <li>- 삼성Gift카드의 유효기간은 5년입니다.</li>
        <li>- 서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스포인트 및 빅포인트와 함산해 사용하실 수 있습니다. </li>
        <li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
    </ul>
    
    
    <p>2. 회원님께서 일시불과 할부 이용금액을 합한 목표금액을 직접 선택하시고, 행사기간 동안 정해신 목표 금액 이상을 BIZ계열 삼성카드 </p>
    <p>삼성카드 BIZ 3, BIZ 3+ 삼성전자 멤버십 BLUE B 삼성카드 BIZ로 이용 시 추첨을 통해 총 100명께 경품을 드립니다.<a id="NHPIMETEVTVIEW511_L01" href="#none" onclick="show_lay_pop();fnSetReturnFocusId('NHPIMETEVTVIEW511_L01','id_layer03');return false;">도전 목표금액 보기</a></p>
    <p>목표금액을 선택해 주세요</p>
    <ul>
        <li>200만원 이상
            <p class="e_input event_input_4">
            <label><input type="radio" name="id_event_input_2" value="200" title="200만원 이상" /></label></p>
        </li>
        <li>50만원 이상
            <p class="e_input event_input_5">
            <label><input type="radio" name="id_event_input_2" value="50" title="50만원 이상" /></label></p>
        </li>
    </ul>
    <p><a href="#none" onclick="go_startb();return false;" >선택하기</a></p>
    
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 6월 29일(금) ~ 2012년 7월 31일(화)</dd>
        <dt>행사내용</dt>
        <dd>2012년 8월 16일(목) 삼성카드 홈페이지</dd>
        <dt>참여방법</dt>
        <dd>
            <ul>
                <li>step1 - 목표금액 선택 </li>
                <li>step2 - 기간 내 목표금액 달성</li>
                <li>step3 - 추첨 후 당첨 회원님께 선물 제공</li>
            </ul>
        </dd>
        <dt>경품안내</dt>
        <dd>
            <p>목표금액이 200만원 이상인 경우</p>
            <ul>
                <li>1등(1명) - 100만원 삼성 Gift 카드(50만원 2매로 배송)</li>
                <li>2등(5명) - 50만원 삼성 Gift 카드</li>
                <li>3등(10명) - 10만원 삼성 Gift </li>
                <li>4등(34명) - 10,000P 서비스 포인트</li>
            </ul>
        </dd>
        <dd>
            <p>목표금액이 50만원 이상인 경우</p>
            <ul>
                <li>1등(1명) - 50만원 삼성 Gift 카드</li>
                <li>2등(5명) - 10만원 삼성 Gift 카드</li>
                <li>3등(10명) - 10,000 서비스포인트 </li>
                <li>4등(34명) - 5,000P 서비스 포인트</li>
            </ul>
        </dd>
    </dl>
    <ul>
        <li>- 당첨된 경품의 제세공과금은 회원님 본인 부담입니다.</li>
        <li>- 경품배송 및 서비스포인트 적립은 당첨자 발표 후 순차적으로 진행될 예정입니다.</li>
        <li>- 목표금액 미달성 시 추첨대상에서 제외됩니다.</li>
        <li>- 결제 취소 시 이용금액에서 제외되며, 회겆ㅇ된 경품은 변경되지 않습니다.</li>
        <li>- 삼성카드 BIZ3, BIZ3+ 삼성전자 멤버십 BLUE B 삼성카드 Biz의 국내 이용내역을 합산한 금액에 한하며, 무이자할부, 국세, 지방세, 대학등록금, 제약업종, 일부 유의업종, 교통카드 및 후불하이패스 이용내역은 이용금액에서 제외됩니다.</li>
        <li>- 삼성Gift카드의 유효기간은 5년입니다.</li>
        <li>- 서비스포인트의 유효기간은 적립일로부터 1년이며, 보너스포인트 및 빅포인트와 합산해 사용하실 수 있습니다.</li>
        <li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
    </ul>
    
    <p>3. 오피스 인기상품 구매하시고 사은품 받아가세요</p>
    <p>개인사업자를 위한 사무용품 전문쇼핑몰 오픈 기념 사은 이벤트</p>
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 6월 29일(금) ~ 2012년 7월 31일(화)</dd>
        <dd>
            <ul>
                <li>MR.COPY 75g A4 2박스 이상 주문 시 + 맥심 모카골드 마일드 믹스 20T 1개증정</li>
                <li>맥심모카골드 마일드믹스 150T 2박스 이상 주문시 + 립톤 아이스티 복숭아 20T 1개 증정</li>
                <li>종이컵(6.5온스)1,000개 2박스 이상 주문 시 + 대흥 신용카드 전표철 C124 1개 증정(색상 랜덤 발송)</li>
            </ul>
        </dd>
    </dl>
    
    <p><a href="http://biz.samsungcard.com//smepartnershipmall.do?method=sme000" onclick="parent.submit_eventLog();return false;" target="_blank"  title="새창">제휴 구매몰 바로가기</a></p>
    
    <ul>
        <li>- 본 사은이벤트는 인터파크비즈마켓이 삼성카드 BIZ 회원들은 위해 기획, 진행하는 것입니다.</li>
        <li>- 사은품은 해당 주문상품 배송 시 동봉 배송될 예정입니다.(주문건별)</li>
    </ul>    
</div>


<map name="biz" id="biz">
  <!--120620 수정 --> 
  <area shape="rect" coords="296,779,433,818" href="#" onclick="go_starta();return false;" alt="응모하기" />
  <area shape="rect" coords="296,1785,433,1823" href="#" onclick="go_startb();return false;" alt="선택하기" />
  <area shape="rect" coords="439,1455,561,1476" href="#" id="NHPIMETEVTVIEW511_L02" onclick="show_lay_pop();fnSetReturnFocusId('NHPIMETEVTVIEW511_L02','id_layer03');return false;" alt="도전 목표금액 보기" />
  <area shape="rect" coords="265,3338,465,3375" href="http://biz.samsungcard.com//smepartnershipmall.do?method=sme000" onclick="parent.submit_eventLog();" target="_blank" title="새창" alt="제휴구매몰 바로가기" /><!--120621 수정 --> 
<!--//120620 수정 -->
</map>

<div class="event_biz">
  
	<p class="e_input event_input_1">
    <label><input type="radio" name="id_event_input_1" value="1" title="" /></label></p>
	<p class="e_input event_input_2">
    <label><input type="radio" name="id_event_input_1" value="2" title="" /></label></p>
	<p class="e_input event_input_3">
    <label><input type="radio" name="id_event_input_1" value="3" title="" /></label></p>
    <p class="e_input event_input_4">
    <label><input type="radio" name="id_event_input_2" value="200" title="" /></label></p>
    <p class="e_input event_input_5">
    <label><input type="radio" name="id_event_input_2" value="50" title="" /></label></p>

<!-- layer_popup 메세지 -->
  <div id="id_layer03" class="pop_l_position pop_l_wrap_alert" style="display:none;">
		<div class="pop_l_wrap"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p>
		<input type="button" class="img_l_pop btn_close btn_input" onclick="document.getElementById('id_layer03').style.display='none';closeLayerPopup();return false;" value="레이어닫기" title="이용금액안내 레이어 닫기" />
		<p class="pop_tit2"><img src="/images/et/biz201206/layer_tit.png" alt="삼성카드 BIZ 이벤트" /></p>
		<div class="pop_l_content">
			<p class="pop_l_alert" style="text-align:center;">목표금액을 달성하셔야, 선택하신 경품의<br />추첨대상이 될 수 있습니다.</p>
			<p class="t_point" style="margin-top:10px;">이용금액 안내</p>
            <table class="dtable01" summary="목표금액, 현재까지 이용금액, 목표달성까지로 구성된 이용금액안내입니다." cellspacing="0" cellpadding="0">
			<caption>이용금액안내</caption>
			<colgroup><col width="30%" /><col width="35%" /><col width="35%" /></colgroup>
			<thead>
				<tr>
					<th scope="col">목표금액</th>
					<th scope="col">현재까지이용금액</th>
					<th scope="col">목표달성까지</th>
				</tr>
			</thead>
			<tbody>
				<!-- loop -->
				<tr>
					<td class="al_center"><%=String.valueOf(approveSum) %>만원</td>
					<td class="al_center"><%=String.valueOf(curApproveSum) %>만원</td>
					<td class="al_center"><%=String.valueOf(leftAmt) %>만원</td>
				</tr>
				<!-- //loop -->
			</tbody>
			</table>

			<p class="btnc"><a href="#" onclick="document.getElementById('id_layer03').style.display='none';closeLayerPopup();return false;"><img src="/images/et/biz201206/btn_s_confirm02.png" alt="확인" /></a></p>

		  </div>
		</div>
  </div>



</div>

</form>
</body>

</html>

