// ����Ʈ ���� ���
String.prototype.size = function() {
  var str = this;
  var retLength = 0;
  for (var i=0; i<str.length; i++) {
    retLength += (str.charCodeAt(i) > 128) ? 2 : 1;
  }
  return retLength;
}
// �յ� ���� �� ���๮�� ���� ����
String.prototype.trim = function() {
  var str = this;
  var retStr = str.replace(/^\s*/,"").replace(/\s*$/, "");
	return retStr;
}
//�������� �ƴ��� Ȯ�� (10����)
String.prototype.isNumber = function() {
	var str = this;
	var ret = false;
    for (var i=0; i < str.length; i++) {
		  if ( str.charCodeAt(i) > 57 || str.charCodeAt(i) < 48 ) {
			   return false;
		  }
	   }
	return true;
}

function GetTextByte(text) {
   str = new String(text);
   var strLen = str.length;
   var strByte = 0;
   for (var i=0; i<strLen; i++) {
       tmp = new String(str.charCodeAt(i));
       strByte++;
       if (tmp.length > 3) {
           strByte++;
       }
   }
   return strByte;
}

function IsNull(nval) {
   for (var i = 0 ; i < nval.length ; i++){
       tst = nval.substring(i,i+1)
       if ((tst != ' ')&&(tst != '\r')&&(tst != '\n')&&(tst != '\t')&&(tst != '\b')&&(tst != '\v')&&(tst != '\f')) {
          return false;
       }
   }
   return true;
}

function chkNum(chk) {
   var comp="0123456789";
   var str = chk.value;
   var len = str.length;

   for (i=0;i<len;i++) {
      if (comp.indexOf(str.substring(i,i+1))<0) {
           alert("���ڷθ� �Է� �����մϴ�. �ٽ� �Է��� �ֽʽÿ�");
           chk.value = "";
           chk.focus();
           return false;
      }
   }
   return true;
}

function isAllowStr(str, allowStr) {
   var i;
   var ch;

 if(str == ""){
   return false;

 }else{
	
   for (i=0;i<str.length;i++) {
       ch = str.charAt(i);

       if (allowStr.indexOf(ch) < 0) {
          return false;
       }
   }

   return true;
 }
}

function checkEmail(ctrl) {
   str = ctrl.value;
   
   if (!isAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.-_")) {
       alert("��ȿ�� Email�� �ƴմϴ�!");
       ctrl.value="";
       ctrl.focus();
       ctrl.select();
       return false;
   }

   var atCnt = 0;
   var dotCnt = 0;

   for (i = 0; i < str.length ; i++) { 
       ch = str.charAt(i);

       if (ch == "@") {
          atCnt++;
       }

       if (ch == ".") {
          dotCnt++;
       }
   }

   if (atCnt != 1 || dotCnt < 1) {
      alert("��ȿ�� Email�� �ƴմϴ�.");
      ctrl.value="";
      ctrl.focus();
      ctrl.select();
      return false;
   }

   var atIndex = 0;
   atIndex = str.indexOf("@");

   if (atIndex <= 0) {
      alert("��ȿ�� Email�� �ƴմϴ�.");
      ctrl.value="";
      ctrl.focus();
      ctrl.select();
      return false;
   }

   return true;
}

function checkEmail2(ctrl) {
   str = ctrl.value;
   
   if (!isAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.-_")) {
       alert("��ȿ�� Email�� �ƴմϴ�!");
       ctrl.value="";
       ctrl.focus();
       ctrl.select();
       return false;
   }

   return true;
}

function echeckEmail(ctrl) {
   str = ctrl.value;

   if (isAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.-_") == false) {
       alert("An invalid email address!");
       ctrl.value="";
       ctrl.focus();
       ctrl.select();
       return false;
   }

   var atCnt = 0;
   var dotCnt = 0;

   for (i = 0; i < str.length ; i++) { 
       ch = str.charAt(i);

       if (ch == "@") {
          atCnt++;
       }

       if (ch == ".") {
          dotCnt++;
       }
   }

   if (atCnt != 1 || dotCnt < 1) {
      alert("An invalid email address!");
      ctrl.value="";
      ctrl.focus();
      ctrl.select();
      return false;
   }

   var atIndex = 0;
   atIndex = str.indexOf("@");

   if (atIndex <= 0) {
      alert("An invalid email address!");
      ctrl.value="";
      ctrl.focus();
      ctrl.select();
      return false;
   }

   return true;
}

