<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>서프라이즈 웨딩 Festival - 삼성카드</title>
<%
	String eventGubun = (String)request.getAttribute("eventGubun");

%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
textarea{border:0 none; background:transparent}
textarea.txt	{border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.txttest {border:0px; color:#666; font-family:"돋움", applegothic, sans-serif;line-height:10px}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}

#wedding_app	{width:600px; height:572px; background:url('/images/et/wedding/bg_weddingpop.jpg') no-repeat}
#wedding_app	.wedding_tit	{padding:19px 0 0 0}
#wedding_app	.wedding_body	{padding:14px 46px 0 46px}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}

.wedtbl	{border-collapse:separate; *border-collapse:collapse; border-top:1px solid #ffada5; border-bottom:1px solid #ffada5}
.wedtbl	th	{padding:13px 0 7px 20px; border-bottom:1px solid #eee; color:#666; font-size:11px; font-weight:normal; text-align:left; vertical-align:top}
.wedtbl	td	{padding:8px 0 7px; border-bottom:1px solid #eee; color:#666; font-size:12px; vertical-align:top; letter-spacing:-1px; line-height:18px; word-break:keep-all}
.wedtbl	th.noline,	.wedtbl	td.noline	{border-bottom:0 none}

.desc	 li	{background:url('/images/et/wedding/ico_bullet.gif') 10px 6px no-repeat; padding-left:20px; font-size:11px; color:#999; line-height:16px; letter-spacing:-1px}
.btnc	{margin-top:25px; text-align:center}

.pl10	{padding-left:10px}
.pl20	{padding-left:20px}
.pt5	 {padding-top:5px}
.pt15	 {padding-top:15px}
.mt10	{margin-top:10px}
</style>
<script type="text/javascript" src="/js/common-hp-validation.js"></script>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		with(document.form1){
			
			if ( husname.value == '' ) {
				alert('신랑이름을 확인하세요.');
				husname.focus();
				return false;
			}
			if ( wifename.value == '' ) {
				alert('신부이름을 확인하세요.');
				wifename.focus();
				return false;
			}	
			if ( marmonth.value == '' ) {
				alert('결혼일자(월)를 확인하세요.');
				marmonth.focus();
				return false;
			}
			if ( marday.value == '' ) {
				alert('결혼일자(일)를 확인하세요.');
				marday.focus();
				return false;
			}		
			if ( weddinghall.value == '' ) {
				alert('결혼식장명을 확인하세요.');
				weddinghall.focus();
				return false;
			}		
			if ( weddingcontext.value == '' ) {
				alert('사연을 확인하세요.');
				weddingcontext.focus();
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

<form name="form1" action="/hp/im/et/evt.do?method=setWeddingEventPop" method="post">

<div id="wedding_app">
	<div class="wedding_tit">
		<% if(eventGubun.equals("A")){%>
		<img src="/images/et/wedding/tit_wedding_song.jpg" alt="유리상자의 활홀한 축가 신청하기" />
		<%} else { %>
		<img src="/images/et/wedding/tit_wedding_mc.jpg" alt="윤형빈의 로맨틱한 사회 신청하기" />
		<%} %>
	</div>
	<div class="wedding_body">
		<table class="wedtbl" summary="신랑 신부 이름, 결혼일자, 결혼식장 명, 사연, 전화번호 등 이벤트 신청 정보를 입력하실 수 있습니다.">
        	<caption>이벤트 신청 정보 입력</caption>
			<colgroup><col width="25%" /><col width="70%" /></colgroup>
			<tbody>
				<tr>
					<th><img src="/images/et/wedding/tit_name.gif" alt="신랑 신부 이름" /></th>
					<td>신랑 <input type="text" name="husname" class="txt" title="신랑이름" maxlength="20" />
					<span class="pl20">신부 <input type="text" name="wifename" class="txt" title="신부이름" maxlength="20" /></span></td>
				</tr>
				<tr>
					<th><img src="/images/et/wedding/tit_date.gif" alt="결혼일자" /></th>
					<td><input type="text" name="marmonth" class="txt" style="width:50px" title="월" maxlength="2" onkeypress="checkTypes(this,'NUMB');"/> 월
						<span class="pl20"><input type="text" name="marday" style="width:50px" class="txt" title="일" maxlength="2" onkeypress="checkTypes(this,'NUMB');"/> 일</span></td>
				</tr>
				<tr>
					<th><img src="/images/et/wedding/tit_hall.gif" alt="결혼식장 명" /></th>
					<td><p><input type="text" name="weddinghall" class="txt" style="width:90%" maxlength="50" title="결혼식장명" /></p>
							<p class="pt5">ex) 서울 강남구 삼성동 삼성컨벤션웨딩홀 등<br />
							※ 결혼식장 명 오류 입력 시 응모 취소될 수 있습니다.</p></td>
				</tr>
				<tr>
					<th><p><img src="/images/et/wedding/tit_txt.gif" alt="사연" /></p>
						<p class="pt15">
							<input type="text" size="4" name="remain_intro" value="2000" class="txttest" />

							/2000byte</p></th>
					<td>
					<textarea class="txt" name="weddingcontext" style="width:370px; height:110px" title="컨텐츠 소개글을 입력하세요"  checknull="컨텐츠 소개글을 입력하세요" onchange="maxLengthCheck('2000', null, this, remain_intro);" onkeyup="maxLengthCheck('2000', null, this, remain_intro);" cols="60" rows="10"></textarea>
					
					<!-- 	<textarea name="intro" checkNull="컨텐츠 소개글을 입력하세요" class="txt" style="width:90%; height:110px" onChange="javascript:maxLengthCheck('2000', null, this, remain_intro);" onKeyup="javascript:maxLengthCheck('2000', null, this, remain_intro);">
						</textarea>-->


					
					
					</td>
				</tr>
				<tr>
					<th class="noline"><img src="/images/et/wedding/tit_phone.gif" alt="전화번호" /></th>
					<td class="noline"><p><!-- <strong>010 -123 - 4567</strong>-->
                    <span class="pl10"><a href="#" onclick="opener.parent.goTabPage('NHPIMMHUFM001M001', true);return false;"><img src="/images/et/wedding/btn_modify.gif" alt="회원정보조회변경 바로가기" /></a></span></p>
						<p class="pt5">※ 개인신상정보 오류 입력 시 추후 당첨이 무효될 수 있습니다.</p></td>
				</tr>
			</tbody>
		</table>
		<ul class="desc mt10">
			<li>회원님께서 기재해주신 내용 및 전화번호는 당첨 시 안내 및 행사준비를 위해 이벤트 업체에<br />정보가 제공됩니다.</li>
			<li>제휴 이벤트 업체 : 이데아 인터렉티브</li>
		</ul>
        <p class="btnc"><a href="#" onclick="go_start();return false;"><img src="/images/et/wedding/btn_weddingapp.gif" alt="응모하기" /></a></p>
	</div>

</div>
<input type="text" name="eventGubun" id="eventGubun" value="<%=eventGubun%>"/>
</form>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>

</body>

</html>

