<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
			<!-- leftmenu s -->
			<div id="leftmenu" class="leftWrap">			 			
			 	<!-- <h2>이미지 관리</h2> -->			 	
		 		<h2>${adminMenuVO1.menuNm }</h2>
			  		    
			    <ul class="leftMenu">
			    	<c:forEach var="menu2" items="${adminMenuList2 }">
			    		<c:if test="${menu2.upMenuSeq eq adminMenuVO1.menuSeq }">
							<li>							
								<%-- url 찾기 --%>
								<c:set var="url" value="${menu2.menuUrl }" />
								<c:forEach var="menu3" items="${adminMenuList3 }">
									<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:if>
								</c:forEach>							
							
								<a href="${url }">${menu2.menuNm }</a>						
								<!-- <ul style="display:block;">
									<li><a href="/admin/dBank/dBankAdd.do" class="on">디자인뱅크 등록</a></li>
									<li><a href="/admin/dBank/pkDsnList.do" class="off">패키지디자인 관리</a></li>
									<li><a href="/admin/dBank/imgDsnList.do" class="off">이미지 관리</a></li>
									<li><a href="/admin/dBank/vidDsnList.do" class="off">영상 관리</a></li>
								</ul> -->
								
								<ul>
									<c:forEach var="menu3" items="${adminMenuList3 }">
										<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
										<li>
											<a href="${menu3.menuUrl }" class="<c:if test="${menu3.menuSeq eq adminMenuSeq }">on</c:if>">
												${menu3.menuNm }
											</a>
										</li>								
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>
					
			    </ul>
			</div>
			<!-- // leftmenu e -->