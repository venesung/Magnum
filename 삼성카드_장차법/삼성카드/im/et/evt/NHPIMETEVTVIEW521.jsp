<%/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW518.jsp
 * Author: 모정서 과장
 * Created on 2012. 6. 25.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%
	String loginYN		= (String)request.getAttribute("loginYN");
	String event_ok		= (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN	= (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN	= (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg		= (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg		= (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo		= (String)request.getAttribute("eventNo"); //이벤트 No
	String startDate	= (String)request.getAttribute("beginDate"); //이벤트 시작일
	String endDate		= (String)request.getAttribute("endDate"); //이벤트 종료일
	String item03		= (String)request.getAttribute("eventEtc1"); //ITCMEVENTTT.CMS_SEQ
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 포인트를 쏴라 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.new_rankT{color: #777777; border: 1px solid #cccbb9; border-collapse: collapse; width: 237px; position: absolute; top: 748px; left: 425px; }
.new_rankT th{color: #ffffff; background-color: #999999; border:1px solid #cccbb9; padding: 5px 0;}
.new_rankT td{border:1px solid #cccbb9; text-align: center; font-size: 11px; padding:3px 0;}
.new_rankT td.rank_t{font-weight: bold;}
.new_rankT td.id_t{text-align: left; padding-left: 10px;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script src="/images/et/archery2012/embedswf.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>
<script language="javascript" type="text/javascript">
	function EmbedFlash(){
		var flashVars =
		{
			// debug : "true"
		};

		embedSWF("flashLayer", "/images/et/archery2012/Main.swf", "340", "340",
		{
			id : "flash"
		},
		{
			allowScriptAccess : "always",
			allowFullscreen : "true",
			wmode : "transparent"
		}, flashVars);

		// 나의 점수
		getMyScoreFirst();
		// 현재순위
		getArcheryRank();
	}

<%
if(loginYN.equals("N")){ 
%>
	function fStart(){
		parent.eventLogin('<%=item03%>');
	}
<%
}else{
%>
	function fStart(){
	<%if( endDateYN.equals("N")){ %>
		alert("<%=endMsg %>");
	<%}else if( beginDateYN.equals("N")){ %>
		alert("<%=beginMsg %>");
	<%}else if(event_ok.equals("Y")){%>
		alert("이미 이벤트에 응모하셨습니다.");	
	<%}else{ %>
		if(document.form1.arrow.value > 0){
			flash.fStart();
		}
		else{
			alert("획득하신 화살이 없습니다.");
		}
	<% } %>	
	}
<%
}
%>

	function fPopup(){
		flash.fPopup(
		{
			//실제 데이터를 넣어주시면 됩니다
			score : document.form1.score.value,	// 현재점수
			total : document.form1.total.value,	// 총점수
			arrow : document.form1.arrow.value,	// 남은화살수
			point : document.form1.point.value	// 누적포인트
		});
	}

	function fCheck(idx){
		//빙고 체크 후 fUpdate();호출
		var score = 0;
		switch(idx){
			case 0 : score = 10; break;
			case 1 : score =  9; break;
			case 2 : score =  8; break;
			case 3 : score =  7; break;
			case 4 : score =  6; break;
			case 5 : score =  0; break;
			case 6 : score =  0; break;
			default : score = 0; break;
		}
		// 이벤트 응모
		document.form1.score.value = score;
		insertArchery2012(score);
		fUpdate();
	}

	// 나의 점수
	function getMyScoreFirst(){
<% if(loginYN.equals("Y")){ %>
        var parameter = "eventNo=<%=eventNo%>&amp;item03=<%=item03%>&amp;startDate=<%=startDate%>&amp;endDate=<%=endDate%>";
        callJsonNonXecure("myScore", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "getMyArcheryScore", parameter, "myScoreFirstCallBack",null,null,true);
<% } %>
	}

	function myScoreFirstCallBack(callId, data){
		var cnt1 = data.cnt1; // 획득점수
		var cnt2 = data.cnt2; // 명중수
		var cnt3 = data.cnt3; // 남은화살수
		var score = data.score; // 획득점수
		var point = data.point; // 획득포인트

		if(cnt1 == undefined) cnt1 = "0";
		if(cnt2 == undefined) cnt2 = "0";
		if(cnt3 == undefined) cnt3 = "0";
		if(score == undefined) score = "0";
		if(point == undefined) point = "0";

		document.getElementById("myScore").innerHTML  ="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 135px; text-align:right; width:20px;'>"+cnt1+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 233px; text-align:right; width:20px;'>"+cnt2+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 356px; text-align:right; width:20px;'>"+cnt3+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 465px; text-align:right; width:40px;'>"+score+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 610px; text-align:right; width:40px;'>"+point+"</p>";

		document.form1.score.value=0;
		document.form1.total.value=score;
		document.form1.arrow.value=cnt3;
		document.form1.point.value=point;
	}
	
	// 나의 점수
	function getMyScore(){
<% if(loginYN.equals("Y")){ %>
        var parameter = "eventNo=<%=eventNo%>&amp;item03=<%=item03%>&amp;startDate=<%=startDate%>&amp;endDate=<%=endDate%>";
        callJsonNonXecure("myScore", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "getMyArcheryScore", parameter, "myScoreCallBack",null,null,true);
<% } %>
	}

	function myScoreCallBack(callId, data){
		var cnt1 = data.cnt1; // 획득점수
		var cnt2 = data.cnt2; // 명중수
		var cnt3 = data.cnt3; // 남은화살수
		var score = data.score; // 총획득점수
		var point = data.point; // 총획득포인트

		if(cnt1 == undefined) cnt1 = "0";
		if(cnt2 == undefined) cnt2 = "0";
		if(cnt3 == undefined) cnt3 = "0";
		if(score == undefined) score = "0";
		if(point == undefined) point = "0";

		document.getElementById("myScore").innerHTML  ="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 135px; text-align:right; width:20px;'>"+cnt1+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 233px; text-align:right; width:20px;'>"+cnt2+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 356px; text-align:right; width:20px;'>"+cnt3+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 465px; text-align:right; width:40px;'>"+score+"</p>";
		document.getElementById("myScore").innerHTML +="<p style='position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 610px; text-align:right; width:40px;'>"+point+"</p>";
			
		document.form1.total.value=score;
		document.form1.arrow.value=cnt3;
		document.form1.point.value=point;

		fPopup();
	}

	// 현재순위
	function getArcheryRank(){
        var parameter = "eventNo=<%=eventNo%>&amp;item03=<%=item03%>";
        callJsonNonXecure("archeryRank", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "getArcheryRank2012", parameter, "archeryRankCallBack",null,null,true);
	}

	function archeryRankCallBack(callId, data){
		// 리스트
		var vo = data;
		var makeTag = "";

		$("#rankList").empty();
		$.each(vo, function(i){
			makeTag += "<tr>"; 
			makeTag += "<td class='rank_t'>&nbsp;"+vo[i].rank+"&nbsp;</td>";
			makeTag += "<td class='id_t'>"+vo[i].userId+"</td>";
			makeTag += "<td>"+vo[i].cnt2+"</td>";
			makeTag += "<td>"+vo[i].score+"</td>";
			makeTag += "</tr>";
		});
		$("#rankList").append(makeTag);
	}

	// 이벤트 응모
	function insertArchery2012(score){
        var parameter = "eventNo=<%=eventNo%>&amp;item03=<%=item03%>&amp;score="+score;
        callJsonNonXecure("archery", "com.scard.hp.im.et.evt.web.NHPIMETEVT001Ctrl", "insertArchery2012", parameter, "archeryCallBack",null,null,true);
	}

	function archeryCallBack(callId, data){
		// 요약
		var resultCnt = data.resultCnt; // 응모결과(1:성공,1외:실패)

		if(resultCnt==1){
			getMyScore();
			getArcheryRank();
		}
		else{
			if(resultCnt == "N"){
				alert("사용자 세션이 만료되었습니다. 다시 로그인하여 주십시요.");
			}
			else if(resultCnt == "Z"){
				alert("현재 획득하신 화살이 없습니다.");
			}
			else{
				alert("지금은 사용자가 많아 처리가 지연되고 있습니다. 잠시 후 다시 이용해 주시기 바랍니다.");
			}
		}
	}
	
	// 팝업 : 나의 순위
	function archeryMyRank(){
		<% if(loginYN.equals("N")){ %>
		parent.eventLogin('<%=item03%>');
		window.location.href="#login";
		<% }else{ %>
		window.open('/hp/im/et/evt.do?method=getArcheryMyRank2012&eventNo=<%=eventNo%>&item03=<%=item03%>', 'archery2012', 'width=470px, height=302px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
		<% } %>
	}

	// 팝업 : 행사업종 자세히보기
	function chainInfo(){
		window.open('/images/et/archery2012/archery2012ChainInfo.html', 'archery2012ChainInfo', 'width=710px, height=540px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}
</script>
</head>
<body onload="EmbedFlash()">
<form name="form1" action="">
<input type="hidden" name="score" value="" />
<input type="hidden" name="total" value="" />
<input type="hidden" name="arrow" value="" />
<input type="hidden" name="point" value="" />
</form>
	<div class="landWrap">
		<p><img src="/images/et/archery2012/120621_event.jpg" alt="삼성카드 포인트를 쏴라" border="0" usemap="#Map" />
		
		<div class="hidden">
			<p>대한민국 국가대표팀을 응원합니다!</p>
			<h1>삼성카드 포인트를 쏴라!</h1>
			<p>대한민국 금메달 효자종목 양궁! 재미있는 양궁 이벤트도 즐기고 푸짐한 포인트도 받으면서 우리나라 국가대표팀을 응원해 주세요.</p>
			
			<dl>
				<dt>행사기간</dt>
				<dd>2012년 7월 1일(일) ~ 8월 20일(월)</dd>
				<dt>행사내용</dt>
				<dd>대상 가맹점에서 3만원 이상 삼성카드로 결제하시면 아래 기준에 따라 양궁 게임 참여 기회를 드리고, 참여하신 모든 회원님께 최대 20,000 서비스포인트 제공과 함께 순위에 따라 다양한 경품 제공</dd>
				<dt>당첨자 발표</dt>
				<dd>2012년 8월 24일(금) 삼성카드 홈페이지 당첨자 발표란</dd>
				<dt>경품 및 포인트 제공일</dt>
				<dd>2012년 9월 5일 (수) 경품 당첨회원은 개별 연락 예정</dd>
			</dl>
			
			<h2>게임방법</h2>
			<ul>
				<li>1단계 - 게임 START 버튼을 클릭한다</li>
				<li>2단계 - Pull 버튼을 아래로 드래그 한 후 흔들리는 과녁이 가운데 정확하게 들어올 때 마우스 버튼을 뗀다</li>
				<li>3단계 - 점수에 따라 포인트를 드리며 순위에 따라 푸짐한 경품을 드립니다.</li>
			</ul>
			
			<h2>화살 지급 기준 안내</h2>
			<table summary="화살지급기준안내 표 - 가맹점 이용금액과 제공화살의 정보가 있습니다.">
				<caption>화살지급기준안내</caption>
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">가맹점 이용금액</th>
						<th scope="col">3만원이상</th>
						<th scope="col">7만원이상</th>
						<th scope="col">10만원이상</th>
						<th scope="col">30만원이상</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>제공화살</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>5</td>
					</tr>
				</tbody>
			</table>
			
            <p>행사대상 업종안내(외식/주유/할인점/백화점/학원업종) <a href="#none" onclick="chainInfo();return false;">행사업종자세히보기</a></p>
		
			<h2>경품 및 포인트 지급 기준</h2>
			<p>이벤트에 참여하신 회원님께 50점 잇아 명중 시 100% 서비스포인트를 드립니다.</p>
			
			<table summary="경품 및 포인트 지급 기준 안내 표 - 점수, 지급포인트, 점수, 지급포인트정보가 있습니다.">
				<caption>경품 및 포인트 지급 기준 안내</caption>
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<thead>
					<tr>
						<th>점수</th>
						<th>지급포인트</th>
						<th>점수</th>
						<th>지급포인트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>500점 이상</td>
						<td>20,000P</td>
						<td>250점 이상</td>
						<td>5,000P</td>
					</tr>
					<tr>
						<td>450점 이상</td>
						<td>17,000P</td>
						<td>200점 이상</td>
						<td>4,000P</td>
					</tr>
					<tr>
						<td>400점 이상</td>
						<td>13,000P</td>
						<td>150점 이상</td>
						<td>3,000P</td>
					</tr>
					<tr>
						<td>350점 이상</td>
						<td>10,000P</td>
						<td>100점 이상</td>
						<td>2,000P</td>
					</tr>
					<tr>
						<td>300점 이상</td>
						<td>7,000P</td>
						<td>50점 이상</td>
						<td>1,000P</td>
					</tr>
				</tbody>
				
			</table>
		
			<p>이벤트에 참여하신 회원님 중 상위 10등까지 다양한 경품을 드립니다.</p>
			<ul>
				<li>금메달 1등 - 삼성카드 양궁대회 금메달(금 10돈)</li>
				<li>은메달 2등 - 삼성 Gift카드 100만원권</li>
				<li>동메달 3등 - 삼성 Gift카드 50만원권</li>
				<li>참가상 4 ~10등 - 에버랜드 자유이용권 2매</li>
			</ul>
		
			<ul>
				<li>- 동일 가맹점 1일 2회 이상 매출 발생시 2회까지 사용한 건에 대해서 기회가 부여 됩니다.(3회 이상 건은 기회 미발생)</li>
				<li>- 삼성카드 홈페이지 로그인 시 사용금액에 따라서 게임기회가 자동으로 부여됩니다.</li>
			</ul>
			
			<p>유의사항</p>
			<ul>
				<li>- 당첨된 경품의 제세공과금(22%)은 회원님 본인 부담입니다.</li>
				<li>- 응모한 본인 카드의 승인 및 결제건이 승인 취소 혹은 매출 취소가 될 경우, 해당 당첨 사실이 무효처리 됩니다.</li>
				<li>- 삼성카드 가맹점 업종 분류 기준에 의한 등록 가맹점에 한하며, 일부 가맹점 및 온라인 이용금액은 제외됩니다.</li>
				<li>- 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
				<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
			</ul>
			
		
		</div>
		
		
<map name="Map" id="Map">
<area shape="rect" coords="564,717,664,736" href="#" onclick="archeryMyRank();" alt="나의 순위 보기" />
<area shape="rect" coords="142,1060,329,1098" href="javascript:fStart();" alt="게임 START" />
<area shape="rect" coords="523,1527,658,1548" href="#" onclick="chainInfo();" alt="행사업종자세히보기"/>
</map></p>
	  <!-- 플래시영역 --><div id="flashLayer" style="position:absolute; top:710px; left:70px;"></div><!-- //플래시영역 -->

</div>
	<div id="myScore">
	<p style="position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 135px; text-align:right; width:20px;">0</p>
	<p style="position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 233px; text-align:right; width:20px;">0</p><!-- 120628 수정 -->
	<p style="position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 356px; text-align:right; width:20px;">0</p><!-- 120628 수정 -->
	<p style="position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 465px; text-align:right; width:40px;">0</p>
	<p style="position: absolute; color: #ed9321; top: 646px; font-weight: bold; left: 610px; text-align:right; width:40px;">0</p>
	</div>
	<table summary="순위, 아이디, 명중수, 점수 등 현재순위를 확인하실 수 있습니다." class="new_rankT">
    <caption>현재순위</caption>
		<colgroup><col width="40px" /><col /><col width="43px" /><col width="42px" /></colgroup>
		<thead>
			<tr>
				<th>순위</th>
				<th>아이디</th>
				<th>명중수</th>
				<th>점수</th>
			</tr>
		</thead>
		<tbody id="rankList">
			<tr>
				<td class="rank_t"></td>
				<td class="id_t"></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</body>
</html>  
