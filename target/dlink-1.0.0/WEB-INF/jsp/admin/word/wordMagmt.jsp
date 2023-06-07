<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TWordRegister.jsp
  * @Description : TWord Register 화면
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


<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TWordVO" staticJavascript="false" xhtml="true" cdata="false"/ -->


<script type="text/javaScript" type="text/javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/word/wordInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	
	 var data = $("#detailForm").serialize();
		
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

/* 글 등록 function */
function fn_egov_save() {	
	var registerFlag = $("#registerFlag").val();
	var wordNm = $("#wordNm").val();
	var cont = $("#cont").val();
	var openYn = $("input:radio[name=openYn]:checked").val();
	
	
	// 용어명 입력 확인
	if(wordNm == ''){
		alert("용어명을 입력해주세요.");
		
		return false;
	}
	
	// 설명 입력 확인
	if(cont == ''){
		alert("설명을 입력해주세요.");
		
		return false;
	}
	
	// 사용여부 입력 확인
	if(openYn == ''){
		alert("사용여부를 선택해주세요.");
		
		return false;
	}
	

	var urlval = "";
	if(registerFlag == 'insert'){
		urlval = "/admin/word/addWord.do";
	}else{
		urlval = "/admin/word/updateWord.do";
	}
	
	
	 var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: urlval,
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
		        		$("#searchForm").submit();
		        	}else if(res == "upsuc"){
		        		alert("수정 되었습니다.");
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

<form:form name="searchForm" id="searchForm" method="post" action="/admin/word/wordInquiryList.do">
	
</form:form>

		<!-- 컨텐츠 영역 s -->

		<form:form modelAttribute="TWordVO" name="detailForm" id="detailForm" >
			<c:if test="${registerFlag == 'update'}">			
				<form:hidden path="wordNo"/>
			</c:if>
		
				<form:hidden path="registerFlag" value="${registerFlag}"/>
  		
				<table class="bd_tbl bd_tbl_view">
					<caption>용어등록</caption>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
							<tr>
								<th scope="row"><label for="con_cd1">용어명</label> <span class="tbl_star">*</span></th>
								<td colspan="3">
									<form:input path="wordNm" cssClass="txt"/>
									&nbsp;<form:errors path="wordNm" />
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="cont">설명</label></th>
								<td> 
									<div>
										<form:textarea path="cont" style="width:100%; height: 250px;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="con_cd1">사용여부</label> <span class="tbl_star">*</span></th>
								<td colspan="3">
									<ul class="chk_area">
										<li>
											<form:radiobutton path="openYn" value="Y" />
											<label for="openYn1">사용</label>
										</li>
										<li>
											<form:radiobutton path="openYn" value="N" />
											<label for="openYn2">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
					</tbody>
				</table>
						
			
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<c:if test="${registerFlag == 'update'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" class="btn_black  line_gray">수정</a>
						<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
					</c:if>
					<c:if test="${registerFlag == 'insert'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" class="btn_black line_gray">등록</a>
					</c:if>		
				</div>
				
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		</form:form>
