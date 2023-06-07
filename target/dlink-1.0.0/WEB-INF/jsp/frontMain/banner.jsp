<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- visual area s-->
<div class="main_visual_wrap">
	<div class="swiper m_visual">
	  <div class="swiper-wrapper">
	  	<c:forEach var="result" items="${bannerList}" varStatus="vs">
			<div class="swiper-slide"><a href="#m_visualZone"><span class="m_visual_thum"><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></span></a></div>
	  	</c:forEach>
	  </div>
	  <div class="swiper-button-next"></div>
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-pagination"></div>
	</div>
</div>
<!-- visual area e -->