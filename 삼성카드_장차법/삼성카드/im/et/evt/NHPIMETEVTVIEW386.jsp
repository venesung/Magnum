<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 창립 23주년 감사 대축제 Amazing Gift! - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String dupEventA = (String)request.getAttribute("dupEventA");
	String strCount1 = (String)request.getAttribute("strCount1");
	String strCount2 = (String)request.getAttribute("strCount2");
	String strCount3 = (String)request.getAttribute("strCount3");
	String strCount4 = (String)request.getAttribute("strCount4");
	String strCount5 = (String)request.getAttribute("strCount5");
	String strItem03 = (String)request.getAttribute("strItem03");
	String userName = (String)request.getAttribute("userName");
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
	//String dupEventB = (String)request.getAttribute("dupEventB");
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
ul, ol, li	{list-style:none; list-style-position:outside}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px; vertical-align:middle}
html:first-child	input.chk, input.rdo	{display:inline-block}
strong	{font-weight:bold; color:#333}

.t_point_org	{color:#EE8F09}
.t_gift_sel {font:bold 16px '돋움'; color:#333; line-height:26px; padding-top:30px; letter-spacing:-1px}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.t_default {font-size:12px}

.mt3 {margin-top:3px}
.mt5 {margin-top:5px}
.mt10 {margin-top:10px}
.mt15 {margin-top:15px}
.mt20 {margin-top:20px}
.mt25 {margin-top:25px}
.pl5 {padding-left:5px}

.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn	{cursor:pointer; vertical-align:middle}
span.btn	{cursor:default}
span.btn, span.btn	span	{color:#999}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
.btn_s_white	{background:url('/images/et/pre23/bg_button.png') no-repeat 0 -60px}
.btn_s_white span, .btn_s_white input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/et/pre23/bg_button.png') no-repeat right -60px; line-height:21px; font-size:11px; letter-spacing:-1px; cursor:pointer}

.btnc {text-align:center}

.gift {position:relative}
.gift1 {position:absolute; top:545px; left:88px}
.gift2 {position:absolute; top:545px; left:306px}
.gift3 {position:absolute; top:545px; left:496px}
.gift4 {position:absolute; top:685px; left:88px}
.gift5 {position:absolute; top:685px; left:306px}
.magazine1 {position:absolute; top:1370px; left:180px}
.magazine2 {position:absolute; top:1370px; left:360px}
.gift_agree {position:absolute; top:765px; left:313px}

.gift_view {position:absolute; top:730px; left:250px; width:230px; height:145px; background:url('/images/et/pre23/bg_lay_sel.png') no-repeat}
.gift_view .gift_cont {padding:30px; text-align:center}
.gift_view .gift_cont	p {line-height:16px}

.gift_sel {position:absolute; top:595px; left:130px; width:470px; height:300px; background:url('/images/et/pre23/bg_lay_sel2.png') no-repeat}
.gift_sel .gift_cont {padding:30px; text-align:center}
.lay_close {position:relative}
.lay_close .btn_close	{position:absolute; right:9px; top:9px; width:25px; height:25px; background:none}

.gift_info {position:absolute; top:920px; left:130px; width:470px; height:530px; background:url('/images/et/pre23/bg_lay_sel3.png') no-repeat}
.gift_info .gift_cont {padding:30px 30px 15px 30px; text-align:center}
.gift_info .gift_cont		p {text-align:left; line-height:16px}
.gift_info .gift_cont		p.tit {text-align:center}
.gift_info .gift_cont		p.p_agree {text-align:right; margin-top:10px}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}

.dtable01	th	{padding:6px 0 5px; border-top:1px solid #CCC; border-bottom:1px solid #CCC; color:#333; font:normal 12px "돋움"; line-height:14px}
.dtable01	th	p	{color:#333}
.dtable01	td	{padding:2px 0 1px; border-bottom:1px solid #F3F3F3; text-align:center; line-height:18px; word-break:keep-all}
.dtable01	tbody	th	{border-top:0 none; border-right:1px solid #E6E6E6; border-bottom:1px solid #F3F3F3}
table	td.cell_l10 {text-align:left; padding-left:10px}	table	th.cell_l10 {text-align:left; padding-left:10px}
table td.cell_r10 {text-align:right; padding-right:10px}	table th.cell_r10 {text-align:right; padding-right:10px}

.dtable02	{border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02	th	{padding:6px 0 5px 10px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02	td	{padding:6px 0 5px 10px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; text-align:left; word-break:keep-all}

.email {width:90px}
.phone_sel	{width:63px}
.phone {width:52px}
.zip {width:40px}
.address {width:270px}

.line_lgray	{width:100%; height:0; margin-bottom:15px; padding-bottom:15px; border-bottom:1px solid #f2f2f2; font-size:0; line-height:0; overflow:auto; overflow:hidden}
.gift_rdo {float:left; vertical-align:top; margin-right:5px}
.gift_prd {float:left; vertical-align:top; margin-top:2px}
.gift_prd p {font:bold 11px '돋움'; color:#aba79b; letter-spacing:-1px}
.blank {width:25px; height:25px}
.magazine_prd {float:left; vertical-align:top; margin-top:2px}
.magazine_prd p {font:bold 11px '돋움'; color:#8b959d; letter-spacing:-1px}
.conts_hidden {font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;}

</style>
<script language="javascript" type="text/javascript">
	
	function go_start(gubun) {
		
		<%
			if(loginYN.equals("N")){ 
		%>
//			parent.eventLogin('11420');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		
			  		<%if(dupEventA.equals("Y")){%>
					alert("이미 이벤트에 응모하셨습니다.");
					return;
					<%}%>

				applyEvent(gubun);
			<% } %>	
				  	
						
		<%
			}
		%>
	}
var chkCheckbox="N";
var gift1 = "";
	function applyEvent() {
		 
		for(i=0; i<5; i++){
			if(document.evtFrm.r00[i].checked){
				gift1 = document.evtFrm.r00[i].value;
				document.evtFrm.r00.value = gift1;
				chkCheckbox = "Y";
			}
		}
		//alert(document.evtFrm.r00.value);
		if(chkCheckbox =="N" ){
			alert("선물을 선택해 주세요.");
			return ;
		}

		if(document.evtFrm.agree[0].checked) {
		} else {
			alert("동의하셔야 응모가능합니다.");
			return ;
		}		
		
		
	    document.evtFrm.eventgubun.value = document.evtFrm.r00.value;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}
	function applygoEvent() {
		<%if( premiumYn.equals("N")){ %>
		alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
		return ;
		<%}%>
		
		<%if(dupEventA.equals("Y")){%>
		alert("회원님은 이미 이벤트에 참여하셨습니다.\n\n[내가 선택한 선물 확인하기] 버튼을 클릭하시면\n\n회원님이 선택하신 선물을 확인하실 수 있습니다.");
		return ;		
		<%}%>
		for(i=0; i<5; i++){
			if(document.evtFrm.r00[i].checked){
				gift1 = document.evtFrm.r00[i].value;
				document.evtFrm.r00.value = gift1;
				chkCheckbox = "Y";
			}
		}
		//alert(document.evtFrm.r00.value);
		if(chkCheckbox =="N" ){
			alert("선물을 선택해 주세요.");
			return ;
		}
		if(document.evtFrm.agree[0].checked) {
		} else {
			alert("배송업체에 정보제공을 동의하셔야만 이벤트에 참여하실 수 있습니다.");
			return ;
		}			

		if (document.evtFrm.r00.value=="1") {
			document.getElementById('gift_lay21').style.display='block';
		} else if (document.evtFrm.r00.value=="2") {
			document.getElementById('gift_lay22').style.display='block';
		} else if (document.evtFrm.r00.value=="3") {
			document.getElementById('gift_lay23').style.display='block';
		} else if (document.evtFrm.r00.value=="4") {
			document.getElementById('gift_lay24').style.display='block';
		} else if (document.evtFrm.r00.value=="5") {
			document.getElementById('gift_lay25').style.display='block';
		}

	}
	
	function show(obj){
		var objName = document.getElementById(obj);
		if(objName.style.display == 'block'){
			objName.style.display = 'none';
		}
		else {
			objName.style.display = 'block';
		}
	}

	function goLayerPop() {
		
		<%if(dupEventA.equals("Y")){%>
		document.getElementById('gift_lay1').style.display='block';
		
		<%} else {%>
		alert("이벤트에 응모하신 이력이 없습니다.");
		
		<% } %>
	}
	
	function applyOk(){
		alert("응모가 완료되었습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>


<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=preEventInsert" method="post">
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
<input type="hidden" name="eventgubun" value=""/>


<!--시작 -->
<div class="gift">
	<div class="gift1">
		<div class="gift_rdo"><label><input type="radio" class="rdo"  name="r00" value="1" title="GUCCI 핸드백 (10명)" /></label></div>
		<div class="gift_prd">
			<p><img src="/images/et/pre23/txt_gift1.png" alt="GUCCI 핸드백 (10명)" /></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(strCount1) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="gift2">
		<div class="gift_rdo"><label><input type="radio" class="rdo"  name="r00" value="2" title="캐논 DSLR EOS 550D (10명)" /></label></div>
		<div class="gift_prd">
			<p><img src="/images/et/pre23/txt_gift2.png" alt="캐논 DSLR EOS550D (10명)" /></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(strCount2) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="gift3">
		<div class="gift_rdo"><label><input type="radio" class="rdo"  name="r00" value="3" title="삼성카드 GIFT카드 50만원권(15명)" /></label></div>
		<div class="gift_prd">
			<p><img src="/images/et/pre23/txt_gift3.png" alt="삼성카드 GIFT카드 50만원권 (15명)" /></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='15' req_cnt='<%=String.valueOf(strCount3) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="gift4">
		<div class="gift_rdo"><label><input type="radio" class="rdo"  name="r00" value="4" title="GS칼텍스 주유 5만원권(200명)" /></label></div>
		<div class="gift_prd">
			<p><img src="/images/et/pre23/txt_gift4.png" alt="GS칼텍스 주유 5만원권(200명)" /></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='200' req_cnt='<%=String.valueOf(strCount4) %>' inputCss="" /></p>
		</div>
	</div>
	<div class="gift5">
		<div class="gift_rdo"><label><input type="radio" class="rdo"  name="r00" value="5" title="삼성카드 서비스포인트 3천점 (2,088명)" /></label></div>
		<div class="gift_prd">
			<p><img src="/images/et/pre23/txt_gift5.png" alt="삼성카드 서비스포인트 3천점 (2,088명)" /></p>
			<p class="mt5">당첨확률 <fileTag:emzCommon pdt_cnt='2088' req_cnt='<%=String.valueOf(strCount5) %>' inputCss="" /></p>
		</div>
	</div>
	<p class="gift_agree">
		<label for="agree1"><img src="/images/et/pre23/txt_agree.png" alt="동의함" /><span class="conts_hidden">동의함</span>
		<input type="radio"  id="agree1" name="agree" title="동의함"  /></label>
		<span class="pl5"><label for="agree2"><img src="/images/et/pre23/txt_agree_no.png" alt="동의안함" /><span class="conts_hidden">동의안함</span>
		<input type="radio"  id="agree2" name="agree" title="동의안함" /></label></span>
	</p>
</div>
<!-- // GIFT -->
<!-- layerpop gift 신청완료 -->
<div id="gift_lay1" class="gift_view" style="display:none">
	<div class="gift_cont">
		<p><strong><%=userName%></strong> 회원님은 <br />
			<span class="t_point_org">
			<%if (strItem03.equals("1")) { %> 
			GUCCI 핸드백
			<%} else if (strItem03.equals("2")) {%>
			캐논 DSLR EOS 550D
			<%} else if (strItem03.equals("3")) {%>
			삼성카드 GIFT카드 50만원권
			<%} else if (strItem03.equals("4")) {%>
			GS칼텍스 주유 5만원권
			<%} else if (strItem03.equals("5")) {%>
			삼성카드 서비스포인트 3천점
			<%} %>
			
			</span>을 신청하셨습니다.</p>
		<p class="mt10"><a href="#1" onclick="document.getElementById('gift_lay1').style.display='none';" class="btn btn_s_white"><span>닫기</span></a></p>
	</div>
</div>
<!-- // layerpop gift 신청완료 -->
<!-- layerpop gift 신청 -->
<div id="gift_lay21" class="gift_sel" style="display:none">
	<div class="lay_close">
		<p class="btn_close"><a href="#1" onclick="document.getElementById('gift_lay21').style.display='none';"><img src="/images/et/pre23/blank.png" alt="" class="blank" /></a></p>
	</div>
	<div class="gift_cont">
		<p class="t_gift_sel">회원님은 GUCCI 핸드백을<br />선택하셨습니다. 신청하시겠습니까?</p>
		<table class="dtable01 mt25" summary="상품수, 현재 신청회원수, 당첨확률 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="50%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th class="cell_l10">상품수</th>
					<th>현재 신청회원수</th>
					<th class="cell_r10">당첨확률</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10">10개</td>
					<td><%=String.valueOf(strCount1) %>명</td>
					<td class="cell_r10"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(strCount1) %>' inputCss="" /></td>
				</tr>
			</tbody>
		</table>
		<p class="btnc mt15">
			<a href="#" onclick="applyEvent();"><img src="/images/et/pre23/btn_s_yes.png" alt="예" /></a>
			<a href="#" onclick="document.getElementById('gift_lay21').style.display='none';"><img src="/images/et/pre23/btn_s_no.png" alt="아니오" /></a>
		</p>
	</div>
</div>
<div id="gift_lay22" class="gift_sel" style="display:none">
	<div class="lay_close">
		<p class="btn_close"><a href="#1" onclick="document.getElementById('gift_lay22').style.display='none';"><img src="/images/et/pre23/blank.png" alt="" class="blank" /></a></p>
	</div>
	<div class="gift_cont">
		<p class="t_gift_sel">회원님은 캐논 DSLR EOS 550D를<br />선택하셨습니다. 신청하시겠습니까?</p>
		<table class="dtable01 mt25" summary="상품수, 현재 신청회원수, 당첨확률 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="50%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th class="cell_l10">상품수</th>
					<th>현재 신청회원수</th>
					<th class="cell_r10">당첨확률</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10">10개</td>
					<td><%=String.valueOf(strCount2) %>명</td>
					<td class="cell_r10"><fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(strCount2) %>' inputCss="" /></td>
				</tr>
			</tbody>
		</table>
		<p class="btnc mt15">
			<a href="#" onclick="applyEvent();"><img src="/images/et/pre23/btn_s_yes.png" alt="예" /></a>
			<a href="#" onclick="document.getElementById('gift_lay22').style.display='none';"><img src="/images/et/pre23/btn_s_no.png" alt="아니오" /></a>
		</p>
	</div>
</div>
<div id="gift_lay23" class="gift_sel" style="display:none">
	<div class="lay_close">
		<p class="btn_close"><a href="#1" onclick="document.getElementById('gift_lay23').style.display='none';"><img src="/images/et/pre23/blank.png" alt="" class="blank" /></a></p>
	</div>
	<div class="gift_cont">
		<p class="t_gift_sel">회원님은 삼성카드 GIFT카드 50만원권을<br />선택하셨습니다. 신청하시겠습니까?</p>
		<table class="dtable01 mt25" summary="상품수, 현재 신청회원수, 당첨확률 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="50%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th class="cell_l10">상품수</th>
					<th>현재 신청회원수</th>
					<th class="cell_r10">당첨확률</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10">15개</td>
					<td><%=String.valueOf(strCount3) %>명</td>
					<td class="cell_r10"><fileTag:emzCommon pdt_cnt='15' req_cnt='<%=String.valueOf(strCount3) %>' inputCss="" /></td>
				</tr>
			</tbody>
		</table>
		<p class="btnc mt15">
			<a href="#" onclick="applyEvent();"><img src="/images/et/pre23/btn_s_yes.png" alt="예" /></a>
			<a href="#" onclick="document.getElementById('gift_lay23').style.display='none';"><img src="/images/et/pre23/btn_s_no.png" alt="아니오" /></a>
		</p>
	</div>
</div>
<div id="gift_lay24" class="gift_sel" style="display:none">
	<div class="lay_close">
		<p class="btn_close"><a href="#1" onclick="document.getElementById('gift_lay24').style.display='none';"><img src="/images/et/pre23/blank.png" alt="" class="blank" /></a></p>
	</div>
	<div class="gift_cont">
		<p class="t_gift_sel">회원님은 GS칼텍스 주유 5만원권을<br />선택하셨습니다. 신청하시겠습니까?</p>
		<table class="dtable01 mt25" summary="상품수, 현재 신청회원수, 당첨확률 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="50%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th class="cell_l10">상품수</th>
					<th>현재 신청회원수</th>
					<th class="cell_r10">당첨확률</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10">200개</td>
					<td><%=String.valueOf(strCount4) %>명</td>
					<td class="cell_r10"><fileTag:emzCommon pdt_cnt='200' req_cnt='<%=String.valueOf(strCount4) %>' inputCss="" /></td>
				</tr>
			</tbody>
		</table>
		<p class="btnc mt15">
			<a href="#" onclick="applyEvent();"><img src="/images/et/pre23/btn_s_yes.png" alt="예" /></a>
			<a href="#" onclick="document.getElementById('gift_lay24').style.display='none';"><img src="/images/et/pre23/btn_s_no.png" alt="아니오" /></a>
		</p>
	</div>
</div>
<div id="gift_lay25" class="gift_sel" style="display:none">
	<div class="lay_close">
		<p class="btn_close"><a href="#1" onclick="document.getElementById('gift_lay25').style.display='none';"><img src="/images/et/pre23/blank.png" alt="" class="blank" /></a></p>
	</div>
	<div class="gift_cont">
		<p class="t_gift_sel">회원님은 삼성카드 서비스포인트 3천점을<br />선택하셨습니다. 신청하시겠습니까?</p>
		<table class="dtable01 mt25" summary="상품수, 현재 신청회원수, 당첨확률 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="50%" /><col width="25%" /></colgroup>
			<thead>
				<tr>
					<th class="cell_l10">상품수</th>
					<th>현재 신청회원수</th>
					<th class="cell_r10">당첨확률</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cell_l10">2088개</td>
					<td><%=String.valueOf(strCount5) %>명</td>
					<td class="cell_r10"><fileTag:emzCommon pdt_cnt='2088' req_cnt='<%=String.valueOf(strCount5) %>' inputCss="" /></td>
				</tr>
			</tbody>
		</table>
		<p class="btnc mt15">
			<a href="#" onclick="applyEvent();"><img src="/images/et/pre23/btn_s_yes.png" alt="예" /></a>
			<a href="#" onclick="document.getElementById('gift_lay25').style.display='none';"><img src="/images/et/pre23/btn_s_no.png" alt="아니오" /></a>
		</p>
	</div>
</div>
<!-- // layerpop gift 신청 -->

<p><img src="/images/et/pre23/event_amazinggift_110324.jpg" alt="삼성카드 창립 23주년 감사 대축제 Amazing Gift!" usemap="#amazinggift" /></p>
<map name="amazinggift" id="amazinggift">
		<area shape="rect" coords="512,785,600,802" href="#" onclick="parent.parent.goTabPage('NHPIMMHUFM001M001', true);" alt="회원정보조회/변경" />
		<area shape="rect" coords="203,824,363,856" href="#1" onclick="applygoEvent();" alt="신청하기" />
		<area shape="rect" coords="367,824,527,856" href="#1" onclick="goLayerPop();" alt="신청선물 확인하기" />
</map>
</form>
</body>

</html>

