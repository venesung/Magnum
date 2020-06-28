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
					$(this).find("a").addClass("on");
					$(this).find("ul").css ( { display:"block" } );
				}
				else
				{
					$(this).attr ( "isOpen" , "false" );
					$(this).find("a").removeClass("on");
					$(this).find("ul").css ( { display:"none" } );
				}
				$(".total_submn").getNiceScroll().resize();
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
					//TweenMax.to($(".total_submn .subcon"), 0.3, {scrollTop:0} );
					$(".total_submn").getNiceScroll().doScrollPos(0,0,0);
				}else{
					//TweenMax.to($(".total_submn .subcon"), 0.3, {scrollTop:rightMenuPosArr[idx -2]} );
					$(".total_submn").getNiceScroll().doScrollPos(0,rightMenuPosArr[idx -2],300);
				}
				
			}
		}
	
		function drawRightMenu()
		{
			var mainNode = menuXML;

			var menuDiv = '<div class="totalwrap"><div class="total">';
			menuDiv += '<div class="total_top"><a href="javascript:scardm.dummyFunc();" class="total_login">로그인</a></div>';
			menuDiv += '<ul class="total_mn">';
			menuDiv += '<li><a href="javascript:scardm.dummyFunc();">홈</a></li>';
			$.each (mainNode, function ( i ){
				var text = $(this)[0]["name"];
				var link = $(this)[0]["link"];
				menuDiv += '<li><a href="'+link+'">'+text+'</a></li>';
			});
			//menuDiv += '    <li><a href="javascript:scardm.dummyFunc();">모바일</a></li> ';
            menuDiv += ' </ul>';
            menuDiv += ' <div class="total_submn"><div class="subcon">';

			$.each (mainNode, function ( i )
			{
				var text = $(this)[0]["name"];
				var link = $(this)[0]["link"];

				menuDiv += '<dl>';
				if (over1 !== undefined && over1 !== 0 && over1-1 == i){
					menuDiv += '<dt><a href="'+link+'" class="on">'+text+'</a></dt>';
				}else{
					menuDiv += '<dt><a href="'+link+'">'+text+'</a></dt>';
				}
				var subNode1 = $(this)[0]["item"];
				
				if ( subNode1.length > 0 ){
					$.each (subNode1, function ( j )
					{
						var text = $(this)[0]["name"];
						var link = $(this)[0]["link"];
	
						var subNode2 = $(this)[0]["item"];
						
						if ( subNode2 ){
							if (over2 !== undefined && over2 !== 0 && over2-1 == j){
								menuDiv += '<dd class="open" isOpen="false" class="on"><a href="#">'+text+'<span class="conts_hidden">확장메뉴 펼치기</span></a>';
							}else{
								menuDiv += '<dd class="open" isOpen="false"><a href="#">'+text+'<span class="conts_hidden">확장메뉴 펼치기</span></a>';
							}
							
						}else{
							if (over2 !== undefined && over2 !== 0 && over2-1 == j && over1-1 == i){
								menuDiv += '<dd><a href="'+link+'" class="on">'+text+'</a>';
							}else{
								menuDiv += '<dd><a href="'+link+'">'+text+'</a>';
							}
							
						}
	
						var subNode2 = $(this)[0]["item"];
						if ( subNode2 ){
							menuDiv += '<ul style="display:none">';
							$.each (subNode2, function ( k )
							{
								var text = $(this)[0]["name"];
								var link = $(this)[0]["link"];
								if (over3 !== undefined && over3 !== 0 && over3-1 == k && over2-1 == j && over1-1 == i){
									menuDiv += '<li><a href="'+link+'" class="on">'+text+'</a></li>';
								}else{
									menuDiv += '<li><a href="'+link+'">'+text+'</a></li>';
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
			$("#rightMenu").append ( menuDiv );			
			$(".lastdl").height(documentHeight);

		}
	}
};
