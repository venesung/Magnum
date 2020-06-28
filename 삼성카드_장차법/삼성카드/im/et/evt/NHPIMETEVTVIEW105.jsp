 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="tab_title"></div>
<%@include file="/WEB-INF/jsp/common/tab_header.jsp" %>
<!-- SR내역 13.04.19 -->
<%@ page import="com.scard.common.web.LoginUtil"%>
<%  
	String loginYN = (String)request.getAttribute("loginYN"); 
%> 
<!-- //SR내역 13.04.19 -->
<!-- tab_script -->
<div id="tab_script">
 	<script type="text/javascript" src="/js/common-hp-validation.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/et.css" />
	
	<script type="text/javascript">
	
	function ScardSubmit(frm){
		//Xecure flag에 따라 본 함수 구현부 차별 출력 됨
		frm.submit();
		return false;
	}

	function goPopupResult()
	{
		//SR내역 13.04.19
		<% if(loginYN == "N") { %>
			scardLogin('/hp/im/et/evt002.do?method=getViewNHPIMETEVT105','eventLogin');
		<%}else{%>
			  var frmCP   = document.getElementById("iframe");
		      if(frmCP != null) {
		    	  document.inform.Query.value = "Y";
		          document.inform.action = '/hp/im/et/evt002.do?method=getLuck2UWin';
		          document.inform.target = 'iframe';
		          //document.inform.submit();
		          document.inform.submit();
		      }
		<%}%>
		////SR내역 13.04.19
	}

	function isValid() {
		// 2012.12.28 VOC 삭제 start
/*
		// 개인회원의 경우
		if (!checkPinNo(inform.txtSSNo1.value, inform.txtSSNo2.value)) {
			inform.txtSSNo1.blur() ;
			inform.txtSSNo1.focus() ;	
			return false;
		}else{
			inform.idenNo.value = inform.txtSSNo1.value + inform.txtSSNo2.value ;
			return true;
		}
*/
		// 2012.12.28 VOC 삭제 end
		// 2012.12.28 VOC 추가 start
		if(inform.txtSSNo1.value!=""&& inform.txtSSNo2.value!=""){
			// 개인회원의 경우
			if (!checkPinNo(inform.txtSSNo1.value, inform.txtSSNo2.value)) {
				//inform.txtSSNo1.blur() ;		// 20130411 웹접근성(장차법)  수정
				inform.txtSSNo1.focus() ;	
				return false;
			}else{
				inform.idenNo.value = inform.txtSSNo1.value + inform.txtSSNo2.value ;
				return true;
			}
		}else{
			alert("주민번호를 입력해주세요");
			//inform.txtSSNo1.blur() ;			// 20130411 웹접근성(장차법)  수정
			inform.txtSSNo1.focus() ;	
		}
		// 2012.12.28 VOC 추가 end
	}
	/*function autoResize(i)
	{
	    var iframeHeight=
	    (i).contentWindow.document.body.scrollHeight;
	    (i).height=iframeHeight+50;
	}*/	
		
	</script>
</div>

<!-- top_visual -->
<div class="top_visual">
<!-- 2012.12.28 VOC 삭제 추가 start -->
<!-- 	<h1><img src="/images/et/h1_event.png" alt="삼성카드와 다양한 이벤트를 즐기세요" /></h1> -->
	<h1><img src="/images/et/h1_event_4.gif" alt="럭투유카드" /></h1>
<!-- 2012.12.28 VOC 삭제 추가 end -->
</div>

<!-- content_block -->
<div class="content_block content_block_card">
	<div class="tab01 w810 h60">
		<ul id="tab">
<!-- 2012.12.28 VOC 삭제 start -->
<!-- 
            <li><a href="javascript:goTabPage('NHPIMETEVT001',true);return false;">진행중인 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT002',true);return false;">종료된 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT003',true);return false;">당첨자발표</a></li>
 -->
            <!--<li><a href="javascript:goTabPage('NHPIMETEVT101',true);return false;">생활영수증복권제도</a></li>
            -->
<!-- 
            <li class="on"><a href="javascript:goTabPage('NHPIMETEVT103',true);return false;">럭투유카드</a>
				<ul class="sub_tab">
                    <li><a href="javascript:goTabPage('NHPIMETEVT103',true);return false;">럭투유카드 안내</a></li>
                    <li><a href="javascript:goTabPage('NHPIMETEVT104',true);return false;">이용 및 혜택 안내</a></li>
                    <li class="on"><a href="javascript:goTabPage('NHPIMETEVT105',true);return false;">당첨여부확인</a></li>
				</ul>
			</li>
 -->
<!-- 2012.12.28 VOC 삭제 end -->
<!-- 2012.12.28 VOC 추가 start -->
            <li><a href="javascript:goTabPage('NHPIMETEVT103',true);">럭투유카드 안내</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT104',true);">이용 및 혜택 안내</a></li>
            <li class="on"><a href="javascript:goTabPage('NHPIMETEVT105',true);">당첨여부확인</a></li>
<!-- 2012.12.28 VOC 추가 end -->
		</ul>
	</div>
</div>

