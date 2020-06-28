<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>악어룰렛 게임 이벤트 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}

.crocodile_game	{position:relative;}
.flash_map	{position:absolute; left:55px; top:325px; z-index:5;}

</style>
<script language="javascript" type="text/javascript">AC_FL_RunContent = 0;</script>
<script src="/event/worldcup/js/AC_RunActiveContent.js" language="javascript" type="text/javascript"></script>
<script src="/html/event/croc/js/flash_menu.js" language="javascript" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
var playCount = "${shootChance}";
var characterNum = "${characterNum}";
var totalPoint="${totalPoint}";
var thisWhere="${thisWhere}";
var thisPoint="${thisPoint}";
var failYN = "${failYN}";
var failNo = "${failNo}";
var pointAbvalue = "${pointAb}";

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


// 카드이용내역 조회
function fCardHistory() {
	if ("T"=="${loginYN}") {
	var theURL ="/hp/im/et/evt002.do?method=croc2011CardInfo";
	 features = "width=710,height=610"
	 window.open(theURL,"carduserlist1",features);
	} else {
		fLogin();
	}
	
}

function targetChain() {
	var theURL ="/html/event/croc/event_game_place.html";
	 features = "width=710,height=455"
	 window.open(theURL,"targetchain",features);
}

// 로그인 
function fLogin() {
	
	parent.eventLogin('${cmsSeq}');
}

// 이벤트 종료 
function fEventEndSet() {
	alert("이벤트가 종료 되었습니다.");
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

function fClickPosition() {
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
var returnData = [ imsi[0],imsi[1],imsi[2],imsi[3],imsi[4],imsi[5],imsi[6],imsi[7],imsi[8],imsi[9],imsi[10],imsi[11],imsi[12],imsi[13],imsi[14],imsi[15],imsi[16],imsi[17],imsi[18],imsi[19] ];
//var returnData = [ 99,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ];
//alert(returnData);
return returnData;

}
function fToothClick( id ){ //이빨 클릭시
	//꽝여부
	if (failYN == "Y" || failYN == "C") {
		failNo = "0";
	}
		if (failNo == "" || failNo == "0" || failNo == null) {
			failNo = parseInt(Math.random()*20+1);
		} else {
			//failNo = failNo
		}
	
	thisPoint = parseInt(thisPoint);
	totalPoint = parseInt(totalPoint);

	if (id == failNo) {
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
	
	playCount = playCount - 1;
		
	var frm = document.mainForm;
	frm.toothlocation.value = id;
	frm.toothfailno.value = failNo;
	frm.target = "hiddenFrame";
	frm.submit();		
	
    var returnData = { point : thisPoint, totalPoint : totalPoint, totalPlayCount : characterNum, playCount : playCount, toothPosition : failYN }
    //alert("fToothClick : "+thisPoint+","+totalPoint+","+characterNum+","+playCount+","+failYN);
    //alert("응모기회 :"+playCount);
    return returnData;
}
function apply(flag,playCountvalue,characterNumvalue,totalPointvalue,thisPointvalue,failYNvalue,n0)
{
	//alert(flag+","+playCountvalue+","+characterNumvalue+","+totalPointvalue+","+thisPointvalue+","+failYNvalue);
	thisPoint = thisPointvalue;
	totalPoint = totalPointvalue;
	characterNum = characterNumvalue;//남은말수
	playCount = playCountvalue;
	failYN = failYNvalue;

	pointAbvalue = n0; 
		
	//pointAbvalue = "start n0:"+n0+",n1:"+n1+","+n2+","+n3+","+n4+","+n5+","+n6+","+n7+","+n8+","+n9+","+n10+","+n11+","+n12+","+n13+","+n14+","+n15+","+n16+","+n17+","+n18+",n19:"+n19+"end";
	//alert(pointAbvalue);
}


</script>
</head>



<body  style="margin:0;background:#fff;overflow:hidden">

<div class="crocodile_game">
	<map name="map_crocodile_game" id="map_crocodile_game">
		<area shape="rect" coords="490,1184,693,1218" alt="이벤트 대상 가맹점 자세히 보기" href="#" onclick="targetChain();" />
	</map>
	<img src="/html/event/croc/images/event_crocodile_game.jpg" usemap="#map_crocodile_game" alt="악어룰렛 Game 이벤트" />

	<div class="flash_map">
		<script language="javascript" type="text/javascript">
			 flashMenu('/html/event/croc/crocodileGame.swf', 'crocodileGame', '618', '390', false, 
			 'totalPlayCount=${characterNum}' + //남은 악어개수
             '&amp;playCount=${shootChance}'+  //도전기회
             '&amp;totalPoint=${totalPoint}' + 
             '&amp;eventEnd=${eventEnd}' + 
             '&amp;login=${loginYN}'); 
		</script>
	</div>
</div>
	<!-- <script language="javascript" type="text/javascript">
function flashMenu(url,id,width,height,trans,flashvars){
	var strFlashTag = new String();  
	if (navigator.appName.indexOf("Microsoft") != -1)    {
		strFlashTag += '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" ';
		strFlashTag += 'codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=version=9,0,0,0" width="' + width + '" id="' + id + '" height="' + height + '">';
		strFlashTag += '<param name="movie" value="' + url + '"/>';      
		strFlashTag += '<param name="FlashVars" value="' + flashvars + '"/>';
		strFlashTag += '<param name="quality" value="best"/>';
		strFlashTag += '<param name="menu" value="false"/>';
		if(trans==true){
			strFlashTag += '<param name="wmode" value="transparent"/>';
		}
		else{
			strFlashTag += '<param name="wmode" value="opaque"/>';
		}
		strFlashTag += '<param name="allowScriptAccess" value="always"/>';
		strFlashTag += '</object>';
	}
	else{
		strFlashTag += '<embed src="' + url + '?' + flashvars + '" ';
		strFlashTag += 'quality="best" ';
		strFlashTag += 'width="' + width + '" ';
		strFlashTag += 'height="' + height + '" ';
		strFlashTag += 'menu="false" ';
		strFlashTag += 'name="'+id+'" ';
		if(trans==true){
			strFlashTag += 'wmode="transparent" ';
		}
		else{
			strFlashTag += 'wmode="opaque" ';
		}
		strFlashTag += 'allowScriptAccess="always" ';
		strFlashTag += '</embed>';
	}
	document.write(strFlashTag);
}		
		
		
	flashMenu("/flash/event/yoot.swf", "Main", "712", "835", false, "playCount=${shootChance}"+
    "&amp;characterNum=${characterNum}" + 
    "&amp;totalPoint=${totalPoint}" +
    "&amp;login=${loginYN}" + 
    "&amp;eventEnd=F" + //${eventEnd}
    "&amp;thisWhere=${thisWhere}");

	</script>
	
	
	
<p><img src="/html/event/yoot2011/images/event_game.jpg" alt="" usemap="#event_game" /></p>
<map name="event_game">
 <area shape="rect" coords="538,175,687,200" href="#" onclick="targetChain();"alt="행사 업종 자세히보기" />
</map>	-->
<form name="mainForm" method="post" action="/hp/im/et/evt002.do?method=setCroc2011Main" autocomplete="off">
<input type="hidden" name="toothlocation" value="" />
<input type="hidden" name="toothfailno" value="" />
</form>

<iframe name="hiddenFrame" src="" width="0" height="0" frameborder="0" title="빈프레임"></iframe>
</body>
</html>

