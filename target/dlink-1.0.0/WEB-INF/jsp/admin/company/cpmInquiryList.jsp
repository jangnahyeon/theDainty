<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : cpmInquiryList.jsp
  * @Description : cpmInquiryList 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


/* 글 상세  화면 function */
function fn_egov_select(loginId,registerFlag) {
    document.getElementById("listForm").loginId.value = loginId;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmDetail.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.getElementById("listForm").registerFlag.value = "insert";
   	document.getElementById("listForm").action = "<c:url value='/admin/company/addTMemComView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryList.do'/>";
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
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
   	<input type="hidden" name="loginId" value=""/>
   	<input type="hidden" name="registerFlag" id="registerFlag" />		
	
	<div class="bd_top_type01">
		<div class="area_left">
			<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount }</span>건 
			<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
		</div>
		
		<!-- 검색  -->
		<div id="search" class="fr" >
			<fieldset class="search_form">
				<legend>검색</legend>
       			<div class="sel_box">
       			    <label for="sel_area">검색조건</label>
       			    <div>
        				<form:select id="sel_area" path="searchCondition" cssClass="use">
        					<form:option value="0">아이디</form:option>
        					<form:option value="1">기업명</form:option>
        					<form:option value="2">법인등록번호</form:option>
        				</form:select>
       				</div>
       			</div>
       			<div class="bd_sel_search">
       				<form:input path="searchKeyword" placeholder="검색어를 입력하세요" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
					<input type="text" id="sear_word">
					<input type="button" onclick="go_search();"  value="검색">
                   </div>
        	</fieldset>
       	</div>
   	 </div>
   	 
    <!-- 목록  -->
	<table class="bd_tbl bd_biz center" >
		<caption>기업회원조회</caption>
		<colgroup>
			<col/>				
			<col/>				
			<col/>				
			<col/>				
			<col/>				
			<col/>				
			<col/>		
		</colgroup>		  
		<tr>
			<th>아이디</th>
			<th>기업명</th>
			<th>기업형태</th>
			<th>대표명</th>
			<th>법인등록번호</th>
			<th>대표자전화번호</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
 				<td class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.loginId}"/>','detail')">${result.loginId}</a>&nbsp;</td>
				<td class="listtd"><c:out value="${result.comNm}"/>&nbsp;</td>
				<td class="listtd"><c:out value="${result.comType}"/>&nbsp;</td>
				<td class="listtd"><c:out value="${result.ceoNm}"/>&nbsp;</td>
				<td class="listtd"><c:out value="${result.comNo}"/>&nbsp;</td>
				<td class="listtd"><c:out value="${result.ceoMobileNo}"/>&nbsp;</td>
				<td class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div id="paging" class="bd_pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	<!-- end 페이징 -->
	<!-- 등록 -->
	<!-- <div id="sysbtn" class="bd_btn_area right">
		<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
	</div> -->
	<!-- end 등록 -->
		
</form:form>

