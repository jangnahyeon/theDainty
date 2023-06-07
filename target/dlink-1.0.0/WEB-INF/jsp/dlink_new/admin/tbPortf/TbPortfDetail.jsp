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
  * @author 장나현
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/tbPortf/updateTbPortfView.do'/>";
   	document.getElementById("listForm").submit();
} 
function go_delete(portfSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").portfSeq.value = portfSeq; 
		document.getElementById("listForm").action = "<c:url value='/admin/tbPortf/deleteTbPortf.do'/>";
   		document.getElementById("listForm").submit();
	}
} 
</script>
			<div>	
					<div class="detail_design">
						<%-- <div class="detail_img">
							<span><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></span>
						</div> --%>
						
						<form:form modelAttribute="resultList" name="listForm" id="listForm" method="post">
						<form:hidden path="portfSeq"/>
						<form:hidden path="code"/>
						<div class="">
							<table class="bd_tbl bd_tbl_view">
								<caption>디자인에 대한 상세정보입니다.</caption>
								<col width="15%">
								<col>
								<tbody>
									<tr>
										<th scope="row" class="bd_title">이미지 제목</th>
										<td>${resultList.title }</td>
									</tr>
									<tr>
										<th scope="row" >미리보기 이미지</th>
										<td>
											<div >
												<span><img style="width:50%;height:50%"src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></span>
											</div>
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
								<a href="#" class="btn_black line_orange"onclick="javascript:go_delete('${resultList.portfSeq}');">삭제</a>
								<c:if test="${resultList.code eq '0001' }">								
									<a href="/admin/portf/portfList.do?code=0001" class="btn_black btn_list" >목록</a>
								</c:if>
								<c:if test="${resultList.code eq '0002' }">								
									<a href="/admin/portf/portfList.do?code=0002" class="btn_black btn_list" >목록</a>
								</c:if>
								<c:if test="${resultList.code eq '0003' }">								
									<a href="/admin/portf/portfList.do?code=0003" class="btn_black btn_list">목록</a>
								</c:if>
							</div>
						</div>
					</form:form>
					</div>
					
						

						
						
					<!-- //컨텐츠 영역 e -->
				</div>
				<!-- //contents e -->
				
				