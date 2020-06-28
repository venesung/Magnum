
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
