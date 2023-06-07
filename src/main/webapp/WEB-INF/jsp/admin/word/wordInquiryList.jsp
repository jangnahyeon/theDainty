<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TWordList.jsp
  * @Description : TWord List 화면
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

<script type="text/javaScript" type="text/javascript" defer="defer">

/* 글 수정 화면 function */
function fn_egov_select(wordNo,registerFlag) {
    document.getElementById("listForm").wordNo.value = wordNo;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/word/updateWordView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 view 화면 function */
function fn_egov_view(wordNo,registerFlag) {
    document.getElementById("listForm").wordNo.value = wordNo;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/word/viewWord.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.getElementById("listForm").registerFlag.value = "insert";
   	document.getElementById("listForm").action = "<c:url value='/admin/word/addWordView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete(wordNo) {
	
	if(confirm("정말 삭제하시겠습니까?")) {
		var wordNo =  document.getElementById("listForm").wordNo.value = wordNo;
		
		
		 var data = $("#listForm").serialize();
		  
			$.ajax({
			    type: "POST",
			    url: "/admin/word/deleteWord.do",
			    data : data,
			    dataType: "text",
			    success: function(rst){
			        if(rst != null){
			        	if(rst == "suc"){
			        		alert("삭제 되었습니다.");
			        		$("#searchForm").submit();
			        	}else{
			        		alert( "삭제에 실패했습니다. \n  관리자에게 문의바랍니다.");
			        		$("#searchForm").submit();
			        	}
			        }
			    },
			    error:function(){
			        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
			    }
			});
	}		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/word/wordInquiryList.do'/>";
   	document.getElementById("listForm").submit();
}

 
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/word/wordInquiryList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>

			<!-- 컨텐츠 영역 s -->
					
					
			<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
				<input type="hidden" name="wordNo" id="wordNo" />
				<input type="hidden" name="registerFlag" id="registerFlag" />
				<!-- <input type="hidden" name="searchCondition" id="searchCondition" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" /> -->
				
					
					<!-- // 타이틀 -->
					<!-- List -->
					<div class="bd_top_type01">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
						</div>
						
						<div class="fr">
							<fieldset class="search_form">
								<legend>검색</legend>

								<div class="sel_box">										
									<label for="sel_area">검색조건</label>
									<div>
										<form:select path="searchCondition" id="sel_area">
											<form:option value="0">전체</form:option>
											<form:option value="1">용어</form:option>
											<form:option value="2">설명</form:option>
										</form:select>
									</div>
								</div>

								<div class="bd_sel_search">
									<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_word" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
									<input type="text" id="sear_word">
									<input type="button" onclick="go_search();"  value="검색">
								</div>
							</fieldset>
						</div>			
					</div>
					
					
						<table class="bd_tbl bd_biz center">
							<caption>용어관리 목록</caption>
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col>
								<col width="10%">
								<c:if test="${registerFlag == 'insert'}">
									<%-- <col width="10%"> --%>
									<col width="10%">
								</c:if>
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">용어</th>
									<th scope="col" class="">설명</th>
									<th scope="col" class="">등록일</th>
									<c:if test="${registerFlag == 'insert'}">
										<!-- <th scope="col" class="">관리</th> -->
										<th scope="col" class="">사용여부</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty resultList }"><tr><td colspan="5">등록된 글이 없습니다.</td></tr></c:if>
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<tr onclick="javascript:fn_egov_view('${result.wordNo}','view');" >
										<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
										<td>${result.wordNm}</td>
										<td class="left">
											<a href="#" style="white-space:pre;">${result.cont}</a>
										</td>
										<td>${result.regDt}</td>
										<c:if test="${registerFlag == 'insert'}">
											<%-- <td>										
												<span class="bd_btn">
													<button type="button" onclick="javascript:fn_egov_select('${result.wordNo}', 'update');" class="btn_st mini line_orange">수정</button>
													<button type="button" onclick="javascript:fn_egov_delete('${result.wordNo}');" class="btn_st mini bg_orange">삭제</button>
												</span>
											</td> --%>
											<td>
												<c:choose>
													<c:when test="${result.openYn == 'Y'}">
														사용
													</c:when>
													<c:otherwise>
														미사용
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
	<!-- /List -->
					
					<!-- 페이징 -->
					<div id="paging" class="bd_pagination">
						<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
						<form:hidden path="pageIndex" />
					</div>
					<!-- end 페이징 -->
					
				<!-- 등록 -->
					<c:if test="${registerFlag == 'insert'}">
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
						</div>
					</c:if>
				<!-- end 등록 -->
				
			</form:form>	

