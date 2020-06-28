/*
 * ShMenuUtil 객체
 *
 * Lee Won-Gyoon <mail.kido@gmail.com>
 * e-motion Corp.
*******************************************************************************/
var ShMenuUtil = {

	instnaceName : "ShMenuUtil",
	menuInstanceName : "ShMenu",
	menuFrame : null,
	/**
	* ShMenuUtil 객체가 생성되었는지 여부를 알려준다.
	* 프레임을 잘못찾거나 객체가없으면 Exception을 발생시킨다.
	* @return boolean
	*/
	isExist : function() {
		return true;
	},
	/**
	* ShMenu 객체를 가져온다.
	* @return ShMenu 객체
	*/
	getMenuInstance : function() {
		return eval(this.menuFrame+"."+this.menuInstanceName);
	},

	/**
	* 해당 메뉴로 이동한다.
	* @param _menuCode 메뉴코드
	* @param _option 예외처리할 파라미터
	* @return Void
	*/
	openMenuFromMenuCode : function(_menuCode, _option) {
		this.getMenuInstance().openMenuFromMenuCode(_menuCode, _option);
	},

	/**
	* 해당 메뉴로 이동한다.
	* @param _skinCode 메뉴코드
	* @param _option 예외처리할 파라미터
	* @return Void
	*/
	openMenuFromSkinCode : function(_skinCode, _option) {
		this.getMenuInstance().openMenuFromSkinCode(_skinCode, _option);
	},
	/**
	* 해당 메뉴로 이동한다.
	* @param _htsCode HTS코드
	* @param _option 예외처리할 파라미터
	* @return Void
	*/
	openMenuFromHtsCode : function(_htsCode, _option) {
		this.getMenuInstance().openMenuFromHtsCode(_htsCode, _option);
	},
	/**
	* 사용자 정보를 셋팅한다.
	* @param _userName 사용자 이름
	* @param _userGrade 사용자 로그인등급
	* @return Void
	*/
	updateUserSession : function(_userName, _userGrade, _userI) {
		this.getMenuInstance().updateUserSession(_userName, _userGrade, _userI);
	},

	/**
	* WAS 정보를 셋팅한다.
	* @param _wasCode
	* @return Void
	*/
	updateDocumentInfo : function(_wasCode) {
		this.getMenuInstance().updateDocumentInfo(_wasCode);
	},
	/**
	* 초기화
	* @return void
	*/
	initialize : function() {
		//alert('menu.util.js initialize');
		/* 메뉴 Data를 포함한 Frame을 찾는다. */
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
		/* 사용자 세션정보를 가져온다 */
		if (location.href.indexOf("bbs2.shinhaninvest.com") < 0) {


		      //out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/sscommon/jsp/updateUserSession.jsp?_temp='+(new Date()).getTime()+'"></scr'+'ipt>');
		      out.print('<scr'+'ipt type="text/javascr'+'ipt" src="/common/updateUserSession.jsp?_temp='+(new Date()).getTime()+'"></scr'+'ipt>');
		      //alert("updateUserSession.js call");
		}
	}
};

ShMenuUtil.initialize();
/**
* 해당 메뉴로 이동한다.
* @param _menuCode 메뉴코드
* @param _option 예외처리할 파라미터
* @return Void
*/
function openMenu(_menuCode, _option) {
	openMenuFromMenuCode(_menuCode, _option);
}

/**
* 해당 메뉴로 이동한다.
* @param _menuCode 메뉴코드
* @param _option 예외처리할 파라미터
* @return Void
*/
function openMenuFromMenuCode(_menuCode, _option) {
	ShMenuUtil.openMenuFromMenuCode(_menuCode, _option);
}
/**
* 해당 메뉴로 이동한다.
* @param _skinCode 메뉴코드
* @param _option 예외처리할 파라미터
* @return Void
*/
function openMenuFromSkinCode(_skinCode, _option) {
	ShMenuUtil.openMenuFromSkinCode(_skinCode, _option);
}

/**
* 해당 메뉴로 이동한다.
* @param _htsCode HTS코드
* @param _option 예외처리할 파라미터
* @return Void
*/
function openMenuFromHtsCode(_htsCode, _option) {
	ShMenuUtil.openMenuFromHtsCode(_htsCode, _option);
}

