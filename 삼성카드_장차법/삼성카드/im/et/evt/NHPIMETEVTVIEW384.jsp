<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>추억의 명작을 감상하는 시간 - 삼성카드</title>
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
	
	//String dupEventB = (String)request.getAttribute("dupEventB");
	
%>
<style type="text/css">
body, p {margin:0; padding:0}
img {border:0 none}
#wrap{position:relative;width:700px;}
.img_num{font-size:0;line-height:0}
#wrap .img_num{position: absolute; top: 835px;z-index:10;width:140px;} /* 수정 110330 */
#wrap .no_30ora	em{position:absolute;top:-5000px;left:0;}
.no_30ora{background:url("/images/et/movie/txt_no_30ora.png") no-repeat 0 0;display:inline-block;height:18px;overflow:hidden;width:13px;}
.n30_num00{background-position:-117px 0;}
.n30_num01{background-position:0 0;}
.n30_num02{background-position:-13px 0;}
.n30_num03{background-position:-26px 0;}
.n30_num04{background-position:-39px 0;}
.n30_num05{background-position:-52px 0;}
.n30_num06{background-position:-65px 0;}
.n30_num07{background-position:-78px 0;}
.n30_num08{background-position:-91px 0;}
.n30_num09{background-position:-104px 0;}
.pt01{left: 90px;} /* 수정 110330 */
.pt02{left: 298px;} /* 수정 110330 */
.pt03{left: 505px;} /* 수정 110330 */
.pt05{padding-top:2px;}
.space{margin-left:70px;}

