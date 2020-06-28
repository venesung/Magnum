
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.scard.hpad.pe.ev.vo.NHPADNEWE001VO"%>
<%@ page import="com.scard.common.util.TimeUtil" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%@page import="java.io.BufferedReader"%>
<title>응모하기 - 삼성카드</title>
<%

String loginYN = (String)request.getAttribute("loginYN");
String strDup = (String)request.getAttribute("strDup");
String usrGrade = (String)request.getAttribute("usrGrade");

ArrayList<NHPADNEWE001VO> DATALIST = (ArrayList<NHPADNEWE001VO>) request.getAttribute("DATALIST");

if(DATALIST == null){
	DATALIST = new ArrayList<NHPADNEWE001VO>();
}


%>

<%if(!DATALIST.isEmpty() && DATALIST.size() != 0){%>
<%
for(int i = 0; i < DATALIST.size(); i++){
NHPADNEWE001VO vo = DATALIST.get(i);

//이벤트 기간 체크
String currentDate = TimeUtil.CurrentDateTime();
String beginDateYN = "";
String endDateYN = "";
currentDate = currentDate.substring(0,8)+"120000";

if (currentDate.compareTo(vo.getStartDate().trim()+"000000") < 0) {
	beginDateYN = "N";
}

if (currentDate.compareTo(vo.getEndDate().trim()+"235959") > 0) {
	endDateYN = "N";
}


String nameYN = "N";
String handphoneYN = "N";
String emailYN = "N";
String addressYN = "N";
String idenYN = "N";
String idYN = "N";
String per1YN = "N";
String per2YN = "N";

String[] aryData = vo.getData().split(",");
for(String tempPart : aryData) {
	if(tempPart.equals("name")) nameYN = "Y";
	if(tempPart.equals("handphone")) handphoneYN = "Y";
	if(tempPart.equals("email")) emailYN = "Y";
	if(tempPart.equals("address")) addressYN = "Y";
	if(tempPart.equals("iden")) idenYN = "Y";
	if(tempPart.equals("id")) idYN = "Y";
	if(tempPart.equals("per1")) per1YN = "Y";
	if(tempPart.equals("per2")) per2YN = "Y";
}


%>

<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px;}/* 120504 수정*/
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}

