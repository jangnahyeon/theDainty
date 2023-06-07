<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MtsAtalkMsgList.jsp
  * @Description : MtsAtalkMsg List 화면
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

<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 수정 화면 function */


function fn_egov_select(tranPr) {
    document.getElementById("listForm").tranPr.value = tranPr;
   	document.getElementById("listForm").action = "<c:url value='/mtsAtalkMsg/updateMtsAtalkMsgView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/mtsAtalkMsg/addMtsAtalkMsgView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/mtsAtalkMsg/MtsAtalkMsgList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
 
 /* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/mtsAtalkMsg/MtsAtalkMsgList.do'/>";
   	document.getElementById("listForm").submit();
}


function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/mtsAtalkMsg/MtsAtalkMsgList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>


<form:form name="searchForm" id="searchForm" method="post" action="/front/mtsAtalkMsg/MtsAtalkMsgList.do">
	
</form:form>


<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="tranPr" />
    
	<div class="wrap_content">
			<div class="con_title">
				<h3><i>알림센터</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>					
					<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
						<li><a href="#">알림센터</a></li>
				</ul>
			</div>
			
			<div class="contents">
				<div class="tab_device">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" class="on">알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=agency">관심정보</a></li>
						<%if(("MG0003").equals(loginVO.getUserType())){ %>   <!-- 관리자는 상담관리 이용 불가능 -->
										
						<%} else {%>
							<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
						<%} %>
						<%if(("MG0001").equals(loginVO.getUserType())){ %>
							<li><a href="/front/privacy/infoInquiry.do">개인정보관리</a></li>
						<%} else {%>
							<li><a href="/front/proAgency/infoMagmt.do">기업정보관리</a></li>
						<% } %>
						
					</ul>
				</div>
				
				<section class="tab_content">
					<!-- 알림센터 -->
					<div class="bd_top_style">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.recordCountPerPage}</span>페이지</strong></p>
						
							<div class="area_right">
								<!-- <div class="area_calendar">
									<input type="text" title="검색조건 시작일입력"><a href="#">달력</a> <span>~</span>
									<input type="text" title="검색조건 종료일입력"><a href="#">달력</a>
								</div> -->
								<div class="area_select">
									<div class="selectbox">
										<label for="standard">검색조건</label>
											
										<form:select path="searchCondition" id="standard">
											<form:option value="0">검색조건선택</form:option>
											<form:option value="1">수신자</form:option>
											<form:option value="2">메세지</form:option>
										</form:select>
									</div>
									<!-- <input type="button" value="선택"> -->
								</div>
							</div>
						</div>
						
						<fieldset class="bd_sel_search">
							<legend>검색</legend>
							<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
							<input type="text" id="sear_" />
							<input type="button" onclick="go_search();"  value="검색" />
						</fieldset>		
						
					</div>
					
					
					<table class="tbl_basic center bd_type02">
						<caption>등록된 질문 리스트</caption>
						<colgroup>
							<col width="7%">
							<col>
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>메시지</th>
								<th>수신자</th>
								<th>핸드폰번호</th>
								<th>발신일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="vs">
								<tr>
									<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
									<td>${result.tranMsg}</td>
									<td>${result.tranPhone}</td>
									<td>${result.tranCallback}</td>
									<td>${result.tranDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						
					<div class="pagination" id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}"
							   type="image"
							   jsFunction="fn_egov_link_page"
							   />
						<form:hidden path="pageIndex" />
					</div>
						
			</section>
		</div>	
	</div>
</form:form>

