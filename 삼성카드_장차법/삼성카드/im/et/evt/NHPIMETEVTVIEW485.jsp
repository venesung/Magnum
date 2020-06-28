<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>뮤지컬 캐치미이프유캔 1+1 이벤트 - 삼성카드</title>
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
				window.open("http://ticket.interpark.com/Partner/Gate/NonMemberBookingGate.asp?sp1=16456&sp2=12005565","","");
					
			<% } %>	
				  	
						
		<%
			}
		%>
	}


</script>


</head>

<body>



<img src="/html/et/premusical/images/120323_select4_premium.jpg" alt="뮤지컬 캐치미이프유캔" border="0" usemap="#select4" />

	<div class="hidden">
		<h1>뮤지컬 캐치미 이프유 캔</h1>
		<p>가치에 실속을 더한 1+1 문화 혜택 삼성카드 셀렉트! 토니어워즈 4개 부분 노미네이트 남우주연상 수상의 브로드웨이 최신 뮤지컬 전 세게를 사로잡은 재미와 감동을 함께 느껴보세요</p>
		
		<dl>
			<dt>공연일시</dt>
			<dd>2012년 5월 15일 (화) 오후 8시 / 2012년 5월 16일 (수) 오후 8시</dd>
			<dt>공연장소</dt>
			<dd>블루스퀘어 삼성카드홀</dd>
			<dt>행사내용</dt>
			<dd>삼성카드로 결제 시 1+1혜택</dd>
			<dt>티켓가격</dt>
			<dd>First석 120,000원 / Business석 100,000 / Economy석 60,000원</dd>
			<dt>티켓오픈</dt>
			<dd>
				<p>프리미엄 회원오픈 : 4월 17일(화) 오후 2시</p>
				<p>일반회원오픈 : 4월 18일(수) 오후 2시 </p>
				<p>4월 18일 오전 11시~ 2시 시스템점검관계로 예매가 잠시 불가하며, 일반회원에게 오픈되는 4월 18일 오후 2시 이후에도 프리미엄 회원은 계속 예매하실 수 있습니다.</p>
			</dd>
			<dt>문의</dt>
			<dd>삼성카드 대표전화 1588-8700</dd>
		</dl>
		
		<table summary="캐스팅안내표 - 날짜, 프랭크, 해너티, 프랭크시니어 피올라 브랜다가 있습니다.">
		<caption>캐스팅안내표</caption>
			<thead>
				<tr>
					<th>날짜 </th>
					<th>프랭크</th>
					<th>해너티</th>
					<th>프랭크시니어</th>
					<th>피올라</th>
					<th>브랜다</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>5/15(화)</td>
					<td>규현</td>
					<td>이건명</td>
					<td>이희정</td>
					<td>전수경</td>
					<td>최우리</td>
				</tr>
				<tr>
					<td>5/16(수)</td>
					<td>Key</td>
					<td>이건명</td>
					<td>이정열</td>
					<td>서지영</td>
					<td>최우리</td>
				</tr>
			</tbody>		
		</table>
		
		<ul>
			<li><a href="#none" onclick="window.open('/html/et/premusical/mevent_pop.html', 'popup', 'width=710px, height=600px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" title="새창">관련정보 자세히 보기</a></li>
			<li><a href="#none" onclick="go_start();">티켓예매 바로가기</a></li>
			<li><a href="http://ticket.interpark.com/Partner/Gate/NonMemberMyPage.asp?BizCode=16456" target="_blank" title="새창">예매확인 및 취소하기</a></li>
		</ul>
		
		<ul>
			<li>- 1+1혜택은 동일 날짜, 동일 등급으로 받으실 수 있습니다.</li>
			<li>- 티켓은 한정 수량 판매로 인해 조기 종료될 수 있으니, 예매를 서둘러 주시기 바랍니다.</li>
			<li>- 티켓은 삼성카드(신용/체크/법인카드)로 1인 2매까지 구입하실 수 있으며, 2매 구입 시 4매가 제공됩니다.(올앳/선불/기프트카드 제외)</li>
			<li>- 만 7세 미만의 미취학 아동은 관람할 수 없으며, 관람 연령이 되는 어린이는 티켓을 구입해야 입장할 수 있습니다.</li>
			<li>- 티켓을 분실하실 경우 입장하실 수 없습니다.</li>
		</ul>
		
		
	</div>



	<map name="select4" id="select4">
        <area shape="rect" coords="58,1647,264,1685" href="#" onclick="window.open('/html/et/premusical/mevent_pop.html', 'popup', 'width=710px, height=600px, menubar=no, toolbar=no, location=no, status=no, scrollbars=no')" alt="관련정보 자세히 보기" title="새창" />
		<area shape="rect" coords="273,1647,457,1685" href="javascript:go_start();" alt="티켓예매 바로가기" />
		<area shape="rect" coords="467,1647,671,1684" href="http://ticket.interpark.com/Partner/Gate/NonMemberMyPage.asp?BizCode=16456" target="_blank" title="새창" alt="예매확인 및 취소하기" />
	</map>
	
	
</body>

</html>

