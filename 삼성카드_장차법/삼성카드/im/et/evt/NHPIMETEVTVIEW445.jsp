<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<title>뮤지컬 조로 초대 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	
	String grade01 = (String)request.getAttribute("grade01");
	String grade02 = (String)request.getAttribute("grade02");
	String grade03 = (String)request.getAttribute("grade03");
	String grade04 = (String)request.getAttribute("grade04");
	String grade05 = (String)request.getAttribute("grade05");
	String mygrade = (String)request.getAttribute("mygrade");
	String user09 = (String)request.getAttribute("user09");
	
%>
<style type="text/css">
/*공통*/
* {margin:0; padding:0;}
body, div, li, dt, dd, label, a, select, textarea, p, span, th, td	{margin:0; padding:0; color:#666; font:normal 12px '돋움'; text-decoration: none;}
input.radioBtn{width: 13px; height: 13px; margin: 0; padding: 0; line-height: 1em; vertical-align: top;}
img	{border:0 none; vertical-align: top; font-size:0; line-height:0}
ul dl ol{margin: 0; padding: 0;}
li{ list-style:none; margin: 0; padding: 0;}

/* 버튼 */
#wrap{position: relative;}

/* radio01 */
#wrap .radioBt .radio01{position: absolute; left: 178px; top: 986px; width: 400px; overflow: hidden;}
#wrap .radioBt .radio02{position: absolute; left: 178px; top: 1014px; width: 400px; overflow: hidden;} 
#wrap .radioBt .radio03{position: absolute; left: 178px; top: 1045px; width: 400px; overflow: hidden;} 
#wrap .radioBt .radio04{position: absolute; left: 178px; top: 1077px; width: 400px; overflow: hidden;} 
#wrap .radioBt .radio05{position: absolute; left: 178px; top: 1108px; width: 400px; overflow: hidden;} 
#wrap .radioBt .radio01 li,#wrap .radioBt .radio02 li,#wrap .radioBt .radio03 li,#wrap .radio04 li,#wrap .radioBt .radio05 li{ float: left;}
#wrap .radioBt .bt01{width: 60px; overflow: hidden; margin-right: 66px; text-align: center; }
#wrap .radioBt .bt02{width: 50px; overflow: hidden; margin-right: 57px; text-align: right;} 
#wrap .radioBt li.bt03{width: 100px; overflow: hidden; margin-right: 26px; background: url("/html/et/zorro/images/line_bg.png") left top; position: relative; height: 16px;}
#wrap .radioBt .bt03 .competition01 {width: 55px; position: absolute; top: 0; left: -2px;  text-align: right;}
#wrap .radioBt .bt03 .competition02 {width: 55px; position: absolute; top: 0; left: 70px; text-align: left;}


</style>
<script language="javascript" type="text/javascript">
	
	function go_start(gubun) {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12059');
		<%
			}else{
		%>
			<%if( user09.equals("Y")){ %>
			alert("삼성카드 웹회원 중 정회원만 응모 가능합니다.");
			<%}else if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				<%if (mygrade.equals("1")) { %>
				alert("이미 [VIP석]에 응모하셨습니다. 감사합니다.");
					<%} else if (mygrade.equals("2")) {%>
					alert("이미 [R석]에 응모하셨습니다. 감사합니다.");
					<%} else if (mygrade.equals("3")) {%>
					alert("이미 [S석]에 응모하셨습니다. 감사합니다.");
					<%} else if (mygrade.equals("4")) {%>
					alert("이미 [A석]에 응모하셨습니다. 감사합니다.");
					<%} else if (mygrade.equals("5")) {%>
					alert("이미 [B석]에 응모하셨습니다. 감사합니다.");
					<%}	%>
			<%}else{ %>
				applyEvent(gubun);
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent(gubun) {
		parent.submit_eventLog();
		document.evtFrm.gubun.value=gubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(gubun){
		if (gubun == "1") {
			alert("[VIP석]에 응모되었습니다. 감사합니다.");
		} else if (gubun == "2") {
			alert("[R석]에 응모되었습니다. 감사합니다.");
		} else if (gubun == "3") {
			alert("[S석]에 응모되었습니다. 감사합니다.");
		} else if (gubun == "4") {
			alert("[A석]에 응모되었습니다. 감사합니다.");
		} else if (gubun == "5") {
			alert("[B석]에 응모되었습니다. 감사합니다.");
		}
		
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
<div id="wrap">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=applyZorro201111" method="post">
<input type="hidden" name="gubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

	<img src="/html/et/zorro/images/musical_event.jpg" alt="뮤지컬 조로 초대 이벤트" usemap="#musical"/>
	<map id="musical">
		<area shape="rect" coords="547,905,686,931" href="#" onclick='window.open("/html/et/zorro/zorrol_pop.html","zorrop","width=710, height=924")' alt="죄석배치도 확인하세요" title="새창"/>
		<area shape="rect" coords="562,980,632,1000" href="#" alt="응모하기1" onclick="go_start(1);"/>
		<area shape="rect" coords="562,1010,632,1030" href="#" alt="응모하기2" onclick="go_start(2);"/>
		<area shape="rect" coords="562,1042,632,1062" href="#" alt="응모하기3" onclick="go_start(3);"/>
		<area shape="rect" coords="562,1073,632,1093" href="#" alt="응모하기4" onclick="go_start(4);"/>
		<area shape="rect" coords="562,1104,632,1125" href="#" alt="응모하기5" onclick="go_start(5);"/>
		<area shape="rect" coords="67,1366,147,1380" href="javascript:parent.submit_eventLog();parent.goTabPageWithParam('NHPIMETEVTDTL','cmsSeq=18851');" alt="자세히보기" />
	</map>
	<div class="radioBt">
		<ul class="radio01">
			<li class="bt01">256명</li>
			<li class="bt02"><%=String.valueOf(grade01) %>명</li>
			<li class="bt03"><fileTag:emzCommonZorro pdt_cnt='256' req_cnt='<%=String.valueOf(grade01) %>' inputCss="" /></li>
		</ul>
		<ul class="radio02">
			<li class="bt01">220명</li>
			<li class="bt02"><%=String.valueOf(grade02) %>명</li>
			<li class="bt03"><fileTag:emzCommonZorro pdt_cnt='220' req_cnt='<%=String.valueOf(grade02) %>' inputCss="" /></li>
		</ul>
		<ul class="radio03">
			<li class="bt01">218명</li>
			<li class="bt02"><%=String.valueOf(grade03) %>명</li>
			<li class="bt03"><fileTag:emzCommonZorro pdt_cnt='218' req_cnt='<%=String.valueOf(grade03) %>' inputCss="" /></li>
		</ul>
		<ul class="radio04">
			<li class="bt01">84명</li>
			<li class="bt02"><%=String.valueOf(grade04) %>명</li>
			<li class="bt03"><fileTag:emzCommonZorro pdt_cnt='84' req_cnt='<%=String.valueOf(grade04) %>' inputCss="" /></li>
		</ul>
		<ul class="radio05">
			<li class="bt01">49명</li>
			<li class="bt02"><%=String.valueOf(grade05) %>명</li>
			<li class="bt03"><fileTag:emzCommonZorro pdt_cnt='49' req_cnt='<%=String.valueOf(grade05) %>' inputCss="" /></li>

		</ul>
	</div>
</div>

</body>

</html>

