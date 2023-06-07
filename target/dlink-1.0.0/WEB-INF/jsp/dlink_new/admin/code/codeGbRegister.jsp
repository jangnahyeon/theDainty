<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbCodeGbRegister.jsp
  * @Description : TbCodeGb Register 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<c:set var="registerFlag" value="${empty tbCodeGbVO.gbCd ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="tbCodeGbVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">

$(function(){
	<c:if test="${registerFlag eq '수정'}">
		<c:if test="${tbCodeGbVO.useYn eq 'Y' }">
			$("#useYn_Y").attr("checked", true);
		</c:if>
		<c:if test="${tbCodeGbVO.useYn ne 'Y' }">
			$("#useYn_N").attr("checked", true);
		</c:if>
	</c:if>
});

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbCodeGb/TbCodeGbList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if( !confirm( "삭제하시겠습니까?" ) ) {
		return;
	}
	
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbCodeGb/deleteTbCodeGb.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	var gbCd = $("#gbCd").val();
	if(!gbCd) {
		alert("구분코드를 입력해주세요.");
		$("#gbCd").focus();
		return;
	}
	
	var gbNm = $("#gbNm").val();
	if(!gbNm) {
		alert("구분명을 입력해주세요.");
		$("#gbNm").focus();
		return;
	}
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/admin/tbCodeGb/addTbCodeGb.do' : '/admin/tbCodeGb/updateTbCodeGb.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form modelAttribute="tbCodeGbVO" name="detailForm" id="detailForm" >
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<div id="table">
	<table class="bd_tbl bd_tbl_view">
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<c:if test="${registerFlag == '수정'}">
		</c:if>
		<c:if test="${registerFlag == '등록'}">
		</c:if>		
		<tr>
			<th>구분코드</th>
			<td>
				<form:input path="gbCd" cssClass="txt" maxlength="10"/>
				&nbsp;<form:errors path="gbCd" />
			</td>
		</tr>	
		<tr>
			<th>구분명</th>
			<td>
				<form:input path="gbNm" cssClass="txt" maxlength="20"/>
				&nbsp;<form:errors path="gbNm" />
			</td>
		</tr>	
		<tr>
			<th>사용여부</th>
			<td>
				<%-- <form:input path="useYn" cssClass="txt"/>
				&nbsp;<form:errors path="useYn" /> --%>
				
				<ul class="chk_area">
					<li><input type="radio" name="useYn" value="Y" id="useYn_Y" checked> <label for="useYn_Y">사용</label></li>
					<li><input type="radio" name="useYn" value="N" id="useYn_N"> <label for="useYn_N">미사용</label></li>
				</ul>
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
		</tr> --%>	
	</table>
  </div>
  	<%-- 
	<div id="sysbtn">
		<ul>
			<li>
				<span class="btn_blue_l">
					<a href="javascript:fn_egov_selectList();">목록</a>
					<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
			<li>
				<span class="btn_blue_l">
				<a href="javascript:fn_egov_save();" class="btn_black line_gray"><c:out value='${registerFlag}'/></a>
				<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
			<c:if test="${registerFlag == '수정'}">
				<li>
					<span class="btn_blue_l">
						<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
						<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
					</span>
				</li>
			</c:if>
			<li>
				<span class="btn_blue_l">
					<a href="javascript:document.detailForm.reset();">되돌리기</a>
					<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
		</ul>
	</div>
	 --%>
	
	<div class="bd_btn_area center">
		<!-- <a href="javascript:fn_egov_selectList();" class="btn_black btn_list">목록</a> -->
		<a href="javascript:fn_egov_save();" class="btn_black"><c:out value='${registerFlag}'/></a>
		<c:if test="${registerFlag == '수정'}">
			<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
		</c:if>
		<a href="javascript:fn_egov_selectList();" class="btn_black line_gray">취소</a>
	</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>

