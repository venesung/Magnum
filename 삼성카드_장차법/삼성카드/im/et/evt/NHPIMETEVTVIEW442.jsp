<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>참 실용적인,삼성카드의 튀는 숫자 고르기! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	//String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String chanceCnt = (String)request.getAttribute("intchanceCnt");//응모가능 횟수
	String gubun = (String)request.getAttribute("gubun");
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align: top; font-size:0; line-height:0}
ul, ol, li	{list-style:none; list-style-position:outside}
#lunchEvent{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_0{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_1{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_2{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_3{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_4{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_5{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_6{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}
#step_7{width: 728px; height: 1160; background: url(/images/et/number2011/lunching_evet_bg.png)  repeat-y left top;}

.step_list {display: none;}
.eventText{ width: 628px; height: 48px;}
.eventnumber{width: 628px; overflow: hidden; margin-left: 50px;}
.eventnumber .countingnumber{ float: left; margin: 15px 0 0 0;}
.eventnumber .countingnumber span {color: #3f8cc0; font-weight: bold;}
.eventnumber .countingImg{ float: right; margin-top: 10px;}
.centerVisual{ text-align: center;}
.bottomText{ text-align: center; margin-top: 50px;} 


.step_style01 {width: 629px;overflow: hidden;padding: 18px 0 0;}
.step_style01 li {float: left;padding: 0 29px 0 0;height: 198px;}/* 111108 수정 */
.step_style01 li.pr0 {padding-right: 0;}
.step_style01 li.pr1 {padding-left: 104px;}
.step_style01 li p.checkTxt {padding: 10px 0 0;}
.step_style01 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style01 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style01 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style02 {width: 629px;overflow: hidden;padding: 18px 0 0;}
.step_style02 li {float: left;padding: 0 29px 0 0;height: 198px;}
.step_style02 li.pr0 {padding-right: 0;}
.step_style02 li.pr1 {padding-left: 104px;}
.step_style02 li p.checkTxt {padding: 10px 0 0;}
.step_style02 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style02 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style02 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style03 {width: 629px;overflow: hidden;padding: 18px 0 0;}
.step_style03 li {float: left;padding: 0 29px 0 0;height: 198px;}
.step_style03 li.pr0 {padding-right: 0;}
.step_style03 li p.checkTxt {padding: 10px 0 0;}
.step_style03 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style03 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style03 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style04 {width: 629px;overflow: hidden;padding: 18px 0 0;}
.step_style04 li {float: left;padding: 0 29px 0 0;}
.paddingStyle04 li {padding: 0 31px 0 0;height: 145px;}
.step_style04 li.pr0 {padding-right: 0;}
.step_style04 li p.checkTxt {padding: 10px 0 0;}
.step_style04 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style04 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style04 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style05 {width: 640px;overflow: hidden;padding: 18px 0 0;}
.step_style05 li {float: left;padding: 0 29px 0 0;}
.paddingStyle05 li {padding: 0 31px 0 0;height: 145px;}
.step_style05 li.pr0 {padding-right: 0;}
.step_style05 li.pl165 {padding-left: 165px;}
.step_style05 li p.checkTxt {padding: 10px 0 0;}
.step_style05 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style05 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style05 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style06 {width: 629px;overflow: hidden;padding: 18px 0 0;}
.step_style06 li {float: left;padding: 0 29px 0 0;}
.paddingStyle06 li {padding: 0 31px 0 0;height: 145px;}
.step_style06 li.pr0 {padding-right: 0;}
.step_style06 li p.checkTxt {padding: 10px 0 0;}
.step_style06 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style06 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style06 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.step_style07 {width: 640px;overflow: hidden;padding: 18px 0 0;}
.step_style07 li {float: left;padding: 0 29px 0 0;}
.paddingStyle07 li {padding: 0 31px 0 0;height: 145px;}
.step_style07 li.pr0 {padding-right: 0;}
.step_style07 li.pl165 {padding-left: 165px;}
.step_style07 li p.checkTxt {padding: 10px 0 0;}
.step_style07 li p.checkTxt input {margin: 0;padding: 0;width: 13px;height: 13px;vertical-align: top;}
.step_style07 li p.checkTxt label {vertical-align: top;display: inline-block;margin: 0 0 0 3px;}
.step_style07 li p.checkTxt label img {vertical-align: top;display: inline-block: }

.total_style01 {background: url("/images/et/number2011/total_style01.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style01 .txt_num1 {position: absolute;left: 148px;top: 31px;font-size: 14px; color: #333;}
.total_style01 .txt_num2 {position: absolute;left: 342px;top: 31px;font-size: 14px; color: #333;}
.total_style01 .txt_num3 {position: absolute;left: 504px;top: 31px;font-size: 14px; color: #333;}


.total_style02 {background: url("/images/et/number2011/total_style02.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style02 .txt_num1 {position: absolute;left: 148px;top: 31px;font-size: 14px; color: #333;}
.total_style02 .txt_num2 {position: absolute;left: 342px;top: 31px;font-size: 14px; color: #333;}
.total_style02 .txt_num3 {position: absolute;left: 504px;top: 31px;font-size: 14px; color: #f39018;}

.total_style03 {background: url("/images/et/number2011/total_style03.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.step_cont {width: 627px; margin: 0 auto;}
.total_style03 .txt_num1 {position: absolute;left: 127px;top: 31px;font-size: 14px; color: #333;}
.total_style03 .txt_num2 {position: absolute;left: 275px;top: 31px;font-size: 14px; color: #333;}
.total_style03 .txt_num3 {position: absolute;left: 400px;top: 31px;font-size: 14px; color: #333;}
.total_style03 .txt_num4 {position: absolute;left: 521px;top: 31px;font-size: 14px; color: #269fa7;}

.total_style04 {background: url("/images/et/number2011/total_style04.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style04 .txt_num1 {position: absolute;left: 148px;top: 31px;font-size: 14px; color: #333;}
.total_style04 .txt_num2 {position: absolute;left: 342px;top: 31px;font-size: 14px; color: #333;}
.total_style04 .txt_num3 {position: absolute;left: 504px;top: 31px;font-size: 14px; color: #e2753a;}

.total_style05 {background: url("/images/et/number2011/total_style05.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style05 .txt_num1 {position: absolute;left: 148px;top: 31px;font-size: 14px; color: #333;}
.total_style05 .txt_num2 {position: absolute;left: 342px;top: 31px;font-size: 14px; color: #333;}
.total_style05 .txt_num3 {position: absolute;left: 504px;top: 31px;font-size: 14px; color: #d54a4d;}

.total_style06 {background: url("/images/et/number2011/total_style06.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style06 .txt_num1 {position: absolute;right: 420px;top: 31px;font-size: 14px; color: #333;}
.total_style06 .txt_num2 {position: absolute;left: 275px;top: 31px;font-size: 14px; color: #333;}
.total_style06 .txt_num3 {position: absolute;right: 162px;top: 31px;font-size: 14px; color: #333;}
.total_style06 .txt_num4 {position: absolute;right: 10px;top: 31px;font-size: 14px; color: #659655;}

.total_style07 {background: url("/images/et/number2011/total_style07.png") no-repeat left top;width: 628px; height: 60px;position: relative;}
.total_style07 .txt_num1 {position: absolute;right: 420px;top: 31px;font-size: 14px; color: #333;}
.total_style07 .txt_num2 {position: absolute;left: 275px;top: 31px;font-size: 14px; color: #333;}
.total_style07 .txt_num3 {position: absolute;right: 162px;top: 31px;font-size: 14px; color: #333;}
.total_style07 .txt_num4 {position: absolute;right: 10px;top: 31px;font-size: 14px; color: #3c87c0;}

.btn{text-align: center; margin-top: 20px;}

.conts_hidden {font-size:0; line-height:0; width:0; height:0; padding:0 !important; margin:0; visibility:hidden; overflow:hidden;}

</style>
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">
	
	function go_start(gubun) {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12017');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
		  	<%}else if( Integer.parseInt(chanceCnt) < 1){ %>
			  	alert("응모기회가 없습니다.");
			<%}else{ %>
				applyEvent(gubun);
			<% } %>	
		<%
			}
		%>
	}
	
	function applyEvent(gubun) {
		var ovEvtDiv = document.getElementById("evtFrm");
		var checkList = ovEvtDiv.getElementsByTagName("input");
		var j = 0;
		for(var i = 0 ; i < checkList.length ; i++){
			if(checkList[i].type == 'checkbox'){
				if(checkList[i].checked){
					//document.evtFrm.chkBox.value += checkList[i].value+"|";
					j++ ;
				}
			}
		}
		
		if(j == 0){
			alert("선택된 건이 없습니다.");
			return;
		} else if (gubun=="1" && j != 1) {
			alert("원하시는 경품  1개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="2" && j != 2) {
			alert("원하시는 경품  2개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="3" && j != 3) {
			alert("원하시는 경품  3개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="4" && j != 4) {
			alert("원하시는 경품  4개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="5" && j != 5) {
			alert("원하시는 경품  5개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="6" && j != 6) {
			alert("원하시는 경품  6개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else if (gubun=="7" && j != 7) {
			alert("원하시는 경품  7개를  선택해  주시기 바랍니다.");
			clearAllCheckBox();
			return;
		} else {

			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].checked){
						document.evtFrm.chkBox.value += checkList[i].value+",";
					}
				}
			}
			document.evtFrm.gubun.value = gubun;						
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
			
		}				
	}


	function applyOk(){
		//showTargetDiv('8');
		location.href="/hp/im/et/evt002.do?method=getNum2011Evt&gubun=Y";
	}

	jQuery(document).ready(function() {
		<%
		if (gubun.equals("Y")) {%>
			showTargetDiv('8');
		<%} else {%>
			showTargetDiv('0');
		<%}
		%>
	});
	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}
	function pop201107() {
		window.open('/html/event/jeju/popup_cheju_zone.html','pop201107','menubar=0,resizable=0,scrollbars=0,width=710,height=610,left=0,top=0');
	}
	function pop20110726() {
		window.open('/html/event/jeju/popup_cheju_zone_20110726.html','pop20110726','menubar=0,resizable=0,scrollbars=0,width=710,height=590,left=0,top=0');
	}

	function goPopList() {
		<%
		if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12017');
		<%
			}else{
		%>
		<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
		<%}else if( beginDateYN.equals("N")){ %>
		  	alert("<%=beginMsg %>");
		<%}else{ %>
			window.open('/hp/im/et/evt002.do?method=getNum2011EvtInfo','goPopList','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');
		<% } %>	
		<%
			}
		%>
	
		
	}
	function showTargetDiv(num){
			clearAllCheckBox();
		for (i=0; i<9; i++)	{
			document.getElementById("step_"+i).style.display = "none";
			if (i==num) {		document.getElementById("step_"+num).style.display = "block";	}
		}
	}

	function clearAllCheckBox() {
		var ovEvtDiv = document.getElementById("evtFrm");
		var checkList = ovEvtDiv.getElementsByTagName("input");
		for(var i = 0 ; i < checkList.length ; i++){
			if(checkList[i].type == 'checkbox'){
				if(checkList[i].checked){
					checkList[i].checked = false; 
				}
			}
		}
	}

	function chkBoxChk(gubun,thisvalue) {
		var ovEvtDiv = document.getElementById("evtFrm");
		var checkList = ovEvtDiv.getElementsByTagName("input");
		var j = 0;
		for(var i = 0 ; i < checkList.length ; i++){
			if(checkList[i].type == 'checkbox'){
				if(checkList[i].checked){
					j++ ; 
				}
			}
		}
		
		if (gubun == "1" && j > 1) {//1개만 인정
			alert("경품은 1개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}	
		} else if (gubun == "2" && j > 2) {
			alert("경품은 2개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else if (gubun == "3" && j > 3) {
			alert("경품은 3개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else if (gubun == "4" && j > 4) {
			alert("경품은 4개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else if (gubun == "5" && j > 5) {
			alert("경품은 5개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else if (gubun == "6" && j > 6) {
			alert("경품은 6개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else if (gubun == "7" && j > 7) {
			alert("경품은 7개까지만 선택 가능합니다.\n다른 경품을  원하시면 현재 체크된  경품을 해제해 주세요.");
			for(var i = 0 ; i < checkList.length ; i++){
				if(checkList[i].type == 'checkbox'){
					if(checkList[i].value == thisvalue){
						checkList[i].checked = false; 
					}
				}
			}
		} else {
			//숫자 변경
			if (gubun == "1") {
				if (j == 1) {
					document.getElementById("txt1_1").innerHTML = "1,000,000원";
					document.getElementById("txt1_2").innerHTML = "1개";
					document.getElementById("txt1_3").innerHTML = "1,000,000원";
				} else if (j == 0) {
					document.getElementById("txt1_1").innerHTML = "0원";
					document.getElementById("txt1_2").innerHTML = "0개";
					document.getElementById("txt1_3").innerHTML = "0원";
				}
			} else if (gubun == "2") {
				if (j == 2) {
					document.getElementById("txt2_1").innerHTML = "1,000,000원";
					document.getElementById("txt2_2").innerHTML = "2개";
					document.getElementById("txt2_3").innerHTML = "1,000,000원";
				} else if (j == 1) {
					document.getElementById("txt2_1").innerHTML = "500,000원";
					document.getElementById("txt2_2").innerHTML = "1개";
					document.getElementById("txt2_3").innerHTML = "500,000원";
				} else if (j == 0) {
					document.getElementById("txt2_1").innerHTML = "0원";
					document.getElementById("txt2_2").innerHTML = "0개";
					document.getElementById("txt2_3").innerHTML = "0원";
				}
			} else if (gubun == "3") {
				if (j == 3) {
					document.getElementById("txt3_1").innerHTML = "990,000원";
					document.getElementById("txt3_2").innerHTML = "3개";
					document.getElementById("txt3_3").innerHTML = "10,000P";
					document.getElementById("txt3_4").innerHTML = "1,000,000원";
				} else if (j == 2) {
					document.getElementById("txt3_1").innerHTML = "660,000원";
					document.getElementById("txt3_2").innerHTML = "2개";
					document.getElementById("txt3_3").innerHTML = "10,000P";
					document.getElementById("txt3_4").innerHTML = "670,000원";
				} else if (j == 1) {
					document.getElementById("txt3_1").innerHTML = "330,000원";
					document.getElementById("txt3_2").innerHTML = "1개";
					document.getElementById("txt3_3").innerHTML = "10,000P";
					document.getElementById("txt3_4").innerHTML = "340,000원";
				} else if (j == 0) {
					document.getElementById("txt3_1").innerHTML = "0원";
					document.getElementById("txt3_2").innerHTML = "0개";
					document.getElementById("txt3_3").innerHTML = "0P";
					document.getElementById("txt3_4").innerHTML = "0원";
				}
			} else if (gubun == "4") {
				if (j == 4) {
					document.getElementById("txt4_1").innerHTML = "1,000,000원";
					document.getElementById("txt4_2").innerHTML = "4개";
					document.getElementById("txt4_3").innerHTML = "1,000,000원";
				} else if (j == 3) {
					document.getElementById("txt4_1").innerHTML = "750,000원";
					document.getElementById("txt4_2").innerHTML = "3개";
					document.getElementById("txt4_3").innerHTML = "750,000원";
				} else if (j == 2) {
					document.getElementById("txt4_1").innerHTML = "500,000원";
					document.getElementById("txt4_2").innerHTML = "2개";
					document.getElementById("txt4_3").innerHTML = "500,000원";
				} else if (j == 1) {
					document.getElementById("txt4_1").innerHTML = "250,000원";
					document.getElementById("txt4_2").innerHTML = "1개";
					document.getElementById("txt4_3").innerHTML = "250,000원";
				} else if (j == 0) {
					document.getElementById("txt4_1").innerHTML = "0원";
					document.getElementById("txt4_2").innerHTML = "0개";
					document.getElementById("txt4_3").innerHTML = "0원";
				}				
			} else if (gubun == "5") {
				if (j == 5) {
					document.getElementById("txt5_1").innerHTML = "1,000,000원";
					document.getElementById("txt5_2").innerHTML = "5개";
					document.getElementById("txt5_3").innerHTML = "1,000,000원";
				} else if (j == 4) {
					document.getElementById("txt5_1").innerHTML = "800,000원";
					document.getElementById("txt5_2").innerHTML = "4개";
					document.getElementById("txt5_3").innerHTML = "800,000원";
				} else if (j == 3) {
					document.getElementById("txt5_1").innerHTML = "600,000원";
					document.getElementById("txt5_2").innerHTML = "3개";
					document.getElementById("txt5_3").innerHTML = "600,000원";
				} else if (j == 2) {
					document.getElementById("txt5_1").innerHTML = "400,000원";
					document.getElementById("txt5_2").innerHTML = "2개";
					document.getElementById("txt5_3").innerHTML = "400,000원";
				} else if (j == 1) {
					document.getElementById("txt5_1").innerHTML = "200,000원";
					document.getElementById("txt5_2").innerHTML = "1개";
					document.getElementById("txt5_3").innerHTML = "200,000원";
				} else if (j == 0) {
					document.getElementById("txt5_1").innerHTML = "0원";
					document.getElementById("txt5_2").innerHTML = "0개";
					document.getElementById("txt5_3").innerHTML = "0원";
				}				
			} else if (gubun == "6") {
				if (j == 6) {
					document.getElementById("txt6_1").innerHTML = "960,000원";
					document.getElementById("txt6_2").innerHTML = "6개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "1,000,000원";
				} else if (j == 5) {
					document.getElementById("txt6_1").innerHTML = "800,000원";
					document.getElementById("txt6_2").innerHTML = "5개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "840,000원";
				} else if (j == 4) {
					document.getElementById("txt6_1").innerHTML = "640,000원";
					document.getElementById("txt6_2").innerHTML = "4개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "680,000원";
				} else if (j == 3) {
					document.getElementById("txt6_1").innerHTML = "480,000원";
					document.getElementById("txt6_2").innerHTML = "3개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "520,000원";
				} else if (j == 2) {
					document.getElementById("txt6_1").innerHTML = "320,000원";
					document.getElementById("txt6_2").innerHTML = "2개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "360,000원";
				} else if (j == 1) {
					document.getElementById("txt6_1").innerHTML = "160,000원";
					document.getElementById("txt6_2").innerHTML = "1개";
					document.getElementById("txt6_3").innerHTML = "40,000P";
					document.getElementById("txt6_4").innerHTML = "200,000원";
				} else if (j == 0) {
					document.getElementById("txt6_1").innerHTML = "0원";
					document.getElementById("txt6_2").innerHTML = "0개";
					document.getElementById("txt6_3").innerHTML = "0P";
					document.getElementById("txt6_4").innerHTML = "0원";
				}			
			} else if (gubun == "7") {
				if (j == 7) {
					document.getElementById("txt7_1").innerHTML = "980,000원";
					document.getElementById("txt7_2").innerHTML = "7개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "1,000,000원";
				} else if (j == 6) {
					document.getElementById("txt7_1").innerHTML = "760,000원";
					document.getElementById("txt7_2").innerHTML = "6개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "780,000원";
				} else if (j == 5) {
					document.getElementById("txt7_1").innerHTML = "640,000원";
					document.getElementById("txt7_2").innerHTML = "5개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "660,000원";
				} else if (j == 4) {
					document.getElementById("txt7_1").innerHTML = "520,000원";
					document.getElementById("txt7_2").innerHTML = "4개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "540,000원";
				} else if (j == 3) {
					document.getElementById("txt7_1").innerHTML = "400,000원";
					document.getElementById("txt7_2").innerHTML = "3개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "420,000원";
				} else if (j == 2) {
					document.getElementById("txt7_1").innerHTML = "280,000원";
					document.getElementById("txt7_2").innerHTML = "2개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "300,000원";
				} else if (j == 1) {
					document.getElementById("txt7_1").innerHTML = "140,000원";
					document.getElementById("txt7_2").innerHTML = "1개";
					document.getElementById("txt7_3").innerHTML = "20,000P";
					document.getElementById("txt7_4").innerHTML = "160,000원";
				} else if (j == 0) {
					document.getElementById("txt7_1").innerHTML = "0원";
					document.getElementById("txt7_2").innerHTML = "0개";
					document.getElementById("txt7_3").innerHTML = "0P";
					document.getElementById("txt7_4").innerHTML = "0원";
				}							
			}
			
		}
	}
</script>


</head>

<body style="margin:0;">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt002.do?method=setNum2011Evt" method="post">
<input type="hidden" name="gubun" value=""/>
<input type="hidden" name="chkBox" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
<div id="step_0" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step01_number.png" alt="원하시는 숫자를 클릭하세요." />
		<!--ol class="step_list">
			<li><span>현재단계</span>step1-원하시는 숫자를 클릭하세요.</li>
			<li>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="centerVisual"><img src="/images/et/number2011/step01_con_img.png" alt="" border="0" usemap="#Map0"/>
	<map name="Map0" id="Map0">
		<area shape="rect" coords="50,53,93,154" href="#" onclick="showTargetDiv('1');" alt="1. 큰 거 하나면 충분하니까!" />
		<area shape="rect" coords="200,53,248,154" href="#" onclick="showTargetDiv('2');" alt="2. 둘 다 갖고 싶었어!" />
		<area shape="rect" coords="355,53,406,154" href="#" onclick="showTargetDiv('3');" alt="3. 하루 3번 행복해지고 싶어서!" />
		<area shape="rect" coords="509,53,559,154" href="#" onclick="showTargetDiv('4');" alt="4. 4개 모두 놓칠 수 없어서!" />
		<area shape="rect" coords="50,220,102,318" href="#" onclick="showTargetDiv('5');" alt="5. 오늘따라, 5가 튀어 보여서!" />
		<area shape="rect" coords="200,220,251,318" href="#" onclick="showTargetDiv('6');" alt="6. 내가 좋아하는 숫자 6!" />
		<area shape="rect" coords="355,220,406,318" href="#" onclick="showTargetDiv('7');" alt="7. 행운의 숫자 7이니까 7개!" />
	</map>
		
  </div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다를 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>


<div id="step_1" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>

			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step01.png" alt="1. 큰 거 하나면 충분하니까!"  usemap="#step01" />
			<map name="step01" id="step01">
				<!-- 1번 삭제 -->
				<!--
				<area shape="rect" coords="370,36,402,58 " href="step01.html" alt="1" />
				-->
				<!-- 1번 삭제 -->
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style01">
				<li>
					<img src="/images/et/number2011/step01_premium_list01.jpg" alt="삼성 하이브리드 카메라 NX11B2L/BS" />
					<p class="checkTxt"><label for="step01_01"><input type="checkbox" class="type-checkbox" id="step01_01" value="101" onclick="chkBoxChk('1',this.value);"/><img src="/images/et/number2011/step01_text01.png" alt="삼성 하이브리드 카메라 NX11B2L/BS"  /><span class="conts_hidden">삼성 하이브리드 카메라 NX11B2L/BS</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step01_premium_list02.jpg" alt="삼성 지펠 홈바형 냉장고 SRS75HCBGG" />
					<p class="checkTxt"><label for="step01_02"><input type="checkbox" class="type-checkbox" id="step01_02" value="102" onclick="chkBoxChk('1',this.value);"/><img src="/images/et/number2011/step01_text02.png" alt="삼성 지펠 홈바형 냉장고 SRS75HCBGG" /><span class="conts_hidden">삼성 지펠 홈바형 냉장고 SRS75HCBGG</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step01_premium_list03.jpg" alt="삼성 기프트카드 100만원권" />
					<p class="checkTxt"><label for="step01_03"><input type="checkbox" class="type-checkbox" id="step01_03" value="103" onclick="chkBoxChk('1',this.value);"/><img src="/images/et/number2011/step01_text03.png" alt="삼성 기프트카드 100만원권"  /><span class="conts_hidden">삼성 기프트카드 100만원권</span></label></p>
				</li>
				<li class="pr1">
					<img src="/images/et/number2011/step01_premium_list04.jpg" alt="삼성 LED TV UN32D5550RF" />
					<p class="checkTxt"><label for="step01_04"><input type="checkbox" class="type-checkbox"  id="step01_04"  value="104" onclick="chkBoxChk('1',this.value);"/><img src="/images/et/number2011/step01_text04.png" alt="삼성 LED TV UN32D5550RF" /><span class="conts_hidden">삼성 LED TV UN32D5550RF</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step01_premium_list05.jpg" alt="삼성 지펠아삭 김치냉장고 KRS281WQVB" />
					<p class="checkTxt"><label for="step01_05"><input type="checkbox" class="type-checkbox" id="step01_05" value="105" onclick="chkBoxChk('1',this.value);"/><img src="/images/et/number2011/step01_text05.png" alt="삼성 지펠아삭 김치냉장고 KRS281WQVB"  /><span class="conts_hidden">삼성 지펠아삭 김치냉장고 KRS281WQVB</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style01">
				<strong class="txt_num1" id="txt1_1">0원</strong>
				<strong class="txt_num2" id="txt1_2">0개</strong>
				<strong class="txt_num3" id="txt1_3">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('1');"><img src="/images/et/number2011/step01_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step01_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_2" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step02.png" alt="2. 둘 다 갖고 싶었어!"  usemap="#step02" />
			<map name="step02" id="step02">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<!-- 2번 삭제 -->
				<!--
				<area shape="rect" coords="403,36,439,58" href="step02.html" alt="2" />
				-->
				<!-- 2번 삭제 -->
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style02">
				<li>
					<img src="/images/et/number2011/step02_premium_list01.jpg" alt="필립스 센소터치3D RQ1280cc" />
					<p class="checkTxt"><label for="step02_01"><input type="checkbox" class="type-checkbox" id="step02_01" value="201" onclick="chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text01.png" alt="필립스 센소터치3D RQ1280cc"  /><span class="conts_hidden">필립스 센소터치3D RQ1280cc</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step02_premium_list02.jpg" alt="쿠첸 명품철장 10인용 WHA-BT1000iD" />
					<p class="checkTxt"><label for="step02_02"><input type="checkbox" class="type-checkbox" id="step02_02" value="202" onclick="chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text02.png" alt="쿠첸 명품철장 10인용 WHA-BT1000iD" /><span class="conts_hidden">쿠첸 명품철장 10인용 WHA-BT1000iD</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step02_premium_list03.jpg" alt="신세계백화점 상품권 50만원" />
					<p class="checkTxt"><label for="step02_03"><input type="checkbox" class="type-checkbox" id="step02_03" value="203" onclick="chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text03.png" alt="신세계백화점 상품권 50만원"  /><span class="conts_hidden">신세계백화점 상품권 50만원</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step02_premium_list04.jpg" alt="벤타 에어워셔 LW24 PLUS" />
					<p class="checkTxt"><label for="step02_04"><input type="checkbox" class="type-checkbox"  id="step02_04" value="204" onclick="chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text04.png" alt="벤타 에어워셔 LW24 PLUS" /><span class="conts_hidden">벤타 에어워셔 LW24 PLUS</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step02_premium_list05.jpg" alt="illy커피머신 mitaca i-1" />
					<p class="checkTxt"><label for="step02_05"><input type="checkbox" class="type-checkbox" id="step02_05" value="205" onclick="chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text05.png" alt="illy커피머신 mitaca i-1"  /><span class="conts_hidden">illy커피머신 mitaca i-1</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step02_premium_list06.jpg" alt="삼성 스마트 탱고 로봇 청소기 VC-RM52V" />
					<p class="checkTxt"><label for="step02_06"><input type="checkbox" class="type-checkbox" id="step02_06" value="206" onclick=":chkBoxChk('2',this.value);"/><img src="/images/et/number2011/step02_text06.png" alt="삼성 스마트 탱고 로봇 청소기 VC-RM52V"/><span class="conts_hidden">삼성 스마트 탱고 로봇 청소기 VC-RM52V</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style02">
				<strong class="txt_num1" id="txt2_1">0원</strong>
				<strong class="txt_num2" id="txt2_2">0개</strong>
				<strong class="txt_num3" id="txt2_3">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('2');"><img src="/images/et/number2011/step02_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step02_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_3" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step03.png" alt="3 하루 3번 행복해지고 싶어서!"  usemap="#step03" />
			<map name="step03" id="step03">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<!-- 3번 삭제 -->
				<!--
				<area shape="rect" coords="440,36,475,58" href="step03.html" alt="3" />
				-->
				<!-- 3번 삭제 -->
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style03">
				<li>
					<img src="/images/et/number2011/step03_premium_list01.jpg" alt="삼천리 2011년형 MTB형 팀콤프2.9D 26인치 자전거" />
					<p class="checkTxt"><label for="step03_01"><input type="checkbox" class="type-checkbox" id="step03_01" value="301" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text01.png" alt="삼천리 2011년형 MTB형 팀콤프2.9D 26인치 자전거"  /><span class="conts_hidden">삼천리 2011년형 MTB형 팀콤프2.9D 26인치 자전거</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step03_premium_list02.jpg" alt="샘소나이트 가죽서류가방" />
					<p class="checkTxt"><label for="step03_02"><input type="checkbox" class="type-checkbox" id="step03_02" value="302" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text02.png" alt="샘소나이트 가죽서류가방" /><span class="conts_hidden">샘소나이트 가죽서류가방</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step03_premium_list03.jpg" alt="정관장 홍삼톤 리미티드" />
					<p class="checkTxt"><label for="step03_03"><input type="checkbox" class="type-checkbox" id="step03_03" value="303" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text03.png" alt="정관장 홍삼톤 리미티드"  /><span class="conts_hidden">정관장 홍삼톤 리미티드</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step03_premium_list04.jpg" alt="필립스 커피머신 HD 8323" />
					<p class="checkTxt"><label for="step03_04"><input type="checkbox" class="type-checkbox"  id="step03_04" value="304" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text04.png" alt="필립스 커피머신 HD 8323" /><span class="conts_hidden">필립스 커피머신 HD 8323</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step03_premium_list05.jpg" alt="필립스 센소터치 3D RQ 1250/16" />
					<p class="checkTxt"><label for="step03_05"><input type="checkbox" class="type-checkbox" id="step03_05" value="305" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text05.png" alt="필립스 센소터치 3D RQ 1250/16"  /><span class="conts_hidden">필립스 센소터치 3D RQ 1250/16</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step03_premium_list06.jpg" alt="삼성 디카 Samsung EC-WB700" />
					<p class="checkTxt"><label for="step03_06"><input type="checkbox" class="type-checkbox" id="step03_06" value="306" onclick="chkBoxChk('3',this.value);"/><img src="/images/et/number2011/step03_text06.png" alt="삼성 디카 Samsung EC-WB700"/><span class="conts_hidden">삼성 디카 Samsung EC-WB700</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style03">
				<strong class="txt_num1" id="txt3_1">0원</strong>
				<strong class="txt_num2" id="txt3_2">0개</strong>
				<strong class="txt_num3" id="txt3_3">0P</strong>
				<strong class="txt_num4" id="txt3_4">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('3');"><img src="/images/et/number2011/step03_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step03_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_4" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step04.png" alt="4개 모두 놓칠 수 없어서!"  usemap="#step04" />
			<map name="step04" id="step04">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				<!-- 4번 삭제 -->
				<!--
				<area shape="rect" coords="476,36,511,58" href="step04.html" alt="4" />
				-->
				<!-- //4번 삭제 -->
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style04 paddingStyle04">
				<li>
					<img src="/images/et/number2011/step04_premium_list01.jpg" alt="오쿠 만능요리기 OC-8300RN" />
					<p class="checkTxt"><label for="step04_01"><input type="checkbox" class="type-checkbox" id="step04_01" value="401" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text01.png" alt="오쿠 만능요리기 OC-8300RN"  /><span class="conts_hidden">오쿠 만능요리기 OC-8300RN</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step04_premium_list02.jpg" alt="WMF 디아뎀플러스 후라이팬 2종 (20cm+24cm)" />
					<p class="checkTxt"><label for="step04_02"><input type="checkbox" class="type-checkbox" id="step04_02" value="402" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text02.png" alt="WMF 디아뎀플러스 후라이팬 2종 (20cm+24cm)" /><span class="conts_hidden">WMF 디아뎀플러스 후라이팬 2종 (20cm+24cm)</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step04_premium_list03.jpg" alt="D&amp;G WATCH DW0484(M)" />
					<p class="checkTxt"><label for="step04_03"><input type="checkbox" class="type-checkbox" id="step04_03" value="403" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text03.png" alt="D&amp;G WATCH DW0484(M)"  /><span class="conts_hidden">D&amp;G WATCH DW0484(M)</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step04_premium_list04.jpg" alt="D&amp;G WATCH DW0520(W)" />
					<p class="checkTxt"><label for="step04_04"><input type="checkbox" class="type-checkbox"  id="step04_04" value="404" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text04.png" alt="D&amp;G WATCH DW0520(W)" /><span class="conts_hidden">D&amp;G WATCH DW0520(W)</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step04_premium_list05.jpg" alt="테팔 전기그릴 엑셀리오 엠비언스 멀티그릴 TG601051" />
					<p class="checkTxt"><label for="step04_05"><input type="checkbox" class="type-checkbox" id="step04_05" value="405" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text05.png" alt="테팔 전기그릴 엑셀리오 엠비언스 멀티그릴 TG601051"  /><span class="conts_hidden">테팔 전기그릴 엑셀리오 엠비언스 멀티그릴 TG601051</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step04_premium_list06.jpg" alt="삼성 트윈챔버(스텔스) 청소기 VC-BR836" />
					<p class="checkTxt"><label for="step04_06"><input type="checkbox" class="type-checkbox" id="step04_06" value="406" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text06.png" alt="삼성 트윈챔버(스텔스) 청소기 VC-BR836"/><span class="conts_hidden">삼성 트윈챔버(스텔스) 청소기 VC-BR836</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step04_premium_list07.jpg" alt="삼천리 2011년형 레스포 MTB형 팝콘 MT 26인치 자전거" />
					<p class="checkTxt"><label for="step04_07"><input type="checkbox" class="type-checkbox" id="step04_07" value="407" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text07.png" alt="삼천리 2011년형 레스포 MTB형 팝콘 MT 26인치 자전거"/><span class="conts_hidden">삼천리 2011년형 레스포 MTB형 팝콘 MT 26인치 자전거</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step04_premium_list08.jpg" alt="독일 치보 카피시모 에스프레소 캡슐커피머신" />
					<p class="checkTxt"><label for="step04_08"><input type="checkbox" class="type-checkbox" id="step04_08" value="408" onclick="chkBoxChk('4',this.value);"/><img src="/images/et/number2011/step04_text08.png" alt="독일 치보 카피시모 에스프레소 캡슐커피머신"/><span class="conts_hidden">독일 치보 카피시모 에스프레소 캡슐커피머신</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style04" style="margin-top: 24px;">
				<strong class="txt_num1" id="txt4_1">0원</strong>
				<strong class="txt_num2" id="txt4_2">0개</strong>
				<strong class="txt_num3" id="txt4_3">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('4');"><img src="/images/et/number2011/step04_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step04_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_5" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step05.png" alt="오늘따라, 5가 튀어 보여서!!"  usemap="#step05" />
			<map name="step05" id="step05">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<!-- 5번 삭제 -->
				<!--
				<area shape="rect" coords="512,36,546,58" href="step05.html" alt="5" />
				-->
				<!-- //5번 삭제 -->
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style05 paddingStyle05">
				<li>
					<img src="/images/et/number2011/step05_premium_list01.jpg" alt="샘소나이트 콤보서류가방" />
					<p class="checkTxt"><label for="step05_01"><input type="checkbox" class="type-checkbox" id="step05_01" value="501" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text01.png" alt="샘소나이트 콤보서류가방"  /><span class="conts_hidden">샘소나이트 콤보서류가방</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list02.jpg" alt="정관장 홍삼추출액-양" />
					<p class="checkTxt"><label for="step05_02"><input type="checkbox" class="type-checkbox" id="step05_02" value="502" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text02.png" alt="정관장 홍삼추출액-양" /><span class="conts_hidden">정관장 홍삼추출액-양</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list03.jpg" alt="필립스 소니케어 HX6972)" />
					<p class="checkTxt"><label for="step05_03"><input type="checkbox" class="type-checkbox" id="step05_03" value="503" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text03.png" alt="필립스 소니케어 HX6972"  /><span class="conts_hidden">필립스 소니케어 HX6972</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step05_premium_list04.jpg" alt="테팔 심플리 롱글라이드 코팅 블랙 세트 (후라이팬 24cm+28cm+멀티28cm+뚜껑)" />
					<p class="checkTxt"><label for="step05_04"><input type="checkbox" class="type-checkbox"  id="step05_04" value="504" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text04.png" alt="테팔 심플리 롱글라이드 코팅 블랙 세트 (후라이팬 24cm+28cm+멀티28cm+뚜껑)" /><span class="conts_hidden">테팔 심플리 롱글라이드 코팅 블랙 세트 (후라이팬 24cm+28cm+멀티28cm+뚜껑)</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list05.jpg" alt="삼성 방수 캠코더 HMX-W200TD" />
					<p class="checkTxt"><label for="step05_05"><input type="checkbox" class="type-checkbox" id="step05_05" value="505" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text05.png" alt="삼성 방수 캠코더 HMX-W200TD"  /><span class="conts_hidden">삼성 방수 캠코더 HMX-W200TD</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list06.jpg" alt="테팔 베르살리오 디럭스 멀티쿠커 FR402373" />
					<p class="checkTxt"><label for="step05_06"><input type="checkbox" class="type-checkbox" id="step05_06" value="506" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text06.png" alt="테팔 베르살리오 디럭스 멀티쿠커 FR402373"/><span class="conts_hidden">테팔 베르살리오 디럭스 멀티쿠커 FR402373</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list07.jpg" alt="정관장 홍삼톤 리미티드 30포" />
					<p class="checkTxt"><label for="step05_07"><input type="checkbox" class="type-checkbox" id="step05_07" value="507" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text07.png" alt="정관장 홍삼톤 리미티드 30포"/><span class="conts_hidden">정관장 홍삼톤 리미티드 30포</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step05_premium_list08.jpg" alt="천호식품 흑마늘 진액 오리지널80ml*60*2박스" />
					<p class="checkTxt"><label for="step05_08"><input type="checkbox" class="type-checkbox" id="step05_08" value="508" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text08.png" alt="천호식품 흑마늘 진액 오리지널80ml*60*2박스"/><span class="conts_hidden">천호식품 흑마늘 진액 오리지널80ml*60*2박스</span></label></p>
				</li>
				<li class="pl165">
					<img src="/images/et/number2011/step05_premium_list09.jpg" alt="CJ 외식 상품권 20만원권" />
					<p class="checkTxt"><label for="step05_09"><input type="checkbox" class="type-checkbox" id="step05_09" value="509" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text09.png" alt="CJ 외식 상품권 20만원권"/><span class="conts_hidden">CJ 외식 상품권 20만원권</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step05_premium_list10.jpg" alt="SILIT 실리트 바리아노바 곰솥 26cm " />
					<p class="checkTxt"><label for="step05_10"><input type="checkbox" class="type-checkbox" id="step05_10" value="510" onclick="chkBoxChk('5',this.value);"/><img src="/images/et/number2011/step05_text10.png" alt="SILIT 실리트 바리아노바 곰솥 26cm "/><span class="conts_hidden">SILIT 실리트 바리아노바 곰솥 26cm</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style05" style="margin-top: 11px;">
				<strong class="txt_num1" id="txt5_1">0원</strong>
				<strong class="txt_num2" id="txt5_2">0개</strong>
				<strong class="txt_num3" id="txt5_3">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('5');"><img src="/images/et/number2011/step05_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step05_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_6" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step06.png" alt="6.내가 좋아하는 숫자6!!"  usemap="#step06" />
			<map name="step06" id="step06">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<!-- 6번 삭제 -->
				<!--
				<area shape="rect" coords="547,36,582,58" href="step06.html" alt="6" />
				-->
				<!-- //6번 삭제 -->
				<area shape="rect" coords="583,36,617,58" href="#" onclick="showTargetDiv('7');" alt="7" />
			</map>
			<ul class="step_style06 paddingStyle06">
				<li>
					<img src="/images/et/number2011/step06_premium_list01.jpg" alt="정관장 아이패스 H" />
					<p class="checkTxt"><label for="step06_01"><input type="checkbox" class="type-checkbox" id="step06_01" value="601" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text01.png" alt="정관장 아이패스 H"  /><span class="conts_hidden">정관장 아이패스 H</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list02.jpg" alt="정관장 홍삼톤골드" />
					<p class="checkTxt"><label for="step06_02"><input type="checkbox" class="type-checkbox" id="step06_02" value="602" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text02.png" alt="정관장 홍삼톤골드" /><span class="conts_hidden">정관장 홍삼톤골드</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list03.jpg" alt="드롱기 무선 전기주전자 KBO2001" />
					<p class="checkTxt"><label for="step06_03"><input type="checkbox" class="type-checkbox" id="step06_03" value="603" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text03.png" alt="드롱기 무선 전기주전자 KBO2001"  /><span class="conts_hidden">드롱기 무선 전기주전자 KBO2001</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step06_premium_list04.jpg" alt="kochstar 에코 다이아몬드 코팅 세트 (후라이팬 20cm+28cm + 멀티팬 28cm)" />
					<p class="checkTxt"><label for="step06_04"><input type="checkbox" class="type-checkbox"  id="step06_04" value="604" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text04.png" alt="kochstar 에코 다이아몬드 코팅 세트 (후라이팬 20cm+28cm + 멀티팬 28cm)" /><span class="conts_hidden">kochstar 에코 다이아몬드 코팅 세트 (후라이팬 20cm+28cm + 멀티팬 28cm)</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list05.jpg" alt="샘소나이트 Saffiano 지갑+벨트 세트" />
					<p class="checkTxt"><label for="step06_05"><input type="checkbox" class="type-checkbox" id="step06_05" value="605" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text05.png" alt="샘소나이트 Saffiano 지갑+벨트 세트"  /><span class="conts_hidden">샘소나이트 Saffiano 지갑+벨트 세트</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list06.jpg" alt="쿠첸 듀얼스팀청소기 CSC-D910 " />
					<p class="checkTxt"><label for="step06_06"><input type="checkbox" class="type-checkbox" id="step06_06" value="606" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text06.png" alt="쿠첸 듀얼스팀청소기 CSC-D910 "/><span class="conts_hidden">쿠첸 듀얼스팀청소기 CSC-D910</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list07.jpg" alt="한경희생활과학 SVRT-6200GD " />
					<p class="checkTxt"><label for="step06_07"><input type="checkbox" class="type-checkbox" id="step06_07" value="607" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text07.png" alt="한경희생활과학 SVRT-6200GD "/><span class="conts_hidden">한경희생활과학 SVRT-6200GD</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step06_premium_list08.jpg" alt="SILIT 실리트 콰드로 곰솥 24cm" />
					<p class="checkTxt"><label for="step06_08"><input type="checkbox" class="type-checkbox" id="step06_08" value="608" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text08.png" alt="SILIT 실리트 콰드로 곰솥 24cm"/><span class="conts_hidden">SILIT 실리트 콰드로 곰솥 24cm</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list09.jpg" alt="삼성 전자레인지 RE-C23BRZ" />
					<p class="checkTxt"><label for="step06_09"><input type="checkbox" class="type-checkbox" id="step06_09" value="609" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text09.png" alt="삼성 전자레인지 RE-C23BRZ"  /><span class="conts_hidden">삼성 전자레인지 RE-C23BRZ</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list10.jpg" alt="삼성 디카 Samsung EC-ST65" />
					<p class="checkTxt"><label for="step06_10"><input type="checkbox" class="type-checkbox" id="step06_10" value="610" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text10.png" alt="삼성 디카 Samsung EC-ST65"/><span class="conts_hidden">삼성 디카 Samsung EC-ST65</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step06_premium_list11.jpg" alt="쿠첸 6인용 압력밥솥 CPP-Q06LB11F" />
					<p class="checkTxt"><label for="step06_11"><input type="checkbox" class="type-checkbox" id="step06_11" value="611" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text11.png" alt="쿠첸 6인용 압력밥솥 CPP-Q06LB11F"/><span class="conts_hidden">쿠첸 6인용 압력밥솥 CPP-Q06LB11F</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step06_premium_list12.jpg" alt="삼성카드 서비스포인트 16만점" />
					<p class="checkTxt"><label for="step06_12"><input type="checkbox" class="type-checkbox" id="step06_12" value="612" onclick="chkBoxChk('6',this.value);"/><img src="/images/et/number2011/step06_text12.png" alt="삼성카드 서비스포인트 16만점"/><span class="conts_hidden">삼성카드 서비스포인트 16만점</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style06" style="margin-top: 10px;">
				<strong class="txt_num1" id="txt6_1">0원</strong>
				<strong class="txt_num2" id="txt6_2">0개</strong>
				<strong class="txt_num3" id="txt6_3">0P</strong>
				<strong class="txt_num4" id="txt6_4">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('6');"><img src="/images/et/number2011/step06_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step06_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>

<div id="step_7" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step02_number.png" alt="원하시는 경품을 선택하세요" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li><span>현재단계</span>step2-원하시는 경품을 선택하세요</li>
			<li>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="premium_list">
		<div class="step_cont">
			<img src="/images/et/number2011/tit_step07.png" alt="7.행웃의 숫자 7이니까 7개!"  usemap="#step07" />
			<map name="step07" id="step07">
				<area shape="rect" coords="370,36,402,58 " href="#" onclick="showTargetDiv('1');" alt="1" />
				<area shape="rect" coords="403,36,439,58" href="#" onclick="showTargetDiv('2');" alt="2" />
				<area shape="rect" coords="440,36,475,58" href="#" onclick="showTargetDiv('3');" alt="3" />
				<area shape="rect" coords="476,36,511,58" href="#" onclick="showTargetDiv('4');" alt="4" />
				<area shape="rect" coords="512,36,546,58" href="#" onclick="showTargetDiv('5');" alt="5" />
				<area shape="rect" coords="547,36,582,58" href="#" onclick="showTargetDiv('6');" alt="6" />
				<!-- 7번 삭제 -->
				<!--
				<area shape="rect" coords="583,36,617,58" href="step07.html" alt="7" />
				-->
				<!-- //7번 삭제 -->
			</map>
			<ul class="step_style07 paddingStyle07">
				<li>
					<img src="/images/et/number2011/step07_premium_list01.jpg" alt="정관장 홍삼톤 마일드 30포" />
					<p class="checkTxt"><label for="step07_01"><input type="checkbox" class="type-checkbox" id="step07_01" value="701" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text01.png" alt="정관장 홍삼톤 마일드 30포"  /><span class="conts_hidden">정관장 홍삼톤 마일드 30포</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list02.jpg" alt="정관장 홍이장군 올튼" />
					<p class="checkTxt"><label for="step07_02"><input type="checkbox" class="type-checkbox" id="step07_02" value="702" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text02.png" alt="정관장 홍이장군 올튼" /><span class="conts_hidden">정관장 홍이장군 올튼</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list03.jpg" alt="지멘스 커피메이커 TC60203V" />
					<p class="checkTxt"><label for="step07_03"><input type="checkbox" class="type-checkbox" id="step07_03" value="703" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text03.png" alt="지멘스 커피메이커 TC60203V"  /><span class="conts_hidden">지멘스 커피메이커 TC60203V</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step07_premium_list04.jpg" alt="삼성 디카 Samsung EC-ES80" />
					<p class="checkTxt"><label for="step07_05"><input type="checkbox" class="type-checkbox"  id="step07_04" value="704" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text04.png" alt="삼성 디카 Samsung EC-ES80" /><span class="conts_hidden">삼성 디카 Samsung EC-ES80</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list05.jpg" alt="테팔 심플리 롱글라이드 코팅 블랙 세트" />
					<p class="checkTxt"><label for="step07_05"><input type="checkbox" class="type-checkbox" id="step07_05" value="705" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text05.png" alt="테팔 심플리 롱글라이드 코팅 블랙 세트"  /><span class="conts_hidden">테팔 심플리 롱글라이드 코팅 블랙 세트</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list06.jpg" alt="kochstar 블루다이아몬드 후라이팬 세트" />
					<p class="checkTxt"><label for="step07_06"><input type="checkbox" class="type-checkbox" id="step07_06" value="706" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text06.png" alt="kochstar 블루다이아몬드 후라이팬 세트"/><span class="conts_hidden">kochstar 블루다이아몬드 후라이팬 세트</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list07.jpg" alt="SKK 세라믹 냄비 3종 세트(18편수, 20양수, 24전골)" />
					<p class="checkTxt"><label for="step07_07"><input type="checkbox" class="type-checkbox" id="step07_07" value="707" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text07.png" alt="SKK 세라믹 냄비 3종 세트(18편수, 20양수, 24전골)"/><span class="conts_hidden">SKK 세라믹 냄비 3종 세트(18편수, 20양수, 24전골)</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step07_premium_list08.jpg" alt="천호식품 산수유1000 프리미엄 4g X 60포 X 2박스" />
					<p class="checkTxt"><label for="step07_08"><input type="checkbox" class="type-checkbox"  id="step07_08" value="708" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text08.png" alt="천호식품 산수유1000 프리미엄 4g X 60포 X 2박스" /><span class="conts_hidden">천호식품 산수유1000 프리미엄 4g X 60포 X 2박스</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list09.jpg" alt="드롱기 토스터기 CTO2003" />
					<p class="checkTxt"><label for="step07_09"><input type="checkbox" class="type-checkbox" id="step07_09" value="709" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text09.png" alt="드롱기 토스터기 CTO2003"  /><span class="conts_hidden">드롱기 토스터기 CTO2003</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list10.jpg" alt="WMF 2종세트 16cm Low, 16cm 편수" />
					<p class="checkTxt"><label for="step07_10"><input type="checkbox" class="type-checkbox" id="step07_10" value="710" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text10.png" alt="WMF 2종세트 16cm Low, 16cm 편수"/><span class="conts_hidden">WMF 2종세트 16cm Low, 16cm 편수</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list11.jpg" alt="한경희생활과학 살균스팀다리미 HISP-6000G " />
					<p class="checkTxt"><label for="step07_11"><input type="checkbox" class="type-checkbox" id="step07_11" value="711" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text11.png" alt="한경희생활과학 살균스팀다리미 HISP-6000G "/><span class="conts_hidden">한경희생활과학 살균스팀다리미 HISP-6000G</span></label></p>
				</li>
				<li class="pr0">
					<img src="/images/et/number2011/step07_premium_list12.jpg" alt="필립스 쥬서기 HR1861" />
					<p class="checkTxt"><label for="step07_12"><input type="checkbox" class="type-checkbox" id="step07_12" value="712" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text12.png" alt="필립스 쥬서기 HR1861"/><span class="conts_hidden">필립스 쥬서기 HR1861</span></label></p>
				</li>
				<li class="pl165">
					<img src="/images/et/number2011/step07_premium_list13.jpg" alt="삼성카드 서비스포인트 14만점" />
					<p class="checkTxt"><label for="step07_13"><input type="checkbox" class="type-checkbox" id="step07_13" value="713" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text13.png" alt="삼성카드 서비스포인트 14만점"/><span class="conts_hidden">삼성카드 서비스포인트 14만점</span></label></p>
				</li>
				<li>
					<img src="/images/et/number2011/step07_premium_list14.jpg" alt="삼성카드 캐시백 14만원 " />
					<p class="checkTxt"><label for="step07_14"><input type="checkbox" class="type-checkbox" id="step07_14" value="714" onclick="chkBoxChk('7',this.value);"/><img src="/images/et/number2011/step07_text14.png" alt="삼성카드 캐시백 14만원 "/><span class="conts_hidden">삼성카드 캐시백 14만원</span></label></p>
				</li>
			</ul><!-- //step_style01 -->
			<div class="total_style07">
				<strong class="txt_num1" id="txt7_1">0원</strong>
				<strong class="txt_num2" id="txt7_2">0개</strong>
				<strong class="txt_num3" id="txt7_3">0P</strong>
				<strong class="txt_num4" id="txt7_4">0원</strong>
			</div>
			<div class="btn">
				<a href="#" onclick="go_start('7');"><img src="/images/et/number2011/step07_btn01.png" alt="응모하기" /></a>
				<a href="#" onclick="showTargetDiv('0');"><img src="/images/et/number2011/step07_btn02.png" alt="메인페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>
<div id="lunchEvent">
<div id="step_8" style="display:none">
	<!-- 상단이미지 -->
	<div class="eventTop"><img src="/images/et/number2011/lunching_evet_top_img.png" alt="참 실용적인,삼성카드의 튀는 숫자 고르기!" /></div>
	<!-- Step번호 -->
	<div class="eventNumber"><img src="/images/et/number2011/step03_number.png" alt="응모가 완료되었습니다" />
		<!--ol class="step_list">
			<li>step1-원하시는 숫자를 클릭하세요.</li>
			<li>step2-원하시는 경품을 선택하세요</li>
			<li><span>현재단계</span>step3-응모가 완료되었습니다.</li>
		</ol-->
	</div>
	<!-- 응모 확인 -->
	<div class="eventText">
		<ul class="eventnumber">
			<li class="countingnumber">* 회원님의 총 응모가능 횟수는 <span><%=chanceCnt %>번</span> 입니다.</li>
			<li class="countingImg"><a href="#" onclick="goPopList();"><img src="/images/et/number2011/lunching_evet_bt.png" alt="응모내역보기" /></a></li>
		</ul>
	</div>
	<!-- 런칭 이벤트 비쥬얼 -->
	<div class="centerVisual"><img src="/images/et/number2011/step_close_con_img.png" alt="튀는 숫자 고르기에 응모해 주셔서 감사합니다." border="0" usemap="#Map"/>
		<map name="Map" id="Map">
			  <area shape="rect" coords="234,246,394,277" href="#" onclick="showTargetDiv('0');" alt="메인페이지 바로가기"/>
			  <area shape="rect" coords="45,375,56,426" href="#" onclick="showTargetDiv('1');" alt="1" />
			  <area shape="rect" coords="117,373,150,426" href="#" onclick="showTargetDiv('2');" alt="2" />
			  <area shape="rect" coords="203,375,235,426" href="#" onclick="showTargetDiv('3');" alt="3" />
			  <area shape="rect" coords="287,375,325,428" href="#" onclick="showTargetDiv('4');" alt="4" />
			  <area shape="rect" coords="381,375,416,426" href="#" onclick="showTargetDiv('5');" alt="5" />
			  <area shape="rect" coords="464,375,500,427" href="#" onclick="showTargetDiv('6');" alt="6" />
			  <area shape="rect" coords="551,374,586,426" href="#" onclick="showTargetDiv('7');" alt="7" />
		</map>
	</div>
	<!-- 하단 텍스트 -->
	<div class="bottomText"><img src="/images/et/number2011/lunching_bottom_text.png" alt="" />
	<ol class="step_list">
			<li>* 실제 경품의 액수는 표시된 금액과 다소 차이가 있을 수 있습니다.</li>
			<li>* 제세공과금 22%는 회원님 부담입니다.(당첨 후 12월 중으로 제세공과금 미입금 시 당첨이 취소됩니다.)</li>
			<li>* 개인신용카드/체크카드/올앳카드 회원 및 삼성카드 홈페이지 정회원만 응모가 가능하며, 무승인 매출(교통카, 후불하이패스 등)은 제외됩니다.</li>
			<li>* 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그내용을 사전에 알려드립니다.</li>
	  </ol>
	</div>
</div>
</div>
<!-- <div class="event_quiz">
<map name="quiz_event">
	<area shape="rect" coords="120,961,244,986" href="javascript:parent.submit_eventLog();parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0169');" alt="카드 혜택 자세히 보기"/>
	<area shape="rect" coords="306,961,430,986" href="javascript:parent.submit_eventLog();parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P0545');" alt="카드 혜택 자세히 보기"/>
	<area shape="rect" coords="490,961,614,986" href="javascript:parent.submit_eventLog();parent.goTabPageWithParam('NHPIMCDCPS011','kind_code=P1179');" alt="카드 혜택 자세히 보기"/>
	<area shape="rect" coords="257,1042,475,1097" href="#"  alt="응모하기" onclick="go_start();"/>
</map>
<img src="/images/et/quiz201110/event_quiz.jpg" usemap="#quiz_event" alt="삼성카드 Quiz Quiz Event" />
<p class="quiz1"><input type="radio" class="type-radio" id="quiz1" value="1" checked="checked" name="quiz"  />
<label for="quiz1"><img src="/images/et/quiz201110/txt_quiz1.png" alt="삼성빅앤빅카드" /></label></p>
<p class="quiz2"><input type="radio" class="type-radio" id="quiz2" value="2" name="quiz" />
<label for="quiz2"><img src="/images/et/quiz201110/txt_quiz2.png" alt="삼성티클래스카드" /></label></p>
<p class="quiz3"><input type="radio" class="type-radio" id="quiz3" value="3" name="quiz" />
<label for="quiz3"><img src="/images/et/quiz201110/txt_quiz3.png" alt="삼성카드 S클래스" /></label></p>
</div>-->
</form>
</body>

</html>

