<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성화재 가족의 Happy Donation! Vol.2 - 삼성카드</title>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
	String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //chkUserGubun
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
p {margin:0; padding:0}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}

</style>

<script language="javascript" type="text/javascript">
	
	function go_start() {
		<%
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('12127');
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

</script>


</head>

<body style="margin:0;">
 <iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt003.do?method=EvnetInsertAll" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value="<%=eventNo%>"/>
</form>

<div>
    <img src="/images/et/happy_donation02.jpg" alt="삼성화재 가족의 Happy Donation! Vol.2" usemap="#Map" />
    <map name="Map" id="Map">
    <!--“참여해주셔서 감사합니다” 경고창 작동 --> 
    <area shape="rect" coords="599,318,688,348" href="#" onclick="go_start();" alt="후원하기" />
    <!--“//참여해주셔서 감사합니다” 경고창 작동 -->
    </map>
	 <div class="hidden">
    	<dl>
        	<dt>삼성카드가 삼성화재 창립기념일을 진심으로 축하드립니다. 삼성화재 가족의 Happy Donation! Vol.2</dt>
            <dd>
            	삼성화재 60주년 창립기념일을 맞이하여, 삼성카드가 함께하는 이벤트를 준비하였습니다.<br />
                2011년 뇌종양을 이겨낸 백현이에 이어, 올해에는 은서를 위한 Happy Donation!<br />
                1월 한 달동안 삼성화재 임직원께서 사용하시는 삼성카드 이용금액의 0.1%를 모아 수모세표종으로 항암치료 중인 은서를 후원합니다.
            </dd>
            <dd><a href="#" onclick="go_start();" >후원하기</a></dd>
            <dd>
            	<strong>삼성화재 Happy Donation 후원 아동 희망으로 힘든 치료를 꿋꿋하게 이겨나가는 은서(14세,女) 이야기</strong>
                <p>은서는 만4세가 되던 해에 수모세포종 진단을 받았습니다.
                어린 나이에도 뇌수술과 항암치료, 50회가 넘는 방사선 치료를 잘 견디었습니다.
                또래보다 키가 좀 작지만 올해 중학생이 되어 학교에 다니게 되자, 가족들은 이제 병원생활은 졸업을 한다고 기뻐하였습니다.</p>
                <p>그런데 2012년 여름방학에 재발 진단을 받아 다시 항암치료를 하게 되었습니다. 상황은 처음보다 더욱 어렵게되어, 가을에는 또 다시 종양제거 수술을 받았습니다.
                은서 가족은 어머니와 아홉살 위인 언니 이렇게 세 명입니다. 은서의소망은 회복하여 세 모녀가 행복하게 사는 것인데, 이 작은 소망도 은서네 가족에겐 쉽지 않은 꿈인가 봅니다.</p>
                <strong>삼성화재 가족 여러분! 병의 재발로 절망하였지만, 치료를 꿋꿋하게 이겨나가는 은서가 희망을 잃지 힘을 모아주세요!</strong>
            </dd>
            <dd>* 기부금액은 후원에 참여하신 삼성화재 임직원이 2012년 1월 한 달간 사용하신 삼성카드 일시불+할부 이용금액의 0.1%입니다.</dd>
            <dd>* 삼성화재 가족이 모아주신 기부금은 2월에 소아암협회를 통해 은서에게 전달될 예정입니다.</dd>
        </dl>
    </div>
</div>
</body>

</html>

