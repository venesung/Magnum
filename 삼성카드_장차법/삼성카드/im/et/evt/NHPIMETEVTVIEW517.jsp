<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>대한민국 화이팅! 금메달 기원 Quiz 이벤트 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	String event_ok = (String)request.getAttribute("eventYN"); //이벤트참여여부
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String userName = (String)request.getAttribute("userName");
	String item03 = (String)request.getAttribute("item03");
	String item04 = (String)request.getAttribute("item04");
	String item05 = (String)request.getAttribute("item05");
	
%>
<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:top; font-size:0; line-height:0}
p {margin:0; padding:0}
#lay_1{display:none; position:absolute; z-index:2; left:100px; top:700px; width:530px; height:346px;}
#lay_1 .pop_l_wrap{background: url("/images/et/olympic201207/lay_popbg.png") no-repeat left top; width: 530px; height: 346px; position: relative;}

#lay_2{display:none; position:absolute; z-index:2; left:100px; top:700px; width:530px; height:346px;}
#lay_2 .pop_l_wrap{background: url("/images/et/olympic201207/lay_popbg.png") no-repeat left top; width: 530px; height: 346px; position: relative;}

.pop_l_wrap .btn_close{background-position: left top; height: 16px; right: 19px; top: 14px; width: 14px; position: absolute;}
.pop_l_wrap .img_l_pop{background:url("/images/et/olympic201207/closebtn.png") no-repeat 0 0; overflow: hidden; z-index: 513;}
.btn_input{border: 0 none; cursor:pointer; overflow: hidden; text-indent: -5000px;}


