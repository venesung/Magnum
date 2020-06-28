function menuD2block(id) {
	for(var num=1; num<=5; num++)
	{
		document.getElementById('submenu'+num).style.display='none'; //submenu1~submenu6 까지 숨긴 다음
		document.getElementById('subImg'+num).src="../../images/btn_topnavi0" + num + "_off.gif";
	}
	document.getElementById('submenu'+id).style.display='block'; //해당 ID만 보임
	var top1Menu = document.getElementById('subImg'+id)
	top1Menu.src="../../images/btn_topnavi0" + id + "_on.gif";
}


function menuD2none(id){
	document.getElementById(id).style.display='none';
}

function menuD2Allnone(){
	for(num=1; num<=6; num++) document.getElementById('submenu'+num).style.display='none'; //submenu1~submenu6 까지 숨긴 다음
}

function getElementsByClass(theClass,node) {
    var classElements = [];
    var i;
    if ( node == null ) {
     node = document
    }
    if (node.getElementsByClassName) {
     var tempCollection = node.getElementsByClassName(theClass);
        for (i = 0; i < tempCollection.length ; i++) {
      classElements.push(tempCollection[i])
     }
    }
    else {
     var els = node.getElementsByTagName("*");
     var elsLen = els.length;
     var pattern = new RegExp("(^|\\s)"+theClass+"(\\s|$)");
     for (i = 0; i < elsLen; i++) {
      if ( pattern.test(els[i].className) ) {
       classElements.push(els[i]);
      }
     }
    }
    return classElements;
};



var object = getElementsByClass("subSubmenu");
if (object != null)
{	
	for (var j=0; j < object.length; j++){
		object[j].style.display="none";
	}
	
}


function leftSubMenuDisplay(x) {
	var num  = x ;
	var object = getElementsByClass("subSubmenu");
	for (var j=0; j < object.length; j++){
		object[j].style.display="none";
	}
	object[num].style.display="block";
}


function OverImage(num){document.getElementById('image'+num).src="../../images/btn_left010" + num + "_on.gif";}
function OutImage(num){document.getElementById('image'+num).src="../../images/btn_left010" + num + "_off.gif";}
function Over2Image(num){document.getElementById('image'+num).src="../../images/btn_left020" + num + "_on.gif";}
function Out2Image(num){document.getElementById('image'+num).src="../../images/btn_left020" + num + "_off.gif";}
function Over3Image(num){document.getElementById('image'+num).src="../../images/btn_left030" + num + "_on.gif";}
function Out3Image(num){document.getElementById('image'+num).src="../../images/btn_left030" + num + "_off.gif";}
function Over4Image(num){document.getElementById('image'+num).src="../../images/btn_left040" + num + "_on.gif";}
function Out4Image(num){document.getElementById('image'+num).src="../../images/btn_left040" + num + "_off.gif";}
function Over5Image(num){document.getElementById('image'+num).src="../../images/btn_left050" + num + "_on.gif";}
function Out5Image(num){document.getElementById('image'+num).src="../../images/btn_left050" + num + "_off.gif";}
function Over6Image(num){document.getElementById('image'+num).src="../../images/btn_left060" + num + "_on.gif";}
function Out6Image(num){document.getElementById('image'+num).src="../../images/btn_left060" + num + "_off.gif";}
function Over7Image(num){document.getElementById('image'+num).src="../../images/btn_left070" + num + "_on.gif";}
function Out7Image(num){document.getElementById('image'+num).src="../../images/btn_left070" + num + "_off.gif";}
function Over8Image(num){document.getElementById('image'+num).src="../../images/btn_left080" + num + "_on.gif";}
function Out8Image(num){document.getElementById('image'+num).src="../../images/btn_left080" + num + "_off.gif";}

