$(function(){
		//검색
		$('#header .top_Srch a, #header #wrap_nav .btn_Srch a').on('click', function(){
		if($(this).parent().hasClass('btnClose')){
			$(this).parent().removeClass('btnClose');
			$('#header .top_Srch .layer_Srch').stop().slideUp('fast');
			//$('.wrap').removeClass('dimmed');
		} else {
			$(this).parent().addClass('btnClose');
			$('#header .top_Srch .layer_Srch').stop().slideDown('fast');
			//$('.wrap').addClass('dimmed');
		}
		return false;
	});

	// input value click event
	$('#header .top_Srch input[type="text"]').focus(function() {
        if (this.value == this.defaultValue) {
            this.value = '';
        }
         $(this).css('color' , '#fff');
	  }).blur(function() {
		if (this.value == '') {
			this.value = this.defaultValue;
			$(this).css('color' , '#a3a3a3');
		}
	});

	// select layer
	$('.select > a').click(function(){
		$(this).next('.layerList').slideToggle('fast');
		return false;
	});
	$('.select .layerList a').click(function(){
		var val = $(this).text();
		$(this).parents('.select').find('> a').html(val);
		$('.select .layerList').slideUp('fast');
		return false;
	});
	
	    // 카테고리선택 탭
    $('.inner_content .tab_style a').on('click', function () {
	    var contTab = $(this).attr("data");
	    $('.inner_content .tab_style a').removeClass('active');
	    $(this).addClass('active');
	    $('.inner_content .cont').removeClass('active');
	    $('.inner_content #' + contTab).addClass('active');
	});

	//검색토글 추가 
    $('.category_list_item .category_item').on('click', function(){
    if($(this).parent().hasClass('active')){
        $(this).parent().removeClass('active');
        $('.category_list_item .item_list').stop().slideUp('fast');
        $('.category_list_item .item_list').removeClass('active');
    } else {
        $(this).parent().addClass('active');
        $('.category_list_item .item_list').stop().slideDown('fast');
        $('.category_list_item .item_list').addClass('active');
    }
    return false;
	});
	//검색필터 추가 
    $('.filter_box .row .filter_list .filter_item span').on('click', function(){
    if($(this).parent().hasClass('on')){
        $(this).parent().removeClass('on');
        $('.filter_box .row .filter_list .filter_item span').removeClass('on');
    } else {
        $(this).parent().addClass('on');
        $('.filter_box .row .filter_list .filter_itemt span').addClass('on');
    }
    return false;
	});
});
$(window).load(function(){
	$('#wrap_nav .menu').on('click', function () {
		var H = $(window).height();
		if ($('body').hasClass('open_nav')) {
	    	$('body').removeClass('complete');
			setTimeout(function(){
				$('body').removeClass('open_nav');
			},500)
		} else {
		    $('body').addClass('open_nav');
		    setTimeout(function(){
		    	$('body').addClass('complete');
		    },200)
		}
	});
	$('.open_nav #wrap_header .layerGnb').on('click', function () {
	    $('body').removeClass('complete');

	});
	// waiting for loading page
	
	$('.row03').tjGallery({
		selector: '.item',
		margin: 10
	});
	
});

$(document).ready(function() {	
	// for Tab, Mobile
	if($(window).width() <= 1023){
		$('.layerGnb .gnb').hide();
		$('.layerGnb #util').hide();
		var cntW = $('#header .allmenu').width();

		$('.layerGnb').on('click', function(e) {
			$("#wrap").css({"height":"auto"});	
			var target = $(e.target);
			if( ! target.closest('#header .allmenu').length){	
		 		$('html').removeClass('noScroll');
	 		}
		});
		
		// snb menu
		$(".allmenu > ul > li").removeClass("on");
		$(".allmenu > ul > li").on("click", function(){
			$(".allmenu > ul > li").removeClass("on");
			$(this).addClass("on");
		})
	}

	// for PC
	else{
		var gnb = $('#header .gnb li a');
		var depth2 = $('#header .gnb .depth2');
		var snb = $('#header .gnb .depth2 li a');
		$('.layerGnb').show();

		$('#header .gnb .depth2').css("display","none");

		gnb.on('mouseenter focus' , function(){
			var i = $(this).parent('li').index() + 1;
			gnb.parent().removeClass('active');
			$(this).parent().addClass('active');
			depth2.show();
			$('.layerGnb').addClass('on');
			$('.bgLayer').show();
			$('#header .top_Srch a, #header #wrap_nav .btn_Srch').removeClass('btnClose');
			$('#header .top_Srch .layer_Srch').stop().slideUp('fast');

		});
		gnb.click(function(){
			return true;
		});

		$('#header').on('mouseleave blur' , function(){
			depth2.removeClass('on').hide();
			$('.bgLayer').hide();
			$('.layerGnb').removeClass('on');
		});
		snb.on('mouseenter focus' , function(){
			$(this).parents('.depth2').addClass('on');
			gnb.parent().removeClass('active');
			$(this).parents('.depth2').parents('li').addClass('active');
		});
		snb.on('mouseleave blur' , function(){
			$(this).parents('.depth2').removeClass('on');
			gnb.parent().removeClass('active');
		});
	}

	$(".mob_row tbody tr th").each(function(){
		var h_th = parseInt($(this).css("height").replace('px',''));
		var h_td = parseInt($(this).next('td').css("height").replace('px',''));
		var h_max = 0;
		if(h_th>h_td){
			h_max = h_th;
		}else{
			h_max = h_td;
		}
		$(this).css('min-height',h_max);
		$(this).next('td').css('min-height',h_max);
	});	
});

