<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>최대 500만 포인트,여수에서 행운의3을 찾아라! - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12491');
		<%
			}else{
		%>
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			<%}else{ %>
				applyEvent();
			<% } %>	
		<%
			}
		%>
	}

	function applyEvent() {
		window.open('/hp/im/et/evt003.do?method=getExpoList201205', 'expo201205', 'width=710px, height=649px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')
	}


</script>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

</head>

<body style="margin:0;">
<img src="/images/et/expo201205/event_expo.jpg" alt="최대 500만 포인트,여수에서 행운의3을 찾아라!" border="0" usemap="#expo" />
<map name="expo" id="expo">
    <area shape="rect" coords="506,234,688,264" href="#"  alt="영수증 승인번호 등록하기" onclick="go_start();"/>
    <area shape="rect" coords="245,1063,481,1100" href="#"  alt="영수증 승인번호 등록하기" onclick="go_start();"/>
</map>
<div class="hidden">
	<p>행운의 3을 찾으면 서비스 포인트가 우르르!</p>
	<h1>최대 500만 포인트, 여수에서 행운의 3을 찾아라</h1>
	<p>여수에서 삼성카드 사용 후 3개의 개수를 확인해 보세요.</p>
    <p><a href="#none" onclick="go_start();return falfse;">영수증 승인번호 등록하기</a></p>

	<dl>
		<dt>행사기간</dt>
		<dd>2012년 5월 12일(토) ~ 8월 12일(일)</dd>
		<dt>참여방법</dt>
		<dd>행사기간 동안 여수시 음식점과 여수 행사장 내 가맹점에서 삼성카드로 결제 시 영수증 승인번호에 3이 나올경우, 승인번호를 등록하시면 됩니다. </dd>
		<dt>승인번호 등록기간</dt>
		<dd>승인기간 내 결제일로 부터 30일 이내 홈페이지로 등록</dd>
		<dt>포인트적립</dt>
		<dd>수시적립(등록일 기준으로 2일 뒤 확인가능)</dd>
	</dl>
	
    <p><a href="#none" onclick="go_start();return falfse;">영수증 승인번호 등록하기</a></p>
	<h2>경품안내</h2>
	<p>보너스클럽 및 블루라인 가맹점 이용시 왕대박 3을 잡아라 이벤트가 우선 적용됩니다.</p>
	<ul>
		<li>1등 - 승인번호 중 3이 6개 이상(서비스 포인트 500만 P)</li>
		<li>2등 - 승인번호 중 3이 5개(서비스 포인트 50만 P)</li>
		<li>3등 - 승인번호 중 3이 4개 (서비스 포인트 10,000P)</li>
		<li>4등 - 승인번호 중 3이 3개 (서비스포인트 1,000P)</li>
		<li>5등 - 승인번호 중 3이 2개 (서비스포인트 500P)</li>
		<li>6등 - 승인번호 중 3이 1개 (서비스 포이트 100P)</li>
	</ul>
	
	<dl>
		<dt>서비스포인트란?</dt>
		<dd>삼성카드 포인트 적립 행사와 관련하여 적립되는 포인트로, 보너스포인트 빅포인트와 합산하여 사용하실 수 있습니다. 유효기간은 적립일로부터 1년이며 유효기간 내 사용하지 않을 경우 소멸됩니다.</dd>
		<dt>주의사항</dt>
		<dd>
			<ul>
				<li>- 본 행사는 웹회원 가입 후 로그인 하셔야 참여 가능합니다.</li>
				<li>- 법인공용/올앳/기프트카드는 제외됩니다.</li>
				<li>- 음식점은 삼성카드 가맹점 외식 업종 분류 기준에 의한 등록 가맹점에 한합니다.</li>
				<li>- 대상 가맹점은 추가될 수 있으며 시스템 반영 시일이 소요됩니다.</li>
				<li>- 본인 결제건이 아니거나 승인번호 조작 입력, 승인취소 시 포인트 적립이 취소될 수 있습니다.</li>
				<li>- 행사기간 동안 본인카드 결제건별로 각각 응모하실 수 있으나, 동일한 승인번호로 중복 응모 하실 수 없습니다.</li>
				<li>- 웹회원가입 다음날부터 '여수에서 행운의 3을 찾아라' 내역에서 30일 이내에 결제건을 확인하실 수 있으며, 적립 대상건은 등록버튼을 클릭하시면 등록이 가능합니다.</li>
				<li>- 50,000 포인트 이상 당첨 시 제세공과금(22%)을 제외한 금액에 해당하는 포인트를 적립해 드립니다.</li>
				<li>- 왕대박 3을 잡아라 이벤트와 증복되는 보너스클럽이나 블루라인 가맹점에서 3만원 이상 결제시 왕대박 3을 잡아라 에서 조회하실 수 있습니다.</li>
				<li>- 서비스 포인트는 양도, 상속의 대상이 되지 않으며 카드이용계약 해지, 해제 또는 이용자의 사망 등으로 종료 시 소멸합니다.</li>
				<li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
			</ul>
		
		</dd>
	</dl>
</div>
</body>

</html>

