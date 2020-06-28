<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 2, 삼성카드 2+ 롯데시네마 샤롯데관 초대 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String card2YN = (String)request.getAttribute("card2YN"); // 카드2 시리즈 소지여부
	String item03 = (String)request.getAttribute("item03"); // 응모한 값
%>
<style type="text/css">
*, body, p, form {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('13069');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(card2YN.equals("N")){%>
				alert("삼성카드 2, 삼성카드 2+를 소지하신 회원만 응모 가능합니다.");
			<%}else if(event_ok.equals("Y")){%>
				<%if (item03.equals("1")) {%>
					alert("샤롯데 명동에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("2")) {%>
					alert("샤롯데 평촌에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("3")) {%>
					alert("샤롯데 인천에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("4")) {%>
					alert("샤롯데 안산에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("5")) {%>
					alert("샤롯데 마산에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("6")) {%>
					alert("샤롯데 센텀시티에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("7")) {%>
					alert("샤롯데 동성로에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("8")) {%>
					alert("샤롯데 김포공항에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("9")) {%>
					alert("샤롯데 건대입구에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else if (item03.equals("10")) {%>
					alert("샤롯데 광주에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} else {%>
					alert("이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
				<%} %>
					
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		//document.evtFrm.eventgubun.value=evgubun;
		//document.evtFrm.target = "applyResultFrame";
		//document.evtFrm.submit();
		var frm = document.evtFrm;
		var gubun = "";
		
		for(var j=0;j<frm.quiz.length; j++) {
			if (frm.quiz[j].checked == true) {
				gubun = frm.quiz[j].value;
			}
		}

		if(gubun == ""){
			alert("희망 영화관 선택 후 응모해주세요.");
		}
		else{
			frm.gubun.value = gubun;
			frm.method = "post";
			frm.target = "formhidden";
			frm.action = '/hp/im/et/evt002.do?method=EventInsertLotte';
			frm.submit();
		}		
	}


	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

	function msgBefore() {
		alert("이벤트기간이 아닙니다.");
	}
	function msgEnd() {
		alert("이벤트가 종료되었습니다.");
	}
	function msgDup(item03) {
		if (item03 == "1") {
		alert("샤롯데 명동에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "2") {
		alert("샤롯데 평촌에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "3") {
		alert("샤롯데 인천에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "4") {
		alert("샤롯데 안산에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "5") {
		alert("샤롯데 마산에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "6") {
		alert("샤롯데 센텀시티에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "7") {
		alert("샤롯데 동성로에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "8") {
		alert("샤롯데 김포공항에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "9") {
		alert("샤롯데 건대입구에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else if (item03 == "10") {
		alert("샤롯데 광주에 이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		} else {
		alert("이미 응모하셨습니다.\n\n이벤트에 참여해 주셔서 감사합니다");
		}
	
	}
	function applyOk(chitem) {
		alert("이벤트 응모가 완료되었습니다.");
	}

</script>


</head>

<body>
<form id="evtFrm" name="evtFrm" method="post" action="">
<input type="hidden" name="gubun" value="" />

<div id="wrap" style="position: relative; width: 728px;"><!-- 120919 수정 -->
<img src="/images/et/event_120917.jpg" alt="삼성카드 2, 삼성카드 2+ 롯데시네마 샤롯데관 초대 이벤트" border="0" usemap="#lotte" />

	<div class="hidden">
		<h1>삼성카드 2, 삼성카드 2+ 롯데시네마 초대 이벤트</h1>
		<p>최신 영화를 더 특별하게 감상할 수 있는 기회! 삼성카드가 특별한 시간을 선물합니다.</p>
		
		<dl>
			<dt>행사일</dt>
			<dd>2012년 10월 20일(토) 오후 4시</dd>
			<dt>응모기간</dt>
			<dd>2012년 9월 21일(금) ~ 2012년 10월 10일(수)</dd>
			<dt>행사대상</dt>
			<dd>삼성카드 1 / 삼성카드 2+ 카드 보유 회원 중 행사기간동안 일시불 및 할부 50만원 이상 이용회원</dd>
			<dt>상영영화</dt>
            <dd>용의자 X (주연 : 류승범, 이요원) <a href="http://who-x2012.interest.me/" target="_blank" title="새창">용의자 X 자세히 보기 </a></dd>
			<dt>행사내용</dt>
			<dd>행사 응모회원 중 추첨을 통해 전국 롯데시네마 샤롯데관 무료초대 행운을 드립니다.(총 163명, 1인 2매)
				<p>초청회원님에게는 별도로 푸짐한 음료/다과를 제공해 드립니다.</p>
			</dd>
			<dt>당첨자 발표</dt>
			<dd>2012년 10월 15일 홈페이지 당첨자 발표란 게시</dd>
		</dl>
		
		<p>이벤트 당첨회원에게는 10월 17일까지 당첨 안내가 핸드폰 문자 메세지로 발송되며 행사당일 샤롯데관에서 당첨자 확인 및 자리배치가 이루어집니다.
			핸드폰 번호가 바뀐 회원님께서는 올바른 번호로 수정하셔야 당첨 정보를 문제없이 받으실 수 있습니다.
            <a href="https://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001" target="_blank" title="새창">핸드폰 번호 수정하기</a>
		</p>
		
		<p>희망영화관 선택하기</p>
		<div>영화관 선택</div>
		
		
		<div style="position: absolute; top: 1255px; left: 90px; overfflow: hidden;">
		<ul style="float: left; width: 140px;">
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="1" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 명동 선택" /></label>
				<img src="/images/et/txt_1.jpg" alt="샤롯데 명동" />
			</li>
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="4" id="one_2" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 안산 선택" /></label>
				<img src="/images/et/txt_2.jpg" alt="샤롯데 안산" />
			</li>
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="7" id="one_3" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 동성로 선택" /></label>
				<img src="/images/et/txt_3.jpg" alt="샤롯데 동성로" />
			</li>
			<li style="list-style:none;">
				<label><input type="radio" name="quiz" value="9" id="one_4" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 건대입구 선택" /></label>
				<img src="/images/et/txt_4.jpg" alt="샤롯데 건대입구" />
			</li>
		</ul>
		<ul style="float: left; width: 140px;">
			<li style="margin-bottom: 10px; list-style:none;">
				<label><label><input type="radio" name="quiz" value="2" id="one_5" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 평촌 선택" /></label>
				<img src="/images/et/txt_5.jpg" alt="샤롯데 평촌" />
			</li>
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="5" id="one_6" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 마산 선택" /></label>
				<img src="/images/et/txt_6.jpg" alt="샤롯데 마산" />
			</li>
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="8" id="one_7" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 김포공항 선택" /></label>
				<img src="/images/et/txt_7.jpg" alt="샤롯데 김포공항" />
			</li>
			<li style="list-style:none;">
				<label><input type="radio" name="quiz" value="10" id="one_8" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 광주 선택" /></label>
				<img src="/images/et/txt_8.jpg" alt="샤롯데 광주" />
			</li>
		</ul>
		<ul style="float: left; width: 140px;">
			<li style="margin-bottom: 10px; list-style:none;">
				<label><input type="radio" name="quiz" value="3" id="one_9" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 인천 선택" /></label>
				<img src="/images/et/txt_9.jpg" alt="샤롯데 인천" />
			</li>
			<li style="list-style:none;">
				<label><input type="radio" name="quiz" value="6" id="one_10" style="width: 13px; height: 13px; vertical-align: middle;" title="샤롯데 센텀시티 선택" /></label>
				<img src="/images/et/txt_10.jpg" alt="샤롯데 센텀시티" />
			</li>
		</ul>
	</div>
		
	<p><a href="javascript:go_start();return false;">응모하기</a></p>
		
	<p>유의사항</p>
	<ul>
		<li>- 행사기간 내 희망 영화관 변경이 간으하며 핸드폰 번호 오류 및 당첨자발표 미확인으로 인한 당첨 불이익은 책임지지 않습니다.</li>
		<li>- 상기 행사는 카드사 및 제휴사의 사정에 따라 변경 중단될 수 있으며 이를 사전에 안내해 드립니다.</li>
	</ul>
	</div>
	<map name="lotte" id="lotte">
		<area shape="rect" coords="359,801,470,820" href="http://who-x2012.interest.me/" target="_blank" title="새창" alt="용의자X 자세히보기" />
		<area shape="rect" coords="80,1098,195,1121" href="https://www.samsungcard.com/index.do?menuId=NHPIMMHUFM001M001" target="_blank" title="새창" alt="핸드폰 번호 수정하기" />
  		<area shape="rect" coords="298,1395,432,1433" href="javascript:go_start();return false;" alt="응모하기" />
  	</map>
</div>
</form>
<iframe width="0" height="0" id="formhidden" name="formhidden" frameborder="0" marginwidth="0" scrolling="no" title="빈 프레임"></iframe>
</body>

</html>

