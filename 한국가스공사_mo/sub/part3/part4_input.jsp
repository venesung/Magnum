<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="../etc/Usr_function.jsp" %>
<%@ include file="/sql/part3/part3_write.jsp" %>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");

String post1 = request.getParameter("post1")==null?"":request.getParameter("post1");
String post2 = request.getParameter("post2")==null?"":request.getParameter("post2");
String addr1 = request.getParameter("addr1")==null?"":request.getParameter("addr1");
String addr2 = request.getParameter("addr2")==null?"":request.getParameter("addr2");

String phone = request.getParameter("phone")==null?"":request.getParameter("phone");
String email_1 = request.getParameter("email_1")==null?"":request.getParameter("email_1");
String email_2 = request.getParameter("email_2")==null?"":request.getParameter("email_2");
String mailyn = request.getParameter("mailyn")==null?"":request.getParameter("mailyn");
String title = request.getParameter("title")==null?"":request.getParameter("title");
String content = request.getParameter("content")==null?"":request.getParameter("content");
%>

<script type="text/javascript" src="../etc/js/inc_flash.js"></script>
<script type="text/javascript" src="../etc/js/default.js"></script>
<script type="text/javascript" src="../etc/js/util.js"></script>
<script type="text/javascript" src="../etc/js/common.js"></script>

<script type="text/javascript" language="JavaScript">
function CheckEmail(){
	var f = document.frm;
	var selectemail = f.email_3[f.email_3.selectedIndex].value;
	
	if(selectemail==""){
		f.email_2.value="";
		f.email_2.readOnly=false;
	}else{
		f.email_2.value=selectemail;
		f.email_2.readOnly=true;
   }
}

function CheckAndSubmit(f)  {

	if(IsNull(f.email_1.value)) {

		alert('email을 입력해 주세요!');
		f.email_1.focus();
		return false;
	}

	if(!CheckString(f.email_1)) {
		alert('email ID에 특수문자가 들어갔습니다. email ID를 확인해주세요!');
		return false;
	}

	if(IsNull(f.email_2.value)) {

		alert('email을 입력해 주세요!');
		f.email_2.focus();
		return false;
	}
	
	if(IsNull(f.passwd.value)) {

		alert('비밀번호를 입력해 주세요!');
		f.passwd.focus();
		return false;
   }

	if(IsNull(frm.title.value)) { 

		alert('제목을 입력해 주세요!');
		f.title.focus();
		return false;
	}

	if(GetTextByte(f.title.value) > 200) {

       alert('제목은 한글 100자/영문 200문이내 입니다.');
       f.title.focus();
       return false;
   }

   if (IsNull(f.content.value)) {

       alert('제안 내용을 입력해 주세요!');
       f.content.focus();
       return false;
   }

   if(GetTextByte(f.content.value) > 7000) {

       alert('제안 내용은 한글 3500자/영문 7000문이내 입니다..');
       f.content.focus();
       return false;
   }
	
	mail = f.email_1.value+'@'+ f.email_2.value;
	f.email.value=mail;
}

function toPost()
{
	var f = document.frm;
	f.action = "part3_zip.jsp";
	f.submit();
}
</script>

<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_3.gif" alt="고객지원"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit3_1_off.png"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit3_2_off.png"></a></li>				
				<li class="none"><a href="part2_1.jsp"><img src="../../images/stit3_4_on.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>비리신고</h3>
		</div>		
	</div>
	
	<div class="cont_pn"> 
	<form name="frm" method="post" action="part4_save.jsp" onSubmit="return CheckAndSubmit(this)">
		<input type="hidden" name="wmode" value="A"/>
		<input type="hidden" name="mailyn" value="Y"/>
		<input type="hidden" name="email"/>
		
		<table cellspacing="0" summary="" class="tbT03 tbnone">
			<caption></caption>
			<col width="25%"/>
			<col/>   
			<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" class="input" /></td>	
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email_1" class="input mab5" value="<%=email_1%>"> @ <input type="text" name="email_2" class="input mab5" value="<%=email_2%>"><br>
					<select name="email_3" onchange="CheckEmail();" class="select">
						<option value="" selected="selected">직접입력</option>
						<option value="chol.com">chol.com</option>
						<option value="daum.net">daum.net</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="empas.com">empas.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hitel.net">hitel.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="megapass.net">megapass.net</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="paran.com">paran.com</option>
						<option value="sayclub.net">sayclub.net</option>
						<option value="shinbiro.com">shinbiro.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>
									</td>	
			</tr>				
			</tbody>
		</table>

<table cellspacing="0" summary="" class="tbT03 mat10">
			<caption></caption>
			<col width="25%"/>
			<col/>   
			<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="input97" value="<%=title%>"></td>	
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" class="input50"></td>	
			</tr>
			<tr class="none">
				<th>질문내용</th>
				<td><textarea name="content" rows="2" cols="2" class="textarea" value="<%=content%>"></textarea></td>	
			</tr>
			</tbody>
		</table>

		
		
		<div class="btn mat15">
			<input type="image" src="../../images/btn_save.gif">
			<!-- <img src="../../images/btn_list.gif" onclick="history.back(1);" class="npointer">  --><!-- 목록 페이지 없음 -->
		</div>
	</form>
	</div>

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>