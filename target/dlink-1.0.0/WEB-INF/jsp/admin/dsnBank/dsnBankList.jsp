<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script type="text/javaScript" type="text/javascript">
/* 글 수정 화면 function */
function fn_egov_select(dsnNo) {
    document.getElementById("listForm").dsnNo.value = dsnNo;
   	document.getElementById("listForm").action = "<c:url value='/admin/dsn/dsnBankDetail.do'/>";
   	document.getElementById("listForm").submit();
}



/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
}

 
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
} 

function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/addDsnBankView.do'/>";
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
	
	<div class="bd_top_type01">
		<div class="area_left">
			<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
		</div>
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
		<form:hidden path="dsnNo"/>
		<div class="fr">
			<fieldset class="search_form">
				<legend>검색</legend>

				<div class="sel_box">										
					<label for="searchCondition">검색조건</label>
					<div>
						<form:select path="searchCondition">
							<form:option value="0">디자인명</form:option>
							<form:option value="1">컨셉</form:option>
						</form:select>
					</div>
				</div>

				<div class="bd_sel_search">
					<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
					<form:input path="searchKeyword" onkeypress="enterkey()"/>
					<input type="button" value="검색">
				</div>
			</fieldset>
		</div>	
		</form:form>
	</div>
	
	<ul class="lst_thum row01">
		<c:forEach var="result" items="${resultList}" varStatus="vs">
			<li>
				<a href="#none" onclick="fn_egov_select('${result.dsnNo }')">
					<span class="info_poster"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt="${result.fileNm }"></i></span>								
					<strong>${result.regDt }<i>${result.dsnNm }</i></strong>
					<c:forEach var="code" items="${codeList}" varStatus="vs">
						<c:if test="${code.code eq result.dsnPart }">
							<span class="info_btn"><em class="btn_st bg_blue_green">${code.codeNm }</em></span>
						</c:if>
					</c:forEach>
					
					<span class="info_over">
						<strong>${result.regDt }<i>${result.dsnNm }</i></strong>
						<span class="info_btn"><em class="btn_st">상세보기</em></span>
					</span>
				</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 페이징 -->
	<div id="paging" class="bd_pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"  type="image"  jsFunction="fn_egov_link_page"/>
	</div>
	<!-- end 페이징 -->
	
	
	<div class="bd_btn_area right">
		<a href="#none" class="btn_black" onclick="go_add()">등록</a>
	</div>
			
	<!-- //컨텐츠 영역 e -->
