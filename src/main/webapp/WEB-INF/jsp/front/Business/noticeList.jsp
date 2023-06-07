<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyList.jsp
  * @Description : TCommuty List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javaScript" language="javascript" defer="defer">

/*글 view 화면 function */
function fn_egov_view(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/front/business/viewCommuty.do'/>";
   	document.getElementById("listForm").submit();
}


/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/business/noticeList.do?menu_id=gongji'/>";
   	document.getElementById("listForm").submit();
}


function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/business/noticeList.do?menu_id=gongji'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/front/business/noticeList.do?menu_id=gongji">
	
</form:form>

	<!-- container_wrap -->
	<div id="wrap_container">

		<div class="wrap_content">


					
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="registerFlag" id="registerFlag" />
		    <input type="hidden" id="menuId" name="menuId" value="${menuId}"/> 
			<input type="hidden" id="postNo" name="postNo" />
			<input type="hidden" id="seq" name="seq" />
				
				<!-- 타이틀 시작 -->
			<div class="con_title">
				<h3><i>공지사항</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
					<li><a href="#">공지사항</a></li>
				</ul>				
			</div>
			<!-- 타이틀 끝 -->
			
			
			<!-- contents s -->	
				<div class="contents">
					<!-- 컨텐츠 영역 s -->
					
					<div class="bd_top_style">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.recordCountPerPage}</span>페이지</strong></p>
						
								<div class="area_right">
										
									<div class="area_select">
										<div class="selectbox">
											<label for="standard">검색조건</label>
											
											<form:select path="searchCondition" id="standard">
												<form:option value="0">전체</form:option>
												<form:option value="1">제목</form:option>
												<%-- <form:option value="2">이름</form:option> --%>
											</form:select>
											
										</div>
									</div>
								</div>
							</div>
						
						
						<fieldset class="bd_sel_search">
							<legend>검색</legend>
							<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
							<input type="text" id="sear_">
							<input type="button" onclick="go_search();"  value="검색">
						</fieldset>		
					</div>	
				

					<table class="tbl_basic center bd_type01">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="10%">
								<col width="50%">								
								<col width="10%">
								<col width="15%">
								<col width="15%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">제목</th>
									<th scope="col" class="">작성자</th>
									<th scope="col" class="">첨부</th>
									<th scope="col" class="">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<tr onclick="javascript:fn_egov_view('${result.menuId}','${result.postNo}','${result.seq}', 'view');" > 
										<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
										<td>${result.title}</td>
										<td>${result.register}</td>
										<td>
											<c:choose>
												<c:when test="${result.fileSeq eq '0' || result.fileSeq eq null}">
													
												</c:when>
												<c:otherwise>
													<a class="icon_file">"첨부파일"</a>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${result.regDt}</td>
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
						
			</div>
		</form:form>
	</div>
</div>
