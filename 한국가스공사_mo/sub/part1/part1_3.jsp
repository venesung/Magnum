<%@ page contentType="text/html; charset=euc-kr"%>
<%
	//맵 선택 변수. script 호출 함수는 body의 맨 끝부분에 위치.
	String mapSelect = (request.getParameter("mapNum")==null)?"01":request.getParameter("mapNum").trim();
	
	String mapSelectArray[] = {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17"};
	
	for(int i=0; i<mapSelectArray.length; i++){
		if(mapSelect.trim().equals(mapSelectArray[i].trim())){
			mapSelectArray[i] = "selected=\"selected\"";
		}else{
			mapSelectArray[i] = "";
		}	
	}

%>

<%@ include file="../../inc/hd.jsp"%>

<!-- 테스트서버용 키 : 0c10e88d1dd9d7848d2d3156342f8881 -->
<!-- 실서버용 키 : 5e75aebea3fd8abb8aa5893f50716fff -->
<script language="javascript" type="text/javascript" src="http://map.naver.com/js/naverMap.naver?key=662a1a6d61d0e30fcb776083846eb60d"></script>
<script type="text/javascript">
<!--
	function mapInit(mapX, mapY) {
		var mapObj = new NMap(document.getElementById('location_map'),330,367);
		mapObj.setCenterAndZoom(new NPoint(mapX,mapY),3);
		var zoom =new NZoomControl();
		zoom.setAlign("left");
		zoom.setValign("top");
		mapObj.addControl(zoom);
	
		var icon = new NMark2(new NPoint(mapX,mapY), new NIcon('logo.png', 
				new NSize(92, 32), 
				new NSize(11, 30)));
		icon.setZindex(5);
		mapObj.addOverlay(icon, "mark");
		icon.enableShift();
	}

	function mapChange(value) {
		if (value == "")
		{
			var selectBranch = document.getElementById("selectBranch");
			value = selectBranch.value;
		}
		
		str_x ="";
		str_y ="";
		str_name ="";
		str_addr ="";
		str_tel ="";
		str_fax ="";
		str_subway ="";
		str_bus ="";
		str_gbus ="";
		if (value =="01") {
			str_x ="321988";
			str_y ="528482";
			str_name="본사";
			str_addr="경기 성남시 분당구 돌마로 171(정자동 215)";
			str_tel="1588-1604";
			str_fax="(031)710-0117~8";
			str_subway="분당선 미금역 2,3 번 출구 (도보로 15 분 소요)";
			str_bus="700, 77-1, 33-1, 116, 2-1, 720, 51 등";
			str_gbus="1001, 1005-1, 2002, 2002-1, 9000, 9001, 9401, 9403, 9404, 9407, 9408, 9414, 303 등";
		} else if (value =="02") {
			str_x ="276841";
			str_y ="528331";
			str_name="인천기지본부";
			str_addr="인천광역시 연수구 송도동 364 (406-130)";
			str_tel="(032)810-4502";
			str_fax="(032)810-4609";
			str_subway="인천지하철 동막역 하차";
			str_bus="";
			str_gbus="";
		} else if (value =="03") {
			str_x ="295964";
			str_y ="489196";
			str_name="평택기지본부";
			str_addr="경기 평택시 포승읍 남양만로 175-88 (451-822)";
			str_tel="(031)680-3222";
			str_fax="(031)680-3396";
			str_subway="";
			str_bus="";
			str_gbus="남부터미널-안중행(40분간격 직행버스)-원정리행 버스";
		} else if (value =="04") {
			str_x ="438080";
			str_y ="260829";
			str_name="통영기지본부";
			str_addr="경남 통영시 광도면 안정로 770 (650-824)";
			str_tel="(055)640-6100";
			str_fax="(055)640-6190";
			str_subway="";
			str_bus="고성터미널에서 통영행 버스";
			str_gbus="";
		} else if (value =="05") {
			str_x ="298138";
			str_y ="551175";
			str_name="서울지역본부";
			str_addr="서울 강서구 공항대로 340 (157-280)";
			str_tel="(02)2657-1014";
			str_fax="(02)2657-1039";
			str_subway="서울지하철 5호선 발산역 하차 5번출구(88체육관 방향)";
			str_bus="";
			str_gbus="";
		} else if (value =="06") {
			str_x ="300310";
			str_y ="523207";
			str_name="경인지역본부";
			str_addr="경기 안산시 상록구 수인로 1248 (426-790)";
			str_tel="(031)400-7500";
			str_fax="(031)406-2643";
			str_subway="4호선 상록수역 하차(도보 15분 소요)";
			str_bus="모든 버스가 상록수역 경유";
			str_gbus="수원에서 909, 707, 110";
		} else if (value =="07") {
			str_x ="290744";
			str_y ="289603";
			str_name="지역본부";
			str_addr="광주광역시 광산구 손재로 368-21 (506-253)";
			str_tel="(062)950-1114";
			str_fax="(062)950-1112";
			str_subway="";
			str_bus="39, 60";
			str_gbus="";
		} else if (value =="08") {
			str_x ="474771";
			str_y ="363688";
			str_name="경북지역본부";
			str_addr="경북 경산시 진량읍 공단6로 122 (712-830)";
			str_tel="(053)850-1900";
			str_fax="(053)850-1824";
			str_subway="";
			str_bus="890번 진량삼거리 하차 후 택시승차(도보 약 20분)";
			str_gbus="840번 진량삼거리 하차 후 택시승차";
		} else if (value =="09") {
			str_x ="483367";
			str_y ="292280";
			str_name="경남지역본부";
			str_addr="경남 김해시 김해대로 2569번지 53 (621-914)";
			str_tel="(055)330-7700";
			str_fax="(055)335-5456";
			str_subway="";
			str_bus="130, 127, 128";
			str_gbus="130-1, 309, 310";
		} else if (value =="10") {
			str_x ="396240";
			str_y ="524109";
			str_name="강원지역본부";
			str_addr="강원 원주시 단구로 423 (220-823)";
			str_tel="(033)760-6605";
			str_fax="(033)760-6639";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="11") {
			str_x ="346884";
			str_y ="416404";
			str_name="충청지역본부";
			str_addr="대전광역시 중구 유등천동로 788 (301-840)";
			str_tel="(042)229-3403";
			str_fax="(042)229-3439";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="12") {
			str_x ="292692";
			str_y ="372470";
			str_name="전북지역본부";
			str_addr="전북 군산시 대야면 만자로 12 (573-913)";
			str_tel="(063)850-3800";
			str_fax="(063)850-3829";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="13") {
			str_x ="519072";
			str_y ="508601";
			str_name="삼척기지 본부";
			str_addr="강원도 삼척시 원덕읍 호산해변길 18 (245-803)";
			str_tel="(033)575-5500";
			str_fax="(033)575-5599";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="14") {
			str_x ="300392";
			str_y ="523354";
			str_name="연구개발원";
			str_addr="경기 안산시 상록구 일동 638-1";
			str_tel="(031)400-7500";
			str_fax="(031)406-2643";
			str_subway="4호선 상록수역 하차(도보 15분 소요)";
			str_bus="모든 버스가 상록수역 경유";
			str_gbus="수원에서 909, 707, 110";
		} else if (value =="15") {
			str_x ="459740";
			str_y ="537941";
			str_name="정선연수원";
			str_addr="강원 정선군 북평면 송석길 287-14 (233-852)";
			str_tel="(033)563-4070";
			str_fax="(033)563-4079";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="16") {
			str_x ="281900";
			str_y ="531520";
			str_name="인천가스과학관";
			str_addr="인천광역시 연수구 송도동 364 (406-130)";
			str_tel="(032)822-4492";
			str_fax="(032)822-4495";
			str_subway="인천지하철 동막역 하차";
			str_bus="";
			str_gbus="";
		} else if (value =="17") {
			str_x ="345477";
			str_y ="426317";
			str_name="㈜한국가스기술공사";
			str_addr="대전광역시 유성구 대덕대로 1227";
			str_tel="(02)657-1200";
			str_fax="(02)657-1209";
			str_subway="";
			str_bus="";
			str_gbus="";
		}
		var detail_name = document.getElementById("map_detail_name");
		var detail_addr = document.getElementById("map_detail_addr");
		var detail_tel = document.getElementById("map_detail_tel");
		var detail_fax = document.getElementById("map_detail_fax");
		var detail_subway = document.getElementById("map_detail_subway");
	
		detail_name.innerHTML = str_name;
		detail_addr.innerHTML = str_addr;
		detail_tel.innerHTML = str_tel;
		detail_fax.innerHTML = str_fax;
		var str_traffic = "";
		
		if (str_subway != "")
		{
			str_traffic +="지하철 : " + str_subway;
		}
		if (str_bus != "")
		{
			str_traffic +="<br>시내버스 : " + str_bus
		}
		if (str_gbus != "")
		{
			str_traffic +="<br>좌석버스 : " + str_gbus
		}
		detail_subway.innerHTML = str_traffic;
		mapInit(str_x,str_y);
	}

	function init () {
		mapChange("01");
	}

	function addLoadEvent(func) {
	  var oldonload = window.onload;
	  if(typeof window.onload != 'function') {
		window.onload = func;
	  } else {
		window.onload = function() {
		  oldonload();
		  func;
		}
	  }
	}
//-->
</script>

	<h2 class="hdh2"><a href="main.jsp"><img src="../../images/tit_kogas.png" alt="KOGAS"></a></h2>  

		<div class="hd_md">
			<ul class="smenu">
				<li><a href="part1_1.jsp"><img src="../../images/stit1_1_on.png"></a></li>				
				<li><a href="part2.jsp"><img src="../../images/stit1_2_off.png"></a></li>				
				<li><a href="part3.jsp"><img src="../../images/stit1_3_off.png"></a></li>
				<li class="none"><a href="part4_1.jsp"><img src="../../images/stit1_4_off.png"></a></li>				
			</ul>
		</div>
		<div class="hd_bt">
			<h3>오시는 길</h3>
			<div class="btn_pre">
				<a href="#">이전화면</a>
			</div>
		</div>		
	</div>
	
	<div class="cont"> 
		<ul class="liT01">
			<li><a href="part1_1.jsp">소개</a></li>
			<li><a href="part1_2.jsp">연혁</a></li>
			<li class="on"><a href="part1_3.jsp">오시는길</a></li>
			<li><a href="part1_4.jsp">조직도</a></li>
			 <div class="clear"></div>
		</ul>

		<div class="srchbar">
			<div class="srchbar_in">
				<label for="typeSelect" class="bold">지사검색</label>
				<select name="selectBranch" id="selectBranch" title="지사검색">
					<option value="01" selected>본사</option>
					<option value="02">인천기지본부</option>
					<option value="03">평택기지본부</option>
					<option value="04">통영기지본부</option>
					<option value="05">서울지역본부</option>
					<option value="06">경인지역본부</option>
					<option value="07">전남지역본부</option>
					<option value="08">경북지역본부</option>
					<option value="09">경남지역본부</option>
					<option value="10">강원지역본부</option>
					<option value="11">충청지역본부</option>
					<option value="12">전북지역본부</option>
					<option value="13">삼척기지본부</option>
					<option value="14">연구개발원</option>
					<option value="15">정선연수원</option>
					<option value="16">인천가스과학관</option>
					<option value="17">(주)한국가스기술공사</option>
				</select>
				<a href="#notice-list" onclick="return mapChange('');" onkeypress="this.onclick()"><img src="../../images/btn_srch.gif"></a>
			</div>
		</div>

		<div class="mapBox">
			<div class="mapBoxIn">
				<div class="location_map">
					<div id="location_map" style="position:relative;width:100% !important;"></div>
				</div>
			</div>
		</div>

		<table cellspacing="0" summary="" class="tbT01">
			<caption></caption>
			<col width="25%"/>
			<col/>
			<tbody>
			<tr>
				<th>명칭</th>
				<td id="map_detail_name">본사</td>	
			</tr>
			<tr>
				<th>주소</th>
				<td id="map_detail_addr">경기 성남시 분당구<br> 돌마로 171(정자동 215)</td>	
			</tr>
			<tr>
				<th>전화번호</th>
				<td id="map_detail_tel">1588-1604</td>	
			</tr>
			<tr>
				<th>FAX</th>
				<td id="map_detail_fax">(031)710-0117~8</td>	
			</tr>
			<tr class="none">
				<th>대중교통</th>
				<td id="map_detail_subway">대중교통 지하철 분당선 미금역 2, 3번 출구 (도보로 15분소요) <br> 시내버스 : 700, 77-1, 33-1, 116, 2-1,  720, 51 등 <br> 좌석버스 : 1001, 1005-1, 2002, 2002-1,   9000, 9001, 9401, 9403, 9404, 9407, 9408,   9414, 303 등 </td>	
			</tr>
			</tbody>
		</table>
	</div>

	<%@ include file="../../inc/footer.jsp"%>
	
	<script language="JavaScript" type="text/javascript">
		addLoadEvent(mapChange('<%=mapSelect%>'));
	</script>
	
</div>
</body>
</html>