function left2Over(num){document.getElementById('image'+num).src="../../images/btn_left020" + num + "_on.gif";}
function left2Out(num){document.getElementById('image'+num).src="../../images/btn_left020" + num + "_off.gif";}
function left3Over(num){document.getElementById('image'+num).src="../../images/btn_left030" + num + "_on.gif";}
function left3Out(num){document.getElementById('image'+num).src="../../images/btn_left030" + num + "_off.gif";}
function left4Over(num){document.getElementById('image'+num).src="../../images/btn_left040" + num + "_on.gif";}
function left4Out(num){document.getElementById('image'+num).src="../../images/btn_left040" + num + "_off.gif";}
function left5Over(num){document.getElementById('image'+num).src="../../images/btn_left050" + num + "_on.gif";}
function left5Out(num){document.getElementById('image'+num).src="../../images/btn_left050" + num + "_off.gif";}
function left6Over(num){document.getElementById('image'+num).src="../../images/btn_left060" + num + "_on.gif";}
function left6Out(num){document.getElementById('image'+num).src="../../images/btn_left060" + num + "_off.gif";}
function left7Over(num){document.getElementById('image'+num).src="../../images/btn_left070" + num + "_on.gif";}
function left7Out(num){document.getElementById('image'+num).src="../../images/btn_left070" + num + "_off.gif";}

//문자확대,축소
var currentFontSize = 2;

function zoomUtil(state, e){

	var idx;
	var arrFontSize = new Array();
	
	arrFontSize[0] = "0.65em";
	arrFontSize[1] = "0.7em";
	arrFontSize[2] = "0.75em";
	arrFontSize[3] = "0.85em";
	arrFontSize[4] = "0.95em";
	arrFontSize[5] = "1em";
	arrFontSize[6] = "1.1em";
	
	if (isAccess(e)) {
		if (state == "plus") {		
						
			if (currentFontSize < 6 ) {
				idx = currentFontSize + 1;
				currentFontSize = idx;
			}			
		
		} else if (state == "default") {
			idx = 2;
			currentFontSize = idx;
		
		} else if (state == "minus") {			
			
			if ( currentFontSize >= 1) {
				idx = currentFontSize - 1;
				currentFontSize = idx;
			}	
		}		
	}
	
	document.body.style.fontSize = arrFontSize[idx];
//		document.getElementById("temp_txt").innerHTML = currentFontSize;
	
	return false;
	
/*		alert(document.body.style.fontSize);
	return;		*/

}

/*메인 탭메뉴-----------------------------------------------------------------*/
function isAccess(e) {
	
	var keynum;
	var ismouseClick = 1;
	
	if (window.event) {		//IE & Safari
		keynum = e.keyCode;
		
		//Safari의 경우 마우스클릭은 keynum 0 이 넘어옴
		if (event.button == 0 || keynum == 0){
			ismouseClick = 0;
		}		
		
	} else if ( e.which ){		// Netscape/Firefox/Opera
		keynum = e.which;
		
		if (keynum == 1) {
			ismouseClick = 0;
		}		
		
	}
	
	//마우스 클릭이거나 엔터키를 누른경우 true값 반환
	if ( ismouseClick == 0 || keynum == 13 ) {
		return true;
	} else {
		return false;
	}
}

<!--

	var ImgName, ImgType, Oim , Path ,sPath

	

  

function getAddDay(day, addend) {

  // 날짜를 가져온다.

  // 일자를 구해서 몇 일을 더한다.

    var tdate = day.getDate() + addend;

  // 결과 날짜를 세팅한다. 월 넘김은 자동으로 계산됨

    var nextDay = new Date(day.getYear(), day.getMonth(), tdate);

    return nextDay;

}



function getBizDay(day, addend) {

    var bizDay = getAddDay(day, addend);

    // 요일이 토요일이나 일요일인지 검사

    if (bizDay.getDay() == 0 || bizDay.getDay() == 6) {

        // 토,일요일은 다음 주 월요일로 변경

        // 더하는 날짜 2

        var plusDay = 2;

        // 일요일인 경우 더하는 날짜를 1로 변경

        if (bizDay.getDay() == 0) {

            plusDay = 1;

        }

        bizDay = getAddDay(bizDay, plusDay);

    }

    return bizDay;

}



