function menuD2block(id) {
	for(var num=1; num<=5; num++)
	{
		document.getElementById('submenu'+num).style.display='none'; //submenu1~submenu6 ���� ���� ����
		document.getElementById('subImg'+num).src="../../images/btn_topnavi0" + num + "_off.gif";
	}
	document.getElementById('submenu'+id).style.display='block'; //�ش� ID�� ����
	var top1Menu = document.getElementById('subImg'+id)
	top1Menu.src="../../images/btn_topnavi0" + id + "_on.gif";
}


function menuD2none(id){
	document.getElementById(id).style.display='none';
}

function menuD2Allnone(){
	for(num=1; num<=6; num++) document.getElementById('submenu'+num).style.display='none'; //submenu1~submenu6 ���� ���� ����
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

//����Ȯ��,���
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

/*���� �Ǹ޴�-----------------------------------------------------------------*/
function isAccess(e) {
	
	var keynum;
	var ismouseClick = 1;
	
	if (window.event) {		//IE & Safari
		keynum = e.keyCode;
		
		//Safari�� ��� ���콺Ŭ���� keynum 0 �� �Ѿ��
		if (event.button == 0 || keynum == 0){
			ismouseClick = 0;
		}		
		
	} else if ( e.which ){		// Netscape/Firefox/Opera
		keynum = e.which;
		
		if (keynum == 1) {
			ismouseClick = 0;
		}		
		
	}
	
	//���콺 Ŭ���̰ų� ����Ű�� ������� true�� ��ȯ
	if ( ismouseClick == 0 || keynum == 13 ) {
		return true;
	} else {
		return false;
	}
}

<!--

	var ImgName, ImgType, Oim , Path ,sPath

	

  

function getAddDay(day, addend) {

  // ��¥�� �����´�.

  // ���ڸ� ���ؼ� �� ���� ���Ѵ�.

    var tdate = day.getDate() + addend;

  // ��� ��¥�� �����Ѵ�. �� �ѱ��� �ڵ����� ����

    var nextDay = new Date(day.getYear(), day.getMonth(), tdate);

    return nextDay;

}



function getBizDay(day, addend) {

    var bizDay = getAddDay(day, addend);

    // ������ ������̳� �Ͽ������� �˻�

    if (bizDay.getDay() == 0 || bizDay.getDay() == 6) {

        // ��,�Ͽ����� ���� �� �����Ϸ� ����

        // ���ϴ� ��¥ 2

        var plusDay = 2;

        // �Ͽ����� ��� ���ϴ� ��¥�� 1�� ����

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

	        // 70 �� ����� ������ġ�� ���ʿ��� 70 �ȼ� ���������� ������ ���Դϴ�

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

			alert("��������ڰ� �ƴմϴ�\r\n������ ������ �� �����ϴ�");

			return;

		}

	

		var obj = document.left_spot_frm.spat_answr;

			

		if (obj != null) {

			if (obj.length == null) {

				if (!obj.checked) {

					alert("���⸦ �������ֿ�");

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

					alert("���⸦ �������ֿ�");

					return;

				}

			}

		}

		else {

			alert("���Ⱑ �����ϴ�");

			return;

		}

		

		document.left_spot_frm.target = "ifrm_left_spot";

		document.left_spot_frm.submit();

	}

	

	/*���� ���� �ϱ�*/

	function engage(url)

	{

		window.open(url,'spot_survey','width=800, height=600, resizable=yes,scrollbars=yes');

	}

	

	

	function login() {

		var frm = document.login_frm;

		

		if (trim(frm.user_id.value) == "") {

			alert("���̵� �Է��ϼ���");

			frm.user_id.value = "";

			frm.user_id.focus();

			return;	

		}

		else if (trim(frm.pwd.value) == "") {

			alert("��й�ȣ�� �Է��ϼ���");

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

			alert("���̵� �Է��ϼ���");

			document.all.member_id.focus();

		}else if(document.all.passwd.value == ""){

			alert("�н����带 �Է��ϼ���");

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

			//�Ϲ�ȸ�� �̻� (��ȸ���� �ȵ�...)

			if (user_role == "" || user_role == "99") {

				return false;	

			}

		}

		else if (join_role == "1"){

			//�������� �̻� (�Ϲ�ȸ��, ��ȸ���� �ȵ�...)

			if (user_role == "" || user_role == "30" || user_role == "99") {

				return false;	

			}

		}

		

		// ��ȸ�� ������ �׳� �Ѿ.. ��� ��ǥ �����ײ���...

		return true;

	}

	

	function SurveyAuthorityCheck(user_role, join_role) {

		

		if (join_role == "1"){

			//�Ϲ�ȸ�� �̻� (��ȸ���� �ȵ�...)

			if (user_role == "" || user_role == "99") {

				return false;	

			}

		}

		else if (join_role == "2"){

			//�������� �̻� (�Ϲ�ȸ��, ��ȸ���� �ȵ�...)

			if (user_role == "" || user_role == "30" || user_role == "99") {

				return false;	

			}

		}

		

		// ��ȸ�� ������ �׳� �Ѿ.. ��� ��ǥ �����ײ���...

		return true;

	}

	//������ �ִ���...����

	

	var ImgName, ImgType, Oim 

	/*���� ���� �ϱ�*/

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

	





	/*** ������ �� ó�� �� ***/

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

var onPlay = 0;		// 0 : �ε���� ����, 1 : �÷�����, 2 : pause
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
				alert('���õ� �������� �����ϴ�');
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
	alert('�������� ����� �� �����ϴ�');
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