<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>월드컵 이벤트 - 삼성카드</title>

<script language="javascript" type="text/javascript">AC_FL_RunContent = 0;</script>
<script language="javascript" type="text/javascript" src="/event/worldcup/js/AC_RunActiveContent.js"></script>
<script language="javascript" type="text/javascript">

// 플래시에서 받는 함수 flashPointSaveGet()

function thisMovie(movieName) {

    if (navigator.appName.indexOf("Microsoft") != -1) {

        return window[movieName];

    } else {

        return document[movieName];

    }

}

// 플래시에서에서호출 // 결과값출력

function flashVarSend (num){



	var goalnum = num[0];
	var point = num[1];

		var frm = document.mainForm;
		frm.goalnum.value = goalnum;
		frm.point.value = point;
		frm.target = "hiddenFrame";
		frm.submit();

		return str;

}



// 플래시에서에서호출 // 로그인

function setLogin(msg){

	//alert("로그인 하셔야 응모가 가능합니다.");
	//parent.document.getElementById("wrap").focus();
	parent.eventLogin('${cmsSeq}');

}



// 플래시 에서 호출 // 꼴기회 소진 & 9꼴 성공

function gameDenial(msg){
	alert(msg);
}



function cardHistory(msg){

	var theURL ="/hp/im/et/evt003.do?method=worldCupCardInfo";
	 features = "width=700,height=490"
	 window.open(theURL,"카드이용내역1",features);

}

function flashPointSaveGet(){
	alert("d");
}

function apply(flag)
{
	if(flag == "false")
    {

		//alert("입력 실패 에러메세지!!!");
		mav.addObject("successYn", "Y");
		location.reload();
		return;
    }
	parent.submit_eventLog();
	thisMovie("bingoEvent").flashPointSaveGet(flag);
}

function apply2(flag)
{
	parent.submit_eventLog();
   if(flag == "false")
   {
		alert("응모 가능한 기회가 없습니다.");
		location.reload();
		return;
   }
 }

function apply3(flag)
{
	parent.submit_eventLog();
   if(flag == "false")
   {
		alert("해당 골에는 이미 응모가 완료되었습니다.");
   }

   thisMovie("bingoEvent").flashPointSaveGet(flag);

}

function endDay(){

	alert("이벤트가 종료되었습니다.");
	return;

}

</script>
</head>



<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no">

<div style="width: 728px; height: 2005px; background: url(/event/worldcup/images/eventssc.jpg) no-repeat; position: relative;">

<div style="width: 728px; height: 670px; position: absolute; left: 0; top: 804px;">

<!--url's used in the movie-->

<!--text used in the movie-->

<!-- saved from url=(0013)about:internet -->

<script language="javascript" type="text/javascript">

	if (AC_FL_RunContent == 0) {

		alert("This page requires AC_RunActiveContent.js.");

	} else {

		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '728',
			'height', '670',
			'src', '/event/worldcup/swf/eventMain',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'middle',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', '/event/worldcup/swf/eventMain',
			'bgcolor', '#ffffff',
			'name', 'bingoEvent',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'FlashVars','endEvent=${eventEnd}&logInChick=${loginYN}&shootChance=${shootChance}&pointAb=${pointAb}',
			'movie', '/event/worldcup/swf/eventMain',
			'salign', ''
			); //end AC code
	}
</script>
<noscript>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="728" height="670" id="eventMain" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="FlashVars" value="logInChick='${loginYN}'&shootChance='${shootChance}'&pointAb='${pointAb}'" />
	<param name="movie" value="/event/worldcup/swf/eventMain.swf" />
	<param name="quality" value="high" />
	<param name="bgcolor" value="#ffffff" />
	<embed src="eventMain.swf" quality="high" bgcolor="#ffffff" width="728" height="670" name="bingoEvent" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
</noscript>

</div>

<a href="#1" onclick="window.open('/event/worldcup/html/worldcup.htm','pop','width=700,height=430');" style="position: absolute; left: 29px; top: 1574px; width: 189px; height: 24px; display: block; text-indent: -9999px; overflow: hidden;" title="새창" >행사대상업종 자세히 보기</a>
</div>





<form name="mainForm" method="post" action="/hp/im/et/evt003.do?method=worldCupApply" autocomplete="off">
<input type="hidden" name="point" value="" />
<input type="hidden" name="goalnum" value="" />
</form>

<iframe name="hiddenFrame" id="hiddenFrame" src="" width="0" height="0" title="빈프레임"></iframe>
</body>
</html>

