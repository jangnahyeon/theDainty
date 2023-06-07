<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
	<c:forEach var="menu1" items="${adminMenuList1 }">
		<%-- url 찾기 --%>
		<c:if test="${empty url }">
			<c:set var="url" value="${menu1.menuUrl }" />
			
			<c:forEach var="menu2" items="${adminMenuList2 }">
	    		<c:if test="${empty url && menu2.upMenuSeq eq menu1.menuSeq }">										
					<%-- url 찾기 --%>
					<c:set var="url" value="${menu2.menuUrl }" />
					
					<c:forEach var="menu3" items="${adminMenuList3 }">
						<c:if test="${empty url && menu3.upMenuSeq eq menu2.menuSeq }">
							<c:set var="url" value="${menu3.menuUrl }" />
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>		
		</c:if>
	</c:forEach>

	<!-- header -->
	<header id="header_wrap">
		<div id="header"> 
			<!-- logo  -->
			<h1 class="logo"><a href="${not empty url ? url : '/' }">D.Link관리자시스템</a></h1>
			<!-- //logo --> 

			<!-- global -->
			<div id="global_wrap">
				<ul id="util">
					<li><a href="#index"><strong class="user"><%=request.getRemoteAddr()%> ${adminLoginVO.memNm } 님</strong></a></li>
					<c:if test="${not empty adminLoginVO }">
						<li class="logout" title="로그아웃"><a href="/admin/logout.do">로그아웃</a></li>
						<li class="mypage" title="마이페이지"><a href="/admin/code/codeGbList.do">마이페이지</a></li>
					</c:if>
				</ul>
			</div>
			<!-- //global -->
			<!-- gnb -->
			<nav class="gnb" id="gnb">
				<!-- <ul>
					<li><a href="#gnb">기준정보관리</a></li>
					<li><a href="#gnb">회원관리</a></li>
					<li class="active"><a href="#gnb">게시판관리</a></li>
					<li><a href="#gnb">디자인뱅크</a></li>
					<li><a href="#gnb">시설예약관리</a></li>
				</ul> -->
				
				<ul>
					<c:forEach var="menu1" items="${adminMenuList1 }">
						<li>
						
							<%-- url 찾기 --%>
							<c:set var="url" value="${menu1.menuUrl }" />
							
							<c:forEach var="menu2" items="${adminMenuList2 }">
								<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
									<c:if test="${empty url && not empty menu2.menuUrl }">
										<c:set var="url" value="${menu2.menuUrl }" />
									</c:if>
									
									<c:forEach var="menu3" items="${adminMenuList3 }">
										<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
											<c:if test="${empty url && not empty menu3.menuUrl }">
												<c:set var="url" value="${menu3.menuUrl }" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
							
							<a href="${url }">${menu1.menuNm }</a>
											
						</li>
					</c:forEach>
				</ul>
			</nav>
			<!-- //gnb -->
			
		</div>
	</header>
	<div class="modal_header_wrap"></div>
	<!-- //header --> 