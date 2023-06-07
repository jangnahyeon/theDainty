<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TWordList.jsp
  * @Description : TWord List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" type="text/javascript" defer="defer">

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/business/wordArgmtList.do'/>";
   	document.getElementById("listForm").submit();
}

 
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/business/wordArgmtList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>


	<!-- container_wrap -->
	<div id="wrap_container">

		<div class="wrap_content">


			<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
				<!-- <input type="hidden" name="searchCondition" id="searchCondition" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" /> -->
				
					<!-- 타이틀 시작 -->
					<div class="con_title">
						<h3><i>용어정리</i></h3>
						<ul class="loca">
							<li><a href="/front/main.do" class="home">home</a></li>
							<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
							<li><a href="#">용어정리</a></li>
						</ul>				
					</div>
					<!-- 타이틀 끝 -->
					
			
			
						<!-- contents s -->	
					<div class="contents">
						<!-- 컨텐츠 영역 s -->
								
					
						<div class="bd_top_style">
							<div class="area_left">
								<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
								<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.recordCountPerPage}</span>페이지</strong></p>
							
								<div class="area_right">
									
									<div class="area_select">
										<div class="selectbox">
											<label for="standard">검색조건</label>
											
											<form:select path="searchCondition" id="standard">
												<form:option value="0">전체</form:option>
												<form:option value="1">용어</form:option>
												<form:option value="2">설명</form:option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
							
							
							<fieldset class="bd_sel_search">
								<legend>검색</legend>
								<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
								<input type="text" id="sear_">
								<input type="button" onclick="go_search();"  value="검색">
							</fieldset>	
						</div>
							
						<table class="tbl_basic center bd_type01">
							<caption>게시판 목록으로 번호, 제목, 작성자, 첨부파일, 작성일, 조회 정보가 확인되며 제목선택시 상세페이지로 이동됩니다.</caption>
								<colgroup>
									<col width="10%">
									<col width="20%">
									<col width="70%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="">번호</th>
										<th scope="col" class="">용어</th>
										<th scope="col" class="">설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="vs">
										<tr>
											<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
											<td>${result.wordNm}</td>
											<td class="left" style="white-space:pre;">${result.cont}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징 -->
							<div id="paging" class="pagination">
								<ui:pagination paginationInfo = "${paginationInfo}"
										   type="image"
										   jsFunction="fn_egov_link_page"
										   />
								<form:hidden path="pageIndex" />
							</div>
							<!-- end 페이징 -->
			
				<!-- /List -->
					
				</div>
			</form:form>	
	
	</div>
</div>

