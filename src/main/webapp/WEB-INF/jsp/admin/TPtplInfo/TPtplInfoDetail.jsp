<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TPtplInfoRegister.jsp
  * @Description : TPtplInfo Register 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TPtplInfoVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/TPtplInfo/TPtplInfoList.do'/>";
   	document.getElementById("detailForm").submit();		
}
-->
/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/portfolio/deleteTPtplInfo.do'/>";
   	document.getElementById("detailForm").submit();		
}

</script>


<form:form modelAttribute="searchVO" name="detailForm" id="detailForm" >
	<form:hidden path="ptplNo"/>
	<table class="bd_tbl bd_tbl_view sortable">
		<caption>포트폴리오 상세정보</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<tbody>
		<tr>
			<th>제목</th>
			<td>
				${searchVO.ptplNm }
			</td>
		</tr>
		<tr>
			<th>전문분야</th>
			<td>${searchVO.ptplPartNm }&nbsp;&nbsp;&nbsp;&nbsp;〉&nbsp;${searchVO.ptplYoujaengNm }</td>
		</tr>
		<%-- <tr>
			<th>로고타입</th>
			<td>${codeListPT }</td>
		</tr>
		<tr>
			<th>소분류</th>
			<td>${codeListPS }</td>
		</tr>
		<tr>
			<th>추가분류</th>
			<td>${codeListAP }</td>
		</tr> --%>
		<tr>
			<th>업체명</th>
			<td>
				${searchVO.comNm } <!-- <a href="" class="btn_st st_bg_blue small">회사소개</a> -->
			</td>
		</tr>
		<tr>  
			<th>디자인컨셉</th>
			<td>${searchVO.concept }</td>
		</tr>
		<tr>
			<th>대표이미지</th>
			<td id="" class="">
				<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${searchVO.fileSeq }" alt="" style="width:300px; height:auto; padding:20px"></i>
			</td>
		</tr>
		<tr>
			<th>기타이미지</th>
			<td>
				<ul>
					<li class="dis_inline_b mr10"><i class="" >
					<c:forEach var="imgList" items="${imgList}" varStatus="vs">
					<img src="/imagefile/preview.do?fileSeq=${imgList.fileSeq }" alt="" style="width:300px; height:auto; padding:20px">
					</c:forEach>
					</i></li>
				</ul>
			</td>
		</tr>
		
		</tbody>
	</table>
		
	<div class="bd_btn_area center">
		<a href="javascript:history.back();" class="btn_black">목록</a>
		<!-- <a href="#" class="btn_black line_gray">수정</a> -->
		<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
	</div>

</form:form>


