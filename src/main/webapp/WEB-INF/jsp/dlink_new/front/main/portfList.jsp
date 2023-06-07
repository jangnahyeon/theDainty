<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty resultList }">

	<%-- <c:set var="today" value="<%=new java.util.Date()%>" />

	<fmt:formatDate value="${today }" pattern="yyyy" var="year" />
	<fmt:formatDate value="${today }" pattern="MM" var="month" /> --%>    		
			
			<!-- <div class="group wrap_portfolio"> -->
				<h3>촬영 포트폴리오</h3>
				<div class="swiper portfolio">
				  <div class="swiper-wrapper">				
					
					<c:forEach var="result" items="${resultList }" varStatus="vs">
						<c:if test="${vs.index < 4 }">
							<div class="lst_thum row01 swiper-slide">
								<%-- <a href="/front/dsnStd/portfList.do?${result.code }"> --%>
									<div class="hover-border"><div></div></div>
									<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></i></span>
									<span class="info_date">${result.title }</span>
								<!-- </a> -->
							</div>
						</c:if>								
					</c:forEach>
							
				  </div>
				  <div class="swiper-button-next"></div>
				  <div class="swiper-button-prev"></div>
				  <div class="swiper-pagination"></div>
				</div>
				<span class="area_more"><a href="/front/dsnStd/portfList.do?code=0001" class="btn_more"><i>포트폴리오 더보기</i></a></span>
			<!-- </div> -->
			
</c:if>