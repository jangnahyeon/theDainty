<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcDtl.jsp
  * @Description : ntcDtl 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/dBank/dBankUpdate.do'/>";
   	document.getElementById("listForm").submit();
} 
function go_delete(imgNo) {
	document.getElementById("listForm").imgNo.value = imgNo; 
	document.getElementById("listForm").action = "<c:url value='/admin/dBank/dBankDelete.do'/>";
   	document.getElementById("listForm").submit();
} 



</script>
				<div>	
					<div class="detail_design">
						<form:form modelAttribute="resultList" name="listForm" id="listForm" method="post">
						<form:hidden path="imgNo"/>
						<div class="detail_img">
							<span><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></span>
						</div>
						<div class="detail_info">
							<table class="bd_tbl bd_tbl_view">
								<caption>디자인에 대한 상세정보입니다.</caption>
								<col width="15%">
								<col>
								<tbody>
									<tr>
										<th scope="row" class="bd_title">이미지 제목</th>
										<td>${resultList.imgNm }</td>
									</tr>
									<tr>
										<th scope="row">상세내용</th>
										<td>${resultList.imgDetail } </td>
									</tr>
									<tr>
										<th scope="row">노출여부</th>
										<td>
											<input type="radio" name="useYn" value="Y" id="useY" <c:if test="${resultList.useYn eq 'Y' }">checked</c:if>> <label for="useY">노출</label></li>
											<input type="radio" name="useYn" value="N" id="useN" <c:if test="${resultList.useYn eq 'N' }">checked</c:if>> <label for="useN">노출안함</label></li>
										</td>
									</tr>
									<tr>
										<th scope="row">등록일</th>
										<td>${resultList.regDt }</td>
									</tr>
								</tbody>
							</table>
							
							<div class="bd_btn_area right">
								<a href="#" class="btn_black line_gray" onclick="javascript:go_add();">수정</a>
								<a href="#" class="btn_black line_orange"onclick="javascript:go_delete('${resultList.imgNo}');">삭제</a>
								<a href="/admin/dBank/dBankList.do" class="btn_black btn_list" >목록</a>
							</div>
						</div>
					</form:form>
					</div>
						

						
						
					<!-- //컨텐츠 영역 e -->
				</div>
				<!-- //contents e -->