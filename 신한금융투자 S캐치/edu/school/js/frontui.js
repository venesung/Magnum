/* 
	FAQ Show/Hide 
	total : �� ���� ��
	selNum : ���õ� ���� ��ȣ
*/

function shFAQ(total,selNum) {
	for(i=1;i<total+1;i++) {
		document.getElementById("q"+ i).style.background = "#fff url(/img/common/bg_faq_02.gif) 10px 8px no-repeat";
		document.getElementById("q" + i).style.fontWeight = "normal";
		document.getElementById("q" + i).style.color = "#6b7073";
		document.getElementById("a" + i).style.display = "none";
	}
	document.getElementById("q" + selNum).style.background = "#f2f2f2 url(/img/common/bg_faq_01.gif) 10px 8px no-repeat";
	document.getElementById("q" + selNum).style.fontWeight = "bold";
	document.getElementById("q" + selNum).style.color = "#002664";
	document.getElementById("a" + selNum).style.display = "block";
}

function shCFAQ(total,selNum) {
	for(i=1;i<total+1;i++) {
		document.getElementById("faqCat"+ i).style.color = "#6b7073";
		document.getElementById("faqCats" + i).style.fontWeight = "normal";
		document.getElementById("faqCats" + i).style.color = "#9ea3a7";
		document.getElementById("faqNum" + i).className = "faqNum";
		document.getElementById("faqCat" + i).className = "faqCat";
		document.getElementById("faqCon" + i).className = "faqCon";
		//alert(document.getElementById("faqCon" + i).childNodes(0).childNodes(0).tagName)
		document.getElementById("faqCon" + i).childNodes(0).childNodes(0).style.color = "#6b7073";
		document.getElementById("faqCon" + i).childNodes(0).childNodes(0).style.fontWeight = "normal";
		document.getElementById("faqCon" + i).childNodes(0).childNodes(1).style.display = "none";
	}
	
	//alert(document.getElementById("faqCon1").childNodes(0).childNodes(1).tagName)
	document.getElementById("faqCat" + selNum).style.color = "#002664";
	document.getElementById("faqCats" + selNum).style.fontWeight = "bold";
	document.getElementById("faqCats" + selNum).style.color = "#002664";
	document.getElementById("faqNum" + selNum).className = "faqNumOn";
	document.getElementById("faqCat" + selNum).className = "faqCatOn";
	document.getElementById("faqCon" + selNum).className = "faqConOn";
	document.getElementById("faqCon" + selNum).childNodes(0).childNodes(0).style.color = "#002664";
	document.getElementById("faqCon" + selNum).childNodes(0).childNodes(0).style.fontWeight = "bold";
	document.getElementById("faqCon" + selNum).childNodes(0).childNodes(1).style.display = "block";
}


/*
	Layer Show/Hide (Tab ���)
	Lname : ���̾� ���� �̸�
	Iname : ���̹��� ���� �̸�
	Dname : �̹��� ���丮 ��
	total : �� ���̾� ��
	selNum : ���õ� ���̾� ��ȣ
*/
function chConLayer(Lname,Iname,Dname,total,selNum) {
	for(i=1;i<total+1;i++) {
		document.getElementById(Lname + "_" + i).style.display = "none";
		document.getElementById(Iname + i).src="../img/" + Dname + "/tab_" + Iname + "0" + i +"_off.gif";
	}
	document.getElementById(Lname + "_" + selNum).style.display = "block";
	document.getElementById(Iname + selNum).src="../img/" + Dname + "/tab_" + Iname + "0" + selNum +"_on.gif";
}

/*
	Image Change
	Iname : �̹��� ���� �̸�
	Dname : �̹��� ���丮 ��
	selNum : ���õ� �̹��� ��ȣ
*/
function chImg(Iname,Dname,selNum) {
	document.getElementById(Iname).src="../img/" + Dname + "/img_" + Iname + "_0" + selNum + ".gif";
}

/*
	Image Select
	Iname : �̹��� ���� �̸�
	Dname : �̹��� ���丮 ��
	total : �� ���̾� ��
	selNum : ���õ� ���̾� ��ȣ
*/
function chImgBtn(Iname,Dname,total,selNum) {
	for(i=1;i<total+1;i++) {
		document.getElementById(Iname + i).src="../img/" + Dname + "/text_" + Iname + i +"_off.gif";
	}
	document.getElementById(Iname + selNum).src="../img/" + Dname + "/text_" + Iname + selNum +"_on.gif";
}

