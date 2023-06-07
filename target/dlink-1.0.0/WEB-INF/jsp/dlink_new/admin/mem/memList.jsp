<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
function fn_egov_select(memSeq) {
    document.getElementById("listForm").memSeq.value = memSeq;
   	document.getElementById("listForm").action = "<c:url value='/admin/tbMem/tbMemDetail.do'/>";
   	document.getElementById("listForm").submit();
}
function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
function go_search() {
	var url =  window.location.pathname;
	document.getElementById("listForm").action = url;
   	document.getElementById("listForm").submit();
} 
function go_add(memSeq) {
	document.getElementById("listForm").memSeq.value = memSeq;
	document.getElementById("listForm").action = "<c:url value='/admin/tbMem/updateTbMemView.do'/>";
   	document.getElementById("listForm").submit();
} 
function fn_egov_link_page(pageNo){
	var url =  window.location.pathname;
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = url;
   	document.getElementById("listForm").submit();
}
function checkSelectAll()  {
	var checkboxes  = document.querySelectorAll('input[name="checkRow"]');
	var checked  = document.querySelectorAll('input[name="checkRow"]:checked');
	var selectAll   = document.querySelector('input[name="all"]');
	
	if(checkboxes.length === checked.length)  {
		$("input[name=all]").prop("checked", true);
	}else {
		$("input[name=all]").prop("checked", false);
	}
}
function checkAll() {
	if($("#all").is(':checked')) {
		$("input[name=checkRow]").prop("checked", true);
	}else{
        $("input[name=checkRow]").prop("checked", false);
    }
}

function deleteMem() {
	
	
	var memList = [];
	$('input[name="checkRow"]:checked').each(function(i){//체크된 리스트 저장
		memList.push($(this).val());
    });
	
	var params =  {
		"memList" : memList
	}
	console.log(params);
	if(memList != "") {
		if(!confirm("삭제하시겠습니까?")) {
			return;
		} else {
			$.ajax({
				url : "/admin/tbMem/deleteTbMemAjax.do",
				data : params,
				dataType : "text",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				type : "POST",
			    success: function(rs){
			    	if(rs == "Y") {
			    		
			        	alert("삭제되었습니다.");
			        	location.reload();
			    	}
			    },
			    error:function(){
			        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
			    }
			});	
		}
	} else {
		alert("회원을 선택해주시기바랍니다.");
		return;
	}
}

</script>

<!-- 상세검색 영역 s -->
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
<form:hidden path="pageIndex" />
    <input type="hidden" name="memSeq" />
    <input type="hidden" name="code" value="${param.code }" />
	<div class="bd_top_type02">
		<div class="area_left">
			<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
		</div>
		<div class="fr">
			<fieldset class="search_form">
				<legend>검색</legend>

				<div class="sel_box">										
					<label for="sel_area">검색조건</label>
					<div>
						
						<form:select path="searchCondition" id="sel_area">
							<form:option value="">전체</form:option>
							<form:option value="1">아이디</form:option>
							<form:option value="2">성명</form:option>
						</form:select>
					</div>
				</div>

				<div class="bd_sel_search">
					<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
					<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="searchKeyword" maxlength="20"/>
					<input type="button" value="검색" onclick="javascript:go_search()">
				</div>
			</fieldset>
		</div>	
	</div>
		<table class="bd_tbl center">
			<caption>회원 목록</caption>
			<colgroup>
				<col width="7%">
				<col width="17%">
				<col width="17%">
				<col width="17%">
				<col width="7%">
				<col width="7%">
	        </colgroup>
			<thead>
				<tr>
					<th scope="col" class=""><input type="checkbox" onclick="javascript:checkAll();" id="all" name="all"></th>
					<th scope="col" class="">아이디</th>
					<th scope="col" class="">성명</th>
					<th scope="col" class="">가입일</th>
					<th scope="col" class="">상태</th>
					<th scope="col" class="">회원정보수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><input type="checkbox" onclick="javascript:checkSelectAll();" value="${result.memSeq}" name="checkRow"></td>
						<td><a href="javascript:fn_egov_select('<c:out value="${result.memSeq}"/>')">${result.memId}</a></td>
						<td>${result.memNm}</td>
						<td>${result.regDt}</td>
						<td>										
						<span class="bd_btn">
							<c:if test="${result.acceptYn eq 'Y'}">											
								<button type="button" class="btn_st mini bg_blue">승인</button>
							</c:if>
							<c:if test="${result.acceptYn eq 'N'}">											
								<button type="button" class="btn_st mini bg_orange">반려</button>
							</c:if>
							<c:if test="${result.acceptYn eq 'W'}">											
								<button type="button" class="btn_st mini line_gray">대기</button>
							</c:if>
							<c:if test="${result.acceptYn eq 'O'}">											
								<button type="button" class="btn_st mini bg_orange">탈퇴</button>
							</c:if>
						</span>
					</td>
						<td>						
							<button type="button" class="btn_st mini line_orange"onclick="javascript:go_add('<c:out value="${result.memSeq}"/>');">수정</button>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		
		<div class="bd_btn_area right">
			<a href="/admin/tbMem/addTbMemView.do?code=${code }" class="btn_black">등록</a>
			<a href="javascript:deleteMem();" class="btn_black line_orange">삭제</a>
		</div>
		<div class="bd_pagination" id="paging">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
		</div>
</form:form>