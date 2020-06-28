<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="../../inc/hd.jsp"%>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas_9.gif" alt="투자정보"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_list.jsp"><img src="../../images/stit9_1_off.png" alt="IR정보"></a></li>			
				<li><a href="part2_1.jsp"><img src="../../images/stit9_2_on.png" alt="재무정보"></a></li>		
				<li><a href="part3_list.jsp"><img src="../../images/stit9_3_off.png" alt="공고"></a></li> 
                <li><a href="part4_1.jsp"><img src="../../images/stit9_4_off.png" alt="경영공시"></a></li>
			</ul>
		</div>
		<div class="hd_bt">
			<h3>경영지표</h3>
		</div>		
	</div>
	
	<div class="cont"> 
		<ul class="u_liT01 u_liT01_w50">
			<li><a href="part2_1.jsp">재무제표</a></li>
			<li class="on"><a href="part2_2.jsp">경영지표</a></li>			
			 <div class="clear"></div>
		</ul>
		<ul class="title u05_ul_1">
			<li class="u05_li_1">
				<h4>주요 경영비율</h4>
                <div class="text_right mab0"></div>
				<table cellspacing="0" summary="안정성지표" class="u05_tbl_02 mab20 mat10">
					<caption>안정성지표</caption>
					<colgroup>
						<col width="40%"/>
						<col width="15%"/>
						<col width="15%"/>	
						<col width="15%"/>		
                        <col width="15%"/>		
					</colgroup>
					<thead>
						<tr>
						  <th rowspan="2">구분</th>
						  <th colspan="2" class="lline">별도</th>
						  <th colspan="2" class="lline">연결</th>
					  </tr>
						<tr>
						<th class="lline">2012</th>
						<th class="lline">2011</th>
						<th class="lline">2012</th>
						<th class="lline">2011</th>
						</tr>
					</thead>
					<tbody>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>유 동 비 율</strong><br />
					      (유동자산/유동부채)×100</th>
                        <td>112.2%</td>
					    <td>153.9%</td>
					    <td>115.7%</td>
					    <td class="last">147.3%</td>
					  </tr>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>부 채 비 율</strong><br />
					      (부채/자기자본)×100</th>
                        <td>394.05%</td>
					    <td>364.35%</td>
					    <td>385.39%</td>
					    <td class="last">347.73% </td>
					  </tr>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>이자보상배율</strong><br />
					      (영업이익/이자비용)</th>
                        <td>1.27배 </td>
					    <td>1.38배 </td>
					    <td>1.48배</td>
					    <td class="last">1.41배</td>
					  </tr>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>영업이익율</strong><br />
					      (영업이익/매출액)×100</th>
                        <td>3.47%</td>
					    <td>3.56%</td>
					    <td>3.62%</td>
					    <td class="last">3.60%</td>
					  </tr>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>총자산순이익율(ROA)</strong><br />
					      (당기순이익/총자산)×100</th>
                        <td>1.28%</td>
					    <td>0.61%</td>
					    <td>0.89%</td>
					    <td class="last">0.49% </td>
					  </tr>
					  <tr class="tbl tbl2 tblC">
					    <th scope="row"><strong>자기자본이익율(ROE)</strong><br />
					      (당기순이익/자기자본)×100</th>
                        <td>6.35%</td>
					    <td>2.83%</td>
					    <td>4.33%</td>
					    <td class="last">2.17% </td>
					  </tr>
					</tbody>
				</table>
		        
		  </li>
		</ul>		
</div>	

	<%@ include file="../../inc/footer.jsp"%>
</div>
</body>
</html>