/*
	CMA ����

function shCMAUse(selNum) {
	for (i=1;i<11;i++) {
		document.getElementById("CMAUse" + i).className = "";	
		document.getElementById("cmaNum" + i).style.display = "none";	
	}
		document.getElementById("CMAUse" + selNum).className = "sel";	
		document.getElementById("cmaNum" + selNum).style.display = "block";	
}
*/

/*
	Layer Show/Hide (�ֳθ���Ʈ)
	Lname : ���̾� �̸�
	total : �� ���̾� ��
	selNum : ���õ� ���̾�
	selType : 1. show, 0. hide
*/

function shCLayerSH(Lname,total,selNum,selType) {
	if(selType == "1") {
		for(i=1;i<total+1;i++) {
			document.getElementById(Lname + "_" + i).style.display = "none";
		}
		document.getElementById(Lname + "_" + selNum).style.display = "block";
	} else {
		document.getElementById(Lname + "_" + selNum).style.display = "none";
	}
}

/*
	������ǰ���̵� �޴� ON/OFF
*/

function shGLayer(string) {
	if (string == "S") {
		document.getElementById("guideSlist").style.display = "block";
		document.getElementById("btnListOff").style.display = "none";
	} else {
		document.getElementById("guideSlist").style.display = "none";
		document.getElementById("btnListOff").style.display = "block";	
	}
	
}

/* 
	ȸ��Ұ� - ��ȸ����Ȱ��
	total : �� ���̾� ��
	selNum : ���õ� ���̾�
*/

function shCompany(total,selNum) {
	for(i=1;i<total+1;i++) {
		document.getElementById("voluntary_" + i).style.display = "none";	
		document.getElementById("volMenu" + i).className = "";
	}
		document.getElementById("voluntary_" + selNum).style.display = "block";	
		document.getElementById("volMenu" + selNum).className = "sel";
}

/* 
	�˾�
	pURL : ���ϰ��
	pName : �˾�â �̸�
	pWidth : �˾� ���λ�����
	pHeight : �˾� ���λ�����
	pScroll : �˾� ��ũ�� ����
*/
function popOpen(pURL, pName, pWidth, pHeight, pScroll) {
  if(pScroll == "1") {
	  	pWidth = eval(pWidth + 17);
  }
  var int_windowLeft = (screen.width - pWidth) / 2;
  var int_windowTop = (screen.height - pHeight) / 2;
  var str_windowProperties = 'height=' + pHeight + ', width=' + pWidth + ',top=' + int_windowTop + ', left=' + int_windowLeft + ', scrollbars=' + pScroll + ',resizable=0, menubar=0, toolbar=0, location=0, statusbar=0, fullscreen=0';
  var obj_window = window.open(pURL, pName, str_windowProperties)
    if (parseInt(navigator.appVersion) >= 4) {
      obj_window.window.focus();
    }
}

