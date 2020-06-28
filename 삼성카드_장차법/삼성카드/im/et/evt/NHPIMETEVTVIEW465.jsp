<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬엘리자벳 1+1 이벤트 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");
	
	String beginDateYN = (String)request.getAttribute("beginDateYN"); //이벤트 응모가능기간여부
	String endDateYN = (String)request.getAttribute("endDateYN"); //이벤트 응모가능기간여부
	String beginMsg = (String)request.getAttribute("beginMsg"); //이벤트 응모가능기간여부
	String endMsg = (String)request.getAttribute("endMsg"); //이벤트 응모가능기간여부
	String eventNo = (String)request.getAttribute("eventNo"); //이벤트 No	
	String userName = (String)request.getAttribute("userName");
	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
	//String dupEventB = (String)request.getAttribute("dupEventB");
	
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

		<%
			}else{
		%>
			<%if( premiumYn.equals("N")){ %>
			alert("프리미엄 회원을 위한 전용 이벤트입니다.\n회원님께서도 삼성카드 프리미엄 회원으로 꼭 선정되시어 \n풍성한 혜택과 서비스를 누리시기 바랍니다. ");
			return ;
			<%}%>
		
			<%if( endDateYN.equals("N")){ %>
				alert("<%=endMsg %>");
				return;
			<%}else if( beginDateYN.equals("N")){ %>
			  	alert("<%=beginMsg %>");
			  	return;
		  	<%}else{ %>
		  		
				//링크
				window.open("http://ticket.interpark.com/Partner/Gate/NonMemberBookingGate.asp?sp1=16295&sp2=12003091","","");
			<% } %>	
				  	
						
		<%
			}
		%>
	}


</script>


</head>

<body>



<img src="/images/et/premusical201203/event_musical.jpg" alt="뮤지컬엘리자벳" border="0" usemap="#sfc" />

<div class="hidden">
	<h1>뮤지컬 엘리자벳</h1>
	<p>가치에 실속을 더한 1+1문화 혜택, 삼성카드 셀렉트! 죽음마저 사랑에 빠지게 한 아름다운 황후의 파란만장한 삶을 그린 2012년 대한민국 명품 뮤지컬, 엘리자벳으로 초대합니다.</p>
	
	<dl>
		<dt>공연일시</dt>
		<dd>2012년 3월 21일(수) 오후 8시 / 2012년 3월 22일(목) 오후 8시</dd>
		<dt>공연장소</dt>
		<dd>블루스퀘어 삼성전자홀</dd>
		<dt>행사내용</dt>
		<dd>삼성카드로 결제 시 1+1 혜택</dd>
		<dt>티켓가격</dt>
		<dd>D.Class 140,000원 / VIP석 200,000원 / R석 100,000원 / S석 80,000원 / A석 50,000원 / B석 30,000원</dd>
		<dt>티켓오픈</dt>
		<dd>
			<ul>
				<li>프리미엄 회원 오픈 : 3월 7일 (수) 오후2시</li>
				<li>일반회원 오픈 : 3월 8일 (목) 오후 2시</li>
				<li>-3월 8일 오후 1시-2시는 시스템 점검관계로 예매가 잠시 불가하며, 일반 회원에게 오픈되는 3월 8일 이후에도 프리미엄 회원은 계속 예매하실 수 있습니다.</li>
			</ul>
		</dd>
		<dt>문의처</dt>
		<dd>삼성카드 대표전화 1588-8700</dd>
	</dl>
	
	<p>캐스팅</p>
	
	<table summary="캐스팅안내 표 - 날짜, 엘리자벳, 토드, 루케니, 요제프, 조피, 루돌프가 있습니다.">
	<caption>캐스팅안내</caption>
		<colgroup>
			<col width="*" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">날짜</th>
				<th scope="col">엘리자벳</th>
				<th scope="col">토드</th>
				<th scope="col">루케니</th>
				<th scope="col">요제프</th>
				<th scope="col">조피</th>
				<th scope="col">루돌프</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>3/21(수)</td>
				<td>김선영</td>
				<td>김준수</td>
				<td>최민철</td>
				<td>민영기</td>
				<td>이정화</td>
				<td>김승대</td>
			</tr>
			<tr>
				<td>3/22(목)</td>
				<td>옥주현</td>
				<td>류정한</td>
				<td>김수용</td>
				<td>윤영석</td>
				<td>이태원</td>
				<td>김승대</td>
			</tr>
		</tbody>
	
	</table>
	
	<ul>
		<li><a href="#none" onclick="window.open('/html/et/prealiz/pop.html','poppre201203','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');" title="공연정보 자세히 보기 바로가기">공연정보 자세히 보기</a></li>
        <li><a href="#none" onclick="go_start();return false;" title="티켓예매 바로가기">티켓예매 바로가기</a></li>
	</ul>
	
	<ul>
		<li>- 본 공연은 한정 수량 판매로 인해 조기 종료 될 수 있으니, 예매를 서둘러 주시기 바랍니다.</li>
		<li>- 본 공연의 티켓은 삼성카드(신용카드/체크카드/법인카드)로 1인 2매까지 구입하실 수 있으며, 2매 구입 시 4매가 제공됩니다.(올앳, 기프트 카드 제외) </li>
		<li>- 만 7세 미만의 미취학 아동은 관람할 수 없으며, 관람 연력이 되는 어린이도 티켓을 구입해야 입장할 수 있습니다.</li>
		<li>- 구입하신 티켓을 분실하실 경우 입장 하실 수 없습니다.</li>
		<li>- 예매처를 통한 정식 구입 절차를 거치지 않은 티켓은 취소 및 환불이 되지 않습니다.</li>
		<li>- 티켓을 변경, 취소, 환불은 인터파크 티켓을 통해서만 가능합니다.</li>
		<li>- 본 공연은 카드사 및 제휴사의 사정으로 변경, 중단될 수 있으며 그 내용을 사전에 알려드립니다.</li>
		<li>- 티켓은 공연당일 일자 변경 및 환불이 불가합니다.</li>
		<li>- 예매처를 통한 정식 구매 절차를 걸치지 않은 티켓은 취소, 환불이 불가능 하며 이로 인한 문제 발생 시 삼성카드와 제작사는 책임을 지지 않습니다.</li>
		<li>- 캐스팅은 기획사의 사정에 의해 변경될 수 있습니다. </li>
		<li></li>
	</ul>

</div>

<map name="sfc" id="sfc">
<!-- 120224 수정 -->
  <area shape="rect" coords="380,1431,565,1469"  alt="티켓예매 바로가기" href="javascript:go_start();" />
  <area shape="rect" coords="165,1430,370,1469" href="#" onclick="window.open('/html/et/prealiz/pop.html','poppre201203','menubar=0,resizable=0,scrollbars=0,width=710,height=575,left=0,top=0');" alt="공연정보 자세히 보기" title="새창" />
<!-- //120224 수정 -->
</map>

</body>

</html>

