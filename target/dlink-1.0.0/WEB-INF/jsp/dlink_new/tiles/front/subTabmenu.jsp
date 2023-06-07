<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

		<!-- 메뉴 탭 -->
		<div class="sub_tabmenu">
			<div class="innerwrap">		
				<ul class="tab_style grid3">
					<!-- <li class=""><a href="#">디링크 소개</a></li>
					<li class="on"><a href="#">공지사항</a></li>
					<li class=""><a href="#">오시는길</a></li> -->
					
					<c:forEach var="menu2" items="${frontMenuList2 }">
						<c:if test="${menu2.upMenuSeq eq frontMenuVO1.menuSeq }">
							<li class="<c:if test="${menu2.menuSeq eq frontMenuVO2.menuSeq }">on</c:if>">
								
								<%-- url 찾기 --%>
								<c:set var="url" value="${menu2.menuUrl }" />
								<c:forEach var="menu3" items="${frontMenuList3 }">
									<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:if>
								</c:forEach>
								
								<a href="${url }">${menu2.menuNm }</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- //메뉴 탭 -->