#wrap{width: 728px; overflow: hidden;}
.pop_title01 {text-align: center; padding: 40px 0 0 0;}
.pop_btn01 {text-align: center; padding: 43px 0 0 0;}
.pop_btn02 {text-align: center; padding: 43px 0 0 0;}
.pop_text {text-align: center; padding: 16px 0 0 0;}
.pop_text span{color: #5a96c8; font-weight: bold;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>

<script type="text/javascript" language="javascript">
	
	function go_start() {
		<% 
			if(loginYN.equals("N")){ 
		%>
			parent.eventLogin('28587');
		<%
			}else{
		%>
		
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
			<%}else if(event_ok.equals("Y")){%>
				alert("이미 응모 하셨습니다.");	
		  	<%}else{ %>
		  		
			  	document.evtFrm.target = "applyResultFrame";
				document.evtFrm.submit();
			
			<% } %>	
				  	
						
		<%
			}
		%>
	}

	function go_startm() {
		<% 
			if(loginYN.equals("N")){ 
		%>
		parent.eventLogin('28587');
		<%
			}else{
		%>
		
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		document.evtFrm.eventgubun.value='m';
		  		document.evtFrm.target = "applyResultFrame";
				document.evtFrm.submit();

			<% } %>	
				  	
						
		<%
			}
		%>
	}
	

	function layeropen(num){
		<% 
			if(loginYN.equals("N")){ 
		%>
		parent.eventLogin('28587');return;
		<%
			}
		%>
		<%if( endDateYN.equals("N")){ %>
		alert("<%=endMsg %>");
		return;
		<%}else if( beginDateYN.equals("N")){ %>
	  	alert("<%=beginMsg %>");
	  	return;
  		<%}%>
		for (i=1; i<3; i++)	{
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
	function applyOk(){
		<%if(event_ok.equals("Y")){%>
		alert("정상적으로 수정 되었습니다.\n감사합니다.");
		<%} else { %>
		alert("정상적으로 응모 되었습니다.\n감사합니다.");
		<%} %>
		location.reload();
	}

	function applyNo(){
		alert("이벤트 응모가 실패하였습니다.");
	}
	
</script>


</head>

<body>
<iframe id="applyResult" name="applyResultFrame" height="0" width="0" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" title="컨텐츠 프레임"></iframe>
<form id="evtFrm" name="evtFrm" action="/hp/im/et/evt.do?method=OlympicInsert" method="post">
<input type="hidden" name="eventgubun" value=""/>
<input type="hidden" name="eventNo" value=""/>
<input type="hidden" name="selgift" value=""/>
<img src="/images/et/olympic201207/120620_event.jpg" alt="대한민국 국가대표팀을 응원합니다. 대한민국 화이팅! 금메달 기원, QUIZ 이벤트" />

	<div class="hidden">
		<p>대한민국 국가대표팀을 응원합니다.</p>
		<h1>대한민국 화이팅! 금메달 기원 Quiz 이벤트</h1>
		<p>세계 하늘로 애국가가 울려 퍼지는 기분 좋은 상상 삼성카드가 국가대표팀을 응원합니다.</p>
		
		<dl>
			<dt>행사기간</dt>
			<dd>2012년 7월 1일(일) ~ 7월 26일(목)</dd>
			<dt>행사대상</dt>
			<dd>행사기간 동안 일시불 및 할부로 50만원 이상 이용하신 회원</dd>
			<dt>행사내용</dt>
			<dd>아래 3가지 퀴즈를 맞추신 모든 회원님들께 10,000 서비스포인트를 드리며, 그 중에서 추첨을 통해 100분께 다양한 경품 제공</dd>
		</dl>
		
		<ul>
			<li>Quiz1 - 삼성카드 모델 박태환은 금메달을 획득할 수 있을까요?</li>
			<li>Quiz2 - 국가대표팀이 획득할 금메달 개수는 총 몇 개일까요?</li>
			<li>Quiz3 - 국가대표팀의 종합 순위는 몇 등일까요?</li>
		</ul>
		
		<dl>
			<dt>행사경품</dt>
			<dd>
				<p>3가지 퀴즈를 모두 맞추시면?</p>
				<ul>
					<li>추첨 1등(1명) - 다이슨 에어 멀티 플라이어</li>
					<li>추첨 2등(3명) - 에버랜드 자유이용권 2매</li>
					<li>추첨 3등(96명) - GS칼텍스 10,000원 주유쿠폰(100명)</li>
					<li>100%경품 - 10,000P 서비스 포인트</li>
				</ul>
			</dd>
			<dt>당첨자 발표</dt>
			<dd>2012년 8월 17일(금) 삼성카드 홈페이지 당첨자 발표란 게시</dd>
			<dt>포인트 및 경품 제공일</dt>
			<dd>2012년 8월 24일</dd>
		</dl>
		
		<p>주의사항</p>
		
		<ul>
			<li>- 당첨된 경품의 제세공과금(22%)은 회원님 본인 부담입니다.</li>
			<li>- 법인/체크/선불/올앳/기프트카드는 제외됩니다.</li>
			<li>- 카드사 및 제휴사의 사정으로 변경 중단 될 수 있으며, 그 내용을 사전에 알려 드립니다.</li>
		</ul>
		
		
	</div>


<p style="position:absolute;left:300px;top:1070px;">
<%if(event_ok.equals("Y")){%>
<a  href="javascript:layeropen(2);"><img src="/images/et/olympic201207/btn_modify.png" alt="수정하기"  border="0"/></a>
<%} else { %>
<a  href="javascript:layeropen(1);"><img src="/images/et/olympic201207/btn_apply2.png" alt="응모하기"  border="0"/></a>
<%} %>

</p>
<div id="wrap">
  <div id="lay_1">
  <%if(event_ok.equals("N")){%>
		<div class="pop_l_wrap">
			<input type="button" title="퀴즈이벤트 레이어 닫기" value="레이어닫기" onclick="this.parentNode.parentNode.style.display='none'; show_select();" class="img_l_pop btn_close btn_input" />
			<p class="pop_title01"><img src="/images/et/olympic201207/txt_lay01.png" alt="국가대표팀을 응원합니다.! 대한민국 화이팅!" /></p>
			
            <table width="470" style="margin:30px 30px 0 30px; border-top:1px solid #dbdbdb;border-bottom:1px solid #dbdbdb;" summary="국가대표팀 관련 퀴즈이벤트입니다.">
				<caption class="hidden">퀴즈이벤트</caption>
      			<colgroup><col width="80%" /><col width="20%" /></colgroup>
            	<tbody>
                	<tr>
                    	<td style="letter-spacing:-1px;height:30px;" ><strong>QUIZ 1.</strong> 삼성카드 모델 &gt;박태환&lt;은 금메달을 획득할 수 있을까요?</td>
                    	<td><select name="item03">
                        	<option value="y" selected="selected" title="네">네</option>
                            <option value="n" title="아니오">아니오</option>
                        </select></td>
                    </tr>
                    <tr>
                    	<td style="letter-spacing:-1px;height:30px;"><strong>QUIZ 2.</strong> 국가대표팀이 획득할 금메달 개수는 총 몇 개일까요?</td>
                    	<td><select name="item04" title="국가대표팀이 획득할 금메달 개수는 총 몇 개일까요?">
                        	<option value="01" selected="selected">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
                      </select> 개</td>
                    </tr>
                    <tr>
                    	<td style="letter-spacing:-1px;height:30px;"><strong>QUIZ 3.</strong> 국가대표팀의 종합 순위는 몇 등일까요?</td>
                    	<td><select name="item05" title="국가대표팀의 종합 순위는 몇 등일까요?">
                        	<option value="01" selected="selected">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
                      </select> 등</td>
                    </tr>
                </tbody>
            </table>
            
            <p class="pop_btn01"><a href="#" onclick="go_start();return false;"><img src="/images/et/olympic201207/btn_apply.png" alt="응모하기" /></a></p>
		</div>
		<%} %>
  </div>
	
  <div id="lay_2">
  <%if(event_ok.equals("Y")){%>
	<div class="pop_l_wrap">
			<input type="button" title="퀴즈이벤트 레이어 닫기" value="레이어닫기" onclick="this.parentNode.parentNode.style.display='none'; show_select();" class="img_l_pop btn_close btn_input" />
			<p class="pop_title01"><img src="/images/et/olympic201207/txt_lay01.png" alt="국가대표팀을 응원합니다.! 대한민국 화이팅!" /></p>
            <table width="470" style="margin:30px 30px 0 30px; border-top:1px solid #dbdbdb;border-bottom:1px solid #dbdbdb;" summary="국가대표팀 관련 퀴즈이벤트입니다.">
				<caption class="hidden">퀴즈이벤트</caption>
     			<colgroup><col width="80%" /><col width="20%" /></colgroup>
            	<tbody>
                	<tr>
                    	<td style="letter-spacing:-1px;height:30px;"><strong>QUIZ 1.</strong> 삼성카드 모델 &gt;박태환&lt;은 금메달을 획득할 수 있을까요?</td>
                    	<td><select name="item03">
                        	<option value="y" <%="y".equals(item03)?"selected='selected'":"" %>>네</option>
                            <option value="n" <%="n".equals(item03)?"selected='selected'":"" %>>아니오</option>
                        </select></td>
                    </tr>
                    <tr>
                    	<td style="letter-spacing:-1px;height:30px;"><strong>QUIZ 2.</strong> 국가대표팀이 획득할 금메달 개수는 총 몇 개일까요?</td>
                    	<td><select name="item04">
							<option value="01" <%="01".equals(item04)?"selected='selected'":"" %>>01</option>
							<option value="02" <%="02".equals(item04)?"selected='selected'":"" %>>02</option>
							<option value="03" <%="03".equals(item04)?"selected='selected'":"" %>>03</option>
							<option value="04" <%="04".equals(item04)?"selected='selected'":"" %>>04</option>
							<option value="05" <%="05".equals(item04)?"selected='selected'":"" %>>05</option>
							<option value="06" <%="06".equals(item04)?"selected='selected'":"" %>>06</option>
							<option value="07" <%="07".equals(item04)?"selected='selected'":"" %>>07</option>
							<option value="08" <%="08".equals(item04)?"selected='selected'":"" %>>08</option>
							<option value="09" <%="09".equals(item04)?"selected='selected'":"" %>>09</option>
							<option value="10" <%="10".equals(item04)?"selected='selected'":"" %>>10</option>
							<option value="11" <%="11".equals(item04)?"selected='selected'":"" %>>11</option>
							<option value="12" <%="12".equals(item04)?"selected='selected'":"" %>>12</option>
							<option value="13" <%="13".equals(item04)?"selected='selected'":"" %>>13</option>
							<option value="14" <%="14".equals(item04)?"selected='selected'":"" %>>14</option>
							<option value="15" <%="15".equals(item04)?"selected='selected'":"" %>>15</option>
							<option value="16" <%="16".equals(item04)?"selected='selected'":"" %>>16</option>
							<option value="17" <%="17".equals(item04)?"selected='selected'":"" %>>17</option>
							<option value="18" <%="18".equals(item04)?"selected='selected'":"" %>>18</option>
							<option value="19" <%="19".equals(item04)?"selected='selected'":"" %>>19</option>
							<option value="20" <%="20".equals(item04)?"selected='selected'":"" %>>20</option>
                      </select> 개</td>
                    </tr>
                    <tr>
                    	<td style="letter-spacing:-1px;height:30px;"><strong>QUIZ 3.</strong> 국가대표팀의 종합 순위는 몇 등일까요?</td>
                    	<td><select name="item05">
							<option value="01" <%="01".equals(item05)?"selected='selected'":"" %>>01</option>
							<option value="02" <%="02".equals(item05)?"selected='selected'":"" %>>02</option>
							<option value="03" <%="03".equals(item05)?"selected='selected'":"" %>>03</option>
							<option value="04" <%="04".equals(item05)?"selected='selected'":"" %>>04</option>
							<option value="05" <%="05".equals(item05)?"selected='selected'":"" %>>05</option>
							<option value="06" <%="06".equals(item05)?"selected='selected'":"" %>>06</option>
							<option value="07" <%="07".equals(item05)?"selected='selected'":"" %>>07</option>
							<option value="08" <%="08".equals(item05)?"selected='selected'":"" %>>08</option>
							<option value="09" <%="09".equals(item05)?"selected='selected'":"" %>>09</option>
							<option value="10" <%="10".equals(item05)?"selected='selected'":"" %>>10</option>
							<option value="11" <%="11".equals(item05)?"selected='selected'":"" %>>11</option>
							<option value="12" <%="12".equals(item05)?"selected='selected'":"" %>>12</option>
							<option value="13" <%="13".equals(item05)?"selected='selected'":"" %>>13</option>
							<option value="14" <%="14".equals(item05)?"selected='selected'":"" %>>14</option>
							<option value="15" <%="15".equals(item05)?"selected='selected'":"" %>>15</option>
							<option value="16" <%="16".equals(item05)?"selected='selected'":"" %>>16</option>
							<option value="17" <%="17".equals(item05)?"selected='selected'":"" %>>17</option>
							<option value="18" <%="18".equals(item05)?"selected='selected'":"" %>>18</option>
							<option value="19" <%="19".equals(item05)?"selected='selected'":"" %>>19</option>
							<option value="20" <%="20".equals(item05)?"selected='selected'":"" %>>20</option>
                      </select> 등</td>
                    </tr>
                </tbody>
            </table>
            <p class="pop_btn02"><a href="#" onclick="go_startm();return false;"><img src="/images/et/olympic201207/btn_reapply.png" alt="수정하기" /></a></p>
	</div>
	<%} %>
	</div>
	
</div>

<script type="text/javascript" src="/js/common.js"></script>
</form>
</body>

</html>