function Trim(TRIM_VALUE){

	if(TRIM_VALUE.length < 1){

		return"";

	}

	TRIM_VALUE = RTrim(TRIM_VALUE);

	TRIM_VALUE = LTrim(TRIM_VALUE);

	if(TRIM_VALUE==""){

		return "";

	}

	else{

	return TRIM_VALUE;

	}

} //End Function



function RTrim(VALUE){

	var w_space = String.fromCharCode(32);

	var v_length = VALUE.length;

	var strTemp = "";

	if(v_length < 0){

		return"";

	}

	var iTemp = v_length -1;

	

	while(iTemp > -1){

		if(VALUE.charAt(iTemp) == w_space){

		}

		else{

			strTemp = VALUE.substring(0,iTemp +1);

			break;

		}

		iTemp = iTemp-1;

	

	} //End While

	return strTemp;

	

} //End Function



function LTrim(VALUE){

	var w_space = String.fromCharCode(32);

	if(v_length < 1){

		return"";

	}

	var v_length = VALUE.length;

	var strTemp = "";

	

	var iTemp = 0;

	

	while(iTemp < v_length){

		if(VALUE.charAt(iTemp) == w_space){

		}

		else{

			strTemp = VALUE.substring(iTemp,v_length);

			break;

		}

		iTemp = iTemp + 1;

	} //End While

	return strTemp;

} //End Function







	

	function ImgOn(Oim, extension )

	{

		ImgName = Oim;

		ImgType = extension;

		Look = "/actfront/img/" + Oim + "_o." + extension ;

		document.images[Oim].src = Look;

	}

	

function jsCalendar()

