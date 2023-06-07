<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : counSearchList.jsp
  * @Description : counSearchList List 화면
  * @Modification Information
  * 
  * @author 이효진04-1103-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javaScript" language="javascript" defer="defer">


/* 글 등록 화면 function */

function fn_egov_addView(reqNo,seq,ptplNo,regGb,registerFlag) {
    document.getElementById("listForm").reqNo.value = reqNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").ptplNo.value = ptplNo;
    document.getElementById("listForm").regGb.value = regGb;
	document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/admin/consult/addConsultView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/consult/counSearchList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/admin/consult/counSearchList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}

/* 글 삭제 function */
function fn_egov_delete(reqNo) {
	
	if(confirm("정말 삭제하시겠습니까?")) {
		
		
		 var data = $("#listForm").serialize();
		  
			$.ajax({
			    type: "POST",
			    url: "/admin/consult/deleteConsult.do",
			    data : {
			    	"reqNo" : reqNo 
			    },
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



</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/consult/counSearchList.do">
	
</form:form>


<!-- 
<input  type="hidden"  name="tab01" id="tab01" value="A"/>
<input  type="hidden"  name="tab02" id="tab02" value="1"/> -->
					
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="registerFlag" id="registerFlag" />
		    <input type="hidden" id="reqNo" name="reqNo" /> 
			<input type="hidden" id="ptplNo" name="ptplNo" />
			<input type="hidden" id="seq" name="seq" />
			<input type="hidden" id="regGb" name="regGb" />
			
			
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
									<input type="text" id="sear_word">
									<input type="button" onclick="go_search();"  value="검색">
								</div>
							</fieldset>
						</div>			
					</div>

						<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="10%">
								<col width="50%">								
								<col width="10%">
								<%-- <col width="15%"> --%>
								<col width="15%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">내용</th>
									<th scope="col" class="">작성자</th>
									<!-- <th scope="col" class="">처리</th> -->
									<th scope="col" class="">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty resultList }">
									<tr><td colspan="4">등록된 글이 없습니다.</td></tr>
								</c:if>
								<c:if test="${not empty resultList }">
									<c:forEach var="result" items="${resultList}" varStatus="vs">
										<tr style="cursor:pointer;" onclick="javascript:fn_egov_addView('${result.reqNo}', '${result.seq}', '${result.ptplNo}', '${result.regGb}', 'insert');">
											<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
											<td style="text-align: left;">
												${result.cont}
											</td>
											<td>${result.register}</td>
											<%-- <td>										
												<span class="bd_btn">
													<button type="button" onclick="javascript:fn_egov_addView('${result.reqNo}', '${result.seq}', '${result.ptplNo}', '${result.regGb}', 'insert');" class="btn_st mini line_orange">답변</button>
													<button type="button" onclick="javascript:fn_egov_delete('${result.reqNo}');" class="btn_st mini bg_orange">삭제</button>
												</span>
											</td> --%>
											<td>${result.regDt}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
						
					<%-- 	
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView('${menuId}','insert');" class="btn_black">등록</a>
						</div>
 --%>
				
		</form:form>

