<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulRsvRegister.jsp
  * @Description : TbSisulRsv Register 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-21
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

<c:set var="registerFlag" value="${empty tbSisulRsvVO.rsvSeq || 0 eq tbSisulRsvVO.rsvSeq ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="tbSisulRsvVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbSisulRsv/TbSisulRsvList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbSisulRsv/deleteTbSisulRsv.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/admin/tbSisulRsv/addTbSisulRsv.do' : '/admin/tbSisulRsv/updateTbSisulRsv.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form modelAttribute="tbSisulRsvVO" name="detailForm" id="detailForm" >
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><%-- <img src="<c:url value='/images//title_dot.gif'/>" alt="" /> --%><c:out value="${registerFlag}"/></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<div id="table">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" >
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<c:if test="${registerFlag == '수정'}">
		</c:if>
		<c:if test="${registerFlag == '등록'}">
		</c:if>		
		<%-- <tr>
			<th>RSV_SEQ</th>
			<td>
				<form:input path="rsvSeq" cssClass="txt"/>
				&nbsp;<form:errors path="rsvSeq" />
			</td>
		</tr>	 --%>
		<tr>
			<th>SISUL_SEQ</th>
			<td>
				<form:input path="sisulSeq" cssClass="txt"/>
				&nbsp;<form:errors path="sisulSeq" />
			</td>
		</tr>	
		<tr>
			<th>MEM_SEQ</th>
			<td>
				<form:input path="memSeq" cssClass="txt"/>
				&nbsp;<form:errors path="memSeq" />
			</td>
		</tr>	
		<tr>
			<th>MEM_ID</th>
			<td>
				<form:input path="memId" cssClass="txt"/>
				&nbsp;<form:errors path="memId" />
			</td>
		</tr>	
		<tr>
			<th>TITLE</th>
			<td>
				<form:input path="title" cssClass="txt"/>
				&nbsp;<form:errors path="title" />
			</td>
		</tr>	
		<tr>
			<th>RSV_YEAR</th>
			<td>
				<form:input path="rsvYear" cssClass="txt"/>
				&nbsp;<form:errors path="rsvYear" />
			</td>
		</tr>	
		<tr>
			<th>RSV_MONTH</th>
			<td>
				<form:input path="rsvMonth" cssClass="txt"/>
				&nbsp;<form:errors path="rsvMonth" />
			</td>
		</tr>	
		<tr>
			<th>RSV_DAY</th>
			<td>
				<form:input path="rsvDay" cssClass="txt"/>
				&nbsp;<form:errors path="rsvDay" />
			</td>
		</tr>	
		<tr>
			<th>RSV_ST</th>
			<td>
				<form:input path="rsvSt" cssClass="txt"/>
				&nbsp;<form:errors path="rsvSt" />
			</td>
		</tr>	
		<tr>
			<th>RSV_ET</th>
			<td>
				<form:input path="rsvEt" cssClass="txt"/>
				&nbsp;<form:errors path="rsvEt" />
			</td>
		</tr>	
		<tr>
			<th>PROD_CNT</th>
			<td>
				<form:input path="prodCnt" cssClass="txt"/>
				&nbsp;<form:errors path="prodCnt" />
			</td>
		</tr>	
		<tr>
			<th>PROD_1</th>
			<td>
				<form:input path="prod1" cssClass="txt"/>
				&nbsp;<form:errors path="prod1" />
			</td>
		</tr>	
		<tr>
			<th>PROD_2</th>
			<td>
				<form:input path="prod2" cssClass="txt"/>
				&nbsp;<form:errors path="prod2" />
			</td>
		</tr>	
		<tr>
			<th>PROD_SIZE_CD</th>
			<td>
				<form:input path="prodSizeCd" cssClass="txt"/>
				&nbsp;<form:errors path="prodSizeCd" />
			</td>
		</tr>	
		<tr>
			<th>PROD_REF_CD</th>
			<td>
				<form:input path="prodRefCd" cssClass="txt"/>
				&nbsp;<form:errors path="prodRefCd" />
			</td>
		</tr>	
		<tr>
			<th>PURPOSE_CD</th>
			<td>
				<form:input path="purposeCd" cssClass="txt"/>
				&nbsp;<form:errors path="purposeCd" />
			</td>
		</tr>	
		<tr>
			<th>PWD</th>
			<td>
				<form:input path="pwd" cssClass="txt"/>
				&nbsp;<form:errors path="pwd" />
			</td>
		</tr>	
		<tr>
			<th>FILE_SEQ</th>
			<td>
				<form:input path="fileSeq" cssClass="txt"/>
				&nbsp;<form:errors path="fileSeq" />
			</td>
		</tr>	
		<tr>
			<th>ACCEPT_YN</th>
			<td>
				<form:input path="acceptYn" cssClass="txt"/>
				&nbsp;<form:errors path="acceptYn" />
			</td>
		</tr>	
		<%-- <tr>
			<th>REG_DT</th>
			<td>
				<form:input path="regDt" cssClass="txt"/>
				&nbsp;<form:errors path="regDt" />
			</td>
		</tr>	
		<tr>
			<th>REG_ID</th>
			<td>
				<form:input path="regId" cssClass="txt"/>
				&nbsp;<form:errors path="regId" />
			</td>
		</tr>	
		<tr>
			<th>UPD_DT</th>
			<td>
				<form:input path="updDt" cssClass="txt"/>
				&nbsp;<form:errors path="updDt" />
			</td>
		</tr>	
		<tr>
			<th>UPD_ID</th>
			<td>
				<form:input path="updId" cssClass="txt"/>
				&nbsp;<form:errors path="updId" />
			</td>
		</tr>	 --%>
	</table>
  </div>
	<div id="sysbtn">
		<ul>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_selectList();">List</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_save();"><c:out value='${registerFlag}'/></a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<c:if test="${registerFlag == '수정'}">
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_delete();">삭제</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			</c:if>
			<li><span class="btn_blue_l"><a href="javascript:document.detailForm.reset();">Reset</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li></ul>
	</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>

