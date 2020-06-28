/*
 * ShMenuUtil ��ü
 *
 * Lee Won-Gyoon <mail.kido@gmail.com>
 * e-motion Corp.
*******************************************************************************/
var ShMenuUtil = {

	instnaceName : "ShMenuUtil",
	menuInstanceName : "ShMenu",
	menuFrame : null,
	/**
	* ShMenuUtil ��ü�� �����Ǿ����� ���θ� �˷��ش�.
	* �������� �߸�ã�ų� ��ü�������� Exception�� �߻���Ų��.
	* @return boolean
	*/
	isExist : function() {
		return true;
	},
	/**
	* ShMenu ��ü�� �����´�.
	* @return ShMenu ��ü
	*/
	getMenuInstance : function() {
		return eval(this.menuFrame+"."+this.menuInstanceName);
	},

	/**
	* �ش� �޴��� �̵��Ѵ�.
	* @param _menuCode �޴��ڵ�
	* @param _option ����ó���� �Ķ����
	* @return Void
	*/
	openMenuFromMenuCode : function(_menuCode, _option) {
		this.getMenuInstance().openMenuFromMenuCode(_menuCode, _option);
	},

	/**
	* �ش� �޴��� �̵��Ѵ�.
	* @param _skinCode �޴��ڵ�
	* @param _option ����ó���� �Ķ����
	* @return Void
	*/
	openMenuFromSkinCode : function(_skinCode, _option) {
		this.getMenuInstance().openMenuFromSkinCode(_skinCode, _option);
	},
	/**
	* �ش� �޴��� �̵��Ѵ�.
	* @param _htsCode HTS�ڵ�
	* @param _option ����ó���� �Ķ����
	* @return Void
	*/
	openMenuFromHtsCode : function(_htsCode, _option) {
		this.getMenuInstance().openMenuFromHtsCode(_htsCode, _option);
	},
	/**
	* ����� ������ �����Ѵ�.
	* @param _userName ����� �̸�
	* @param _userGrade ����� �α��ε��
	* @return Void
	*/
	updateUserSession : function(_userName, _userGrade, _userI) {
		this.getMenuInstance().updateUserSession(_userName, _userGrade, _userI);
	},

	/**
	* WAS ������ �����Ѵ�.
	* @param _wasCode
	* @return Void
	*/
	updateDocumentInfo : function(_wasCode) {
		this.getMenuInstance().updateDocumentInfo(_wasCode);
	},
	/**
	* �ʱ�ȭ
	* @return void
	*/
	initialize : function() {
		//alert('menu.util.js initialize');
		/* �޴� Data�� ������ Frame�� ã�´�. */
		try {
			if (parent.ShMenu.isExist()) {
				this.menuFrame = "parent";
			}
		} catch(e1) {
			try {
				if (parent.parent.ShMenu.isExist()) {
					this.menuFrame = "parent.parent";
				}
			} catch(e2) {
				try {
					if (parent.parent.parent.ShMenu.isExist()) {
						this.menuFrame = "parent.parent.parent";
					}
				} catch(e3) {
					try {
						if (parent.parent.parent.parent.ShMenu.isExist()) {
							this.menuFrame = "parent.parent.parent.parent";
						}
					} catch(e4) {
						this.menuFrame = "self";
						try {
							ShMenu.isExist();
						} catch(e) {
							out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/js/lib/richscript/xcms/front/menu/richscript.xcms.front.menu.js"></scr'+'ipt>');
							out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/js/lib/richscript/xcms/front/menu/richscript.xcms.front.menu.data.js"></scr'+'ipt>');
						}
					}
				}
			}
		}
		/* ����� ���������� �����´� */
		if (location.href.indexOf("bbs2.shinhaninvest.com") < 0) {


		      //out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/sscommon/jsp/updateUserSession.jsp?_temp='+(new Date()).getTime()+'"></scr'+'ipt>');
		      out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/common/updateUserSession.jsp?_temp='+(new Date()).getTime()+'"></scr'+'ipt>');
		      //alert("updateUserSession.js call");
		}
	}
};

ShMenuUtil.initialize();
/**
* �ش� �޴��� �̵��Ѵ�.
* @param _menuCode �޴��ڵ�
* @param _option ����ó���� �Ķ����
* @return Void
*/
function openMenu(_menuCode, _option) {
	openMenuFromMenuCode(_menuCode, _option);
}

