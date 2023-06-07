<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${bannerVO.bannerNo == 0 ? 'insert' : 'update' }" />

<script type="text/javaScript" type="text/javascript">
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/main/banSearchList.do'/>";
   	document.getElementById("listForm").submit();
} 


function go_update() {
	document.getElementById("listForm").action = "<c:url value='/admin/main/updateBannerView.do'/>";
   	document.getElementById("listForm").submit();
} 


function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").action = "<c:url value='/admin/main/deleteBanner.do'/>";
	   	document.getElementById("listForm").submit();
	}
}
</script>
	<!-- 컨텐츠 영역 s -->
	<table class="bd_tbl bd_tbl_view sortable">
		<caption>배너 상세정보</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<tbody>
		<tr>
			<th>배너영역</th>
			<td>
				${result.bannerArea }
			</td>
		</tr>
		<tr>
			<th>배너이름</th>
			<td>${result.bannerNm }</td>
		</tr>
		<tr>
			<th>배너설명</th>
			<td>${result.bannerCont }</td>
		</tr>
		<tr>
			<th>순서</th>
			<td>${result.ordSeq }</td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td>${result.disYn }
			</td>
		</tr>
		<tr>
			<th rowspan="2">이미지</th>
			<td>
				<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></i>
			</td>
		</tr>
		</tbody>
	</table>
		
	<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
		<form:hidden path="searchCondition"/>
		<form:hidden path="searchKeyword"/>
		<form:hidden path="pageIndex"/>
		<input type="hidden" value="${result.bannerNo }" name="bannerNo" id="bannerNo" />
	</form:form>
	
	<div class="bd_btn_area center">
		<a href="#none" class="btn_black" onclick="go_search()">목록</a>
		<a href="#none" class="btn_black line_gray" onclick="go_update('${result.bannerNo }')">수정</a>
		<a href="#none" class="btn_black line_orange" onclick="fn_egov_delete()">삭제</a>
	</div>

	<!-- //컨텐츠 영역 e -->
