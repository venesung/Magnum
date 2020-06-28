<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 오토캠핑 樂 신청하기 - 삼성카드</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/class.css" />
<style type="text/css">
h3{height:24px;}
/*120321 추가*/
#pop_content3{position:relative; width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}
/*120321 추가*/
</style>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		with(document.form1){
			if ( campgoods(0).checked) {
				cgoods.value = "Y";
			} else if ( campgoods(1).checked) {
				cgoods.value = "N";
			} else {
				alert('캠핑장비를 확인하세요.');
				campgoods(0).focus();
				return false;
			}
			if ( autoCampingText.value == '' ) {
				alert('사연을 확인하세요.');
				autoCampingText.focus();
				return false;
			}
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
	
			if ( id_agr_private_credit(0).checked) {
			} else {
				alert("개인정보 수집 및 이용등에 대한 동의를 하셔야 본 이벤트에 참여하실 수 있습니다.");
				id_agr_private_credit(0).focus() ;
				return;
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
	
	function clearField(f1,f2,f3){
		mf1=eval("document.form1."+f1);
		mf2=eval("document.form1."+f2);
		mf3=eval("document.form1."+f3);
		if (mf1.selectedIndex==0){
			mf2.value="";
			mf3.value="";
		}else{
			if(mf2.value== "    "){
				mf2.value="";
				mf3.value="";
			}
		}
	}
</script>
</head>
<body>
<form name="form1" action="/hp/im/et/evt.do?method=setAutoCampingPop2012s" method="post">
<input type="hidden" name="cgoods" />

<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="pop_header">
		<h1><img src="/images/et/auto2012/h1_autocamp.png" alt="삼성카드 오토캠핑 樂 신청하기" /></h1>		
	</div>

	<!-- content -->
	<div id="pop_content3" >
		
		<div class="content_block content_block_card clfix">
				<h3><img src="/images/et/auto2012/question_01.png" alt="1. 캠핑장비를 가지고 계신가요?" /></h3>
				<div class="d_desc mb20">
					<label for="label_yes"><input type="radio" class="rdo" value="Y" id="label_yes" name="campgoods" /> 예</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="label_no"><input type="radio" class="rdo" value="N" id="label_no" name="campgoods" /> 아니오</label>
				</div>

				<h3><img src="/images/et/auto2012/question_02.png" alt="2. 삼성카드 오토캠핑에 참가해야 하는 특별한 사연을 남겨 주세요." /></h3>
				<p class="al_right mr10"><span><input type="text" name="remain_intro" value="2000" class="txt" style="border:none;text-align:right;width:20px;" /> / 2000 byte</span></p>
				<div class="mb20" style="clear:both;">
					<div class="box_white w660"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
					<textarea name="autoCampingText" cols="100" rows="7" onchange="maxLengthCheck('2000', null, this, remain_intro);" onkeyup="maxLengthCheck('2000', null, this, remain_intro);"></textarea>
					</div></div>
				</div>

				<h3><img src="/images/et/auto2012/question_03.png" alt="3. 전화번호" /></h3>
				<div class="d_desc mb30">
					<span class="input_phone">
						<select name="tel1" onchange="clearField('tel1','tel2','tel3')" title="휴대폰 앞자리">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
							<option value = "018">018</option>
							<option value = "019">019</option>
						</select>&nbsp;-&nbsp;<input type="text" name="tel2" maxlength="4" style="ime-mode:disabled" class="txt" onkeypress="checkLenN(this, 4, document.form1.tel3);" value="" title="휴대폰 가운데자리" />&nbsp;-&nbsp;
						<input type="text" name="tel3" maxlength="4" class="txt" style="ime-mode:disabled" value="" title="휴대폰 뒷자리" />
					</span>
				</div>

				<h3><img src="/images/et/auto2012/question_04.png" alt="4. 개인정보 수집 활용 동의" /></h3>
				<p class="pl10 mb5">[개인정보 수집/활용/위탁 동의 안내]</p>
				<div class="" >
					<div class="box_white w660"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
					<p class="t_point mb5">개인정보의 수집 및 이용목적</p>
					<p class="mb20">삼성카드(이하 회사)는 "삼성카드 오토캠핑 樂 두번째 이야기" 이벤트를 통해 수집한 개인정보를 이벤트 목적 <br />이외에는 사용 하지 않습니다.</p>
					<p class="t_point mb5">수집 개인정보의 종류</p>
					<p class="mb20">이벤트의 진행과 당첨자 발표 및 "삼성카드 오토캠핑 樂 두번째 이야기" 행사 진행목적으로 아래 내용의 <br />개인정보를 수집합니다.<br />- 캠핑장비장비 보유여부, 행사 참여 사연, 연락처</p>
					<p class="t_point mb5">개인정보의 활용</p>
					<p class="mb20">이벤트 당첨고객 대상 "삼성카드 오토캠핑 樂 두번째 이야기" 당첨자 발표 및 행사 진행에 활용합니다.</p>
					<p class="t_point mb5">개인정보의 보유 및 이용기간</p>
					<p>회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 고객님의 해당 정보를 파기 합니다.<br />- 최대이용기간 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p>
					</div></div>
				</div>
				<div class="btnset w660">
					<div class="btnr">
						<label for="label_agr_private_credit1"><input type="radio" class="rdo" value="" id="label_agr_private_credit1" name="id_agr_private_credit" /> <strong>동의</strong></label>
						<label for="label_agr_private_credit2"><input type="radio" class="rdo" value="" id="label_agr_private_credit2" name="id_agr_private_credit" /> 동의안함</label>
					</div>
				</div>

				<div class="content_block_yark"></div>
				<ul class="list_dashed_t11 mt20">
					<li><span class="t_desc03">이벤트 당첨 시, 기재해 주신 내용 및 전화번호는 본 행사 준비 및 안내를 위해 이벤트 업체에 제공됩니다.</span></li>
					<li><span class="t_desc03">제휴 이벤트 업체 : 이데아인터렉티브</span></li>
				</ul>
				
				<div class="btnc mt30"><a href="#" onclick="go_start();"><img src="/images/et/auto2012/btn_eventapply.png" alt="이벤트 응모하기" /></a></div>
		</div>
		
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<p style="text-align:right;padding:6px 40px 5px 0px; color:#999;letter-spacing:-1px;" class="t_no"></p>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>

</div>
</form>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>

</body>
</html>