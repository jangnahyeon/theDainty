<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- visual area s-->
<script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/main.js"></script>
	
<c:if test="${not empty resultList }">
<div class="group wrap_portfolio">
	<h3>
		<c:forEach items="${codeListPA }" var="code">
			<c:if test="${code.code eq ptplPart }">${code.codeNm }디자인 포트폴리오</c:if>
		</c:forEach>
	</h3>
	<div class="swiper portfolio">
	  <div class="swiper-wrapper">
	  	<c:forEach items="${resultList }" var="resultList">
			<div class="lst_thum row04 swiper-slide">
				<em class="info_favorite"><button class="icon_heart" onclick="favoriteYn('${resultList.ptplNo}')"></button></em>
				<a onclick="showLayer(this,'.pop_modal');go_detail('${resultList.ptplNo}');return false;" href=".design_detail_view"  >
					<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></i></span>
					<strong>${resultList.ptplNm }</strong>
					<span class="info_date">${resultList.comNm }</span>
					<span class="info_over">
						<strong>${resultList.ptplNm }</strong>
						<span class="info_date">${resultList.comNm }</span>
						<span class="info_btn"><em class="btn">자세히보기</em></span>
					</span>
				</a>
			</div>
		</c:forEach>
			
	  </div>
	  <div class="swiper-button-next"></div>
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-pagination"></div>
	</div>
	<span class="area_more"><a href="/front/portfolio/portfSearchList.do?ptplPart=${ptplPart }" class="btn_more"><i>포트폴리오 더보기</i></a></span>
</div>
</c:if>
<!-- visual area e -->