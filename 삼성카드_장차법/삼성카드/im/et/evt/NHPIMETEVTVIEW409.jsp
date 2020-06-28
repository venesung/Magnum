<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2011홈페이지 업그레이드 이벤트 - 삼성카드</title>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.scard.hp.common.util.*" %>
<%@ page import="com.scard.hp.im.et.evt.vo.RENEWALEV001VO" %>
<%@ page import="com.scard.hp.im.et.evt.vos.NHPIMETEVT001VOS" %>
<%@ page import="anyframe.common.Page" %> 
<%@ page import="java.util.*" %>
<%@ page import="com.scard.common.util.paging.*" %> 
<%@ page import="com.scard.common.util.RequestUtil"%>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event1_ok = (String)request.getAttribute("event1YN"); //이벤트참여여부1
	String event2_ok = (String)request.getAttribute("event2YN"); //이벤트참여여부2
	String event3_ok = (String)request.getAttribute("event3YN"); //이벤트참여여부3
	String event4_ok = (String)request.getAttribute("event4YN"); //이벤트참여여부4
	String event5_ok = (String)request.getAttribute("event5YN"); //이벤트참여여부5
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부 
	
	
	 String strStar ="";
	 String strContent ="";
	 String strName ="";
	 String strRegDate =""; 
	NHPIMETEVT001VOS vos = (NHPIMETEVT001VOS)request.getAttribute("vos");
   	ArrayList<RENEWALEV001VO> resultList = (ArrayList<RENEWALEV001VO>)vos.getListPage();
