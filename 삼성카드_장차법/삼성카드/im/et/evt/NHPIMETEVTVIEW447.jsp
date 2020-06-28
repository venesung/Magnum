<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>용띠라서 행복한 이유! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
p {margin:0; padding:0}
#lay_1{display:none; position:absolute; z-index:2; left:131px; top:280px; width:661px; height:316px;}
#lay_1 .pop_l_wrap{background: url("/images/et/dragon2011/lay_popbg.gif") no-repeat left top; width: 460px; height: 240px; position: relative;}
.pop_l_wrap .btn_close{background-position: left top; height: 16px; right: 19px; top: 14px; width: 14px; position: absolute;}
.pop_l_wrap .img_l_pop{background:url("/images/et/dragon2011/double_pointclosebtn.png") no-repeat 0 0; overflow: hidden; z-index: 513;}
.btn_input{border: 0 none; cursor:pointer; overflow: hidden; text-indent: -5000px;}


#wrap{width: 728px; overflow: hidden;}
.pop_title01 {text-align: center; padding: 63px 0 0 0;}
.pop_btn01 {text-align: center; padding: 43px 0 0 0;}
.pop_btn02 {text-align: center; padding: 48px 0 0 0;}
.pop_text {text-align: center; padding: 16px 0 0 0;}
.pop_text span{color: #5a96c8; font-weight: bold;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12124');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("이벤트에 응모해 주셔서 감사합니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
	function noDragon(){
		alert("죄송합니다. 본 이벤트는 용띠 회원님들만 응모가 가능합니다.");
	}

	function layeropen(num){
		for (i=1; i<2; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
	function open_layer(id) {
		hide_select();
		document.getElementById(id).style.display = "block";
	}
	function close_layer(id) {
		show_select();
		document.getElementById(id).style.display = "none";
	}
	function show_sitemap(idName,a) {
		var obj_btn = document.getElementById(a);
		open_layer(idName);
		obj_btn.src = obj_btn.src.replace("_off","_on");
	}
	function hide_sitemap(idName,a) {
		var obj_btn = document.getElementById(a);
		close_layer(idName);
		obj_btn.src = obj_btn.src.replace("_on","_off");
	}
	
	
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=applyDragon2011" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>
<div id="wrap">
	<img src="/images/et/dragon2011/111220_doublepoint.jpg" alt="용띠라서 행복한 이유! 더블 포인트 적립 이벤트" usemap="#Map" />
	<map name="Map" id="Map">
		<area shape="rect" coords="560,213,688,241" href="#" onclick="go_start();" alt="이벤트응모하기"/>
	</map>
    <div class="hidden">
		<h1> 용띠라서 행복한 이유! 더블포인트 적립 포인트</h1>
		<p>2012년 임진년 용띠 회원님들 화이팅 포인트 더블 적립으로 삼성카드가 응원합니다.</p>
		<p><a href="#none" onclick="javascript:go_start();" title="더블 포인트 적립 이벤트 응모 바로가기">이벤트 응모하기</a></p>
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 1월 1일(일) ~ 1월 31일 (화)</dd>
			<dt>행사대상</dt>
			<dd>용띠회원(88/76/64/52/40/28/16년생-주민등록번호 기준) 중 행사기간 동안 일시불 및 할부 30만원 이상 이용하신 회원님</dd>
			<dt>행사내용</dt>
			<dd>이벤트 응모하신 후 행사기간 동안 적립하신 보너스포인트 / 빅포인트에 대해 동일한 서비스 포인트를 추가 적립해 드립니다(추가 10,000포인트)</dd>
			<dd>(예) 이벤트에 응모하신 회원님이 행사기간 동안 보너스포인트 10,000P를 적립하시면 행사 종료후 서비스 포인트10,000p 추가 적립</dd>
			<dt>포인트 적립일자 </dt>
			<dd>2012년 2월 15일(수)</dd>
			<dt>경품당첨자 발표 및 배송일자</dt>
			<dd>2012년 2월 14일</dd>
		</dl>
		
		<p>Bonus 혜택! 60년만에 찾아오는 흑룡띠를 맞이하여 총 60명 회원님께 추첨을 통해 푸짐한 경품을 드립니다.</p>
		
		<table summary="등수에 따른 경품안내 표 - 등수, 추첨회원수, 경품내용이 있습니다.">
			<caption>경품안내</caption>
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="60%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">등수</th>
					<th scope="col">추첨 회원수</th>
					<th scope="col">경품내용</th>
				</tr>
				<tr>
					<td>1등</td>
					<td>1명</td>
					<td>용이 새겨진 금카드(10돈)</td>
				</tr>
				<tr>
					<td>2등</td>
					<td>10명</td>
					<td>삼성 기프트 카드 50,000원권</td>
				</tr>
				<tr>
					<td>3등</td>
					<td>49명</td>
					<td>서비스 포인트 5,000Point</td>
				</tr>
			</thead>
		</table>
		
		<dl>
			<dt>주의사항</dt>
			<dd>
				<ul>
					<li>보너스포인트/빅포인트에 한해 적용되며 (세이브포인트, 서비스포인트 등 제외) 법인/ 올앳/선불/체크/기프트카드는 제외됩니다.</li>
					<li>카드사 및 제휴사의 사정으로 인해 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
				</ul>
			</dd>
		</dl>		
	</div>
</div>

</body>

</html>

