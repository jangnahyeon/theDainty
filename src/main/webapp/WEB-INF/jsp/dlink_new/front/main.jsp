<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script>
    	$(function(){
    		$.ajax({
    			url : "/front/main/brdList.do",
    			data : {
    				"menuSeq" : 3
    			},
    			async : true,
    			success : function(res) {
    				if(res) {
    					$("#wrap_news").append(res);
    				} else {
    					alert("공지사항 조회 실패.");
    				}
    			},
    			error : function(err) {
    				alert("공지사항 조회 실패..");
    			}
    		});
    		
    		$.ajax({
    			url : "/front/main/portfList.do",
    			async : false,
    			success : function(res) {
    				if(res) {
    					$("#wrap_portfolio").append(res);
    				} else {
    					alert("포트폴리오 조회 실패.");
    				}
    			},
    			error : function(err) {
    				alert("포트폴리오 조회 실패..");
    			}
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
    	});
    </script>

    <!-- visual area s-->
	<div class="main_visual_wrap">
		<div class="swiper m_visual">
		  <div class="swiper-wrapper">
		  	<div class="swiper-slide">
				<a href="#m_visualZone">
					<span class="m_visual_thum"><img src="/DLink/HTML_2023/images/main/main_thum_visual01.jpg" alt=""></span>
					<span class="m_visual_text dlink"><strong>디링크</strong><em>디자인을 잇다</em></span>
				</a>
			</div>
			<c:forEach var="result" items="${bannerList}" varStatus="vs">
			<div class="swiper-slide">
				<a href="#m_visualZone">
					<span class="m_visual_thum"><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }"></span>
					<span class="m_visual_text bank"><strong>${result.title }</strong><pre><em><c:out value="${result.contents }" /></em></pre></span>
				</a>
			</div>
			</c:forEach>
		  </div>
		  <div class="swiper-button-next"></div>
		  <div class="swiper-button-prev"></div>
		  <div class="swiper-pagination"></div>
		</div>
	</div>
	<!-- visual area e -->
	
	<!-- container_wrap -->
	<div id="main_container">
		<div class="aside">
			<ul>
				<li><a href="/front/dsnStd/sisulIntro.do">시설소개</a></li>
				<li><a href="/front/dsnStd/sisulUseGuide.do">이용안내</a></li>
				<li><a href="/front/dsnStd/sisulRsv.do">시설예약</a></li>
			</ul>
		</div>
		<div class="main_content">
		
			<div class="group wrap_news active" id="wrap_news">
				<%-- <jsp:include page="/front/main/brdList.do?menuSeq=3" /> --%>			
			</div>
			
			<div class="group wrap_portfolio" id="wrap_portfolio">
				<%-- <jsp:include page="/front/main/brdList.do?menuSeq=3" /> --%>
			</div>			
			
			<div class="group wrap_studio">			
				<h3>디자인 스튜디오</h3>
				<div class="swiper area_studio">
					 <div class="swiper-wrapper">
						<div class="set_visual swiper-slide">
							<span class="cont_text">
								<strong>제품 촬영, <br>고민하지 마세요</strong><em>도내 중소기업 및 소상공인 분들의 홍보 마케팅 지원을 위한 제품 촬영 스튜디오입니다</em>
								<span class="area_more"><a href="/front/dsnStd/sisulIntro.do" class="btn_more"><i>디자인 스튜디오 더보기</i></a></span>
							</span>
							<span class="cont_visual"><i><img src="/DLink/HTML_2023/images/main/main_studio_visual01.jpg" alt=""></i></span>
						</div>
						<div class="set_visual swiper-slide">
							<span class="cont_text">
								<strong>기획부터 <br>스타일링, 편집까지</strong><em>촬영 컨설팅부터 제품 연출 기획, 사진 편집 및 보정까지 완성도 높은 촬영서비스를 제공합니다.</em>
								<span class="area_more"><a href="/front/dsnStd/sisulIntro.do" class="btn_more"><i>디자인 스튜디오 더보기</i></a></span>
							</span>
							<span class="cont_visual"><i><img src="/DLink/HTML_2023/images/main/main_studio_visual02.jpg" alt=""></i></span>
						</div>
					 </div>
					 <div class="swiper-pagination"></div>
				</div>
			</div>
		
		
		</div>
			
	</div>
	<!-- //container_wrap --> 