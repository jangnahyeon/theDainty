<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
<script type="text/javaScript" language="javascript" defer="defer">
// <!--
/* 글 수정 화면 function */


function fn_egov_select(brdSeq) {
    document.getElementById("listForm").brdSeq.value = brdSeq;
   	//document.getElementById("listForm").action = "<c:url value='/front/tbBrd/updateTbBrdView.do'/>";
   	document.getElementById("listForm").action = "<c:url value='/front/brd/brdView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	
	<c:if test="${empty frontLoginVO}">
		fn_login();
		return;
	</c:if>
	
   	//document.getElementById("listForm").action = "<c:url value='/front/tbBrd/addTbBrdView.do'/>";
   	document.getElementById("listForm").action = "<c:url value='/front/brd/brdRegister.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	//document.getElementById("listForm").action = "<c:url value='/front/tbBrd/TbBrdList.do'/>";
	document.getElementById("listForm").action = "<c:url value='/front/brd/brdList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post" onSubmit="fn_egov_link_page(1); return false;">
    <input type="hidden" name="brdSeq" value="0" />
    <input type="hidden" name="menuSeq" value="${param.menuSeq }" />    
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<!-- List -->
	<%-- <div id="table">
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
				<col/>				
			</colgroup>		  
			<tr>
				<th align="center">BrdSeq</th>
				<th align="center">MenuSeq</th>
				<th align="center">MemSeq</th>
				<th align="center">MemId</th>
				<th align="center">Title</th>
				<th align="center">Cont</th>
				<th align="center">RegDt</th>
				<th align="center">RegId</th>
				<th align="center">UpdDt</th>
				<th align="center">UpdId</th>
			</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
	 				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.brdSeq}"/>')"><c:out value="${result.brdSeq}"/></a>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.menuSeq}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.memSeq}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.memId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.title}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.cont}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updId}"/>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div> --%>
	<!-- /List -->
	
	<!-- 컨텐츠 영역 -->
	<div class="contents">			
		<div class="innerwrap">	
			
			<h3>공지사항</h3>
			<div class="bd_top_style">
				<div class="area_left">
					<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount }</span>건 <strong><em>${paginationInfo.currentPageNo }</em>/<span>${paginationInfo.totalPageCount }</span>페이지</strong></p>
				</div>
				
				<fieldset class="bd_sel_search">
					<legend>검색</legend>
					<label for="sear_" class="focus_tit" style="">검색어를 입력하세요</label>
					<input type="hidden" name="searchCondition" value="title" />
					<input type="text" id="sear_" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" maxlength="20">
					<input type="button" value="검색" onclick="fn_egov_link_page(1);">
				</fieldset>
<%-- 				<fieldset class="bd_sel_search">
					<legend>검색</legend>
					<label for="sear_" class="focus_tit" style="">검색어를 입력하세요</label>
					<input type="hidden" name="searchCondition" value="title" />
					<input type="text" id="sear_" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" maxlength="20">
					<input type="button" value="검색" onclick="fn_egov_link_page(1);">
				</fieldset>	 --%>
			</div>
			
			<div class="list_board">
				<div class="list_head">
					<span class="bd_num">구분</span>
					<span class="bd_title">제목</span>
					<span class="bd_date "><a href="/">작성일</a></span>
					<span class="bd_hit "><a href="/">조회</a></span>
				</div>
				<ul class="list_body">
					<!-- <li class="list_item">
						<div class="bd_num"><span class="bg_blue">공지사항</span></div>
						<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b></a></div>
						<div class="bd_date ">11.01</div>
						<div class="bd_hit ">140</div>
					</li>
					<li class="list_item">
						<div class="bd_num"><span class="bg_blue_green">유관기관1</span></div>
						<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
						<div class="bd_date ">11.01</div>
						<div class="bd_hit ">140</div>
					</li>
					<li class="list_item">
						<div class="bd_num"><span class="bg_blue">공지사항</span></div>
						<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon reply">38</em></a></div>덧글이 있는 경우
						<div class="bd_date ">11.01</div>
						<div class="bd_hit ">140</div>
					</li> -->
					
					<c:if test="${empty resultList }">
						<li class="list_item center"><div>등록된 글이 없습니다.</div></li>
					</c:if>
					
					<c:forEach var="result" items="${resultList }">
						<li class="list_item">
						<div class="bd_num">
							<c:choose>
								<c:when test="${fn:contains(result.srcNm, '공지사항') }">
									<span class="bg_blue">${result.srcNm }</span>
								</c:when>
								<c:otherwise>
									<span class="bg_blue_green">${result.srcNm }</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="bd_title">
							<a href="javascript:fn_egov_select('<c:out value="${result.brdSeq}"/>');" class="item_tit">
								<b>${result.title }</b>
								<c:if test="${not empty result.brdFileVOList }">
									<em class="wicon file">(파일포함)</em>
								</c:if>
								
								<c:if test="${result.brdCmtCnt > 0 }">
									<em class="wicon reply">${result.brdCmtCnt }</em>
								</c:if>
							</a>
						</div>
						<div class="bd_date ">
<%-- 							<fmt:formatDate value="${result.regDt }" pattern="yyyy.MM.dd HH:mm:ss" />
							<fmt:formatDate value="${result.regDt }" pattern="MM.dd" /> --%>
							${result.regDt }
						</div>
						<div class="bd_hit ">${result.readCnt }</div>
					</li>
					</c:forEach>
					
				</ul>
				<div class="clearfix"></div>
			</div>
			
			<!-- <div class="pagination">
				<a href="#" class="direction first">처음 페이지로</a>
				<a href="#" class="direction prev">이전 페이지로</a>
				<strong>1</strong>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">7</a>
				<a href="#">8</a>
				<a href="#">9</a>
				<a href="#">10</a>
				<a href="#" class="direction next">다음 페이지로</a>
				<a href="#" class="direction last">마지막 페이지로</a>
			</div> -->
			
			<div id="paging" class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}"
						   type="image"
						   jsFunction="fn_egov_link_page"
						   />
				<form:hidden path="pageIndex" />
			</div>
			
			<!-- <div class="bd_btn_area center">
				<a href="javascript:fn_egov_addView();" onclick="" class="btn_black icon_write">글쓰기</a>
			</div> -->
			
			<div class="pop_modal_bg"></div>
			
		</div>
	</div>
	<!-- //컨텐츠 영역 -->
	
	<%-- <div id="paging">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div> --%>
	<%-- <div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn">
					<span class="btn_blue_l"><a href="javascript:fn_egov_addView();">등록</a><img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div> --%>
</div>
</form:form>
</body>
</html>
