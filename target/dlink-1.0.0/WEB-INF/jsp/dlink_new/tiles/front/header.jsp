<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	/* TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin"); */
%>
	<!-- header -->
	<div id="header" class="">
		<div class="head">
			
			<h1><a href="/front/main.do">디자인을 잇다. 디링크</a></h1>
			<ul class="pc_nav">
				<!-- <li class="on"><a href="/">디링크</a>
					<div class="sub">
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인 스튜디오</a>
					<div class="sub">
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인뱅크</a>
					<div class="sub">
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>
					</div>
				</li> -->
				
				<c:forEach var="menu1" items="${frontMenuList1 }">
					<li class="<c:if test="${menu1.menuSeq eq frontMenuVO1.menuSeq }">on</c:if>">
					
						<%-- url 찾기 --%>
						<c:set var="url" value="" />
						
						<c:forEach var="menu2" items="${frontMenuList2 }">
							<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
								<c:if test="${empty url && not empty menu2.menuUrl }">
									<c:set var="url" value="${menu2.menuUrl }" />
								</c:if>
								
								<c:forEach var="menu3" items="${frontMenuList3 }">
									<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					
						<a href="${url }">${menu1.menuNm }</a>
						<div class="sub">
							<ul>
								<c:forEach var="menu2" items="${frontMenuList2 }">									
								
									<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
										<li>
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
					</li>
				</c:forEach>
			</ul>	
			<div class="btns">
				<c:if test="${empty frontLoginVO }">
					<a class="header_btn" href=".login_view" onclick="showLayer(this,'.pop_modal');return false;" id="loginChk">로그인</a>
					<a class="header_btn" href="/front/join/joinMember1.do">회원가입</a>
				</c:if>
				<c:if test="${not empty frontLoginVO }">
					<a class="header_btn" href="javascript:fn_logout_act();">로그아웃</a>
					<a class="header_btn" href="/front/mypage/pkDsnList.do">마이페이지</a>
					<!-- <a class="header_btn" href="/">회원가입</a> -->
				</c:if>
				
				<div class="btn_menu">
					<div></div>
					<div></div>
					<div></div> 
				</div>
			</div>

		</div>
		<div class="sub_bg"></div>
		<div class="all_menu">
			<div class="menuwrap">
				<ul>
					<!-- <li class="dep1"><a>디링크</a>
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</li>
					<li class="dep1"><a>디자인 스튜디오</a>
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>		
					</li>
					<li class="dep1"><a>디자인뱅크</a>
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>		
					</li> -->
					
					<c:forEach var="menu1" items="${frontMenuList1 }">
						<li class="dep1">
						
							<%-- url 찾기 --%>
							<c:set var="url" value="" />
							
							<c:forEach var="menu2" items="${frontMenuList2 }">
								<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
									<c:if test="${empty url && not empty menu2.menuUrl }">
										<c:set var="url" value="${menu2.menuUrl }" />
									</c:if>
									
									<c:forEach var="menu3" items="${frontMenuList3 }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
							
							<%-- <a href="${url }">${menu1.menuNm }</a> --%>
							<a>${menu1.menuNm }</a>
							
							<ul>
								<c:forEach var="menu2" items="${frontMenuList2 }">
									<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
										<li>
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
							
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- //header --> 