<%@ page contentType="text/html; charset=euc-kr"%>
<%
	//�� ���� ����. script ȣ�� �Լ��� body�� �� ���κп� ��ġ.
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

<!-- �׽�Ʈ������ Ű : 0c10e88d1dd9d7848d2d3156342f8881 -->
<!-- �Ǽ����� Ű : 5e75aebea3fd8abb8aa5893f50716fff -->
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
			str_name="����";
			str_addr="��� ������ �д籸 ������ 171(���ڵ� 215)";
			str_tel="1588-1604";
			str_fax="(031)710-0117~8";
			str_subway="�д缱 �̱ݿ� 2,3 �� �ⱸ (������ 15 �� �ҿ�)";
			str_bus="700, 77-1, 33-1, 116, 2-1, 720, 51 ��";
			str_gbus="1001, 1005-1, 2002, 2002-1, 9000, 9001, 9401, 9403, 9404, 9407, 9408, 9414, 303 ��";
		} else if (value =="02") {
			str_x ="276841";
			str_y ="528331";
			str_name="��õ��������";
			str_addr="��õ������ ������ �۵��� 364 (406-130)";
			str_tel="(032)810-4502";
			str_fax="(032)810-4609";
			str_subway="��õ����ö ������ ����";
			str_bus="";
			str_gbus="";
		} else if (value =="03") {
			str_x ="295964";
			str_y ="489196";
			str_name="���ñ�������";
			str_addr="��� ���ý� ������ ���縸�� 175-88 (451-822)";
			str_tel="(031)680-3222";
			str_fax="(031)680-3396";
			str_subway="";
			str_bus="";
			str_gbus="�����͹̳�-������(40�а��� �������)-�������� ����";
		} else if (value =="04") {
			str_x ="438080";
			str_y ="260829";
			str_name="�뿵��������";
			str_addr="�泲 �뿵�� ������ ������ 770 (650-824)";
			str_tel="(055)640-6100";
			str_fax="(055)640-6190";
			str_subway="";
			str_bus="���͹̳ο��� �뿵�� ����";
			str_gbus="";
		} else if (value =="05") {
			str_x ="298138";
			str_y ="551175";
			str_name="������������";
			str_addr="���� ������ ���״�� 340 (157-280)";
			str_tel="(02)2657-1014";
			str_fax="(02)2657-1039";
			str_subway="��������ö 5ȣ�� �߻꿪 ���� 5���ⱸ(88ü���� ����)";
			str_bus="";
			str_gbus="";
		} else if (value =="06") {
			str_x ="300310";
			str_y ="523207";
			str_name="������������";
			str_addr="��� �Ȼ�� ��ϱ� ���η� 1248 (426-790)";
			str_tel="(031)400-7500";
			str_fax="(031)406-2643";
			str_subway="4ȣ�� ��ϼ��� ����(���� 15�� �ҿ�)";
			str_bus="��� ������ ��ϼ��� ����";
			str_gbus="�������� 909, 707, 110";
		} else if (value =="07") {
			str_x ="290744";
			str_y ="289603";
			str_name="��������";
			str_addr="���ֱ����� ���걸 ����� 368-21 (506-253)";
			str_tel="(062)950-1114";
			str_fax="(062)950-1112";
			str_subway="";
			str_bus="39, 60";
			str_gbus="";
		} else if (value =="08") {
			str_x ="474771";
			str_y ="363688";
			str_name="�����������";
			str_addr="��� ���� ������ ����6�� 122 (712-830)";
			str_tel="(053)850-1900";
			str_fax="(053)850-1824";
			str_subway="";
			str_bus="890�� ������Ÿ� ���� �� �ýý���(���� �� 20��)";
			str_gbus="840�� ������Ÿ� ���� �� �ýý���";
		} else if (value =="09") {
			str_x ="483367";
			str_y ="292280";
			str_name="�泲��������";
			str_addr="�泲 ���ؽ� ���ش�� 2569���� 53 (621-914)";
			str_tel="(055)330-7700";
			str_fax="(055)335-5456";
			str_subway="";
			str_bus="130, 127, 128";
			str_gbus="130-1, 309, 310";
		} else if (value =="10") {
			str_x ="396240";
			str_y ="524109";
			str_name="������������";
			str_addr="���� ���ֽ� �ܱ��� 423 (220-823)";
			str_tel="(033)760-6605";
			str_fax="(033)760-6639";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="11") {
			str_x ="346884";
			str_y ="416404";
			str_name="��û��������";
			str_addr="���������� �߱� ����õ���� 788 (301-840)";
			str_tel="(042)229-3403";
			str_fax="(042)229-3439";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="12") {
			str_x ="292692";
			str_y ="372470";
			str_name="������������";
			str_addr="���� ����� ��߸� ���ڷ� 12 (573-913)";
			str_tel="(063)850-3800";
			str_fax="(063)850-3829";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="13") {
			str_x ="519072";
			str_y ="508601";
			str_name="��ô���� ����";
			str_addr="������ ��ô�� ������ ȣ���غ��� 18 (245-803)";
			str_tel="(033)575-5500";
			str_fax="(033)575-5599";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="14") {
			str_x ="300392";
			str_y ="523354";
			str_name="�������߿�";
			str_addr="��� �Ȼ�� ��ϱ� �ϵ� 638-1";
			str_tel="(031)400-7500";
			str_fax="(031)406-2643";
			str_subway="4ȣ�� ��ϼ��� ����(���� 15�� �ҿ�)";
			str_bus="��� ������ ��ϼ��� ����";
			str_gbus="�������� 909, 707, 110";
		} else if (value =="15") {
			str_x ="459740";
			str_y ="537941";
			str_name="����������";
			str_addr="���� ������ ����� �ۼ��� 287-14 (233-852)";
			str_tel="(033)563-4070";
			str_fax="(033)563-4079";
			str_subway="";
			str_bus="";
			str_gbus="";
		} else if (value =="16") {
			str_x ="281900";
			str_y ="531520";
			str_name="��õ�������а�";
			str_addr="��õ������ ������ �۵��� 364 (406-130)";
			str_tel="(032)822-4492";
			str_fax="(032)822-4495";
			str_subway="��õ����ö ������ ����";
			str_bus="";
			str_gbus="";
		} else if (value =="17") {
			str_x ="345477";
			str_y ="426317";
			str_name="���ѱ������������";
			str_addr="���������� ������ ������ 1227";
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
			str_traffic +="����ö : " + str_subway;
		}
		if (str_bus != "")
		{
			str_traffic +="<br>�ó����� : " + str_bus
		}
		if (str_gbus != "")
		{
			str_traffic +="<br>�¼����� : " + str_gbus
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
			<h3>���ô� ��</h3>
			<div class="btn_pre">
				<a href="#">����ȭ��</a>
			</div>
		</div>		
	</div>
	
	<div class="cont"> 
		<ul class="liT01">
			<li><a href="part1_1.jsp">�Ұ�</a></li>
			<li><a href="part1_2.jsp">����</a></li>
			<li class="on"><a href="part1_3.jsp">���ô±�</a></li>
			<li><a href="part1_4.jsp">������</a></li>
			 <div class="clear"></div>
		</ul>

		<div class="srchbar">
			<div class="srchbar_in">
				<label for="typeSelect" class="bold">����˻�</label>
				<select name="selectBranch" id="selectBranch" title="����˻�">
					<option value="01" selected>����</option>
					<option value="02">��õ��������</option>
					<option value="03">���ñ�������</option>
					<option value="04">�뿵��������</option>
					<option value="05">������������</option>
					<option value="06">������������</option>
					<option value="07">������������</option>
					<option value="08">�����������</option>
					<option value="09">�泲��������</option>
					<option value="10">������������</option>
					<option value="11">��û��������</option>
					<option value="12">������������</option>
					<option value="13">��ô��������</option>
					<option value="14">�������߿�</option>
					<option value="15">����������</option>
					<option value="16">��õ�������а�</option>
					<option value="17">(��)�ѱ������������</option>
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
				<th>��Ī</th>
				<td id="map_detail_name">����</td>	
			</tr>
			<tr>
				<th>�ּ�</th>
				<td id="map_detail_addr">��� ������ �д籸<br> ������ 171(���ڵ� 215)</td>	
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td id="map_detail_tel">1588-1604</td>	
			</tr>
			<tr>
				<th>FAX</th>
				<td id="map_detail_fax">(031)710-0117~8</td>	
			</tr>
			<tr class="none">
				<th>���߱���</th>
				<td id="map_detail_subway">���߱��� ����ö �д缱 �̱ݿ� 2, 3�� �ⱸ (������ 15�мҿ�) <br> �ó����� : 700, 77-1, 33-1, 116, 2-1,  720, 51 �� <br> �¼����� : 1001, 1005-1, 2002, 2002-1,   9000, 9001, 9401, 9403, 9404, 9407, 9408,   9414, 303 �� </td>	
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
