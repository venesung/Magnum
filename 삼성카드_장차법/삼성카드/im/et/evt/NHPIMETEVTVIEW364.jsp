<%/*
 * Project Name : 삼성카드 웹 이노베이션 프로젝트
 * File Name    : NHPIMMHPIT058.jsp 이마트포인트 상세팝업조회
 * Author       : 삼성SDS 김효정선임
 * Created on 2010. 5. 16.
 *
 * COPYRIGHT 2009 SAMSUNG SDS. ALL RIGHT RESERVED.
 */%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>삼성카드</title>
<script language="javascript" type="text/javascript">

var g_bSwitch = false;    //페이지 오픈시 물어보기 설정값.[ture:onload시 물어봄.] 
//if (g_bSwitch) window.onload = fnIconCreate; 
function fnIconCreate() { 

    try { 

        var WshShell = new ActiveXObject("WScript.Shell");
        Desktoptemp = WshShell.Specialfolders("Desktop");    //path 
        if (confirm("바탕화면에 바로가기 아이콘을 생성하시겠습니까?")) { 
        

            var sIconNm = "okjsp";    //바탕 화면에 생성될 아이콘 명. 
            var sName = WshShell.CreateShortcut(Desktoptemp + "\\" + sIconNm + ".URL"); 
            sName.TargetPath = "http://www.okjsp.pe.kr"; 

            sName.Save(); 
        } 
    } 
    catch (e) { 
        alert("현재 보안 설정으로는 바탕화면에 바로가기 아이콘을 생성할 수 없습니다."); 
    } 
} 

</script>
</head>


<body>
<a href="javascript:window.external.AddFavorite('http://test.com','test');">즐겨찾기</a>
<br/>
<a href="#" onclick="fnIconCreate();">바탕화면바로가기</a>
</body>
</html>
