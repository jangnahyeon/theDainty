<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TFaqList.jsp
  * @Description : TFaq List 화면
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

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 수정 화면 function */
/* function fn_egov_select(faqNo) {
    document.getElementById("listForm").faqNo.value = faqNo;
   	document.getElementById("listForm").action = "<c:url value='/admin/faq/FaqMagmt.do'/>";
   	document.getElementById("listForm").submit();
} */

/* 글 view 화면 function */
function fn_egov_view(faqNo,registerFlag) {
    document.getElementById("listForm").faqNo.value = faqNo;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/faq/FaqDetail.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.getElementById("listForm").faqNo.value = faqNo;
	document.getElementById("listForm").registerFlag.value = "insert";
   	document.getElementById("listForm").action = "<c:url value='/admin/faq/addFaqView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/faq/faqInquiryList.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 삭제 function */
function fn_egov_delete(faqNo) {
	
	if(confirm("정말 삭제하시겠습니까?")) {
		var faqNo =  document.getElementById("listForm").faqNo.value = faqNo;
		
		
		 var data = $("#listForm").serialize();
		  
			$.ajax({
			    type: "POST",
			    url: "/admin/faq/deleteFaq.do",
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

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/faq/faqInquiryList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}

</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/faq/faqInquiryList.do">
	
</form:form>

		<!-- 컨텐츠 영역 s -->
					
					
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="faqNo" id="faqNo" />
			<input type="hidden" name="registerFlag" id="registerFlag" />
			
			
					<div class="bd_top_type01">
						<!-- <div class="area_left">
							<div class="tab_device">
								<ul class="tab_style03">
									<li class="on"><a href="#">전체</a></li>
									<li><a href="#">주관기관</a></li>
									<li><a href="#">지원사업</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>
							</div>
						</div>
						 -->
						 
						<div class="fr">
							<fieldset class="search_form">
								<legend>검색</legend>

								<div class="sel_box">										
									<label for="sel_area">검색조건</label>
									<div>
										<form:select path="searchCondition" id="sel_area">
											<form:option value="0">전체</form:option>
											<form:option value="1">질의내용</form:option>
										</form:select>
									</div>
								</div>

								<div class="bd_sel_search">
									<form:input path="searchKeyword" for="sear_word" placeholder="검색어를 입력하세요" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
									<input type="text" id="sear_word">
									<input type="button" onclick="go_search();"  value="검색">
								</div>
							</fieldset>
						</div>			
					</div>

						<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="5%">
								<col width="40%">
								<col width="50%">
								<col width="5%">
								<%-- <col width="10%"> --%>
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">질의내용</th>
									<th scope="col" class="">답변내용</th>
									<th scope="col" class="">공개여부</th>
									<!-- <th scope="col" class="">관리</th> -->
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty resultList }"><tr><td colspan="4">등록된 글이 없습니다.</td></tr></c:if>
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<tr onclick="javascript:fn_egov_view('${result.faqNo}','view');" >
										<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
										<td class="left">
											<a href="#">${result.question}</a>
										</td>
										<td class="left">${result.answer}</td>
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
										<%-- <td>										
											<span class="bd_btn">
												<button type="button" onclick="javascript:fn_egov_delete('${result.faqNo}');" class="btn_st mini bg_orange">삭제</button>
											</span>
										</td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
						
						<div class="bd_btn_area right"> 
							<a href="javascript:fn_egov_addView();" class="btn_black">등록</a>
						</div>
		</form:form>
