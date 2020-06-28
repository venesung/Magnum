
/* footer_family */
function family(n){
  for(i=1;i<=2;i++){
	  if(i==n){
	  document.getElementById('family0'+n).style.display="block";
	  }else{
	  document.getElementById('family0'+i).style.display="none";
		}
	}
}

var moveto = '';
moveto += '<div class="compass">';
moveto += ' <ul>';
moveto += '		<li class="first"><a href="http://webc.magnumvint.com/project/huvitz/company/main/main.html">COMPANY INFO</a></li>';
moveto += '		<li class="on"><a href="http://webc.magnumvint.com/project/huvitz/optic/main/main.html">OPHTHALMIC &amp; OPTICAL</a></li>';
moveto += '		<li><a href="http://microscope.huvitz.com/kor/index.html">MICROSCOPE SYSTEM</a></li>';
moveto += '	</ul>';
moveto += '</div>';
moveto += '<div class="clear"></div>';








var gnb = '';
gnb += '<div class="gnb">';
gnb += '				<ul class="nb1">';
gnb += '					<li>';
gnb += '						<strong><a href="hrk-8000a.html">REFRACTIVE</a></strong><!-- 선택 : class="on"추가 -->';

gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="hrk-8000a.html">Auto Ref-Keratometer</a></li><!-- 선택 : class="on"추가 -->';
gnb += '								<li><a href="hlm-7000.html">Auto Lensmeter</a></li>';
gnb += '							    <li><a href="hdr-7000.html">Digital Refractor</a></li>';
gnb += '								<li><a href="hdc-9000n.html">Chart Projector</a></li>';
gnb += '							    <li><a href="hrt-7000.html">Unit Table</a></li>';
gnb += '							</ul>';				
gnb += '						</div>';
gnb += '						<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '					<li><strong><a href="hs-7000.html">DIAGNOSTIC</a></strong>';
gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="hs-7000.html">Slitlamp</a></li>';
gnb += '								<li><a href="hnt-7000.html">Non-contact Tonometer</a></li>';
gnb += '								<li><a href="ht-5000.html">Applanation Tonometer</a></li>';
gnb += '							</ul>';				
gnb += '						</div>';
gnb += '						<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '					<li><strong class="last"><a href="#">EDGING SOLUTION</a></strong>';
gnb += '					<!-- sub_navigation -->';
gnb += '						<div class="snb snb2" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li class="tab1">';
gnb += '                           		<a href="hpe-8000.html" class="on">Series</a>';
gnb += '                           		</li>';
gnb += '                           		<li class="snb3 open">';
gnb += '                        			<ul>';
gnb += '										<li><a href="hpe-8000.html">Kaizer Series </a></li>';				
gnb += '										<li><a href="hpe-7000.html">Excelon XD/XQ</a></li>';
gnb += '										<li><a href="cpe-4000.html">Excelon</a></li>';
gnb += '										<li><a href="cpe-3000.html">Excelon EZ</a></li>';
gnb += '              							<li><a href="remoteedging.html">Remote Edging Solution</a></li>';
gnb += '									</ul>';
gnb += '								</li>';
gnb += '								<li class="tab2"><a href="p_hpe-8000.html">Product Usage</a></li>';
gnb += '								<li class="snb3">';
gnb += '							 		<ul>';
gnb += '							 			<li><a href="p_hpe-8000.html">Edger</a></li>';
gnb += '							   			<li><a href="p_hfr-8000.html">Frame Tracer</a></li>';
gnb += '							  			<li><a href="p_hab-8000.html">Auto Blocker with Frame Tracker</a></li>';
gnb += '						  				<li><a href="p_hmb-8000.html">Blocker</a></li>';
gnb += '									</ul>';				
gnb += '								</li>';
gnb += '							</ul>';
gnb += '						</div>';
gnb += '           <!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '				</ul>';
gnb += '				<ul class="nb2">';
gnb += '					<li>';
gnb += '						<strong class="on"><a href="../support/download.html">SUPPORT</a></strong>';
gnb += '                         <!-- sub_navigation -->';
gnb += '                         <div class="snb" style="display:;">';
gnb += '                         	<ul>';
gnb += '                         		<li class="on"><a href="../support/download.html">DOWNLOAD</a></li>';
gnb += '                         		<li><a href="../support/service.html">원격지원서비스</a></li>';
gnb += '                        		<li><a href="../support/faq.html">FAQ</a></li>';
gnb += '								<li><a href="../support/counsel_list.html">1:1온라인 상담</a></li>';				
gnb += '							</ul>';
gnb += '						</div>';
gnb += '			<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '				</ul>';
gnb += '			</div>';
gnb += '				<!--/ gnb -->';


var footer = '';
footer += '<div id="footer">';
footer += '			<div class="logo"><img src="../img/footer/footer_logo.gif" alt="Huvitz" /></div>';
			
footer += '			<div class="info">';
footer += '				<p><span>A. 경기도 군포시 금정동  689-3 (주)휴비츠</span><span>T. 031-428-9100</span></p>';
footer += '				<p>Copyright 2008 Huvitz Corp. All rights reserved</p>';
footer += '			</div>';
footer += '            <ul class="link">';
footer += '				<li><a href="../support/privacy.html">개인정보 취급방침</a><span>|</span></li>';
footer += '				<li><a href="../support/terms.html">이용약관</a></li>';
footer += '			</ul>';
footer += '		</div>';