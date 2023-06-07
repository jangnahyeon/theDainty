<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${empty result.code ? 'insert' : 'update' }" />


<script type="text/javaScript" type="text/javascript" defer="defer">
function fn_egov_selectList() {
	document.getElementById("listForm").action = "<c:url value='/admin/code/codeMagmtList.do'/>";
   	document.getElementById("listForm").submit();
} 


function fn_egov_save() {
	var code = document.getElementById("detail").code.value;
	if(code == ''){
		alert("관리코드를 입력해주세요.");
		document.getElementById("detail").code.foucus();
		return false;
		
	}
	if(confirm("저장하시겠습니까??")){
		document.getElementById("detail").action = "<c:url value='/admin/code/codeMagmtInsert.do'/>";
	   	document.getElementById("detail").submit();
	}
} 

function fn_egov_update() {
	if(confirm("수정하시겠습니까??")){
		document.getElementById("detail").action = "<c:url value='/admin/code/codeMagmtUpdate.do'/>";
	   	document.getElementById("detail").submit();
	}
} 

</script>

	<!-- 컨텐츠 영역 s -->
		<div class="bd_top_type02">
			<h4 class="mt0 tit area_left">코드정보</h4>
		</div>

		<form:form modelAttribute="result" name="detail" id="detail" method="post">
		<input type="hidden" name="beforCode" value="<c:out value='${result.code}'/>"/>
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
						<form:input path="code" cssClass="wd_100"/>
					</td>
				</tr>
				<tr>
					<th>관리코드명</th>
					<td>
						<form:input path="codeNm" cssClass="wd_100"/>
					</td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td>
						<form:select path="useYn">
							<form:option value="Y">Y</form:option>
							<form:option value="N">N</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>참조코드</th>
					<td>
						<form:input path="refCode" cssClass="wd_100"/>
					</td>
				</tr>
				<tr>
					<th>사용자정의</th>
					<td>
						<form:input path="userDefine" cssClass="wd_100"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<form:input path="cont" cssClass="wd_100"/>
					</td>
				</tr>
			</tbody>
		</table> 
		
		
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		
		</form:form>
	
			<!-- // 타이틀 -->
			<div class="bd_btn_area center" id="sysbtn">							
				<c:if test="${flag == 'update'}">
					<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
					<a href="javascript:fn_egov_update();" class="btn_black line_gray">수정</a>
				</c:if>
				<c:if test="${flag == 'insert'}">
					<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
					<a href="javascript:fn_egov_save();" class="btn_black line_gray">등록</a>
				</c:if>		
			</div>
		
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="pageIndex"/>
		</form:form>
		
		
			
	<!-- //컨텐츠 영역 e -->