a:link		{text-decoration:none; color:#666666;}
a:visited	{text-decoration:none; color:#666666;}
a:hover		{text-decoration:underline; color:#f47709;}
a:active	{text-decoration:underline; color:#f47709;}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
strong	{font-weight:bold}
ul, ol, li	{list-style:none; list-style-position:outside}
fieldset	{border:0 none}
legend	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
select	{font-size:12px; letter-spacing:-1px;border: 1px solid #ccc;}
textarea{border:0 none; background:transparent}
textarea.txt	{border:none; color:#999; font:normal 12px "돋움";width:630px;height:80px;color:#999;overflow:hidden}

.clear	{clear:both; width:100%; height:0; _font-size:0; _line-height:0; overflow:auto; overflow:hidden}
.mt10{margin-top:10px;}
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.clfix:after {content:"."; display:block; clear:both; height:0; visibility:hidden}
.clfix {display:inline-block}

.dtable01   {border-collapse:separate; *border-collapse:collapse;border-top: 1px solid #d3d2c2;border-bottom: 1px solid #d3d2c2;}
.dtable01   th  {padding:4px 0 4px 10px; border-bottom:1px solid #f1eedd;  font:normal 12px "돋움"; line-height:14px;text-align:left;color:#777;background: #f6f5ee;}
.dtable01   td  {border-bottom:1px solid #f1eedd;  line-height:18px; word-break:keep-all;padding:4px 0 4px 10px; }
.dtable01   td.break  {word-break:break-all;}
.dtable01   th.lineno,.dtable01   td.lineno{border-bottom:none;}
input.txt	 {height:14px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}


.template_wrap {width:728px;}
.event_body {width:728px; background:url('/images/et/admin/event_body_bg.gif');}/* 120504 추가*/
.jui_template {width:648px;margin:0 auto;}
.grey {width:648px;border-top: 1px solid #f1eedd;margin:15px 0;height:1px;}
.imgList {width:100%;}
.imgList li{width:200px;float:left;padding-right:22px;margin-bottom:10px;}
.imgList li.pdnone {padding-right:0;}
.imgList li p{text-align:center;padding-bottom:5px;}

fieldset.fieldset_agree	 {position:static; height:auto}
fieldset.fieldset_agree	 legend	{position:static; margin:0 0 5px 10px; color:#999; font-size:12px; line-height:14px; visibility:visible}
fieldset.fieldset_agree	 .ab_tr	{right:10px}
fieldset.fieldset_agree	 label	{padding:0 10px}

.box_white	 {position:relative; background:white url('/images/et/admin/box_white.gif') no-repeat}
.box_white	 .flag_tr	 {position:absolute; right:0; top:0; width:5px; height:5px; background-position:right top; font-size:0; line-height:0}
.box_white	 .flag_bl	 {position:absolute; left:0; bottom:0; width:5px; height:5px; background-position:left bottom; font-size:0; line-height:0}
.box_white_btm	 {padding:10px; background:url('/images/et/admin/box_white.gif') no-repeat right bottom}
.box_white_btm	.agree {position:relative;width:620px; height:100px; overflow:auto; overflow-x:hidden;color:#999; }
.box_white_btm	.h_agree {height:70px;}	/* 110623 */
.box_white_btm	.agree p{color:#999}
.btnr	{margin-top:11px; text-align:right}
.btnr01	{ text-align:right; position:absolute; right: 3px; bottom:3px;}
input.chk, input.rdo01	{width:10px; height:10px; }
.agree_text {font-size: 12px; margin-left: 4px;}
h3{color:#5897ca;font-size:12px;font-weight:bold;}
.input_phone	select	{width:63px}

.mt20 {margin-top:20px;}
.mt40 {margin-top:40px;}
.mb20 {margin-bottom:20px;}
.mb40 {margin-bottom:40px;}
.al_center {text-align:center;}
.caution{position: relative;}
.caution h3{position: absolute;left: 0px;top: 0px;}
.caution .caution_list {margin-left:110px;}
.caution .caution_list li{background: url("/images/et/admin/icon_list.gif") no-repeat 0 8px;padding-left:10px;color:#999;font-size:11px;line-height:18px;margin-bottom:5px}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-hp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-hp-validation.js"></script>


<script language="javascript" type="text/javascript">
	var qes = "";
	var chkCheckbox = "N";
	function go_start() {

		<%
			if((loginYN.equals("N")) && (vo.getLogin().equals("Y"))){ 
		%>
			parent.eventLogin('<%=vo.getListNo()%>');

		<%
			}else{
		%>

			<%if (vo.getLogin().equals("Y")) {

				String chkUsrGrade = "N";//Y면 통과,N 이면 실패
				String[] aryTarget = vo.getTarget().split(",");
				for(String tempPart : aryTarget) {
					if(tempPart.equals("all")) chkUsrGrade= "Y";//all
					if((tempPart.equals("09")) && (usrGrade.equals("09"))) chkUsrGrade="Y";//준회원
					if((tempPart.equals("02")) && ((usrGrade.equals("02")) || (usrGrade.equals("03")) || (usrGrade.equals("07")))) chkUsrGrade="Y";//정회원
					if((tempPart.equals("08")) && (usrGrade.equals("08"))) chkUsrGrade="Y";//정회원2
					if((tempPart.equals("04")) && (usrGrade.equals("04"))) chkUsrGrade="Y";//법인
					if((tempPart.equals("05")) && ((usrGrade.equals("05")) || (usrGrade.equals("06")))) chkUsrGrade="Y";//가맹점
				}
				if (chkUsrGrade.equals("N")) {%>
					alert("회원님은 이벤트 대상자가 아닙니다.");
					return false;
					
			<%}}%>
		
			<%if( endDateYN.equals("N")){ %>
				alert("<%=vo.getStartDate().substring(0,4)%>년 <%=vo.getStartDate().substring(4,6)%>월 <%=vo.getStartDate().substring(6,8)%>일 부터 <%=vo.getEndDate().substring(0,4)%>년 <%=vo.getEndDate().substring(4,6)%>월 <%=vo.getEndDate().substring(6,8)%>일까지 응모가 가능합니다.");
			<%}else if( beginDateYN.equals("N")){ %>
				alert("<%=vo.getStartDate().substring(0,4)%>년 <%=vo.getStartDate().substring(4,6)%>월 <%=vo.getStartDate().substring(6,8)%>일 부터 <%=vo.getEndDate().substring(0,4)%>년 <%=vo.getEndDate().substring(4,6)%>월 <%=vo.getEndDate().substring(6,8)%>일까지 응모가 가능합니다.");
			<%}else if (strDup.equals("Y")) { %>
				alert("이미 이벤트에 응모하셨습니다.");
			<%}else{ %>

				//sojaemin
				<%if ("1".equals(vo.getType())) { %>
				<%} else if ("2".equals(vo.getType())) { %>
					<%if (Integer.parseInt(vo.getQuestion()) == 1) { %>
						if(document.evtFrm.question.checked){
							document.evtFrm.selquestion.value = "1";
							chkCheckbox = "Y";
						}
					<%} else if (Integer.parseInt(vo.getQuestion()) > 0) { %>
						for(i=0; i<<%=vo.getQuestion()%>; i++){
							if(document.evtFrm.question[i].checked){
								qes = document.evtFrm.question[i].value;
								document.evtFrm.selquestion.value = qes;
								chkCheckbox = "Y";
							}
						}
						if (chkCheckbox == "N") {
							alert("객관식 아이템을 선택하여 주세요.");
							document.evtFrm.question[0].focus();
							return false;
						}
					<%}%>
					<%if (per1YN.equals("Y")) { %>
						if (document.evtFrm.per_agr1[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr1[0].focus();
							return false;
						}
					<%}%>
					<%if (per2YN.equals("Y")) { %>
						if (document.evtFrm.per_agr2[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr2[0].focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if (document.evtFrm.per_agr3[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr3[0].focus();
							return false;
						}
					<%}%>
					<%if (nameYN.equals("Y")) { %>
						if ( document.evtFrm.user_name.value == '' ) {
							alert('성명을 확인하세요.');
							document.evtFrm.user_name.focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if(!isNumeric(document.evtFrm.idenNo1) || document.evtFrm.idenNo1.value.length != 6){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo1.value = "";
							document.evtFrm.idenNo1.focus();
						    return false;
						}
						
						if(!isNumeric(document.evtFrm.idenNo2) || document.evtFrm.idenNo2.value.length != 7){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo2.value = "";
							document.evtFrm.idenNo2.focus();
						    return false;
						}
	
						
						if(!idenNoCheck(document.evtFrm.idenNo1.value, document.evtFrm.idenNo2.value)){
							return false;
						}
					<%}%>
					<%if (idYN.equals("Y")) { %>
						if ( document.evtFrm.inputId.value == '' ) {
							alert('아이디를 확인하세요.');
							document.evtFrm.inputId.focus();
							return false;
						}
					<%}%>
					<%if (handphoneYN.equals("Y")) {%>
						if ( document.evtFrm.hand_phone1.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone1.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone2.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone2.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone3.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone3.focus();
							return false;
						}	
					<%}%>
					<%if (emailYN.equals("Y")) { %>
						if ( document.evtFrm.emailid.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailid.focus();
							return false;
						}
	
						if ( document.evtFrm.emailaddr.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailaddr.focus();
							return false;
						}
					<%}%>
					<%if (addressYN.equals("Y")) { %>
						if(document.evtFrm.home_zip_1.value =="" ){
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_1.focus();
							return ;
						} else if (document.evtFrm.home_zip_2.value =="") {
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_2.focus();
							return ;
						}
						 if(document.evtFrm.home_addr_area.value != ""  ||  document.evtFrm.home_addr_dist.value != "" ){
							    if(!cal_byte(document.evtFrm.home_addr_dist.value)){
								    alert("주소 상세주소 입력가능 길이를 초과하였습니다.\r\n상세주소는 한글/숫자 구분 없이 35글자까지만 입력이 가능합니다.");
								    document.evtFrm.home_addr_dist.focus();
									return;
								}
						}
					<%}%>
				<%} else if ("3".equals(vo.getType())) { %>
					<%if (vo.getSquestion().equals("Y")) { %>
						if (document.evtFrm.txtsquestion.value == '' ) {
							alert("주관식 답란을 적어주세요.");
							document.evtFrm.txtsquestion.focus();
							return false;
						}
					<%}%>
					<%if (per1YN.equals("Y")) { %>
						if (document.evtFrm.per_agr1[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr1[0].focus();
							return false;
						}
					<%}%>
					<%if (per2YN.equals("Y")) { %>
						if (document.evtFrm.per_agr2[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr2[0].focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if (document.evtFrm.per_agr3[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr3[0].focus();
							return false;
						}
					<%}%>
					<%if (nameYN.equals("Y")) { %>
						if ( document.evtFrm.user_name.value == '' ) {
							alert('성명을 확인하세요.');
							document.evtFrm.user_name.focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if(!isNumeric(document.evtFrm.idenNo1) || document.evtFrm.idenNo1.value.length != 6){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo1.value = "";
							document.evtFrm.idenNo1.focus();
						    return false;
						}
						
						if(!isNumeric(document.evtFrm.idenNo2) || document.evtFrm.idenNo2.value.length != 7){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo2.value = "";
							document.evtFrm.idenNo2.focus();
						    return false;
						}
		
						
						if(!idenNoCheck(document.evtFrm.idenNo1.value, document.evtFrm.idenNo2.value)){
							return false;
						}
					<%}%>
					<%if (idYN.equals("Y")) { %>
						if ( document.evtFrm.inputId.value == '' ) {
							alert('아이디를 확인하세요.');
							document.evtFrm.inputId.focus();
							return false;
						}
					<%}%>
					<%if (handphoneYN.equals("Y")) {%>
						if ( document.evtFrm.hand_phone1.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone1.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone2.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone2.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone3.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone3.focus();
							return false;
						}	
					<%}%>
					<%if (emailYN.equals("Y")) { %>
						if ( document.evtFrm.emailid.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailid.focus();
							return false;
						}
		
						if ( document.evtFrm.emailaddr.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailaddr.focus();
							return false;
						}
					<%}%>
					<%if (addressYN.equals("Y")) { %>
						if(document.evtFrm.home_zip_1.value =="" ){
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_1.focus();
							return ;
						} else if (document.evtFrm.home_zip_2.value =="") {
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_2.focus();
							return ;
						}
						 if(document.evtFrm.home_addr_area.value != ""  ||  document.evtFrm.home_addr_dist.value != "" ){
							    if(!cal_byte(document.evtFrm.home_addr_dist.value)){
								    alert("주소 상세주소 입력가능 길이를 초과하였습니다.\r\n상세주소는 한글/숫자 구분 없이 35글자까지만 입력이 가능합니다.");
								    document.evtFrm.home_addr_dist.focus();
									return;
								}
						}
					<%}%>
				<%} else if ("4".equals(vo.getType())) { %>
					<%if (Integer.parseInt(vo.getQuestion()) == 1) { %>
					if(document.evtFrm.question.checked){
						document.evtFrm.selquestion.value = "1";
						chkCheckbox = "Y";
					}
					<%} else if (Integer.parseInt(vo.getQuestion()) > 0) { %>
					for(i=0; i<<%=vo.getQuestion()%>; i++){
						if(document.evtFrm.question[i].checked){
							qes = document.evtFrm.question[i].value;
							document.evtFrm.selquestion.value = qes;
							chkCheckbox = "Y";
						}
					}
					if (chkCheckbox == "N") {
						alert("객관식 아이템을 선택하여 주세요.");
						document.evtFrm.question[0].focus();
						return false;
					}
					<%}%>
					<%if (vo.getSquestion().equals("Y")) { %>
						if (document.evtFrm.txtsquestion.value == '' ) {
							alert("주관식 답란을 적어주세요.");
							document.evtFrm.txtsquestion.focus();
							return false;
						}
					<%}%>
					<%if (per1YN.equals("Y")) { %>
						if (document.evtFrm.per_agr1[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr1[0].focus();
							return false;
						}
					<%}%>
					<%if (per2YN.equals("Y")) { %>
						if (document.evtFrm.per_agr2[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr2[0].focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if (document.evtFrm.per_agr3[0].checked) {
						} else {
							alert("약관에 동의하여 주세요.");
							document.evtFrm.per_agr3[0].focus();
							return false;
						}
					<%}%>
					<%if (nameYN.equals("Y")) { %>
						if ( document.evtFrm.user_name.value == '' ) {
							alert('성명을 확인하세요.');
							document.evtFrm.user_name.focus();
							return false;
						}
					<%}%>
					<%if (idenYN.equals("Y")) { %>
						if(!isNumeric(document.evtFrm.idenNo1) || document.evtFrm.idenNo1.value.length != 6){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo1.value = "";
							document.evtFrm.idenNo1.focus();
						    return false;
						}
						
						if(!isNumeric(document.evtFrm.idenNo2) || document.evtFrm.idenNo2.value.length != 7){
							alert("주민번호를 확인하여 주십시오.");
							document.evtFrm.idenNo2.value = "";
							document.evtFrm.idenNo2.focus();
						    return false;
						}
		
						
						if(!idenNoCheck(document.evtFrm.idenNo1.value, document.evtFrm.idenNo2.value)){
							return false;
						}
					<%}%>
					<%if (idYN.equals("Y")) { %>
						if ( document.evtFrm.inputId.value == '' ) {
							alert('아이디를 확인하세요.');
							document.evtFrm.inputId.focus();
							return false;
						}
					<%}%>
					<%if (handphoneYN.equals("Y")) {%>
						if ( document.evtFrm.hand_phone1.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone1.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone2.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone2.focus();
							return false;
						}	
						if ( document.evtFrm.hand_phone3.value == '' ) {
							alert('핸드폰번호를 확인하세요.');
							document.evtFrm.hand_phone3.focus();
							return false;
						}	
					<%}%>
					<%if (emailYN.equals("Y")) { %>
						if ( document.evtFrm.emailid.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailid.focus();
							return false;
						}
		
						if ( document.evtFrm.emailaddr.value == '' ) {
							alert('이메일주소를 확인하세요.');
							document.evtFrm.emailaddr.focus();
							return false;
						}
					<%}%>
					<%if (addressYN.equals("Y")) { %>
						if(document.evtFrm.home_zip_1.value =="" ){
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_1.focus();
							return ;
						} else if (document.evtFrm.home_zip_2.value =="") {
							alert('주소를 확인해주시기 바랍니다.');
							document.evtFrm.home_zip_2.focus();
							return ;
						}
						 if(document.evtFrm.home_addr_area.value != ""  ||  document.evtFrm.home_addr_dist.value != "" ){
							    if(!cal_byte(document.evtFrm.home_addr_dist.value)){
								    alert("주소 상세주소 입력가능 길이를 초과하였습니다.\r\n상세주소는 한글/숫자 구분 없이 35글자까지만 입력이 가능합니다.");
								    document.evtFrm.home_addr_dist.focus();
									return;
								}
						}
					<%}%>
				<%}%>
			
				applyEvent();
				
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		document.evtFrm.target = "applyResultFrame";
		//document.evtFrm.submit();
        document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("이벤트에 정상적으로 응모되었습니다.");
		setTimeout("location.reload()",100);
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		setTimeout("location.reload()",100);
	}

	function clearField(f1,f2,f3){
		mf1=eval("document.evtFrm."+f1);
		mf2=eval("document.evtFrm."+f2);
		mf3=eval("document.evtFrm."+f3);
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

	function idenNoCheck(str_jumin1, str_jumin2){

	    var i3 = 0;
	    for (var i = 0; i < str_jumin1.length; i++){
	        var ch1 = str_jumin1.substring(i, i+1);
	        if (ch1<'0' || ch1>'9'){ 
	            i3=i3+1
	        }
	    }

	    if ((str_jumin1 == '') || ( i3 != 0 )){
	      alert('주민번호를 확인하여 주십시오.');
	      return false;
	    }

	    var i4 = 0;
	    for (var i=0;i<str_jumin2.length;i++){
	        var ch1 = str_jumin2.substring(i, i+1);
	        if (ch1<'0' || ch1>'9'){
	            i4=i4+1
	        }
	    }
	    if ((str_jumin2 == '') || ( i4 != 0 )){
	      alert('주민번호를 확인하여 주십시오.');
	      return false;
	    }

	    if((str_jumin1.length > 7) || (str_jumin2.length > 8)){
	    alert('주민번호를 확인하여 주십시오.');
	        return false;
	    }

	    if ((str_jumin1 == '72') || ( str_jumin2 == '18')){
	        alert('주민번호를 확인하여 주십시오.');
	        return false;
	    }

	    var f1 = str_jumin1.substring(0, 1);
	    var f2 = str_jumin1.substring(1, 2);
	    var f3 = str_jumin1.substring(2, 3);
	    var f4 = str_jumin1.substring(3, 4);
	    var f5 = str_jumin1.substring(4, 5);
	    var f6 = str_jumin1.substring(5, 6);    
	    var hap = f1*2 + f2*3 + f3*4 + f4*5 + f5*6 + f6*7;
	    var l1 = str_jumin2.substring(0, 1);
	    var l2 = str_jumin2.substring(1, 2);
	    var l3 = str_jumin2.substring(2, 3);
	    var l4 = str_jumin2.substring(3, 4);
	    var l5 = str_jumin2.substring(4, 5);
	    var l6 = str_jumin2.substring(5, 6);
	    var l7 = str_jumin2.substring(6, 7);
	    
	    hap = hap + l1*8 + l2*9 + l3*2 + l4*3 + l5*4 + l6*5;
	    hap = hap%11
	    hap = 11-hap
	    hap = hap%10
	    if(hap != l7){
	      alert('주민번호를 확인하여 주십시오.');
	      return false;
	    }
	    var i9=0;

	    return true;
	}

	function cal_byte(tmpStr){
		var tmpStr;
		var temp=0;
		var onechar;
		var tcount;
		tcount = 0;

		temp = tmpStr.length;
		for (k=0;k<temp;k++)
		{
			onechar = tmpStr.charAt(k);
			if (escape(onechar) =='%0D') { } else{ tcount ++; }
		}

		if(tcount>35) {
			return false;
		}
		return true;
	}

	function sel(field)
	{
		var str = field.value;
		document.evtFrm.emailaddr.value = str;
		// 20130411 웹접근성(장차법)  수정
		//if ( str == "")
		//	document.evtFrm.emailaddr.focus();
	}
	
</script>


</head>

<body >
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=setNewEvent" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=vo.getSeq() %>"/>
<input type="hidden" name="home_zip_seq" value="" />
<input type="hidden" name="selquestion" value="" />
<input type="hidden" name="strloginYN" value="<%=vo.getLogin() %>"/>
<input type="hidden" name="strSquestionYN" value="<%=vo.getSquestion() %>"/>
<%if ("1".equals(vo.getType())) { %>
<div class="template_wrap">
    <p><img alt="" src="<%=vo.getTopImage().replaceAll("/wip/hp/hpDocs","") %>"  /></p>
    <div class="event_body"><!-- 120504 추가 -->
    <div class="jui_template">
        <p class="al_center"><a href="#" onClick="go_start();return false;"><img src="/images/et/admin/btn_apply.gif" alt="응모하기" /></a></p>
        
    </div>
    </div>
    <p class="mb40"><img alt="" src="<%=vo.getBottomImage().replaceAll("/wip/hp/hpDocs","") %>"  /> </p>
</div>
<%} else if ("2".equals(vo.getType())) { %>
<div class="template_wrap">
    <p><img alt="" src="<%=vo.getTopImage().replaceAll("/wip/hp/hpDocs","") %>" /></p>
    <div class="event_body"><!-- 120504 추가 -->
    <div class="jui_template">
    
    <%if (Integer.parseInt(vo.getQuestion()) > 0) { %>
        <div class="grey"></div>
        <ul class="imgList clfix">
        	<%for (int i2=1;i2<=Integer.parseInt(vo.getQuestion());i2++) {%>
        		<%if (i2/3==0) {%>
	        		<li class="pdnone">
        		<%} else {%>
					<li>
				<%}%>
	                <p><img src="/upload/newsevent/newevent/<%=vo.getSeq() %>/images/ex<%=i2 %>.jpg" alt="" /></p>
	                <p><label><input type="radio" name="question" value="<%=i2%>" title="question" /></label></p>
            	</li>
        	<%}%>
        </ul>
    <%} %>
<!-- 주관식 시작 -->
        <!-- <fieldset class="fieldset_agree mt10">
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <textarea class="txt" >최대 200자 등록이 가능합니다.</textarea>
            </div></div>          
        </fieldset>-->
<!-- 주관식 끝 -->        

					
<%if (per1YN.equals("Y")) { %>
<%
						String strRead1 = "";
						String strData1 = "";
						boolean fileChk1 = true;
						
						if (vo.getPerInfo().length() > 0) {
							File f1 = new File(vo.getPerInfo().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr = new InputStreamReader(new FileInputStream(f1), "utf-8");
							FileReader fr = new FileReader(f1);
							
							BufferedReader br1 = new BufferedReader(fr);
							
							while( fileChk1 ){
								strRead1 = br1.readLine();
								if(strRead1 == null){
									fileChk1 = false;
									break;
								}
								strData1 += strRead1 + "<br />";
							}
							
							fr.close();
							br1.close();
						} else {
							strData1 = "&lt;&lt;개인정보수집, 이용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
						
%>
         <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>개인정보수집, 이용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                 <%=strData1%>
                </div>
            </div></div>
            <div class="btnr">
                <label for="label_private01"><input type="radio" class="chk" id="label_private01" name="per_agr1" /> <strong>동의</strong></label><label for="label_private02"><input type="radio" class="chk" id="label_private02" name="per_agr1" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (per2YN.equals("Y")) { %>        
<%
						String strRead2 = "";
						String strData2 = "";
						boolean fileChk2 = true;
						
						if (vo.getPerInfo2().length() > 0) {
							File f2 = new File(vo.getPerInfo2().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr2 = new InputStreamReader(new FileInputStream(f2), "utf-8"); 
							FileReader fr2 = new FileReader(f2);
							
							BufferedReader br2 = new BufferedReader(fr2);
							
							while( fileChk2 ){
								strRead2 = br2.readLine();
								if(strRead2 == null){
									fileChk2 = false;
									break;
								}
								strData2 += strRead2 + "<br />";
							}
							
							fr2.close();
							br2.close();
						} else {
							strData2 = "&lt;&lt;제3자 제공 및 활용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
%>
        <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>제3자 제공 및 활용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree"><%=strData2 %></div>
            </div></div>
            
          
            <div class="btnr">
                <label for="label_private03"><input type="radio" class="chk" id="label_private03" name="per_agr2" /><strong> 동의</strong></label>
                <label for="label_private04"><input type="radio" class="chk" id="label_private04" name="per_agr2" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (idenYN.equals("Y")) { %>

        <div class="grey"></div>
        <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                <p >본인은 귀사가 본인의 개인정보를 수집·이용시 본인이 동의한 목적에 따라 개인정보보호법 제24조에 의거 본인의 고유식별정보를 처리하는 것에 동의합니다. (고유식별정보 : 주민등록번호)</p>
                 <div class="btnr01" style="right:10px;">
                <label for="label_agr_private_credit1"><input type="radio" class="rdo01" value="" id="label_agr_private_credit1" name="per_agr3" /><span class="agree_text"><strong>동의함</strong></span></label>
                <label for="label_agr_private_credit2"><input type="radio" class="rdo01" value="" id="label_agr_private_credit2" name="per_agr3" checked="checked" /><span class="agree_text">동의안함</span></label>
            </div>
                </div>
            </div></div>
<%} %>

<%if ((nameYN.equals("Y")) || (idenYN.equals("Y")) || (idYN.equals("Y")) || (handphoneYN.equals("Y")) || (emailYN.equals("Y")) || (addressYN.equals("Y")))  {%>
        <table summary="성명, 주민등록번호, 삼성카드아이디, 휴대전화번호 번호, 이메일, 주소 등 개인정보를 입력하실수 있습니다. " class="mt20 mb40 dtable01">
            <caption>정보 입력</caption>
            <colgroup><col width="20%" /><col width="*" /></colgroup>
            <tbody>
            <%if (nameYN.equals("Y")) { %>
                <tr>
                        <th scope="row"><label for="label_id">성명</label></th>
                        <td class="cell_l"><input type="text" name="user_name" title="성명" maxlength="20" class="txt" value="" id="label_id" /></td>
               </tr>
            <%} %>
                    <!-- //loop -->
            <%if (idenYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_idno">주민등록번호</label></th>
                        <td  class="cell_l"><input type="text" class="txt" name="idenNo1" maxlength="6" value="" title="주민등록번호 앞자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo1.value = '';"/>
                        &nbsp;-&nbsp;
                        <input type="text" class="txt" name="idenNo2" maxlength="7" value="" title="주민등록번호 뒷자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo2.value = '';"/>
                       </td>
                    </tr>
            <%} %>
            <%if (idYN.equals("Y")) { %>
                     <tr>
                        <th scope="row"><label for="label_id2">삼성카드아이디</label></th>
                        <td  class="cell_l"><input type="text" class="txt" value="" name = "inputId" maxlength="25" title="삼성카드아이디" id="label_idlabel_id2" /></td>
                      </tr>
            <%} %>
            <%if (handphoneYN.equals("Y")) {%>
                        <tr>
                        <th scope="row"><label for="label_phone">휴대전화번호 번호</label></th>
	                        <td  class="cell_l">
	                            <span class="input_phone">
	                                <select name="hand_phone1" title="핸드폰 앞자리" id="label_phone" onChange="clearField('hand_phone1','hand_phone2','hand_phone3')">
	                                    <option value = "">선택</option>
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "017">017</option>
										<option value = "018">018</option>
										<option value = "019">019</option>
	                                </select> 
                                    <input type="text" name="hand_phone2" class="txt" size="4" maxlength="4" value="" style="ime-mode:disabled;width:95px;" onKeyPress="checkTypes(this, 'TELNO');" onBlur="checkTypesOnBlur(this,'TELNO')" title="핸드폰번호 가운데자리" id="label_phone02"/>
	                                &nbsp;-&nbsp;
                                    <input type="text" name="hand_phone3" class="txt" size="4" maxlength="4" value="" title="핸드폰번호 뒷자리" style="ime-mode:disabled;width:95px;" onKeyPress="checkTypes(this, 'TELNO');" onBlur="checkTypesOnBlur(this,'TELNO')" id="label_phone03" />
	                            </span>
	                        
	                        </td>
                   		</tr>
             <%} %>
             <%if (emailYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_email">이메일</label></th>
                        <td  class="cell_l">
                            <span class="input_email">
                                <input type="text" name="emailid" class="txt" value="" maxlength="48" title="이메일명"  id="label_email" style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')"/>
                                &nbsp;@&nbsp;
                                <input type="text" name="emailaddr" maxlength="40" class="txt" value="" title="이메일공급자 직접입력"  id="label_email02" style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')" />
                                <select name="selemail"  title="이메일공급자선택" onChange="sel(this)" id="label_email03">
                                	<option selected="selected" value="">선택하세요</option>
									<option value="dreamwiz.com">드림위즈</option>
									<option value="empal.com">엠팔</option>
									<option value="hanmail.net">한메일(다음)</option>
									<option value="hotmail.com">hotmail</option>
									<option value="korea.com">코리아</option>
									<option value="lycos.co.kr">라이코스</option>
									<option value="nate.com">네이트</option>
									<option value="naver.com">네이버</option>
									<option value="netian.com">네띠앙</option>
									<option value="orgio.net">오르지오</option>
									<option value="paran.com">파란</option>
									<!--option value="yahoo.co.kr">야후</option-->
									<option value="chollian.net">천리안</option>
									<option value="freechal.com">프리챌</option>
									<option value="kebi.com">깨비</option>
									<option value="unitel.co.kr">유니텔</option>
									<option value="weppy.com">웨피</option>
									<option value="samsung.com">삼성닷컴</option>
	           						<option value="">직접입력</option>
                                </select>
                                </span>
                        </td>
                    </tr>
              <%} %>
              <%if (addressYN.equals("Y")) { %>
                  <tr>
                        <th scope="row" class="lineno"><label for="label_address">주소</label></th>
                        <td  class="cell_l lineno">
                            <p><input type="text" name="home_zip_1" maxlength="3"  class="txt" value="" title="우편번호 앞자리" id="label_address01" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);" />
                            &nbsp;-&nbsp;
                            <input type="text" name="home_zip_2" maxlength="3" class="txt" value="" title="우편번호 뒷자리" id="label_address02" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/>
                            <a href="javascript:searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);">
                            <img src="/images/et/admin/btn_zipcode.gif"  alt="우편번호 찾기" />
                            </a>
                            </p>
                           <p style="padding:3px 0">
                           <input type="text" class="txt" name="home_addr_area" readonly value="" title="상세주소1"  id="label_address04" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                           <p><input type="text" class="txt" name="home_addr_dist" readonly value="" title="상세주소2"  id="label_address05" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                        </td>
                    </tr>
               <%} %>
            </tbody>
        </table>
<%} %>        
        <p class="al_center"><a href="#" onClick="go_start();return false;"><img src="/images/et/admin/btn_apply.gif" alt="응모하기" /></a></p>
        
    </div>
    </div>
    <p class="mb40"><img src="<%=vo.getBottomImage().replaceAll("/wip/hp/hpDocs","") %>" alt="" /> </p>
</div>
<%} else if ("3".equals(vo.getType())) { %>
<div class="template_wrap">
    <p><img src="<%=vo.getTopImage().replaceAll("/wip/hp/hpDocs","") %>" alt="" /></p>
    <div class="event_body"><!-- 120504 추가 -->
    <div class="jui_template">
        <!-- 객관식 삭제 -->
<!-- 주관식 시작 -->
<%if (vo.getSquestion().equals("Y")) { %>
		<div class="grey"></div>
        <fieldset class="fieldset_agree mt10">
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <textarea class="txt" name="txtsquestion" maxlength="400" rows="5" cols="10" title="주관식 답변 입력"></textarea>
            </div></div>          
        </fieldset>
<%} %>
<!-- 주관식 끝 -->        

					
<%if (per1YN.equals("Y")) { %>
<%
						String strRead1 = "";
						String strData1 = "";
						boolean fileChk1 = true;
						
						if (vo.getPerInfo().length() > 0) {
							File f1 = new File(vo.getPerInfo().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr = new InputStreamReader(new FileInputStream(f1), "utf-8");
							FileReader fr = new FileReader(f1);
							
							BufferedReader br1 = new BufferedReader(fr);
							
							while( fileChk1 ){
								strRead1 = br1.readLine();
								if(strRead1 == null){
									fileChk1 = false;
									break;
								}
								strData1 += strRead1 + "<br />";
							}
							
							fr.close();
							br1.close();
						} else {
							strData1 = "&lt;&lt;개인정보수집, 이용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
						
%>
         <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>개인정보수집, 이용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                 <%=strData1%>
                </div>
            </div></div>
            <div class="btnr">
                <label for="label_private01"><input type="radio" class="chk" id="label_private01" name="per_agr1" /> <strong>동의</strong></label><label for="label_private02"><input type="radio" class="chk" id="label_private02" name="per_agr1" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (per2YN.equals("Y")) { %>        
<%
						String strRead2 = "";
						String strData2 = "";
						boolean fileChk2 = true;
						
						if (vo.getPerInfo2().length() > 0) {
							File f2 = new File(vo.getPerInfo2().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr2 = new InputStreamReader(new FileInputStream(f2), "utf-8"); 
							FileReader fr2 = new FileReader(f2);
							
							BufferedReader br2 = new BufferedReader(fr2);
							
							while( fileChk2 ){
								strRead2 = br2.readLine();
								if(strRead2 == null){
									fileChk2 = false;
									break;
								}
								strData2 += strRead2 + "<br />";
							}
							
							fr2.close();
							br2.close();
						} else {
							strData2 = "&lt;&lt;제3자 제공 및 활용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
%>
        <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>제3자 제공 및 활용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree"><%=strData2 %></div>
            </div></div>
            
          
            <div class="btnr">
                <label for="label_private03"><input type="radio" class="chk" id="label_private03" name="per_agr2" /><strong> 동의</strong></label>
                <label for="label_private04"><input type="radio" class="chk" id="label_private04" name="per_agr2" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (idenYN.equals("Y")) { %>

        <div class="grey"></div>
        <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                <p >본인은 귀사가 본인의 개인정보를 수집·이용시 본인이 동의한 목적에 따라 개인정보보호법 제24조에 의거 본인의 고유식별정보를 처리하는 것에 동의합니다. (고유식별정보 : 주민등록번호)</p>
                 <div class="btnr01" style="right:10px;">
                <label for="label_agr_private_credit1"><input type="radio" class="rdo01" value="" id="label_agr_private_credit1" name="per_agr3" /><span class="agree_text"><strong>동의함</strong></span></label>
                <label for="label_agr_private_credit2"><input type="radio" class="rdo01" value="" id="label_agr_private_credit2" name="per_agr3" checked="checked" /><span class="agree_text">동의안함</span></label>
            </div>
                </div>
            </div></div>
<%} %>

<%if ((nameYN.equals("Y")) || (idenYN.equals("Y")) || (idYN.equals("Y")) || (handphoneYN.equals("Y")) || (emailYN.equals("Y")) || (addressYN.equals("Y")))  {%>
        <table summary="성명, 주민등록번호, 삼성카드아이디, 휴대전화번호 번호, 이메일, 주소 등 개인정보를 입력하실수 있습니다." class="mt20 mb40 dtable01">
            <caption>정보입력</caption>
            <colgroup><col width="20%" /><col width="*" /></colgroup>
            <tbody>
            <%if (nameYN.equals("Y")) { %>
                <tr>
                        <th scope="row"><label for="label_id">성명</label></th>
                        <td class="cell_l"><input type="text" name="user_name" title="성명" maxlength="20" class="txt" value="" id="label_id" /></td>
               </tr>
            <%} %>
                    <!-- //loop -->
            <%if (idenYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_idno">주민등록번호</label></th>
                        <td  class="cell_l"><input type="text" class="txt" name="idenNo1" maxlength="6" value="" title="주민등록번호 앞자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo1.value = '';"/>
                        &nbsp;-&nbsp;
                        <input type="text" class="txt" name="idenNo2" maxlength="7" value="" title="주민등록번호 뒷자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo2.value = '';"/>
                       </td>
                    </tr>
            <%} %>
            <%if (idYN.equals("Y")) { %>
                     <tr>
                        <th scope="row"><label for="label_id2">삼성카드아이디</label></th>
                        <td  class="cell_l"><input type="text" class="txt" value="" name = "inputId" maxlength="25" title="삼성카드아이디" id="label_idlabel_id2" /></td>
                      </tr>
            <%} %>
            <%if (handphoneYN.equals("Y")) {%>
                        <tr>
                        <th scope="row"><label for="label_phone">휴대전화번호 번호</label></th>
	                        <td  class="cell_l">
	                            <span class="input_phone">
	                                <select name="hand_phone1" title="핸드폰 앞자리" id="label_phone" onChange="clearField('hand_phone1','hand_phone2','hand_phone3')">
	                                    <option value = "">선택</option>
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "017">017</option>
										<option value = "018">018</option>
										<option value = "019">019</option>
	                                </select> 
                                    <input type="text" name="hand_phone2" class="txt" size="4" maxlength="4" value="" style="ime-mode:disabled" onkeypress="checkTypes(this, 'TELNO');" onblur="checkTypesOnBlur(this,'TELNO')" title="핸드폰번호 가운데자리" id="label_phone02" style="width:95px;"/>
	                                &nbsp;-&nbsp;
                                    <input type="text" name="hand_phone3" class="txt" size="4" maxlength="4" value="" title="핸드폰번호 뒷자리" style="ime-mode:disabled" onkeypress="checkTypes(this, 'TELNO');" onblur="checkTypesOnBlur(this,'TELNO')" id="label_phone03" style="width:95px;" />
	                            </span>
	                        
	                        </td>
                   		</tr>
             <%} %>
             <%if (emailYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_email">이메일</label></th>
                        <td  class="cell_l">
                            <span class="input_email">
                                <input type="text" name="emailid" class="txt" value="" maxlength="48" title="이메일명"  id="label_email" style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')"/>
                                &nbsp;@&nbsp;
                                <input type="text" name="emailaddr" maxlength="40" class="txt" value="" title="이메일공급자 직접입력"  id="label_email02 "  style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')" />
                                <select name="selemail"  title="이메일공급자선택" onChange="sel(this)" id="label_email03">
                                	<option selected="selected" value="">선택하세요</option>
									<option value="dreamwiz.com">드림위즈</option>
									<option value="empal.com">엠팔</option>
									<option value="hanmail.net">한메일(다음)</option>
									<option value="hotmail.com">hotmail</option>
									<option value="korea.com">코리아</option>
									<option value="lycos.co.kr">라이코스</option>
									<option value="nate.com">네이트</option>
									<option value="naver.com">네이버</option>
									<option value="netian.com">네띠앙</option>
									<option value="orgio.net">오르지오</option>
									<option value="paran.com">파란</option>
									<!--option value="yahoo.co.kr">야후</option-->
									<option value="chollian.net">천리안</option>
									<option value="freechal.com">프리챌</option>
									<option value="kebi.com">깨비</option>
									<option value="unitel.co.kr">유니텔</option>
									<option value="weppy.com">웨피</option>
									<option value="samsung.com">삼성닷컴</option>
	           						<option value="">직접입력</option>
                                </select>
                                </span>
                        </td>
                    </tr>
              <%} %>
              <%if (addressYN.equals("Y")) { %>
                  <tr>
                        <th scope="row" class="lineno"><label for="label_address">주소</label></th>
                        <td  class="cell_l lineno">
                            <p><input type="text" name="home_zip_1" maxlength="3"  class="txt" value="" title="우편번호 앞자리" id="label_address01" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);" />
                            &nbsp;-&nbsp;
                            <input type="text" name="home_zip_2" maxlength="3" class="txt" value="" title="우편번호 뒷자리" id="label_address02" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);" />
                            <a href="javascript:searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);">
                            <img src="/images/et/admin/btn_zipcode.gif"  alt="우편번호 찾기" />
                            </a>
                            </p>
                           <p style="padding:3px 0">
                           <input type="text" class="txt" name="home_addr_area" readonly value="" title="상세주소1"  id="label_address04" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                           <p><input type="text" class="txt" name="home_addr_dist" readonly value="" title="상세주소2"  id="label_address05" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                        </td>
                    </tr>
               <%} %>
            </tbody>
        </table>
<%} %>        
<br/>
        <p class="al_center"><a href="#" onClick="go_start();return false;" ><img src="/images/et/admin/btn_apply.gif" alt="응모하기" /></a></p>
        
    </div>
    </div>
    <p class="mb40"><img src="<%=vo.getBottomImage().replaceAll("/wip/hp/hpDocs","") %>" alt="" /> </p>
</div>
<%} else if ("4".equals(vo.getType())) { %>

<div class="template_wrap">
    <p><img src="<%=vo.getTopImage().replaceAll("/wip/hp/hpDocs","") %>" alt="" /></p>
    <div class="event_body"><!-- 120504 추가 -->
    <div class="jui_template">
        <div class="grey"></div>
        <%if (Integer.parseInt(vo.getQuestion()) > 0) { %>
        <ul class="imgList clfix">
        	<%for (int i2=1;i2<=Integer.parseInt(vo.getQuestion());i2++) {%>
        		<%if (i2/3==0) {%>
	        		<li class="pdnone">
        		<%} else {%>
					<li>
				<%}%>
	                <p><img src="/upload/newsevent/newevent/<%=vo.getSeq() %>/images/ex<%=i2 %>.jpg" alt="" /></p>
	                <p><label><input type="radio" name="question" value="<%=i2%>" title="question" /></label></p>
            	</li>
        	<%}%>
        </ul>
        <%} %>
<!-- 주관식 시작 -->
<%if (vo.getSquestion().equals("Y")) { %>
        <fieldset class="fieldset_agree mt10">
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <textarea class="txt" name="txtsquestion" maxlength="400" rows="5" cols="10" title="주관식 답변 입력"></textarea>
            </div></div>          
        </fieldset>
<%} %>
<!-- 주관식 끝 -->        
					
<%if (per1YN.equals("Y")) { %>
<%
						String strRead1 = "";
						String strData1 = "";
						boolean fileChk1 = true;
						
						if (vo.getPerInfo().length() > 0) {
							File f1 = new File(vo.getPerInfo().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr = new InputStreamReader(new FileInputStream(f1), "utf-8");
							FileReader fr = new FileReader(f1);
							
							BufferedReader br1 = new BufferedReader(fr);
							
							while( fileChk1 ){
								strRead1 = br1.readLine();
								if(strRead1 == null){
									fileChk1 = false;
									break;
								}
								strData1 += strRead1 + "<br />";
							}
							
							fr.close();
							br1.close();
						} else {
							strData1 = "&lt;&lt;개인정보수집, 이용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
						
%>
         <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>개인정보수집, 이용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                 <%=strData1%>
                </div>
            </div></div>
            <div class="btnr">
                <label for="label_private01"><input type="radio" class="chk" id="label_private01" name="per_agr1" /> <strong>동의</strong></label><label for="label_private02"><input type="radio" class="chk" id="label_private02" name="per_agr1" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (per2YN.equals("Y")) { %>        
<%
						String strRead2 = "";
						String strData2 = "";
						boolean fileChk2 = true;
						
						if (vo.getPerInfo2().length() > 0) {
							File f2 = new File(vo.getPerInfo2().replaceAll("hpDocs","wasApp"));
							//InputStreamReader isr2 = new InputStreamReader(new FileInputStream(f2), "utf-8"); 
							FileReader fr2 = new FileReader(f2);
							
							BufferedReader br2 = new BufferedReader(fr2);
							
							while( fileChk2 ){
								strRead2 = br2.readLine();
								if(strRead2 == null){
									fileChk2 = false;
									break;
								}
								strData2 += strRead2 + "<br />";
							}
							
							fr2.close();
							br2.close();
						} else {
							strData2 = "&lt;&lt;제3자 제공 및 활용동의서 안내&gt;&gt; 약관 내용이 존재하지 않습니다. 어드민에서 약관 내용을 확인하여 주세요.";
						}
%>
        <div class="grey"></div>
         <fieldset class="fieldset_agree">
                <h3>제3자 제공 및 활용동의서 안내</h3>
            <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree"><%=strData2 %></div>
            </div></div>
            
          
            <div class="btnr">
                <label for="label_private03"><input type="radio" class="chk" id="label_private03" name="per_agr2" /><strong> 동의</strong></label>
                <label for="label_private04"><input type="radio" class="chk" id="label_private04" name="per_agr2" checked="checked" /> 동의안함</label>
            </div>
        </fieldset>
<%} %>
<%if (idenYN.equals("Y")) { %>

        <div class="grey"></div>
        <div class="box_white w640"><p class="box_white flag_tr"></p><p class="box_white flag_bl"></p><div class="box_white_btm">
                <div class="agree h_agree">
                <p >본인은 귀사가 본인의 개인정보를 수집&middot;이용시 본인이 동의한 목적에 따라 개인정보보호법 제24조에 의거 본인의 고유식별정보를 처리하는 것에 동의합니다. (고유식별정보 : 주민등록번호)</p>
                 <div class="btnr01" style="right:10px;">
                <label for="label_agr_private_credit1"><input type="radio" class="rdo01" value="" id="label_agr_private_credit1" name="per_agr3" /><span class="agree_text"><strong>동의함</strong></span></label>
                <label for="label_agr_private_credit2"><input type="radio" class="rdo01" value="" id="label_agr_private_credit2" name="per_agr3" checked="checked" /><span class="agree_text">동의안함</span></label>
            </div>
                </div>
            </div></div>
<%} %>

<%if ((nameYN.equals("Y")) || (idenYN.equals("Y")) || (idYN.equals("Y")) || (handphoneYN.equals("Y")) || (emailYN.equals("Y")) || (addressYN.equals("Y")))  {%>
        <table summary="성명, 주민등록번호, 삼성카드아이디, 휴대전화번호 번호, 이메일, 주소 등 개인정보를 입력하실수 있습니다." class="mt20 mb40 dtable01">
            <caption>정보입력</caption>
            <colgroup><col width="20%" /><col width="*" /></colgroup>
            <tbody>
            <%if (nameYN.equals("Y")) { %>
                <tr>
                        <th scope="row"><label for="label_id">성명</label></th>
                        <td class="cell_l"><input type="text" name="user_name" title="성명" maxlength="20" class="txt" value="" id="label_id" /></td>
               </tr>
            <%} %>
                    <!-- //loop -->
            <%if (idenYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_idno">주민등록번호</label></th>
                        <td  class="cell_l"><input type="text" class="txt" name="idenNo1" maxlength="6" value="" title="주민등록번호 앞자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo1.value = '';"/>
                        &nbsp;-&nbsp;
                        <input type="text" class="txt" name="idenNo2" maxlength="7" value="" title="주민등록번호 뒷자리" id="label_idno" onKeyPress="checkTypes(this, 'NUMB');" onBlur="checkTypesOnBlur(this, 'NUMB');" style="ime-mode:disabled" onClick="document.evtFrm.idenNo2.value = '';"/>
                       </td>
                    </tr>
            <%} %>
            <%if (idYN.equals("Y")) { %>
                     <tr>
                        <th scope="row"><label for="label_id2">삼성카드아이디</label></th>
                        <td  class="cell_l"><input type="text" class="txt" value="" name = "inputId" maxlength="25" title="삼성카드아이디" id="label_idlabel_id2" /></td>
                      </tr>
            <%} %>
            <%if (handphoneYN.equals("Y")) {%>
                        <tr>
                        <th scope="row"><label for="label_phone">휴대전화번호 번호</label></th>
	                        <td  class="cell_l">
	                            <span class="input_phone">
	                                <select name="hand_phone1" title="핸드폰 앞자리" id="label_phone" onChange="clearField('hand_phone1','hand_phone2','hand_phone3')">
	                                    <option value = "">선택</option>
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "017">017</option>
										<option value = "018">018</option>
										<option value = "019">019</option>
	                                </select> 
                                    <input type="text" name="hand_phone2" class="txt" size="4" maxlength="4" value="" style="width:95px;ime-mode:disabled" onKeyPress="checkTypes(this, 'TELNO');" onBlur="checkTypesOnBlur(this,'TELNO')" title="핸드폰번호 가운데자리" id="label_phone02" />
	                                &nbsp;-&nbsp;
                                    <input type="text" name="hand_phone3" class="txt" size="4" maxlength="4" value="" title="핸드폰번호 뒷자리" style="width:95px;ime-mode:disabled" onKeyPress="checkTypes(this, 'TELNO');" onBlur="checkTypesOnBlur(this,'TELNO')" id="label_phone03" />
	                            </span>
	                        
	                        </td>
                   		</tr>
             <%} %>
             <%if (emailYN.equals("Y")) { %>
                    <tr>
                        <th scope="row"><label for="label_email">이메일</label></th>
                        <td  class="cell_l">
                            <span class="input_email">
                                <input type="text" name="emailid" class="txt" value="" maxlength="48" title="이메일명"  id="label_email"  style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')"/>
                                &nbsp;@&nbsp;
                                <input type="text" name="emailaddr" maxlength="40" class="txt" value="" title="이메일공급자 직접입력"  id="label_email02 "  style="width:95px;ime-mode:disabled" onKeyPress="checkTypes2(this, 'EMAIL');" onBlur="checkTypesOnBlur2(this,'EMAIL')" />
                                <select name="selemail"  title="이메일공급자선택" onChange="sel(this)" id="label_email03">
                                	<option selected="selected" value="">선택하세요</option>
									<option value="dreamwiz.com">드림위즈</option>
									<option value="empal.com">엠팔</option>
									<option value="hanmail.net">한메일(다음)</option>
									<option value="hotmail.com">hotmail</option>
									<option value="korea.com">코리아</option>
									<option value="lycos.co.kr">라이코스</option>
									<option value="nate.com">네이트</option>
									<option value="naver.com">네이버</option>
									<option value="netian.com">네띠앙</option>
									<option value="orgio.net">오르지오</option>
									<option value="paran.com">파란</option>
									<!--option value="yahoo.co.kr">야후</option-->
									<option value="chollian.net">천리안</option>
									<option value="freechal.com">프리챌</option>
									<option value="kebi.com">깨비</option>
									<option value="unitel.co.kr">유니텔</option>
									<option value="weppy.com">웨피</option>
									<option value="samsung.com">삼성닷컴</option>
	           						<option value="">직접입력</option>
                                </select>
                                </span>
                        </td>
                    </tr>
              <%} %>
              <%if (addressYN.equals("Y")) { %>
                  <tr>
                        <th scope="row" class="lineno"><label for="label_address01">주소</label></th>
                        <td  class="cell_l lineno">
                            <p><input type="text" name="home_zip_1" maxlength="3"  class="txt" value="" title="우편번호 앞자리" id="label_address01" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/>
                            &nbsp;-&nbsp;
                            <input type="text" name="home_zip_2" maxlength="3" class="txt" value="" title="우편번호 뒷자리" id="label_address02" style="width:95px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);" />
                            <a href="javascript:searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);">
                            <img src="/images/et/admin/btn_zipcode.gif"  alt="우편번호 찾기" />
                            </a>
                            </p>
                           <p style="padding:3px 0">
                           <input type="text" class="txt" name="home_addr_area" readonly value="" title="상세주소1"  id="label_address04" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                           <p><input type="text" class="txt" name="home_addr_dist" readonly value="" title="상세주소2"  id="label_address05" style="width:300px;" onClick="searchZip(evtFrm.home_zip_1, evtFrm.home_zip_2, evtFrm.home_zip_seq, evtFrm.home_addr_area, evtFrm.home_addr_dist);"/></p>
                        </td>
                    </tr>
               <%} %>
            </tbody>
        </table>
<%} %>        
        <p class="al_center"><a href="#" onClick="go_start();return false;"><img src="/images/et/admin/btn_apply.gif" alt="응모하기" /></a></p>
        
    </div>
    </div>
    <p class="mb40"><img src="<%=vo.getBottomImage().replaceAll("/wip/hp/hpDocs","") %>" alt="" /> </p>
</div>
<%} %>


<%} %>
<%} else {%>
<script language="javascript" type="text/javascript">
alert("시스템이 오류가 발생하였습니다.\n\n이벤트 번호를 다시 확인하여 주세요.");
</script>
<%} %>
</form>
<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>
</body>

</html>

