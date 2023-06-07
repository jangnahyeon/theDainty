<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbCodeGbList.jsp
  * @Description : TbCodeGb List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-17
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
<script type="text/javaScript" language="javascript" defer="defer">

/* 글 수정 화면 function */


function fn_egov_select(gbCd) {
    document.getElementById("listForm").gbCd.value = gbCd;
   	document.getElementById("listForm").action = "<c:url value='/admin/tbCodeGb/updateTbCodeGbView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbCodeGb/addTbCodeGbView.do'/>";
   	document.getElementById("listForm").action = "<c:url value='/admin/tbCodeGb/addTbCodeGbView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/tbCodeGb/TbCodeGbList.do'/>";
	//document.getElementById("listForm").action = "<c:url value='/code/codeGbList.do'/>";
   	document.getElementById("listForm").submit();
}

$(function(){
	$("#searchCondition").val("${empty searchVO.searchCondition ? 'all' : searchVO.searchCondition }");
	$("#searchKeyword").val("${searchVO.searchKeyword }");
});

 // -->
</script>
</head>
<body>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="gbCd" />
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<!-- List -->
	<div id="table">
	
		<div class="bd_top_type01">
			<div class="area_left">
				<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount }</span>건 <strong><em>${paginationInfo.currentPageNo }</em>/<span>${paginationInfo.totalPageCount }</span>페이지</strong></p>
			</div>
			
			<div class="fr">
				<fieldset class="search_form">
					<legend>검색</legend>
	
					<div class="sel_box">										
						<label for="searchCondition">검색조건</label>
						<div>
							<select id="searchCondition" name="searchCondition">
								<option value="all">전체</option>
								<option value="gbCd">구분코드</option>	
								<option value="gbNm">구분명</option>								
							</select>
						</div>
					</div>
	
					<div class="bd_sel_search">
						<label for="searchKeyword" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;"></label>
						<input type="text" id="searchKeyword" name="searchKeyword" style="color: rgb(163, 163, 163);" placeholder="검색어를 입력하세요" maxlength="20">
						<input type="button" value="검색" onclick="fn_egov_link_page(1);">
					</div>
				</fieldset>
			</div>			
		</div>
					
		<table class="bd_tbl bd_biz center">
			<colgroup>
				<col/>				
				<col/>				
				<col/>				
				<%-- <col/>				
				<col/>				
				<col/>				
				<col/>	 --%>			
			</colgroup>		
			<thead>  
			<tr>
				<th align="center">구분코드</th>
				<th align="center">구분명</th>
				<th align="center">사용여부</th>
				<!-- <th align="center">등록일</th>
				<th align="center">등록자</th>
				<th align="center">수정일</th>
				<th align="center">수정자</th> -->
			</tr>
			</thead>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
	 				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.gbCd}"/>')"><c:out value="${result.gbCd}"/></a>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.gbNm}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.useYn eq 'Y' ? '사용' : '미사용' }"/>&nbsp;</td>
					<%-- <td align="center" class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updId}"/>&nbsp;</td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /List -->
	<div id="paging" class="bd_pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	<%-- <div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn">
					<span class="btn_blue_l"><a href="javascript:fn_egov_addView();" class="btn_black">등록</a><img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div> --%>
	<div class="bd_btn_area right">
		<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
	</div>
</div>
</form:form>
</body>
</html>
