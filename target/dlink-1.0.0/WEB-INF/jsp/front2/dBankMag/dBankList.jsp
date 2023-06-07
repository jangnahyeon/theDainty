<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>		
		

<script>
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/dBank/dBankList.do'/>";
   	document.getElementById("listForm").submit();
}
function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/dBank/dBankList.do'/>";
   	document.getElementById("listForm").submit();
} 


</script>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<form:hidden path="pageIndex" />
	<form:hidden path="searchKeyword2" />		
		<div class="contents">			
			<div class="innerwrap">	
				
				<h3>패키지 디자인 소스</h3>
				<div class="bd_top_style">
					<div class="area_left">
						<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
					</div>
					
					<fieldset class="bd_sel_search">
						<legend>검색</legend>
						<label for="sear_" class="focus_tit" style="">검색어를 입력하세요</label>
						<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="sear_"/>
						<input type="button" value="검색"onclick="javascript:go_search()">
					</fieldset>	
				</div>
				<c:if test="${!empty searchVO }">
				<!-- 이미지게시판 -->
					<ul class="lst_thum row01">
						<c:forEach var="result" items="${resultList}" varStatus="vs">
						<li>
							<em class="info_favorite"><button class="icon_heart" ></button></em>
							<a href="/imagefile/download.do?file_no=${result.fileSeq }" onclick="showLayer(this,'.pop_modal');return false;">
								<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt="${result.imgNm }"></i></span>
								<strong>${result.imgNm }</strong>
								
								<span class="info_over">
									<strong>${result.imgNm }</strong>
									<span class="info_btn"><em class="btn">다운로드</em></span>
								</span>
							</a>
						</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${empty searchVO }">
					<ul class="row01">
						<li class="no_data">현재 등록된 디자인이 없습니다.</li>
					</ul>
				</c:if>
				<!-- //이미지게시판 -->
				
				<div class="pagination">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
				</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
</form:form>