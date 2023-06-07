<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MtsAtalkMsgRegister.jsp
  * @Description : MtsAtalkMsg Register 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-04-07
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

<c:set var="registerFlag" value="${empty mtsAtalkMsgVO.tranPr ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="mtsAtalkMsgVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/mtsAtalkMsg/MtsAtalkMsgList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/mtsAtalkMsg/deleteMtsAtalkMsg.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/mtsAtalkMsg/addMtsAtalkMsg.do' : '/mtsAtalkMsg/updateMtsAtalkMsg.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form commandName="mtsAtalkMsgVO" name="detailForm" id="detailForm" >
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
			<th>TRAN_PR</th>
			<td>
				<form:input path="tranPr" cssClass="txt"/>
				&nbsp;<form:errors path="tranPr" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REFKEY</th>
			<td>
				<form:input path="tranRefkey" cssClass="txt"/>
				&nbsp;<form:errors path="tranRefkey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ID</th>
			<td>
				<form:input path="tranId" cssClass="txt"/>
				&nbsp;<form:errors path="tranId" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDER_KEY</th>
			<td>
				<form:input path="tranSenderKey" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenderKey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TMPL_CD</th>
			<td>
				<form:input path="tranTmplCd" cssClass="txt"/>
				&nbsp;<form:errors path="tranTmplCd" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_BUTTON</th>
			<td>
				<form:input path="tranButton" cssClass="txt"/>
				&nbsp;<form:errors path="tranButton" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PHONE</th>
			<td>
				<form:input path="tranPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranPhone" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_MSG</th>
			<td>
				<form:input path="tranMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_DATE</th>
			<td>
				<form:input path="tranDate" cssClass="txt"/>
				&nbsp;<form:errors path="tranDate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TYPE</th>
			<td>
				<form:input path="tranType" cssClass="txt"/>
				&nbsp;<form:errors path="tranType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_STATUS</th>
			<td>
				<form:input path="tranStatus" cssClass="txt"/>
				&nbsp;<form:errors path="tranStatus" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDDATE</th>
			<td>
				<form:input path="tranSenddate" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenddate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPORTDATE</th>
			<td>
				<form:input path="tranReportdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranReportdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLTDATE</th>
			<td>
				<form:input path="tranRsltdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranRsltdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLT</th>
			<td>
				<form:input path="tranRslt" cssClass="txt"/>
				&nbsp;<form:errors path="tranRslt" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_MSG</th>
			<td>
				<form:input path="tranReplaceMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SUBJECT</th>
			<td>
				<form:input path="tranSubject" cssClass="txt"/>
				&nbsp;<form:errors path="tranSubject" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_CALLBACK</th>
			<td>
				<form:input path="tranCallback" cssClass="txt"/>
				&nbsp;<form:errors path="tranCallback" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_TYPE</th>
			<td>
				<form:input path="tranReplaceType" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC1</th>
			<td>
				<form:input path="tranEtc1" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc1" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC2</th>
			<td>
				<form:input path="tranEtc2" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc2" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC3</th>
			<td>
				<form:input path="tranEtc3" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc3" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC4</th>
			<td>
				<form:input path="tranEtc4" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc4" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_END_TELCO</th>
			<td>
				<form:input path="tranEndTelco" cssClass="txt"/>
				&nbsp;<form:errors path="tranEndTelco" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_LOG</th>
			<td>
				<form:input path="tranLog" cssClass="txt"/>
				&nbsp;<form:errors path="tranLog" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_GRPSEQ</th>
			<td>
				<form:input path="tranGrpseq" cssClass="txt"/>
				&nbsp;<form:errors path="tranGrpseq" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TITLE</th>
			<td>
				<form:input path="tranTitle" cssClass="txt"/>
				&nbsp;<form:errors path="tranTitle" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_NATION_PHONE</th>
			<td>
				<form:input path="tranNationPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranNationPhone" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PR</th>
			<td>
				<form:input path="tranPr" cssClass="txt"/>
				&nbsp;<form:errors path="tranPr" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REFKEY</th>
			<td>
				<form:input path="tranRefkey" cssClass="txt"/>
				&nbsp;<form:errors path="tranRefkey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ID</th>
			<td>
				<form:input path="tranId" cssClass="txt"/>
				&nbsp;<form:errors path="tranId" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDER_KEY</th>
			<td>
				<form:input path="tranSenderKey" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenderKey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TMPL_CD</th>
			<td>
				<form:input path="tranTmplCd" cssClass="txt"/>
				&nbsp;<form:errors path="tranTmplCd" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_BUTTON</th>
			<td>
				<form:input path="tranButton" cssClass="txt"/>
				&nbsp;<form:errors path="tranButton" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PHONE</th>
			<td>
				<form:input path="tranPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranPhone" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_MSG</th>
			<td>
				<form:input path="tranMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_DATE</th>
			<td>
				<form:input path="tranDate" cssClass="txt"/>
				&nbsp;<form:errors path="tranDate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TYPE</th>
			<td>
				<form:input path="tranType" cssClass="txt"/>
				&nbsp;<form:errors path="tranType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_STATUS</th>
			<td>
				<form:input path="tranStatus" cssClass="txt"/>
				&nbsp;<form:errors path="tranStatus" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDDATE</th>
			<td>
				<form:input path="tranSenddate" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenddate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPORTDATE</th>
			<td>
				<form:input path="tranReportdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranReportdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLTDATE</th>
			<td>
				<form:input path="tranRsltdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranRsltdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLT</th>
			<td>
				<form:input path="tranRslt" cssClass="txt"/>
				&nbsp;<form:errors path="tranRslt" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_MSG</th>
			<td>
				<form:input path="tranReplaceMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SUBJECT</th>
			<td>
				<form:input path="tranSubject" cssClass="txt"/>
				&nbsp;<form:errors path="tranSubject" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_CALLBACK</th>
			<td>
				<form:input path="tranCallback" cssClass="txt"/>
				&nbsp;<form:errors path="tranCallback" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_TYPE</th>
			<td>
				<form:input path="tranReplaceType" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC1</th>
			<td>
				<form:input path="tranEtc1" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc1" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC2</th>
			<td>
				<form:input path="tranEtc2" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc2" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC3</th>
			<td>
				<form:input path="tranEtc3" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc3" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC4</th>
			<td>
				<form:input path="tranEtc4" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc4" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_END_TELCO</th>
			<td>
				<form:input path="tranEndTelco" cssClass="txt"/>
				&nbsp;<form:errors path="tranEndTelco" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_LOG</th>
			<td>
				<form:input path="tranLog" cssClass="txt"/>
				&nbsp;<form:errors path="tranLog" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_GRPSEQ</th>
			<td>
				<form:input path="tranGrpseq" cssClass="txt"/>
				&nbsp;<form:errors path="tranGrpseq" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TITLE</th>
			<td>
				<form:input path="tranTitle" cssClass="txt"/>
				&nbsp;<form:errors path="tranTitle" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_NATION_PHONE</th>
			<td>
				<form:input path="tranNationPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranNationPhone" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_CURRENCY</th>
			<td>
				<form:input path="tranCurrency" cssClass="txt"/>
				&nbsp;<form:errors path="tranCurrency" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PRICE</th>
			<td>
				<form:input path="tranPrice" cssClass="txt"/>
				&nbsp;<form:errors path="tranPrice" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SUPPLEMENT</th>
			<td>
				<form:input path="tranSupplement" cssClass="txt"/>
				&nbsp;<form:errors path="tranSupplement" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PR</th>
			<td>
				<form:input path="tranPr" cssClass="txt"/>
				&nbsp;<form:errors path="tranPr" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REFKEY</th>
			<td>
				<form:input path="tranRefkey" cssClass="txt"/>
				&nbsp;<form:errors path="tranRefkey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ID</th>
			<td>
				<form:input path="tranId" cssClass="txt"/>
				&nbsp;<form:errors path="tranId" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDER_KEY</th>
			<td>
				<form:input path="tranSenderKey" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenderKey" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TMPL_CD</th>
			<td>
				<form:input path="tranTmplCd" cssClass="txt"/>
				&nbsp;<form:errors path="tranTmplCd" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_BUTTON</th>
			<td>
				<form:input path="tranButton" cssClass="txt"/>
				&nbsp;<form:errors path="tranButton" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_PHONE</th>
			<td>
				<form:input path="tranPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranPhone" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_MSG</th>
			<td>
				<form:input path="tranMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_DATE</th>
			<td>
				<form:input path="tranDate" cssClass="txt"/>
				&nbsp;<form:errors path="tranDate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TYPE</th>
			<td>
				<form:input path="tranType" cssClass="txt"/>
				&nbsp;<form:errors path="tranType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_STATUS</th>
			<td>
				<form:input path="tranStatus" cssClass="txt"/>
				&nbsp;<form:errors path="tranStatus" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SENDDATE</th>
			<td>
				<form:input path="tranSenddate" cssClass="txt"/>
				&nbsp;<form:errors path="tranSenddate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPORTDATE</th>
			<td>
				<form:input path="tranReportdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranReportdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLTDATE</th>
			<td>
				<form:input path="tranRsltdate" cssClass="txt"/>
				&nbsp;<form:errors path="tranRsltdate" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_RSLT</th>
			<td>
				<form:input path="tranRslt" cssClass="txt"/>
				&nbsp;<form:errors path="tranRslt" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_MSG</th>
			<td>
				<form:input path="tranReplaceMsg" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceMsg" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_SUBJECT</th>
			<td>
				<form:input path="tranSubject" cssClass="txt"/>
				&nbsp;<form:errors path="tranSubject" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_CALLBACK</th>
			<td>
				<form:input path="tranCallback" cssClass="txt"/>
				&nbsp;<form:errors path="tranCallback" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_REPLACE_TYPE</th>
			<td>
				<form:input path="tranReplaceType" cssClass="txt"/>
				&nbsp;<form:errors path="tranReplaceType" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC1</th>
			<td>
				<form:input path="tranEtc1" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc1" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC2</th>
			<td>
				<form:input path="tranEtc2" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc2" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC3</th>
			<td>
				<form:input path="tranEtc3" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc3" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_ETC4</th>
			<td>
				<form:input path="tranEtc4" cssClass="txt"/>
				&nbsp;<form:errors path="tranEtc4" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_END_TELCO</th>
			<td>
				<form:input path="tranEndTelco" cssClass="txt"/>
				&nbsp;<form:errors path="tranEndTelco" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_LOG</th>
			<td>
				<form:input path="tranLog" cssClass="txt"/>
				&nbsp;<form:errors path="tranLog" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_GRPSEQ</th>
			<td>
				<form:input path="tranGrpseq" cssClass="txt"/>
				&nbsp;<form:errors path="tranGrpseq" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_TITLE</th>
			<td>
				<form:input path="tranTitle" cssClass="txt"/>
				&nbsp;<form:errors path="tranTitle" />
			</td>
		</tr>	
		<tr>
			<th>TRAN_NATION_PHONE</th>
			<td>
				<form:input path="tranNationPhone" cssClass="txt"/>
				&nbsp;<form:errors path="tranNationPhone" />
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

