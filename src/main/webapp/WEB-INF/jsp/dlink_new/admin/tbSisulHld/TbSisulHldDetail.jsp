<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulHldDetail.jsp
  * @Description : TbSisulHld Detail 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-03-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
function go_add(hldSeq) {
	document.getElementById("detailForm").hldSeq = hldSeq;
	document.getElementById("detailForm").action = "<c:url value='/admin/tbSisulHld/updateTbSisulHldView.do'/>";
   	document.getElementById("detailForm").submit();
} 
function go_delete(hldSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("detailForm").hldSeq = hldSeq; 
		document.getElementById("detailForm").action = "<c:url value='/admin/tbSisulHld/deleteTbSisulHld.do'/>";
   		document.getElementById("detailForm").submit();
	}
} 
</script>
<form:form modelAttribute="tbSisulHldVO" name="detailForm" id="detailForm" method="post">
<form:hidden path="hldSeq"/>
					<table class="bd_tbl bd_tbl_view sortable">
						<caption>휴일 상세정보</caption>
						<colgroup><col width="130"><col width="*"></colgroup>
						<tbody>
						<tr>
							<th>휴일 이름</th>
							<td>
								${tbSisulHldVO.hldNm }
							</td>
						</tr>
						<tr>
							<th>휴일 날짜</th>
							<td>
								${tbSisulHldVO.hldDt }
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>${tbSisulHldVO.regDt }</td>
						</tr>
						</tbody>
					</table>
						
					<div class="bd_btn_area center">
						<a href="/admin/sisul/sisulHldList.do" class="btn_black btn_list">목록</a>
						<a href="#" onclick="javascript:go_add('${tbSisulHldVO.hldSeq}');" class="btn_black line_gray">수정</a>
						<a href="#" onclick="javascript:go_delete('${tbSisulHldVO.hldSeq}');"class="btn_black line_orange">삭제</a>
					</div>
</form:form>