/**
* �ش� �޴��� �̵��Ѵ�.
* @param _menuCode �޴��ڵ�
* @param _option ����ó���� �Ķ����
* @return Void
*/
function openMenuFromMenuCode(_menuCode, _option) {
	ShMenuUtil.openMenuFromMenuCode(_menuCode, _option);
}
/**
* �ش� �޴��� �̵��Ѵ�.
* @param _skinCode �޴��ڵ�
* @param _option ����ó���� �Ķ����
* @return Void
*/
function openMenuFromSkinCode(_skinCode, _option) {
	ShMenuUtil.openMenuFromSkinCode(_skinCode, _option);
}

/**
* �ش� �޴��� �̵��Ѵ�.
* @param _htsCode HTS�ڵ�
* @param _option ����ó���� �Ķ����
* @return Void
*/
function openMenuFromHtsCode(_htsCode, _option) {
	ShMenuUtil.openMenuFromHtsCode(_htsCode, _option);
}

/**
* �ش� �޴��� �˾����� �����Ѵ�.
* �߰� �Ķ���͸� �ް� ��� �޴� �ڵ� �ڿ� �̾ ���δ�.
* �Ķ���� ��� ��Ģ�� "/index.html" �� ������.
* @param _menuCode �޴��ڵ�
* @param _target Ÿ�ٸ�
* @return Void
*/
function openMenuPopup(_menuCode, _target) {
	var target = (_target==undefined||_target=="") ? "_blank" : _target;
	var menuPopup = open("/popup.index.html?menuCode="+_menuCode, target, "width=790,height=750,toolbar=0,menubar=0,scrollbars=yes,resizable=yes");
	try {
		menuPopup.focus();
	} catch(e) { }
}

/**
* ������ htsCode�� �ش��ϴ� �޴��� �˾����� �����Ѵ�.
* �߰� �Ķ���͸� �ް� ��� �޴� �ڵ� �ڿ� �̾ ���δ�.
* �Ķ���� ��� ��Ģ�� "/index.html" �� ������.
* @param _htsCode HTS �ڵ�
* @param _target Ÿ�ٸ�
* @return Void
*/
function openMenuPopupFromHtsCode(_htsCode, _target) {
	var target = (_target==undefined||_target=="") ? "_blank" : _target;
	var menuPopup = open("/popup.index.html?htsCode="+_htsCode, target, "width=790,height=750,toolbar=0,menubar=0,scrollbars=yes,resizable=yes");
	try {
		menuPopup.focus();
	} catch(e) { }
}

/**
* window.open�� ���ϰ����� ���� ȭ�鿡
* [object]��� ��µǴ� ���� �������ش�.
* ���� �� ����� window.open�� �����ϴ�.
* @param _url URL
* @param _target Ÿ��
* @param _option �ɼ�
* @return Void
*/
function openWindow(_url, _target, _option) {
	if (_target==undefined) _target = "_self";
	if (_option==undefined) _option = "";
	var popWin = open(_url, _target, _option);
	try {
		popWin.focus();
	} catch(e) { }
}

/**
* ȸ��Ұ��� �ش� �޴��� ��â���� �����Ѵ�.
* �߰� �Ķ���͸� �ް� ��� �޴� �ڵ� �ڿ� �̾ ���δ�.
* �Ķ���� ��� ��Ģ�� "/index.html" �� ������.
* @param _menuCode �޴��ڵ�
* @return Void
*/
function openCorpSite(_menuCode, _target) {
	var target = (_target==undefined||_target=="") ? "_blank" : _target;
	var menuPopup = open("/ir/index.html?menuCode="+_menuCode, target, "");
	try {
		menuPopup.focus();
	} catch(e) { }
}

/**
* ȸ��Ұ��� �ش� �޴��� �˾����� �����Ѵ�.
* �߰� �Ķ���͸� �ް� ��� �޴� �ڵ� �ڿ� �̾ ���δ�.
* �Ķ���� ��� ��Ģ�� "/index.html" �� ������.
* @param _menuCode �޴��ڵ�
* @param _target Ÿ�ٸ�
* @return Void
*/
function openCorpSitePopup(_menuCode, _target) {
	var target = (_target==undefined||_target=="") ? "_blank" : _target;
	var menuPopup = open("/ir/popup.index.html?menuCode="+_menuCode, target, "width=790,height=750,toolbar=0,menubar=0,scrollbars=yes,resizable=yes");
	try {
		menuPopup.focus();
	} catch(e) { }
}

