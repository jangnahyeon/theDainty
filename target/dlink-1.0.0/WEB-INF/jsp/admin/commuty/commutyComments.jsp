<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyRegister.jsp
  * @Description : TCommuty Register 화면
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
<!-- validator:javascript formName="TCommutyVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/commuty/commutyInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	
	 var data = $("#detailForm").serialize();
		
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

/* 글 수정 화면 function */
function fn_egov_select() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/commuty/updateCommutyView.do'/>";
   	document.getElementById("detailForm").submit();
}

/* 답변 화면 function */
function fn_egov_insertComments() {
	
	 var registerFlag = $("#registerFlag").val();
	 var menuId = $("#menuId").val();
	 
	var data = $("#detailForm").serialize();

		$.ajax({
		    type: "POST",
		    url: "/admin/commuty/CommentsCommuty.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("댓글등록 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});

}

/* 답변수정 화면 function */
function fn_egov_updateComments() {
	
	 var registerFlag = $("#registerFlag").val();
	 var menuId = $("#menuId").val();
	 
	var data = $("#detailForm").serialize();

		$.ajax({
		    type: "POST",
		    url: "/admin/commuty/updateCommentsCommuty.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("댓글수정 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});

}
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/commuty/DetailCommentsCommuty.do">
		<input type="hidden" name="menuId" id="menuId" value="${setTCommutyVO.menuId}" />
		<input type="hidden" name="postNo" id="postNo" value="${setTCommutyVO.postNo}" />
		<input type="hidden" name="seq" id="seq"  value="${setTCommutyVO.seq}" />
		<input type="hidden" name="registerFlag" id="registerFlag" />
		<input type="hidden" name="openYn" id="openYn" />
		<input type="hidden" name="title" id="title" />
</form:form>


<form:form name="updateCommentsForm" id="updateCommentsForm" method="post">
		<input type="hidden" name="menuId" id="menuId" value="${setTCommutyVO.menuId}" />
		<input type="hidden" name="postNo" id="postNo" value="${setTCommutyVO.postNo}" />
		<input type="hidden" name="seq" id="seq"  value="${setTCommutyVO.seq}" />
		<input type="hidden" name="registerFlag" id="registerFlag" />
		<input type="hidden" name="openYn" id="openYn" />
		<input type="hidden" name="title" id="title" />
</form:form>



	<form:form modelAttribute="TCommutyVO" name="detailForm" id="detailForm" >
		<form:hidden path="menuId" />
		<form:hidden path="postNo" />
		<form:hidden path="seq" />
		<form:hidden path="registerFlag" />
		
	
		
		<!-- 컨텐츠 영역 s -->
				<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
									
				<table class="bd_tbl bd_tbl_view">
					<caption>신청내역</caption>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="app_nm">제목</label></th>
							<td colspan="3">
								${setTCommutyVO.title} 	
								<form:hidden path="title" />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="cont">내용</label></th>
							<td colspan="3"> 
								${setTCommutyVO.cont}
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="cont">작성자</label></th>
							<td colspan="3">${setTCommutyVO.loginId}</td>
						</tr>
						<tr>
							<th scope="row"><label for="con_cd1">공개여부</label> <span class="tbl_star">*</span></th>
							<td colspan="3">
								<form:hidden path="openYn" />
								<c:choose>
									<c:when test="${setTCommutyVO.openYn == 'Y'}">
										사용
									</c:when>
									<c:otherwise>미사용</c:otherwise>
								</c:choose>
								
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="cont">비밀번호</label></th>
							<td colspan="3"><form:password path="pwd" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="ex_filename">파일내용</label></th>
							<td colspan="3">
								<div class="area_filebox">
									<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
									<label for="ex_filename">파일찾기</label>
									<input type="file" id="ex_filename" class="upload_hidden">
								</div>
								<p class="cl_blue">※ 파일용량  100mb 이하</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="cont">댓글</label></th>
							<td colspan="3">
								<table>
									<colgroup>
										<col width="10%">
										<col width="50%">
										<col width="20%">
										<col width="20%">
									</colgroup>
									<!-- 목록에서 답변 버튼 클릭시 나오는 답변항목 -->
									<c:choose>
										<c:when test="${registerFlag == 'comment' }">
											<tr>
												<th scope="row"><label for="cont">댓글달기</label></th>
												<td colspan="2"><input type="text" name="cont" id="cont" /></td>
												<td>
													<button type="button"  onclick="javascript:fn_egov_comments();"  class="btn_st mini line_orange">답변등록</button>
												</td>
											</tr>
											
											<c:choose>
												<c:when test="${setTCommutyVO.seq ne CommentList.seq}">
													<c:forEach var="result" items="${CommentList}" varStatus="vs">
														<tr>
															<th scope="row"><label for="cont">${result.register}</label></th>
															<td >${result.cont}</td>
															<td>${result.regDt}</td>
															<td>
																<button type="button"  onclick="javascript:fn_egov_insertComments();"  class="btn_st mini line_orange">답변등록</button>
																<button type="button"  onclick="javascript:fn_egov_updateComments();"  class="btn_st mini line_orange">답변수정</button>
																<button type="button"  onclick="javascript:fn_egov_deleteComments();"  class="btn_st mini line_orange">답변삭제</button>
															</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											
										</c:otherwise>
									</c:choose>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				
	
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<a href="javascript:fn_egov_save();" class="btn_black">수정</a>
					<a href="javascript:fn_egov_selectList();" class="btn_black line_gray">목록</a>
					<a href="javascript:fn_egov_delete();" class="btn_black line_gray">삭제</a>
				</div>
				
			<!-- //컨텐츠 영역 e -->
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			
			
		</form:form>
		


