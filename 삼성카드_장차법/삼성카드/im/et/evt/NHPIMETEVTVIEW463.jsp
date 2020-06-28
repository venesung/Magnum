<%
/*
 * Project Name: 삼성카드 웹 목표달성 이벤트
 * File Name: NHPIMETEVTVIEW434.jsp (목표달성 이벤트)
 * Author: 인투데이타시스템 소재민
 * Created on 2011. 9. 26.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%@page import="com.scard.common.util.StringUtil"%>
<%@page import="java.math.BigDecimal"%>
<%

	//String isResult		= (String)request.getAttribute("isResult");		// 이벤트 신청 결과 페이지 여부
	String loginYN		= (String)request.getAttribute("loginYN");
	//String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");

	String grade01 = (String)request.getAttribute("grade01");
	String grade02 = (String)request.getAttribute("grade02");
	String grade03 = (String)request.getAttribute("grade03");
	String grade04 = (String)request.getAttribute("grade04");
	String grade05 = (String)request.getAttribute("grade05");
	String grade06 = (String)request.getAttribute("grade06");
	
	String item03 = (String)request.getAttribute("item03"); //선택한 선물
	//String item04 = (String)request.getAttribute("item04"); //설정금액
	//String usedAmt = (String)request.getAttribute("usedAmt"); //현재까지 사용한금액
	
	//leftAmt = StringUtil.amountToString(intLeftAmt);
		
	String beginDateYN = (String)request.getAttribute("beginDateYN");
	String endDateYN = (String)request.getAttribute("endDateYN");
	String beginMsg = (String)request.getAttribute("beginMsg");
	String endMsg = (String)request.getAttribute("endMsg");
	String premiumYn = (String)request.getAttribute("premiumYn");

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/ss.css" />
<title>프리미엄 Welcome Event - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.event_input_1{position:absolute;z-index:2;left:139px;top:1296px;}
.event_input_2{position:absolute;z-index:2;left:355px;top:1296px;}
.event_input_3{position:absolute;	z-index:2;left:571px;top:1296px;}
.event_input_4{position:absolute;z-index:2;left:139px;top:1495px;}
.event_input_5{position:absolute;z-index:2;left:355px;top:1495px;}
.event_input_6{position:absolute;	z-index:2;left:571px;top:1495px;}
.vie1 {	font-size:12px;	position:absolute;	top:1336px;	left:158px;	width:20px;	text-align:right;}
.vie2 {	font-size:12px;	position:absolute;	top:1336px;	left:375px;	width:20px;	text-align:right;}
.vie3 {	font-size:12px;	position:absolute;	top:1336px;	left:591px;	width:20px;	text-align:right;}
.vie4 {	font-size:12px;	position:absolute;	top:1536px;	left:158px;	width:20px;	text-align:right;}
.vie5 {	font-size:12px;	position:absolute;	top:1536px;	left:375px;	width:20px;	text-align:right;}
.vie6 {	font-size:12px;	position:absolute;	top:1536px;	left:591px;	width:20px;	text-align:right;}

.premiumWrap {position: relative;width:728px;}
#premium_layer1,#premium_layer2,#premium_layer3{position: absolute;left: 350px;top: 1330px;z-index:10;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="/js/Form_Check.js"></script>
<script type="text/javascript" src="/js/job1.js"></script>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" src="/js/common-hp.js"></script>
<script type="text/javascript" src="/js/common-hp-util.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">

			
function applyEvent() {
		var chkCheckbox = "N";

/*if(document.form1.objectAmount.value =="000" ){
	alert('휴대폰번호를 확인해주시기 바랍니다.');
	return ;
}*/
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('298');
	<%
		}else{
	%>

	<%if (item03.equals("01")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 삼성파브3D LED TV');
	return;
	<%} else if (item03.equals("02")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 루이비통 명품백');
	return;
	<%} else if (item03.equals("03")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 200만원 여행상품권');
	return;
	<%} else if (item03.equals("04")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 올림푸스 PEN');
	return;
	<%} else if (item03.equals("05")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 서비스포인트 10만점');
	return;
	<%} else if (item03.equals("06")) {%>
	document.getElementById('premium_layer1').style.display='none';
	document.getElementById('premium_layer3').style.display='block';
	$('#layer3_txt').text('선물명 : 서비스포인트 5만점');
	return;
	<%}%>
	
<%
if (beginDateYN.equals("N")) {%>
		alert("<%=beginMsg%>");
		return;
<%}%>
<%if (endDateYN.equals("N")) {%>
		alert("<%=endMsg%>");
		return;
<%}%>

<%if( premiumYn.equals("N")){ %>
alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
return ;
<%}%>

for(i=0; i<6; i++){
	if(document.form1.gubun[i].checked){
		gift1 = document.form1.gubun[i].value;
		document.form1.selgift.value = gift1;
		chkCheckbox = "Y";
	}
}
if(chkCheckbox =="N" ){
	alert("선물을 선택하셔야 응모가 가능합니다.");
	return ;
}
		document.getElementById('premium_layer1').style.display='none';

		document.form1.method = "post";

		document.form1.action="/hp/im/et/evt003.do?method=applyPreServiceEvent";
		document.form1.target="formhidden"
		document.form1.submit();
<%}%>
}
function resultAlert(msg) {
	if (msg=="ok") {
		
	} else if (msg=="false") {
		alert("이벤트 응모에 실패하셨습니다.");
	} else if (msg=="dup") {
		alert("이미 이벤트에 응모하셨습니다.");
	}
	location.reload();
}
function resultAlertok(gift1) {
	document.getElementById('premium_layer2').style.display='block';
	if (gift1 == "1") {
		$('#layer2_txt').text('선물명 : 삼성파브3D LED TV');
	} else if (gift1 == "2") {
		$('#layer2_txt').text('선물명 : 루이비통 명품백');
	} else if (gift1 == "3") {
		$('#layer2_txt').text('선물명 : 200만원 여행상품권');
	} else if (gift1 == "4") {
		$('#layer2_txt').text('선물명 : 올림푸스 PEN');
	} else if (gift1 == "5") {
		$('#layer2_txt').text('선물명 : 서비스포인트 10만점');
	} else if (gift1 == "6") {
		$('#layer2_txt').text('선물명 : 서비스포인트 5만점');
	}
	//alert("응모가 완료되었습니다.")
	//location.reload();
	
}
function pop201201() {
	window.open('/html/et/sfc_pop.html','pop201201','menubar=0,resizable=0,scrollbars=0,width=710,height=466,left=0,top=0');
}
function noPrimum(){
	alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
	return ;
}
function beforeApply() {
	var chkCheckbox2 = "N";

	for(i=0; i<6; i++){
		if(document.form1.gubun[i].checked){
			gift1 = document.form1.gubun[i].value;
			chkCheckbox2 = "Y";
		}
	}
	
	if(chkCheckbox2 =="N" ){
		alert("선물을 선택하셔야 응모가 가능합니다.");
		return ;
	}
	document.getElementById('premium_layer1').style.display='block';

	if (gift1 == "1") {
		$('#layer1_txt').text('선물명 : 삼성파브3D LED TV');
	} else if (gift1 == "2") {
		$('#layer1_txt').text('선물명 : 루이비통 명품백');
	} else if (gift1 == "3") {
		$('#layer1_txt').text('선물명 : 200만원 여행상품권');
	} else if (gift1 == "4") {
		$('#layer1_txt').text('선물명 : 올림푸스 PEN');
	} else if (gift1 == "5") {
		$('#layer1_txt').text('선물명 : 서비스포인트 10만점');
	} else if (gift1 == "6") {
		$('#layer1_txt').text('선물명 : 서비스포인트 5만점');
	}
}
	</script>
