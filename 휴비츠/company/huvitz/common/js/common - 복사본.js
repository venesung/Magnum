
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