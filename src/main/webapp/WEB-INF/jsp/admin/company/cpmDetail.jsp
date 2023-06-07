<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : cpmDetail.jsp
  * @Description : cpmDetail 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-01
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/company/cpmInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
	 var data = $("#detailForm").serialize();
	}	
		$.ajax({
		    type: "POST",
		    url: "/admin/company/deleteTMemCom.do",
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
function fn_egov_select(loginId,registerFlag) {
    document.getElementById("detailForm").loginId.value = loginId;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/company/updateTMemComView.do'/>";
   	document.getElementById("detailForm").submit();
}


</script>
<form:form name="searchForm" id="searchForm" method="post" action="/admin/company/cpmInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TMemComVO" name="detailForm" id="detailForm" >				
	<form:hidden path="loginId"/>
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
					${TMemComVO.loginId}
				</td>
				<th scope="row"><label for="ceoNm">대표명<span class="tbl_star">*</span></label></th>
				<td>
					${TMemComVO.ceoNm}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="comNm">기업명<span class="tbl_star">*</span></label></th>
				<td class="left">
					${TMemComVO.comNm}
				</td>
				<th scope="row"><label for="ceoMobileNo">대표자휴대폰<span class="tbl_star">*</span></label></th>
				<td>	
					${TMemComVO.ceoMobileNo}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="comType">기업형태</label></th>
				<td class="left">		
					${TMemComVO.comType}
				</td>
				<th scope="row"><label for="sex">대표자성별</label></th>
				<td>	
					<c:choose>
						<c:when test="${TMemComVO.sex == 'SX0001'}">
							남자
						</c:when>
						<c:otherwise>
							여자
						</c:otherwise>
					</c:choose>
				</td>
			</tr>	
			<tr>
				<th scope="row"><label for="comNo">법인등록번호<span class="tbl_star">*</span></label></th>
				<td class="left">
					${TMemComVO.comNo}
				</td>
				<th scope="row"><label for="comUrl">기업홈페이지</label></th>
				<td>
					${TMemComVO.comUrl}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">사업장주소</label></th>
				<td class="left" colspan="3">
					<div class="group_addr">
						<div class="zipcode_txt">
							${TMemComVO.comZip}
						</div>
						<div class="addr_txt">
							${TMemComVO.comAddr}
							${TMemComVO.comDtlAddr}
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangNm">담당자명</label></th>
				<td class="left">
					${TMemComVO.damdangNm}
				</td>
				<th scope="row"><label for="reqPart">신청분야</label></th>
				<td>
					${TMemComVO.reqPart}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangDept">담당자부서</label></th>
				<td class="left">
					${TMemComVO.damdangDept}
				</td>
				<th scope="row"><label for="damdangPos">담당자직위</label></th>
				<td>
					${TMemComVO.damdangPos}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangMobileNo">담당자연락처</label></th>
				<td class="left">
					${TMemComVO.damdangMobileNo}
				</td>
				<th scope="row"><label for="damdangEmail">담당자이메일</label></th>
				<td>
					${TMemComVO.damdangEmail}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="specYn">전문회사여부</label></th>
				<td class="left">
					<c:choose>
						<c:when test="${TMemComVO.specYn == 'Y'}">
							사용
						</c:when>
						<c:otherwise>
							미사용
						</c:otherwise>
					</c:choose>
				</td>
				<th scope="row"><label for="regDt">등록일</label></th>
				<td>
					${TMemComVO.regDt}
				</td>
			</tr>
			<c:forEach var="vlimg" items="${selectTMemComFileList}" varStatus="vlvs">	
			<tr class="fileTR">
				<th scope="row">${vlimg.fileKindNm}</th>
				<td colspan="3" >
					<ul id="multi_file_attch" class="multi_file_attch" >
						<li>							
							<a href='/imagefile/download.do?file_no=${vlimg.fileSeq }' class="mt_image_file">${vlimg.fileNm }</a>
							<!--  <input type="hidden" name="file_attch" value="${vlimg.fileSeq}" />   -->
							<input type="hidden" name="multi_attach" id="multi_attach" class="upload_hidden" value="${vlimg.fileSeq}" /> 
						</li>
						<c:if test="${vlimg.fileKind eq 'CF0001'}">
							<li>
								<img src="/imagefile/preview.do?fileSeq=${vlimg.fileSeq }" style="width:300px; height:150px;" alt="${vlimg.fileNm}" />
							</li>
						</c:if>	
					</ul>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sysbtn" class="bd_btn_area center">
		<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>											
		<a href="javascript:fn_egov_select('${TMemComVO.loginId}', 'update');" class="btn_black line_gray">수정</a>
		<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>					
	</div>
		
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>