/**
* _searchValue �Ķ���ͷ� �ް� ���հ˻����� �̵��Ѵ�.
* @param _searchValue �˻���
* @return Void
*/

function openSearchResult(_searchValue) {
//    openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["query="+_searchValue]);
//  openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["iStartCount=0&tempQuery=&selectBox=all&query="+_searchValue]);
    openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["iStartCount=0","tempQuery=","selectBox=all","query="+_searchValue]);
}


/**
* �α��� �� ���� �޴��� ���ƿö� ��� (�Ϲ� �α���)
* @param _option �α��� ���� �ɼ��� �����Ѵ�. Object�� �Ʒ��� �Ӽ��� ����Ѵ�.
*                - $LOGIN_URL : �α��� ȭ�� ���� ������ ���
*                - $RETURN_MENU_URL : �α��� �� ���ư� URL ���� ����
*                - $RETURN_MENU_CODE : �α��� �� ���ư� �޴��ڵ� ���� ����
*                (_option ���� String ���ڿ��� �Ѱ��ָ� �ڵ����� $RETURN_MENU_URL�� ���ȴ�.)
* @return Void
*/
function openLoginMenu(_option) {
	if (_option==undefined||_option==null) {
		_option = "";
	}
	var option = {};
	if (_option!="") {
		if (_option.constructorType()=="String") {
			option.$RETURN_MENU_URL = _option;
		} else if (_option.constructorType()=="Object") {
			option = _option;
		}
	}
	openMenu(ShMenuUtil.getMenuInstance().menuCode.login, option);
}


/**
* �α׾ƿ�
* @return Void
*/
function openLogoutMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.logout);
}


/**
* ID ���
* @return Void
*/
function openJoinMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.join);
}

/**
* ��������
* @return Void
*/
function openUserInfoMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.userInfo);
}

/**
* ��� ��������
* @return Void
*/

function openCertMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.cert);
}

/**
* shinhaninvest.com Ȩ���� �̵��Ѵ�.
* @return Void
*/

function openHome() {
	ShMenuUtil.getMenuInstance().openHome();
}

/**
* Dr.S ����Ʈ�� �̵��Ѵ�.
* @return Void
*/
function openDrS() {
    openWindow("http://wms.shinhaninvest.com/wms/cust_home/main.jsp","DrS","width=950,height=649,scrollbars=no,resizable=no");
}

/**
* ȸ��Ұ� ����Ʈ�� �̵��Ѵ�.
* @return Void
*/
function openShCorp() {
	open("/ir/", "_blank", "");
}


/**
* ���� ����Ʈ�� �̵��Ѵ�.
* @return Void
*/
function openShEnglish() {
	open("/eng/", "_blank", "");
}

/**
* �߹� ����Ʈ�� �̵��Ѵ�.
* @return Void
*/
function openShChinese() {
	open("http://www.shinhaninvest.com/cn/index.html", "_blank", "");
}

/**
* �߹� ����Ʈ�� �̵��Ѵ�.
* @return Void
*/
function openShFutures() {
    open("http://www.shinhaninvest.com/futures/index.jsp", "_blank", "");
}

