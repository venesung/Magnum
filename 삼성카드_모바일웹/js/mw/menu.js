function menuLogout()
{
	scardm.mobile.common.ajax({
		type : "post",
		dataType : "json",
		url : "/mem.api?cmd=mwLogout",
		displayAjaxLoader: true,
		processingMessage: scardm.msg.get("msg_process_running_wait"),
		resultSuccessShowMessage : true,
		modal: true,
		success: function(result) {
			if (result.resultCode === "0") {
				alert(scardm.msg.get("msg_logout_success"));
				document.location.href = "/main.scv?cmd=mainView";
			}
		}
	});			
}

////////////////////////////// 우측 전체메뉴 로직 시작 //////////////////////////////
/*
<dl>
	<dt><a href="javascript:scardm.dummyFunc();" class="on">마이홈</a></dt><!-- 선택시에 class값 on추가 -->
	<dd class="open"><a href="javascript:scardm.dummyFunc();" class="on">2deth</a><!-- 3deth가 있는 경우에 dd태그에 class값 open추가 및 선택시에 a태그에 class값 on추가 -->
		<ul>
			<li><a href="javascript:scardm.dummyFunc();" class="on">3deth</a></li><!-- 선택시에 class값 on추가 -->
			<li><a href="javascript:scardm.dummyFunc();">3deth</a></li>
			<li><a href="javascript:scardm.dummyFunc();">3deth</a></li>
		</ul>
	</dd>
	<dd><a href="javascript:scardm.dummyFunc();">2deth</a></dd>
</dl>
*/

