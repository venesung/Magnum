<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>쉼과 감탄의 삼성카드 오토캠핑 - 삼성카드</title>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
p {margin:0; padding:0}
ul, ol, li	{list-style:none; list-style-position:outside}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #afacaa; color:#666; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px; vertical-align:middle}
html:first-child	input.chk, input.rdo	{display:inline-block}
strong	{font-weight:bold; color:#333}
textarea	{border:1px solid #afacaa; color:#666; font:normal 11px "돋움"}

.popup_auto_camping	{width:470px; height:590px; padding:0 0 0 30px; background:url('/images/event/bg_popup_auto_camping.jpg') no-repeat;}
.popup_auto_camping h1	{padding-top:35px; height:164px;}
.popup_auto_camping	.tit_area	{height:20px;}
.popup_auto_camping	.input_area	{height:195px;}
.popup_auto_camping	.input_area	textarea	{width:420px; height:160px; padding:9px;}
.popup_auto_camping	.input_phone	{height:35px;}
.popup_auto_camping	.button	{margin-top:17px; padding-left:137px;}
</style>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		with(document.form1){

			if ( tel1.value == '' ) {
				alert('전화번호를 확인하세요.');
				tel1.focus();
				return false;
			}
			if ( tel2.value == '' ) {
				alert('전화번호를 확인하세요.');
				tel2.focus();
				return false;
			}
			if ( tel3.value == '' ) {
				alert('전화번호를 확인하세요.');
				tel3.focus();
				return false;
			}
			if ( autoCampingText.value == '' ) {
				alert('사연을 확인하세요.');
				autoCampingText.focus();
				return false;
			}		
				applyEvent();
		}
		
				
	}

	function applyEvent() {
		
		document.form1.target = "applyResultFrame";
		document.form1.submit();
	}

	function resultAlert(gubun) {
		if (gubun == "false") {
		alert("이벤트 응모가 실패하였습니다.");
		opener.location.reload();
		self.close();
		
		} else if (gubun == "ok") {
			alert("이벤트 응모가 완료되었습니다");
			opener.location.reload();
			self.close();
		}
	}

	function maxLengthCheck(maxSize, lineSize, obj, remainObj){ 
		 var temp;
		 var f = obj.value.length;
		 var msglen = parseInt(maxSize);
		 var tmpstr = "";
		 var enter = 0;
		 var strlen;
		 //alert(f+","+maxSize+","+enter);
		 if (f == 0)//남은 글자 byte 수 보여 주기
		 {  
		  if (remainObj != null)//null 옵션이 아닐 때 만 보여준다.
		  {
		   remainObj.value = msglen;
		  }  
		 }
		 else{
		  for(k = 0; k < f ; k++){
		   temp = obj.value.charAt(k);
		   if(temp =="\n"){
		    enter++;
		   }
		   if(escape(temp).length > 4)
		    msglen -= 2;
		   else
		    msglen--;
		   
		   if(msglen < 0){
		    //alert("총 영문 "+(maxSize*2)+"자 한글 "+maxSize+"자 까지 쓰실 수 있습니다.");
		    alert("총 영문 "+(maxSize)+"자 한글 "+(maxSize/2)+"자 까지 쓰실 수 있습니다.");
		    obj.value = tmpstr;
		    break;
		   }
		   else if (lineSize != null & enter > parseInt(lineSize))// lineSize 옵션이 nulldl 아닐 때만 사용
		   {
		    alert("라인수 "+lineSize+"라인을 넘을 수 없습니다.")
		    enter = 0;
		    strlen = tmpstr.length -1;
		    obj.value = tmpstr.substring(0, strlen);
		    break;
		   }
		   else{
		    if (remainObj != null)
		    {
		     remainObj.value = msglen;
		    }      
		    tmpstr += temp;
		   }
		  }  
		 }
		} 
	

</script>
</head>
<body>
<form name="form1" action="/hp/im/et/evt.do?method=setAutoCampingPop" method="post">

<div class="popup_auto_camping">
	<h1><img src="/images/event/popup_h1.png" alt="쉼과 감탄의 삼성카드 오토캠핑" /></h1>
	
	<!-- 사연 -->
	<p class="tit_area"><img src="/images/event/popup_tit_area.png" alt="사연" /></p>
	<p class="pt15"><input type="text" size="4" name="remain_intro" value="2000" class="txttest" />/2000byte</p>
	<div class="input_area"><textarea name="autoCampingText" title="사연작성란" rows="13" cols="68" onchange="maxLengthCheck('2000', null, this, remain_intro);" onkeyup="maxLengthCheck('2000', null, this, remain_intro);"></textarea></div>

	<!-- 전화번호 -->
	<div class="input_phone"><img src="/images/event/popup_tit_phone.png" alt="전화번호" /> <input type="text" name="tel1" title="전화 앞번호" maxlength="3" class="txt" style="width:46px;" /> -  <input type="text" name="tel2" title="전화 중간번호" maxlength="4" class="txt" style="width:46px;" /> -  <input type="text" title="전화 끝번호" name="tel3" maxlength="4" class="txt" style="width:46px;" /></div>

	<p><img src="/images/event/popup_txt_guide.png" alt="회원님께서 기재해주신 내용, 전화번호, 이름, 메일주소 등은 당첨 시 안내 및 행사 준비를 위해 이벤트 업체에 정보가 제공됩니다. 제휴 이벤트 업체 : 이데아 인터렉티브" /></p>

	<div class="button"><a href="#" onclick="go_start();"><img src="/images/event/popup_btn_app.png" alt="이벤트 신청하기" /></a></div>
</div>
</form>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>

</body>
</html>