.count{position:absolute;right:0;top:0}
#id_layer01,
#id_layer02,
#id_layer03{z-index:200;width:550px;display:none;z-index:10;position:absolute;left:116px;top:510px;}
.radio_btn{position:absolute;top:280px;left:250px;line-height:25px;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start(gubun) {
		
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('11420');
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
	function applyEvent(gubun) {
		 
		for(i=0; i<9; i++){
			if(document.evtFrm.r00[i].checked){
				gift1 = document.evtFrm.r00[i].value;
				document.evtFrm.r00.value = gift1;
				chkCheckbox = "Y";
			}
		}
		//alert(document.evtFrm.r00.value);
		if(chkCheckbox =="N" ){
			alert("관람이 가능한 장소를 선택해 주세요.");
			return ;
		}		
		
		
	    document.evtFrm.eventgubun.value = gubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
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

	function goLayerPop(gubun) {
	<%
		if(loginYN.equals("N")){ 
	%>
		parent.eventLogin('11420');
	<%
		}else{
	%>
		<%if(dupEventA.equals("Y")){%>
		alert("이미 이벤트에 응모하셨습니다.");
		return;
		<%}%>
		<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			return;
		<%}else if( beginDateYN.equals("N")){ %>
		  	alert("<%=beginMsg %>");
		  	return;
		<%}else{ %>
			if (gubun == "1") {
				show('id_layer01');
			} else if (gubun == "2") {
				show('id_layer02');
			} else if (gubun == "3") {
				show('id_layer03');
			}
		<% } %>	
	<% } %>
	}
	
	function applyOk(){
		alert("투표해 주셔서 감사합니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>


<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=EventInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>



	<div id="wrap">

		<p><img src="/images/et/movie/event01_110321.jpg" alt="추억의 명작을 감상하는 시간 Cinema Choice" usemap="#monteselect" /></p>
		<div class="img_num pt01">
			<img src="/images/et/movie/title00.png" alt="현재" />
			<div class="count">
			<% for(int i=0;i<strCount1.length();i++) {	%>
			<span class="no_30ora n30_num0<%=strCount1.charAt(i)%>"><em><%=strCount1.charAt(i)%></em></span>
			<%} %>
			<img src="/images/et/movie/title04.png" alt="표" /></div>
		</div>
		<div class="img_num pt02">
			<img src="/images/et/movie/title00.png" alt="현재" />
			<div class="count">
			<% for(int i=0;i<strCount2.length();i++) {	%>
			<span class="no_30ora n30_num0<%=strCount2.charAt(i)%>"><em><%=strCount2.charAt(i)%></em></span>
			<%} %>
			<img src="/images/et/movie/title04.png" alt="표" /></div>
		</div>
		<div class="img_num pt03">
			<img src="/images/et/movie/title00.png" alt="현재" />
			<div class="count">
			<% for(int i=0;i<strCount3.length();i++) {	%>
			<span class="no_30ora n30_num0<%=strCount3.charAt(i)%>"><em><%=strCount3.charAt(i)%></em></span>
			<%} %>
			<img src="/images/et/movie/title04.png" alt="표" /></div>
		</div>

	</div>

	<map id="monteselect" name="monteselect">
		<area shape="rect" onclick="window.open(this.href,'','width=700px,height=640px'); return false;" coords="89,566,233,768" href="/html/event/movie/pop01_0321.html" alt="대부 영화 자세히 보기" title="새창" />
		<area shape="rect" onclick="window.open(this.href,'','width=700px,height=640px'); return false;" coords="295,566,443,768" href="/html/event/movie/pop02_0321.html" alt="쇼생크탈출 영화 자세히 보기" title="새창" />
		<area shape="rect" onclick="window.open(this.href,'','width=700px,height=640px'); return false;" coords="500,566,647,768" href="/html/event/movie/pop03_0321.html" alt="바람과 함께 사라지다 영화 자세히 보기" title="새창" />
		<area shape="rect" coords="86,778,238,820" href="javascript://" alt="대부 투표하기" onclick="goLayerPop('1');" />
		<area shape="rect" coords="292,778,443,820" href="javascript://" alt="쇼생크탈출 투표하기" onclick="goLayerPop('2');" />
		<area shape="rect" coords="499,778,648,820" href="javascript://" alt="바람과 함께 사라지다 투표하기" onclick="goLayerPop('3');" />
	</map>

	<!-- layer_popup w550 대부 -->
	<div id="id_layer01">
		<p>
			<img src="/images/et/movie/event06_110321.jpg" alt="삼성카드 시네마 초이스 투표에 참여해 주셔서 감사합니다. 회원님께서는 대부를 선택해 주셨습니다. 해당 작품이 상영작으로 선정되면, 추첨을 통해 영화 관람을 하실 수 있습니다. 이벤트 당첨시 관람이 가능한 장소를 선택해 주세요. 상영예정일:서울-대한극장 4월 23일 토요일 오후3시/부산-CGV 센텀시티 4월 24일 일요일 오후3시" usemap="#layerpop" />
		</p>

		<div class="radio_btn">
			<p><label><input type="radio" title="서울" value="서울" name="r00" /><span><img src="/images/et/movie/title01.png" alt="서울" /></span></label><span class="space"></span><label><input type="radio" title="부산" value="부산" name="r00" /><span><img src="/images/et/movie/title02.png" alt="부산" /></span></label></p>
			<p class="pt05"><label><input type="radio" title="투표만 하고 관람을 원하지 않음" value="투표" name="r00" /><span><img src="/images/et/movie/title03.png" alt="투표만 하고 관람을 원하지 않음" /></span></label></p>
		</div>

		<map id="layerpop" name="layerpop">
			<area shape="rect" href="javascript://" onclick="show('id_layer01');" coords="512,25,535,48" alt="닫기" />
			<area shape="rect" href="javascript://" coords="185,413,358,459" onclick="go_start('1');" alt="투표 완료하기" />
		</map>
	</div>
	<!-- // layer_popup w550 대부 -->

	<!-- layer_popup w550 쇼생크탈출 -->
	<div id="id_layer02">
		<p>
			<img src="/images/et/movie/event08_110321.jpg" alt="삼성카드 시네마 초이스 투표에 참여해 주셔서 감사합니다. 회원님께서는 쇼생크 탈출을 선택해 주셨습니다. 해당 작품이 상영작으로 선정되면, 추첨을 통해 영화 관람을 하실 수 있습니다. 이벤트 당첨시 관람이 가능한 장소를 선택해 주세요. 상영예정일:서울-대한극장 4월 23일 토요일 오후3시/부산-CGV 센텀시티 4월 24일 일요일 오후3시" usemap="#layerpop02" />
		</p>

		<div class="radio_btn">
			<p><label><input type="radio" title="서울" value="서울" name="r00"  /><span><img src="/images/et/movie/title01.png" alt="서울" /></span></label><span class="space"></span><label><input type="radio" title="부산" value="부산" name="r00"  /><span><img src="/images/et/movie/title02.png" alt="부산" /></span></label></p>
			<p class="pt05"><label><input type="radio" title="투표만 하고 관람을 원하지 않음" value="투표" name="r00"  /><span><img src="/images/et/movie/title03.png" alt="투표만 하고 관람을 원하지 않음" /></span></label></p>
		</div>

		<map id="layerpop02" name="layerpop02">
			<area shape="rect" href="javascript://" onclick="show('id_layer02');" coords="512,25,535,48" alt="닫기" />
			<area shape="rect" href="javascript://" coords="185,413,358,459" onclick="go_start('2');" alt="투표 완료하기" />
		</map>
	</div>
	<!-- // layer_popup w550 쇼생크탈출 -->

	<!-- layer_popup w550 바람과 함께 사라지다 -->
	<div id="id_layer03">
		<p>
			<img src="/images/et/movie/event07_110321.jpg" alt="삼성카드 시네마 초이스 투표에 참여해 주셔서 감사합니다. 회원님께서는 바람과 함께 사라지다를 선택해 주셨습니다. 해당 작품이 상영작으로 선정되면, 추첨을 통해 영화 관람을 하실 수 있습니다. 이벤트 당첨시 관람이 가능한 장소를 선택해 주세요. 상영예정일:서울-대한극장 4월 23일 토요일 오후3시/부산-CGV 센텀시티 4월 24일 일요일 오후3시" usemap="#layerpop03" />
		</p>

		<div class="radio_btn">
			<p><label><input type="radio" title="서울" value="서울"  name="r00"  /><span><img src="/images/et/movie/title01.png" alt="서울" /></span></label><span class="space"></span><label><input type="radio" title="부산" value="부산" name="r00"  /><span><img src="/images/et/movie/title02.png" alt="부산" /></span></label></p>
			<p class="pt05"><label><input type="radio" title="투표만 하고 관람을 원하지 않음" value="투표" name="r00"  /><span><img src="/images/et/movie/title03.png" alt="투표만 하고 관람을 원하지 않음" /></span></label></p>
		</div>

		<map id="layerpop03" name="layerpop03">
			<area shape="rect" href="javascript://" onclick="show('id_layer03');" coords="512,25,535,48" alt="닫기" />
			<area shape="rect" href="javascript://" coords="185,413,358,459"  onclick="go_start('3');" alt="투표 완료하기" />
		</map>
	</div>
	</form>
	
<!-- <img src="//images/et/movie/et/wedding/event_wedding.jpg" alt="" usemap="#wedding" />
<map name="wedding">
		<area shape="rect" coords="139,747,266,778" href="#" onclick="go_start('A')" alt="유리상자 축가 응모하기" />
		<area shape="rect" coords="463,747,589,778" href="#" onclick="go_start('B')" alt="윤형빈 사회 응모하기" />
		<area shape="rect" coords="348,1099,445,1119" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1114');" alt="수퍼S카드 자세히보기" />
		<area shape="rect" coords="348,1264,445,1285" href="javascript:parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0179');" alt="삼성유포인트카드 자세히보기" />
		<area shape="rect" coords="80,1314,651,1449" href="http://www.s-wed.com/FrontEventAction.do?method=detail&seq=67&TID1=sscard&TID2=ssfam41" target="_blank" alt="S웨딩 바로가기" />
</map>
-->

</body>

</html>

