/* main  visual s */
$(document).ready(function(){	
	//visual popupzone
	var swiper = new Swiper(".m_visual", {
       	loop: true, 
		direction: 'horizontal',
		centeredSlides: false,
		observer: true,
		observeParents: true,
		//autoplay: { //시간 1000 이 1초 
		//delay: 4000,
		//disableOnInteraction: false, 
		//},
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
        },
        keyboard: true,
      });
	  
	var Portswiper = new Swiper(".portfolio", {
        cssMode: true,
		direction: 'horizontal',
		slidesPerView:'1', 		
		spaceBetween: 20,
		mousewheel: true, 
		loop: true, 
		centeredSlides: false,
		observer: true,
		observeParents: true,
		autoplay: { //시간 1000 이 1초 
		delay: 2500,
		disableOnInteraction: false, 
		},
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        mousewheel: true,
        keyboard: true,
		breakpoints: {
			// 600px 보다 클 경우
			600: {
			  slidesPerView:2,
				},
			1023: {
			  slidesPerView:4,
				},
			1280: {
			  slidesPerView:4,
				}
			}
      });
	  var swiper2 = new Swiper(".area_studio", {
       	loop: true, 
		direction: 'horizontal',
		centeredSlides: false,
		observer: true,
		observeParents: true,
		autoplay: { //시간 1000 이 1초 
		delay: 5000,
		disableOnInteraction: false, 
		},
		pagination: {
          el: ".swiper-pagination",
          clickable: true,
          renderBullet: function (index, className) {
            return '<span class="' + className + '">' + "0" +(index + 1) + "</span>";
          },
        },
        keyboard: true,
      });
});

/*-------------------------------------------------
		Author :작성자
		Create date :최초작성일
	-------------------------------------------------*/
$(function()
{
	$(window).on('load', function()
	{		
		$('.title_news').addClass('setting');
		if(($(window).width() > 1599) || ($(window).width() < 1024)) {
			$('.title_news,.wrap_org').removeClass('setting_mob');
			$('.wrap_org').addClass('setting');
		} else if(($(window).width() <= 1599) || ($(window).width() >= 1024)){
			$('.wrap_org').removeClass('setting');
			$('.aside,.wrap_org').addClass('setting_mob');
		}
	});

	$(window).on('scroll', function()
	{

		// 그룹별 활성화
		$('.group').each(function(i)
		{
			if ( ( $(window).scrollTop() + ($(window).height()/2) + 350 ) > $('.group').eq(i).offset().top )
			{
				$(this).addClass('active');
			}
			else
			{
				$(this).removeClass('active');
			}
		});
	});
});