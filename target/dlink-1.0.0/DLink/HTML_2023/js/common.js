$(function(){
	

	$(window).resize(function(){
		ww = $(window).width();
		if(ww < 1400){
			$("body").addClass("mobile")
		}else{
			$("body").removeClass("mobile")
		}
	}).resize();

	scroll = $(window).scroll();
	$(".pc_nav>li").mouseover(function(){
		$("#header").addClass("on");
		$(".sub_bg").stop().slideDown();
		$(this).find(".sub").stop().slideDown();
		$(this).siblings("li").find(".sub").stop().hide();
	});
	$("#header").mouseleave(function(){
		$("#header").removeClass("on");
		$(".sub_bg").stop().slideUp();
		$(".pc_nav>li").find(".sub").stop().slideUp();		
	})

	btnmenu = 0;
	$(".btn_menu").click(function(){		
		if(btnmenu == 0){
			$(this).stop().addClass("openmenu");		
			$(".all_menu").slideDown();
			btnmenu = 1;
		}else{
			$(this).stop().removeClass("openmenu");
			$(".all_menu").slideUp();
			btnmenu = 0;	
		}			
	});

	$(document).on("click",".all_menu .menuwrap>ul>li>ul>li>a",function(){
		$('.btn_menu').stop().removeClass("openmenu")
		$(".all_menu").slideUp();
		btnmenu = 0;
	});
	
	$(document).on("click",".mobile .all_menu .menuwrap>ul>li",function(){
		if($(this).attr("class") == "dep1 act"){			
			$(this).find("ul").slideUp(300);			
		}else{
			$(this).find("ul").slideDown(300);			
		}		
		$(this).toggleClass("act");
		$(this).siblings("li").removeClass("act");
		$(this).siblings("li").find("ul").slideUp();	
	});
	
	//자주하는질문
	$('section.faq_content .tab_style03 a').on('click', function () {
		var csTab = $(this).attr("data");
		$('section.faq_content .tab_style03 a').removeClass('on');
		$(this).addClass('on');
		$('section.faq_content .tabcont').removeClass('active');
		$('section.faq_content #' + csTab).addClass('active');
    });

	$('section.faq_content div.accordion_panel div.panel_head').click(function () {
        $('#accordion div.panel_head').removeClass('active');
        $(this).addClass('active');
        $('section.faq_content div.accordion_panel div.panel_content').slideUp();
        if (!$(this).next().is(':visible')) {
            $(this).next().slideDown();
        } else {
            $(this).next().slideUp();
        }
    });
	//약관동의
		$('#agreementInfo_view_btn').click(function(){//이용약관
		$('#agreementInfo_box').toggle();
		if($(this).text() == '내용닫기'){
			$(this).text('내용보기');
		}else{
			$(this).text('내용닫기');
		}
	});
	$('#privateApproval_view_btn').click(function(){//개인정보 수집 및 이용
		$('#privateApproval_box').toggle();
		if($(this).text() == '내용닫기'){
			$(this).text('내용보기');
		}else{
			$(this).text('내용닫기');
		}
	});
	//텝메뉴
	$(".tab_device_ti").click(function(){
		$(this).toggleClass("ov");
		$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").slideToggle(400);	
		return false;	
	});
	// 카테고리선택 탭
    $('.tab_style li').on('click', function () {
		var csTab = $(this).attr("data");
		$('.tab_style li').removeClass('on');
		$(this).addClass('on');
    });
	 $('.tab_style05 a').on('click', function () {
		var csTab = $(this).attr("data");
		$('.tab_style05 a').removeClass('on');
		$(this).addClass('on');
    });
	
	// 모바일 viewport 675미만 tab 처리건(select 처리)
	var delta = 300;
	var timerResize = null;
	$(document).ready(function(e) {
		mobToggle ();
	});
	
	var menu_index = $('.sub_tabmenu li.on').index();
	var subMenu = new Swiper(".sub_tabmenu .swiper-container", {
		slidesPerView: 'auto',
		initialSlide: menu_index
	});
	
	//select design
	var selectTarget = $('.selec_area select');
	selectTarget.change(function(){
		var select_name = 
		 $(this).children('option:selected').text();
		 $(this).siblings('label').text(select_name);
		 $(this).siblings('.select_btn').text(select_name);
	});
	var mySwiper = new Swiper ('.swiper-container', {
		direction: 'horizontal',
		slidesPerView:'auto', 
		mousewheel: true, 
		loop: true, 
		centeredSlides: false,
		observer: true,
		observeParents: true,
		autoplay: { //시간 1000 이 1초 
		delay: 2500,
		disableOnInteraction: false, 
		},
		 pagination: { 
		 el: '.swiper-pagination', 
		 clickable: true,
		 }, 
		 navigation: { 
		 nextEl: '.swiper-button-next',
		 prevEl: '.swiper-button-prev', 
		 }
	});
	
});


