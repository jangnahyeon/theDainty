$(function(){	
	// input value click event
	$('input[type="text"]').focus(function() {
        if (this.value == this.defaultValue) {
            this.value = '';
        }
         $(this).css('color' , '#484848');
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
	
});


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


// Popup modal style
function showLayer(self,obj){
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;
	$('.pop_modal_bg').show();
	$('.modal_header_wrap').css('display','block');
	$('#header_wrap').addClass('no_shadow');
	if($(window).width()<668){
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').css('z-index','2');
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
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').removeClass('no_shadow').css('z-index','101');
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

$(window).on('load resize', function(){	
	
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
			$('.bgLayer').show();
		});
		gnb.click(function(){
			return true;
		});

		$('#header').on('mouseleave blur' , function(){
			depth2.removeClass('on').hide();
			$('.bgLayer').hide();
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
	
});

$(document).ready(function() {
	//select design
	var selectTarget = $('.area_select select');
	selectTarget.change(function(){
		var select_name = 
		 $(this).children('option:selected').text();
		 $(this).siblings('label').text(select_name);
		 $(this).siblings('.select_label').text(select_name);
	});
});