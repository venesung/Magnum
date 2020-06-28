	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/class.css" />
	<title>삼 성 카 드</title>
	<%
		String loginYN = (String)request.getAttribute("loginYN");
		String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
		String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No
		String cmsSeq = (String)request.getAttribute("cmsSeq"); //cmsSeq
		String chkUserGubun = (String)request.getAttribute("chkUserGubun"); //대상구분
	%>
	<style type="text/css">
	*, body {margin:0; padding:0;}
	body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
	img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
	</style>
	
	<script language="javascript">
		
		function go_start(popgubun) {
			<%
				if(loginYN.equals("N")){ 
			%>
				parent.eventLogin('<%=cmsSeq%>');
			<%
				}else{
			%>
					if(parent.event_check()){
						goPopup(popgubun);
					}
			<%}%>
		}
	
		function goPopup(popgubun){
			<%if( chkUserGubun.equals("N")){ %>
				alert("이벤트를 이용하실 수 없습니다.\n\n신용카드이용회원에 한합니다.");
				return;
			<%}%>
			window.open('','popup', 'width=710px, height=575px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no');
			document.form1.popgubun.value = popgubun;
			document.form1.target="popup";
		    document.form1.action="/hp/im/et/evt002.do?method=getCouponPop&eventNo=<%=eventNo%>" 
		    document.form1.submit();
		}
	
		function goCampaign(){
			window.open("/2013campaign", 'popup', 'width=980,height=620, menubar=no, toolbar=no, location=no, status=no, scrollbars=no'); 
		}
	
	</script>
	
	
	</head>
	
	<body topmargin="0" leftmargin="0">
	
	<form name="form1" method="post">
	<input type="hidden" name="popgubun" value=""/>
	
	<img src="/images/et/coupon/event_coupon.jpg" alt="썬앳푸드 무료쿠폰 혜택" border="0" usemap="#Map" />
	<map name="Map" id="Map">
	  <area title="새창" shape="rect" coords="77,905,160,926" href="#" onclick="go_start('1'); return false"/>
	  <area title="새창" shape="rect" coords="396,906,478,926" href="#" onclick="go_start('2'); return false"/>
	  <area title="새창" shape="rect" coords="77,1057,161,1078" href="#" onclick="go_start('3'); return false"/>
	  <area title="새창" shape="rect" coords="396,1058,478,1079" href="#" onclick="go_start('4'); return false"/>
	  <area title="새창" shape="rect" coords="77,1208,161,1229" href="#" onclick="go_start('5'); return false"/>
	  <area title="새창" shape="rect" coords="395,1208,478,1230" href="#" onclick="go_start('6'); return false"/>
	  <area title="새창" shape="rect" coords="501,1496,659,1517" href="#" onclick="goCampaign(); return false"/>
	</map>
	
	</form>	
		
	</body>
	</html>