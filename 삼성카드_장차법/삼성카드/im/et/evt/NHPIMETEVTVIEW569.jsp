<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/base.css" />	<!-- SR내역 13.04.19 -->
<link rel="stylesheet" type="text/css" href="/css/class.css" />	<!-- SR내역 13.04.19 -->
<title>2013 삼성카드 오토캠핑 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
</style>
<!-- 레이어팝업 스크립트 SR내역 13.04.19--> 
<script type="text/javascript"> 
	function layeropen(num){ 
            for (i=1; i<2; i++) { 
                document.getElementById("lay_"+i).style.display = "none"; 
                if (i==num) { document.getElementById("lay_"+num).style.display = "block"; } 
            } 
        } 
        function layerclose(num){ 
            document.getElementById("lay_"+num).style.display = "none"; 
        } 
</script> 
<script type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('<%=cmsSeq%>');
		<%
			}else{
		%>
				if(parent.event_check()){
					<%if(event_ok.equals("Y")){%>
						layeropen(1);	//SR내역 13.04.19
						//alert("이미 이벤트에 응모하셨습니다.");
					<%}else{ %>
						applyEvent();
					<%}%>		
				}

		<%}%>
	}

	function applyEvent() {
		Future = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=710,height=758,left=100,top=50";
		//Future = "fullscreen=no, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, width=710,height=743";
		newsWindow = window.open("/hp/im/et/evt.do?method=getAutoCampingPop2013&eventNo=<%=eventNo%>", "autoCamping" , Future); 
		newsWindow.focus();
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body topmargin="0" leftmargin="0">

<img src="/images/et/auto2013/event_camping.jpg" alt="2013 삼성카드 오토캠핑 " border="0" usemap="#Map"  />
<map name="Map" id="Map">
		<!--  <area shape="rect" coords="151,2064,256,2096" href="javascript:go_start();" title="새창" alt="1차 충남 홍성 세울터 오토캠핑장 응모하기" />-->
		<!--  <area shape="rect" coords="473,2064,578,2096" href="javascript:go_start();" title="새창" alt="2차 경기 가평 늘푸른 쉼터 응모하기" />-->
		<area shape="rect" coords="151,2064,256,2096" href="javascript:go_start();" title="새창" alt="1차 충남 홍성 세울터 오토캠핑장 응모하기" />
		<area shape="rect" coords="473,2064,578,2096" href="javascript:go_start();" title="새창" alt="2차 경기 가평 늘푸른 쉼터 응모하기" />
</map>
<!-- SR내역 13.04.19 --> 
<div id="lay_1" class="pop_l_position pop_l_wrap_alert" style="left: 17%; top: 1705px; display: none;"> 
    <div class="pop_l_wrap"><p class="img_l_pop flag_tl"> </p><p class="img_l_pop flag_tr"> </p><p class="img_l_pop flag_bl"> </p><p class="img_l_pop flag_br"> </p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeLayerPopup();" value="레이어닫기" title="레이어 닫기" /> 
        <p class="pop_tit2"><img src="/images/et/auto2013/layer_tit_camp.png" alt="삼성카드 오토캠핑 이벤트에 정상적으로 응모하셨습니다." /></p> 
        <div class="pop_l_content"> 
            <div class="pop_l_alert02"> 
                <p>이벤트에 응모해 주신 회원님께 감사의 마음을 <br /> 
                전하고자, 참 실용적인 캠핑 용품 특가전을 마련했습니다.<br /> 
                아래 링크를 통해 방문해 주시기 바랍니다.</p> 
                <p class="btnc pt20 pb20"><a href="javascript:layerclose(1);closeLayerPopup();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
                <div class="line_lgray"> </div> 
                <p class="btnc">이벤트 응모회원만 접속 가능합니다. <a href="https://shopping.samsungcard.com/cms_content/ec/sp/ss/camping.html" target="_blank" title="새창"><img src="/images/et/auto2013/btn_camping.png" alt="캠핑용품 특가전 바로가기" /></a></p> 
            </div> 
         </div> 
     </div> 
</div> 
<!-- SR내역 13.04.19 --> 

<div style="font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;">
	<h1>2013 삼성카드 오토캠핑</h1>
	<p>푸른 하늘, 푸른숲이 맞닿은 자연 속에서 사랑하는 가족과 함께 하는 휴식과 감동의 시간! 삼성카드 오토캠핑 이벤트에 참여하세요. 잊을 수 없는 가족의 추억을 만들어 드립니다.</p>
	
	<h2>행사기간</h2>
	<p>
		1차 : 2013년 5월 25일(토)~26일(일)까지
		2차 : 2013년 6월 1일(토)~2일(일)까지
	</p>
	<h2>행사장소</h2>
	<p>
		1차 : 세울터 오토캠핑장 / 충남 홍성군
		2차 : 늘푸른쉼터 / 경기 가평균
	</p>
	<h2>행사내용</h2>
	<p>
		이벤트에 응모하시고 응모기간 동안
		1. 일시불/할부 합산 30만원 이상 이용하시거나
		2. 일시불/할부 3회 이상 이용하시면
		추첨을 통해 차수별로 100가족을 선정하여 삼성카드 오토캠핑에 초대합니다.
		- 먼저 이용하시고 나중에 응모하셔도 추첨 대상이 됩니다.
		- 텐트가 없으신 분은 응모 시 대여 신청하실 수 있습니다.
		- 한 가족당 1 사이트가 제공됩니다.(1개 텐트 설치 가능)
	</p>
	<p>
		이벤트 응모 회원님께만 드리는 캠핑 용품 특가 쇼핑 혜택
		지금 이젠트에 응모하시면, 유명브랜드 캠핑 용품을 특가로 구매하실 수 있는 기회를 드립니다.
		- 이미 이벤트에 응모하신 회원님께서는 응모하기 버튼을 클릭하시면 캠핑용품 특가전으로 이동하실 수 있습니다.
	</p>
	<h2>응모기간</h2>
	<p>2013년 4월 15일(월)~5월12일(일)까지</p>
	<h2>당첨자 발표</h2>
	<p>2013년 5월 16일(목)</p>
	<h2>준비물</h2>
	<p>침구류, 세면도구, 음식 및 기타 캠핑용품</p>
	<h2>행사일정</h2>
	<table summary="일정, 시간, 행사, 내용으로 구성된 행사일정">
		<caption>행사일정</caption>
		<thead>
			<tr>
				<th scope="col">일정</th>
				<th scope="col">시간</th>
				<th scope="col">행사</th>
				<th scope="col">내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="rowgroup" rowspan="4">1일차</th>
				<td>08:00~13:00</td>
				<td>입촌 및 증식</td>
				<td>웰컴패키지 수령</td>
			</tr>
			<tr>
				<td>11:00~17:00</td>
				<td>체험 이벤트</td>
				<td>사랑의 편지 배달, 미니 올림픽, 풍선 아트, 문패 만들기 등</td>
			</tr>
			<tr>
				<td>17:00~19:00</td>
				<td>석식</td>
				<td>-</td>
			</tr>
			<tr>
				<td>19:00~21:00</td>
				<td>레크리에이션</td>
				<td>가족 퀴즈쇼, 장기자랑, 낭만콘서트, 행운권 추첨 등</td>
			</tr>
			<tr>
				<th scope="row" rowspan="2">2일차</th>
				<td>07:00~10:00</td>
				<td>조식</td>
				<td>-</td>
			</tr>
			<tr>
				<td>10:00~12:00</td>
				<td>귀가</td>
				<td>-</td>
			</tr>
		</tbody>
	</table>
	<p>행사 일정 및 세부 프로그램은 당사 사정 및 기상 상황에 따라 변경될 수 있습니다.</p>
	
	<h2>캠핑장 응모하기</h2>
	<ol>
		<li>
			1차
			기간 : 2013년 5월 25일(토) ~ 26일(일)
			장소 : 충남 홍성 세울터 오토캠핑장
			<a href="javascript:go_start();" title="새창">응모하기</a>
		</li>
		<li>
			2차
			기간 : 2013년 6월 1일(토) ~ 2일(일)
			장소 : 경기 가평 늘푸른 쉼터
			<a href="javascript:go_start();" title="새창">응모하기</a>
		</li>
	</ol>
	<p>
		- 오토캠핑 현장 사진 및 동영상은 삼성카드 마케팅에 활용될 수 있습니다.
		- 실적 산정 시 본인명의로 발급된 가족카드 이용 실적이 포함되며, 법인/체크/선불/올앳/기프트카드는 제외됩니다.
		- 카드사 및 제휴사의 사정으로 변경 &middot; 중단 될 수 있으며 그 내용을 사전에 알려 드립니다.
	</p>
</div>
	
</body>

</html>