<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>삼성카드 프리미엄 쇼핑몰 12월 선물 기획전 - 삼성카드</title>
<%@ taglib tagdir="/WEB-INF/tags" prefix="fileTag" %>
<%
	String loginYN = (String)request.getAttribute("loginYN");

	String premiumYn = (String)request.getAttribute("premiumYn"); //프리미엄회원여부		
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
				//링크
				parent.parent.goTabPage('NHPIMMHPMS001M008', true);
		<%
			}
		%>
	}
	
</script>


</head>

<body style="margin:0;">
<img src="/images/et/event_christmas.jpg" alt="삼성카드 프리미엄 쇼핑몰 12월 선물 기획전" border="0" usemap="#open" />
<map name="open" id="open">
<area shape="rect" coords="150,370,288,398" href="#" onclick="go_start()" alt="더 많은 상품 보기" />
</map>
 <div class="hidden">
	<h1>프리미엄 쇼핑몰 12월 선물 기획전</h1>
	<dl>
		<dt>행사기간</dt>
		<dd>2012년 12월 3일(월) ~ 12월 31일(월)</dd>
		<dt>행사내용</dt>
		<dd>삼성카드 프리미엄 쇼핑몰에서 행사 상품을 구매시 프리미엄 특별가로 할인 혜택 제공</dd>
		<dt>행사상품</dt>
		<dd>
			<strong>감사한 부모님께</strong>
			- [브람스] 온열 스트레칭 안마의자 정상가 2,480,000원/할인가 1,190,000원
			- [정관장] 뿌리째 진한홍삼 70mlx30포, 홍삼원 70mlx20포 추가 증정 정상가 77,000원/할인가 61,500원
			- [GNC] 우먼스 울트라 메가(90정) 츄어블 비타민(90정) 추가 증정 정상가 67,000원/할인가 53,900원
		</dd>
		<dd>
			<strong>소중한 남편, 남자친구에게</strong>
			- [쌤소나이트] 서류가방 정상가 348,000원/할인가 195,000원
			- [구찌] 남성 지갑(10개 한정) 정상가 408,000원/373,000원
			- [탠디] 남성 장갑 정상가 75,000원/할인가 42,000원
		</dd>
		<dd>
			<strong>고마운 아내, 여자친구에게</strong>
			- [프라다] 백(10개 한정) 정상가 1,755,000원/할인가 1,498,000원
			- [로즈몽] 여성 손목 시계(40개 한정) 정상가 554,000원/할인가 380,000원
			- [탠디] 리본렉스목털 여성 지갑 정상가 98,000원/할인가 52,000원
		</dd>
		<dd>
			<strong>사랑스런 아내에게</strong>
			- [웅진씽크빅] 스토리빔(기본100편) + 유료컨텐츠 20편 정상가 399,000원/할인가 209,000원
			- [퓨처북] 로봇북 + 구름빵 세트 정상가 79,000원/할인가 53,800원
		</dd>
	</dl>
	<ul>
		<li>일부 행사상품은 한정수량으로, 조기 품절 될 수 있습니다.</li>
		<li>품절된 행사상품은 행사가격이 아닌 프리미엄몰 헤택가로 구매가 가능합니다.</li>
		<li>행사상품은 상품별로 1개씩만 구매가 가능합니다.(1개 상품 복수구매불가)</li>
		<li>카드사 및 제휴사의 사정으로 변경&middot;중단될 수 있으며, 그 내용을 사전에 알려드립니다.</li>
	</ul>
</div>

</body>

</html>

