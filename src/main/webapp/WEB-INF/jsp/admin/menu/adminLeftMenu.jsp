<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">

	
</script>
<!-- leftmenu s -->
<div id="leftmenu" class="leftWrap">
	<c:set var="menuDepthTemp" value="3" />
	<div style="display: none;" id="test">${menuList}</div>
	<c:forEach var="result" items="${menuList}" varStatus="status"> 			
 		<c:if test="${result.menuDepth eq 2}"><h2 url="${result.menuPath}">${result.menuNm }</h2></c:if>
  	</c:forEach>
  	
    <ul class="leftMenu">
    
    	<c:forEach var="result" items="${menuList}" varStatus="status"> 
			<c:if test="${result.menuDepth > 2 }">
			
					
		    		<c:if test="${not status.first && menuDepthTemp eq result.menuDepth}">
						</li>
			 		</c:if>
			 		
			 		<c:if test="${menuDepthTemp eq 4 &&  result.menuDepth eq 3}">
			 				</li>
						</ul>
			 		</c:if>
			 		
			 		
			 		<c:choose>
						<c:when test="${menuDepthTemp eq 3 && result.menuDepth eq 4}">
							<ul style="display:block;">
								<li>
									<a href="${result.menuPath}" dept="${result.menuDepth}"
										<c:if test="${result.menuId eq menuId}">class="on"</c:if> >
										${result.menuNm }
									</a>
						</c:when>
						<c:when test="${result.menuDepth > 2 }">
							<li>
			 				<a href="${result.menuPath}" dept="${result.menuDepth}"
			 					<c:if test="${result.menuId eq menuId}">class="on"</c:if> >
			 					${result.menuNm }
			 				</a>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
			 		
			 		<c:if test="${status.last && result.menuDepth eq 3 }">
			 			</li>
			 		</c:if>
			 		
			 		<c:if test="${status.last && result.menuDepth eq 4}">
							</li>
		 				</ul>
			 		</c:if>
			
			
			</c:if>
	 		
	 		<c:set var="menuDepthTemp" value="${result.menuDepth}" />
	  	</c:forEach>
    </ul>
</div>
<!-- // leftmenu e -->