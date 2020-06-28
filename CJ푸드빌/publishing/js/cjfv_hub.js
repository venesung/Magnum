/**
 * cj hub main sciprt
 * @author ns wook@mvint.com
 * @last 140918 _ v.1.0.2
 */
window.onload = function() {
	if($(".mainTopRol").length) {
		hubMainFuncs();
	}
};



function hubMainFuncs() {

	var brand_idx = 100;
	var isInTab02Actived = false;

	var sbanner1 = null;
	var sbanner2 = null;

	var setTopBanner = function() {
		var $con = $('.mainTopRol');
		var $rol_btn = $con.find('.rolBtn');
		var $img = $con.find('ul > li').eq(0);
		

		function bannerResize(con, img, rol_btn) {
			height = img.css('height');
			con.css('height',  height);
			rol_btn.css('top', $img.height() - 44);	
		}

		$(window).resize(function() {
			var intervalId = setTimeout(function() {
				bannerResize($con, $img, $rol_btn);
			}, 100);
		});
		bannerResize($con, $img, $rol_btn);
	};

	self.setMiddleBanner = function() {
		var $con = $('.mainTabcont');
		var $tab0_btn = $con.find('.tabList li > a').eq(0);
		var $tab1_btn = $con.find('.tabList li > a').eq(1);

		var $resize_con = $('.tabContent');
		var $reszie_incon = $resize_con.find('.inTab01 .maininRol');
		var $reszie_incon2 = $resize_con.find('.inTab02 .maininRol02');
		var $resize_img = $con.find('.maininRol ul li').eq(0);
		var $resize_btn = $con.find('.inTab01 .btnBox01 > a');
		var isTab01On = true;
		$resize_btn.css('position', 'relative');
		
		$tab0_btn.off('click');
		$tab0_btn.on('click', function(e) {
				e.preventDefault();
				e.stopPropagation();
			onOff($tab0_btn, $tab1_btn);
			$tab0_btn.parent().addClass('on');
			$tab1_btn.parent().removeClass('on');
			
			$con.find('.inTab01').css('display', 'block');
			sbanner1.swipeResize();
			sbanner2.swipeResize();
			bannerResize($resize_con, $resize_img, $resize_btn);
			$con.find('.inTab02').css('display', 'none');
			isTab01On = true;
			
		});
		
		$tab1_btn.off('click');
		$tab1_btn.on('click', function(e) {
				e.preventDefault();
				e.stopPropagation();
			onOff($tab1_btn, $tab0_btn);
			$tab1_btn.parent().addClass('on');
			$tab0_btn.parent().removeClass('on');
			
			$con.find('.inTab02').css('display', 'block');
			if (!isInTab02Actived) {
				swipeBanner(".inTab02 .maininRol02", true, 0, ".rolBtn > a");
				isInTab02Actived = true;
			}
			sbanner1.swipeResize();
			sbanner2.swipeResize();
			bannerResize($resize_con, $resize_img, $resize_btn);
			$con.find('.inTab01').css('display', 'none');
			isTab01On =  false;
			
		});
		
		function onOff(onbtn, offbtn) {
			var on_str  = onbtn.find('img').attr('src');
			var off_str = offbtn.find('img').attr('src');
			on_str = on_str.replace('off.png', 'on.png');
			off_str = off_str.replace('on.png', 'off.png');
			onbtn.find('img').attr('src', on_str);
			offbtn.find('img').attr('src', off_str);
		}

		function bannerResize(con, img, rol_btn) {

			var intab1_height = con.find('.inTab01').find('ul li').eq(0).height();
			var intab2_height = con.find('.maininRol02').find('ul li').eq(0).height();
			var tab_height = 0;

			if ($tab0_btn.parent().hasClass('on')) {
				tab_height = con.find('.inTab01').find('ul li').eq(0).height();
			} else if ($tab1_btn.parent().hasClass('on')) {
				tab_height = con.find('.maininRol02').find('ul li').eq(0).height();
			}

			con.find('.inTab01').css('height', tab_height + 40);
			con.find('.inTab02').css('height', tab_height + 60);
			$reszie_incon.css('height' , tab_height);
			$reszie_incon.find('ul').css('height' , tab_height);
			//$reszie_incon2.css('height' , tab_height);
			$reszie_incon2.find('ul').css('height' , tab_height);
		}
		
		bannerResize($resize_con, $resize_img, $resize_btn);

		$(window).resize(function() {
			resizeFunc();
		});

		function resizeFunc() {
			var intervalId = setTimeout(function() {
				bannerResize($resize_con, $resize_img, $resize_btn);
			}, 100);
		}
		
	};

	self.setBottomBanner = function() {
		var $con = $('.cjSect');
		var $rol_btn = $con.find('.rolBtn');
		var $img = $con.find('ul li').eq(0);

		function bannerResize(con, img, rol_btn) {
			var height = img.css('height');
			con.css('height', height);
			rol_btn.css('top', height - 44);
		}
		bannerResize($con, $img, $rol_btn);

		$(window).resize(function() {
			var intervalId = setTimeout(function() {
				bannerResize($con, $img, $rol_btn);
			}, 100);
		});
	};

	self.setBrandButtons = function() {
		var $brand_btns = $('.mainBrand > li');
		$('.mainBrand > li > a').on('click', function(e) {
			e.preventDefault();
			e.stopPropagation();
			var target = $(e.currentTarget).parent();
			var idx = target.index();
			
			if (target.hasClass('on')) {
				target.removeClass('on');
				target.find('div').eq(idx).css('display', 'none');	
			} else {
				$brand_btns.removeClass('on');
				$brand_btns.find('div').eq(0).css('display', 'none');
				target.addClass('on');
				target.find('div').eq(idx).css('display', 'block');
			}
		});
	};

	function init() {
		setTopBanner();
		self.setMiddleBanner();
		self.setBottomBanner();
		self.setBrandButtons();
		sbanner1 = new swipeBanner(".mainTopRol", true, 0, ".rolBtn > a");
		sbanner2 = new swipeBanner(".inTab01 .maininRol", true, 0, "", ".btnSect > a");
		swipeBanner(".cjSect", true, 0, ".rolBtn > a");				
	}
	init();
};