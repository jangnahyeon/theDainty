<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty resultList }">

	<c:set var="today" value="<%=new java.util.Date()%>" />

	<fmt:formatDate value="${today }" pattern="yyyy" var="year" />
	<fmt:formatDate value="${today }" pattern="MM" var="month" />

    		<!-- <div class="group wrap_news"> -->			
				<h3>디링크 공지사항</h3>
				<div class="area_news">
					<div class="area_schedule">
						<p>
							<a href="/front/brd/brdList.do?menuSeq=${tbMenuVO.menuSeq }">
								<span>이달의 소식</span>
								<strong>${year }.<i>${month }</i></strong>
								<em><i>전체보기</i></em>
							</a>
						</p>
						<ul>
							<c:forEach var="result" items="${resultList }" varStatus="vs">
								<c:if test="${vs.index < 4 }">
									<li>
										<a href="/front/brd/brdView.do?menuSeq=${tbMenuVO.menuSeq }&brdSeq=${result.brdSeq }">
											<span>
												<em><c:out value="${result.title}"/></em>
												<i><fmt:formatDate value="${result.regDt }" pattern="yyyy.MM.dd" /></i>
											</span>
											<em>${result.srcNm }</em>
										</a>
									</li>
								</c:if>								
							</c:forEach>
						</ul>
					</div>
				</div>
			<!-- </div> -->
			
</c:if>