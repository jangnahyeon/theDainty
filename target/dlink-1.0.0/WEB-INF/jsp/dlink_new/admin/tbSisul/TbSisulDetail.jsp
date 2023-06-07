<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulList.jsp
  * @Description : TbSisul List 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-01-21
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
function go_add() {
	document.getElementById("detailForm").action = "<c:url value='/admin/tbSisul/updateTbSisulView.do'/>";
   	document.getElementById("detailForm").submit();
} 
function go_delete(sisulSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("detailForm").sisulSeq.value = sisulSeq; 
		document.getElementById("detailForm").action = "<c:url value='/admin/tbSisul/deleteTbSisul.do'/>";
   		document.getElementById("detailForm").submit();
	}
} 

</script>
<form:form modelAttribute="tbSisulVO" name="detailForm" id="detailForm" method="post">
<form:hidden path="sisulSeq"/>
					<table class="bd_tbl bd_tbl_view sortable">
						<caption>포트폴리오 상세정보</caption>
						<colgroup><col width="130"><col width="*"></colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td>
								${tbSisulVO.sisulNm }
							</td>
						</tr>
						<tr>
							<th>사용여부</th>
							<td>
							<input onclick="return(false);" type="radio" name="useYn" value="Y" id="useY" <c:if test="${tbSisulVO.useYn eq 'Y' }">checked</c:if>> <label for="useY">사용</label></li>
							<input onclick="return(false);" type="radio" name="useYn" value="N" id="useN" <c:if test="${tbSisulVO.useYn eq 'N' }">checked</c:if>> <label for="useN">사용안함</label></li>
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>${tbSisulVO.regDt }</td>
						</tr>
						</tbody>
					</table>
						
					<div class="bd_btn_area center">
						<a href="/admin/sisul/sisulList.do" class="btn_black btn_list">목록</a>
						<a href="#" onclick="javascript:go_add();" class="btn_black line_gray">수정</a>
						<a href="#" onclick="javascript:go_delete('${tbSisulVO.sisulSeq}');"class="btn_black line_orange">삭제</a>
					</div>
</form:form>