<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.scard.hp.im.et.evt.vo.NHPIMETEVT002VO"%>
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="ko" lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/css/et.css" />
<link rel="stylesheet" type="text/css" href="/css/base.css" />
<script type="text/javascript" src="/js/common-hp.js"></script>
<%	
	ArrayList<NHPIMETEVT002VO> resultArr = (ArrayList<NHPIMETEVT002VO>)request.getAttribute("resultList");
	String errorMessage = (String)request.getAttribute("errorMessage");
	
%>
</head>
<body onload="resize()">

	<table class="dtable01"  summary="종료된 이벤트의 정보입니다."  >
	<caption>종료된 이벤트</caption>
	<colgroup>
		<col width="10%" />
		<col width="12%" />
		<col width="12%" />
		<col width="12%" />
		<col width="*" />
	</colgroup>
	<tbody>
	<% if("".equals(errorMessage)){
			for(int i=0;i<resultArr.size();i++){
				NHPIMETEVT002VO resultVo = new NHPIMETEVT002VO();
				resultVo = (NHPIMETEVT002VO)resultArr.get(i);
	%>
		<!-- loop -->
		<tr >
			<td class="t_no cell_l10" align="center" ><%=i+1%></td>
			<td class="t_no" align="center"><%=resultVo.getLottDate().substring(0,4)%>.<%=resultVo.getLottDate().substring(4,6) %></td>
			<td class="t_no" align="center"><%=resultVo.getRegDate().substring(0,4)%>.<%=resultVo.getRegDate().substring(4,6) %></td>
			<td class="t_no" align="center"><%=resultVo.getApproveNo()%></td>
			<td class="cell_r10" style="text-align: left;" >
				<%
					if("001".equals(resultVo.getPrizeId())){
				%>
						프리미엄상 100만원 당첨 (제세공과금 제외시 78만원)
				<%	}else if("002".equals(resultVo.getPrizeId())){ %>
						특별상  50만원 당첨 (제세공과금 제외시 39만원)
				<%	}else if("004".equals(resultVo.getPrizeId())){%>
						행운상  10만원 당첨 (제세공과금 제외시 7.8만원)
				<%	}else if("041".equals(resultVo.getPrizeId())){%>
						Birthday 서비스 당첨 (아래내용 참조)
				<%	}else if("0L3".equals(resultVo.getPrizeId())){%>
						 Lucky7  3개 5천원 당첨!
				<%	}else if("0L4".equals(resultVo.getPrizeId())){%>
				 		Lucky7  4개 5만원 당첨!! (제세공과금 제외시 3.9만원)
				<%	}else if("0L5".equals(resultVo.getPrizeId())){%>
						Lucky7  5개 50만원 당첨!!! (제세공과금 제외시 39만원)
				<%	}else if("0L6".equals(resultVo.getPrizeId())){%>
					Lucky7  6개 500만원 당첨!!!! (제세공과금 제외시 390만원)
				<%} %>
			</td>
		</tr>
		<%}
		}else{ %>
            <tr align="center">
              <td colspan="5"><%=errorMessage %></td>
            </tr>
		<%} %>
	</tbody>
	</table>

</body>
</html>