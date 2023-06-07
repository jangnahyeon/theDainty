<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 타이틀 시작 -->
		<div class="subtop">
			<div class="innerwrap">		
				<div class="pageLocation">
					<span class="home"><a href="/"><img src="/DLink/HTML_2023/images/common/path_home.png" alt="홈으로"></a></span>
					
					<c:if test="${not empty frontMenuVO1 }">					
						<span>${frontMenuVO1.menuNm }</span>
						<span class="title">${frontMenuVO2.menuNm }</span>
					</c:if>
					
					<c:if test="${not empty frontMenuFooterVO }">					
						<span>${frontMenuFooterVO.menuNm }</span>						
					</c:if>
							
				</div>			
				<div class="sub_tit">
					<c:if test="${not empty frontMenuVO1 }">
						<h2>${frontMenuVO2.menuNm }</h2>
					</c:if>
					
					<c:if test="${not empty frontMenuFooterVO }">
						<h2>${frontMenuFooterVO.menuNm }</h2>
					</c:if>
				</div>

			</div>
		</div>
		<!-- 타이틀 끝 -->