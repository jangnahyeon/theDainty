<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TMemAccptRegister.jsp
  * @Description : TMemAccpt Register 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-03-30
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

<c:set var="registerFlag" value="${empty TMemAccptVO.loginId ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TMemAccptVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/TMemAccpt/TMemAccptList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/TMemAccpt/deleteTMemAccpt.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/TMemAccpt/addTMemAccpt.do' : '/TMemAccpt/updateTMemAccpt.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form commandName="TMemAccptVO" name="detailForm" id="detailForm" >
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
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
		<tr>
			<th>LOGIN_ID</th>
			<td>
				<form:input path="loginId" cssClass="txt"/>
				&nbsp;<form:errors path="loginId" />
			</td>
		</tr>	
		<tr>
			<th>LOGIN_PWD</th>
			<td>
				<form:input path="loginPwd" cssClass="txt"/>
				&nbsp;<form:errors path="loginPwd" />
			</td>
		</tr>	
		<tr>
			<th>USER_TYPE</th>
			<td>
				<form:input path="userType" cssClass="txt"/>
				&nbsp;<form:errors path="userType" />
			</td>
		</tr>	
		<tr>
			<th>MEM_DT</th>
			<td>
				<form:input path="memDt" cssClass="txt"/>
				&nbsp;<form:errors path="memDt" />
			</td>
		</tr>	
		<tr>
			<th>PWD_CHG_DT</th>
			<td>
				<form:input path="pwdChgDt" cssClass="txt"/>
				&nbsp;<form:errors path="pwdChgDt" />
			</td>
		</tr>	
		<tr>
			<th>NEXT_CHG_DT</th>
			<td>
				<form:input path="nextChgDt" cssClass="txt"/>
				&nbsp;<form:errors path="nextChgDt" />
			</td>
		</tr>	
		<tr>
			<th>SMS_YN</th>
			<td>
				<form:input path="smsYn" cssClass="txt"/>
				&nbsp;<form:errors path="smsYn" />
			</td>
		</tr>	
		<tr>
			<th>MAIL_YN</th>
			<td>
				<form:input path="mailYn" cssClass="txt"/>
				&nbsp;<form:errors path="mailYn" />
			</td>
		</tr>	
		<tr>
			<th>OUT_DT</th>
			<td>
				<form:input path="outDt" cssClass="txt"/>
				&nbsp;<form:errors path="outDt" />
			</td>
		</tr>	
		<tr>
			<th>REG_DT</th>
			<td>
				<form:input path="regDt" cssClass="txt"/>
				&nbsp;<form:errors path="regDt" />
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
			<th>UPDATER</th>
			<td>
				<form:input path="updater" cssClass="txt"/>
				&nbsp;<form:errors path="updater" />
			</td>
		</tr>	
		<tr>
			<th>REGISTER</th>
			<td>
				<form:input path="register" cssClass="txt"/>
				&nbsp;<form:errors path="register" />
			</td>
		</tr>	
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