var over1 = 0,over2 = 0, over3 = 0;
var RightMenu =
{
	init : function ()
	{
		drawRightMenu();
		rightMenuButtonInit();
		
		function rightMenuButtonInit(){
			$(".total_submn").find(".open").click ( openSubMenu );
			$(".total_submn").find(".open").find("ul").click ( preventClick );
	
			function preventClick ( e ){
				e.stopPropagation();
			}
	
			function openSubMenu( e ){
				e.preventDefault();
				e.stopPropagation();
			
				if ( $(this).attr ( "isOpen" ) == "false" )
				{ 
					$(this).attr ( "isOpen" , "true" );
					$(this).find(">a").addClass("on");
					$(this).find("ul").css ( { display:"block" } );
					$(this).find(".conts_hidden").html("확장메뉴 닫기");
				}
				else
				{
					$(this).attr ( "isOpen" , "false" );
					$(this).find(">a").removeClass("on");
					$(this).find("ul").css ( { display:"none" } );
					$(this).find(".conts_hidden").html("확장메뉴 펼치기");
				}
				rightMenuPosReset();
			}

			$(".total_mn").find("li>a").click ( setMenuPos );
			function setMenuPos(e){
				var idx = $(this).parent().index();
				if(idx == 0 || idx == 7){
					return;
				}
				e.stopPropagation();
				e.preventDefault();
				if(idx == 1){
					rightMenuiScroll.scrollTo(0,0,300);
					//TweenMax.to($(".subcon"), 0.3, {scrollTop:0} );
				}else{
					rightMenuiScroll.scrollTo(0, -(rightMenuPosArr[idx -2]+30), 300);
					//TweenMax.to($(".subcon"), 0.3, {scrollTop:rightMenuPosArr[idx -2]} );
				}
				
			}
		}
	
		function drawRightMenu()
		{
			var mainNode = menuXML;
			var request = new Request();
			var cmd = request.getParameter("cmd");			
			if(cmd.length > 0){
				$.each(mainNode, function (i){
					var subNode1 = $(this)[0]["item"];							
					if(subNode1){
						var link = $(this)[0]["link"];
						if (link.indexOf(cmd) > -1) {
							over1 = i + 1;		
							return false;
						}	
						$.each(subNode1, function (j){
							var link = $(this)[0]["link"];
							if (link.indexOf(cmd) > -1) {
								over1 = i+1;
								over2 = j+1;
								return false;
							}						
							var subNode2 = $(this)[0]["item"];
							if(subNode2){							
								$.each (subNode2, function (k){
									var link = $(this)[0]["link"];
									if (link.indexOf(cmd) > -1) {
										over1 = i+1;
										over2 = j+1 ;
										over3 = k+1 ;
										return false;
									}																	
								});
							}
						});
					}
				});
			}

			var menuDiv = '<div class="totalwrap"><div class="total">';
			if(typeof(loginYn) !== "undefined" && loginYn !== null && loginYn === 'Y') {
				menuDiv += '<div class="total_top"><a href="javascript:menuLogout();" class="total_login">로그아웃</a></div>';
			}else{
				menuDiv += '<div class="total_top"><a href="/mem.api?cmd=login2View" class="total_login">로그인</a></div>';				
			}			
			menuDiv += '<ul class="total_mn">';
			menuDiv += '<li><a href="/main.scv?cmd=mainView" >홈</a></li>';
			$.each (mainNode, function ( i ){
				var text = $(this)[0]["name"];
				var link = $(this)[0]["link"];
				menuDiv += '<li><a href="'+link+'">'+text+'</a></li>';
			});
			//menuDiv += '    <li><a href="javascript:scardm.dummyFunc();">모바일</a></li> ';
            menuDiv += ' </ul>';
            menuDiv += ' <div class="total_submn"><div class="subcon" id="subcon">';

			$.each (mainNode, function ( i )
			{
				var text = $(this)[0]["name"];
				var link = $(this)[0]["link"];

				menuDiv += '<dl>';
				if (over1 !== undefined && over1 !== 0 && over1-1 == i){
					menuDiv += '<dt><a href="'+link+'" class="on"><span>'+text+'</span></a></dt>';
				}else{
					menuDiv += '<dt><a href="'+link+'"><span>'+text+'</span></a></dt>';
				}
				var subNode1 = $(this)[0]["item"];
				
				if ( subNode1.length > 0 ){
					$.each (subNode1, function ( j )
					{
						var text = $(this)[0]["name"];
						var link = $(this)[0]["link"];
						if (link.indexOf("statement2View") > -1) {
							link += "&screenWidth=" +  scardmLayout.getScreenWidth();
						}		
						var subNode2 = $(this)[0]["item"];
						
						if ( subNode2 ){
							if (over2 !== undefined && over2 !== 0 && over2-1 == j && over1-1 == i){
								menuDiv += '<dd class="open" isOpen="true"><a href="#"  class="on mnselect">'+text+'<span class="conts_hidden">확장메뉴 펼치기</span></a>';
							}else{
								menuDiv += '<dd class="open" isOpen="false"><a href="#">'+text+'<span class="conts_hidden">확장메뉴 펼치기</span></a>';
							}							
						}else{
							if($(this)[0]["pop"] !== undefined && $(this)[0]["pop"] == "blank"){
								if (over2 !== undefined && over2 !== 0 && over2-1 == j && over1-1 == i){
									menuDiv += '<dd><a href="'+link+'" class="on" target="_blank">'+text+'</a>';
								}else{
									menuDiv += '<dd><a href="'+link+'" target="_blank">'+text+'</a>';
								}
							}else{
								if (over2 !== undefined && over2 !== 0 && over2-1 == j && over1-1 == i){
									menuDiv += '<dd><a href="'+link+'" class="on">'+text+'</a>';
								}else{
									menuDiv += '<dd><a href="'+link+'">'+text+'</a>';
								}	
							}
						}
	
						var subNode2 = $(this)[0]["item"];
						if ( subNode2 ){
							if (over2 !== undefined && over2 !== 0 && over2-1 == j && over1-1 == i){
								menuDiv += '<ul style="display:block">';
							}else{
								menuDiv += '<ul style="display:none">';
							}
							$.each (subNode2, function ( k )
							{
								var text = $(this)[0]["name"];								
								var link = $(this)[0]["link"];
								if($(this)[0]["pop"] !== undefined && $(this)[0]["pop"] == "blank"){
									if (over3 !== undefined && over3 !== 0 && over3-1 == k && over2-1 == j && over1-1 == i){
										menuDiv += '<li><a href="'+link+'" class="on" target="_blank">'+text+'</a></li>';
									}else{									
										menuDiv += '<li><a href="'+link+'" target="_blank">'+text+'</a></li>';
									}
								}else{
									if (over3 !== undefined && over3 !== 0 && over3-1 == k && over2-1 == j && over1-1 == i){
										menuDiv += '<li><a href="'+link+'" class="on">'+text+'</a></li>';
									}else{									
										menuDiv += '<li><a href="'+link+'">'+text+'</a></li>';
									}
								}
							});
							menuDiv += '</ul>';
						}
						menuDiv += '</dd>';
					} );
					menuDiv += '</dl>';
				}
			} );
			menuDiv += '<dl class="lastdl"></dl><!-- // subcon -->';
			menuDiv += '</div><!-- // subcon -->';
			menuDiv += '</div><!-- // total_submn -->';
			menuDiv += '<a href="javascript:rightMenuOpen();" class="total_close">전체메뉴닫기</a>';
			menuDiv += '</div><!-- // total -->';
			menuDiv += '</div><!-- // totalwrap -->';
			menuDiv += '<div class="totladim"></div>';
			$("#rightMenu").html ( menuDiv );		
			$(".lastdl").height(documentHeight-407);
		}
	}
};

var Request = function(){
    this.getParameter = function( name ){
        var rtnval = '';
        var nowAddress = unescape(location.href);
        var parameters = (nowAddress.slice(nowAddress.indexOf('?')+1,nowAddress.length)).split('&');
        var path = nowAddress.substring(nowAddress.lastIndexOf("/")+1);
        var  filename = (path.match(/[^.]+(\.[^?#]+)?/)||[])[0];
       for(var i = 0 ; i < parameters.length ; i++){
            var varName = parameters[i].split('=')[0];
            if(varName.toUpperCase() == name.toUpperCase()){
                rtnval = parameters[i].split('=')[1];
                break;
            }
        }
        return filename+"?cmd="+rtnval;
    };
};