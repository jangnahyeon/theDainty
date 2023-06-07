<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : mJoinInquiryList.jsp
  * @Description : mJoinInquiry List 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-07
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


/* 글 상세  화면 function */
function fn_egov_select(loginId,reqNo,registerFlag) {
    document.getElementById("listForm").loginId.value = loginId;
    document.getElementById("listForm").reqNo.value = reqNo;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/member/mJoinDetail.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.getElementById("listForm").registerFlag.value = "insert";
   	document.getElementById("listForm").action = "<c:url value='/admin/member/addTSpecReqComView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/member/mJoinInquiryList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/member/mJoinInquiryList.do'/>";
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
   	<input type="hidden" name="reqNo" id="reqNo" />	
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
        					<form:option value="1">신청관리번호</form:option>
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
	
	<table class="bd_tbl bd_biz center" >
		<caption>전문회사신청정보</caption>
		<colgroup>
			<col width="5%"/>				
			<col width="30%"/>				
			<col width="20%"/>				
			<col width="10%"/>				
			<col width="15%"/>	
			<col width="5%"/>	
			<col width="10%"/>						
		</colgroup>	
			
		<thead>  
			<tr>
				<th>순번</th>
				<th>업체명</th>
				<th>아이디</th>
				<th>신청자</th>
				<th>신청관리번호</th>
				<th>승인여부</th>
				<th>신청일자</th>
			</tr>
		</thead>
		<tbody>	
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + status.count)}"/></td>
				<td>
					<a href="javascript:fn_egov_select('${result.loginId}','${result.reqNo}','detail')">${result.comNm}</a>
				</td>
				<td class="listtd">${result.loginId}</td>
				<td class="listtd"><c:out value="${result.requester}"/></td>
				<td class="listtd"><c:out value="${result.reqNo}"/></td>
				<td class="listtd">
				<c:choose>
					<c:when test="${result.acceptYn == 'AC0001'}">
						승인
					</c:when>
					<c:when test="${result.acceptYn == 'AC0002'}">
						반려
					</c:when>
					<c:otherwise>
						대기
					</c:otherwise>
				</c:choose>
				</td>
				<td class="listtd"><c:out value="${result.reqDt}"/></td>
			</tr>
		</c:forEach>
		<c:if test="${empty resultList}">
			<tr>
				<td colspan="6">등록된 내용이 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<div id="paging" class="bd_pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	
		
</form:form>

