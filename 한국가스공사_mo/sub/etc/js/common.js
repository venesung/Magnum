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









/***************************************************************************

 FUNCTION ID: getXMLHttpRequest 

 DESC       : XMLHttpRequest ��ü ����            

 �����Լ�   : 

 IN         : 

 OUT        : XMLHttpRequest ��ü

 �����ۼ��� : 2008/08/01

 �����ۼ��� : ȫ����

 �����̷�   : 

              

***************************************************************************/

/*

function getXMLHttpRequest(){

    var xmlreq = null;



    if ( window.XMLHttpRequest ) {

        xmlreq = new XMLHttpRequest();

    } else if( window.ActiveXObject ) {

        try {

            xmlreq = new ActiveXObject("Msxml2.XMLHTTP");  //�ͽ��÷ο� 5.0 ����

        }catch( e1 ){

            try {

                xmlreq = new ActiveXObject("Microsoft.XMLHTTP"); //�ͽ��÷��� 5.0����

            }catch( e2 ){

                return null;

            }

        }

    }

    return xmlreq;

}

*/



/***************************************************************************

 FUNCTION ID: sendRequest 

 DESC       : �񵿱� ȣ�� (Ajax Submit)

 �����Լ�   : getXMLHttpRequest

 IN         : url : ������� ������ ȭ�� Url    ��) a.asp 

              method : �޼ҵ�                   ��) POST, GET

              param :  ��ȸ�� Ű �Ķ���ͿͰ�   ��) code=xxx

              resHandlerOnSuccess :  ���������� �����Ű�� �Լ�  ��) a         function  a { alert("�����߽��ϴ�."); }

              resHandlerOnFail :  ���������� �����Ű�� �Լ�  ��) a         function  a { alert("�����߽��ϴ�."); }

 OUT        : 

 �����ۼ��� : 2008/08/01

 �����ۼ��� : ȫ����

 �����̷�   : 

              

***************************************************************************/

/*

function sendRequest(url, method, param, resHandlerOnSuccess, resHandlerOnFail ){

    var xmlreq = getXMLHttpRequest();



    if( xmlreq == null ) return 1;

    xmlreq.onreadystatechange = function(){

        if( xmlreq.readyState == 4 ){

            if( xmlreq.status == 200 ){

                resHandlerOnSuccess( xmlreq );

            }else{

                resHandlerOnFail( xmlreq );

            }

        }

    }

    xmlreq.open( method, url, true );

    xmlreq.setRequestHeader( "Content-Type", "application/x-www-form-urlencoded; charset=euc-kr" );

    xmlreq.send( param );

}



*/