function CheckID(ctrl) {
	str = ctrl.value;	

    if (isAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false) {
        alert ("�㰡���� ���� ���ڿ��� ���ԵǾ� �ֽ��ϴ�!");
        ctrl.focus();
        ctrl.select();
        return false;
    }
   
	// Ư���� �̸��� id�� ����� �� ����
	if (!checkSpecialID(str,"admin")) {
	    return false;
	} else if (!checkSpecialID(str,"admins")) {
	    return false;	
	} else if (!checkSpecialID(str,"ducray")) {
	    return false;	
	} else if (!checkSpecialID(str,"master")) {
	    return false;	
	} else if (!checkSpecialID(str,"root")) {
	    return false;		
	} else if (!checkSpecialID(str,"webmaster")) {
	    return false;		
	} else {
        return true;
	}
}

function checkSpecialID(a,b) {	
	if (a.toUpperCase() == b.toUpperCase()) {
		alert("ID�� " + b + "��(��) ����Ͻ� �� �����ϴ�.");
		return false;
	}
	return true;
}

function CheckString(ctrl) {
	str = ctrl.value;	

    if (isAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false) {
        ctrl.value="";
        ctrl.focus();
        ctrl.select();
        return false;
    }
   
    return true;
}

//���� üũ ��ũ��Ʈ
function apg_length_chk(target, want_length)
{ 
   var len = 0; 
   if (target.value == null ) return 0; 
   for(var i=0;i<target.value.length;i++){ 
      var c = escape(target.value.charAt(i)); 
      if ( c.length == 1 ) len ++; 
      else if ( c.indexOf("%u") != -1 ) len += 2; 
      else if ( c.indexOf("%") != -1 ) len += c.length/3; 
   } 
   if (len > want_length)
  {
		kwant_length = want_length / 2
		alert("���� "+want_length+"��, �ѱ� "+kwant_length+"�� �ȿ��� �Է��Ͽ��ּ���.");
		target.value = "";
		target.focus();
		return false;
	}
	return true;
}
//����Ʈ���� ���ñ��̿�
function apg_title_length(title_content, title_step, title_len)
{ 
	var len = 0; 
	var title_result = ""
	if ( title_content == null ) return 0;
	if (title_step != 0)
		title_contentgth = (title_len -3) - title_step* 2;
	else
		title_contentgth = title_len;
	for(var i=0;i<title_content.length;i++)
	{ 
		if(len < title_contentgth)
		{
			var c = escape(title_content.charAt(i));
			title_result = title_result + title_content.charAt(i)
			if ( c.length == 1 ) len ++; 
			else if ( c.indexOf("%u") != -1 ) len += 2; 
			else if ( c.indexOf("%") != -1 ) len += c.length/3;
		}
		else
		{
			title_result = title_result + "...";
			break;
		}
	} 
	return title_result
} 
//���ڿ����� �ش����� �ʴ� ���� ����ִ��� üũ�ϱ�
function apg_value_chk(contents, target)
{
	var i;
	var ch;   
	for (i=0;i<contents.length;i++) 
	{       
		ch = contents.charAt(i) ;       
		if (target.indexOf(ch) < 0) 
		{
			return false;
		}
	}
	return true;
}

//�ֹε�� ��ȣ üũ
function CheckSSN(jumin1,jumin2) {
	var today = new Date();
	var chkYear1 = today.getYear();
	var chkYear2 = 0;

	if (chkYear1 < 2000) {
		chkYear1 += 1900;
	}

	var chk = 0;
	var chk2 = 0;
	var chk3 = 0;
	var yy = jumin1.substring(0,2);
	var mm = jumin1.substring(2,4);
	var dd = jumin1.substring(4,6);
    var chkSex = jumin2.substring(0,1);	

	if ((jumin1.length != 6) || (mm<1 || mm>12 || dd<1 || dd>31 )) {
		return false;
	}

	if ((chkSex != 1 && chkSex !=2 && chkSex !=3 && chkSex !=4) || (jumin2.length != 7)) {
		return false;
	}

	chkYear2 = parseInt(yy,10);

	if (chkSex <=2) {
		chkYear2 += 1900;
    } else {
		chkYear2 += 2000;
    }
	
	if ((chkYear1 - chkYear2) < 12) { 
		return false;
	} 

	// �ֹε�Ϲ�ȣ validation check
	for (var i = 0; i <=5 ; i++) { 
		chk = chk + ((i%8+2) * parseInt(jumin1.substring(i,i+1)))
	}

	for (var i = 6; i <=11 ; i++) { 
		chk = chk + ((i%8+2) * parseInt(jumin2.substring(i-6,i-5)))
	}

	chk = 11 - (chk %11)
	chk = chk % 10

	if (chk != jumin2.substring(6,7)) {
		return false;
	}  

	return true;
} 
