<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javaScript" type="text/javascript" defer="defer">

/* 글 수정 화면 function */
function fn_egov_select(code) {
    document.getElementById("listForm").code.value = code;
   	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtDetail.do'/>";
   	document.getElementById("listForm").submit();
}



/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtList.do'/>";
   	document.getElementById("listForm").submit();
}

 
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtList.do'/>";
   	document.getElementById("listForm").submit();
} 

function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtInsertView.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>



<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" value="" name="code" id="code" >
	<!-- 컨텐츠 영역 s -->
	<div class="bd_top_type01">
		<div class="area_left">
			<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
		</div>
		
		<div class="fr">
			<fieldset class="search_form">
				<legend>검색</legend>

				<div class="sel_box">										
					<label for=searchCondition>검색조건</label>
					<div>
						<form:select path="searchCondition">
							<form:option value="0">관리코드</form:option>
							<form:option value="1">관리코드명</form:option>
						</form:select>
					</div>
				</div>

				<div class="bd_sel_search">
					<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
					<form:input path="searchKeyword"/>
					<input type="button" value="검색" onclick="go_search();">
				</div>
			</fieldset>
		</div>			
	</div>

		<table class="bd_tbl bd_biz center">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="15%">
				<col>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
	        </colgroup>
			<thead>
				<tr>
					<th scope="col" class="">관리코드</th>
					<th scope="col" class="">코드명</th>
					<th scope="col" class="">사용여부</th>
					<th scope="col" class="">참조코드</th>
					<th scope="col" class="">사용자정의</th>
					<th scope="col" class="">설명</th>
					<th scope="col" class="">등록일자</th>
					<th scope="col" class="">변경일자</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="vs">
						<tr onclick="fn_egov_select('${result.code}')">
							<td>${result.code }</td>
							<td>${result.codeNm }</td>
							<td>${result.useYn }</td>
							<td>${result.refCode }</td>
							<td>${result.userDefine }</td>
							<td>${result.cont }</td>
							<td>${result.regDt }</td>
							<td>${result.updDt }</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 -->
		<div id="paging" class="bd_pagination">
			<ui:pagination paginationInfo = "${paginationInfo}"  type="image"  jsFunction="fn_egov_link_page"/>
			<form:hidden path="pageIndex" />
		</div>
		<!-- end 페이징 -->
		
</form:form>
		<div class="bd_btn_area right">
			<a href="#none" class="btn_black line_gray" onclick="go_add()">등록</a>
		</div>


	<!-- //컨텐츠 영역 e -->
