<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
function fn_egov_addView(){
   	document.getElementById("listForm").action = "<c:url value='/admin/tbBn/addTbPopupView.do'/>";
   	document.getElementById("listForm").submit();
}
</script>
<script type="text/javaScript" language="javascript" defer="defer">

function fn_egov_select(code, gbCd) {
    document.getElementById("listForm").code.value = code;
    document.getElementById("listForm").gbCd.value = gbCd;
   	document.getElementById("listForm").action = "<c:url value='/admin/tbCode/updateTbCodeView.do'/>";
   	document.getElementById("listForm").submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/tbBn/TbBnList.do'/>";
   	document.getElementById("listForm").submit();
}

$(function(){
	$("#searchCondition").val("${empty searchVO.searchCondition ? 'all' : searchVO.searchCondition }");
	$("#searchKeyword").val("${searchVO.searchKeyword }");
});

 // -->
</script>
<script>
function fn_egov_addView(){
   	document.getElementById("listForm").action = "<c:url value='/admin/tbBn/addTbPopupView.do'/>";
   	document.getElementById("listForm").submit();
}
</script>

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="popSeq" />
    <form:hidden path="pageIndex" />
	<div class="bd_top_type01">
			<div class="area_left">
				<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
			</div>
			<div class="fr">
				<fieldset class="search_form">
					<legend>검색</legend>
					<div class="bd_sel_search">
						<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
						<input type="text" name="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="searchKeyword" maxlength="20"/>
						<input type="button" value="검색" onclick="javascript:go_search()">
					</div>
				</fieldset>
			</div>		
		</div>
		<table class="bd_tbl center">
			<caption>회원 목록</caption>
			<colgroup>
				<col width="5%">
				<col width="7%">
				<col width="20%">
				<col width="7%">
				<%-- <col width="7%"> --%>
				<%-- <col width="7%"> --%>
	        </colgroup>
			<thead>
				<tr>
					<th>순서</th>
					<th>이미지</th>
					<th>제목</th>
					<!-- <th>사용여부</th> -->
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:forEach var="result" items="${resultList}" varStatus="vs">
					<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.rn }" /></td>
					<td>
						<img src="/imagefile/preview.do?fileSeq=${result.fileSeq }"  style="width:140px; height:60px">
					</td>
					<td><a href="/admin/tbBn/updateTbPopupView.do?popSeq=${result.popSeq }">${result.goodsNm }</a></td>	<!-- 제목/이미지태그  -->
					<%-- <td>
						<c:if test="${result.useYn eq 'Y' }">사용함</c:if>
						<c:if test="${result.useYn eq 'N' }">사용안함</c:if>
					</td>	 --%>
					<td>${result.regDate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<div class="bd_btn_area right">
			<a href="/admin/goods/addGoods.do" class="btn_black">등록</a>
		</div>
		
		<div id="paging" class="bd_pagination">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
		</div>
</form:form>
	<!-- // search -->
	<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		})

	})
	function checkPopAll(){
		var Allcnt = $("input[name=chk]").length
		var Chkcnt = $("input[name=chk]:checked").length
		if (Allcnt > Chkcnt){
			$("#checkAll").prop("checked",false);
		}else{
			$("#checkAll").prop("checked",true);
		}
	}
	function go_delete(){
		var Chkcnt = $("input[name=chk]:checked").length
		if(Chkcnt < 1){
			alert("선택한 팝업이 없습니다.\n확인하여 주시기 바랍니다.");
			return;
		}
		if( confirm("선택한 팝업을 삭제하시겠습니까?\n삭제된 팝업 정보는 복구되지 않습니다.") ) {
			document.frm.method = "post";
			document.frm.action = "popup_delete_proc.do";
			document.frm.submit();
		}
	}
	minSeq = ${order.min_seq==null ? 0:order.min_seq };
	maxSeq = ${order.max_seq==null ? 0:order.max_seq };
	function seqEdit(mode, no, seq) {
		if(mode=='up'){
			if(minSeq==no){
				alert('이동이 불가능 합니다.');
				return false;
			}
		}
		if(mode=='down'){
			if(maxSeq==no){
				alert('이동이 불가능 합니다.');
				return false;
			}
		}
		var f = document.frm_search;
		f.order_no.value = no; 
		f.mode.value = mode;
		f.seq.value = seq;
		f.method="post";
		f.action="popup_order_edit_proc.do";
		f.submit();
	}
    /* pagination 페이지 링크 function */
    function go_page(pageNo){
/*     	var site_cd = $("#site_cd").val();
    	document.frm_search.site_cd.value = site_cd; */
    	document.frm_search.currentPage.value = pageNo;
    	document.frm_search.action = "popup_list.do";
       	document.frm_search.submit();
    }
    function go_view(seq){
/*     	var site_cd = $("#site_cd").val();
    	document.frm_search.site_cd.value = site_cd; */
    	document.frm_search.seq.value = seq;
    	document.frm_search.action = "popup_edit.do";
       	document.frm_search.submit();
    }
    function go_write(){
/*     	var site_cd = $("#site_cd").val();
    	document.frm_search.site_cd.value = site_cd; */
    	document.frm_search.seq.value = "";
    	document.frm_search.action = "/backend/popup/popup_write.do";
       	document.frm_search.submit();
    }
    function go_search(){
/*     	var site_cd = $("#site_cd").val();
    	document.frm_search.site_cd.value = site_cd; */
    	document.frm_search.seq.value = "";
    	document.frm_search.currentPage.value = "1";
    	document.frm_search.action = "popup_list.do";
       	document.frm_search.submit();
    }
</script>