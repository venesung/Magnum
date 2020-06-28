<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>설맞이 Bonus One 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
	String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
%>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<style type="text/css"> 
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script language="javascript" type="text/javascript">
	var sel_item = "";
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('<%=cmsSeq%>');
		<%
			}else{
		%>
			if(parent.event_check()){
				<%if(event_ok.equals("Y")){%>
					alert("이미 응모하신 이벤트 입니다.");
				<%}else{ %>
					applyEvent();
				<% } %>		
			}
		<%
			}
		%>
	}

	function applyEvent() {
		
		var frm = document.frm1;
		var item03 = "";
		
		for(var j=0;j<frm.id_event_input_1.length; j++) {
			if (frm.id_event_input_1[j].checked == true) {
				item03 = frm.id_event_input_1[j].value;
			}
		}

		if(item03 == ""){
			alert("3가지 혜택 중 한가지를 선택해주시기 바랍니다.");
		}
		else{
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
				return;
			<%}%>
			parent.submit_eventLog();
			document.evtFrm.item03.value = item03;
			sel_item = item03;
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
		}
	}

	function applyOk(){
		alert("참여해주셔서 감사합니다. 정상적으로 응모하셨습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

</script>

</head>

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="item03" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<div style="position: relative;">

<script type="text/javascript">
	function layeropen(num){
		for (i=1; i<4; i++)	{
			document.getElementById("lay_"+i).style.display = "none";
			if (i==num) {		document.getElementById("lay_"+num).style.display = "block";	}
		}
	}
	function layerclose(num){
		document.getElementById("lay_"+num).style.display = "none";
	}
</script>

	<img src="/images/et/bonusone201301/event_bonusone.jpg" usemap="#map" alt="설맞이 Bonus One 이벤트" />
	<map name="map" id="map">
		<area shape="rect" coords="104,1109,191,1132" href="javascript:layeropen(1)" alt="이마트/홈플러스/롯데마트 5,000 서비스포인트 자세히보기"  />
		<area shape="rect" coords="320,1109,407,1130" href="javascript:layeropen(2)" alt="주유소 5,000 서비스포인트 자세히보기"  />
		<area shape="rect" coords="537,1109,621,1131" href="javascript:layeropen(3)" alt="학원 5,000 서비스포인트 자세히 보기"  />
		<area shape="rect" coords="286,1235,440,1272" href="javascript:go_start();" alt="응모하기"  />
	</map>
    
    <div class="hidden">
    	<p>삼성카드가 2013년 설보너스를 드립니다!</p>
        <dl>
        	<dt>설맞이 Bonus One 이벤트</dt>
            <dd>미리미리 참 실용적인, 설 준비 혜택! 삼성카드와 함께 실속있는 설 맞이하세요!</dd>
            <dd>
            	<dl>
                	<dt>행사기간</dt>
                    <dd>2013년 1월 21일(월) ~ 2월 28일(목)</dd>
                    <dt>행사내용</dt>
                    <dd>
                    	3가지 Bonus 혜택 중 원하시는 업종에 응모하신 후, 행사기간 동안 해당업종 이용목표를 당성하신 회원님께 5,000서비스포인트를 적립해 드립니다.
                        <p>- 이용목표는 아래 업종별 자세히보기를 통해 확인해 보시기 바랍니다.</p>
                        <p>- 행사기간 동안 일시불/할부 50만원 이상 이용한 회원님에 한해 제공됩니다.</p>
                   		
                        <ul>
                        	<li>넉넉한 장바구니! 이마트/홈플러스/롯데마트 5,000 서비스포인트 <a href="javascript:layeropen(1)">자세히보기</a></li>
                            <li>알뜰한 귀성길! 주유소 5,000 서비스포인트 <a href="javascript:layeropen(2)">자세히보기</a></li>
                            <li>신나는 공부! 학원 5,000 서비스포인트 <a href="javascript:layeropen(3)">자세히 보기</a></li>
                        </ul>
                    </dd>
                    <dd><a href="javascript:go_start();">응모하기</a></dd>
                </dl>
            </dd>
            <dd>- 카드이용후 이벤트에 응모하셔도 추첨대상이 되실 수 있습니다.</dd>
            <dd>- 3가지 혜택 중 1가지만 선택하실 수 있으며, 응모 후 변경하실 수 없습니다.</dd>
            <dd>- 주유소는 삼성카드에 등록된 가맹점 업종 분류 기준이며, LPG/가정용연료는 제외됩니다.</dd>
            <dd>- 할인점 업종의 온라인 매장 및 임대 매장은 제외됩니다.</dd>
        </dl>
    </div>

<!-- 선택 버튼-->
<form name="frm1" method="post" action="">
	<p style="position:absolute; z-index:2; left:138px; top:1146px;">
		<label><input type="radio" id="bonusone01" name="id_event_input_1" value="1" title="이마트/홈플러스/롯데마트 5,000 서비스포인트" /></label>
  </p>
	<p style="position:absolute; z-index:2; left:353px; top:1146px;">
		<label><input type="radio" id="bonusone02" name="id_event_input_1" value="2" title="주유소 5,000 서비스포인트" /></label>
  </p>
	<p style="position:absolute; z-index:2; left:570px; top:1146px;">
		<label><input type="radio" id="bonusone03" name="id_event_input_1" value="3" title="학원 5,000 서비스포인트" /></label>
  </p>
</form>  
<!-- //선택 버튼-->
</div>

<!-- 레이어팝업 1 -->
<div id="lay_1" style="display:none; position:absolute; z-index:2; left:137px; top:750px; width:470px; height:323px;">
	<map name="bonusone_lay_1" id="bonusone_lay_1">
		<area shape="rect" coords="438,16,453,31" alt=" 닫기" href="#" onclick="document.getElementById('lay_1').style.display='none';return false;" />
	</map>
	<img src="/images/et/bonusone201301/pop1.png" usemap="#bonusone_lay_1" alt="이마트/홈플러스/롯데마트 5,000 서비스포인트" />
</div>
<!-- //레이어팝업 1 -->

<!-- 레이어팝업 2 -->
<div id="lay_2" style="display:none; position:absolute; z-index:2; left:137px; top:750px; width:470px; height:339px;">
	<map name="bonusone_lay_2" id="bonusone_lay_2">
		<area shape="rect" coords="438,16,453,31" alt=" 닫기" href="#" onclick="document.getElementById('lay_2').style.display='none';return false;" />
	</map>
	<img src="/images/et/bonusone201301/pop2.png" usemap="#bonusone_lay_2" alt="주유소 5,000 서비스포인트" />
</div>
<!-- //레이어팝업 2 -->

<!-- 레이어팝업 3-->
<div id="lay_3" style="display:none; position:absolute; z-index:2; left:137px; top:750px; width:470px; height:323px;">
	<map name="bonusone_lay_3" id="bonusone_lay_3">
		<area shape="rect" coords="438,16,453,31" alt=" 닫기" href="#" onclick="document.getElementById('lay_3').style.display='none';return false;" />
	</map>
	<img src="/images/et/bonusone201301/pop3.png" usemap="#bonusone_lay_3" alt="학원 5,000 서비스포인트" />
</div>
<!-- //레이어팝업 3 -->


</body>

</html>

