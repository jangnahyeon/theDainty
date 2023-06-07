<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${empty dsnBankVO.dsnNo ? 'insert' : 'update' }" />


<script type="text/javaScript" type="text/javascript" defer="defer">
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
} 


function go_update() {
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/updateDsnBankView.do'/>";
   	document.getElementById("listForm").submit();
} 


function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").action = "<c:url value='/admin/dsn/deleteTDsnBank.do'/>";
	   	document.getElementById("listForm").submit();
	}
}
</script>


	<!-- 컨텐츠 영역 s -->
	
	<div class="detail_design">
		<div class="detail_img">
			<span id="file_attch">
				<c:if test="${not empty dsnBankVO.fileSeq }">
					<img src="/imagefile/preview.do?fileSeq=${dsnBankVO.fileSeq }" alt="">
				</c:if>
			</span>
		</div>
		<div class="detail_info">
			<table class="bd_tbl bd_tbl_view">
				<caption>디자인에 대한 상세정보입니다.</caption>
				<col width="15%">
				<col>
				<tbody>
					<tr>
						<th scope="row" class="bd_title">디자인명</th>
						<td>${dsnBankVO.dsnNm }</td>
					</tr>
					<tr>
						<th scope="row">분야</th>
						<td>
							<c:forEach var="code" items="${codeList}" varStatus="vs">
								<c:if test="${code.code eq dsnBankVO.dsnPart }">
									${code.codeNm }
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="row">연관검색어</th>
						<td>${dsnBankVO.concept }</td>
					</tr>
					<tr>
						<th scope="row">컨셉</th>
						<td>${dsnBankVO.refWord }</td>
					</tr>
				</tbody>
			</table>
			
			
			<form:form modelAttribute="dsnBankVO" name="listForm" id="listForm" method="post">
				<form:hidden path="searchCondition"/>
				<form:hidden path="searchKeyword"/>
				<form:hidden path="pageIndex"/>
				<input type="hidden" value="${dsnBankVO.dsnNo }" name="dsnNo" id="dsnNo" />
			</form:form>
			
			<div class="bd_btn_area center">
				<a href="#none" class="btn_black" onclick="go_search()">목록</a>
				<a href="#none" class="btn_black line_gray" onclick="go_update()">수정</a>
				<a href="#none" class="btn_black line_orange" onclick="fn_egov_delete()">삭제</a>
			</div>
		
		</div>
	</div>
		
	<!-- //컨텐츠 영역 e -->