%>  
<style type="text/css"> 
span{color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
.btn, .btn span, .btn input {position:relative; display:inline-block; margin:0 6px 0 0; border:0 none; text-decoration:none !important; vertical-align:top; white-space:nowrap; overflow:visible}
.btn	{cursor:pointer; vertical-align:middle}
.paginate	{width:588px; margin-left:70px; float:left; display:inline; margin-bottom:10px; text-align:center; line-height:normal;}
.paginate	.paging	{text-align:center}  
.paginate	p.p_page	{display:none;height:0}
.btn_s_white	{background:url('/images/common/bg_button.png') no-repeat 0 -60px}
.btn_s_white span, .btn_s_white input {left:9px; height:21px; padding:0 10px 0 0; background:url('/images/common/bg_button.png') no-repeat right -60px; line-height:21px; font-size:11px; letter-spacing:-1px; cursor:pointer}
a	{color:#666; text-decoration:none}
a:link, a:visited	{text-decoration:none}
a:hover, a:active	{text-decoration:underline}

.paginate_line	{border-top:1px solid #F4F4F4} 
.paginate	.paging	.btn	{margin:0 9px 0 8px}
.paginate	.num	 {overflow:hidden}
.paginate	.num	 a:first-child	{background:0 none}
.paginate	.num	 a	{display:inline-block; width:20px; height:20px; background:url('/images/common/page_bar.png') no-repeat 0 center; font:normal 11px "돋움"; line-height:20px; text-align:center}
.paginate	.num	 strong	{height:20px; color:#333; font:bold 11px "돋움"; line-height:20px} 
.paginate	.btnr	{position:absolute; right:0; top:2px}
.paginate	.btnl	{position:absolute; left:0; top:2px}



body,div,ul,li,dl,dt,dd,ol,form {margin:0;padding:0;}
ul,ol,dl {list-style:none}
img {border:0; vertical-align:top;}
.t_org {color:#ff5a00; }

#upgrade {width:728px; margin:0 auto; position:relative;}
.upgrade_visual {width:728px; background:url(/images/et/renewal/upgrade_visual.jpg) 0 0 no-repeat; height:426px; text-indent:-9999px;}
.upgrade_visual p {margin:0;padding:0;}
.upgrade_visual ul {margin:0;padding:0; float:left;}
.upgrade_visual li {margin:0;padding:0; float:left;}

.event1_tit {width:728px; background:url(/images/et/renewal/event1_tit.jpg) 0 0 no-repeat; height:181px; text-indent:-9999px;}
.event1_tit p {margin:0;padding:0;}
.event1_quize {width:728px; background:url(/images/et/renewal/event1_quize.jpg) 0 0 no-repeat; height:216px; position:relative; }
.event1_quize dl {position:absolute; top:103px; left:120px; width:400px;}
.event1_quize dd {width:22px; height:15px; padding-top:2px; float:left; }
.event1_quize dt {float:left; width:75px; height:17px;}
.event1_quize dt.a1 {background:url(/images/et/renewal/event1_a1.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event1_quize dt.a2 {background:url(/images/et/renewal/event1_a2.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event1_quize dt.a3 {background:url(/images/et/renewal/event1_a3.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event1_quize dt.a4 {background:url(/images/et/renewal/event1_a4.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event1_quize .question {position:absolute; top:20px; left:120px; width:494px; height: 54px; text-indent:-9999px; background:url(/images/et/renewal/event1_q.jpg) 0 0 no-repeat;}
.event1_quize .btn {position:absolute; top:90px; left:538px;}
.event1_quize .hint1 {position:absolute; top:149px; left:120px;}
.event1_quize .hint2 {position:absolute; top:149px; left:373px;}
.event1_gift {width:728px; background:url(/images/et/renewal/event1_gift.jpg) 0 0 no-repeat; height:96px; text-indent:-9999px;}
.event1_gift p {margin:0;padding:0;}
.event1_gift ul {margin:0;padding:0; float:left;}
.event1_gift li {margin:0;padding:0; float:left;}


.event2_tit {width:728px; background:url(/images/et/renewal/event2_tit.jpg) 0 0 no-repeat; height:171px; text-indent:-9999px;}
.event2_tit p {margin:0;padding:0;}
.event2_quize {width:728px; background:url(/images/et/renewal/event2_quize.jpg) 0 0 no-repeat; height:209px; position:relative; }
.event2_quize dl {position:absolute; top:60px; left:120px; width:400px;}
.event2_quize dd {width:22px; height:25px; float:left; }
.event2_quize dt {float:left; width:178px; height:25px;}
.event2_quize dt.a1 {background:url(/images/et/renewal/event2_a1.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize dt.a2 {background:url(/images/et/renewal/event2_a2.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize dt.a3 {background:url(/images/et/renewal/event2_a3.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize dt.a4 {background:url(/images/et/renewal/event2_a4.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize dt.a5 {background:url(/images/et/renewal/event2_a5.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize dt.a6 {background:url(/images/et/renewal/event2_a6.jpg) 0 0 no-repeat; text-indent:-9999px;}
.event2_quize .question {position:absolute; top:20px; left:120px; width:415px; height: 16px; text-indent:-9999px; background:url(/images/et/renewal/event2_q.jpg) 0 0 no-repeat;}
.event2_quize .btn {position:absolute; top:93px; left:538px;}
.event2_quize .hint1 {position:absolute; top:153px; left:120px;}
.event2_gift {width:728px; background:url(/images/et/renewal/event2_gift.jpg) 0 0 no-repeat; height:102px; text-indent:-9999px;}
.event2_gift p {margin:0;padding:0;}
.event2_gift ul {margin:0;padding:0; float:left;}
.event2_gift li {margin:0;padding:0; float:left;}

.event3_tit {width:728px; background:url(/images/et/renewal/event3_tit.jpg) 0 0 no-repeat; height:197px; text-indent:-9999px;}
.event3_tit p {margin:0;padding:0;}
.event3_box_top {width:728px;  background:url(/images/et/renewal/event3_bx_top.jpg) 0 0 no-repeat; height:10px; margin-bottom:10px; float:left; display:inline}
.event3_box_cp {width:728px; background:url(/images/et/renewal/event3_bx_bg.jpg) bottom left no-repeat; padding-bottom:30px; float:left; display:inline }
.event3_list_tit {width:588px; height:26px; border-bottom:solid 1px #c9c9c9; background:url(/images/et/renewal/event3_smtit.jpg) 0 0 no-repeat; text-indent:-9999px; margin-left:70px; float:left; display:inline;}
.event3_list {width:588px;  margin-left:70px; float:left; display:inline; margin-bottom:10px;}
.event3_list li {border-bottom:solid 1px #c9c9c9; padding:8px 0; width:588px; float:left; display:inline; font-family:'dotum'; font-size:12px; color:#606060; }
.event3_list .star {float:left; height:20px; }
.event3_list .day {float:right; font-family:'dotum'; font-size:11px; color:#a7a6a6; height:20px;}
.event3_list .con {float:left; width:585px;}
.pagination3{ width:588px; margin-left:70px; float:left; display:inline; margin-bottom:10px; text-align:center; line-height:normal;}
 
.event3_smbox_top {width:587px;  background:url(/images/et/renewal/event3_smbx_top.jpg) 0 0 no-repeat; height:10px; float:left; display:inline;}
.event3_smbox_cp {width:587px; background:url(/images/et/renewal/event3_smbx_bg.jpg) bottom left no-repeat; padding-bottom:10px; margin-left:70px; float:left; display:inline;}
.event3_smbox_cp dl {margin-left:10px; float:left; }
.event3_smbox_cp dd {float:left; width:20px; height:20px; }
.event3_smbox_cp dt {float:left; width:90px; height:20px; }
.event3_smbox_cp dt.star1 {background:url(/images/et/renewal/star5.jpg) 0 2px no-repeat; text-indent:-9999px;}
.event3_smbox_cp dt.star2 {background:url(/images/et/renewal/star4.jpg) 0 2px no-repeat; text-indent:-9999px;}
.event3_smbox_cp dt.star3 {background:url(/images/et/renewal/star3.jpg) 0 2px no-repeat; text-indent:-9999px;}
.event3_smbox_cp dt.star4 {background:url(/images/et/renewal/star2.jpg) 0 2px no-repeat; text-indent:-9999px;}
.event3_smbox_cp dt.star5 {background:url(/images/et/renewal/star1.jpg) 0 2px no-repeat; text-indent:-9999px;}
.event3_smbox_cp .text_enter {background:url(/images/et/renewal/event3_input_bg.jpg) 0 0 no-repeat; width:563px; height:32px; position:relative; margin:8px 0 0 12px; float:left; display:inline;}
.event3_smbox_cp .text_enter .btn {position:absolute; top:0; right:0;  }
.event3_smbox_cp .text_enter input.reply {position:absolute; top:4px; left:5px; border:none; width:480px; background:#f7f8f8; padding:5px 0; font-family:'dotum'; font-size:11px; color:#999999;}

.sns {width:728px; background:url(/images/et/renewal/upgrade_sns.jpg) 0 0 no-repeat; height:172px; position:relative; float:left;}
.sns .facebook {position:absolute; top:79px; left:482px; }
.sns .twitter {position:absolute; top:79px; left:558px; }
.sns .me2day {position:absolute; top:79px; left:638px; }

.notice {width:728px; background:url(/images/et/renewal/upgrade_notice.jpg) 0 0 no-repeat; height:206px; position:relative; float:left; text-indent:-9999px;}
.notice p {margin:0;padding:0;}
.notice ul {margin:0;padding:0; float:left;}
.notice li {margin:0;padding:0; float:left;}
</style>

<script language="Javascript" type="text/Javascript">
<!--    
	//페이스북
	function pstFaceBook() { 
		var msg = "새로운 삼성카드 홈페이지 이벤트";
		var url = "https://www.samsungcard.com/html/et/renewal/fb.html";
		var href = "http://www.facebook.com/sharer.php?u=" + url + "&t=" + encodeURIComponent(msg);
		var a = window.open(href, 'facebook', '');
		if (a) {
			a.focus();
		} 
	}

	//트위터
	function pstTwitter() {
		var msg = "새로운 삼성카드 홈페이지 이벤트";
		var url = "http://me2.do/F54E9V";
		var href = "http://twitter.com/share?text=" + encodeURIComponent(msg) + "&url=" + encodeURIComponent(url);
		var a = window.open(href, 'twitter', '');
		if (a) {
			a.focus();
		}
	}

	//미투데이
	function pstMe2Day() {
		var msg = "새로운 삼성카드 홈페이지 이벤트";
		var url = "http://me2.do/F54E9V";
		var tag = "";
		var href = "http://me2day.net/posts/new?new_post[body]=\"" + encodeURIComponent(msg) + "\":" + encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag);
		var a = window.open(href, 'me2Day', '');
		if (a) {
			a.focus();
		}
	} 
  
	function CheckQuiz1()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%>
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>");
			<%}else if(event1_ok.equals("Y")){%>
			alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %> 

				var obj = document.getElementsByName("Quiz1"); 
				var okValue="";
	
				for ( i = 0; i < obj.length; i++ ){ 
					if(obj[i].checked){ 
						okValue = obj[i].value;
					}
				}
	
				if(okValue ==""){
					alert("정답을 선택해 주십시오."); 
					return;
				}
	
				if(okValue != "3")
				{
					if(window.confirm("오답입니다. 힌트를 보시겠습니까?")){ 
						window.open("https://www.samsungcard.com/showroom/scard.jsp","Gallery"); 
					}
				}
				else
				{
					ApplyEvent("1");
				}   
			<%}%>	
		<%}%> 
	}

	function CheckQuiz2()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%>
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>");
			<%}else if(event2_ok.equals("Y")){%>
			alert("이미 이벤트에 응모하셨습니다.");	
			<%}else{ %>
  
				var obj = document.getElementsByName("Quiz2");  
				var okValue="";
	
				for ( i = 0; i < obj.length; i++ ){ 
					if(obj[i].checked){ 
						okValue = obj[i].value; 
					}
				}
	
				if(okValue ==""){
					alert("정답을 선택해 주십시오."); 
					return;
				}
	
				if(okValue != "4")
				{
					if(window.confirm("오답입니다. 힌트를 보시겠습니까?")){ 
						window.open("https://www.samsungcard.com/cardsearch/cps.do?method=getIndexPage","Cardfind");
					}
				}
				else
				{
					ApplyEvent("2");
				}  

			<%}%>	
		<%}%> 
	}

	function CheckStar()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%>   
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>"); 
			<%}else{ %>
			
				var obj = document.getElementsByName("star"); 
				var checkCount = 0;
				for ( i = 0; i < obj.length; i++ ){ 
					if(obj[i].checked){
						checkCount = 1;
					}
				}
				if(checkCount == 0)
				{
					alert("별점을 선택해 주십시오.");
					return;
				}
				
				if(document.form.subject.value == "" || document.form.subject.value == "별점과 소감 등록을 위해선 로그인이 필요합니다. 최대 한글 40자, 영문 80자까지 입력 가능")
				{
					alert("덧글을 입력해  주십시오.");
					return; 
				} 
				ApplyStar(6);
			<%}%> 
		<%}%> 
	}
	
	function CheckFacebook()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%> 
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>"); 
			<%}else{ %>
				<%if(event3_ok.equals("Y")){%> 
					pstFaceBook();
				<%}else{ %> 
					ApplyEvent("3");  
				<%}%>	
			<%}%> 			
		<%}%> 
	}

	function CheckTwitter()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%> 
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>"); 
			<%}else{ %>		
				<%if(event4_ok.equals("Y")){%> 
					pstTwitter();
				<%}else{ %> 
					ApplyEvent("4"); 
				<%}%>	
			<%}%>				
		<%}%> 
	}

	function CheckMe2Day()
	{
		<%if(loginYN.equals("N")){%>
			parent.eventLogin('11622');
		<%}else{%>
			<%if( endDateYN.equals("N")){ %>
			alert("<%=endMsg %>");
			<%}else if( beginDateYN.equals("N")){ %>
			alert("<%=beginMsg %>"); 
			<%}else{ %>	
				<%if(event5_ok.equals("Y")){%> 
					pstMe2Day();
				<%}else{ %>  
					ApplyEvent("5");
				<%}%>	
			<%}%>				
		<%}%> 
	}
 
	function ApplyStar(gubun)
	{
		document.form.eventNo.value = "renewal201106030"+gubun;  
		document.form.target ="applyResultFrame";
		document.form.action = "/hp/im/et/evt003.do?method=EvnetInsertRenewalReply"; 	
		document.form.submit();  
		document.form.target = "_self";  
	}
	
	function ApplyEvent(gubun)
	{
		document.form.eventNo.value = "renewal201106030"+gubun;  
		document.form.target ="applyResultFrame";
		document.form.action = "/hp/im/et/evt003.do?method=EvnetInsertRenewal"; 	
		document.form.submit();  
		document.form.target = "_self";  
	}

	function applyed(){
		alert("이미 이벤트에 응모하셨습니다.");
	}
	
	function applyOk(){
		alert("이벤트 응모가 완료되었습니다");
		location.reload(); 
	}

	function applyOkReload(){
		alert("등록 되었습니다");
		location.reload();
		//parent.goDetail('11622','1');
	}
	
	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
  
	function byte_check() 
	{ 
	    var cont = document.form.subject; 
	    if(cont.value == "별점과 소감 등록을 위해선 로그인이 필요합니다. 최대 한글 40자, 영문 80자까지 입력 가능")
		    cont.value="";
		var i = 0; 
	    var cnt = 0; 
	    var exceed = 0; 
	    var ch = ''; 

	    for (i=0; i<cont.value.length; i++) { 
	        ch = cont.value.charAt(i); 
	        if (escape(ch).length > 4) { 
	            cnt += 2; 
	        } else { 
	            cnt += 1; 
	        } 
	    } 
 
	    if (cnt > 80) { 
	        exceed = cnt - 80; 
	        alert("최대 한글 40자, 영문 80자까지 입력이 가능합니다.\r\n작성하신 메세지 내용은 "+ exceed +"byte가 초과되었습니다.\r\n초과된 부분은 자동으로 삭제됩니다."); 
	        var tcnt = 0; 
	        var xcnt = 0; 
	        var tmp = cont.value; 
	        for (i=0; i<tmp.length; i++) { 
	            ch = tmp.charAt(i); 
	            if (escape(ch).length > 4) { 
	                tcnt += 2; 
	            } else { 
	                tcnt += 1; 
	            } 

	            if (tcnt > 80) { 
	                tmp = tmp.substring(0,i); 
	                break; 
	            } else { 
	                xcnt = tcnt; 
	            } 
	        } 
	        cont.value = tmp;  
	        return; 
	    } 
	}  
//-->
</script> 
</head>
<body style="margin:0;">
	<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="빈프레임"></iframe>
	<form name="form" method="post" target="_blank" action="">  
		<input type="hidden" name="eventNo" value=""/> 
		
<div id="upgrade">
  <div class="upgrade_visual">
    <p>2011홈페이지 업그레이드 이벤트</p>
    <p>삼성카드 홈페이지가 새로운 디자인과 기능들로 더욱 편리해 졌습니다. 한층 업그레이드 된 삼성카드 홈페이지를 지금 경험하세요!</p>
    <ul>
      <li>1. 간결하고 크리에이티브한 디자인</li>
      <li>2. 무엇이든 빠르게 찾을 수 있는 내비게이션과 퀵서치</li>
      <li>3. 다양한 방법으로 나에게 맞는 카드를 찾을 수 있는 카드 찾기 2.0</li>
      <li>4. 삼성카드의 대표 카드들을 작품처럼 둘러볼 수 있는 삼성카드 갤러리</li>
    </ul>
    <p>행사기간 : 2011. 6.3 ~ 2011.6.30</p>
    <p>행사대상 :삼성카드 웹 회원</p>
    <p>당첨자발표 : 2011. 7. 15 (홈페이지 내 공지)</p>
  </div>
  
  
  
  <!-- 이벤트1 -->
  <div class="event1_tit">
    <p>event01 삼성카드 갤러리와 퀵서치를 체험해 보세요</p>
    <p>삼성카드 갤러리 또는 퀵서치를 이용해 아래 문제의 답을 맞춰주세요. </p>
    <p>정답을 입력하신 분 중 추첨을 통해 푸짐한 선물을 드립니다!</p>
  </div>
  <div class="event1_quize"> <span class="question">삼성카드 S클래스는 삼성 관계사, 제휴사 가맹점에서 삼성 패밀리급 혜택을 누릴 수 있는 카드입니다. 이 카드로 최대 10%의 적립 혜택을 제공받기 위한 S선포인트의 한도 금액은 얼마일까요?</span>
    <dl>
      <dd>  
		<label><input type="radio" name="Quiz1" title="Quiz1" value="1"/></label>     
	  </dd>
      <dt class="a1">30만원</dt>
      <dd>
		<label><input type="radio" name="Quiz1" title="Quiz1" value="2"/></label>
	  </dd>
      <dt class="a2">40만원</dt>
      <dd>
		<label><input type="radio" name="Quiz1" title="Quiz1" value="3"/></label>
	  </dd>
      <dt class="a3">50만원</dt>
      <dd> 
		<label><input type="radio" name="Quiz1" title="Quiz1" value="4"/></label>  
	  </dd>
      <dt class="a4">60만원</dt>
    </dl>
    <span class="btn">
		<a href="javascript:CheckQuiz1();"><img src="/images/et/renewal/btn_answer.jpg"  alt="정답"  border="0"/></a>
    </span> <span class="hint1"><a href="https://www.samsungcard.com/showroom/scard.jsp" target="_blank"  title="새창"><img src="/images/et/renewal/event1_hint1.jpg" alt="힌트1"  border="0"/></a></span> <span class="hint2"><img src="/images/et/renewal/event1_hint2.jpg" alt="힌트2" /></span> </div>
  <div class="event1_gift">
    <p>경품내역</p>
    <ul>
      <li>1등 (1명) : [캐논] DSLR EOS600D</li>
      <li>2등 (3명) : 아이패드2 16기가</li>
      <li>3등 (100명) : CGV영화예매권 2매</li>
    </ul>
  </div>
  <!-- 이벤트1 -->
  
  
  
  <!-- 이벤트2 -->
  <div class="event2_tit">
    <p>event02 카드 찾기 2.0에 대해 얼마나 알고 계세요?</p>
    <p>카드 찾기2.0과 무관한 한 가지를 골라 주세요.</p>
    <p>정답을 제출하신 분 중 추첨을 통해 다양한 선물을 드립니다!</p>
  </div>
  <div class="event2_quize"> <span class="question">삼성카드 S클래스는 삼성 관계사, 제휴사 가맹점에서 삼성 패밀리급 혜택을 누릴 수 있는 카드입니다. 이 카드로 최대 10%의 적립 혜택을 제공받기 위한 S선포인트의 한도 금액은 얼마일까요?</span>
    <dl>
      <dd> 
		<label><input type="radio" name="Quiz2" title="Quiz2" value="1"/></label>
      </dd>
      <dt class="a1">혜택으로 찾기</dt>
      <dd>
		<label><input type="radio" name="Quiz2" title="Quiz2" value="2"/></label>
      </dd>
      <dt class="a2">제휴사로 찾기</dt>
      <dd>		
		<label><input type="radio" name="Quiz2" title="Quiz2" value="3"/></label>
      </dd>
      <dt class="a3">나만의 맞춤카드 추천</dt>
      <dd>		
		<label><input type="radio" name="Quiz2" title="Quiz2" value="4" /></label>
      </dd>
      <dt class="a4">많이 쓰는 카드로 찾기</dt>
      <dd>
		<label><input type="radio" name="Quiz2" title="Quiz2" value="5"/></label>
      </dd>
      <dt class="a5">간단설문 카드추천</dt>
      <dd>
		<label><input type="radio" name="Quiz2" title="Quiz2" value="6"/></label>
      </dd>
      <dt class="a6">키워드/태그로 찾기</dt>
    </dl>
    <span class="btn"> 
		<a href="javascript:CheckQuiz2();"><img src="/images/et/renewal/btn_answer.jpg"  alt="정답" border="0"/></a>
    </span> <span class="hint1"><a href="https://www.samsungcard.com/cardsearch/cps.do?method=getIndexPage" target="_blank"  title="새창"><img src="/images/et/renewal/event2_hint1.jpg" alt="힌트1" /></a></span></div>
  <div class="event2_gift">
    <p>경품내역</p>
    <ul>
      <li>1등 (1명) : 맥북 에어 기본형 11인치</li>
      <li>2등 (6명) : [네스카페] 돌체구스토 멜로디</li>
      <li>3등 (200명) : 베스킨라빈스1만원 상품권</li>
    </ul>
  </div>
  <!-- 이벤트2 -->
		  
		  
  <!-- 이벤트3 -->
  <div class="event3_tit">
    <p>event03 새로워진 홈페이지에 대한 소감 한마디 와 SNS 공유하기!</p>
    <p>업그레이드 된 홈페이지를 이용해 본 소감, 조금 더 바라는 점 등 다양한 소감 한마디를 덧글로 남기시거나, 본 이벤트를 sns로 공유하면 추첨을 통해 1,000분께 스타벅스 아이스 카페 라떼(Tall) 전자상품권(MMS 발송)를 드립니다. 두 가지 다 하면 당첨 확률은 두 배! </p>
  </div>
  <div class="event3_box_cp">
    <div class="event3_box_top"></div>
    <span class="event3_list_tit">소감 덧글 남기기</span>
    <ul class="event3_list">
			<%
   			if(resultList != null && resultList.size() > 0){
 				int num = vos.gettCnt()- ((vos.getcPage()-1) * 5);						   				
 				for(RENEWALEV001VO vo : resultList){  
   			%>  
		   		 <li><span class="star">
		   				<%if(vo.getItem04().equals("1")){%>
		   					<img src="/images/et/renewal/star1.jpg" alt="별1개" />
		   				<%} else if(vo.getItem04().equals("2")){%>
		   					<img src="/images/et/renewal/star2.jpg" alt="별2개" />
		   				<%} else if(vo.getItem04().equals("3")){%>
		   					<img src="/images/et/renewal/star3.jpg" alt="별3개" />
		   				<%} else if(vo.getItem04().equals("4")){%>
		   					<img src="/images/et/renewal/star4.jpg" alt="별4개" />
		   				<%} else if(vo.getItem04().equals("5")){%>
		   					<img src="/images/et/renewal/star5.jpg" alt="별5개" />									   					   					
		   				<%} %>
		   		</span>
		   		<span class="day"><%=vo.getItem03().substring(0, vo.getItem03().length() - 4)%>****  | 
				<%=vo.getItem05().substring(2,4)%>.<%=vo.getItem05().substring(4,6)%>.<%=vo.getItem05().substring(6,8)%> <%=vo.getItem05().substring(8,10)%>:<%=vo.getItem05().substring(10,12)%></span>
		   		<span class="con"><%=vo.getItem13()%></span></li> 
			<%	
   				}	
 				
 				 
				for(int i=0; i < 5 - resultList.size(); i++)
				{
			%>
				<li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			<%
				} 
			}else{ 
			 %>	
			 <li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			 <li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			 <li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			 <li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			 <li><span class="star"></span><span class="day"></span><span class="con"></span></li>
			<%} %>
			
		</ul> 
	<div class="paginate">
	<%if(resultList != null && resultList.size() >0){%>    
	${_page}   
	<%}%> 
	</div>
    <div class="event3_smbox_cp">
      <div class="event3_smbox_top"></div>
      <dl>
        <dd>
        	<input name="star" type="radio" value="5" />
       </dd>
        <dt class="star1"></dt>
        <dd>
          <input name="star" type="radio" value="4" />
        </dd>
        <dt class="star2"></dt>
        <dd>
          <input name="star" type="radio" value="3" />
        </dd>
        <dt class="star3"></dt>
        <dd>
          <input name="star" type="radio" value="2" />
        </dd>
        <dt class="star4"></dt>
        <dd>
          <input name="star" type="radio" value="1" />
        </dd>
        <dt class="star5"></dt>
      </dl>
      <div class="text_enter"> 
        <span class="btn"><a href="javascript:CheckStar();"><img src="/images/et/renewal/btn_input.jpg"  alt="등록" border="0"/></a></span> 
        <span><input type="text" class="reply" name="subject" onclick="byte_check();" onkeyup="byte_check();" value="별점과 소감 등록을 위해선 로그인이 필요합니다. 최대 한글 40자, 영문 80자까지 입력 가능"/></span> 
	  </div>
    </div>
  </div> 
  <!-- 이벤트3 --> 
  
  <div class="sns"> <span class="facebook">
    <a href="javascript:CheckFacebook();"><img src="/images/et/renewal/btn_facebook.jpg" alt="facebook" border="0"/></a>
    </span> <span class="twitter">
    <a href="javascript:CheckTwitter();"><img src="/images/et/renewal/btn_twitter.jpg" alt="twitter" border="0"/></a>
    </span> <span class="me2day">
    <a href="javascript:CheckMe2Day();"><img src="/images/et/renewal/btn_me2day.jpg" alt="me2day" border="0"/></a>
    </span> </div>
  <div class="notice">
    <p>알아두세요!</p>
    <ul>
      <li>1. 제세 공과금은 삼성카드가 부담합니다. </li>
      <li>2. 이벤트 당첨자는 삼성카드 홈페이지를 통해 발표 되며 전자상품권 당첨자를 제외한 당첨자에게 개별 연락 됩니다.</li>
      <li>3. 전자상품권은 회원 정보에 입력되어 있는 휴대폰 번호로 발송 됩니다.</li>
      <li>4. 당첨시 경품은 삼성카드 제휴 배송업체에 의해 이루어지며 배송을 위해 성명, 연락처, 주소 정보가 배송업체에 전달됩니다. 해당 정보는 경품 배송 이외 목적으로 사용되지 않습니다.</li>
      <li>5. 상기 행사는 카드사 및 제휴사의 사정에 따라 변경, 중단될 수 있으며 그 내용을 사전에 안내해 드립니다.</li>
      <li>6. 상품 및 경품은 이미지와 다를 수 있습니다.</li>
    </ul>
  </div>
</div>

	</form>  
</body>
</html>