<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>할부수수료할인 이벤트 - 삼성카드</title>

<script language="javascript" type="text/javascript">AC_FL_RunContent = 0;</script>
<script src="/event/worldcup/js/AC_RunActiveContent.js" language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

function eventGO(){

	if('${loginYN}' == "N"){
		setLogin();
		return;
	}
	hiddenFrame.location.href="/hp/im/et/evt003.do?method=halbooEventApply";


}

function setLogin(){

	alert("로그인 하셔야 응모가 가능합니다.");
	parent.eventLogin('${cmsSeq}');
}

function resMsg(resCode){
	if(resCode == "99"){
		alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
		location.reload();
	}else if(resCode == "&nbsp;"){
		alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
		location.reload();
	}else if(resCode == "10"){
		alert('조회구분키 오류입니다.');
		location.reload();
	}else if(resCode == "11"){
		alert('행사적용정보가　등록가능합니다.');
		location.reload();
	}else if(resCode == "12"){
		alert('이미 등록된 회원입니다.');
		location.reload();
	}else if(resCode == "00"){
		alert('이벤트 참여가 완료되었습니다.');
		location.reload();
	}else{
		alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
		location.reload();
	}
	return;
}

</script>
</head>



<body>
<img src="/images/et/20100715170107_0_10191.jpg" useMap="#event_0715" border="0" alt="삼성카드할부결제시 할부수수료 할인" />

<map id="event_0715" name="event_0715">
<area shape=rect coords=262,597,460,630 href="javascript:eventGO();" alt="응모하기" />
</map>
</body>

<iframe name="hiddenFrame" src="" width=0 height=0  title="컨텐츠 프레임"></iframe>

</html>

