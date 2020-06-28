 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@include file="/WEB-INF/jsp/common/tab_header.jsp" %>
<div id="tab_title"></div>


<!-- tab_script -->
<div id="tab_script">
	<link rel="stylesheet" type="text/css" href="/css/et.css" />
	<script type="text/javascript" src="/js/common-hp-util.js"></script>
	<script type="text/javascript" src="/js/common-hp-validation.js"></script>
	<script type="text/javascript" src="/js/common-hp.js"></script>
	<script type="text/javascript">
		function $tabOnLoad() {
			self.document.frm.rdoSelect(0).checked = true ;
			rdoSelect_onclick(0) ;
		}

		function rdoSelect_onclick(idx) {
			var a1 = document.getElementById('cidDl001');
			var a2 = document.getElementById('cidDl002');
			
			if ( idx == 0 ) {
				// 주민등록번호를 입력가능하게 변경하는 부분
			
				a1.style.display = "block";
				document.frm.txtSSNo1.value = "" ;
				document.frm.txtSSNo2.value = "" ;

				// 가맹점사업자번호를 입력불가능하게 변경하는 부분
				a2.style.display = "none";
				document.frm.txtBusiness_Reg_No1.value = "" ;
				document.frm.txtBusiness_Reg_No2.value = "" ;
				document.frm.txtBusiness_Reg_No3.value = "" ;

				// focus를 이동하는 부분
				// 20130411 웹접근성(장차법)  수정
				//document.frm.txtSSNo1.blur() ;
				//document.frm.txtSSNo1.focus() ;
			} else if ( idx == 1 ) {
				// 주민등록번호를 입력불가능하게 변경하는 부분
				a1.style.display = "none";
				document.frm.txtSSNo1.value = "" ;
				document.frm.txtSSNo2.value = "" ;

				// 가맹점사업자번호를 입력불가능하게 변경하는 부분
				a2.style.display = "block";
				document.frm.txtBusiness_Reg_No1.value = "" ;
				document.frm.txtBusiness_Reg_No2.value = "" ;
				document.frm.txtBusiness_Reg_No3.value = "" ;

				// focus를 이동하는 부분
				// 20130411 웹접근성(장차법)  수정
				//document.frm.txtBusiness_Reg_No1.blur() ;
				//document.frm.txtBusiness_Reg_No1.focus() ;
			} else {
				// 주민등록번호를 입력불가능하게 변경하는 부분
				a1.style.display = "none";
				document.frm.txtSSNo1.value = "" ;
				document.frm.txtSSNo2.value = "" ;

				// 가맹점사업자번호를 입력불가능하게 변경하는 부분
				a2.style.display = "none";
				document.frm.txtBusiness_Reg_No1.value = "" ;
				document.frm.txtBusiness_Reg_No2.value = "" ;
				document.frm.txtBusiness_Reg_No3.value = "" ;
			}
		}

		function goPopupResult()
		{
			if(isValid()){
				//openWinP('','evt_pop',"470","330");
				//document.frm.action = '/hp/im/et/evt002.do?method=getLifeLotteryList';
				//document.frm.target = 'evt_pop';
				//document.frm.submit();
				//XecureSubmit(frm);
                open('/hp/im/et/evt002.do?method=getLifeLotteryList', 'evt_pop', 'width=470, height=330 , scrollbars=no');
			}
		}

		function isValid() {
			var a3 = document.frm ;
			var flag;
			if ( a3.rdoSelect(0).checked ) {
				flag = 0 ;
			} else if ( frm.rdoSelect(1).checked ) {
				flag = 1 ;
			} else {
				flag = -1 ;
			}

			// 개인회원의 경우
			if ( flag == 0 ) {
				if (!checkPinNo(frm.txtSSNo1.value, frm.txtSSNo2.value)) {
					//frm.txtSSNo1.blur() ;		// 20130411 웹접근성(장차법)  수정
					frm.txtSSNo1.focus() ;	
					return false;
				}else{
					frm.idenNo.value = frm.txtSSNo1.value + frm.txtSSNo2.value ;
					return true;
				}
			// 가맹점회원의 경우
			} else if ( flag == 1 ) {
				frm.idenNo.value = frm.txtBusiness_Reg_No1.value+ frm.txtBusiness_Reg_No2.value + frm.txtBusiness_Reg_No3.value;
				if (!isBizNo(frm.idenNo)) {
					alert("올바른 사업자 번호를 입력 하세요");
					//frm.txtBusiness_Reg_No1.blur() ;	// 20130411 웹접근성(장차법)  수정
					frm.txtBusiness_Reg_No1.focus() ;	
					return false;
				}else{
					return true;
				}
			} else {
				// 비정상의 경우
				frm.txtIdenNo.value = "" ;
				return false;
			}
		}
	</script>
</div>
<!-- top_visual -->
<div class="top_visual">
	<h1><img src="/images/et/h1_event.png" alt="삼성카드와 다양한 이벤트를 즐기세요" /></h1>
</div>

