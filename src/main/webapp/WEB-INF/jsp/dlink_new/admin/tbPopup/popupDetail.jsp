<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbBrdRegister.jsp
  * @Description : TbBrd Register 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-03-22
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script>
function go_delete(popSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("detailForm").popSeq.value = popSeq; 
		document.getElementById("detailForm").action = "<c:url value='/admin/popup//popupDelete.do'/>";
   		document.getElementById("detailForm").submit();
	}
} 
</script>
<form:form modelAttribute="searchVO" name="detailForm" id="detailForm" >
	<!-- 컨텐츠 영역 s -->
	<input type="hidden" name="popSeq" >
	<p class="mb10 right">
	<table class="bd_tbl bd_tbl_view">
		<caption>팝업 등록 수정 폼</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<tbody><tr>
			<th>제목</th>
			<td>
				${searchVO.title }
			</td>
		</tr>
		<tr>
			<th><label for="collection_data01">팝업기간설정</label></th>
			<td>
				<div style="vertical-align:middle">
					<div class="area_calendar">
						${searchVO.startDate }~${searchVO.endDate }
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div>
					<%-- <input type="text" class="cont" id="cont" name="cont" style="height:430px" value="${searchVO.contents }"> --%>
					${searchVO.cont }
				</div>
			</td>
		</tr>
		<tr>
			<th>사용유무</th>
			<td>	
				<ul class="chk_area">
					<li>
						<input onclick="return(false);" type="radio" name="useYn" value="Y" id="useY" <c:if test="${searchVO.useYn eq 'Y' }">checked</c:if>> <label for="useY">사용</label>
					</li>
					<li>
						<input onclick="return(false);" type="radio" name="useYn" value="Y" id="useN"<c:if test="${searchVO.useYn eq 'N' }">checked</c:if>> <label for="useN">사용안함</label>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>
				<div>
					${searchVO.regDate }
				</div>
			</td>
		</tr>
		<!-- <tr>
			<th>팝업 크기</th>
			<td>
				<div>
				폭 : <input type="text" name="popupWidth" id="popupWidth" value="" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel,
				높이 : <input type="text" name="popupHeight" id="popupHeight" value="" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel
				</div>
				<p class="cl_blue">※ 높이 설정시 "오늘 이창 띄우지 않음" 부분 높이(20px)를 포함하여 입력해 주세요.</p>
			</td>
		</tr> -->
		</tbody></table>
		
		<div class="bd_btn_area center">
			<a href="/admin/popup/popupUpdate.do?popSeq=${searchVO.popSeq }" class="btn_black">수정</a>
			<a href="javascript:go_delete('${searchVO.popSeq }');" class="btn_black line_orange">삭제</a>
			<a href="/admin/popup/popupList.do;" class="btn_black line_gray">목록</a>
		</div>
</form:form>
		