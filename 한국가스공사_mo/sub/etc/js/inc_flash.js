function external_flash(furl,fwidth,fheight,id_name,_var)	{
	var id_names = "externalFlash";
	if(typeof(id_name) != 'undefined') id_names = id_name;
	
	document.write('<object id="'+id_names+'" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="'+ fwidth +'" height="' + fheight +'" align="middle">');
	document.write('<param name="allowScriptAccess" value="always">');
	document.write('<param name="movie" value="'+ furl +'"/>');
	document.write('<param name="wmode" value="transparent"/>');
	document.write('<param name=FlashVars value="'+_var+'">');
	document.write('<!-- Hixie method -->');
	document.write('<!--[if !IE]> <-->');
	document.write('<object allowScriptAccess="allways" type="application/x-shockwave-flash" data="'+ furl +'" width="'+ fwidth +'" height="' + fheight +'" FlashVars="'+_var+'"');
	document.write(' wmode="transparent"');
	document.write('></object>');
	document.write('<!--> <![endif]-->');
	document.write('</object>');
}



////////////////////////////////////////////////////////

function eMovie(fm,w,h,idName) {
	var _data ="";
	_data+="<object id='"+idName+"' codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 type=application/x-oleobject height='"+ h + "' width='"+ w + "'classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95>";
	_data+="<param name=Filename value='"+ fm + "'>";
    _data+="<param name=AutoStart value=1>";
    _data+="<param name=ShowControls value=0>";
    _data+="<param name=ShowStatusBar value=0>";
    _data+="<param name=ShowDisplay value=0>";
    _data+="<param name=ShowTracker value=0>";
    _data+="<param name=height value='"+h+"'>";
    _data+="<param name=width value='"+w+"'>";
    _data+="<param name=SendMouseClickEvents value=1>";
    _data+="<param name=EnableContextMenu value=false>";
	_data+= "<embed src='"+ fm + "' width='"+w+"' height='"+h+"' autostart=1 showcontrols=0 showstatusbar=0 showdisplay=0 showtracker=0 sendmouseclickevents=1 enablecontextmenu=false></embed>";
	_data+="</object>";

	document.write(_data);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function swfprint(furl,fwidth,fheight,transoption,id_name,_var)	{
	var id_names = "top_menu";
	if(typeof(id_name) != 'undefined') id_names = id_name;
	
	document.write('<object id="'+id_names+'" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+ fwidth +'" height="' + fheight +'" align="middle">');
	document.write('<param name="movie" value="'+ furl +'"/>');
	if (transoption == "t")	{
		document.write('<param name="wmode" value="transparent"/>');
	} else if	(transoption == "o")	{
		document.write('<param name="wmode" value="opaque"/>');
	}
	document.write('<param name=FlashVars value="'+_var+'">');
	document.write('<!-- Hixie method -->');
	document.write('<!--[if !IE]> <-->');
	document.write('<object type="application/x-shockwave-flash" data="'+ furl +'" width="'+ fwidth +'" height="' + fheight +'" FlashVars="'+_var+'"');
	if (transoption == "t")	{
		document.write(' wmode="transparent"');
	} else if	(transoption == "o")	{
		document.write(' wmode="opaque"');
	}
	document.write('></object>');
	document.write('<!--> <![endif]-->');
	document.write('</object>');

	if(id_names=="top_menu"){
		//window.onload = fn_resize_top_flash;
		window.attachEvent("onload", fn_resize_top_flash)
		window.onresize = fn_resize_top_flash;
	}
}

function fn_resize_top_flash(){

	var scrollwidth=document.documentElement.scrollWidth;
	var obj_top_flash = document.getElementById("top_menu");
	if(obj_top_flash==null) return;
	if(scrollwidth <990){
		obj_top_flash.style.width = "990px";
	}else{
		obj_top_flash.style.width = "100%";
	}
}


//미디어 플레이어(07.07.03 추가)
	function moviePlay(width, height, src, autoS, showC, showT, showB){
		var obj ="<object id='mediaPlayer' codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701' type='application/x-oleobject' width='"+ width +"' height='"+ height +"' standby='Loading Microsoft Windows Media Player components...' classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95'>"+
						 " <param name='Filename' value='"+ src +"'>"+
						 " <param name='AutoStart' value='"+ autoS +"'>"+
						 " <param name='ShowControls' value='"+ showC +"'>"+
						 " <param name='ShowStatusBar' value='"+ showB +"'>"+
						 " <param name='ShowDisplay' value='0'>"+
						 " <param name='ShowTracker' value='"+ showT +"'>"+
						 " <param name='height' value='240'>"+
						 " <param name='width' value='320'>"+
						 " <param name='SendMouseClickEvents' value='1'>"+
						 " <param name='EnableContextMenu' value='false'>"+
						 " <embed src='"+ src +"' width='"+ width +"' height='"+ height +"' autostart='"+ autoS +"' showcontrols='"+ showC +"' showstatusbar='"+ showB +"' showdisplay='0' showtracker='"+ showT +"' sendmouseclickevents='1' enablecontextmenu='false'></embed> "+
    				 "</object>";
    document.write(obj);
	}