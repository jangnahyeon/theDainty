<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TMemUserRegister.jsp
  * @Description : TMemUser Register 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-06
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/private/prmInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
	 var data = $("#detailForm").serialize();
	}	
		$.ajax({
		    type: "POST",
		    url: "/admin/private/deleteTMemUser.do",
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


/* 글 삭제 function */
function fn_egov_approve(loginId, acceptYn) {
	document.getElementById("detailForm").acceptYn.value = acceptYn;
	
	
	if(confirm("저장하시겠습니까?")){
	 var data = $("#detailForm").serialize();
	} else {
		return false;
	}
	console.log(data);
	
	
 	$.ajax({
	    type: "POST",
	    url: "/admin/private/acceptMem.do",
	    data : data,
	    dataType: "text",
	    success: function(rst){
	        if(rst != null){
	        	if(rst == "suc"){
	        		alert("저장 되었습니다.");
	        		location.reload();
	        		/* $("#searchForm").submit(); */
	        	}else{
	        		alert( "저장에 실패했습니다. \n  관리자에게 문의바랍니다.");
	        		/* $("#searchForm").submit(); */
	        	}
	        }
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	}); 

}

/* 글 수정 화면 function */
function fn_egov_select(loginId,registerFlag) {
    document.getElementById("detailForm").loginId.value = loginId;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/private/prmInquiryRequestList.do'/>";
   	document.getElementById("detailForm").submit();
}


</script>
<form:form name="searchForm" id="searchForm" method="post" action="/admin/private/prmInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TMemUserVO" name="detailForm" id="detailForm" >				
	<form:hidden path="loginId"/>
	<form:hidden path="userNm"/>
	<form:hidden path="sex"/>
	<form:hidden path="birthday"/>
	<form:hidden path="mobileNo"/>
	<form:hidden path="zipCd"/>
	<form:hidden path="addr"/>
	<form:hidden path="dtlAddr"/>
	<form:hidden path="acceptYn"/>
	<form:hidden path="reqDt"/>
	<form:hidden path="registerFlag"/>
	
	<table class="bd_tbl bd_tbl_view">
		<caption>회원정보 </caption>
		<colgroup>
			<col width="15%">
			<col width="auto;">
			<col width="15%">
			<col width="auto;">
		</colgroup>
		<tbody>	
			<tr>
				<th scope="row"><label for="loginId">아이디<span class="tbl_star">*</span></label></th>
				<td class="left">	
					${TMemUserVO.loginId}
				</td>
				<th scope="row"><label for="userNm">회원명<span class="tbl_star">*</span></label></th>
				<td class="left">	
					${TMemUserVO.userNm}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="sex">성별</label></th>
				<td>	
					<c:choose>
						<c:when test="${TMemUserVO.sex == 'SX0001'}">
							남자
						</c:when>
						<c:otherwise>
							여자
						</c:otherwise>
					</c:choose>
				</td>
				<th scope="row"><label for="birthday">생년월일</label></th>
				<td class="left">		
					${TMemUserVO.birthday}
				</td>
			</tr>	
			<tr>
				<th scope="row"><label for="mobileNo">휴대전화<span class="tbl_star">*</span></label></th>
				<td class="left">	
					${TMemUserVO.mobileNo}
				</td>
				<th scope="row"><label for="emailAddr">이메일</label></th>
				<td class="left">	
					${TMemUserVO.emailAddr}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">주소</label></th>
				<td class="left" >
					<div class="group_addr">
						<div class="zipcode_txt">
							${TMemUserVO.zipCd}
						</div>
						<div class="addr_txt">
							${TMemUserVO.addr}
							${TMemUserVO.dtlAddr}
						</div>
					</div>
				</td>
				<th scope="row"><label for="regDt">등록일</label></th>
				<td class="left">	
					${TMemUserVO.regDt}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="acceptYn">승인여부</label></th>
				<td class="left" >					
					<div class="acceptYn">
						<c:if test="${TMemUserVO.acceptYn eq 'N'}">미승인</c:if>
						<c:if test="${TMemUserVO.acceptYn eq 'Y'}">승인</c:if>
					</div>
				</td>
				<th scope="row"><label for="acceptCont">기타</label></th>
				<td class="left">	
					<form:input path="acceptCont"/>
				</td>
			</tr>
			<%-- <tr>
				<th scope="row"><label for="regDt">등록일</label></th>
				<td class="left">	
					${TMemUserVO.regDt}
				</td>
				<th scope="row"><label for="register">등록자</label></th>
				<td class="left">	
					${TMemUserVO.register}
				</td>
			</tr> --%>
			<%-- <tr>
				<th scope="row"><label for="updDt">변경일</label></th>
				<td class="left">	
					${TMemUserVO.updDt}
				</td>
				<th scope="row"><label for="updater">변경자</label></th>
				<td class="left">	
					${TMemUserVO.updater}
				</td>
			</tr> --%>
		</tbody>	
	</table>
	<div id="sysbtn" class="bd_btn_area center">
		<a href="javascript:location.href='/admin/private/prmInquiryRequestList.do';" class="btn_black">목록</a>
		<c:if test="${TMemUserVO.acceptYn eq 'N' || TMemUserVO.acceptYn eq '' || TMemUserVO.acceptYn eq null}">				
		<a href="javascript:fn_egov_approve('${TMemUserVO.loginId}', 'Y')" class="btn_black line_gray">승인</a>
		</c:if>
		<c:if test="${TMemUserVO.acceptYn eq 'Y' || TMemUserVO.acceptYn eq '' || TMemUserVO.acceptYn eq null}">
		<a href="javascript:fn_egov_approve('${TMemUserVO.loginId}', 'N')" class="btn_black line_orange">미승인</a>		
		</c:if>			
	</div>
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form:form>

