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
   	document.getElementById("detailForm").action = "<c:url value='/admin/commuty/commutyInquiryList.do?menu_id=gongji'/>";
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
function fn_egov_select( menuId, postNo, seq, registerFlag) {
	document.getElementById("detailForm").menuId.value = menuId;
	document.getElementById("detailForm").postNo.value = postNo;
	document.getElementById("detailForm").seq.value = seq;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/commuty/updateCommutyView.do'/>";
   	document.getElementById("detailForm").submit();
}


</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/commuty/commutyInquiryList.do?menu_id=gongji">
		
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
							<td colspan="3">
								<c:choose>
									<c:when test="${setTCommutyVO.register == 'admin'}">
										관리자
									</c:when>
									<c:otherwise>${setTCommutyVO.register}</c:otherwise>
								</c:choose>
							</td>
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
						<%-- <tr>
							<th scope="row"><label for="cont">비밀번호</label></th>
							<td colspan="3"${setTCommutyVO.pwd}></td>
						</tr> --%>
						<tr>
							<th scope="row"><label for="ex_filename">파일내용</label></th>
							<td colspan="3">
								<c:if test="${not empty selectTCommutyFileList}">
									<c:forEach var="vlimg" items="${selectTCommutyFileList}" varStatus="vlvs">
									  <div id="${vlimg.fileSeq}" style='width: 75%; margin-bottom: 5px;'>
										  <a href="/imagefile/download.do?file_no=${vlimg.fileSeq}">${vlimg.fileNm}</a>
											<form:hidden path="fileSeq"/>
										</div>
									</c:forEach>
								</c:if>
								<!-- 사용자가 게시판 올릴 때 자료가 없으면 비출력 -->
								<c:if test="${empty selectTCommutyFileList}">
									등록된 첨부파일이 없습니다.
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
	
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
					<a href="javascript:fn_egov_select('${setTCommutyVO.menuId}','${setTCommutyVO.postNo}','${setTCommutyVO.seq}', 'update');" class="btn_black line_gray">수정</a>
					<a href="javascript:fn_egov_delete();" class="btn_black line_gray">삭제</a>
				</div>
				
			<!-- //컨텐츠 영역 e -->
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			
			
		</form:form>
		


