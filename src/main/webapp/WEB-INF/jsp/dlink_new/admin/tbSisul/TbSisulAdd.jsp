<%@page import="dlink_new.admin.vo.TImgInfo"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcRgs.jsp
  * @Description : ntcRgs 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="flag" value="${empty tbSisulVO.sisulSeq ? 'insert' : 'update' }" />

<script>
function go_register() {
	
	var sisulNm = $("#sisulNm").val(); 
	if(sisulNm == ''){
		alert("제목을 입력해 주세요.");
		return false;
	}
	var useYn = $('input[name=useYn]').is(":checked");
	
	if(!useYn){
		alert("사용여부를 선택해주세요.");
		return false;
	}
	
	var params = $("#detailForm").serialize();
	console.log(params);
	var flag = "${flag}";
	if(flag == 'insert') {
		$.ajax({
			url : "/admin/tbSisul/addTbSisul.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("저장되었습니다.");
		        	location.href="/admin/sisul/sisulList.do";
		        	
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	} else if (flag == 'update') {
		$.ajax({
			url : "/admin/tbSisul/updateTbSisul.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("수정되었습니다.");
		        	location.href="/admin/sisul/sisulList.do";
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}
</script>

<!-- 컨텐츠 영역 s -->
					<p class="mb10 left"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.${tbSisulVO.sisulSeq }</p>
					<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
						<input type="hidden" name="sisulSeq"value="${tbSisulVO.sisulSeq }">
						<!-- <h4 class="tit">소제목</h4> -->
						<table class="bd_tbl bd_tbl_view">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="con_cd1">제목</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="sisulNm" id="sisulNm" value="${tbSisulVO.sisulNm }" maxlength="50" id="con_cd1">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">사용여부 <span class="tbl_star">*</span></label></th>
									<td colspan="3">
									<ul class="chk_area">
										<li><input type="radio" name="useYn" value="Y" id="kind1"<c:if test="${tbSisulVO.useYn eq 'Y' }">checked</c:if>> <label for="kind1">노출</label></li>
										<li><input type="radio" name="useYn" value="N" id="kind2"<c:if test="${tbSisulVO.useYn eq 'N' }">checked</c:if>> <label for="kind2">노출안함</label></li>									
									</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</form:form>
						
					<div class="bd_btn_area center">
						<c:if test="${flag == 'update'}">
							<a href="/admin/sisul/sisulList.do" class="btn_black" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
						</c:if>
						<c:if test="${flag == 'insert'}">
							<a href="/admin/sisul/sisulList.do" class="btn_black" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
						</c:if>		
						
					</div>

					<!-- //컨텐츠 영역 e -->