{

    var win = showModalDialog("inc/minical/calendar.jsp?hlcElement=" + arguments[0],this,"dialogWidth:360px; dialogHeight:320px; center=yes; screenTop=yes; scroll=no; status=no; help=no;");

}

	

	function Fix()

	{

		Look = "/actfront/img/" + ImgName + "_n." + ImgType ;

		document.images[ImgName].src = Look;

	}

	function ImgOn2(sPath, Oim, extension )

	{

		Path=sPath;

		ImgName = Oim;

		ImgType = extension;

		Look = "/actfront/img/"+Path +"/"+ Oim + "_o." + extension ;

		document.images[Oim].src = Look;

	}

	

	

	function Fix2()

	{

		

		Look = "/actfront/img/"+Path +"/"+ ImgName + "_n." + ImgType ;

		document.images[ImgName].src = Look;

	}

	

	function setVariables() 

	{

		if (document.layers) 

		{

			v=".top=";

			dS="document.";

			sD="";

			y="window.pageYOffset";

		}

		else if (document.all)

		{

			v=".pixelTop=";

			dS="";

			sD=".style";

			y="document.body.scrollTop";

		}

		else if (document.getElementById)

		{

			y="window.pageYOffset";

		}

	}

	

	function scroll()

	{

	    var a=document.body.scrollTop+48 

	        // 70 은 배너의 기준위치가 위쪽에서 70 픽셀 떨어지도록 설정한 것입니다

	    divMenu.style.top=a

	}

	

	// Trim

	function trim(str)

	{

		var count = str.length;

		var len = count;                

		var st = 0;

	

		while ((st < len) && (str.charAt(st) <= ' '))

		{

			st++;

		}

		while ((st < len) && (str.charAt(len - 1) <= ' '))

		{

			len--;

		}                

		return ((st > 0) || (len < count)) ? str.substring(st, len) : str ;   

	}

	

	function mtomm(tmpTime)

	{

		var str=""+tmpTime;

		if(str == "")

			return str;

		else if(str.length < 2)

			return ("0"+str);	

		else

			return str;

	}

	

	function left_spat_join(uRole, authority) {

		

		if (!SpotAuthorityCheck(uRole, authority)) {

			alert("참여대상자가 아닙니다\r\n설문을 참여할 수 없습니다");

			return;

		}

	

		var obj = document.left_spot_frm.spat_answr;

			

		if (obj != null) {

			if (obj.length == null) {

				if (!obj.checked) {

					alert("보기를 선택해주요");

					return;

				}

			}

			else {

				checked_cnt=0;

				for (i=0; i<obj.length; i++) {

					if (obj[i].checked) {

						checked_cnt++;

					}

				}

				

				if (checked_cnt==0) {

					alert("보기를 선택해주요");

					return;

				}

			}

		}

		else {

			alert("보기가 없습니다");

			return;

		}

		

		document.left_spot_frm.target = "ifrm_left_spot";

		document.left_spot_frm.submit();

	}

	

	/*설문 참여 하기*/

	function engage(url)

	{

		window.open(url,'spot_survey','width=800, height=600, resizable=yes,scrollbars=yes');

	}

	

	

	function login() {

		var frm = document.login_frm;

		

		if (trim(frm.user_id.value) == "") {

			alert("아이디를 입력하세요");

			frm.user_id.value = "";

			frm.user_id.focus();

			return;	

		}

		else if (trim(frm.pwd.value) == "") {

			alert("비밀번호를 입력하세요");

			frm.pwd.value = "";

			frm.pwd.focus();

			return;	

		}

		else {

			/*

			frm.cmd.value = 'LOGIN';

			frm.passwd.value = frm.pwd.value;

			frm.back_url.value = 'http://esurvey.gangnam.go.kr/actfront/MainServlet'; 

			frm.link_url.value = 'http://esurvey.gangnam.go.kr/actfront/MainServlet'; 

			frm.login_url.value = 'http://esurvey.gangnam.go.kr/actfront/MainServlet'; 

			frm.is_mail.value = '1'; 

			frm.action = 'http://www.gangnam.go.kr/nc.jsp';

			frm.submit();

			*/

			frm.action = "/actfront/MainServlet";

			frm.submit();	

			

		}

	}

	

	function login2() {



		if(document.all.member_id.value == ""){

			alert("아이디를 입력하세요");

			document.all.member_id.focus();

		}else if(document.all.passwd.value == ""){

			alert("패스워드를 입력하세요");

			document.all.passwd.focus();

		}else{

			document.frm.target = "_self";

			//document.login_frm.action = "http://61.109.242.230/Customer/inc/LoginOkActiveFront.asp"; //test : http://61.109.242.151/WCDotCom/Customer/inc/LoginOkActiveFront.asp

			document.frm.action = "/actfront/MemberServlet";

			document.frm.submit();

		}

	}

	

	function login_key_down(i) {

	    if(event.keyCode ==13) {

	        if (i == 1) document.login_frm.pwd.focus();

	        else login();

	    }

	}

	

	function logout() {

		var frm = document.login_frm;

			

		frm.flag.value = "LOGOUT";

		frm.action = "/actfront/MainServlet";

		frm.submit();

	}

	

	function SpotAuthorityCheck(user_role, join_role) {

		

		if (join_role == "0"){

			//일반회원 이상 (비회원만 안됨...)

			if (user_role == "" || user_role == "99") {

				return false;	

			}

		}

		else if (join_role == "1"){

			//강남구민 이상 (일반회원, 비회원만 안됨...)

			if (user_role == "" || user_role == "30" || user_role == "99") {

				return false;	

			}

		}

		

		// 비회원 구분은 그냥 넘어가.. 모두 투표 가능항께요...

		return true;

	}

	

	function SurveyAuthorityCheck(user_role, join_role) {

		

		if (join_role == "1"){

			//일반회원 이상 (비회원만 안됨...)

			if (user_role == "" || user_role == "99") {

				return false;	

			}

		}

		else if (join_role == "2"){

			//강남구민 이상 (일반회원, 비회원만 안됨...)

			if (user_role == "" || user_role == "30" || user_role == "99") {

				return false;	

			}

		}

		

		// 비회원 구분은 그냥 넘어가.. 모두 투표 가능항께요...

		return true;

	}

	//기존에 있던거...지오

	

	var ImgName, ImgType, Oim 

	/*설문 참여 하기*/

	function engage(url)

	{

		window.open(url,'spot_survey','width=800, height=600, resizable=yes,scrollbars=yes');

	}



	function ImgOn(Oim, extension )

	{

		ImgName = Oim;

		ImgType = extension;

		Look = "/actfront/img/" + Oim + "_o." + extension ;

		document.images[Oim].src = Look;

	}

	

	function Fix()

	{

		Look = "/actfront/img/" + ImgName + "_n." + ImgType ;

		document.images[ImgName].src = Look;

	}

	





	/*** 페이지 블럭 처리 끝 ***/

