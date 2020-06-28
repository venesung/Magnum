/*	글자 확대 축소 */
var chFont = new Array('1em','1.2em');
var dfFont = 1;

function changeFsize(fs) {
	var obj = document.getElementById('content');
	var fsize = dfFont;

	if(fs == 'flarge')
		fsize = 1;
	else
		fsize = 0;

	if(fsize == 0) {
		fsize = 0;
		document.getElementById('cvsmall').style.display='block';
		document.getElementById('cvbig').style.display="none";
	}
	if(fsize == 1) {
		fsize = 1;
		document.getElementById('cvsmall').style.display='none';
		document.getElementById('cvbig').style.display="block";
	}

	dfFont = fsize;
	obj.style.fontSize = chFont[fsize];
}

mechk=0;
function allmW(chk){
	if(chk == 'on'){
		if(mechk == 0){
			document.getElementById('allmenuH').style.display='block';
			mechk=1;
		}else{
			document.getElementById('allmenuH').style.display='none';
			mechk=0;
		}

	}else if(chk == 'off'){
		document.getElementById('allmenuH').style.display='none';
	}
}