<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javaScript" type="text/javascript" defer="defer">
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtList.do'/>";
   	document.getElementById("listForm").submit();
} 


function go_update() {
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtUpdateView.do'/>";
   	document.getElementById("listForm").submit();
} 


function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtDelete.do'/>";
	   	document.getElementById("listForm").submit();
	}
}
</script>

	<!-- 컨텐츠 영역 s -->
		<div class="bd_top_type02">
			<h4 class="mt0 tit area_left">코드정보</h4>
		</div>

		<table class="bd_tbl bd_tbl_view" cellspacing="0">
			<caption></caption>
			<colgroup>
				<col style="width: 30%;">
				<col style="width: 70%;">
			</colgroup>
			<tbody>
				<tr>
					<th>관리코드</th>
					<td>
						${result.code }
					</td>
				</tr>
				<tr>
					<th>관리코드명</th>
					<td>
						${result.codeNm }
					</td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td>
						${result.useYn }
					</td>
				</tr>
				<tr>
					<th>참조코드</th>
					<td>
						${result.refCode }
					</td>
				</tr>
				<tr>
					<th>사용자정의</th>
					<td>
						${result.userDefine }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${result.cont }
					</td>
				</tr>
			</tbody>
		</table> 
		
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="pageIndex"/>
			<input type="hidden" value="${result.code }" name="code" id="code" />
		</form:form>
		
		<div class="bd_btn_area center">
			<a href="#none" class="btn_black" onclick="go_search()">목록</a>
			<a href="#none" class="btn_black line_gray" onclick="go_update('${result.code }')">수정</a>
			<a href="#none" class="btn_black line_orange" onclick="fn_egov_delete()">삭제</a>
		</div>

	<!-- //컨텐츠 영역 e -->