</head>

<body>
<form name="form1" method="post" action="">
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selgift" value=""/>
<input type="hidden" name="ActionMode" value=""/>
<!-- <div style="position:relative">
	<div>
		<div ><img src="/images/et/sfcupgrade/sfcupgrade1.jpg" alt="삼성패밀리카드 업그레이드 이벤트"  usemap="#map1" /></div>
		<map name="map1" id="map1">
			<area shape="rect" coords="193,1011,399,1039" alt="업그레이드서비스 자세히보기" href="#" onclick="pop201201();" title="새창" />
		</map>
  </div>
	<div style="position:relative">
		<img src="/images/et/sfcupgrade/sfcupgrade2.jpg" alt="삼성패밀리카드 업그레이드 이벤트"  usemap="#map2"/>
		<map name="map2" id="map2">
			<area shape="rect" coords="185,329,256,348" alt="응모하기" href="#" onclick="applyEvent('1');" />
			<area shape="rect" coords="374 ,329,444,348" alt="응모하기" href="#" onclick="applyEvent('2');" />
			<area shape="rect" coords="558,329,628 ,348" alt="응모하기" href="#" onclick="applyEvent('3');" />
			<area shape="rect" coords="187,505,257,523" alt="응모하기" href="#" onclick="applyEvent('4');" />
			<area shape="rect" coords="374,504,444,524" alt="응모하기" href="#" onclick="applyEvent('5');" />
			<area shape="rect" coords="558,505,627,525" alt="응모하기" href="#" onclick="applyEvent('6');" />
		</map>
		<p class="vie1">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></p>
		<p class="vie2">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></p>
		<p class="vie3">경쟁률 : <fileTag:emzCommon pdt_cnt='1' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></p>
		<p class="vie4">경쟁률 : <fileTag:emzCommon pdt_cnt='10' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></p>
		<p class="vie5">경쟁률 : <fileTag:emzCommon pdt_cnt='999' req_cnt='<%=String.valueOf(grade05) %>' inputCss="" /></p>
		<p class="vie6">경쟁률 : <fileTag:emzCommon pdt_cnt='1000' req_cnt='<%=String.valueOf(grade06) %>' inputCss="" /></p>
