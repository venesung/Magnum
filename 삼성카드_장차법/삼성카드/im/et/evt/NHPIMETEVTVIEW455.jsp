<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CGV 할인 서비스 확대 및 무비존 리뉴얼 - 삼성카드</title>
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
			parent.eventLogin('12152');
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
		alert("이벤트 응모가 완료되었습니다");
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
<img src="/images/et/event_cgv.jpg" border="0" usemap="#Map" alt="CGV 할인 서비스 확대 및 무비존 리뉴얼" />
<map name="Map" id="Map">
<area shape="rect" coords="311,1435,457,1469" href="http://moviezone.kr/front/default.aspx" target="_blank" alt="예매하기" title="새창" />
  <area onclick="go_start();" shape="rect" coords="310,941,456,975" href="#" alt="응모하기" />
</map>

 <div class="hidden">
	<dl>
    	<dt>CGV 할인 서비스 확대 및 무비존 리뉴얼! 새해에도 참 실용적인, 삼성카드의 영화 혜택과 함께 하세요.</dt>
        <dd>
        	<dl>
            	<dt>1. 모든 회원 대상 CGV 1,000원 현장할인!</dt>
                <dd>
                	CGV에서 영화티켓을 삼성카드로 현장 구매하시면 매당 1,000원 현장할인!(본인 및 동반 1인까지)
                    <ul>
                    	<li>카드 영화할인혜택과 중복 적용 가능</li>
                        <li>행사기간:2012년  12월 31일까지(1일 1회, 월 5회/신용카드 5천원 이상 결제 시)</li>
                        <li>CJ ONE카드, 법인, 올앳, 체크, 기프트카드 및 청소년, 조조할인, 4D 및 특화관, 인터넷 예매견, CGV 제휴할인 이용건은 제외됩니다. </li>
                    </ul>                
                </dd>
                <dd>
                	<strong>CGV할인 서비스 확대 기념 론칭 이벤트</strong>
                    <p>행사기간동안 삼성카드 홈페이지에서 이벤트에 응모하시고 CGV에서 영화티켓을 삼성카드로 결제 시, 추가 2,000원 캐시백!</p>
                    <p><strong>행사기간</strong> 2012년 1월 17일(화) ~ 2012년 1월 31일(화)</p>
                    <p><strong>캐시백 일자</strong> 2012년 2월 13일(월) 결제대금에서 자동차감</p>
                </dd>
                <dd>
                	5천원 이상 현장결제 금액에 한하며, 결제하신 후 이벤트에 응모하셔도 동일하게 혜택을 받으실 수 있습니다. 1일 1회 응모가능.
                </dd>
                <dd><a href="#" onclick="go_start();">응모하기</a></dd>
            </dl>
        </dd>
        
        <dd>
        	<dl>
            	<dt>2. 무비존 예매수수료 폐지 및 좌석 선택 가능!</dt>
                <dd>고객이 부담하던 예매수수료 폐지 &amp; 극장 전 좌석 선택가능!(CGV제외)</dd>
                <dd>
                	<strong>무비존 리뉴얼 이벤트</strong>
                    <p>행사기간동안 무비존을 이용해주신 분 중 추첨을 통해 총 150분께 경품 증정!</p>
                    <p><strong>행사기간</strong> 2012년 1월 17일(화) ~ 2012년 1월 31일(화)</p>
                    <p><strong>당첨자 발표</strong> 2012년 2월 10일(금) 삼성카드 홈페이지 당첨자 발표란</p>
                    <p><strong>경품내용</strong> 에버랜드 자유이용권 1매(50명), 무비존 모바일 예매권 2매(100명) * 에버랜드 자유이용권 및 무비존 모바일 예매권 유효기간 : 2012년 4월 30일까지</p>
                </dd>
                <dd><a href="http://moviezone.kr/front/default.aspx" target="_blank" title="새창">예매하기</a></dd>                
            </dl>
        </dd>
        <dd>법인/올앳/선불/체크/기프트카드는 제외됩니다.</dd>
        <dd>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려드립니다.</dd>
    </dl>
</div>

</body>

</html>

