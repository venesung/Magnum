<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>올여름, 해외여행갈땐 삼성카드가 필수! 삼성카드 캐시백 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	//String item03 = (String)request.getAttribute("item03"); //item03
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
%>
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
			parent.eventLogin('29573');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 이벤트에 응모하셨습니다.");
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		
		var frm = document.frm1;
		
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n개인신용카드이용회원에 한합니다.");
				return;
			<%}%>
			parent.submit_eventLog();
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();
	}

	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
		location.reload();
	}

</script>


</head>

<body>
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/event_cashback07.jpg" alt="올여름, 해외여행갈땐 삼성카드가 필수! 삼성카드 캐시백 이벤트" border="0" usemap="#cashback" />

	<div class="hidden">
		<p>올 여름, 해외여행 갈 땐 삼성카드가 필수!</p>
		<h1>삼성카드 캐시백 이벤트</h1>
		<p>해외에서 삼성카드를 이용하시면 최대 30,000원 캐시백 혜택을 드립니다.</p>
		
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 7워 16일(월) ~ 8월 31일(금)</dd>
			<dt>행사대상</dt>
			<dd>행사기간 동안 해외 가맹점에서 삼성카드로 US$200 이상 이용하신 회원님</dd>
			<dt>행사내용</dt>
			<dd>
				<p>행사기간 동안 이벤트 응모 시 최대 30,000원 개시백 적립</p>
				<table summary="캐시백적립 안내 표 - 이용금액의 비례한 캐시백 적립률 안내입니다.">
					<caption>캐시백적립 안내</caption>
					<colgroup>
						<col width="33%" />
						<col width="33%" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th>이용금액</th>
							<th>US$200 이상</th>
							<th>US$500 이상</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>캐시백</td>
							<td>10,000원</td>
							<td>30,000원</td>
						</tr>
					</tbody>
				</table>
			</dd>
			<dt>캐시백적립일</dt>
			<dd>2012년 9월 20일(목)</dd>
		</dl>
		
        <p><a href="#none" onclick="go_start();return false;">응모하기</a></p>
		
		<ul>
			<li>- 행사기간 동안 카드 이용 및 응모를 모두 완료하신 분에 한해 1인 1회 제공됩니다.</li>
			<li>- 현금서비스 이용건 및 카드결제 취소건은 제외됩니다.</li>
			<li>- 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용은 홈페이지를 통하여 사전에 알려 드립니다.</li>
		</ul>
		
	</div>

<map name="cashback" id="cashback">
<area shape="rect" coords="287,918,442,955" href="#" onclick="go_start();" alt="응모하기" />
</map>
	

</body>

</html>