</div>
<div>
	<img src="/images/et/sfcupgrade/sfcupgrade3.jpg" alt="삼성패밀리카드 업그레이드 이벤트" border="0" usemap="#Map"/>
	<map name="Map" id="Map">
	<area shape="rect" coords="105,712,272,732" href="http://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1233" target="_blank" alt="삼성카드  SFC2 자세히 보기" title="새창"/>
	<area shape="rect" coords="416,712,582,732" href="http://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1235" target="_blank" alt="삼성카드  SFC3 자세히 보기" title="새창"/>
	<area shape="rect" coords="105,741,271,762" href="http://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1234" target="_blank" alt="삼성카드  SFC2+ 자세히 보기"  title="새창"/>
	<area shape="rect" coords="416,741,582,762" href="http://www.samsungcard.com/link/index.jsp?url=CARD_SFC?kindCode=P1236" target="_blank" alt="삼성카드  SFC3+ 자세히 보기" title="새창"/>
	</map>
</div>-->
<div class="premiumWrap">
		<p class="e_input event_input_1">
		  <label><input type="radio" id="bonusone01" name="gubun" value="1" title="삼성파브3D LED TV" /></label>
		 </p>
          <p class="e_input event_input_2">
            <label><input type="radio" id="bonusone02" name="gubun" value="2" title="루이비통 명품백" /></label>
          </p>
          <p class="e_input event_input_3">
            <label><input type="radio" id="bonusone03" name="gubun" value="3" title="200만원 여행상품권" /></label>
          </p>
          <p class="e_input event_input_4">
            <label><input type="radio" id="bonusone01" name="gubun" value="4" title="올림푸스 PEN" /></label>
          </p>
          <p class="e_input event_input_5">
            <label><input type="radio" id="bonusone02" name="gubun" value="5" title="서비스포인트 10만점" /></label>
          </p>
          <p class="e_input event_input_6">
           <label><input type="radio" id="bonusone03" name="gubun" value="6" title="서비스포인트 5만점" /></label>
          </p>

