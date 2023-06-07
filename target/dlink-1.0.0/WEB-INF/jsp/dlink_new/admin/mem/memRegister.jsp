<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbMemRegister.jsp
  * @Description : TbMem Register 화면
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
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->

<c:set var="registerFlag" value="${empty tbMemVO.memSeq || 0 eq tbMemVO.memSeq ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="tbMemVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">

$(function(){
	<c:if test="${registerFlag eq '수정'}">		
		$("#acceptYn_${tbMemVO.acceptYn }").attr( "checked", true );
	</c:if>
});


// <!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbMem/TbMemList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if( !confirm( "삭제하시겠습니까?" ) ) {
		return;
	}
	
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbMem/deleteTbMem.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/admin/tbMem/addTbMem.do' : '/admin/tbMem/updateTbMem.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form modelAttribute="tbMemVO" name="detailForm" id="detailForm" >
	<%-- <input type="hidden" name="memSeq" value="${empty param.memSeq ? 0 : param.memSeq }"/> --%>
	<input type="hidden" name="comFileSeq" id="comFileSeq" value="${tbMemVO.comFileSeq }"/>
	<input type="hidden" name="smBizFileSeq" id="smBizFileSeq" value="${tbMemVO.smBizFileSeq }" />
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<div id="table">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" >
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<%-- <c:if test="${registerFlag == '수정'}">
		</c:if>
		<c:if test="${registerFlag == '등록'}">
		</c:if>	 --%>	
		<c:if test="${registerFlag == '수정'}">
			<tr>
				<th>회원번호</th>
				<td>
					<form:input path="memSeq" cssClass="txt" readonly="true"/>
					&nbsp;<form:errors path="memSeq" />
				</td>
			</tr>	
		</c:if>
		<tr>
			<th>회원구분</th>
			<td>
				<form:input path="code" cssClass="txt" value="${param.code }" readonly="true"/>
				&nbsp;<form:errors path="code" />
			</td>
		</tr>	
		<tr>
			<th>회원ID</th>
			<td>
				<form:input path="memId" cssClass="txt" readonly="${registerFlag == '수정' ? true : false}"/>
				&nbsp;<form:errors path="memId" />
			</td>
		</tr>	
		<tr>
			<th>회원PW</th>
			<td>
				<form:password path="memPw" cssClass="txt"/>
				&nbsp;<form:errors path="memPw" />
			</td>
		</tr>	
		<tr>
			<th>이름</th>
			<td>
				<form:input path="memNm" cssClass="txt"/>
				&nbsp;<form:errors path="memNm" />
			</td>
		</tr>	
		<tr>
			<th>생년월일</th>
			<td>
				<form:input path="birth" cssClass="txt"/>
				&nbsp;<form:errors path="birth" />
			</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>
				<form:input path="hp" cssClass="txt"/>
				&nbsp;<form:errors path="hp" />
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<form:input path="email" cssClass="txt"/>
				&nbsp;<form:errors path="email" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<form:input path="addr" cssClass="txt"/>
				&nbsp;<form:errors path="addr" />
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>
				<form:input path="addrDtl" cssClass="txt"/>
				&nbsp;<form:errors path="addrDtl" />
			</td>
		</tr>
		<tr>
			<th>사업자등록증</th>
			<td>
				<input type="text" id="comFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." value="${comFileVO.fileNm }">
			</td>
		</tr>
		<tr>
			<th>중소상공인확인서</th>
			<td>
				<input type="text" id="smBizFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." value="${smBizFileVO.fileNm }">
			</td>
		</tr>
		<tr>
			<th>회원탈퇴이유</th>
			<td>
				<form:input path="outReason" cssClass="txt" readonly="true"/>
				&nbsp;<form:errors path="outReason" />
			</td>
		</tr>
		<tr>
			<th>남기고 싶은 말</th>
			<td>
				<form:textarea path="leaveMsg" cssClass="txt" readonly="true"/>
				&nbsp;<form:errors path="leaveMsg" />
			</td>
		</tr>
		<tr>
			<th>승인결과</th>
			<td>
				<%-- <form:input path="useYn" cssClass="txt"/>
				&nbsp;<form:errors path="useYn" /> --%>
				
				<ul class="chk_area">
					<li><input type="radio" name="acceptYn" value="Y" id="acceptYn_Y" checked> <label for="acceptYn_Y">승인</label></li>
					<li><input type="radio" name="acceptYn" value="N" id="acceptYn_N"> <label for="acceptYn_N">반려</label></li>
					<li><input type="radio" name="acceptYn" value="O" id="acceptYn_O"> <label for="acceptYn_O">탈퇴</label></li>
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
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>

