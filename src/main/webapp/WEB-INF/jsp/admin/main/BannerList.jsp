<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script type="text/javaScript" type="text/javascript">
/* 글 수정 화면 function */
function fn_egov_select(bannerNo) {
    document.getElementById("listForm").bannerNo.value = bannerNo;
   	document.getElementById("listForm").action = "<c:url value='/admin/main/selectBanner.do'/>";
   	document.getElementById("listForm").submit();
}



/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/main/banSearchList.do'/>";
   	document.getElementById("listForm").submit();
}

 
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/main/banSearchList.do'/>";
   	document.getElementById("listForm").submit();
} 

function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/main/bannerView.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>

	<!-- 컨텐츠 영역 s -->
	
	<!-- 상세검색 영역 s -->
	<div class="bd_top_type01">
		<div class="area_left">
			<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
		</div>
		
		<div class="fr">
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="bannerNo" id="bannerNo" />
			<fieldset class="search_form">
				<legend>검색</legend>

				<div class="sel_box">										
					<label for=searchCondition>검색조건</label>
					<div>
						<form:select path="searchCondition">
							<form:option value="0">배너명</form:option>
							<form:option value="1">배너영역명</form:option>
						</form:select>
					</div>
				</div>

				<div class="bd_sel_search">
					<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
					<form:input path="searchKeyword"/>
					<input type="button" value="검색" onclick="go_search();">
				</div>
			</fieldset>
			<form:hidden path="pageIndex" />
		</form:form>
		</div>			
	</div>

	<div class="bd_top_type02">
		<h4 class="mt0 tit area_left">포트폴리오 선택관리</h4>
	</div>
		<table class="bd_tbl center sortable_wrap">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="25%">
				<col width="10%">
				<col>
				<col width="10%">
	        </colgroup>
			<thead>
				<tr>
					<th scope="col" class="">배너표시영역</th>
					<th scope="col" class="">배너명</th>
					<th scope="col" class="">설명</th>
					<th scope="col" class="">표시순서</th>
					<th scope="col" class="">이미지</th>
					<th scope="col" class="">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="vs">
					<tr onclick="fn_egov_select('${result.bannerNo}')">
						<td>${result.bannerArea }</td>
						<td>${result.bannerNm }</td>
						<td>${result.bannerCont }</td>
						<td>${result.ordSeq }</td>
						<td><i class="sort_img"><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></i></td>
						<td>${result.regDt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 -->
		<div id="paging" class="bd_pagination">
			<ui:pagination paginationInfo = "${paginationInfo}"  type="image"  jsFunction="fn_egov_link_page"/>
		</div>
		<!-- end 페이징 -->
		
		<div class="bd_btn_area right">
			<a href="#none" class="btn_black line_gray" onclick="go_add()">등록</a>
		</div>


	<!-- //컨텐츠 영역 e -->