<!-- content_block -->
<div class="content_block content_block_tab clfix">
	<div class="tab01 w810 h60">
		<ul>
            <li><a href="javascript:goTabPage('NHPIMETEVT001',true);">진행중인 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT002',true);">종료된 이벤트</a></li>
            <li><a href="javascript:goTabPage('NHPIMETEVT003',true);">당첨자발표</a></li>
            <li class="on"><a href="javascript:goTabPage('NHPIMETEVT101',true);">생활영수증복권제도</a>
				<ul class="sub_tab">
                    <li><a href="javascript:goTabPage('NHPIMETEVT101',true);">영수증복권제도안내</a></li>
                    <li class="on"><a href="javascript:goTabPage('NHPIMETEVT102',true);">당첨여부확인</a></li>
				</ul>
			</li>
            <li><a href="javascript:goTabPage('NHPIMETEVT103',true);">럭투유카드</a></li>
		</ul>
	</div>
</div>

<!-- content_block -->
<div class="content_block content_block_card clfix">
	<h2><img src="/images/et/h2_recieptlotto07.png" alt="신용카드복권 당첨조회하세요" /></h2>
	<div class="content_block_inner">
		<fieldset class="find_id">
			<form name="frm" autocomplete="off" method="post" action="">
				<input type="hidden" name="idenNo" value="" />
				<label for="label_mem1"><input type="radio" id="label_mem1" class="rdo" name="rdoSelect" title="개인회원" onclick="rdoSelect_onclick(0)"/>개인회원</label>
				<label for="label_mem2" class="ml20"><input type="radio" id="label_mem2" class="rdo" name="rdoSelect" title="가맹점회원"  onclick="rdoSelect_onclick(1)" />가맹점회원</label>

				<div class="line_lgray">&nbsp;</div>
				<legend>아이디찾기</legend>
				<div id="cidDl001" style="display: block">
				<dl>
					<dt><label for="txtSSNo1">주민등록번호</label></dt>
					<dd><span class="bg_input">
                            <input name="txtSSNo1" id="txtSSNo1" type="text" title="주민등록번호 앞자리" style="width:120px" maxlength="6" onkeypress="checkTypes(this, 'NUMB');" onblur="checkTypesOnBlur(this, 'NUMB');" />- 
							<em>&nbsp;</em>
						</span>&nbsp;-&nbsp;
						<span class="bg_input mr10">
							<input name="txtSSNo2" id="txtSSNo2" type="password" maxlength="7" title="주민등록번호 뒷자리" style="width:140px" onkeypress="checkTypes(this, 'NUMB');" onblur="checkTypesOnBlur(this, 'NUMB');" /> 
							<em>&nbsp;</em>
						</span>
						<a class="btn btn_blue" href="javascript:goPopupResult()" ><span style="width: 70px;text-align: center">확인</span></a>
					</dd>
				</dl>
				</div>
	
				<div id="cidDl002" style="display:none"><!-- 필요하신것 주석처리해서 사용하세요 -->
				<dl>
					<dt><label for="txtBusiness_Reg_No1">가맹점사업자번호</label></dt>
					<dd>
						<span class="bg_input">
                        <input id="txtBusiness_Reg_No1" name="txtBusiness_Reg_No1" type="text"  value="" style="width:80px" title="가맹점사업자번호 앞자리" maxlength="3" required="*" onkeypress="checkTypes(this, 'NUMB');" onblur="javascript:checkTypesOnBlur(this, 'NUMB');"/>
						<em>&nbsp;</em>
						</span>&nbsp;-&nbsp;
						<span class="bg_input">
                            <input name="txtBusiness_Reg_No2" type="password"  title="가맹점사업자번호 가운뎃자리" style="width:55px" id="txtBusiness_Reg_No2" maxlength="2" required="*" onkeypress="checkTypes(this, 'NUMB');" onblur="javascript:checkTypesOnBlur(this, 'NUMB');" />
							<em>&nbsp;</em>
						</span>&nbsp;-&nbsp;
						<span class="bg_input mr10">
							<input name="txtBusiness_Reg_No3" type="password"  style="width:100px" title="가맹점사업자번호 뒷자리" id="txtBusiness_Reg_No3" maxlength="5" required="*" onkeypress="checkTypes(this, 'NUMB');" onblur="javascript:checkTypesOnBlur(this, 'NUMB');" />
							<em>&nbsp;</em></span>
							<a class="btn btn_blue" href="javascript:goPopupResult()" ><span style="width: 70px;text-align: center">확인</span></a>
					</dd>
				</dl>
				</div>
	
				<div class="line_lgray10">&nbsp;</div>
			</form>
		</fieldset>

		<ol class="list_desc">
			<li><p>신용카드 당첨자명단을 확인하세요.</p></li>
			<li><p>개인 회원은 주민등록번호를, 가맹점 회원은 가맹점 사업자번호를 입력하세요.</p></li>
		</ol>
	</div>
</div>
<!--cms_content끝-->
<%@ include file="/WEB-INF/jsp/common/tab_footer.jsp" %>