function mobToggle (){
	if($(window).width()<801){
		if($(".tab_device_ti").is(":hidden")){
			$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").hide();
		} else {
			$(".tab_device_ti").removeClass("ov");
			$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").hide();
		}
		var tebChkYn = $(".tab_device ul.tab_style01 li:gt(0) a.on,.tab_device ul.tab_style02 li:gt(0) a.on,.tab_device ul.tab_style03 li:gt(0) a.on").text();
		if(tebChkYn==''){
			$(".tab_device_ti").text($(".tab_device ul.tab_style01 li:eq(0),.tab_device ul.tab_style02 li:eq(0),.tab_device ul.tab_style03 li:eq(0)").text());
		}else{
			$(".tab_device a:eq(0)").text(tebChkYn);
		}
	}else{
		$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").show();
	}
}

jQuery(function($){
	var info_box = $('.focus_tit').next('input,textarea');
	$('.focus_tit').css({'position':'absolute','z-index':'1','display':'block'});
	info_box
		.focus(function(){
			$(this).prev('.focus_tit').css('visibility','hidden');
		})
		.blur(function(){
			if($(this).val() == ''){
				$(this).prev('.focus_tit').css('visibility','visible');
			} else {
				$(this).prev('.focus_tit').css('visibility','hidden');
			}
		})
		.change(function(){
			if($(this).val() == ''){
				$(this).prev('.focus_tit').css('visibility','visible');
			} else {
				$(this).prev('.focus_tit').css('visibility','hidden');
			}
		})
		.blur();	
});

// Popup modal style
function showLayer(self,obj){
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;
	$('#header').addClass('z_idx');
	//$('#header').css('z-index','0');
	//$('.head').css('z-index','0');
	$('.pop_modal_bg').show();
	if($(window).width()<668){
		$('#header').css('z-index','2');
	}

	scrollNone();

	$target.attr('tabindex', '0').show().focus();
	$(obj).css({"margin-top":"-"+ _pHeight +"px","margin-left":"-"+ _pWidth +"px"})
	$(obj).find(".pop_close").click(function(){
		hideLayer();
	});

	//키보드 포커스 popup modal 영역운영
	var 
		firstElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':first'),
		lastElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':last');
		firstElement.off("keydown").on("keydown",function(b){
			if(b.keyCode == 9 && b.shiftKey){
				b.preventDefault();
				lastElement.focus();
			}
		});

	lastElement.off("keydown").on("keydown",function(b){
		if(b.keyCode == 9 && b.shiftKey){
		} else if (b.keyCode == 9){
			b.preventDefault();
			firstElement.focus();
		}
	});

	function hideLayer(){
		$(obj).hide();
		$(obj).removeAttr('tabindex');
		$('.pop_modal_bg').hide().css({'top':'0','height':'100%'});
		$('#header').removeClass('z_idx');
		scrollBlock();
		$self.focus();
		$(this).off('click');
	}
}

function enableLayerBtn(obj) {
	$(".pop_close").click(function(){
		hideLayer(obj);
		$(this).off('click');
	});
}

// pop modal - body scroll
function scrollNone(){
	var windowHeight = $(window).height();
	if(windowHeight > $(".wrap_main").height()){
		$("html").css({"height":windowHeight +"px","overflow":"hidden"});
	} else {
		$("html").css({"height":windowHeight +"px","overflow":"hidden"});
	}
}

function scrollBlock(){
	$("html").css({"height":"auto","overflow":"auto"});
};