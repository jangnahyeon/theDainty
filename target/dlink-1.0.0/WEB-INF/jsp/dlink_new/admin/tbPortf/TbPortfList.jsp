<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : popMag.jsp
  * @Description : popMag 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbPortf/addTbPortfView.do'/>";
   	document.getElementById("listForm").submit();		
}
function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
function go_search() {
	var url =  window.location.pathname;
	document.getElementById("listForm").action = url;
   	document.getElementById("listForm").submit();
} 
function fn_egov_link_page(pageNo){
	var url =  window.location.pathname;
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = url;
   	document.getElementById("listForm").submit();
}
</script>

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<form:hidden path="pageIndex" />
	<form:hidden path="code" />
					<div class="bd_top_type01">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
						</div>
						
						<div class="fr">
							<fieldset class="search_form">
								<legend>검색</legend>


								<div class="bd_sel_search">
									<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
									<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="searchKeyword" maxlength="20"/>
									<input type="button" value="검색" onclick="javascript:go_search()">
								</div>
							</fieldset>
						</div>			
					</div>
					
					<ul class="lst_thum row01">
						<c:forEach var="result" items="${resultList}" varStatus="vs">
							<li>
								<a href="/admin/tbSisul/tbPortfDetail.do?portfSeq=${result.portfSeq }" onclick="">
									<span class="info_poster"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></i></span>								
									<strong>${result.regDt }<i>${result.title }</i></strong>
									
									<span class="info_over">
										<strong>${result.regDt }<i>${result.title }</i></strong>
										<span class="info_btn"><em class="btn_st">상세보기</em></span>
									</span>
								</a>
							</li>
						</c:forEach>
					</ul>
					<div class="bd_btn_area right">
						<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
					</div>
					<div class="bd_pagination" id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
					</div>
					<!-- //컨텐츠 영역 e -->
					
</form:form>