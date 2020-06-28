
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
gnb += '						<strong><a href="../huvitz/ceo.html">HUVITZ</a></strong><!-- 선택 : class="on"추가 -->';

gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="../huvitz/ceo.html">CEO 인사말</a></li><!-- 선택 : class="on"추가 -->';
gnb += '								<li><a href="../huvitz/manage_phil.html">경영이념</a></li>';
gnb += '							     <li><a href="../huvitz/history.html">연혁</a></li>';
gnb += '								<li><a href="../huvitz/award.html">수상실적</a></li>';
gnb += '							    <li><a href="../huvitz/ci.html">CI</a></li>';
gnb += '								<li><a href="../huvitz/subsidiary.html">계열사</a></li>';
gnb += '                                <li><a href="../huvitz/location.html">위치안내</a></li>';
gnb += '							</ul>';				
gnb += '						</div>';
gnb += '						<!--/ sub_navigation -->';
gnb += '					</li>';
gnb += '					<li><strong><a href="../business/business.html">BUSINESS</a></strong>';
gnb += '						<!-- sub_navigation -->';
gnb += '						<div class="snb" style="display:none;">';
gnb += '							<ul>';
gnb += '								<li><a href="../business/business.html">사업소개</a></li>';
gnb += '								<li><a href="../business/organization.html">조직도</a></li>';
gnb += '								<li><a href="../business/business_area.html">사업영역</a></li>';
gnb += '								<li><a href="../business/ability.html">핵심역량</a></li>';
gnb += '								<li><a href="../business/producesystem.html">생산시스템</a></li>';
gnb += '								<li><a href="../business/certify.html">인증현황</a></li>';
gnb += '						</ul>';				
gnb += '					</div>';
gnb += '					<!--/ sub_navigation -->';
gnb += '				</li>';
gnb += '				<li><strong><a href="../pr/news_list.html">PR</a></strong>';
gnb += '					<!-- sub_navigation -->';
gnb += '				<div class="snb" style="display:none;">';
gnb += '						<ul>';
gnb += '							<li><a href="../pr/news_list.html">휴비츠소식</a></li>';
gnb += '                           <li><a href="../pr/csr_list.html">사회공헌</a></li>';
gnb += '                           <li><a href="../pr/event_list.html">사내행사</a></li>';
gnb += '                           <li><a href="../pr/exhibition_list.html">제품전시정보</a></li>';
gnb += '                        <li><a href="../pr/lookaround.html">사옥둘러보기</a></li>';
gnb += '						</ul>';				
gnb += '					</div>';
gnb += '					<!--/ sub_navigation -->';
gnb += '				</li>';
gnb += '              <li><strong><a href="../ir/industry.html">IR</a></strong>';
gnb += '				<!-- sub_navigation -->';
gnb += '					<div class="snb" style="display:none;">';
gnb += '						<ul>';
gnb += '							<li><a href="../ir/industry.html">산업동향</a></li>';
gnb += '							 <li><a href="../ir/market.html">시장동향</a></li>';
gnb += '							 <li><a href="../ir/stockholder.html">주주구성</a></li>';
gnb += '							   <li><a href="../ir/income.html">손익계산서</a></li>';
gnb += '							  <li><a href="../ir/balancesheet.html">대차대조표</a></li>';
gnb += '						  <li><a href="../ir/financialratio.html">주요재무비율</a></li>';
gnb += '						</ul>';				
gnb += '					</div>';
gnb += '				<!--/ sub_navigation -->';
gnb += '			</li>';
gnb += '           <li><strong class="last"><a href="../recruit/main.html">RECRUIT</a></strong>';
gnb += '				<!-- sub_navigation -->';
gnb += '				<div class="snb" style="display:none;">';
gnb += '					<ul>';
gnb += '						<li><a href="../recruit/talent.html">Huvitz Talent</a></li><!-- 선택 : class="on"추가 -->';
gnb += '						<li><a href="../recruit/hr.html">HR Program</a></li>';
gnb += '                         <li><a href="../recruit/job.html">직무소개</a></li>';
gnb += '                         <li><a href="../recruit/recruit_list.html">채용정보</a></li>';
gnb += '                         <li><a href="../recruit/jobapply.html">입사지원</a></li>';
gnb += '                         <li><a href="../recruit/humans.html">Huvitz People</a></li>';
gnb += '                         <li><a href="../recruit/enjoyhuvitz.html">Enjoy Huvitz</a></li>';
gnb += '                        <li><a href="../recruit/recruitfaq.html">Recruit FAQ</a></li>';
gnb += '					</ul>';				
gnb += '				</div>';
gnb += '				<!--/ sub_navigation -->';
gnb += '			</li>';
gnb += '		</ul>';

gnb += '		<ul class="nb2">';
gnb += '			<li>';
gnb += '				<strong><a href="../support/consumer.html">SUPPORT</a></strong>';

gnb += '				<!-- sub_navigation -->';
gnb += '				<div class="snb" style="display:none;">';
gnb += '					<ul>';
gnb += '						<li><a href="../support/consumer.html">소비자전용</a></li>';
gnb += '						<li><a href="http://svc.huvitz.com/kr/index.php" target="_blank">대리점전용</a></li>';
gnb += '						<li><a href="../support/agent.html">국내대리점</a></li>';
gnb += '					</ul>';		
gnb += '				</div>';
gnb += '				<!--/ sub_navigation -->';
gnb += '			</li>';
gnb += '		</ul>';
gnb += '	</div>';

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