<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 /**
  * @Class Name : TbBrdList.jsp
  * @Description : TbBrd List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-25
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<!-- <li>
	<em>관리자<span>2021-02-19<span>08:50:34</span></span></em>
	<div>
		디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
	</div>
	<p class="btn_area_reply">
		<a href="#" class="btn_st bg_gray">삭제</a>
		<a href="#" class="btn_st line_gray"><span>수정</span></a>
	</p>
</li>
<li>
	<em>관리자<span>2021-02-19<span>08:50:34</span></span></em>
	<div>
		디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
	</div>
	<p class="btn_area_reply">
		<a href="#" class="btn_st bg_gray">삭제</a>
		<a href="#" class="btn_st line_gray"><span>수정</span></a>
	</p>
</li> -->

<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	$(function() {		
		fn_cmt_page_info("${paginationInfo.currentPageNo }", "${paginationInfo.totalPageCount }");
	});
</script>

<c:forEach var="result" items="${resultList }">

	<fmt:formatDate value="${result.regDt }" pattern="yyyy-MM-dd" var="regDay"/>
	<fmt:formatDate value="${result.regDt }" pattern="HH:mm:ss" var="regTime"/>

	<li>
		<em>${result.memVO.memNm }<span>${regDay }<span>${regTime }</span></span></em>
		<div>
			<%-- ${result.cont } --%>
			${fn:replace(result.cont, newLineChar, '<br/>') }
		</div>
		<p class="btn_area_reply">
			<c:if test="${result.memId eq frontLoginVO.memId }">
				<a href="javascript:fn_cmt_del_act('${result.cmtSeq }');" class="btn_st bg_gray">삭제</a>
				<!-- <a href="#" class="btn_st line_gray"><span>수정</span></a> -->
			</c:if>
		</p>
	</li>
</c:forEach>
