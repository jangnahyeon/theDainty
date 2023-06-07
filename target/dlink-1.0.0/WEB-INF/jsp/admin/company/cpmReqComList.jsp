<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyList.jsp
  * @Description : TCommuty List 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 수정 화면 function */
function fn_egov_select(comId, reqDt) {
	document.getElementById("listForm").reqDt.value = reqDt;
	document.getElementById("listForm").comId.value = comId;
   	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryRequestView.do'/>";
   	document.getElementById("listForm").submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryRequestList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryRequestList.do'/>";
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
			<input type="hidden" id="reqDt" name="reqDt"/>
			<input type="hidden" id="comId" name="comId"/>
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
									<label for="sel_area">검색조건</label>
									<div>
										<form:select path="searchCondition" id="sel_area">
											<form:option value="0">사업장번호</form:option>
											<form:option value="1">사업장이름</form:option>
										</form:select>
									</div>
								</div>

								<div class="bd_sel_search">
									<legend>검색</legend>
								<label for="sear_" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: hidden;">검색어를 입력하세요</label>
								<input type="text" id="sear_">
								<input type="button" value="검색">
								</div>
							</fieldset>
						</div>			
					</div>
						<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="10%">
								<col width="20%">								
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">								
								<col width="10%">
								<col width="10%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">기업명</th>
									<th scope="col" class="">사업자번호</th>
									<th scope="col" class="">대표자명</th>
									<th scope="col" class="">대표자휴대폰</th>
									<th scope="col" class="">담당자명</th>
									<th scope="col" class="">담당자연락처</th>
									<th scope="col" class="">승인여부</th>
									<th scope="col" class="">등록일시</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty resultList }"><tr><td colspan="9" class="center" >등록된 글이 없습니다.</td></tr></c:if>
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<tr>
										<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
										<td><a href="#none" onclick="fn_egov_select('${result.comId }','${result.reqDt }')">${result.comNm }</a></td>
										<td>${result.comId }</td>
										<td>${result.ceoNm }</td>
										<td>${result.ceoMobileNo }</td>
										<td>${result.damdangNm }</td>
										<td>${result.damdangMobileNo }</td>
										<td>
											<c:if test="${result.acceptYn eq 'Y'}">승인</c:if>
											<c:if test="${result.acceptYn eq 'N'}">미승인</c:if>
										</td>
										<td>${result.regDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
						
						
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView('${menuId}','insert');" class="btn_black">등록</a>
						</div>

				
				
		</form:form>

