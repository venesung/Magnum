<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>윷놀이 이벤트 - 삼성카드</title>
<style type="text/css">
p, body {margin:0; padding:0; color:#b9b0b0; font:normal 11px '돋움'; line-height:14px}
img  {border:0;}

</style>
<script language="javascript" type="text/javascript">AC_FL_RunContent = 0;</script>
<script src="/event/worldcup/js/AC_RunActiveContent.js" language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
var yootmo = "";
var playCount = "${shootChance}";
var characterNum = "${characterNum}";
var totalPoint="${totalPoint}";
var thisWhere="${thisWhere}";

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
	//alert("fStart");
	// 게임스타트 시 호출. 윷던진 결과 점수 저장후 (도/개/걸/윷/모 or error) 리턴;
	// error 일경우 자바스크립트에서 얼렛창이든 팝업이든 에러 상황 보여준후 "error" 리턴.
	// error 가 아닐경우 플래시에서 해당 위치로 이동 후 점수 보여줌.

	//var arr = new Array("도", "개", "걸", "윷", "모");
	//var str = arr[randRange(0, 4)];
		//윷던지기
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
	var theURL ="/hp/im/et/evt002.do?method=yoot2011CardInfo";
	 features = "width=700,height=850"
	 window.open(theURL,"carduserlist1",features);
	} else {
		fLogin();
	}
	
}

function targetChain() {
	var theURL ="/html/event/yoot2011/yoot.html";
	 features = "width=700,height=608"
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
function apply(flag,playCountvalue,characterNumvalue,totalPointvalue,thisWherevalue,yootmovalue)
{
	//alert(yootmovalue);
	playCount = playCountvalue;
	characterNum = characterNumvalue;
	totalPoint = totalPointvalue;
	thisWhere = thisWherevalue;
	yootmo = yootmovalue;
}


// 재설정. 
function fReSet() {
	


	var returnData = playCount + "|" + characterNum + "|" + totalPoint + "|" + thisWhere;
	//alert(returnData);
	return returnData;

}

function nochance() {
	alert("응모 가능한 기회가 없습니다.");
	location.reload();
	return;
}


</script>
</head>



<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no" >

	<script language="javascript" type="text/javascript">
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
	
	<!-- ${loginYN},${shootChance}<br/>
	${characterNum},${totalPoint},${thisWhere},${ENTRY_SEQ}<br/>-->
	
<p><img src="/html/event/yoot2011/images/event_game.jpg" alt="이벤트 참여방법" usemap="#event_game" /></p>
<map name="event_game" id="event_game">
 <area shape="rect" coords="538,175,687,200" href="#" onclick="targetChain();" alt="행사 업종 자세히보기" title="새창" />
</map>	
<form name="mainForm" id="mainForm" method="post" action="/hp/im/et/evt002.do?method=setYoot2011Main" autocomplete="off">
<input type="hidden" name="yootvalue" value="" />
<input type="hidden" name="yootmo" value="" />
</form>

<iframe name="hiddenFrame" src="" width="0" height="0" title="빈 프레임"></iframe>
</body>
</html>

