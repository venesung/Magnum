<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.scard.hp.common.util.TimeUtil"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//이벤트 구분 (gubun_no이 ""인 경우 단순 이벤트건수조회)
	String gubun_no = request.getParameter("gubun_no");
	int currentDate = NumberUtils.toInt(TimeUtil.CurrentTime("yyyyMMdd"));
	int start = 20100701;
	int end   = 20100731; 

	//이벤트적용기간 여부
	String active_yn = "N";
	if(currentDate >= start && currentDate <= end ){
		active_yn = "Y";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>이벤트 응모 - 삼성카드</title>
<script type="text/javascript">
	function fnOnLoad(){
		//이벤트팝업이 뜨는 조건
		//1. 응모한 적이 없는 보물일경우 (apply_Yn:0 -> 미응모 1-> 응모)
		//2. 로그인을 하지 않은경우
		//3. 이벤트 기간이 끝나지 않은경우
		//alert('${login_Yn}');
		//alert('${apply_Yn}');
		//alert('${return_msg}');
		//alert('<=active_yn%>');
		if(('${login_Yn}'== "N" && '<%=active_yn%>' == "Y" && '${return_msg}' == "") || ('${login_Yn}'== "Y" && '${apply_Yn}'== "0" && '<%=active_yn%>' == "Y")){
			if(parent.document.all['treasureF1']) {
				parent.document.all['treasureF1'].style.visibility = "visible";
			} else if (parent.document.all['treasure<%=request.getParameter("gubun_no")%>F1']){
				parent.document.all['treasure<%=request.getParameter("gubun_no")%>F1'].style.visibility = "visible";
			}
		}else if('${login_Yn}'== "N" && '<%=active_yn%>' == "Y" && '${return_msg}' != ""){
                parent.parent.scardLogin('/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=9538','eventLogin');
				//로그인 유도하는 팝업화면 띄우기
				//window.open("/hp/im/et/evt/viewDiamondPop.do?apply_cnt="+'${total_appy_cnt}'+"&login_yn="+'${login_Yn}'+"&foward=fromEvent","sspopup", "width=470, height=342, scrollbars=0, toolbar=no, menubar=0, status=0, location=0, resizable=0") ;
				return;
		}

		//총이벤트 건수에 따른 팝업호출
		if('${total_appy_cnt}' != "" && '<%=gubun_no%>' != ""){		//이벤트응모후 건수조회			
            window.open("/hp/im/et/evt/viewDiamondPop.do?apply_cnt="+'${total_appy_cnt}'+"&amp;login_yn="+'${login_Yn}'+"&amp;foward=","sspopup", "width=470, height=342, scrollbars=0, toolbar=no, menubar=0, status=0, location=0, resizable=0") ;
			//보물아이콘 숨기기
			hidden_treasure();	

			//==============================================================
			//이벤트응모 성공후 호출해야만 이벤트응모완료 로그가 저장됨
			//==============================================================
            document.weblogForm.action="/hp/im/et/evt.do?method=fineEventDetailLog&amp;cmsSeq=9538&amp;offercd=&end=Y";
			document.weblogForm.target = "weblog_iframe";
			document.weblogForm.submit();
			
		}else if('${total_appy_cnt}' != "" && '<%=gubun_no%>' == ""){	//단순이벤트건수조회
            window.open("/hp/im/et/evt/viewDiamondPop.do?apply_cnt="+'${total_appy_cnt}'+"&amp;login_yn="+'${login_Yn}'+"&amp;foward=fromEvent","sspopup", "width=470, height=342, scrollbars=0, toolbar=no, menubar=0, status=0, location=0, resizable=0") ;
			//보물아이콘 숨기기
			hidden_treasure();		
		}
	}

	//이벤트 응모를 위한 로그인호출
	function go_Check(gubun_no)
	{
		if('${login_Yn}'== "N"){
			//로그인 유도하는 팝업화면 띄우기
            window.open("/hp/im/et/evt/viewDiamondPop.do?apply_cnt="+'${total_appy_cnt}'+"&amp;login_yn="+'${login_Yn}'+"&amp;foward=&amp;gubunNo="+gubun_no,"sspopup", "width=470, height=342, scrollbars=0, toolbar=no, menubar=0, status=0, location=0, resizable=0") ;
			//보물아이콘 숨기기
			hidden_treasure();			
		}else{
			//해당이벤트 응모
			apply_Diamond(gubun_no);
		}
    }

	//이벤트응모
    function apply_Diamond(gubun_no)
	{
        url="/hp/im/et/evt003.do?method=setDiamondApply&amp;gubun_no="+gubun_no;
		location.href=url;
    }

	  //이벤트보기
	  function go_eventDetail(){
        url = "/hp/im/et/evt.do?method=getEventDetail&amp;cmsSeq=9538";
	  	parent.location.href = url;
	  }

	//보물숨기기	
    function hidden_treasure(){
	    if(parent.document.all['treasureF1']) {
			parent.document.all['treasureF1'].style.visibility = "hidden";
		} else if (parent.document.all['treasure<%=request.getParameter("gubun_no")%>F1']){
			parent.document.all['treasure<%=request.getParameter("gubun_no")%>F1'].style.visibility = "hidden";
		}
    }


  	//로그인팝업 호출
    function login_pop(gubun){
    	//if(gubun == 'A')parent.scardLogin('','eventLogin');
    	//if(gubun == 'B')parent.scardLogin('NHPIMCDCPS001','eventLogin');
    	//if(gubun == 'C')parent.scardLogin('NHPIMMHMGP001','eventLogin');
    	//if(gubun == 'D')parent.scardLogin('NHPIMFSCOM001','eventLogin');
    	//if(gubun == 'E')parent.scardLogin('NHPIMMHMYS005','eventLogin');

    	if(gubun == 'A')parent.scardLogin('','eventLogin');
    	if(gubun == 'B')parent.scardLogin('/cps.do?method=getCardSrchIntro','eventLogin');
    	if(gubun == 'C')parent.scardLogin('/hp/im/mh/mgp/NHPIMMHMGPVIEW001JSP.do','eventLogin');
    	if(gubun == 'D')parent.scardLogin('/hp/im/fs/csh/openhpimfscom001.do','eventLogin');
    	if(gubun == 'E')parent.scardLogin('/hp/im/mh/mys001.do?method=getBonus','eventLogin');
    	
    	
    }
    

</script>
</head>
<body onload="fnOnLoad();"></body>

<!-- 웹로그 전송을 위한 form -->
<form name="weblogForm" action="" target="weblog" method="post"></form>
<iframe frameborder="0" height="0" src="" width="0" id ="weblog_iframe" name="weblog_iframe" title="빈 프레임" ></iframe>


</html>
