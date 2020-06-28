<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 위키드 무료 초대 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
	
	String user_name = (String)request.getAttribute("memname");
%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
#lay_1{display:none; position:absolute; z-index:2; left:131px; top:800px; }

/*120627 추가*/
table	{width:100%; border-collapse:collapse; border-spacing:0}
table	caption	{position:absolute; height:0; font-size:0; line-height:0; text-indent:-5000em; visibility:hidden; overflow:hidden}
th, td	 {word-break: break-all}
.btn_input	{border:0; text-indent:-5000px; cursor:pointer; overflow:hidden}
input, select, textarea	 {margin:0; padding:0; vertical-align:middle; outline:0 none; resize:none}
.t_no	 {font-size:11px; font-family:"돋움"; letter-spacing:0 !important}
.none	{position:absolute; top:-5000px; left:-5000px; height:0; font-size:0; line-height:0; visibility:hidden; overflow:hidden}
a.btn_link:link, a.btn_link:visited {color: #5a96c8; text-decoration: underline;}
a.btn_link:hover, a.btn_link:active {color: #5a96c8; text-decoration: underline;}
.t_desc04	{color:#999; font-size:11px; font-family:"돋움"; letter-spacing:-1px; line-height:16px}
.mt5	{margin-top:5px}
.dtable02   {border-collapse:separate; *border-collapse:collapse; border-top:1px solid #CCC; border-bottom:1px solid #CCC}
.dtable02   th  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; background:#FAFAFA; color:#333; font-weight:normal; letter-spacing:-1px; text-align:left; vertical-align:top}
.dtable02   td  {padding:6px 0 5px; border-bottom:1px solid #F3F3F3; vertical-align:top; line-height:18px; word-break:keep-all}
.dtable02   th  p, .dtable02    th  label   {color:#333; font-weight:normal; letter-spacing:-1px}
.dtable02   th  p,  .dtable02   td  p, .dtable02    td  ul, .dtable02   th  label   {padding-left:10px}
.dtable02   th.cell_l10 {padding-left:10px; text-align:left} /* PVI 적용 수정 101208 */
.dtable02   th.al_center,
.dtable02   td.al_center{text-align:center;} /* 101231 */
/* popup_layer */
/*120627 2차 삭제*/
/*.pop_l_position	{position:absolute; left:40%; _left:480px; top:233px; _top:333px; z-index:600} 
.pop_l_position640	{left:30%; _left:380px}*/
/*//120627 2차 삭제*/
.pop_l_wrap	{position:relative; width:464px; height:294px; border:3px solid #5a96c8; background:white; z-index:511}/*120417 수정*/
.pop_l_wrap640	{position:relative; width:634px; height:404px}
.pop_l_wrap710	{position:relative; width:704px; height:473px}
.pop_l_wrap	.img_l_pop	 {position:absolute; background:url('/images/et/wicked201208/pop_bg_layer.gif') no-repeat; overflow:hidden; z-index:513}
.pop_l_wrap	.img_l_pop.flag_tl	{left:-3px; top:-3px; width:10px; height:10px; background-position:0 0}
.pop_l_wrap	.img_l_pop.flag_tr	{right:-3px; top:-3px; width:10px; height:10px; background-position:-10px 0}
.pop_l_wrap	.img_l_pop.flag_bl	{left:-3px; bottom:-3px; width:10px; height:10px; background-position:0 -10px}
.pop_l_wrap	.img_l_pop.flag_br	{right:-3px; bottom:-3px; width:10px; height:10px; background-position:-10px -10px}
.pop_l_wrap	.btn_close	{right:9px; top:9px; width:25px; height:25px; background-position:right top}
.pop_l_wrap	.pop_tit	{position:relative; margin:29px 33px 19px 33px; vertical-align:top; z-index:513}
.pop_l_wrap_mix	.pop_tit	{margin-bottom:24px; text-align:center}
.pop_l_wrap_alert	.pop_tit	{height:90px; margin-bottom:0; padding-top:24px; text-align:center}
.pop_l_wrap	.pop_sub_desc	{margin-bottom:10px; color:#666; font:normal 12px "돋움"; line-height:16px}
.pop_l_wrap	.pop_l_content	{padding:0 33px 0; z-index:512}
.pop_l_wrap	.pop_l_content	.btnc	{width:100%; margin:0 auto; text-align:center}
.pop_l_wrap640	.pop_l_content	{width:556px; padding-left:39px}
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert	{height:175px; word-break:keep-all}
.pop_l_wrap_alert	.pop_l_content	.pop_l_alert02,
.pop_l_wrap_mix	.pop_l_content	.pop_l_alert02	{height:122px; word-break:keep-all}
/*//120627 추가*/
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	var opener_applya = "N";
	var opener_vala = "";
	
	function go_starta() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12891');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				applyEvent('a');
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent(gubun) {
		
		var frm = document.evtFrm;
		
		parent.submit_eventLog();
		frm.eventgubun.value = gubun;
		window.open('','win','width=730px, height=600px, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
		frm.target = 'win';
		frm.action = "/hp/im/et/evt002.do?method=getWickedPop201208";	
		frm.submit();
		//ScardSubmit(frm);
	}

	function openlayera() {

		<%
		if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12891');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				$('#pop_title').text("뮤지컬 &lt;위키드&gt;");
				$('#pop_time').text(getText(<%=item03%>));
				layeropen(1);
			<%}else{ %>
				if (opener_applya == "Y") {
					$('#pop_title').text("뮤지컬 &lt;위키드&gt;");
					$('#pop_time').text(getText(opener_vala));
					layeropen(1);
					return;
				}
				alert("이벤트 응모하셔야 확인 가능합니다.");
			<% } %>	
		<%
			}
		%>
	}

	
	function layeropen(num){
		for (i=1; i<2; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
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
	
	
	function getText(gubun) {
		var txt_value = "";
		if (gubun == "1") {
			txt_value = "2012년 9월 1일 오후 2시";
		} else if (gubun == "2") {
			txt_value = "2012년 9월 1일 오후 8시";
		} else if (gubun == "3") {
			txt_value = "2012년 9월 2일 오후 1시";
		} else if (gubun == "4") {
			txt_value = "2012년 9월 2일 오후 7시";
		} else if (gubun == "5") {
			txt_value = "2012년 9월 4일 오후 8시";
		} else if (gubun == "6") {
			txt_value = "2012년 9월 5일 오후 8시";
		} else if (gubun == "7") {
			txt_value = "2012년 9월 6일 오후 8시";
		} else if (gubun == "8") {
			txt_value = "2012년 9월 7일 오후 8시";
		} else if (gubun == "9") {
			txt_value = "2012년 9월 8일 오후 2시";
		} else if (gubun == "10") {
			txt_value = "2012년 9월 8일 오후 8시";
		} else if (gubun == "11") {
			txt_value = "2012년 9월 9일 오후 1시";
		} else if (gubun == "12") {
			txt_value = "2012년 9월 9일 오후 7시";
		} else if (gubun == "13") {
			txt_value = "2012년 9월 11일 오후 8시";
		} else if (gubun == "14") {
			txt_value = "2012년 9월 12일 오후 8시";
		} else if (gubun == "15") {
			txt_value = "2012년 9월 13일 오후 8시";
		} else if (gubun == "16") {
			txt_value = "2012년 9월 15일 오후 2시";
		} else if (gubun == "17") {
			txt_value = "2012년 9월 15일 오후 8시";
		} else if (gubun == "18") {
			txt_value = "2012년 9월 16일 오후 1시";
		} else if (gubun == "19") {
			txt_value = "2012년 9월 16일 오후 7시";
		} else if (gubun == "20") {
			txt_value = "2012년 9월 18일 오후 8시";
		} else if (gubun == "21") {
			txt_value = "2012년 9월 19일 오후 2시";
		} else if (gubun == "22") {
			txt_value = "2012년 9월 19일 오후 8시";
		} else if (gubun == "23") {
			txt_value = "2012년 9월 20일 오후 8시";
		} else if (gubun == "24") {
			txt_value = "2012년 9월 21일 오후 8시";
		} else if (gubun == "25") {
			txt_value = "2012년 9월 22일 오후 2시";
		} else if (gubun == "26") {
			txt_value = "2012년 9월 22일 오후 8시";
		} else if (gubun == "27") {
			txt_value = "2012년 9월 23일 오후 1시";
		} else if (gubun == "28") {
			txt_value = "2012년 9월 23일 오후 7시";
		} else if (gubun == "29") {
			txt_value = "2012년 9월 25일 오후 8시";
		} else if (gubun == "30") {
			txt_value = "2012년 9월 26일 오후 2시";
		} else if (gubun == "31") {
			txt_value = "2012년 9월 26일 오후 8시";
		} else if (gubun == "32") {
			txt_value = "2012년 9월 27일 오후 8시";
		} else if (gubun == "33") {
			txt_value = "2012년 9월 28일 오후 8시";			
		} else if (gubun == "34") {
			txt_value = "2012년 9월 29일 오후 1시";
		} else if (gubun == "35") {
			txt_value = "2012년 9월 29일 오후 7시";
		} else if (gubun == "36") {
			txt_value = "2012년 9월 30일 오후 6시";
		} else if (gubun == "37") {
			txt_value = "2012년 10월 2일 오후 7시";
		} else if (gubun == "38") {
			txt_value = "2012년 10월 3일 오후 1시";
		} else if (gubun == "39") {
			txt_value = "2012년 10월 3일 오후 7시";
		} else if (gubun == "40") {
			txt_value = "2012년 10월 5일 오후 8시";
		} else if (gubun == "41") {
			txt_value = "2012년 10월 6일 오후 2시";
		} else if (gubun == "42") {
			txt_value = "2012년 10월 6일 오후 8시";
		} else if (gubun == "43") {
			txt_value = "2012년 10월 7일 오후 1시";
		}
		return txt_value;


	}

	
</script>


</head>

<body>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>


<img src="/images/et/wicked201208/event_musical.jpg" alt="회원님을 브로드웨이 블록버스터로 모십니다! 뮤지컬 <위키드>무료 초대 이벤트" border="0" usemap="#musical" />

	<div class="hidden">
		<p>회원님을 브로드웨이 블록버스터로 모십니다!</p>
		<h1>뮤지컬 &lt;위키드&gt;무료초대 이벤트</h1>
		
		<p>브로드웨이 역사상 최고의 블로버스터 뮤지컬을 한국에서 만나는 값진 기회! 지금 바로 응모하시고, 무료 관람의 행운을 잡아보세요!</p>
		
		<dl>
			<dt>응모기간</dt>
			<dd>2012년 8월 10일(금) ~ 8월 20일(월)</dd>
			<dt>행사대상</dt>
			<dd>응모기간 중 삼성카드로 일시불 및 할부 30만원 이상 이용하신 회원님</dd>
			<dt>행사내용</dt>
			<dd>이벤트 응모회원 중 추첨을 통해 215명에게 뮤지컬 &lt;위키드&gt;무료 관람의 기회를 드립니다(1인 2매)</dd>
			<dt>공연장소</dt>
			<dd>블루스퀘어 삼성전자 홀</dd>
			<dt>당첨자 발표</dt>
			<dd>2012년 8월 23일(목) 홈페이지 당첨자 발표란 게시</dd>
		</dl>
		
        <p><a href="#none" onclick="go_starta();return false;">응모하기</a></p>
		<p>
			<a href="http://www.wickedthemusical.co.kr/" target="_blank"  title="새창">공연 자세히 보기</a> 
            <a href="#none" onclick="openlayera();return false;">내가 응모한 내역 확인하기</a> 
		</p>
		
		<dl>
			<dt>티켓발송</dt>
			<dd>2012년 8월 29일</dd>
			<dt>티켓 수령방법</dt>
			<dd>이벤트 당첨 회원에게 8월 27일 당첨 안내가 핸드폰 문자 메세지로 발송되며 티켓은 삼성카드에 등록된 회원님의 청구지 주소로 개별 배송됩니다.
				<p>핸드폰번호 및 주소가 바뀐 회원님께서는 올바른 번호로 수정하셔야 티켓을 문제없이 받으실 수 있습니다. </p>
                <p><a href="#none" onclick="parent.goTabPage('NHPIMMHUFM001M001');return false;">핸드폰 번호 및 청구지 주소 수정하기</a></p>
			</dd>
		</dl>
		
		<ul>
			<li>- 공연일시는 하나만 선택하실 수 있으며 응모기간 내 변경 가능합니다.(티켓을 분실하신 경우 입장 불가합니다.)</li>
			<li>- 상기 서비스는 카드사 및 제휴사의 사정에 의해 변경 및 취소될 수 있으며, 이를 사전에 안내해 드립니다.</li>
		</ul>
		
		
	</div>

<map name="musical" id="musical">
<area shape="rect" coords="230,972,338,992" href="http://www.wickedthemusical.co.kr/" target="_blank" title="새창" alt="공연자세히 보기" />
<area shape="rect" coords="346,973,497,995" href="javascript:openlayera();"  alt="내가 응모한 내역 확인하기" />
<area shape="rect" coords="287,925,441,963" href="javascript:go_starta();" alt="응모하기" />
<area shape="rect" coords="291,1162,485,1183" href="javascript:parent.goTabPage('NHPIMMHUFM001M001');" alt="핸드폰번호 및 청구지 주소 수정하기" />
</map>


<!-- 레이어팝업-최초응모시 -->
	<div id="lay_1" class="pop_l_position pop_l_wrap_mix" >
		<div class="pop_l_wrap" style="height:220px;"><p class="img_l_pop flag_tl">&nbsp;</p><p class="img_l_pop flag_tr">&nbsp;</p><p class="img_l_pop flag_bl">&nbsp;</p><p class="img_l_pop flag_br">&nbsp;</p><input type="button" class="img_l_pop btn_close btn_input" onclick="this.parentNode.parentNode.style.display='none';" value="레이어닫기" title="공연일시 레이어 닫기" />
			<p class="pop_tit" style="text-align:left;"><img src="/images/et/wicked201208/layer_tit_1.png" alt="회원님께서 응모하신 공연일시입니다." /></p>
				<div class="pop_l_content">
					<div class="pop_l_alert" style="">
					<p class="pop_sub_desc"><%=user_name %> 회원님께서 응모하신 공연일시는 아래와 같습니다.</p>
					<table summary="응모하신 공연명 및 공연일시 입니다." class="  dtable02"> 
						<caption>공연일시</caption>
						<colgroup><col width="20%"/><col width="80%"/></colgroup>
						<tbody>
						<tr>
							<th class=""><p>공연명</p></th>
							<td class="" id="pop_title"></td>
						</tr>
						<tr>
							<th class=""><p>공연일시</p></th>
							<td class="" id="pop_time"></td>
						</tr>
						</tbody>
					</table>
					<p class="t_desc04 mt5">변경을 원하시면 응모버튼을 클릭 후 , 다시 공연일시를 선택해주세요.</p>
				</div>
			</div>
		</div>
	</div>
	
	
</form>
</body>

</html>

