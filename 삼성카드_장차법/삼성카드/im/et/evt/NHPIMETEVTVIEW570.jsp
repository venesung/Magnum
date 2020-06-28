<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>오토캠핑 참여 응모 - 삼성카드</title>
<%
String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/class.css" />
<link rel="stylesheet" type="text/css" href="/css/mvint_pop.css" />
<style type="text/css">
h3{height:24px;}
/*120321 추가*/
#pop_content3{position:relative; width:100%; margin:20px 0;}
.content_block {margin:0;width:650px;margin-left:30px;}
/*120321 추가*/
</style>
<!-- SR내역 13.04.19 --> 
<script type="text/javascript"> 
        function layeropen(num){ 
            for (i=1; i<2; i++) { 
                document.getElementById("lay_"+i).style.display = "none"; 
                if (i==num) { document.getElementById("lay_"+num).style.display = "block"; } 
            } 
        } 
        function layerclose(num){ 
            document.getElementById("lay_"+num).style.display = "none"; 
            opener.location.reload(); 
            self.close(); 
        } 
</script> 
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
<!-- //SR내역 13.04.19 --> 

<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script type="text/javascript" language="javascript">
	
	function go_start() {
		with(document.form1){

			if ( camparea(0).checked) {
				carea.value = "1";
			} else if ( camparea(1).checked) {
				carea.value = "2";
			} else {
				alert('캠핑장을 선택하세요.');
				camparea(0).focus();
				return false;
			}
			if ( tent(0).checked) {
				cgoods.value = "Y";
			} else if ( tent(1).checked) {
				cgoods.value = "N";
			} else {
				alert('텐트 대여 여부를 확인하세요.');
				tent(0).focus();
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
			layeropen(1);
			//alert("이벤트 응모가 완료되었습니다");
			//opener.location.reload();
			//self.close();
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
<form name="form1" action="/hp/im/et/evt.do?method=setAutoCampingPop2013" method="post">
<input type="hidden" name="eventNo" value="<%=eventNo%>" />
<input type="hidden" name="carea" />
<input type="hidden" name="cgoods" />

<div id="pop_wrap" style="overflow:auto;width:710px;" >
	<!-- header -->
	<div id="mvint_pheader">
		<h1><img src="/images/et/auto2013/h1_autocamp.png" alt="오토캠핑 참여 응모" /></h1>			
	</div>

	<!-- content -->
	<div id="pop_content3" >		
		<div class="content_block content_block_card clfix">
				<h3 class="mb10"><img src="/images/et/auto2013/question_01.png" alt="1. 캠핑장 선택 (최종 응모 후에는 변경하실 수 없습니다.)" /></h3>
				<p><label><input type="radio" class="rdo" value="1" id="label_no1" name="camparea" title="1차 : 5월 25일(토) ~26일(일) 홍성 세울터 오토캠핑장" /> <img src="/images/et/auto2013/answer1-1.png" alt="1차 : 5월 25일(토) ~26일(일) 홍성 세울터 오토캠핑장" /></label></p>
				<p class="mt5"><label><input type="radio" class="rdo" value="2" id="label_no2" name="camparea" title="2차 : 6월 1일(토) ~2일(일) 가평 늘푸른쉼터" /> <img src="/images/et/auto2013/answer1-2.png" alt="2차 : 6월 1일(토) ~2일(일) 가평 늘푸른쉼터" /></label></p>

				<h3 class="mt20 mb10"><img src="/images/et/auto2013/question_02.png" alt="2. 텐트신청여부" /></h3>
				<div class="d_desc">
					<label><input type="radio" class="rdo" value="Y" id="label_yes" name="tent" title="텐트 신청" /> <img src="/images/et/auto2013/answer2-1.png" alt="신청" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" class="rdo" value="N" id="label_no" name="tent" title="텐트 미신청" /> <img src="/images/et/auto2013/answer2-2.png" alt="미신청" /></label>
				</div>
				
				<h3 class="mt20 mb10"><img src="/images/et/auto2013/question_03.png" alt="3.삼성카드 오토캠핑에 참가해야 하는 특별한 사연을 남겨 주세요.채택된 사연 중 감동적인 이야기는 캠핑 현장에서 소개해 드립니다. " /></h3>
				
				<p class="al_right mr10"><label><span><input type="text" name="remain_intro" value="2000" class="txt" style="border:none;text-align:right" style="width:20px;" title="글 바이트수" /> 사연(2000/2000byte)</span></label></p>
				<div class="mb20" style="clear:both;">
					<div class="box_white w660"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
					<textarea name="autoCampingText" cols="100" rows="7" onChange="maxLengthCheck('2000', null, this, remain_intro);" onKeyup="maxLengthCheck('2000', null, this, remain_intro);" title="사연 작성"></textarea>
					</div></div>
				</div>

				<h3 class="mt20 mb10"><img src="/images/et/auto2013/question_04.png" alt="4. 연락 가능한 전화번호(연락불가 시 당첨이 취소될 수 있습니다.)" /></h3>
				<div class="d_desc">
					<span class="input_phone">
						<select name="tel1" onchange="clearField('tel1','tel2','tel3')" title="휴대폰 앞자리">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
							<option value = "018">018</option>
							<option value = "019">019</option>
						</select>&nbsp;-&nbsp;<input type="text" name="tel2" maxlength="4" style="ime-mode:disabled" class="txt" value="" onkeypress="checkLenN(this, 4, form1.tel3); checkTypes(this, 'NUMB');" title="휴대폰 가운데자리" />&nbsp;-&nbsp;
						<input type="text" name="tel3" maxlength="4" style="ime-mode:disabled" class="txt" value="" onKeyPress="checkTypes(this, 'NUMB');" title="휴대폰 뒷자리" />
					</span>
				</div>

				<h3  class="mt20 mb10"><img src="/images/et/auto2013/question_05.png" alt="5. 제휴업체 개인정보 제공 동의" /></h3>
				
				<div class="pos_rel">
						<ul class="list_dashed">
							<li>이벤트 당첨 시, 기재해 주신 내용 및 전화번호는 본 행사 준비 및 안내를 위해 이벤트 업체에 제공됩니다.</li>
							<li>제휴 이벤트 업체 : 이데아인터렉티브</li>
							<!-- 130410 추가 -->
							<li> 제공된 정보는 <strong class="t_black">6월30일</strong>까지 보유 후 폐기되며, 본 사항에 동의하시지 않을 경우 이벤트에 참여하실 수 없습니다.</li>
							<!-- //130410 추가 -->
						</ul>
					
					<div class="mt5 btnr"><!-- 130410 수정 -->
						<label for="label_agr_private_credit1"><input type="radio" class="rdo" value="" id="label_agr_private_credit1" name="id_agr_private_credit" /> <strong>동의</strong></label>
						<label for="label_agr_private_credit2"><input type="radio" class="rdo" value="" id="label_agr_private_credit2" name="id_agr_private_credit"  checked="checked" /> 동의안함</label>
					</div>
					
				</div>
				
				<div class="content_block_yark"></div>
				

				<div class="btnc mt30"><a href="#" onClick="go_start();"><img src="/images/et/auto2013/btn_eventapply.png" alt="이벤트 응모하기" /></a></div>
		</div>
		
	</div>

	<!-- footer -->
	<div id="pop_footer">
		<address class="none">Copyright 2013. SamsungCard. All Rights Reserved.</address>
		<p style="text-align:right;padding:6px 40px 5px 0px; color:#999;letter-spacing:-1px;" class="t_no"></p>
		<input type="button" class="btn_close btn_input" onclick="window.close();" title="창닫기" /> 
	</div>
</div>
<!-- SR내역 13.04.19 --> 
<div id="lay_1" class="pop_l_position pop_l_wrap_alert" style="left: 17%; top: 305px; display: none;"> 
    <div class="pop_l_wrap"><p class="img_l_pop flag_tl"> </p><p class="img_l_pop flag_tr"> </p><p class="img_l_pop flag_bl"> </p><p class="img_l_pop flag_br"> </p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none'; closeLayerPopup();" value="레이어닫기" title="레이어 닫기" /> 
        <p class="pop_tit2"><img src="/images/et/auto2013/layer_tit_camp.png" alt="삼성카드 오토캠핑 이벤트에 정상적으로 응모하셨습니다." /></p> 
        <div class="pop_l_content"> 
            <div class="pop_l_alert02"> 
                <p>이벤트에 응모해 주신 회원님께 감사의 마음을 <br /> 
                전하고자, 참 실용적인 캠핑 용품 특가전을 마련했습니다.<br /> 
                아래 링크를 통해 방문해 주시기 바랍니다.</p> 
                <p class="btnc pt20 pb20"><a href="javascript:layerclose(1);closeLayerPopup();"><img src="/images/common/btn_s_confirm02.png" alt="확인" /></a></p> 
                <div class="line_lgray"> </div> 
                <p class="btnc">이벤트 응모회원만 접속 가능합니다. <a href="https://shopping.samsungcard.com/cms_content/ec/sp/ss/camping.html" target="_blank" title="새창"><img src="/images/et/auto2013/btn_camping.png" alt="캠핑용품 특가전 바로가기" /></a></p> 
            </div> 
        </div> 
    </div> 
</div> 
<!-- //SR내역 13.04.19 --> 
</form>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈 프레임"></iframe>
</body>
</html>