/**
* 해당 메뉴를 팝업으로 오픈한다.
* 추가 파라미터를 달고갈 경우 메뉴 코드 뒤에 이어서 붙인다.
* 파라미터 사용 규칙은 "/index.html" 과 동일함.
* @param _menuCode 메뉴코드
* @param _target 타겟명
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
* 지정한 htsCode에 해당하는 메뉴를 팝업으로 오픈한다.
* 추가 파라미터를 달고갈 경우 메뉴 코드 뒤에 이어서 붙인다.
* 파라미터 사용 규칙은 "/index.html" 과 동일함.
* @param _htsCode HTS 코드
* @param _target 타겟명
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
* window.open의 리턴값으로 인해 화면에
* [object]라고 출력되는 것을 방지해준다.
* 사용법 및 기능은 window.open과 동일하다.
* @param _url URL
* @param _target 타겟
* @param _option 옵션
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
* 회사소개의 해당 메뉴를 새창으로 오픈한다.
* 추가 파라미터를 달고갈 경우 메뉴 코드 뒤에 이어서 붙인다.
* 파라미터 사용 규칙은 "/index.html" 과 동일함.
* @param _menuCode 메뉴코드
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
* 회사소개의 해당 메뉴를 팝업으로 오픈한다.
* 추가 파라미터를 달고갈 경우 메뉴 코드 뒤에 이어서 붙인다.
* 파라미터 사용 규칙은 "/index.html" 과 동일함.
* @param _menuCode 메뉴코드
* @param _target 타겟명
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
* _searchValue 파라미터로 달고 통합검색으로 이동한다.
* @param _searchValue 검색어
* @return Void
*/

function openSearchResult(_searchValue) {
//    openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["query="+_searchValue]);
//  openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["iStartCount=0&tempQuery=&selectBox=all&query="+_searchValue]);
    openMenu(ShMenuUtil.getMenuInstance().menuCode.search, ["iStartCount=0","tempQuery=","selectBox=all","query="+_searchValue]);
}


/**
* 로그인 후 현재 메뉴로 돌아올때 사용 (일반 로그인)
* @param _option 로그인 관련 옵션을 설정한다. Object로 아래의 속성을 사용한다.
*                - $LOGIN_URL : 로그인 화면 임의 지정시 사용
*                - $RETURN_MENU_URL : 로그인 후 돌아갈 URL 임의 지정
*                - $RETURN_MENU_CODE : 로그인 후 돌아갈 메뉴코드 임의 지정
*                (_option 값을 String 문자열로 넘겨주면 자동으로 $RETURN_MENU_URL로 사용된다.)
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
* 로그아웃
* @return Void
*/
function openLogoutMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.logout);
}


/**
* ID 등록
* @return Void
*/
function openJoinMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.join);
}

/**
* 정보수정
* @return Void
*/
function openUserInfoMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.userInfo);
}

/**
* 상단 공인인증
* @return Void
*/

function openCertMenu() {
	openMenu(ShMenuUtil.getMenuInstance().menuCode.cert);
}

/**
* shinhaninvest.com 홈으로 이동한다.
* @return Void
*/

function openHome() {
	ShMenuUtil.getMenuInstance().openHome();
}

/**
* Dr.S 사이트로 이동한다.
* @return Void
*/
function openDrS() {
    openWindow("http://wms.shinhaninvest.com/wms/cust_home/main.jsp","DrS","width=950,height=649,scrollbars=no,resizable=no");
}

/**
* 회사소개 사이트로 이동한다.
* @return Void
*/
function openShCorp() {
	open("/ir/", "_blank", "");
}


/**
* 영문 사이트로 이동한다.
* @return Void
*/
function openShEnglish() {
	open("/eng/", "_blank", "");
}

/**
* 중문 사이트로 이동한다.
* @return Void
*/
function openShChinese() {
	open("http://www.shinhaninvest.com/cn/index.html", "_blank", "");
}

/**
* 중문 사이트로 이동한다.
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
* 로그아웃
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
* 항상 새로운 JSP를 로딩하도록 한다.
* @return Void
*/

function openMenuIndie(menu_keyword, _url) {
    var d = new Date();
    var strUrl = _url + "?dt=" + d.getMilliseconds();
    openMenu(menu_keyword, strUrl);
}

/**
* 팝업으로 띄우는 메뉴
* @return Void
*/

