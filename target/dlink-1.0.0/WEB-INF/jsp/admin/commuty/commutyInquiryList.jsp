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

/* 글 수정 화면 function */
/* function fn_egov_select(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/commuty/updateCommutyView.do'/>";
   	document.getElementById("listForm").submit();
} */

/*글 view 화면 function */
function fn_egov_view(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/commuty/viewCommuty.do'/>";
   	document.getElementById("listForm").submit();
}

/* 답변 화면 function */
/* function fn_egov_comments(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/commuty/DetailCommentsCommuty.do'/>";
   	document.getElementById("listForm").submit();
} */

/* 글 등록 화면 function */
function fn_egov_addView(menuId, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
	document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/commuty/addCommutyView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/commuty/commutyInquiryList.do?menu_id=gongji'/>";
   	document.getElementById("listForm").submit();
}

/* 글 삭제 function */
/* function fn_egov_delete(menuId, postNo, seq) {
	
	if(confirm("정말 삭제하시겠습니까?")) {
		
		var menuId =  document.getElementById("listForm").menuId.value = menuId;
		var postNo =  document.getElementById("listForm").postNo.value = postNo;
		var seq =  document.getElementById("listForm").seq.value = seq;
		
		
		 var data = $("#listForm").serialize();
		  
			$.ajax({
			    type: "POST",
			    url: "/admin/commuty/deleteCommuty.do",
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
 */

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/commuty/commutyInquiryList.do?menu_id=gongji'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/commuty/commutyInquiryList.do?menu_id=gongji">
	
</form:form>




					
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="registerFlag" id="registerFlag" />
		    <input type="hidden" id="menuId" name="menuId" value="${menuId}"/> 
			<input type="hidden" id="postNo" name="postNo" />
			<input type="hidden" id="seq" name="seq" />
			
			
				<!-- 컨텐츠 영역 s -->
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
											<form:option value="1">제목</form:option>
											<%-- <form:option value="2">이름</form:option> --%>
										</form:select>
									</div>
								</div>

								<div class="bd_sel_search">
									<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_word" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
									<input type="text" id="sear_word" />
									<input type="button" onclick="go_search();"  value="검색" />
								</div>
							</fieldset>
						</div>			
					</div>

						<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="5%" />
								<col width="50%" />								
								<col width="10%" />
							<%-- 	<col width="10%" /> --%>
								<col width="10%" />
								<col width="15%" />
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">제목</th>
									<th scope="col" class="">작성자</th>
									<!-- < th scope="col" class="">처리</th> -->
									<th scope="col" class="">사용여부</th>
									<th scope="col" class="">작성일</th>
								</tr>
							</thead>
								<c:if test="${not empty  resultList}">
									<tbody>
										<c:forEach var="result" items="${resultList}" varStatus="vs">
											<%-- <tr onclick="javascript:fn_egov_view('${result.menuId}','${result.postNo}','${result.seq}', 'view');" > --%> 
											<tr>
												<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
												<td style="text-align: left;">
													<a href="javascript:fn_egov_view('${result.menuId}','${result.postNo}','${result.seq}', 'view');">
														${result.title}
													</a>	
												</td>
												<td>${result.register}</td>
												<%-- <td>										
													<span class="bd_btn">
														<button type="button"  onclick="javascript:fn_egov_comments('${result.menuId}','${result.postNo}', '${result.seq}', 'comment');"  class="btn_st mini line_orange">답변</button>
														<button type="button"  onclick="javascript:fn_egov_select('${result.menuId}','${result.postNo}','${result.seq}', 'update');"  class="btn_st mini line_orange">수정</button>
														<button type="button" onclick="javascript:fn_egov_delete('${result.menuId}','${result.postNo}','${result.seq}');" class="btn_st mini bg_orange">삭제</button>
													</span>
												</td> --%>
												<td>
													<c:choose>
														<c:when test="${result.openYn == 'Y'}">
															사용
														</c:when>
														<c:otherwise>미사용</c:otherwise>
													</c:choose>
												</td>
												<td>${result.regDt}</td>
											</tr>
										</c:forEach>
									</tbody>
								</c:if>
								<c:if test="${empty resultList}">
								<tbody>
									<tr>
										<td colspan="5">등록된 내용이 없습니다.</td>
									</tr>
								</tbody>
							</c:if>	
						</table>

						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
						
						
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView('${menuId}','insert');" class="btn_black">등록</a>
						</div>

				
				
		</form:form>

