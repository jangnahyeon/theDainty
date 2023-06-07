<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TSpecReqComRegister.jsp
  * @Description : TSpecReqCom Register 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-07
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/mJoinInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}


/* 글 수정등록 function */
function fn_egov_save() {	
	
	var registerFlag = $("#registerFlag").val();
	var cont = $("#acceptYn").val();
	var urlval = "";
	var form = document.detailForm;
	  
	if(form.loginId.value=="" || form.reqNo.value=="" || form.salesAmt.value=="" ) {      
		alert("필수값을 입력해주세요.");
	return ;
	}
	  
	if(registerFlag == 'insert'){
		alert("등록 하시겠습니까?");
		urlval = "/admin/member/addTSpecReqCom.do";
	}else{
		alert("수정 하시겠습니까?");
		urlval = "/admin/member/updateTSpecReqCom.do";
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
<form:form name="searchForm" id="searchForm" method="post" action="/admin/member/mJoinInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TSpecReqComVO" name="detailForm" id="detailForm" >
	<c:if test="${registerFlag == 'update'}">			
		
	</c:if>
	<form:hidden path="registerFlag" value="${registerFlag}"/>

	<table class="bd_tbl bd_tbl_view">
		<caption>전문회사신청정보</caption>
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
					<form:input name="loginId" path="loginId" cssclass="txt w40" /><form:errors path="loginId" />
				</td>
				<th scope="row"><label for="reqNo">신청관리번호<span class="tbl_star">*</span></label></th>
				<td>
					<form:input name="reqNo" path="reqNo" cssclass="txt w40" /><form:errors path="reqNo" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="salesAmt">매출액<span class="tbl_star">*</span></label></th>
				<td class="left">	
					<form:input name="salesAmt" path="salesAmt" cssclass="txt w40" /><form:errors path="salesAmt" />
				</td>
				<th scope="row"><label for="keyCustomer">주요거래처</label></th>
				<td>
					<form:input name="keyCustomer" path="keyCustomer" cssclass="txt w40" /><form:errors path="keyCustomer" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="employ">고용현황</label></th>
				<td class="left">	
					<form:input name="employ" path="employ" cssclass="txt w40" /><form:errors path="employ" />
				</td>
				<th scope="row"><label for="acceptYn">승인여부</label></th>
				<td>
					<%-- <form:input name="acceptYn" path="acceptYn" cssclass="txt w40" /><form:errors path="acceptYn" /> --%>
					<ul class="chk_area">
						<li>
							<form:radiobutton path="acceptYn" value="AC0001" />
							<label for="acceptYn1">승인</label>
						</li>
						<li>
							<form:radiobutton path="acceptYn" value="AC0002" />
							<label for="acceptYn2">빈려</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="acceptCont">승인거부사유</label></th>
				<td class="left">
					<form:input name="acceptCont" path="acceptCont" cssclass="txt w40" /><form:errors path="acceptCont" />
				</td>
				<th scope="row"><label for="requester">신청자</label></th>
				<td>
					<form:input name="requester" path="requester" cssclass="txt w40" /><form:errors path="requester" />
				</td>
			</tr>
		</tbody>
	</table>
	
	<div id="sysbtn" class="bd_btn_area center">						
		<c:if test="${registerFlag == 'update'}">
			<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
			<a id="bt_00" href="javascript:fn_egov_save();" class="btn_black line_gray">수정</a>
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
