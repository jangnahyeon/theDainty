<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TFaqRegister.jsp
  * @Description : TFaq Register 화면
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


<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TFaqVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/faq/faqInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("정말 삭제하시겠습니까?")) {
		 var data = $("#detailForm").serialize();
			
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

/* 글 수정 화면 function */
function fn_egov_select(faqNo,registerFlag) {
    document.getElementById("detailForm").faqNo.value = faqNo;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/faq/updateFaqView.do'/>";
   	document.getElementById("detailForm").submit();
}
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/faq/faqInquiryList.do">
	
</form:form>


		<form:form modelAttribute="TFaqVO" name="detailForm" id="detailForm" >
					
			<form:hidden path="faqNo"/>
			<form:hidden path="registerFlag" />
  		
  		
			<table class="bd_tbl bd_tbl_view">
					<caption>FAQ 등록 폼</caption>
					<colgroup>
						<col width="130"><col width="*">
					</colgroup>
						<tbody>
							
							<tr>
								<th scope="row">질의내용</th>
								<td colspan="3">
									${setTfaqvo.question}
								</td>
							</tr>
							<tr>
								<th scope="row">답변내용</th>
								<td colspan="3">
									
									<div>
										${setTfaqvo.answer}
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="con_cd1">사용여부</label> <span class="tbl_star">*</span></th>
								<td colspan="3">
									<c:choose>
										<c:when test="${setTfaqvo.openYn == 'Y'}">
											사용
										</c:when>
										<c:otherwise>미사용</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</tbody>
					</table>

					
				<!-- 버튼 -->
				<div class="bd_btn_area center" id="sysbtn">											
					<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
					<a href="javascript:fn_egov_select('${setTfaqvo.faqNo}', 'update');" class="btn_black line_gray">수정</a>
					<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
				</div>
	
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</form:form>