<!-- content_block -->
<div class="content_block content_block_card">
	<h2><img src="/images/et/h2_luck2u01.png" alt="럭투유 당첨여부를 확인 하세요" /></h2>
	<div class="content_block_inner">
		<!-- 100326 added -->
		<form name="inform" method="post" action="" autocomplete="off">
			<input type="hidden" name="idenNo" value="" />
			<input type="hidden" name="Query" value="" />
			<div class="tb_exp clfix">
				<span class="fl_left">이벤트 당첨여부를 확인하세요</span>
				<span class="ab_tr">
					<!--  <span class="t_desc03">주민등록번호</span>	SR내역 13.04.19
                    <span class="input_idno"><input name="txtSSNo1" id="txtSSNo1" type="text" class="txt" title="주민등록번호 앞자리" maxlength="6" onkeypress="checkTypes(this, 'NUMB');" onblur="checkTypesOnBlur(this, 'NUMB');" />&nbsp;-<input name="txtSSNo2" id="txtSSNo2" type="password" class="txt" maxlength="7" title="주민등록번호 뒷자리" onkeypress="checkTypes(this, 'NUMB');" onblur="checkTypesOnBlur(this, 'NUMB');" /></span> -->
<!-- 2012.12.28 VOC 삭제 start -->
<!-- 
					<span id="usafeon_txtSSNo1|txtSSNo2"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn_s_blue" href="javascript:goPopupResult();return false;" title="조회"><span>조회</span></a>
 -->
<!-- 2012.12.28 VOC 삭제 end -->
<!-- 2012.12.28 VOC 추가 start -->
					<span id="usafeon_txtSSNo1|txtSSNo2"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn_s_blue" href="javascript:goPopupResult();"><span>당첨자 조회</span></a><!-- SR내역 13.04.19 -->
<!-- 2012.12.28 VOC 추가 end -->
				</span>
			</div>
		</form>
		<!-- board_list -->
		<div class="board_list">
			<table class="dtable01" summary="번호, 매출월, 당첨월, 승인번호, 당첨내용으로 구성된 이벤트 목록"  >
				<caption style="display:none">종료된 이벤트</caption>
				<colgroup>
					<col width="10%" />
					<col width="12%" />
					<col width="12%" />
					<col width="12%" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="cell_l10" align="center">번호</th>
						<th scope="col" align="center">매출월</th>
						<th scope="col" align="center">당첨월</th>
						<th scope="col" align="center">승인번호</th>
						<th scope="col" class="cell_r10" style="text-align: center;">당첨내용</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="board_list">
			<iframe height="0" width="100%" name="iframe" frameborder="0" marginwidth="0"  scrolling="auto" title="이벤트목록 상세"></iframe>
		</div>
	</div>
</div>
<div class="content_block clfix">
	<h2><img alt="Lucky 7 서비스 안내입니다" src="/images/et/h2_luck2u02.png" /></h2>
	<div class="content_block_inner">
		<ol class="list_no01">
			<li><p>해외매출은 당첨대상에서 제외 됩니다.</p></li>
			<li><p>Luck2U plus 개인카드에 한하여 적용되며, 당첨산정일(매출월 기준 익월 10일경)까지 미접수 및 취소매출에 대해서는<br />당첨금이 인정되지 않습니다.</p></li>
			<li><p>5만원 이상 당첨되신 회원께는 소득세법에 따라 주민세/소득세(22%)를 공제하며,<br />
				   회원님의 당첨 산정월 익월 결제일 카드대금으로 우선 결제한 후,잔액에 대해서는 이후 카드 대금 또는 회원님 계좌로 지급 됩니다.</p></li>
			<li><p>매월 복권서비스 당첨자 및 당첨금액 안내는 당첨 산정월 15일경 홈페이지 &gt; 이벤트 &gt; <a href="javascript:goTabPage('NHPIMETEVT003',true)" class="a_point">당첨자발표</a> 및<br />고객센터(1588-8700)에서 확인 가능합니다.</p></li>
			<li><p>2009년 6월 까지 적용된 기존 복권서비스 당첨자의 당첨 내역은 고객센터(1588-8700) 에서만 확인 가능합니다.</p></li>
		</ol>
	</div>
</div>
<div class="content_block clfix">
	<h2><img alt="럭투유플러스카드 Birthday 서비스 안내입니다" src="/images/et/h2_luck2u03.png" /></h2>
	<div class="content_block_inner">
		<ol class="list_no01">
			<li><p>회원님의 카드신청시 기재하신 생일 월에 전국의 파리바게트 및 크라운 베이커리에서 케익 또는 기타 제과류 구입시<br />1만원 까지 할인서비스를 제공합니다.</p></li>
			<li><p>파리바게트 및 크라운베이커리에서는 정상금액이 승인되고, 결제대금 입금 시 1만원이 할인되어 청구됩니다.<br />(1만원 이상 이용 시 1만원 할인, 1만원 미만 이용 시 이용금액 만큼 할인)</p></li>
			<li><p>생일은 주민번호 또는 카드 신청 시 기재하신 실제생일 기준이며, 생일 월 2개월 전에 추첨 대상이 됩니다.<br />또한 반드시 상기 가맹점에서 생일월에 사용하셔야 할인이 됩니다.</p></li>
		</ol>
	</div>
</div>
<!--cms_content끝-->

			    <script type="text/javascript">
		    	safeonAddNumberField("inform","txtSSNo1|txtSSNo2");
			    </script>

<%@ include file="/WEB-INF/jsp/common/tab_footer.jsp" %>
