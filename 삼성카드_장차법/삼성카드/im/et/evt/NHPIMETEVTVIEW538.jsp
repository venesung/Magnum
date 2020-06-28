<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>아슬아슬 밤따기 이벤트 - 삼성카드</title>
<%
	String loginYN		= (String)request.getAttribute("loginYN");
	String eventEnd = (String)request.getAttribute("eventEnd");
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

.crocodile_game	{position:relative;}
.flash_map	{position:absolute; left:55px; top:325px; z-index:5;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script src="/html/event/bam2012/embedswf.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" language="javascript">
var playCount = "${shootChance}";
var characterNum = "${characterNum}";
var totalPoint="${totalPoint}";
var thisWhere="${thisWhere}";
var thisPoint="${thisPoint}";
var failYN = "${failYN}";
var failNo = "${failNo}";
var pointAbvalue = "${pointAb}";
var bonusYNvalue = "N";
var flstatus = "N";
var needbonuspop = "N";
var nodup = "N";
function targetChain() {
	var theURL ="/html/event/bam2012/event_popup.html";
	 features = "width=710,height=360"
	 window.open(theURL,"targetchain",features);
}


// 재설정. 
function fReSet() {
	var returnData = { point : 100, totalPoint : 2000, playCount : 19, totalPlayCount : 3, toothPosition : "success" } // fail, success, clear
    return returnData;
	
	var returnData = playCount + "|" + characterNum + "|" + totalPoint + "|" + thisWhere;
	//alert(returnData);
	return returnData;
} 

function nochance() {
	alert("응모 가능한 기회가 없습니다.");
	location.reload();
	return;
}

function nonamoo() {
	alert("응모 가능한 밤나무가 없습니다.");
	location.reload();
	return;
}


function EmbedFlash()
{
	var flashVars =
	{
		// debug : "true"
	};

	embedSWF( "flashLayer" , "/html/event/bam2012/main.swf" , "650" , "420" ,
	{
		id : "flash"
	} ,
	{
		allowScriptAccess : "always" ,
		allowFullscreen : "true" ,
		wmode : "transparent"
	} , flashVars );
}

function fStart()
{
	
	if (characterNum <= 0) {
		alert("남은 밤 나무가 없습니다.");
		return;
	}
	var z=0;
	var imsi = new Array();
	var pointAbvaluearr = pointAbvalue.split(",");
	for (i=0;i<20;i++) {
		//imsi[i] = pointAbvalue.substring(z,z+1);
		
		if (parseInt(pointAbvaluearr[i]) > 0) {
			imsi[i] = pointAbvaluearr[i];	
		} else {
			imsi[i] = "99";	
		}
	}
	var pabv = [ imsi[0],imsi[1],imsi[2],imsi[3],imsi[4],imsi[5],imsi[6],imsi[7],imsi[8],imsi[9],imsi[10],imsi[11],imsi[12],imsi[13],imsi[14],imsi[15],imsi[16],imsi[17],imsi[18],imsi[19] ];

	flash.fStart(
	{
		tree : characterNum,
		count : playCount,
		index : pabv
	} );
}

function fCheck( value )
{
	//alert(nodup);
	if(nodup == "Y") {
		//alert("d");
		return;
	}
	// value.nut(밤송이번호), value.index(상태배열)
	//alert( "fCheck : (" + value.nut + ")\n" + value.index );

	if (playCount <= "0") {
		fStart();
		return;
	}
					
	//꽝여부
	if (failYN == "Y" || failYN == "C") {
		failNo = "0";
	}
		if (failNo == "" || failNo == "0" || failNo == null) {
			failNo = parseInt(Math.random()*20);
		} else {
			//failNo = failNo
		}
	thisPoint = parseInt(thisPoint);
	totalPoint = parseInt(totalPoint);

	if (value.nut == failNo) {
		//꽝이다
		//failNo = "0";
		failYN = "fail"; // fail, success, clear
		characterNum = characterNum - 1;
	} else {
		//포인트
		if (thisPoint == "0" || thisPoint == "100" || thisPoint == "200" || thisPoint == "300" || thisPoint == "400" || thisPoint == "500" || thisPoint == "600" || thisPoint == "700" || thisPoint == "800" || thisPoint == "900" ) {
			thisPoint = thisPoint + 100;
			totalPoint = totalPoint + 100;
		} else if (thisPoint == "1000" || thisPoint == "1500") {
			thisPoint = thisPoint + 300;
			totalPoint = totalPoint + 300;
		} else if (thisPoint == "1300" || thisPoint == "1800") {
			thisPoint = thisPoint + 200;
			totalPoint = totalPoint + 200;
		} else if (thisPoint == "2000" || thisPoint == "2500" || thisPoint == "3000" || thisPoint == "3500") {
			thisPoint = thisPoint + 500;
			totalPoint = totalPoint + 500;
		} else if (thisPoint == "4000") {
			thisPoint = thisPoint + 6000;
			totalPoint = totalPoint + 6000;
		}
		if (thisPoint == "10000") {
			failYN = "clear"; // fail, success, clear
			characterNum = characterNum - 1;
		} else {
			failYN = "success"; // fail, success, clear
		}
	} 
	
	var rand_no = Math.floor(10*Math.random());//0~9
	//alert(rand_no);
	if (rand_no == 1) {
		if (failYN == "Y" || failYN == "C") {
		} else {
			bonusYNvalue = "Y";
		}
	}
	
	
	playCount = playCount - 1;
	var frm = document.mainForm;
	frm.toothlocation.value = value.nut;
	frm.toothfailno.value = failNo;
	frm.bonusYN.value = bonusYNvalue;
	frm.target = "hiddenFrame";
	nodup = "Y";
	frm.submit();		
	
}

function apply2() {
	alert("응모 실패하였습니다.");
}
function fLink()
{
	window.open("https://www.samsungcard.com/index.do?menuId=NHPIMMPK001","","")
}
function apply(flag,playCountvalue,characterNumvalue,totalPointvalue,thisPointvalue,failYNvalue,n0,bonusYN)
{
	//alert(flag+","+playCountvalue+","+characterNumvalue+","+totalPointvalue+","+thisPointvalue+","+failYNvalue);
	if(failYNvalue != "Y") {
		thisPoint = thisPointvalue;
	}
	totalPoint = totalPointvalue;
	characterNum = characterNumvalue;//남은말수
	playCount = playCountvalue;
	failYN = failYNvalue;
	//bonusYNvalue = "N";
	bonusYNvalue = bonusYN;
	pointAbvalue = n0; 

	if (thisPointvalue == "10000") {
		failYN = "C";
	}

	if (failYN == "Y") {
		fPopupFailEnd();
	} else {
		fPopupSuccess();
	}

	$("#chance").text(playCount);		
	$("#characternum").text(characterNum);		
	$("#totalpoint").text(totalPoint);
	nodup = "N";

}
function fPopupComplete()
{
	if (bonusYNvalue == "Y") {
		if (failYN == "Y" || failYN =="C") {
		needbonuspop = "Y";
		}
		fPopupSuccessTriple(); 
		bonusYNvalue = "N";
	} else {

		if (needbonuspop == "Y") {
			if (failYN == "C") {
				fPopupSuccessEnd();
				failYN = "Y";
			}
			needbonuspop = "N";
		} else {
			if (flstatus == "Y") {
				fStart();
				flstatus = "N";
			} else {
				 if (failYN == "C") {
					fPopupSuccessEnd();
					failYN = "Y";
				} 
				
			}
		}
	}
	
	/////////////////////////////////
	
	
}

function fPopupSuccess()
{
	flash.fPopupSuccess(
	{
		currentPoint : thisPoint
	} );
	
}

function fPopupSuccessTriple()
{
	flash.fPopupSuccessTriple();
}

function fPopupSuccessEnd()
{
	flstatus = "Y";
	flash.fPopupSuccessEnd(
	{
		//실제 데이터를 넣어주시면 됩니다
		tree : characterNum ,
		currentPoint : thisPoint ,
		totalPoint : totalPoint
	} );
}

function fPopupFailEnd()
{
	flstatus = "Y";
	flash.fPopupFailEnd(
	{
		//실제 데이터를 넣어주시면 됩니다
		tree : characterNum ,
		currentPoint : thisPoint ,
		totalPoint : totalPoint
	} );
}

function go_start() {
	<%if (eventEnd.equals("T")) {%>
		alert("이벤트가 종료되었습니다.");
	<%} else {%>
	fStart();
	<%}%>
}
</script> 
</head>



<body <%if (loginYN.equals("T")) { %>onload="EmbedFlash()"<%} %>>
 
<%if (loginYN.equals("T")) { %>
	<div class="">
	<img src="/html/event/bam2012/images/event_chestnut.jpg" usemap="#chestnut" alt="삼성카드와 함께하는 아슬아슬 밤따기 이벤트" border="0" />
	
		<div class="hidden">
			<p>삼성카드와 함께하는 아슬아슬 밤따기 이벤트</p>
			<h1>열려라 밤송이 쏟아져라 포인트</h1>
			<p>즐겁게 밤도 따고, 행운의 포인트도 따고! 재미있는 이벤트와 함께 풍성한 가을을 맞이해 보세요</p>
			<dl>
				<dt>행사기간</dt>
				<dd>2012년 9월 7일(금) ~ 10월 14일(일)</dd>
				<dt>행사내용</dt>
				<dd>대상업종에서 2만원이상 삼성카드로 결제하시면 아래 기준에 따라 행운의 밤따기 이벤트 참여기회를 드리고 참여하신 모든 회원님께 최대 40,000 서비스 포인트의 행운 제공</dd>
				<dt>대상업종</dt>
                <dd>외식, 할인점, 주유, 학원, 공과금, 세금업종 <a href="#none" onclick="targetChain();return false;">대상업종 자세히보기</a></dd>
				<dt>포인트 적립</dt>
				<dd>2012년 10월 30일(화) 자동 일괄 적립</dd>
			</dl>
			
			<h2>밤따기 이벤트 설명</h2>
			<p>20개의 밤송이 중 벌칙 밤송이 하나만 건드리지 않고, 나머지 밤송이 19개를 누를 때마다 포인트가 쌓이는 미니 룰렛 게임입니다.</p>
			<ol>
				<li>1단계 - 대상 업종 가맹점에서 삼성카드로 2만원이상 결제 합니다.</li>
				<li>2단계 - 삼성카드 홈페이지 내 밤따기 이벤트를 클릭합니다.</li>
				<li>3단계 - START 버튼을 누른 후 20개의 밤송이를 1개씩 클릭합니다.</li>
				<li>4단계 - 클릭 후, 밤이 가득하면 성공! 밤을 수확할 때마다 서비스 포인트 적립!</li>
				<li>5단계 - 벌레가 꿈틀대는 벌칙 밤송이 클릭 시 해당 그루가 종료됩니다.</li>
				<li>6단계 - 총 4그루의 도전 기회 행운의 서비스 포인트를 받아가세요</li>
			</ol>
			<p>- 4단계 : 보너스밤 클릭 시 밤따기 도전 기회를 1회 더 드립니다.</p>
			
			<h2>도전 기회 제공 기준 - 프리미엄회원은 더 큰 헤택이 한가득!</h2>
			<table summary="도전 기회 제공 안내 표 - 회원구분 , 결제건별에 대한 정보가 있습니다.">
				<caption>도전 기회 제공 안내</caption>
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">회원구분/결제건별</th>
						<th scope="col">2만원 이상</th>
						<th scope="col">5만원 이상</th>
						<th scope="col">10만원 이상</th>
						<th scope="col">20만원 이상</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>일반회원</td>
						<td>1회</td>
						<td>2회</td>
						<td>3회</td>
						<td>5회</td>
					</tr>
					<tr>
						<td>프리미엄회원</td>
						<td>1회</td>
						<td>2회</td>
						<td>5회</td>
						<td>7회</td>
					</tr>
				</tbody>
			</table>
			<ul>
				<li>- 동일 가맹점에서 1일 2회 이상 이용시 2회까지 이용하신 건에 대해서 응모 기회가 부여됩니다.</li>
				<li>- 삼성카드 홈페이지 로그인 시 이용금액에 따라 이번트 기회가 자동으로 부여됩니다.</li>
			</ul>
			
			<h2>포인트 적립</h2>
			<table summary="포인트 적립안내 표 - 성공횟수와 누적포인트의 정보가 있습니다.">
				<caption>포인트 적립안내</caption>
				<colgroup>
					<col width="*" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width=9%"" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
				</colgroup>
				<tbody>
					<tr>
						<th>성공횟수</th>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>10</td>
					</tr>
					<tr>
						<th>누적포인트</th>
						<td>100</td>
						<td>200</td>
						<td>300</td>
						<td>400</td>
						<td>500</td>
						<td>600</td>
						<td>700</td>
						<td>800</td>
						<td>900</td>
						<td>1,000</td>
					</tr>
				</tbody>
			</table>
			<table summary="포인트 적립안내 표 - 성공횟수와 누적포인트의 정보가 있습니다.">
				<caption>포인트 적립안내</caption>
				<colgroup>
					<col width="*" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width=9%"" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
				</colgroup>
				<tbody>
					<tr>
						<th>성공횟수</th>
						<td>11</td>
						<td>12</td>
						<td>13</td>
						<td>14</td>
						<td>15</td>
						<td>16</td>
						<td>17</td>
						<td>18</td>
						<td colspan="2">마지막</td>
					</tr>
					<tr>
						<th>누적포인트</th>
						<td>1,300</td>
						<td>1,500</td>
						<td>1,800</td>
						<td>2,000</td>
						<td>2,500</td>
						<td>3,000</td>
						<td>3,500</td>
						<td>4,000</td>
						<td colspan="2">10,000</td>
					</tr>
				</tbody>
			</table>
			
			<p>유의사항</p>
			<ul>
				<li>- 본 이벤트는 개인신용카드 및 가족카드만 해당되며 법인카드, 체크카드, 올앳카드, 기프트카드는 제외됩니다.</li>
				<li>- 응모하신 본인 카드의 승인 및 결제 건이 승인 취소 혹인 매출취소가 될 경우 해당 당첨 사실이 무효처리 됩니다.</li>
				<li>- 온라인 또는 백화점 내 임대매장 및 해외에서 발생한 매출은 이벤트 대상에서 제외되며, 당사 등록업종 기준으로 일부 가맹점은 제외될 수 있습니다.</li>
				<li>- 본 이벤트는 카드사 및 제휴사의 사정에 의해 변경 중단 될 수 있으며 이를 사전에 알려 드립니다.</li>
				<li>- 동일 가맹점 에서 1일2회 이상 이용 시 2회까지 이용하신 건에 대해서 응모 기회가 부여됩니다.</li>
				<li>- 삼성카드 홈페이지 로그인 시 이용금액에 따라 이벤트 기회가 자동으로 부여됩니다.</li>
			</ul>
			
		</div>
	
	
	<map name="chestnut" id="chestnut">
		<area shape="rect" coords="471,472,600,494" alt="대상업종 자세히보기" href="#" onclick="targetChain();" />
		<area shape="rect" coords="271,1071,459,1109" alt="게임START" href="#" onclick="go_start();" />
	</map>
		<p id="chance" style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 166px; text-align:right; width:20px;">${shootChance}</p>
    <p id="characternum" style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 371px; text-align:right; width:20px;">${characterNum}</p>
    <p id="totalpoint" style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 586px; text-align:right; width:50px;">${totalPoint}</p>
	  <!-- 플래시영역 --><div id="flashLayer" style="position:absolute; top:631px; left:40px;"></div><!-- //플래시영역 -->
	  </div>
<%} else { %>
<div class="">
	<img src="/html/event/bam2012/images/nologin_chestnut.jpg" usemap="#chestnut" alt="삼성카드와 함께하는 아슬아슬 밤따기 이벤트" border="0" />
	<map name="chestnut" id="chestnut">
		<area shape="rect" coords="471,472,600,494" alt="대상업종 자세히보기" href="#" onclick="targetChain();" />
		<area shape="rect" coords="271,1071,459,1109" alt="게임START" href="#" onclick="parent.eventLogin('31886');"/>
	</map>
	<p style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 166px; text-align:right; width:20px;">00</p>
    <p style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 371px; text-align:right; width:20px;">00</p>
    <p style="position: absolute; color: #ed9321; top: 579px; font-weight: bold; left: 586px; text-align:right; width:50px;">00,000</p>
</div>
<%} %>	  
<form name="mainForm" method="post" action="/hp/im/et/evt002.do?method=setBam2012Main" autocomplete="off">
<input type="hidden" name="toothlocation" value="" />
<input type="hidden" name="toothfailno" value="" />
<input type="hidden" name="bonusYN" value="" />
</form>

<iframe name="hiddenFrame" src="" width="0" height="0" frameborder="0" title="빈 프레임"></iframe>
</body>
</html>