// Flash Load
function flash(flashid, flashfilename, flashwidth, flashheight, flashvars, flashtrans) {
	document.write('<object id="' + flashid + '" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+ flashwidth +'" height="'+ flashheight +'">');
	document.write('<param name="allowScriptAccess" value="always" />');
	document.write('<param name="movie" value="'+ flashfilename +'">');
	if (flashvars) document.write('<param name="flashVars" value="'+ flashvars +'">');
	document.write('<param name="wmode" value="' + flashtrans + '">');
	document.write('<embed wmode="' + flashtrans + '" name="' + flashid + '"');
	if (flashvars) document.write(' flashVars="'+ flashvars +'" ');
	document.write(' src="'+ flashfilename +'" width="'+ flashwidth +'" height="'+ flashheight +'" ');
	document.write(' allowScriptAccess="always" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" >');
	document.write('</embed>');
	document.write('</object>');
}

// �̵�� �÷��̾�
function showMovie(val,w,h,n,f){
document.writeln("<object classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6' id='"+n+"' width='"+w+"' height='"+h+"'>");
document.writeln("<param name='url' value='"+val+"' />");
document.writeln("<param name='src' value='"+val+"' />");

if(f == "F") {
document.writeln("<param name='autostart' value='0' />");
} else {
document.writeln("<param name='autostart' value='1' />");
}

document.writeln("<param name='ShowStatusBar' value='0' />");
document.writeln("<param name='EnableTracker' value='0' />");
document.writeln("<param name='ShowTracker' value='0' />");
document.writeln("<param name='showpositioncontrols' value='0' />");
document.writeln("<param name='ShowAudioControls' value='1' />");
document.writeln('<param name="ShowDisplay" value="false">');
document.writeln("<!--[if !IE]> <-->");
document.writeln("<object type='application/x-mplayer2' data='"+val+"' width='"+w+"' height='"+h+"' id='"+n+"' name='"+n+"'>");
document.writeln("<param name='src' value='"+val+"' />");
document.writeln("<param name='autostart' value='1' />");
document.writeln("<param name='ShowStatusBar' value='0' />");
document.writeln("<param name='EnableTracker' value='0' />");
document.writeln("<param name='ShowTracker' value='0' />");
document.writeln("<param name='showpositioncontrols' value='0' />");
document.writeln("<param name='ShowAudioControls' value='1' />");
document.writeln('<param name="ShowDisplay" value="false">');
document.writeln("</object>");
document.writeln("<!--> <![endif]-->");
document.writeln("</object>");
}

/*
	������ > Ʈ���̵�ä�� > �̹��� ����/����
	total : �� �̹�����
	imgName : �̹��� �̸�
*/
function prevScreen(total,imgName) {
	prevPageNum = eval(document.getElementById('ScreenPage').value) - 1;
	
	if(prevPageNum == 0) {
		document.getElementById('ScreenImage').src="../img/customer/img_" + imgName + "_" + total + ".jpg";
		document.getElementById('ScreenTxt').src="../img/customer/txt_" + imgName + "_" + total + ".gif";
		document.getElementById('ScreenPage').value = total;
	} else {
		document.getElementById('ScreenImage').src="../img/customer/img_" + imgName + "_" + prevPageNum + ".jpg";
		document.getElementById('ScreenTxt').src="../img/customer/txt_" + imgName + "_" + prevPageNum + ".gif";
		
		document.getElementById('ScreenPage').value = prevPageNum;
	}
}
function nextScreen(total,imgName) {
	//alert(eval(document.getElementById('ScreenPage').value) + 1)
	//alert(total + 1)
	
	nextPageNum = eval(document.getElementById('ScreenPage').value) + 1;
	
	if(nextPageNum == total + 1) {
		document.getElementById('ScreenImage').src="../img/customer/img_" + imgName + "_1.jpg";
		document.getElementById('ScreenTxt').src="../img/customer/txt_" + imgName + "_1.gif";
		document.getElementById('ScreenPage').value = "1";
	} else {
		document.getElementById('ScreenImage').src="../img/customer/img_" + imgName + "_" + nextPageNum + ".jpg";
		document.getElementById('ScreenTxt').src="../img/customer/txt_" + imgName + "_" + nextPageNum + ".gif";
		
		document.getElementById('ScreenPage').value = nextPageNum;
	}
}

/* ���ʽ�Ŭ�� �����丮 */
function changeUrl() {
	 var goUrl = document.getElementById('winInterview').options[document.getElementById('winInterview').selectedIndex].value;
	 document.location.href = goUrl;	
}

/* �������� ���̾� �޴� */
function hideEduMenu() {
	document.getElementById('eduMenuOpen').style.display = "block";
	document.getElementById('eduMenuList').style.display = "none";
}


function showEduMenu() {
	document.getElementById('eduMenuOpen').style.display = "none";
	document.getElementById('eduMenuList').style.display = "block";
}

/* �������� */
function chEduLayer(num) {
	for(i=1;i<4;i++) {
		document.getElementById("LayerEmain_" +i).style.display = "block";
		document.getElementById("cLayerEmain_" +i).style.display = "none";
	}
		document.getElementById("LayerEmain_" + num).style.display = "none";
		document.getElementById("cLayerEmain_" + num).style.display = "block";
}