function getXmlHttpRequest(){
    var xmlhttp = false;
    
    if(window.XMLHttpRequest){
        xmlhttp = new XMLHttpRequest();
    }else{
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    return xmlhttp;
}

function invalidate_session(){
    var xmlhttp = getXmlHttpRequest();
    xmlhttp.open("POST","/login/session_invalidate.jsp", true);
    xmlhttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xmlhttp.send(null);
}

/**
* �α׾ƿ�
* @return Void
*/
function logoff(option) {
    //CertManX.UnsetMatchedContext();
    clearCookie_logoff("JSESSIONID");
    setCookie_logoff("JSESSIONID","");
    setCookie_logoff("RAT","");
    setCookie_logoff("CRAT","");
    setCookie_logoff("LogonInfo","");
    setCookie_logoff("UID","");

    invalidate_session();

    if ((typeof(window.top.utilFrame) == "object")) {
        window.top.utilFrame.Logout();
    }
    if (option != "unreg")
        openHome();

//    alert("JSESSIONID: " + getCookie_logoff("JSESSIONID"));
//    alert("RAT: " + getCookie_logoff("RAT"));
//    alert("CRAT: " + getCookie_logoff("CRAT"));
//    alert("LogonInfo: " + getCookie_logoff("LogonInfo"));
}

function setCookie_logoff(name, value) {
    var path = '/';
    var domain = 'shinhaninvest.com';
    var today = new Date();
    today.setTime(today.getTime() + 24*60*60*1000);
    var oldvalue = getCookie_logoff(name);
    var expires = "";
    if (value == '') {
        if (oldvalue) {
            today = new Date("Thu, 01 Jan 2001 00:00:01");
            expires = "; expires=" + today.toGMTString();
        } else {
            return;
        }
    } else {
        expires = "";
    }

    var cookieStr = name + "=" + value + expires +
        ((path == null) ? "" : ("; path=" + path)) +
        ((domain == null) ? "" : ("; domain=" + domain));
    document.cookie = cookieStr;
}

function clearCookie_logoff(name) {
    var today = new Date("Thu, 01 Jan 2001 00:00:01");
    document.cookie = name + "=" + '' + ";" +
        "expires=" + today.toGMTString() + ";" +
        "path=" +  '/' + ";";
}

function getCookie_logoff(name) {
    var prefix = name + "=";
    var startIdx = document.cookie.indexOf(prefix);
    if (startIdx == -1)
        return null;
    var endIdx = document.cookie.indexOf(";", startIdx + prefix.length);
    if (endIdx == -1)
        endIdx = document.cookie.length;
    return unescape(document.cookie.substring(startIdx + prefix.length, endIdx));
}
/**
* �׻� ���ο� JSP�� �ε��ϵ��� �Ѵ�.
* @return Void
*/

function openMenuIndie(menu_keyword, _url) {
    var d = new Date();
    var strUrl = _url + "?dt=" + d.getMilliseconds();
    openMenu(menu_keyword, strUrl);
}

/**
* �˾����� ���� �޴�
* @return Void
*/

function openPopupIndie(menu_keyword, _url) {
    var sTarget = menu_keyword;
    var sOption;
    if (menu_keyword == "research_find") {          //����ġŽ����
        researchFind(_url);
        return;
    } else if (menu_keyword == "M1277875856948") {   //������ ��ȯ
        openMenuPopup(_url);
        return;
    }

    if (menu_keyword == "M1280191064678") {         //�ؿ��ֿ�����
        sOption = "width=960,height=732,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875851729") {  //�������
        sOption = "width=750,height=485,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1283761949843") {  //������Ź�׸�
        sOption = "width=710,height=665,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875593457") {  //�����������
        sOption = "width=770,height=680,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875654591") {  //�Ÿų���
        sOption = "width=765,height=513,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875659631") {  //�������� �ֹ�
        sOption = "width=742,height=868,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875665863") {  //��������/�����μ����ֹ�
        sOption = "width=742,height=770,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875749870") {  //�ؿ�����
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875764698") {  //�������� > ������
        sOption = "width=780,height=800,scrollbars=yes,resizable=no";
    } else if (menu_keyword == "M1277875769940") {  //�������� > ��й�
        sOption = "width=780,height=800,scrollbars=yes,resizable=no";
    } else if (menu_keyword == "M1277875754483") {  //�Ѱ����ǹ��
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "chartwin") {        //�ֽ�������Ʈ
        sOption = "width=835,height=505,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875744996") {  //���ս�Ȳ
        sOption = "width=722,height=782,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1286013209416") {  //�������պм�
        sOption = "width=957,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1287712146103") {  //KOSPI200 �����߰��ŷ�
        sOption = "width=770,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1287712152994") {  //������ǰ����
        sOption = "width=720,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659639") {  //���� ����
        sOption = "width=731,height=730,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659632") {  //���� ���� �ֽ��ֹ�
        sOption = "width=731,height=730,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659633") {  //���޴��� �ܰ���ȸ
        sOption = "width=766,height=473,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659634") {  //���޴��� ��Ȳ
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659635") {  //����/�ż��Ұ�����
        sOption = "width=766,height=407,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659636") {  //�ݴ�Ÿ���ȸ
        sOption = "width=766,height=340,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659637") {  //�ݴ�Ÿ� ������ȸ
        sOption = "width=780,height=550,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754484") {  //���丶�����ǹ��
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754485") {  //on �丶��
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754486") {  //�̵��ϸ� ���ǹ��
        sOption = "width=600,height=400,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754487") {  //�̵��ϸ� ���ǹ�� ��û
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754488") {  //�̵��ϸ� ���ǹ�� ����
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754489") {  //�̵��ϸ� ���ǹ�� �ȳ�
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    }else if (menu_keyword == "M1277875754490") {  //etf_index
        sOption = "width=1080,height=835,scrollbars=yes,resizable=yes";
    }


    openWindow(_url, sTarget, sOption);
}

/**
* ����ġŽ����
* @return Void
*/
function researchFind(_url) {
    var oUrl = "/search/research_find.jsp";
    var sTarget = "research_find";
    var sOption = "width=921,height=826,scrollbars=yes,resizable=yes";
    var strUrl;
    if (_url != null && _url != '' && typeof(_url) != "undefined") {
        strUrl = _url;
    } else {
        strUrl = oUrl + "?iStartCount=0&query=&board_code=&nick_name=&cname=&selcheck=&menustatus1=Y&menustatus2=Y&menustatus3=Y&menustatus4=Y&menustatus5=Y&btnstatus1=Y&btnstatus2=Y&btnstatus3=Y&btnstatus4=Y&btnstatus5=Y&florstatus1=Y&florstatus2=Y&florstatus3=Y&florstatus4=Y&florstatus5=Y";
    }
    openWindow(strUrl, sTarget, sOption);
}

/**
* �ش� �޴��� ��â���� �����Ѵ�.
* �߰� �Ķ���͸� �ް� ��� �޴� �ڵ� �ڿ� �̾ ���δ�.
* �Ķ���� ��� ��Ģ�� "/index.html" �� ������.
* @param _menuCode �޴��ڵ�
* @return Void
*/

function openCurrSite(_menuCode, _target) {
    var target = (_target==undefined||_target=="") ? "_blank" : _target;
    var menuPopup = open("/index.html?menuCode="+_menuCode, target, "");
    try {
        menuPopup.focus();
    } catch(e) { }
}

/**
* �¾��̴��� �̿밡�̵� �˾��� ȣ���Ѵ�.
* @return Void
*/
function openGoodiGuide(arg) {
    if (arg == null || arg == "" || arg == "0") {
        //�����ϱ�
        openWindow("/common/guide.jsp?activeNum=0", "_blank", "width=970,height=685,scrollbars=no,resizable=no");
    } else if (arg == "2") {
        //Ʈ���̵����̵�
        openWindow("/common/guide.jsp?activeNum=2", "_blank", "width=970,height=685,scrollbars=no,resizable=no");
    }
}


/**
* ������ǰ���̵� �˾��� ȣ���Ѵ�.
* @return Void
*/

function openProductGuide() {
    openWindow("/product/guide/index.html","pguide","width=778,height=530,scrollbars=yes,resizable=no");
}


/**
* ����Ķ���� �˾��� ȣ���Ѵ�.
* @return Void
*/

function openFinanceCalendar(arg) {
    if (arg == "" || arg == null) {
        openWindow("/asset/my/financeCalendar.jsp?menu=", "fcal", "width=960,height=850,scrollbars=yes,resizable=yes");
    } else {
        openWindow("/asset/my/financeCalendar.jsp?menu=" + arg, "fcal", "width=960,height=850,scrollbars=yes,resizable=yes");
    }
}


function openOldWebService() {
    openWindow("/pop/goodi_service_main.jsp", "oldweb", "width=1000,height=750,scrollbars=yes,resizable=yes");
}
function openFtindex() {
    openWindow("/pop/ftindex.jsp", "ftindex", "width=715,height=750,scrollbars=yes,resizable=yes");
}

/**
* ���� �޴��ڵ带 �����Ѵ�.
* @return String
*/

function getCurrMenuCode() {
    if (ShMenuUtil.getMenuInstance().getShMenuUI() == null)
        return "M1277876094145";
    else
        return ShMenuUtil.getMenuInstance().getShMenuUI().currentMenu.menuCode;
}

/**
* ���� UserID�� �����Ѵ�.
* @return String
*/

function getCurrUserId() {
    return ShMenuUtil.getMenuInstance().userSession.userId;
}

/**
* ����/�ɼ� �޴�
* @return Void
*/
function menuFutures() {
    alert("���� �����Դϴ�.");
    openMenu("M1277875427712");
}

