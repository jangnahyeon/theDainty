<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulHldList.jsp
  * @Description : TbSisulHld List 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-03-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="flag" value="${empty tbSisulVO.sisulSeq ? 'insert' : 'update' }" />

<script type="text/javaScript" language="javascript" defer="defer">


function fn_egov_select(hldSeq) {
    document.getElementById("listForm").hldSeq.value = hldSeq;
   	document.getElementById("listForm").action = "<c:url value='/admin/sisul/tbSisulHldDetail.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbSisulHld/tbSisulHldAddView.do'/>";
   	document.getElementById("listForm").submit();		
}

function fn_egov_link_page(pageNo){
	var url =  window.location.pathname;
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = url;
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

 // -->
</script>

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="hldSeq" />
    <form:hidden path="pageIndex" />
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
					<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="15%">
								<col width="10%">
								<col width="10%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">휴일 이름</th>
									<th scope="col" class="">휴일 날짜</th>
									<th scope="col" class="">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>
										<td><a href="javascript:fn_egov_select('<c:out value="${result.hldSeq}"/>')">${result.hldNm}</a></td>
										<td>${result.hldDt}</td>
										<td>${result.regDt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
							<!-- <a href="#" class="btn_black line_gray">수정</a>
							<a href="#" class="btn_black line_orange">삭제</a> -->
						</div>
						
						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
						</div>
						
</form:form>