<p class="vie1"><%=String.valueOf(grade01) %></p>
<p class="vie2"><%=String.valueOf(grade02) %></p>
<p class="vie3"><%=String.valueOf(grade03) %></p>
<p class="vie4"><%=String.valueOf(grade04) %></p>
<p class="vie5"><%=String.valueOf(grade05) %></p>
<p class="vie6"><%=String.valueOf(grade06) %></p>
	<img src="/images/et/preservice201202/event_premium.jpg" usemap="#premium" alt="프리미엄 Welcome Event" />
    <map name="premium" id="premium">
      <area shape="rect" coords="200,820,327,840" href="https://www.samsungcard.com/index.do?menuId=NHPIMSSPMS001M003" target="_blank" alt="무이자할부 신청하기" title="새창" />
      <area shape="rect" coords="200,845,316,866" href="https://www.samsungcard.com/index.do?menuId=NHPIMMHPMS001M002" target="_blank" alt="포인트백 신청하기" title="새창" />
      <area shape="rect" coords="464,820,581,841" href="https://www.samsungcard.com/index.do?menuId=NHPIMFSBNB001M010" target="_blank" alt="무비무비 응모하기" title="새창" />
      <area shape="rect" coords="463,845,595,866" href="https://www.samsungcard.com/index.do?menuId=NHPIMFSBNB001M013" target="_blank" alt="하와이 여행 응모하기" title="새창" />
      <area shape="rect" coords="296,1621,432,1659" alt="응모하기" href="#" onclick="beforeApply();return false;" />
    </map>
    
    <div class="hidden">
    	<p>2012년 프리미엄/슈퍼프리미엄 회원으로 선정되신 회원님 중 2,012분께 추첨을 통해 푸짐한 선물을 드립니다.</p>
        <strong>프리미엄 Welcome Event!</strong>        
        <div>
          <p>참 실용적인 프리미엄 서비스를 이용해보세요!<br />
            프리미엄 서비스를 이용하신 회원님 중 추첨을 통해 당첨된 2012분께 품격에 실속을 더한 특별한 선물을 드립니다.<br />
            서비스도, 선물도 프리미엄으로~ 지금 응모하세요!</p>
          
          <dl>
            <dt>행사기간</dt>
            <dd>2012년 2월 13일(월) ~ 3월 12일(월)</dd>
            <dt>행사내용</dt>
            <dd>행사기간 동안 프리미엄 무이자할부(전가맹점 2~6개월 무이자할부) 또는 포인트백 서비스 신청 후 이용하시거나, 무비무비 이벤트 또는 무료 하와이 여행 이벤트에 응모하신 회원님 중 응모하신 선물을 추첨을 통해 증정</dd>
            <dt>당첨자발표</dt>
            <dd>2012년 3월 16일(금) 프리미엄라운지 당첨자발표란</dd>
            <dt>참여방법</dt>
            <dd>
              <ul>
                <li>SETP1 아래 선물 목록에서 선물 선택 후 응모</li>
                <li>SETP2 
                  <ol>
                    <li>
                      행사기간 동안 프리미엄 무이자 할부 또는 포인트백 서비스 신청 후 이용
                      <p>ARS 1688-0871</p>
                      <p><a href="https://www.samsungcard.com/index.do?menuId=NHPIMSSPMS001M003" target="_blank" title="새창">무이자할부 신청하기</a></p>
                      <p><a href="https://www.samsungcard.com/index.do?menuId=NHPIMMHPMS001M002" target="_blank" title="새창">포인트백 신청하기</a></p>
                      </li>
                    <li>
                      행사기간 동안 무비무비 이벤트 또는 무료 하와이 여행 이벤트 응모
                      <p><a href="https://www.samsungcard.com/index.do?menuId=NHPIMFSBNB001M010" target="_blank" title="새창">무비무비 응모하기</a></p>
                      <p><a href="https://www.samsungcard.com/index.do?menuId=NHPIMFSBNB001M013" target="_blank" title="새창">하와이 여행 응모하기</a></p>
                      </li>
                    </ol>
                  </li>
                <li>SETP3 행사기간 동안 삼성카드로 일시불 + 할부 많이 이용하기</li>
                </ul>
              </dd>
            <dd>- 행사기간동안 프리미엄 서비스를 신청/사용하신 후 경품에 응모하셔도 추첨이 되십니다.</dd>
            
            <dt>원하는 선물을 선택하시고, 응모해 주세요!</dt>
            <dd>TIP! 삼성카드로 일시불 + 할부를 많이 이용하실수록 선택한 선물의 당첨확률이 높아집니다.</dd>
            <dd>
              <ul>
                <li>삼성파브 3D LED TV : 당첨인원 2명</li>
                <li>루이비통 명품백 : 당첨인원 4명</li>
                <li>200만원 여행상품권 : 당첨인원 6명</li>
                <li>올림푸스 PEN : 당첨인원 10명</li>
                <li>서비스포인트 10만점 : 당첨인원 60명</li>
                <li>서비스포인트 5만점 : 당첨인원 1930명</li>
                </ul>
              </dd>
            <dd><a href="#" onclick="beforeApply();return false;">응모하기</a></dd>
            </dl>
          
          <ul>
            <li>1인 1회, 1개의 경품만 응모하실 수 있으며, 신청하신 경품은 변경하실 수 없습니다.</li>
            <li>실제 받으시는 경품은 위의 이미지와 다를 수 있습니다.</li>
            <li>서비스포인트를 제외한 경품의 제세공과금(22%)은 회원님 본인 부담입니다.</li>
            <li>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
          </ul>  
        </div>
    </div>
    
    
