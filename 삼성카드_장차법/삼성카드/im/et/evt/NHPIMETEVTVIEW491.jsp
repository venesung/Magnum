<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>가족사랑 Bonus One 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"����", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
form	{margin:0; padding:0;}

.event_bonus_one	{position:relative; z-index:1;}
.event_bonus_one	#lay_1{display:none; position:absolute; z-index:2; left:137px; top:710px; width:470px; height:294px;}
.event_bonus_one	#lay_2	{display:none; position:absolute; z-index:2; left:137px; top:700px; width:470px; height:294px;}
.event_bonus_one	#lay_3	{display:none; position:absolute; z-index:2; left:137px; top:740px; width:470px; height:294px;}
input {width: 13px; height: 13px; margin: 0; padding: 0;}

.event_bonus_one	.event_input_1	{
	position:absolute;
	z-index:2;
	left:132px;
	top:1103px;
}
.event_bonus_one	.event_input_2	{
	position:absolute;
	z-index:2;
	left:357px;
	top:1103px;
}
.event_bonus_one	.event_input_3	{
	position:absolute;
	z-index:2;
	left:577px;
	top:1103px;
}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('26562');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				//alert("이미 이벤트에 응모하셨습니다.");
				<%if (item03.equals("1")) {%>
				alert("이미 놀이공원 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("2")) { %>
				alert("이미 외식비 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} else if (item03.equals("3")) { %>
				alert("이미 주유소 5,000원 캐시백을 응모하셨습니다. 감사합니다.");
				<%} %>	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		
		var frm = document.frm1;
		var item03 = "";
		
		for(var j=0;j<frm.id_event_input_1.length; j++) {
			if (frm.id_event_input_1[j].checked == true) {
				item03 = frm.id_event_input_1[j].value;
			}
		}

		if(item03 == ""){
			alert("3가지 선물 중 한가지를 선택해주시기 바랍니다.");
		}
		else{
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
				return;
			<%}%>
			parent.submit_eventLog();
			document.evtFrm.item03.value = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		}
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"  title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<div class="event_bonus_one">

<script type="text/javascript" >
	function layeropen(num){
		for (i=1; i<4; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
</script>

	<map name="bonus_one" id="bonus_one">
		<area shape="rect" coords="96,1068,182,1089" alt="자세히보기" href="javascript:layeropen(1)" /> 
		<area shape="rect" coords="319,1068,405,1089" alt="자세히보기" href="javascript:layeropen(2)" />
		<area shape="rect" coords="540,1069,626,1090" alt="자세히보기" href="javascript:layeropen(3)" />
		<area shape="rect" coords="294,1187,431,1225" alt="응모하기" href="javascript:go_start();" />
  </map>
	<img src="/images/et/bonusone201204/bonusoneimg.jpg" usemap="#bonus_one" alt="가계 부담을 덜어 드리는. 삼성카드의 보너스! 생활비 Bonus one 이벤트" />
	
	
		<div class="hidden">
			<h1>삼성카드와 함께하면 행복이 보너스 가족사랑 Bonus One 이벤트</h1>
			<p>3가지 Bonus 중 1가지를 선택하시고, 가족 모두가 행복한 5월을 즐겨 보세요.</p>
			
			<dl>
				<dt>행사기간</dt>
				<dd>2012년 5월 1일(화) ~ 5월 31일(목)</dd>
				<dt>행사대상</dt>
				<dd>행사기간동안 이벤트 응모하시고 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원님</dd>
			</dl>
			
			<ul>
                <li>놀이공원 5,000원 캐시백<p><a href="#none" onclick="layeropen(1);return falfse;">자세히보기</a></p>
					<p class="e_input event_input_1">		  
					  <label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="대중교통 10% 캐시백" /></label>
					 </p>
				</li>
                <li>외식비 5,000원 캐시백<p><a href="#none" onclick="layeropen(2);return falfse;">자세히보기</a></p>
					<p class="e_input event_input_2">
					  <label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="주유소 5,000원 캐시백" /></label>
					</p>
				</li>
                <li>주유소 5,000원 캐시백<p><a href="#none" onclick="layeropen(3);return falfse;">자세히보기</a></p>
					<p class="e_input event_input_3">
					  <label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="이마트/홈플러스/롯데마트 5,000원 캐시백" /></label>
					 </p>
				</li>
			</ul>
			
            <p><a href="#none" onclick="go_start();return falfse;">응모하기</a></p>
			
		
		</div>
	
	
		<form name="frm1" method="post" action="">
		<p class="e_input event_input_1">		  
		  <label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="대중교통 10% 캐시백" /></label>
		 </p>
		<p class="e_input event_input_2">
		  <label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="주유소 5,000원 캐시백" /></label>
		 </p>
		<p class="e_input event_input_3">
		  <label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="이마트/홈플러스/롯데마트 5,000원 캐시백" /></label>
		 </p>
		</form>
<!-- 레이어팝업 -->
	<div id="lay_1">
		<map name="bonus_one_lay_1" id="bonus_one_lay_1">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(1)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_1.png" usemap="#bonus_one_lay_1" alt="대중교통 10% 캐시백" />
		
		<div class="hidden">
			<h1>놀이공원 5,000원 캐시백</h1>
			<p>행사기간 동안 대상 놀이공원에서 삼성카드로 7만원 이상 결제 시 5,000원 캐시백해 드립니다.</p>
			<table summary="캐시백 안내 표 - 행사기간, 행사대상, 대상 놀이공원 캐시백이 있습니다.">
				<caption>캐시백 안내</caption>
				<colgroup>
					<col width="70%" />
					<col width="30%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scope="row">행사기간</th>
						<td>2012년 5월 1일(화) ~ 5월 31일(목)</td>
					</tr>
					<tr>
						<th scope="row">행사대상</th>
						<td>행사기간 동안 이벤트에 응모하시고, 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원</td>
					</tr>
					<tr>
						<th scope="row">대상 놀이공원</th>
						<td>에버랜드/롯데월드/서울랜드/한국민속촌/꿈돌이랜드/대전오월드/금호패밀리랜드/이월드/통도환타지아/경주월드</td>
					</tr>
					<tr>
						<th scope="row">캐시백</th>
						<td>2012년 6월 15일(금) 이후 결제대금에서 자동차감</td>
					</tr>
				</tbody>			
			
			</table>
            <p><a href="#none" onclick="layerclose(1);return falfse;">닫기</a></p>
		</div>
	</div>
	
	
	<div id="lay_2">
		<map name="bonus_one_lay_2" id="bonus_one_lay_2">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(2)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_2.png" usemap="#bonus_one_lay_2" alt="주유소 5,000원 캐시백" />
		
		<div class="hidden">
			<h1>외식비 5,000원 캐시백</h1>
			<p>행사기간 동안 대상 외식 업종에서 삼성카드로 3만원 이상을 3회 이상 결제 시 5,000원을 캐시백해 드립니다.</p>
			<table summary="외식비 안내 표 - 행사기간, 행사대상, 대상 외식업종, 캐시백이 있습니다.">
				<caption>외식비 안내</caption>
				<colgroup>
					<col width="70%" />
					<col width="30%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scope="row">행사기간</th>
						<td>2012년 5월 1일(화) ~ 5월 31일(목)</td>
					</tr>
					<tr>
						<th scope="row">행사대상</th>
						<td>행사기간 동안 이벤트에 응모하시고, 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원</td>
					</tr>
					<tr>
						<th scope="row">대상 놀이공원</th>
						<td>한식/일식/중식/양식/패밀리레스토랑/뷔페/패스트푸드점/간이음식점</td>
					</tr>
					<tr>
						<th scope="row">캐시백</th>
						<td>2012년 6월 15일(금) 이후 결제대금에서 자동차감</td>
					</tr>
				</tbody>			
			
			</table>
			<p>대상 외식 업종은 삼성카드 가맹점 업종 분류 기준에 의한 등록 가맹점에 한합니다.</p>
            <p><a href="#none" onclick="layerclose(2);return falfse;" >닫기</a></p>
		</div>
	
	
	</div>

	<div id="lay_3">
		<map name="bonus_one_lay_3" id="bonus_one_lay_3">
			<area shape="rect" coords="439,18,452,32" alt="닫기" href="javascript:layerclose(3)" />
		</map>
		<img src="/images/et/bonusone201204/layer_bonus_one_11_3.png" usemap="#bonus_one_lay_3" alt="이마트/홈플러스/롯데마트 5,000원 캐시백" />
		
		<div class="hidden">
			<h1>주유소 5,000원 캐시백</h1>
			<p>행사기간 동안 대상 주유소에서 삼성카드로 7만원 이상을 2회 이상 결제 시 5,000원을 캐시백해 드립니다.</p>
			<table summary="주유소 안내 표 - 행사기간, 행사대상, 캐시백이 있습니다.">
				<caption>주유소 안내</caption>
				<colgroup>
					<col width="70%" />
					<col width="30%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scope="row">행사기간</th>
						<td>2012년 5월 1일(화) ~ 5월 31일(목)</td>
					</tr>
					<tr>
						<th scope="row">행사대상</th>
						<td>행사기간 동안 이벤트에 응모하시고, 삼성카드로 일시불 및 할부 50만원 이상 이용하신 회원</td>
					</tr>
					<tr>
						<th scope="row">캐시백</th>
						<td>2012년 6월 15일(금) 이후 결제대금에서 자동차감</td>
					</tr>
				</tbody>			
			
			</table>
			<p>대상 주유소는 삼성카드 가맹점 업종 분류 기준에 의한 등록 가맹점에 한합니다.(LPG/가정용연료제외)</p>
            <p><a href="#none" onclick="layerclose(3);return falfse;" >닫기</a></p>
		</div>
		
		
	</div>
<!-- //레이어팝업 -->
</div>

	

</body>

</html>

