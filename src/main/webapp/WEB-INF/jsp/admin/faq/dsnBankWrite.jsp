<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${empty dsnBankVO.dsnNo ? 'insert' : 'update' }" />


<script type="text/javaScript" type="text/javascript" defer="defer">
function fn_egov_selectList() {
	document.getElementById("listForm").action = "<c:url value='/admin/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
} 

function fn_egov_save() {
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("이미지를 등록해 주세요.");
		return false;
	}
	
	if(confirm("등록하시겠습니까??")){
		
		var flag = '${flag}';
		if(flag == 'insert'){
			document.getElementById("detail").action = "<c:url value='/admin/dsn/addDsnBank.do'/>";
		} else {
			document.getElementById("detail").action = "<c:url value='/admin/dsn/updateDsnBank.do'/>";
		}
	   	document.getElementById("detail").submit();
	}
}


//다중 이미지 업로드
function multi_image_upload(){
		
	var formData = new FormData();
	formData.append("file", $("input[name=multi_attach]")[0].files[0]);
	
	if ($("#multi_attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
	
	if ($('#multi_attach').val() != null) {
		var ext = $('#multi_attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
	}
	
	if($("#file_attch img").length > 0){
		alert("파일을 삭제해주세요");
		return;
	}
	
	$.ajax({
		url : "/imagefile/upload.do",
		data : formData ,
		processData : false,
		contentType : false,
		//async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				var arr = res.split('&');
				var tmp1 = arr[0].replace("\"", "");
				if(arr.length >= 2) {
					if (arr[1] != ' ') {
						var tmp = arr[1];
						var lastnum = arr[1].lastIndexOf('');
						var tmp2 = tmp.substring(0, lastnum);
						tmp2 = tmp2.replace("\"", "");
						//$('#mt_img_file').val("");
						$('#file_attch').append('<img src="/imagefile/preview.do?fileSeq='+tmp1+'" alt="">');
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' >"
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\">"+ tmp2+ "</a>"
								+ '<a class="btn_del" href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></li>'
						);
					}
					$("#fileSeq").val(tmp1);
					alert('이미지가 정상적으로 등록되었습니다');
				} else {
					alert('저장에 실패했습니다. \n 다시 시도해 주세요.');
				}
			} else {
				alert('저장에 실패했습니다. \n 다시 시도해 주세요.');
				return ;
			}
		},
		error : function(request, status, error) {
			alert("시스템 오류가 발생했습니다. \n 관리자에게 문의하세요.");
		}
	});
}

//다중 이미지 삭제
function multi_image_delete(val){
	
	
	var formData = new FormData();
	formData.append("fileSeq", val);
		
	$.ajax({
		url : "/imagefile/delete.do",
		data : formData ,
		processData : false,
		contentType : false,
		async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				if(res == "suc") {
					$("#file_attch").empty();
					$("#"+val).remove();
					alert('삭제하였습니다.');
				} else{
					alert('삭제에 실패했습니다. \n 다시 시도해 주세요.');
					return ;
				}
			} else {
				alert('삭제에 실패했습니다. \n 다시 시도해 주세요.');
				return ;
			}
		},
		error : function(request, status, error) {
			alert("시스템 오류가 발생했습니다. \n 관리자에게 문의하세요.");
		}
	});
	
}
</script>


	<!-- 컨텐츠 영역 s -->
	
	<div class="detail_design">
		<div class="detail_img">
			<span id="file_attch">
				<c:if test="${not empty dsnBankVO.fileSeq }">
					<img src="/imagefile/preview.do?fileSeq=${dsnBankVO.fileSeq }" alt="">
				</c:if>
			</span>
		</div>
		<div class="detail_info">
			<form:form modelAttribute="dsnBankVO" name="detail" id="detail" method="post">
			<form:hidden path="dsnNo"/>
			<table class="bd_tbl bd_tbl_view">
				<caption>디자인에 대한 상세정보입니다.</caption>
				<col width="15%">
				<col>
				<tbody>
					<tr>
						<th scope="row" class="bd_title">디자인명</th>
						<td><form:input path="dsnNm" /></td>
					</tr>
					<tr>
						<th scope="row">분야</th>
						<td>
							<form:select path="dsnPart">
								<c:forEach var="result" items="${codeList}" varStatus="vs">
									<form:option value="${result.code }">${result.codeNm }</form:option>
								</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th scope="row">연관검색어</th>
						<td><form:input path="refWord" /></td>
					</tr>
					<tr>
						<th scope="row">컨셉</th>
						<td><form:input path="concept" /></td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td id="file_attch2">
							<form:hidden path="fileSeq"/>
							<div class="area_filebox upload">
						  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
							 	<label for="multi_attach">파일찾기</label>
								<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
								<a href="#none" class="upload_btn"  onclick="multi_image_upload()">업로드</a>
								
								<ul id="multi_file_attch" class="multi_file_attch" >
									<c:if test="${not empty dsnBankVO.fileSeq }">
										<li id='${dsnBankVO.fileSeq }' >
											<a href='/imagefile/download.do?file_no="+ tmp1+ "' class='mt_image_file' > ${dsnBankVO.fileNm }</a>
											<a class="btn_del"  href="javascript:multi_image_delete('${dsnBankVO.fileSeq }');">삭제</a>
										</li>
									</c:if>
								</ul>
							</div>
					
						</td>
					</tr>
				</tbody>
			</table>
			
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${dsnBankVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${dsnBankVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${dsnBankVO.pageIndex}'/>"/>
			
			
			</form:form>
		
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<c:if test="${flag == 'update'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" class="btn_black line_gray">수정</a>
					</c:if>
					<c:if test="${flag == 'insert'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" class="btn_black line_gray">등록</a>
					</c:if>		
				</div>
			
			<form:form modelAttribute="dsnBankVO" name="listForm" id="listForm" method="post">
				<form:hidden path="searchCondition"/>
				<form:hidden path="searchKeyword"/>
				<form:hidden path="pageIndex"/>
			</form:form>
		
		</div>
	</div>
		
	<!-- //컨텐츠 영역 e -->
