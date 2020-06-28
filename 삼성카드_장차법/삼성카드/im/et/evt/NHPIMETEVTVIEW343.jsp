<%
/*
 * Project Name: 삼성카드 웹 이노베이션 프로젝트
 * File Name: NHPIMETEVTVIEW343.jsp (애니세이브 이벤트)
 * Author: 인투데이타시스템 이중건
 * Created on 2011. 2. 16.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<%

	String isResult		= (String)request.getAttribute("isResult");		// 이벤트 신청 결과 페이지 여부
	String loginYN		= (String)request.getAttribute("loginYN");
	String eventIngYN	= (String)request.getAttribute("eventIngYN");
	String resultMsg	= (String)request.getAttribute("resultMsg");
	String isAlreadyReg	= (String)request.getAttribute("isAlreadyReg");

%>


<title>애니세이브 할부전환 서비스 이벤트 - 삼성카드</title>
<style type="text/css">
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}

img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}

input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
input.txt	 {height:14px; width:250px; padding:3px 4px 0; border:1px solid #CCC; color:#333; font:normal 11px "돋움"}
input.chk, input.rdo	{width:13px; height:13px; margin:2px}
html:first-child	input.chk, input.rdo	{display:inline-block}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}

.pop_l_position	{position:absolute; left:6%; _left:480px; top:233px; _top:333px; z-index:600} /* position:fixed; _ */
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #245FB3; background:white; z-index:511}
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:29px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap640	 .pop_tit	{margin:45px 39px 24px 39px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap640	.pop_l_content	.btnc	{width:100%; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn	{cursor:pointer; vertical-align:middle}
.mt25	{margin-top:25px}
.t_desc	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px; margin-top:10px; margin-left:10px}
.t_black	 {color:#333; font-size:11px; font-family:"돋움"}

table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.dtable02	{border-collapse:separate; *border-collapse:collapse; border-top:1px solid #f2f2f2}
.dtable02	th	{padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02	td	{padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02	th	p, .dtable02	th	label	{color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02	th	p,	.dtable02	td	p, .dtable02	td	ul, .dtable02	th	label	{padding-left:10px}
</style>



<script type='text/javascript' src="/js/jquery-1.3.2.min.js"></script>

<script language="javascript" type="text/javascript">

<%	if(isResult.equals("Y")) {
		if(resultMsg != null && resultMsg.length() > 0) {	%>
			var resultMsg = "<%=resultMsg %>";
			if(resultMsg == "이벤트 응모가 완료되었습니다.") window.parent.isAlreadyReg = "Y";
			else window.parent.isAlreadyReg = "N";
			alert(resultMsg);
			
<%		}
	} else {	%>

		$(function(){
			$("#id_layer04").hide();
			setDay('leaveDay', '02');
			setDay('entryDay', '02');
		});

		var isAlreadyReg = "<%=isAlreadyReg%>";

		function showRegForm() {
		<%	if(eventIngYN.equals("")) {
				if(loginYN.equals("Y")) {	%>
					if(isAlreadyReg == "Y") {
						alert('이미 응모 하셨습니다.');
					} else {
						$("#id_layer04").fadeIn();
						/*
						$("#id_layer04").fadeIn().append("<object id='IMSI_NHPIMETEVTVIEW343' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='0' height='0' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'><param name='movie' value='' /></object>");
						$("#IMSI_NHPIMETEVTVIEW343").focus();
						*/
					}
		<%		} else {	%>
					parent.eventLogin('11316');
		<%		}
			} else if(eventIngYN.equals("before")) {	%>
				alert('이벤트 응모는 2011년 2월 22일부터 가능합니다.');
		<%	} else if(eventIngYN.equals("after")) {		%>
				alert('이벤트가 종료되었습니다');
		<%	}	%>
		}

		function hideRegForm() {
			$("#id_layer04").hide();
		}

		function changeChkBox() {
			if($("#lstDutyFree > :checkbox:checked").size() == 2)
				$("#lstDutyFree > :checkbox:not(:checked)").attr("disabled", true);
			else
				$("#lstDutyFree > :checkbox:not(:checked)").attr("disabled", false);
		}

		function setDay(_target, _val) {
			var optvalue = "";
			var lastDay = 0;

			if(_val == "02") lastDay = 28;
			else if(_val == "03") lastDay = 31;
			else if(_val == "04") lastDay = 30;
			
			document.all[_target].length = 0;
			
			for(var i=1; i<=lastDay; i++)
			{
				if(i < 10) optvalue = "0" + i;
				else optvalue = "" + i;
				
				document.all[_target].options.add(new Option(i + "일", optvalue));
			}
		}
		
		function applyEvent() {
		<%	if(eventIngYN.equals("")) {
				if(loginYN.equals("Y")) {	%>
					evtFrm.item03.value = "2011" + evtFrm.leaveMonth.value + evtFrm.leaveDay.value;		// 출국일자
					evtFrm.item04.value = "2011" + evtFrm.entryMonth.value + evtFrm.entryDay.value;		// 입국일자
				
					if($("#lstDutyFree > :checkbox:checked").size() == 0)
					{
						alert("선호 면세점을 선택해 주세요. 2개까지 선택이 가능합니다.");
						return;
					}
					else if(parseInt(evtFrm.item03.value) > parseInt(evtFrm.item04.value))
					{
						alert("입국일자를 확인하세요.");
						return;
					}
					else if(evtFrm.item05.value == "")
					{
						alert("대상국가를 입력해 주세요.");
						return;
					}

					// 필드 초기화
					evtFrm.item01.value = "";
					evtFrm.item02.value = "";

					evtFrm.item01.value = $("#lstDutyFree > :checkbox:checked:first").val();
					if($("#lstDutyFree > :checkbox:checked").size() == 2) evtFrm.item02.value = $("#lstDutyFree > :checkbox:checked:eq(1)").val();
					
					evtFrm.target = "applyResultFrame";
                    document.evtFrm.submit();
					//alert(evtFrm.item01.value + "\n" + evtFrm.item02.value + "\n" + evtFrm.item03.value + "\n" + evtFrm.item04.value + "\n" + evtFrm.item05.value);
		<%		} else {	%>
					parent.eventLogin('11316');
		<%		}
			} else if(eventIngYN.equals("before")) {	%>
				alert('이벤트 응모는 2011년 2월 22일부터 가능합니다.');
		<%	} else if(eventIngYN.equals("after")) {		%>
				alert('이벤트가 종료되었습니다');
		<%	}	%>

			$("#id_layer04").hide();
		}
		
		function postponePop() {
			setCookie("ANYSAVE_201102", "Y", 1);
			window.close();
		}
	
		function setCookie(name, value, expiredays) {
		    var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + expiredays);
		    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		
<%	}	%>
	
	</script>
</head>

<body>

<%	if(isResult.equals("N")) {	%>

<img src="/images/et/anysave_110216.jpg" width="728" height="1030" border="0" usemap="#anysave" alt="애니세이브, 할부전환 서비스 - 해외쇼핑 삼성카드가 부담을 확!줄여 드립니다. 행운하나! 혜택둘! EVENT" />
<map name="anysave" id="anysave">
  <area shape="rect" coords="384,527,514,546" href="javascript:parent.goTabPage('NHPIMMHANY001');" alt="애니세이브 자세히보기">
  <area shape="rect" coords="520,526,675,548" href="javascript:parent.goTabPage('NHPIMMHSCA005');" alt="할부전환 서비스 자세히보기">
  <area shape="rect" coords="251,581,478,633" id="NHPIMETEVTVIEW343_L01" href="javascript:showRegForm();fnSetReturnFocusId('NHPIMETEVTVIEW343_L01','id_layer04');" alt="응모하기">
</map>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=applyAnysaveEvent" method="post">
	<input type="hidden" name="item01" value="" />
	<input type="hidden" name="item02" value="" />
	<input type="hidden" name="item03" value="" />
	<input type="hidden" name="item04" value="" />
	
	<!-- 신청양식 레이어 시작 -->
	<div id="id_layer04" class="pop_l_position">
		<div class="pop_l_wrap pop_l_wrap640"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onClick="hideRegForm();closeLayerPopup();" value="레이어닫기" title="응모하기 레이어 닫기" />
			<p class="pop_tit"><img src="/images/et/pop_tit_event.gif" alt="이벤트 응모하기" /></p>
			<div class="pop_l_content">
				<table class="dtable02" width="550" summary="선호 면세점, 출국일자, 입국일자, 대상국가 등 이벤트 신청 정보를 입력하실 수 있습니다.">
                	<caption>이벤트 신청 정보 입력</caption>
					<colgroup><col width="25%" /><col width="75%" /></colgroup>
					<tbody>
						<tr>
							<th><p>선호 면세점</p></th>
							<td><p id="lstDutyFree">
								<input type="checkbox" value="신라면세점" title="신라면세점" onClick="changeChkBox()" class="" /> 신라면세점
								<input type="checkbox" value="롯데면세점" title="롯데면세점" onClick="changeChkBox()" class="" /> 롯데면세점
								<input type="checkbox" value="동화면세점" title="동화면세점" onClick="changeChkBox()" class="" /> 동화면세점
								<input type="checkbox" value="워커힐면세점" title="워커힐면세점" onClick="changeChkBox()" class="" /> 워커힐면세점<br />
								<input type="checkbox" value="파라다이스 면세점" title="파라다이스 면세점" onClick="changeChkBox()" class="" /> 파라다이스 면세점
							</p></td>
						</tr>
						<tr>
							<th><p>출국일자</p></th>
							<td><p>
								<select title="출국 년">
									<option>2011년</option>
								</select>
								<select name="leaveMonth" id="leaveMonth" title="출국 월" onChange="setDay('leaveDay', this.value)">
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
								</select>
								<select name="leaveDay" title="출국 일" id="leaveDay"></select>
								</p></td>
						</tr>
						<tr>
							<th><p>입국일자</p></th>
							<td><p>
								<select title="출국 년">
									<option>2011년</option>
								</select>
								<select name="entryMonth" title="출국 월" id="entryMonth" onChange="setDay('entryDay', this.value)">
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
								</select>
								<select name="entryDay" title="출국 일" id="entryDay"></select>
								</p></td>
						</tr>
						<tr>
							<th><p>대상국가</p></th>
							<td><p><input type="text" name="item05" title="대상국가" class="txt" maxlength="25" /></p></td>
						</tr>
					</tbody>
				</table>
				<p class="t_desc">선호 면세점은 <span class="t_black">2개</span>까지 선택 가능합니다.</p>
                <p class="btnc mt25"><a href="javascript:applyEvent();"><img src="/images/et/btn_confirm.gif" alt="확인" /></a></p>
			</div>
		</div>
	</div>
	<!-- 신청양식 레이어 종료 -->
</form>
<form id="form" name="form" method="post" action="">
	<input type="hidden" name="text" />
</form>

<%	}	%>

<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>



</body>

</html>

