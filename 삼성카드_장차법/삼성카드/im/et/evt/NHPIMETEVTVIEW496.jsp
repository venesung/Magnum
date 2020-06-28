<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드와 함께하는 호주 골든코스트 에어포트 마라톤 초청 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('27282');
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
		//document.evtFrm.eventgubun.value=evgubun;
		document.evtFrm.target = "applyResultFrame";
		document.evtFrm.submit();
	}


	
	function applyOk(){
		alert("이벤트 응모가 완료되었습니다.");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

</script>


</head>

<body style="margin:0;">
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<img src="/images/et/120502_event.jpg" alt="삼성카드와 함께하는 호주 골든코스트 에어포트 마라톤 초청 이벤트" border="0" usemap="#golden" />
<map name="golden" id="golden">
 	<area shape="rect" coords="295,1039,433,1077" href="#" onclick="go_start();" alt="응모하기" />
    <area shape="rect" coords="463,943,571,964" href="http://www.marathontour.co.kr/foreign/view.asp?idx=29&curpage=&T_name=&flag=6&cat1no=4" target="_blank" alt="투어 자세히 보기" title="새창" />
    <area shape="rect" coords="290,1264,369,1284" href="http://www.marathontour.co.kr/foreign/view.asp?idx=29&amp;curpage=&amp;T_name=&amp;flag=6&amp;cat1no=4" target="_blank" alt="자세히 보기" title="새창" />
    <area shape="rect" coords="96,1369,283,1424" href="http://www.australia.com/ko/" target="_blank" alt="Australia.com 호주" title="새창" />
    <area shape="rect" coords="331,1372,490,1426" href="http://www.queensland.or.kr/" target="_blank" alt="Queensland" title="새창" />
    <area shape="rect" coords="547,1359,641,1437" href="http://www.queensland.or.kr/" target="_blank" alt="MARATHON" title="새창" />
</map>
<div class="hidden">
    <h1>호주 골드코스트 에어포트 마라톤 초청 이벤트</h1>
    <p>호주만큼 멋진곳은 어디에도 없습니다. 자녀와 함께 호주 골드코스트에서 특별한 추억을 만들어보세요!</p>
    
    <dl>
        <dt>행사기간</dt>
        <dd>2012년 5월 7일(월) ~ 5월 20일(일)</dd>
        <dt>참가기간</dt>
        <dd>2012년 6월 27일(수) ~ 7월 1일(일) (4박5일)</dd>
        <dt>행사대상</dt>
        <dd>삼성카드로 응모기간동안 일시불 + 할부 50만원 이상 이용회원</dd>
        <dt>행사내용</dt>
        <dd>행사 응모회원 중 추첨을 통해 10가족에게 골드코스트 국제마라톤 대회참가 및 골드코스트 투어의 행운을 드립니다.(항공, 숙박, 마라톤대회 초대권 등 500만원(가족기준) 상당 여행패키지 전액 제공)
            <p>- 가족기준은 부모님 1명, 자녀 1명(만 12세 이하)입니다. 
            <a href="http://www.marathontour.co.kr/foreign/view.asp?idx=29&amp;curpage=&amp;T_name=&amp;flag=6&amp;cat1no=4" target="_blank" title="새창" >투어 자세히 보기</a></p>
        </dd>
        <dt>당첨자발표</dt>
        <dd>2012년 5월 22일(화) 홈페이지 당첨자 발표란 게시 및 별도 전화안내</dd>
    </dl>
    
    <p><a href="#none" onclick="go_start();return falfse;">응모하기</a></p>
    
    <p>호주 퀸즐랜드 골드코스트의 아름다움과 마라톤을 동시에 느끼고 싶으시다고요?</p>
    <h2>우리나라에 단 하나밖에 없는 여행상품을 소개해 드립니다!</h2>
    <ul>
        <li>여행사 - 에코원 디스커버리</li>
        <li>문의전화 - 02-508-3993 <a href="http://www.marathontour.co.kr/foreign/view.asp?idx=29&amp;curpage=&amp;T_name=&amp;flag=6&amp;cat1no=4" target="_blank" title="새창">자세히보기</a></li>
    </ul>
    
    <ul>
        <li><a href="http://www.australia.com/ko/" target="_blank" title="새창">australia.com 호주</a></li>
        <li><a href="http://www.queensland.or.kr/" target="_blank" title="새창">Queensland</a></li>
        <li><a href="http://www.queensland.or.kr/" target="_blank" title="새창">gold coast airport marathon</a></li>
    </ul>
    
    <ul>
        <li>- 최종 당첨된 회원의 전화번호와 성함은 발권 및 기타예약을 위하여 여행사 에코원 디스커버리에 제공됩니다.</li>
        <li>- 제세공과금은 당첨자 부담입니다.</li>
        <li>- 카드사 및 제휴사의 사정으로 변경 중단될 수 있으며 그 내용을 사전에 알려 드립니다.</li>
    </ul>
</div>

</body>

</html>

