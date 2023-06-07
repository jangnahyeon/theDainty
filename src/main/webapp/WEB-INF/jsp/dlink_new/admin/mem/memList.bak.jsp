<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbMemList.jsp
  * @Description : TbMem List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-18
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
<script type="text/javaScript" language="javascript" defer="defer">
// <!--
/* 글 수정 화면 function */


function fn_egov_select(memSeq) {
    document.getElementById("listForm").memSeq.value = memSeq;
   	document.getElementById("listForm").action = "<c:url value='/admin/tbMem/updateTbMemView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbMem/addTbMemView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/tbMem/TbMemList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="memSeq" />
    <input type="hidden" name="code" value="${param.code }" />
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<colgroup>
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
			</colgroup>		  
			<tr>
				<th align="center">회원번호</th>
				<th align="center">회원구분</th>
				<th align="center">회원ID</th>
				<!-- <th align="center">MemPw</th> -->
				<th align="center">이름</th>
				<th align="center">승인결과</th>
				<th align="center">등록일</th>
				<th align="center">등록자</th>
				<th align="center">수정일</th>
				<th align="center">수정자</th>
			</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
				<c:choose>
					<c:when test="${result.acceptYn eq 'Y' }">
						<c:set var="acceptYn" value="승인" />
					</c:when>
					<c:when test="${result.acceptYn eq 'N' }">
						<c:set var="acceptYn" value="반려" />
					</c:when>
					<c:when test="${result.acceptYn eq 'O' }">
						<c:set var="acceptYn" value="탈퇴" />
					</c:when>
					<c:otherwise>
						<c:set var="acceptYn" value="대기" />
					</c:otherwise>
				</c:choose>
			
				<tr>
	 				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.memSeq}"/>')"><c:out value="${result.memSeq}"/></a>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.code}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.memId}"/>&nbsp;</td>
					<%-- <td align="center" class="listtd"><c:out value="${result.memPw}"/>&nbsp;</td> --%>
					<td align="center" class="listtd"><c:out value="${result.memNm}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${acceptYn}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updId}"/>&nbsp;</td>
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
	<div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn">
					<span class="btn_blue_l">
						<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
						<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div>
</div>
</form:form>
</body>
</html>
