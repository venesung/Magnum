<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>스크린 골프 만원 캐시백 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String eventApplyYn = (String)request.getAttribute("eventApplyYn"); //이벤트응모가능여부(쿠폰등록갯수가 6000개미만일경우)
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, div, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; letter-spacing:1px; line-height:20px}

img  {border:0;}
div {margin:0; padding:0}

div.layer_popup {position:relative}
div.layer_popup div {position:absolute; left:128px; top:650px}
#lay_write_number input {width:45px; height:20px; border:0 none}
#lay_write_number input.no_01 {position:absolute; left:80px; top:123px}
#lay_write_number input.no_02 {position:absolute; left:175px; top:123px}
#lay_write_number input.no_03 {position:absolute; left:270px; top:123px}
#lay_write_number input.no_04 {position:absolute; left:370px; top:123px}
</style>

<script language="javascript" type="text/javascript">
	
	function go_event() {
		var frm = document.evtFrm;
		frm.coupon_no.value = frm.coupon_no1.value + frm.coupon_no2.value + frm.coupon_no3.value + frm.coupon_no4.value;
		
		if(frm.coupon_no.value.length != 16){
			alert("쿠폰번호를 확인해주세요");
			return;
		}
			
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	
	}

	function layer_open(name) {
		document.getElementById(name).style.display='block';
	}
	function layer_close(name) {
		document.getElementById(name).style.display='none';
		location.reload();
	}

	function coupon_open(name) {
		document.getElementById('lay_write_number').style.display='none';
		document.getElementById('lay_correct_answer').style.display='block';
	}

	function event_check(){
		<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
		<%}else if( beginDateYN.equals("N")){ %>
		  	alert("<%=beginMsg %>");
		<%}else{%>
			<% if(eventApplyYn.equals("N")){ %>
				alert("죄송합니다. 선착순 응모가 종료되었습니다.");
			<%}else if(loginYN.equals("N")){  %>
				parent.eventLogin('11735');
			<%}else{%>
				layer_open('lay_write_number')
			<%}%>
		<%} %>	
	}

	function applyOk(){
		coupon_open('lay_correct_answer');
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

	function applyCheckNo(){
		alert("이미 응모된 쿠폰번호입니다. ");
	}

	function applyCouponNo(){
		alert("쿠폰번호 확인 후 다시 입력 바랍니다.");
	}

	function checkLenN(obj, len, next){
		if(obj.value.length>=len){
			if(!next==""){
				next.value="";
				// 20130411 웹접근성(장차법)  수정
				//next.focus();
			}
		}
	}
</script>


</head>

<body style="margin:0;">
<!-- 이하 화면 접근성 TF 작업 대상 화면 아님(이벤트는 최근 1년만 해당) 13.04.12 -->

 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=samsungLifeCouponEvent" method="post">
    <input type="hidden" name="item03" value=""/>
    <input type="hidden" name="eventNo" value="<%=eventNo%>"/>
    <input type="hidden" name="eventApplyYn" value="<%=eventApplyYn%>"/>
    <input type="hidden" name="coupon_no" value="<%=eventApplyYn%>"/>
    <!-- 골프 캐시백 이벤트 -->
    <div class="layer_popup">
        <img src="/images/event/event_cashback_golf.jpg" alt="스크린 골프 만원 캐시백 이벤트" usemap="#event_golf" />
        <map name="event_golf" id="event_golf">
        <area shape="rect" coords="256,891,467,941" alt="쿠폰번호 입력하기" href="javascript:event_check();" />
        </map>
    
        <!-- 쿠폰번호입력 layer 팝업-->
        <div id="lay_write_number" style="display:none">
            <img src="/images/event/popup_golf_number.png" alt="삼성생명FC에게 받은 쿠폰번호를 입력해주시기 바랍니다." usemap="#event_number" />
            <map name="event_number" id="event_number">
            <area shape="rect" coords="197,234,280,266" alt="완료" href="javascript:go_event();" />
            </map>
            <p><input type="text" class="no_01" name="coupon_no1" maxlength="4" onkeypress="checkLenN(this, 4, evtFrm.coupon_no2);" /><input type="text" class="no_02"  name="coupon_no2"  maxlength="4"  onkeypress="checkLenN(this, 4, evtFrm.coupon_no3);"/><input type="text" name="coupon_no3"  class="no_03" maxlength="4" onkeypress="checkLenN(this, 4, evtFrm.coupon_no4);" /><input type="text" class="no_04" name="coupon_no4"  maxlength="4" /></p>
        </div>
    
        <!-- 입력정상알림 layer 팝업-- -->
        <div id="lay_correct_answer" style="display:none">
            <img src="/images/event/popup_golf_correct.png" alt="입력이 정상적으로 처리되었습니다."  usemap="#event_correct" />
            <map name="event_correct" id="event_correct">
            <area shape="rect" coords="200,245,280,280" alt="닫기" onclick="layer_close('lay_correct_answer')" />
            </map>	
        </div>
    
    </div>
</form>
</body>

</html>

