<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 /**
  * @Class Name : TbBrdRegister.jsp
  * @Description : TbBrd Register 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-03-22
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
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
		<div class="bd_top_type01">
				<div class="area_left">
					<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
				</div>
				<div class="fr">
					<fieldset class="search_form">
						<legend>검색</legend>
						<div class="bd_sel_search">
							<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
							<input type="text" name="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="searchKeyword" maxlength="20"/>
							<input type="button" value="검색" onclick="javascript:go_search()">
						</div>
					</fieldset>
				</div>		
			</div>
			<p class="cl_blue left">※ 팝업은 최대 3개까지 보여집니다.</p>
			<table class="bd_tbl bd_biz center">
				<caption>팝업관리 목록</caption>
				<colgroup>
					<col width="3%">
					<col width="15%">
					<col width="8%">
					<col width="8%">
					<col width="5%">
		        </colgroup>
				<thead>
					<tr>
						<th scope="col" class="">번호</th>
						<th scope="col" class="">제목</th>
						<th scope="col" class="">기간</th>
						<th scope="col" class="">사용유무</th>
						<th scope="col" class="">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:forEach var="result" items="${popupList}" varStatus="vs">
						<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.rn }" /></td>
						<td class="left"><a href="/admin/popup/popupDetail.do?popSeq=${result.popSeq }">${result.title }</a></td>
						<td style="line-height:10px;">${result.startDate }&nbsp;&nbsp; ~ &nbsp;&nbsp;${result.endDate }</td>
						<td>
							<c:if test="${result.useYn eq 'Y' }">사용함</c:if>
							<c:if test="${result.useYn eq 'N' }">사용안함</c:if>
						</td>
						<td>${result.regDate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<div class="bd_btn_area right">
				<a href="/admin/popup/popupAdd.do" class="btn_black">등록</a>
			</div>
			
			<div id="paging" class="bd_pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
			</div>
			
</form:form>