$(document).ready(function() {
	// sns공유	
	$('.icon_sns').click(function(){
		$(this).next('.sns_area').slideToggle('fast');
		return false;
	});
	$('.link_sns .sns_area .pop_close').click(function(){
		$(this).parent('.sns_area').slideToggle('fast');
		return false;
	});


	//select design
	var selectTarget = $('.category_selectbox select');
	selectTarget.change(function(){
		var select_name = 
		 $(this).children('option:selected').text();
		 $(this).siblings('label').text(select_name);
	});

	var selectTarget = $('.area_select select');
	selectTarget.change(function(){
		var select_name = 
		 $(this).children('option:selected').text();
		 $(this).siblings('label').text(select_name);
		 $(this).siblings('.select_btn').text(select_name);
	});
	var selectTarget = $('.selec_area select');
	selectTarget.change(function(){
		var select_name = 
		 $(this).children('option:selected').text();
		 $(this).siblings('label').text(select_name);
		 $(this).siblings('.select_btn').text(select_name);
	});
	//input=file design
	var fileTarget = $('.area_filebox .upload_hidden');
	fileTarget.on('change', function(){ //값이 변경되면
		if(window.FileReader){ //modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		//추출한 파일명 삽입
		$(this).siblings('.upload_name').val(filename);
	});
	// 카테고리선택 탭
    $('.tab_style01 a').on('click', function () {
		var csTab = $(this).attr("data");
		$('.tab_style01 a').removeClass('on');
		$(this).addClass('on');
    });
	 $('.tab_style02 a').on('click', function () {
		var csTab = $(this).attr("data");
		$('.tab_style02 a').removeClass('on');
		$(this).addClass('on');
    });
	 $('.tab_style05 a').on('click', function () {
		var csTab = $(this).attr("data");
		$('.tab_style05 a').removeClass('on');
		$(this).addClass('on');
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
});

// 모바일 viewport 675미만 tab 처리건(select 처리)
var delta = 300;
var timerResize = null;
$(document).ready(function(e) {
	mobToggle ();
});

var cacheWidth = $(window).width();
$(window).resize(function(){
	var newWidth = $(window).width();
	if(newWidth !== cacheWidth){
	//do
		clearTimeout(timerResize);
		timerResize = setTimeout(resizeDone, delta);
		function resizeDone(){
			mobToggle ();
			clearTimeout(timerResize);
	 		//location.reload();
		}
	}
});

$(window).ready(function(){
	$(".tab_device_ti").click(function(){
		$(this).toggleClass("ov");
		$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").slideToggle(400);	
		return false;	
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
		 },
		 breakpoints: {
		// 1280px 보다 클 경우
		1280: {
		  slidesPerView: 5,
		  spaceBetween: 5
			}
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

// Popup modal style
function showLayer(self,obj){
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;
	$('.pop_modal_bg').show();
	$('#wrap_header').css('z-index','1');
	$('.wrap_pagemenu').css('z-index','0');
	$('#wrap_header').addClass('no_shadow');
	if($(window).width()<668){
		$('#wrap_header').css('z-index','2');
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
		$('#wrap_header').removeClass('no_shadow').css('z-index','101');
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
}

// login 정보
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