<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="/images/et/yoot2012/flash_menu.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="/js/common.js"></script>
<title>윷놀이 이벤트 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
ul, ol, li	{list-style:none; list-style-position:outside}
a	{color:#b9b0b0; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}
p {margin:0; padding:0}
#wrap{width: 728px; overflow: hidden;}
.pop_title01 {text-align: center; padding: 63px 0 0 0;}
.pop_btn01 {text-align: center; padding: 43px 0 0 0;}
.pop_btn02 {text-align: center; padding: 48px 0 0 0;}
.pop_text {text-align: center; padding: 16px 0 0 0;}
.pop_text span{color: #5a96c8; font-weight: bold;}
/* 행사대상가맹점 자세히보기 스크립트 */
/* 111227 수정 */
#lay_1{ display:none; position:absolute; z-index:2; left:13px; top:1177px; width:700px; height:608px;}
#lay_1 .pop_l_wrap{background: url("/images/et/yoot2012/lay_popbg.gif") no-repeat left top; width: 700px; height: 660px; position: relative;}
.pop_l_wrap .btn_close{background-position: left top; height: 22px; right: 317px; top: 603px; width: 69px; position: absolute;}
/* //111227 수정 */
.pop_l_wrap .img_l_pop{background:url("/images/et/yoot2012/laypopbtn.png") no-repeat 0 0; overflow: hidden; z-index: 513;}
.btn_input{border: 0 none; cursor:pointer; overflow: hidden; text-indent: -5000px;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<!-- 레이어팝업 스크립트 -->
<script type="text/javascript">
var yootmo = "";
var playCount = "${shootChance}";
var characterNum = "${characterNum}";
var totalPoint="${totalPoint}";
var thisWhere="${thisWhere}";
var characterNumPoint = "";
var failNo = "${failNo}";

		function layeropen(num){
			for (i=1; i<2; i++)	{
				document.getElementById("lay_"+i).style.display = "none";
				if (i==num) {		document.getElementById("lay_"+1).style.display = "block";	}

			}
		}
		function layerclose(num){
			document.getElementById("lay_"+num).style.display = "none";
		}
</script>
<!--layerpop_open&close-->
<script type="text/javascript">
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

<script language="javascript" type="text/javascript">

	// 해당 obj 리턴.
	function getFlashMovieObject(movieName){
		if (window.document[movieName]) {
			return window.document[movieName];
		}
		if (navigator.appName.indexOf("Microsoft Internet")==-1){
			if (document.embeds && document.embeds[movieName])
			return document.embeds[movieName]; 
		}
		// if (navigator.appName.indexOf("Microsoft Internet")!=-1)
		else { 
			return document.getElementById(movieName);
		}
	}

	// 게임 스타트 (윷을 던짐)
	function fStart() {
		// 게임스타트 시 호출. 윷던진 결과 점수 저장후 (도/개/걸/윷/모 or error) 리턴;
		// error 일경우 자바스크립트에서 얼렛창이든 팝업이든 에러 상황 보여준후 "error" 리턴.
		// error 가 아닐경우 플래시에서 해당 위치로 이동 후 점수 보여줌.

		var yootval = "";//Math.floor(Math.random()*5)+1;
		var str = "";
		var yootvalue = "";
		
		if (yootmo == "Y") {

				if (Math.random() < 0.3) {
					str = "도";
					yootval = "1";
					yootmo = "N";
				} else if (Math.random() < 0.7) {
					str = "개";	
					yootval = "2";								
					yootmo = "N";
				} else {
					str = "걸";
					yootval = "3";
					yootmo = "N";
				}
		} else {
			if (Math.random() < 0.0625) {
				str = "윷";
				yootval = "4";
				yootmo = "Y";
			} else if (Math.random() < 0.125) {
				str = "모";
				yootval = "5";
				yootmo = "Y";
			} else if (Math.random() < 0.375) {
				str = "도";
				yootval = "1";
				yootmo = "N";
			} else if (Math.random() < 0.625) {
				str = "걸";
				yootval = "3";
				yootmo = "N";
			} else {
				str = "개";	
				yootval = "2";								
				yootmo = "N";
			}
		}
		var frm = document.mainForm;
	
		frm.yootvalue.value = yootval;
		frm.yootmo.value = yootmo;
		
		frm.target = "hiddenFrame";
		frm.submit();
				
		return str;

	}

	// 카드이용내역 조회
	function fCardHistory() {
		if ("T"=="${loginYN}") {
			var theURL ="/hp/im/et/evt.do?method=yoot2012CardInfo";
			 features = "width=700,height=850"
			 window.open(theURL,"carduserlist1",features);
			} else {
				fLogin();
			}
	}

	// 로그인 
	function fLogin() {
		//alert("로그인후 게임을 이용해 주시기 바랍니다.");
		parent.eventLogin('12128');
	}

	// 이벤트 종료 
	function fEventEndSet() {
		alert("이벤트가 종료 되었습니다.");
	}

	function apply2(value) {
		alert("이벤트가 종료 되었습니다.");
		location.reload();
		return;
	}
	
	function apply(flag,playCountvalue,characterNumvalue,totalPointvalue,thisWherevalue,yootmovalue,failNovalue)
	{
		playCount = playCountvalue;
		characterNum = characterNumvalue;
		totalPoint = totalPointvalue;
		thisWhere = thisWherevalue;
		yootmo = yootmovalue;
		failNo = failNovalue;
	}
	
	// 재설정. 
	function fReSet() {
		var returnData = playCount + "|" + characterNum + "|" + totalPoint + "|" + thisWhere + "|" + failNo; // characterNumPoint 추가
		return returnData;
	}

	// 랜덤.
	function randRange(min, max){
		var randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
		return randomNum;
	}

	function presentType(){	// 선물상자를 누르면 호출하여 어느경품받을지 리턴받는 함수
		var frm = document.mainForm2;
		frm.target = "hiddenFrame";
		frm.submit();
	}
	
	function showEvent2Pop(gubun) {
		var type = gubun; // 0 - 서비스포인트 , 1 - 삼성슬레이트PC, 2 - 필립스 커피머신, 3 - 에버랜드 자유이용권
		var movie = null;

		if(navigator.appName.indexOf("Microsoft") != -1){
			movie = window["main"];			// main = 플레시 오브젝트 아이디값
		}else{
			movie = document["main"];
		}

		if( movie != null ){
			movie.externalFunction(type);
		}
	}

	function  presentCheck(type){	// 당첨팝업이 뜬후 확인버튼 누르면 당첨된 경품확인함수
		//필요없음
	}

	function nochance() {
		alert("응모 가능한 기회가 없습니다.");
		location.reload();
		return;
	}

	function event2Dup() {
		alert("이미 응모하셨습니다.");
		location.reload();
		return;
	}

	function event2error() {
		alert("응모에 실패하셨습니다.");
		location.reload();
		return;
	}

	function event2end() {
		alert("이벤트가 종료되었습니다.");
		location.reload();
		return;
	}
	function openPopYoot2012(){
		
		 window.open("/html/popup/yoot2012pop.html","yootpop2012","width=700,height=660");		
	}
</script>
</head>



<body>
<div id="wrap">
<!--윷놀이 플래시 영역 -->
	<script language="javascript" type="text/javascript">
		 flashMenu('/images/et/yoot2012/main.swf', 'main', '728', '979', false, 'playCount=${shootChance}'+
         '&amp;characterNum=${characterNum}' + 
         '&amp;totalPoint=${totalPoint}' +
         '&amp;thisWhere=${thisWhere}' +
         '&amp;eventEnd=${eventEnd}' +
         '&amp;login=${loginYN}' +
         '&amp;presentCheck=${needToChooseGift}' +  
         '&amp;characterNumPoint=${failNo}');   // 파라미터추가, 캐릭터당 얻은 포인트값 순서대로 1용/2용/3용/4용 시작 셋팅값
	</script>
<!--//윷놀이 플래시 영역 -->
	<img src="/images/et/yoot2012/img_newyeargame3.jpg" alt="" usemap="#Map2" />
	
	<div class="hidden">
		<h1>01 게임방법</h1>
		<ol>
			<li>1단계 - 행사대상 가맹점에서 삼성카드를 3만원 이상 이용한다</li>
			<li>2단계 - 홈페이지 이벤트 페이지에서 즉석 윷놀이 이벤트를 즐긴다</li>
			<li>3단계 - 서비스포인트를 받고 100% 실속 경품도 챙긴다</li>
		</ol>
		<ul>
			<li>모나 윷이 나올 경우 던지기 기회를 1회 더 드리며 용한마리가 윷판에 들어온 후 새로운 용이 나갈 수 있습니다.</li>
			<li>용 4마리가 윷판에서 모두 들어오면 더 이상 이벤트에 참여하실 수 없습니다.</li>
		</ul>
		
		<h1>02 윷 던지기 기회 제공</h1>
		<p>행사대상 가맹점 : 할인점, 백화점, 외식, 학원, 주유 업종 및 삼성카드 8개 제휴 스키장</p>
		<p><a href="#none" onclick="openPopYoot2012();" title="행사대상 가맹점 자세히 보기 바로가기" title="새창">행사대상 가맹점 자세히 보기</a></p>		
		
		<table summary="윷 던지기 기회 제공 안내 표 - 결제 건 당, 윷 던지기 기회가 있습니다.">
			<caption>윷 던지기 기회 제공 안내</caption>
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">결제 건 당</th>
					<td>3만원 이상</td>
					<td>7만원 이상</td>
					<td>10만원 이상</td>
					<td>30만원 이상</td>
				</tr>
				<tr>
					<th scope="row">윷 던지기 기회</th>
					<td>1회</td>
					<td>2회</td>
					<td>3회</td>
					<td>5회</td>
				</tr>
			</tbody>
		</table>
		
		<h1>03 포인트적립 및 경품응모 방법</h1>
		<ul>
			<li>포인트 적립
				<p>윷을 던질 때마다 용이 위치한 곳에 적힌 포인트가 적립되빈다. 용의 마지막 위치는 자동으로 저장되며, 추후에 윷놀이를 다시 시작하시면 계속 이어서 진행하실 수 있습니다.</p>
			</li>
			<li>경품 자동응모
				<p>4마리의 용이 모두 도착하면 100% 당첨 실속경품 행사에 자동 응모됩니다. 슬레이트 PC, 필립스 커피머신, 3000서비스포인트 등 실속있는 경품을 잡아 보세요.</p>
			</li>
			<li>경품안내
				<p>1등 - 삼성슬레이트PC, 2등 - 필립스 커피머신 , 3등 - 에버랜드 자유이용권 2매 , 4등 - 서비스포인트 3,000P</p>
			</li>
		</ul>
		<ul>
			<li>같은 가맹점에서 1일 2회 이상 이용하셨을 경우, 2회까지 이용한 건에 대해서 기회가 부여됩니다.(3회 이상 건은 기회 발생하지 않음)</li>
			<li>삼성카드 홈페이지 로그인 시 이용금액에 따라 참여 기회가 자동으로 부여됩니다.</li>
		</ul>
		
		<h2>유의사항 안내</h2>
		<ul>
			<li>응모하신 본인 카드의 이용승인/결제건이 승인 취소/ 매출취소가 될 경우 해당 경품 당첨이 무효처리 됩니다.</li>
			<li>법인/올앳/선불/체크/기프트카드는 제외되며 삼성카드 등록 업종 기준으로 일부 매장 및 백화점 내 임대매장 및 해외매출, 온라인매출은 제외됩니다.</li>
			<li>제세공과금은 회원부담(경품금액의 22%)이며 당첨발표 후 일주일 내 미입금 시 당첨 취소됩니다.(당첨자에 한해 별도 안내 전화예정)</li>
			<li>카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
		</ul>
		
	</div>
	
	
	
	<map name="Map2" id="Map2">
		<area shape="rect" coords="516,197,685,220" href="#" onclick="openPopYoot2012();" alt="행사업종 자세히 보기" title="새창" />
	</map>
</div>
<!-- 행사대상 가맹점 자세히 보기 -->
<div id="lay_1">
	<div class="pop_l_wrap">
<!-- 111227 수정 -->		
		<img src="/images/et/yoot2012/laypopimg01.jpg" alt="설 맞이 용 ( 龍 ) 한 윷놀이 게임!!" usemap="#Map" />
		
		<div class="hidden">
			<h1>설맞이 용한 윷놀이 이벤트</h1>
			<h2>행사대상 가맹점 정보 안내</h2>
			
			<table summary="행사대상 가맹점 정보 안내 표 - 업종구분, 업종명, 추천가맹점이 있습니다.">
				<caption>행사대상 가맹점 정보 안내</caption>
				<colgroup>
					<col width="15%" />
					<col width="40%" />
					<col width="45%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">업종구분</th>
						<th scope="col">업종명</th>
						<th scope="col">추천가맹점</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>할인점</td>
						<td>할인점(대형마트)</td>
						<td>이마트, 롯데마트, 홈플러스, 코스트코 등</td>
					</tr>
					<tr>
						<td>백화점</td>
						<td>백화점</td>
						<td>신세계백화점, 롯데백화점, 현대백화점, AK플라자 등</td>
					</tr>
					<tr>
						<td>외식</td>
						<td>일반음식점, 한식, 양식, 뷔폐 등</td>
						<td>VIPS, 불고기브라더스, 미스터피자 등</td>
					</tr>
					<tr>
						<td>학원</td>
						<td>외국어학원, 자동차학원, 문리계학원 등</td>
						<td>YBM어학원, 메가스터디 등</td>
					</tr>
					<tr>
						<td>주유</td>
						<td>주유소, LPG충전소, 가정용연료</td>
						<td>S-OIL, SK엔크린, GS칼텍스 등</td>
					</tr>
					<tr>
						<td>제휴스키장</td>
						<td>삼성카드 8개 제휴스키장</td>
						<td>휘닉스파크, 무주 덕유산 리조트, 대명비발디파크, 지산 포레스트 리조트, 베어스 타운, 오크밸리, 알펜시아, 에덴밸리
							<p><a href="https://www.samsungcard.com/link/index.jsp?url=EVENT?eventNo=20157" title="이벤트 자세히 보기 바로가기 새창" target="_blank">자세히보기</p>
						</td>
					</tr>
				</tbody>
			</table>
			<p>온라인 및 PG대행사 결제 업종은 제외됩니다.</p>
			<p><a href="#none" onclick="this.parentNode.parentNode.style.display='none'; show_select();" title="행사대상 가맹점 정보 레이어 닫기">닫기</a></p>
		</div>
		
		
		<map name="Map" id="Map">
			<area shape="rect" coords="394,419,477,442" href="https://www.samsungcard.com/link/index.jsp?url=EVENT?eventNo=20157" target="_blank" title="새창" alt="자세히보기" />
		</map>
<!-- //111227 수정 -->
		<input type="button" title="행사대상 가맹점 정보 레이어 닫기" value="레이어 닫기" onclick="this.parentNode.parentNode.style.display='none'; show_select();" class="img_l_pop btn_close btn_input" />
	</div>
</div>

<form name="mainForm" method="post" action="/hp/im/et/evt.do?method=setYoot2012Main" autocomplete="off">
<input type="hidden" name="yootvalue" value="" />
<input type="hidden" name="yootmo" value="" />
</form>
<form name="mainForm2" method="post" action="/hp/im/et/evt.do?method=setYoot2012Event2" autocomplete="off">
</form>
<iframe name="hiddenFrame" src="" width="0" height="0" frameborder="0" title="빈프레임"></iframe>

<!-- //행사대상 가맹점 자세히 보기 -->
</body>
</html>