//-->

function downfile(fn, dnname) {
  document.formdownfile.fn.value = fn;
  document.formdownfile.dnname.value = dnname;
  document.formdownfile.action = "../../common/inc/file_down.jsp";
  document.formdownfile.submit();
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

var onPlay = 0;		// 0 : 로드되지 않음, 1 : 플레이중, 2 : pause
var movieFile = null;

function openTV(mn) {
	stopTV();
	movieFile = mn;
	playTV();
}

function playTV() {
	switch(onPlay) {
		case 0:
			if(movieFile != null) {
				onPlay = 1;
				ADTV.open(movieFile);
				//ADTV.Play();  auto start enabled
			}else{
				alert('선택된 동영상이 없습니다');
			}
			break;
		case 1:
			/*
			ADTV.stop();
			onPlay = 0;
			setTimeout("playTV()", 20);
			break;
			*/
		case 2:
			onPlay = 1;
			ADTV.play();
			break;
	}
}

function stopTV() {
		onPlay = 0;
		ADTV.stop();
		ADTV.currentPosition = 0;
}

function pauseTV() {
	if(onPlay == 1) {
		onPlay = 2;
		ADTV.pause();
	}
}

function badTV() {
	ADTV.cancel();
	movieFile = null;
	onPlay = 0;
	alert('동영상을 재생할 수 없습니다');
}


  function changeYear(){
	var f = document.form1;
	var yearValue=document.getElementById("selYear").value;
 	
	if (yearValue=="2009"){
		f.action="investor_08.jsp";
	}else if(yearValue=="2008"){	
		f.action="investor_08_2008.jsp";
	}else if(yearValue=="2007"){			
		f.action="investor_08_2007.jsp";		
	}else if(yearValue=="2006"){			
		f.action="investor_08_2006.jsp";		
	}else if(yearValue=="2005"){
		f.action="investor_08_2005.jsp";
	}else if(yearValue=="2004"){
		f.action="investor_08_2004.jsp";
	}else if(yearValue=="2003"){
		f.action="investor_08_2003.jsp";
	}//if
			f.submit();
	}


	 function changeYear2(){
	var f = document.form1;
	var yearValue=document.getElementById("selYear").value;
 	
	if (yearValue=="2009"){
		f.action="notice_12.jsp";
	}else if(yearValue=="2008"){	
		f.action="notice_12_2008.jsp";
	}else if(yearValue=="2007"){			
		f.action="notice_12_2007.jsp";		
	}else if(yearValue=="2006"){			
		f.action="notice_12_2006.jsp";		
	}else if(yearValue=="2005"){
		f.action="notice_12_2005.jsp";
	}else if(yearValue=="2004"){
		f.action="notice_12_2004.jsp";
	}else if(yearValue=="2003"){
		f.action="notice_12_2003.jsp";
	}//if
			f.submit();
	}