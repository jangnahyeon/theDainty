<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${empty result.comId ? 'insert' : 'update' }" />


<script type="text/javaScript" type="text/javascript" defer="defer">
function fn_accept(_val) {
	var msg;
	//미승인일 경우
	if(_val == "N"){
		if($("#acceptCause").val() == ""){
			alert("승인거부사유를 적어주세요");
			$("#acceptCause").focus()
			return false;
		}
		
		msg = "미승인";
	} else {
		$("#acceptCause").val("");
		
		msg = "승인";
	}
	
	$("#acceptYn").val(_val);
	
	if(confirm(msg + " 하시겠습니까??")){
		document.getElementById("listForm").action = "<c:url value='/admin/company/cpmInquiryRequestInsert.do'/>";
	   	document.getElementById("listForm").submit();
	}
} 


</script>
<input type="hidden" name="temp" id="temp" value="${TReqComVO.reqDt}" />

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
<input type="hidden" name="comId" id="comId" value="${TReqComVO.comId}"/>
<input type="hidden" name="reqDt" id="reqDt" value="${TReqComVO.reqDt}" />
<input type="hidden" name="acceptYn" id="acceptYn" value="${TReqComVO.reqDt}" />
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
			<th scope="row"><label for="comId">아이디</label></th>
			<td class="left">	
				${TReqComVO.comId}
			</td>
			<th scope="row"><label for="ceoNm">대표명</label></th>
			<td>
				${TReqComVO.ceoNm}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="comNm">기업명</label></th>
			<td class="left">
				${TReqComVO.comNm}
			</td>
			<th scope="row"><label for="ceoMobileNo">대표자휴대폰</label></th>
			<td>	
				${TReqComVO.ceoMobileNo}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="comType">기업형태</label></th>
			<td class="left">
				<c:if test="${TReqComVO.comType eq 'CP0001'}">법인</c:if>
				<c:if test="${TReqComVO.comType eq 'CP0002'}">개인</c:if>
			</td>
			<th scope="row"><label for="sex">대표자성별</label></th>
			<td>	
				<c:choose>
					<c:when test="${TReqComVO.sex == 'SX0001'}">
						남자
					</c:when>
					<c:otherwise>
						여자
					</c:otherwise>
				</c:choose>
			</td>
		</tr>	
		<tr>
			<th scope="row"><label for="comNo">법인등록번호</label></th>
			<td class="left">
				${TReqComVO.comNo}
			</td>
			<th scope="row"><label for="comUrl">기업홈페이지</label></th>
			<td>
				${TReqComVO.comUrl}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="useradd">사업장주소</label></th>
			<td class="left" colspan="3">
				<div class="group_addr">
					<div class="zipcode_txt">
						${TReqComVO.comZip}
					</div>
					<div class="addr_txt">
						${TReqComVO.comAddr}
						${TReqComVO.comDtlAddr}
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="damdangNm">담당자명</label></th>
			<td class="left">
				${TReqComVO.damdangNm}
			</td>
			<th scope="row"><label for="reqPart">신청분야</label></th>
			<td>
				${TReqComVO.reqPart}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="damdangDept">담당자부서</label></th>
			<td class="left">
				${TReqComVO.damdangDept}
			</td>
			<th scope="row"><label for="damdangPos">담당자직위</label></th>
			<td>
				${TReqComVO.damdangPos}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="damdangMobileNo">담당자연락처</label></th>
			<td class="left">
				${TReqComVO.damdangMobileNo}
			</td>
			<th scope="row"><label for="damdangEmail">담당자이메일</label></th>
			<td>
				${TReqComVO.damdangEmail}
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="regDt" >등록일</label></th>
			<td>
				${TReqComVO.regDt}
			</td>
			<th scope="row"><label for="damdangEmail">승인여부</label></th>
			<td>
				<c:if test="${TReqComVO.acceptYn eq 'Y'}">승인</c:if>
				<c:if test="${TReqComVO.acceptYn eq 'N'}">미승인</c:if>
			</td>
		</tr>
		<tr>
		<tr>
			<th scope="row">대표이미지</th>
			<td class="left" colspan="3">	
			<c:forEach var="result" items="${fileList}" varStatus="vs">
				<img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""> <br/>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<th scope="row">승인거부사유</th>
			<td class="left" colspan="3">
				<textarea rows="" cols="" name="acceptCause" id="acceptCause">${TReqComVO.acceptCause}</textarea>
			</td>
		</tr>
	</tbody>
</table>

	
	

		<!-- // 타이틀 -->
		<div class="bd_btn_area center" id="sysbtn">							
			<a href="#none" class="btn_black" onclick="javascript:history.back(); return flase;">목록</a>
			<c:if test="${TReqComVO.acceptYn ne 'Y'}">
				<a href="#none" class="btn_black line_gray" onclick="fn_accept('Y')">승인</a>
			</c:if>
			<a href="#none" class="btn_black line_orange" onclick="fn_accept('N')">미승인</a>
		</div>
	

		<form:hidden path="searchCondition"/>
		<form:hidden path="searchKeyword"/>
		<form:hidden path="pageIndex"/>
	</form:form>
		
