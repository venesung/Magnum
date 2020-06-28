<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 할부결제 시 할부 수수료 할인 이벤트 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");

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
			parent.eventLogin('30517');
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
		
			parent.submit_eventLog();
			document.evtFrm.target = "applyResultFrame";
			document.evtFrm.submit();

	}

	function applyOk(){
		alert("참여해주셔서 감사합니다");
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}

	function resMsg(resCode){
		if(resCode == "99"){
			alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
			location.reload();
		}else if(resCode == "&nbsp;"){
			alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
			location.reload();
		}else if(resCode == "10"){
			alert('조회구분키 오류입니다.');
			location.reload();
		}else if(resCode == "11"){
			alert('행사적용정보가　등록가능합니다.');
			location.reload();
		}else if(resCode == "12"){
			alert('이미 등록된 회원입니다.');
			location.reload();
		}else if(resCode == "00"){
			alert('이벤트 참여가 완료되었습니다.');
			location.reload();
		}else{
			alert('이벤트 참여에 실패하였습니다.다시 시도해주세요.');
			location.reload();
		}
		return;
	}
	
</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=setHalboo201201" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

	<img src="/images/et/event_discount_1223.jpg" usemap="#event_discount" alt="삼성카드 할부결제 시 할부 수수료 할인 이벤트" />  
	<map name="event_discount" id="event_discount">
		<area shape="rect" coords="599,229,690,260" href="#" onclick="go_start();" alt="할부수수료 할인 이벤트 응모하기">
		<area shape="rect" coords="294,929,432,968" href="#" onclick="go_start();" alt="할부수수료 할인 이벤트 응모하기">
	</map>  
     <div class="hidden">
    	<dl>
        	<dt>한 번만 응모하면 2012년 12월까지 쭈~욱! 6&middot;8&middot;10&middot;12 할부수수료 할인이벤트</dt>
            <dd>수수료 때문에 할부결제를 망설이세요? 할부에도 참 실용적인, 삼성카드가 할부수수료 부담을 덜어 드립니다.</dd>
            <dd><a href="#" onclick="go_start();">응모하기</a></dd>
            <dd>
            	<dl>
                	<dt>행사기간</dt>
                    <dd>응모하신 시점부터 2012년 12월 31일(월)까지</dd>
                    <dt>행사대상</dt>
                    <dd>삼성카드 모든 회원님(법인/체크/선불 제외)</dd>
                    <dt>응모기간</dt>
                    <dd>~2012년 8월 15일(수)까지 (8/15일까지 응모하신 분에 한해 서비스가 적용됩니다.)</dd>
                    <dt>응모방법</dt>
                    <dd>ARS 1688-6750 또는 하단 응모하기 버튼 클릭</dd>
                    <dd><a href="#" onclick="go_start();">응모하기</a></dd>
                </dl>                
            </dd>
            <dd>
            	<dl>
                	<dt>할부수수료, 이렇게 할인해 드려요!</dt>
                    <dd>6개월 할부 시 2회차부터 할부수수료 면제(1회차는 회원님 부담)</dd>
                    <dd>8개월 할부 시 3회차부터 할부수수료 면제(1~2회차는 회원님 부담)</dd>
                    <dd>10개월 할부 시 3회차부터 할부수수료 면제(1~2회차는 회원님 부담)</dd>
                    <dd>12개월 할부 시 4회차부터 할부수수료 면제(1~3회차는 회원님 부담)</dd>
                </dl>
            </dd>
            <dd>
            	<ul>
                	<li>삼성카드 홈페이지 또는 ARS로 먼저 응모하신 후에 이용하셔야 할부수수료 면제 혜택을 받으실 수 있습니다.</li>
                    <li>회원님 본인 기준으로 1회만 응모하시면, 가족카드를 이용하시는 분도 자동으로 응모됩니다.</li>
                    <li>6&middot;8&middot;10&middot;12개월 할부가 가능한 삼성카드 전국 가맹점에서 혜택을 받으실 수 있으며, 이용횟수의 제한은 없습니다.</li>
                    <li>지방세 납부 12&middot;18개월의 저리할부, 자동차 카드할부 등 일부 가맹점 할부 이용건은 제외됩니다.</li>
                    <li>일시불에서 할부로 전환하신 이용금액은 제외됩니다.</li>
                    <li>법인/올앳/선불/체크/기프트카드는 제외됩니다.</li>
                </ul>
            </dd>
        </dl>
    </div>
</body>

</html>

