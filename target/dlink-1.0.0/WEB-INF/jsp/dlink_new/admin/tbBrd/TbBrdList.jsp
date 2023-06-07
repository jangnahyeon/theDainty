<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 /**
  * @Class Name : TbBrdList.jsp
  * @Description : TbBrd List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-25
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title> -->
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 수정 화면 function */
function fn_egov_select(brdSeq) {
    document.getElementById("listForm").brdSeq.value = brdSeq;
    document.getElementById("listForm").menuSeq.value = "${param.menuSeq }";
   	document.getElementById("listForm").action = "<c:url value='/admin/tbBrd/updateTbBrdView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbBrd/addTbBrdView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/tbBrd/TbBrdList.do'/>";
   	document.getElementById("listForm").submit();
}

$(function(){
	$("#searchCondition").val("${empty searchVO.searchCondition ? 'all' : searchVO.searchCondition }");
	$("#searchKeyword").val("${searchVO.searchKeyword }");
});

 // -->
</script>
<!-- </head> -->
<body>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="brdSeq" />
    <input type="hidden" name="menuSeq" value="${param.menuSeq }" />
    
<%--
<!-- container_wrap -->
<div id="container_wrap">

	<!-- contents_layout s -->
	<div id="contents_layout" class="contents_layout">
	--%>
		
<!-- <div id="content_pop"> -->
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<!-- List -->
	<!-- <div id="table"> -->
	
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
							<option value="title">제목</option>
							<option value="srcNm">출처</option>
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
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%">				
				<col width="10%">				
				<col>				
				<col width="15%">
				<col width="10%">	
				
				<col width="10%">	
				<col width="5%">		
				<%-- <col width="15%">
								
				<col width="15%">				
				<col width="15%">				
				<col width="15%"> --%>
			</colgroup>		
			<thead>  
				<tr>
					<th scope="col">게시글번호</th>
					<!-- <th scope="col">메뉴번호</th>
					<th scope="col">작성자번호</th> -->
					<th scope="col">작성자(ID)</th>
					<th scope="col">제목</th>				
					<!-- <th scope="col">내용</th> -->
					<th scope="col">출처</th>
					<th scope="col">첨부파일</th>
					
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
					<!-- <th scope="col">등록일</th>
					
					<th scope="col">등록자</th>
					<th scope="col">수정일</th>
					<th scope="col">수정자</th> -->
				</tr>
			</thead>
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
				<fmt:formatDate value="${result.regDt }" pattern="yyyy-MM-dd HH:mm:ss" var="regDt"/>
				<fmt:formatDate value="${result.updDt }" pattern="yyyy-MM-dd HH:mm:ss" var="updDt"/>
			
				<tr>
	 				<td><a href="javascript:fn_egov_select('<c:out value="${result.brdSeq}"/>')"><c:out value="${result.brdSeq}"/></a>&nbsp;</td>
					<%-- <td><c:out value="${result.menuSeq}"/>&nbsp;</td>
					<td><c:out value="${result.memSeq}"/>&nbsp;</td> --%>
					<td><c:out value="${result.memVO.memNm}(${result.memId})"/>&nbsp;</td>
					<td>
						<a href="javascript:fn_egov_select('<c:out value="${result.brdSeq}"/>')">
							<c:out value="${result.title}"/>
						</a>
					</td>
					<%-- <td><c:out value="${result.cont}"/>&nbsp;</td> --%>
					<td><c:out value="${result.srcNm}"/>&nbsp;</td>
					<td>
						<c:if test="${not empty result.brdFileVOList }">
							<em class="icon_file"></em>
						</c:if>
					</td>
					
					<td><c:out value="${regDt}"/>&nbsp;</td>
					<td><c:out value="${result.readCnt}"/>&nbsp;</td>
					<%-- <td><c:out value="${regDt}"/>&nbsp;</td>
					
					<td><c:out value="${result.regId}"/>&nbsp;</td>
					<td><c:out value="${updDt}"/>&nbsp;</td>
					<td><c:out value="${result.updId}"/>&nbsp;</td> --%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	<!-- </div> -->
	<!-- /List -->
	<div id="paging" class="bd_pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	<div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn" class="bd_btn_area center">
					<span class="btn_blue_l">
						<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
						<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div>
<!-- </div> -->

<!-- </div>
</div> -->

</form:form>
</body>
</html>
