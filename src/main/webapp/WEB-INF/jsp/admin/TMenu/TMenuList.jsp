<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TMenuList.jsp
  * @Description : TMenu List 화면
  * @Modification Information
  * 
  * @author 안성찬
  * @since 2022-03-31
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
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 수정 화면 function */


function fn_egov_select(menuId) {
    document.getElementById("listForm").menuId.value = menuId;
   	document.getElementById("listForm").action = "<c:url value='/TMenu/updateTMenuView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/TMenu/addTMenuView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/TMenu/TMenuList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="menuId" />
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div>
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
								<th align="center">MemuId</th>
								<th align="center">MenuNm</th>
								<th align="center">UpMenuId</th>
								<th align="center">MenuPath</th>
								<th align="center">OrdSeq</th>
								<th align="center">DisYn</th>
								<th align="center">MenuCont</th>
								<th align="center">RegDt</th>
								<th align="center">Register</th>
							</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
		 				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.menuId}"/>')"><c:out value="${result.menuId}"/></a>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.menuNm}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.upMenuId}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.menuPath}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.ordSeq}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.disYn}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.menuCont}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
								<td align="center" class="listtd"><c:out value="${result.register}"/>&nbsp;</td>
									</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /List -->
	<div id="paging">
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
					<span class="btn_blue_l"><a href="javascript:fn_egov_addView();">등록</a><img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div>
</div>
</form:form>
</body>
</html>
