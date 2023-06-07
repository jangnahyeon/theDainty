<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
/*글 view 화면 function */
 function fn_egov_view(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/front/business/viewCommuty.do'/>";
   	document.getElementById("listForm").submit();
}
</script>

<!-- 공지사항 -->
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="registerFlag" id="registerFlag" />
    <input type="hidden" id="menuId" name="menuId" value="${menuId}"/> 
	<input type="hidden" id="postNo" name="postNo" />
	<input type="hidden" id="seq" name="seq" />
					
		<h3 class="">공지사항</h3>	
			<div class="area_news">
				<div class="lst_news">
					<ul>
						<c:forEach var="result" items="${resultList}" varStatus="vs">
							<li>
								<a href="javascript:fn_egov_view('${result.menuId}','${result.postNo}','${result.seq}', 'view');">
									<span class="info_date"><i>${result.regDtYear}.${result.regDtMonth}</i>${result.regDtDay}</span>
									<em>${result.title}</em>
									<span class="info_txt">
										${result.cont}
									</span>
								</a>
							</li>
						</c:forEach>
					</ul>
					<span class="area_more"><a href="/front/business/noticeList.do?menu_id=gongji" class="btn_more"><i>공지사항 더보기</i></a></span>
				</div>
			</div>
			
</form:form>