function openPopupIndie(menu_keyword, _url) {
    var sTarget = menu_keyword;
    var sOption;
    if (menu_keyword == "research_find") {          //리서치탐색기
        researchFind(_url);
        return;
    } else if (menu_keyword == "M1277875856948") {   //예수금 전환
        openMenuPopup(_url);
        return;
    }

    if (menu_keyword == "M1280191064678") {         //해외주요지수
        sOption = "width=960,height=732,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875851729") {  //대용증권
        sOption = "width=750,height=485,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1283761949843") {  //인포스탁테마
        sOption = "width=710,height=665,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875593457") {  //기업종합정보
        sOption = "width=770,height=680,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875654591") {  //매매내역
        sOption = "width=765,height=513,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875659631") {  //프리보드 주문
        sOption = "width=742,height=868,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875665863") {  //수익증권/신주인수권주문
        sOption = "width=742,height=770,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875749870") {  //해외지수
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875764698") {  //투자정보 > 종목상담
        sOption = "width=780,height=800,scrollbars=yes,resizable=no";
    } else if (menu_keyword == "M1277875769940") {  //투자정보 > 토론방
        sOption = "width=780,height=800,scrollbars=yes,resizable=no";
    } else if (menu_keyword == "M1277875754483") {  //한경증권방송
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "chartwin") {        //주식종합차트
        sOption = "width=835,height=505,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875744996") {  //종합시황
        sOption = "width=722,height=782,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1286013209416") {  //종목종합분석
        sOption = "width=957,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1287712146103") {  //KOSPI200 선물야간거래
        sOption = "width=770,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1287712152994") {  //국내상품선물
        sOption = "width=720,height=800,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659639") {  //제휴 대출
        sOption = "width=731,height=730,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659632") {  //제휴 대출 주식주문
        sOption = "width=731,height=730,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659633") {  //제휴대출 잔고조회
        sOption = "width=766,height=473,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659634") {  //제휴대출 현황
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659635") {  //보유/매수불가종목
        sOption = "width=766,height=407,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659636") {  //반대매매조회
        sOption = "width=766,height=340,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875659637") {  //반대매매 예상조회
        sOption = "width=780,height=550,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754484") {  //이토마토증권방송
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754485") {  //on 토마토
        sOption = "width=960,height=815,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754486") {  //이데일리 증권방송
        sOption = "width=600,height=400,scrollbars=no,resizable=no";
    } else if (menu_keyword == "M1277875754487") {  //이데일리 증권방송 신청
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754488") {  //이데일리 증권방송 해지
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    } else if (menu_keyword == "M1277875754489") {  //이데일리 증권방송 안내
        sOption = "width=766,height=488,scrollbars=yes,resizable=yes";
    }else if (menu_keyword == "M1277875754490") {  //etf_index
        sOption = "width=1080,height=835,scrollbars=yes,resizable=yes";
    }


    openWindow(_url, sTarget, sOption);
}

/**
* 리서치탐색기
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
* 해당 메뉴를 새창으로 오픈한다.
* 추가 파라미터를 달고갈 경우 메뉴 코드 뒤에 이어서 붙인다.
* 파라미터 사용 규칙은 "/index.html" 과 동일함.
* @param _menuCode 메뉴코드
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
* 굿아이닷컴 이용가이드 팝업을 호출한다.
* @return Void
*/
function openGoodiGuide(arg) {
    if (arg == null || arg == "" || arg == "0") {
        //시작하기
        openWindow("/common/guide.jsp?activeNum=0", "_blank", "width=970,height=685,scrollbars=no,resizable=no");
    } else if (arg == "2") {
        //트레이딩가이드
        openWindow("/common/guide.jsp?activeNum=2", "_blank", "width=970,height=685,scrollbars=no,resizable=no");
    }
}


/**
* 금융상품가이드 팝업을 호출한다.
* @return Void
*/

function openProductGuide() {
    openWindow("/product/guide/index.html","pguide","width=778,height=530,scrollbars=yes,resizable=no");
}


/**
* 금융캘린더 팝업을 호출한다.
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
* 현재 메뉴코드를 리턴한다.
* @return String
*/

function getCurrMenuCode() {
    if (ShMenuUtil.getMenuInstance().getShMenuUI() == null)
        return "M1277876094145";
    else
        return ShMenuUtil.getMenuInstance().getShMenuUI().currentMenu.menuCode;
}

/**
* 현재 UserID를 리턴한다.
* @return String
*/

function getCurrUserId() {
    return ShMenuUtil.getMenuInstance().userSession.userId;
}

/**
* 선물/옵션 메뉴
* @return Void
*/
function menuFutures() {
    alert("서비스 예정입니다.");
    openMenu("M1277875427712");
}

