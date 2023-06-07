<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : counConfirm.jsp
  * @Description : counConfirm Register 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-04-11
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
   	document.getElementById("detailForm").action = "<c:url value='/admin/consult/counSearchList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {

	var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: "/admin/consult/deleteConsult.do",
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

/* 글 등록 function */
function fn_egov_save() {	

	 
	 var data = $("#detailForm").serialize();
	
		
		$.ajax({
		    type: "POST",
		    url: "/admin/consult/addConsult.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
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

<form:form name="searchForm" id="searchForm" method="post" action="/admin/consult/counSearchList.do">
	
</form:form>





	<form:form modelAttribute="TReqMakeVO" name="detailForm" id="detailForm" >
		<form:hidden path="reqNo" value="${reqNo}"/>
		<form:hidden path="ptplNo" value="${ptplNo}"/>
		<form:hidden path="seq" value="${seq}"/>
		<form:hidden path="registerFlag" value="MyInsert"/> 
		<form:hidden path="regGb" value="${regGb}"/>
			
			
				<h4 class="tit"> 내용 정보</h4>
					
						<c:if test="${seq eq '1'}">							
							<table class="bd_tbl bd_tbl_view">
								<caption>포트폴리오 상세정보</caption>
								<colgroup>
									<col width="10%">
									<col width="30%">	
									<col width="10%">	
									<col width="10%">
									<col width="30%">
									<col width="10%">	
								</colgroup>
								<tbody>		
									<tr>
										<th scope="row">포트폴리오 이름</th>
										<td colspan="2">${setTPtplInfoVO.ptplNm}</td> 									
										<th scope="row">전문분야</th>
										<td colspan="2">${setTPtplInfoVO.ptplPartNm}</td> 
									</tr>
									<tr>
										<th scope="row">업체명</th>
										<td colspan="2">
											${setTPtplInfoVO.comNm}
										</td>									
										<th scope="row">디자인컨셉</th>
										<td colspan="2">${setTPtplInfoVO.concept}</td>
									</tr>
									<tr>
										<th scope="row">대표이미지</th>
										<td id="" class="" colspan="5"> 
											<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${setTPtplInfoVO.fileSeq }" alt="" style="width:300px; height:auto; padding:20px" alt="대표이미지" / ></i>
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="6" style="text-align: center !important;">상담내용</th>
									</tr>
									<tr>
										<th scope="row">
											${TReqMakeVO.register}
											<input type="hidden" name="register" id="register" value="${TReqMakeVO.register}" />
										</th>
										<td colspan="4">
											${TReqMakeVO.cont}
										</td>									
										<td>${TReqMakeVO.regDt}</td>
									</tr>										
								</tbody>
							</table>
						</c:if>
						
					<h4 class="tit">답변 정보</h4>
							<table class="bd_tbl bd_tbl_view"> 
								<caption> 내용 정보</caption>
								<colgroup>
									<col width="20%">
									<col width="70%">
									<col width="10">
								</colgroup>
								<tbody>
									<c:forEach var="selectCommentList" items="${selectCommentList}" varStatus="vs">	
										<c:if test="${selectCommentList.seq ne '1' }">
											<tr>
												<th scope="row">
													${selectCommentList.register}
													<input type="hidden" name="register" id="register" value="${selectCommentList.register}" />
												</th>
												<td>${selectCommentList.cont}</td>
												<td>${selectCommentList.regDt}</td>
											</tr>
										</c:if>										
									</c:forEach>
								</tbody>
							</table>
					
					
						
						
					
					<table class="bd_tbl bd_tbl_view">
						<caption>답변내역</caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="app_nm">답변등록</label></th>
								<td>
									<div>
										<textarea name="cont" id="cont" style="width:100%; height: 150px;"  placeholder="상담내용의 의견을 등록해 주세요 상담과 무관한 댓글, 악플은 삭제될 수 있습니다. 댓글은 1000자까지 입력 가능합니다."></textarea>
										<button type="button" class="btn_st mini" onclick="javascript:fn_egov_save()">답변등록</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				
				
					
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
					<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
				</div>
			
				
			<!-- //컨텐츠 영역 e -->
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			
	</form:form>




								