<!-- 120206  추가 -->
    <!-- 레이어팝업1 height:294px;-->
    <div class="layer_spop" id="premium_layer1"  style="display:none;">
        <div class="pop_l_wrap">
            <p class="img_l_pop flag_tl">&nbsp;</p>
            <p class="img_l_pop flag_tr">&nbsp;</p>
            <p class="img_l_pop flag_bl">&nbsp;</p>
            <p class="img_l_pop flag_br">&nbsp;</p>
            <input type="button" title="응모하기 레이어 닫기" value="레이어닫기" onclick="document.getElementById('premium_layer1').style.display='none';" class="img_l_pop btn_close btn_input" />
            <div class="pop_l_content">
                <p class="al_center mt60"><img src="/images/et/preservice201202/txt_pop1.png" alt="아래의 선물을 선택하셨습니다.응모하시겠습니까?" /></p>
                <p class="txt_error2 mt40" id="layer1_txt">
                </p>
                <p class="btnc">
                    <a href="#" onclick="applyEvent();return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a>
                    <a href="#" onclick="document.getElementById('premium_layer1').style.display='none';return false;"><img src="/images/common/btn_s_no.png" alt="아니오" /></a>
                </p>
            </div>
        </div><!-- //pop_l_wrap -->
    </div><!-- //layer_spop -->

    <!-- 레이어팝업2  height:294px;-->
    <div class="layer_spop"  id="premium_layer2" style="display:none;">
        <div class="pop_l_wrap" style="height:370px;">
            <p class="img_l_pop flag_tl">&nbsp;</p>
            <p class="img_l_pop flag_tr">&nbsp;</p>
            <p class="img_l_pop flag_bl">&nbsp;</p>
            <p class="img_l_pop flag_br">&nbsp;</p>
            <input type="button" title="응모하기 레이어 닫기" value="레이어닫기" onclick="document.getElementById('premium_layer2').style.display='none';location.reload();" class="img_l_pop btn_close btn_input" />
            <div class="pop_l_content">
                <p class="al_center mt60"><img src="/images/et/preservice201202/txt_pop2.png" alt="아래와 같이 응모되셨습니다." /></p>
                <p class="txt_error2 mt40" id="layer2_txt"></p>
                <p class="txt_error2" style="text-align:left;padding-bottom:30px;">※ 행사기간 동안 프리미엄 무이자할부/포인트백 서비스 신청 후 <br />
                	&nbsp;&nbsp;&nbsp;&nbsp;이용하시거나 무비무비/무료하와이여행 이벤트에 응모하셔야<br />
                	&nbsp;&nbsp;&nbsp;&nbsp;최종 추첨 대상이 되십니다. <br />
					&nbsp;&nbsp;&nbsp;&nbsp;지금! 프리미엄라운지 > 프리미엄회원이란 화면으로 이동하셔서<br /> 
					&nbsp;&nbsp;&nbsp;&nbsp;해당되는 서비스나 이벤트에 응모하세요.</p>
                <p class="btnc">
                    <a href="#" onclick="document.getElementById('premium_layer2').style.display='none';location.reload();return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a>
                </p>
            </div>
        </div><!-- //pop_l_wrap -->
    </div><!-- //layer_spop -->

    <!-- 레이어팝업3 height:294px;-->
    <div class="layer_spop"  id="premium_layer3" style="display:none;">
        <div class="pop_l_wrap">
            <p class="img_l_pop flag_tl">&nbsp;</p>
            <p class="img_l_pop flag_tr">&nbsp;</p>
            <p class="img_l_pop flag_bl">&nbsp;</p>
            <p class="img_l_pop flag_br">&nbsp;</p>
            <input type="button" title="응모하기 레이어 닫기" value="레이어닫기" onclick="document.getElementById('premium_layer3').style.display='none';" class="img_l_pop btn_close btn_input" />
            <div class="pop_l_content">
                <p class="al_center mt60"><img src="/images/et/preservice201202/txt_pop3.png" alt="회원님은 이미 아래의 선물로 응모되셨습니다." /></p>
                <p class="txt_error2 mt40" id="layer3_txt"></p>
                <p class="btnc">
                    <a href="#" onclick="document.getElementById('premium_layer3').style.display='none';return false;"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a>
                </p>
            </div>
        </div><!-- //pop_l_wrap -->
    </div><!-- //layer_spop -->

        
</div>	
</form>

<iframe width="0" hegiht="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈프레임"></iframe>
</body>

</html>

