<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="flag" value="${bannerVO.bannerNo == 0 ? 'insert' : 'update' }" />

<script type="text/javaScript" type="text/javascript">
$(function() {

});


function fn_egov_save() {
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("이미지를 등록해 주세요.");
		return false;
	}
	
	if(confirm("등록하시겠습니까??")){
		
		var flag = '${flag}';
		if(flag == 'insert'){
			document.getElementById("detail").action = "<c:url value='/admin/main/addBanner.do'/>";
		} else {
			document.getElementById("detail").action = "<c:url value='/admin/main/updateBanner.do'/>";
		}
	   	document.getElementById("detail").submit();
	}
} 


function checkNumber(event) {
	  if( (event.key >= 0 && event.key <= 9) || event.key == "Backspace") {
	    return true;
	  }
	  
	  return false;
}


//다중 이미지 업로드
function multi_image_upload(){
		
	var formData = new FormData();
	formData.append("file", $("input[name=attach]")[0].files[0]);
	
	if ($("#attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
	if ($('#attach').val() != null) {
		var ext = $('#attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
	}
	
	if($("#file_attch div").length > 0){
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
						$('#file_attch').append( 
								"<div id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>" 
								+ '<i class="main_img"><img src="/imagefile/preview.do?fileSeq='+tmp1+'" alt=""></i>'
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\">"+ tmp2+ "</a>"
								+ '&nbsp;&nbsp;<a class="tbl-btn" href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></div>');
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
				//$('.mask, .window').hide();
			alert("시스템 오류가 발생했습니다. \n 관리자에게 문의하세요.");
		}
	});
}

//다중 이미지 삭제
function multi_image_delete( val){
	
	
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
<form:form modelAttribute="bannerVO" name="detail" id="detail" method="post">
	<form:hidden path="bannerNo"/>
	<table class="bd_tbl bd_tbl_view sortable">
		<caption>배너 상세정보</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<tbody>
		<tr>
			<th>배너영역</th>
			<td>
				<form:input path="bannerArea"/>
			</td>
		</tr>
		<tr>
			<th>배너이름</th>
			<td><form:input path="bannerNm"/></td>
		</tr>
		<tr>
			<th>배너설명</th>
			<td><form:input path="bannerCont"/></td>
		</tr>
		<tr>
			<th>순서</th>
			<td><form:input path="ordSeq" cssClass="wd_100" onkeydown="return checkNumber(event);"/></td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td>
				<form:select path="disYn">
					<form:option value="Y">Y</form:option>
					<form:option value="N">N</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<th rowspan="2">이미지</th>
			<td>
				<form:hidden path="fileSeq"/>
				<input type="file" name="attach" id="attach"/> <a href="#none" class="btn_st st_bg_blue small" onclick="multi_image_upload()">저장</a>
				<c:if test="${not empty bannerVO.fileSeq }">
				<div id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>
				<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${bannerVO.fileSeq }" alt=""></i>
				<a href='/imagefile/download.do?file_no=${bannerVO.fileSeq }' class="mt_image_file">${bannerVO.fileNm }</a>
				<a class="tbl-btn" href="javascript:multi_image_delete('${bannerVO.fileSeq }');">삭제</a></div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td id="file_attch" class="">
			</td>
		</tr>
		</tbody>
	</table>
		
	
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
			
</form:form>

	<!-- //컨텐츠 영역 e -->
