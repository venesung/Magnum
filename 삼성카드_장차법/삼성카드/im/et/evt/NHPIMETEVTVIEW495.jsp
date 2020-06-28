
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<title>3x3빙고 이벤트 - 삼성카드</title>

<%
	String loginYN = (String)request.getAttribute("loginYN");
	String gradeYN = (String)request.getAttribute("gradeYN");
%>

<!--<div id="tab_script">-->

<style type="text/css">
*, body {margin:0; padding:0;}
body, li, dt, dd, input, select, textarea, p, span, th, td {color:#666; font-size:12px; font-family:"돋움", applegothic, sans-serif; line-height:20px}
img	{border:0 none; vertical-align:middle; font-size:0; line-height:0}
.bingoWrap{background:url(/images/event/bingo201205/bg_bingo.jpg) repeat-y 0 0;}
.hidden{position:absolute; left:-1000px; top:0; width:0px; height:0px; font-size:1%; line-height:0; overflow:hidden;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/et/bingo201205_embedswf.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common-main.js"></script>

<script language="javascript" type="text/javascript">

var loginYN  = "<%=loginYN%>";
var gradeYN  = "<%=gradeYN%>";
var eventNo  = "26636";
var orgBingo = "0";
var selIndex = "0";
var arrBingo = null;

function bingoCallJson(callId, mvcBeanId, methodName, params, callback, errorHandler, addQueryString, withoutXecure) {
	if (callId == null || mvcBeanId == null || methodName == null) {
		alert("Invalid Call");
		return;
	}

	if (params == null) {
		params = "";
	}

	if (callback == null) {
		callback = "jsonCallback";
	}

	if (errorHandler == null) {
		errorHandler = "jsonCallback";
	}

	var uri = "/json/request.json?mvcBeanId=" + mvcBeanId;
    uri += "&amp;methodName=" + methodName;

	if (addQueryString) {
        uri += "&amp;" + addQueryString;
	}

	try {
		_resetTimeout();
	} catch(e) {}
	
	$.post(uri, params, function(data) {
		_jsonCallback(callback, errorHandler, callId, data);
	}, "json");
	
}

function makeArrBingo(strBingoStatus) {
	var arrTemp = new Array(9);
	
	for(var i=0; i<strBingoStatus.length; i++) {
		arrTemp[i] = strBingoStatus.substring(i, i + 1);
	}

	return arrTemp;
}

function startBingo() {
	parent.initTimeout();
	
	if(loginYN == "N") {
		parent.eventLogin(eventNo);
	} else {
		if(gradeYN == "Y") {
			var param = "eventNo=" + eventNo;
			bingoCallJson("startBingo201205", "com.scard.hp.im.et.evt.web.NHPIMETEVT002Ctrl", "startBingo201205", param, "callback");
		} else {
			alert("회원님께서는 이벤트에 참여하실 권한이 없습니다.");
		}
	}
}

function callback(callId, result) {
	if(callId == "startBingo201205") {
		if(result.loginYN == "N") {
			parent.eventLogin(eventNo);
		} else {
			if(result.gradeYN == "Y") {
				if(result.rstBingo) {
					flash.fStart(
					{
						status : result.status,
						count : result.count,
						bingo : result.bingo,
						point : addComma(result.point)
					});
	
					orgBingo = result.bingo;
					arrBingo = makeArrBingo(result.status);
				} else {
					alert("이벤트 진행 중 오류가 발생하였습니다.\n다시 참여해주시기 바랍니다.");
				}
			} else {
				alert("회원님께서는 이벤트에 참여하실 권한이 없습니다.");
			}
		}
	} else if(callId == "setBingo201205") {
		if(result.loginYN == "N") {
			parent.eventLogin(eventNo);
		} else {
			if(result.gradeYN == "Y") {
				if(result.rstBingo) {
					flash.fUpdate(
					{
						status : result.status,
						count : result.count,
						bingo : result.bingo,
						point : addComma(result.point)
					});
	
					if(parseInt(result.bingo) > parseInt(orgBingo)) {
						flash.fPopup({index:selIndex, status:'1', bingo:result.bingo})
						orgBingo = result.bingo;
					} else {
						flash.fPopup({index:selIndex, status:'1', bingo:'0'})
					}
	
					arrBingo = makeArrBingo(result.status);
				} else {
					alert("이벤트 진행 중 오류가 발생하였습니다.\n다시 참여해주시기 바랍니다.");
				}
			} else {
				alert("회원님께서는 이벤트에 참여하실 권한이 없습니다.");
			}
		}
	}
}

function EmbedFlash()
{
    var flashVars =
    {
        //debug : "true"
    };

    embedSWF("flashLayer", "/flash/event/Bingo201205.swf", "648", "418",
    {
        id : "flash"
    },
    {
        allowScriptAccess : "always",
        allowFullscreen : "true",
        wmode : "transparent"
    }, flashVars);

    if(loginYN == "Y") {
		if(gradeYN == "Y") {
			var param = "eventNo=" + eventNo;
			bingoCallJson("startBingo201205", "com.scard.hp.im.et.evt.web.NHPIMETEVT002Ctrl", "startBingo201205", param, "callback");
		} else {
			alert("회원님께서는 이벤트에 참여하실 권한이 없습니다.");
		}
	}
}

function fCheck(index)
{
	parent.initTimeout();
	
    selIndex = index + "";

    if(arrBingo[index] == "0") {
    	flash.fPopup(
    	{
    		index : selIndex,
    		status : "0",
    		bingo: "0"
    	});
	} else if(arrBingo[index] == "1") {
    	arrBingo[index] = "2";
		var bingoStatus = "";
	
		for(var i=0; i<arrBingo.length; i++) {
			bingoStatus += arrBingo[i];
		}
		
        var param = "eventNo=" + eventNo + "&amp;status=" + bingoStatus;
	    bingoCallJson("setBingo201205", "com.scard.hp.im.et.evt.web.NHPIMETEVT002Ctrl", "setBingo201205", param, "callback");
    }
}

function fLink(type)
{
    parent.initTimeout();
    
    switch(type)
    {
        case "goHowToUse":	// 포인트 사용방법 보기
        	parent.goTabPage('NHPIMSSCMS001');
            break;
        case "goMyFamily":	// MY패밀리서비스 자세히보기
            parent.goTabPage('NHPIMSSFAM001M002');
            break;
        case "goBenefit":	// 우대혜택 서비스 자세히 보기
            parent.goTabPage('NHPIMSSSBC001M001');
            break;
    }
}

function addComma(val)
{
	var num = val;

	if(num.length <= 3) return num;

	var loop = Math.ceil(num.length / 3);
	var offset = num.length % 3;
	if(offset == 0) offset = 3;
	var str = num.substring(0, offset);

	for(i=1; i<loop; i++) {
		str += "," + num.substring(offset, offset + 3);
		offset += 3;
	}
	
	return str;
}

</script>
<!--</div>-->

</head>

<body onLoad="EmbedFlash()">

	<div class="bingoWrap">
		<p><img src="/images/event/bingo201205/event_bingo01.jpg" alt="삼성카드3x3 빙고이벤트" /></p>
        <div class="hidden">
            <p>Big 이벤트!</p>
            <h1>삼성카드 3X3 빙고 이벤트</h1>
            <p>삼성카드가 5월의 행운을 드립니다! 푸짐한 삼성카드 헤택은 기본 추가로 푸짐한 포인트 경품까지 받는 환상을 경험해 보세요</p>
            
            <dl>
                <dt>행사기간</dt>
                <dd>2012년 5월 1일(화) ~ 6월 15일(금)</dd>
                <dt>응모기간</dt>
                <dd>2012년 5월 1일(화) ~ 6월 20일 (수)</dd>
                <dt>행사내용</dt>
                <dd>네모칸의 조건에 맞게 카드를 사용하시면 빙고게임에 참여할 수 있는 도장을 드리며 빙고줄 완성 시 포인트를 제공해드립니다.</dd>
                <dt>당첨자 발표</dt>
                <dd>2012년 6월 28일 홈페이지 당첨자 발표란 게시</dd>
                <dt>서비스 포인트 적립</dt>
                <dd>2012년 7월 6일(금)</dd>
            </dl>
        </div>
		<div id="flashLayer" style="padding:0 40px;">
		</div>
			
		<p><img src="/images/event/bingo201205/event_bingo03.jpg" alt="" border="0" usemap="#bingo" /></p>			
        <div class="hidden">
            <h2>게임방법</h2>
            <ol>
                <li>1단계 - 각 칸의 조건에 맞게 삼성카드를 이용한다</li>
                <li>2단계 - 이용 후 빙고 칸에 도장을 찍는다.</li>
                <li>3단계 - 한줄 한줄 완성하고 포인트를 받는다.</li>
            </ol>
            
            <h2>서비스 포인트 적립 및 경품안내 (누적)</h2>
            <ul>
                <li>1줄 - 1,000포인트</li>
                <li>2줄 - 2,000포인트</li>
                <li>3줄 - 3,000포인트</li>
                <li>4줄 - 4,000포인트</li>
                <li>5줄 - 5,000포인트</li>
                <li>6줄 - 6,000포인트</li>
                <li>완성 - 10,000포인트</li>
            </ul>
            
            <p>
                <strong>서비스포인트란?</strong>
                삼성카드 포인트 적립행사와 관련하여 적립되는 포인트로 보너스포인트, 빅포인트와 합산하여 사용하실 수 있습니다. 유효기간은 1년이며 유효기간 내 미사용시 자동소멸 됩니다.
            </p>
            <p>삼성카드 홈페이지 로그인 시 이용금액에 따라 게임 기회가 자동으로 부여됩니다.</p>
            <p>유의사항</p>
            <ul>
                <li>- 응모한 본인 카드 사용 승인 및 결재 건의 승인 취소 혹은 매출 취소될 경우, 해당 당첨 사실이 무효처리 됩니다.</li>
                <li>- 본 행사는 개인신용카드, 가족카드, 법인개별카드만 해당됩니다.(법인공통, 올앳카드, 기프트카드 , 체크카드 등은 제외)</li>
                <li>- 행사기간 이외의 카드 결제 건으로는 본 행사에 참여하실 수 없습니다.</li>
                <li>- 서비스 포인트 적립은 행사 종료 후에 일괄 적립됩니다.</li>
                <li>- 행사 종료(6월 15일) 후 6월 20일까지는 빙고 참여가 가능합니다.(단, 빙고 지급 기회는 행사기간 중에만 생성됩니다.)</li>
            </ul>            
        </div>
		
		
		
		<map name="bingo" id="bingo">
		<area shape="rect" coords="515,15,668,54" href="javascript:startBingo();" alt="start" />
		</map>
	</div>

<%@ include file="/WEB-INF/jsp/common/footer_new.jsp"%>

</body>

</html>

