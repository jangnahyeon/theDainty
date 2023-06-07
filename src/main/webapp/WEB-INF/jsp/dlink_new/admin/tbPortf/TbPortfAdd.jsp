<%@page import="dlink_new.admin.vo.TImgInfo"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcRgs.jsp
  * @Description : ntcRgs 화면
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
<c:set var="flag" value="${empty resultList.portfSeq ? 'insert' : 'update' }" />
<script>
function thumbnail_image(){
	
	
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
	
	if($("#multi_file_attch li").length > 0){
		alert("파일을 삭제해주세요");
		return;
	}
	
	$.ajax({
		url : "/imagefile/waterMark.do",
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
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" >" +tmp2+ " </a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:thumbnail_delete(\''+tmp1+'\');">삭제</a></li>');
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

function go_register() {
	var code = $('input[name=code]').val();
	
	var title = $("#title").val(); 
	if(title == ''){
		alert("제목을 입력해 주세요.");
		return false;
	}
	
	var fileSeq = $("#fileSeq").val();
	
	if(fileSeq == ''){
		alert("포트폴리오 첨부파일을 등록해주세요.");
		return false;
	}
	
	
	var params = $("#detailForm").serialize();
	
	var flag = "${flag}";
	if(flag == 'insert') {
		$.ajax({
			url : "/admin/tbPortf/addTbPortf.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("저장되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/portf/portfList.do?code=0001";
		        	} else if(code == '0002') {
		        		location.href="/admin/portf/portfList.do?code=0002";
		        	} else if(code == '0003') {
		        		location.href="/admin/portf/portfList.do?code=0003";
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	} else if (flag == 'update') {
		$.ajax({
			url : "/admin/tbPortf/updateTbPortf.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("수정되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/portf/portfList.do?code=0001";
		        	} else if(code == '0002') {
		        		location.href="/admin/portf/portfList.do?code=0002";
		        	} else if(code == '0003') {
		        		location.href="/admin/portf/portfList.do?code=0003";
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}
function thumbnail_delete( val){
	
	var formData = new FormData();
	formData.append("fileSeq", val);
	formData.append("CommutyFile", "delete");
	 
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
					$("#fileSeq").val('');
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
<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
					<p class="mb10 left"><strong class="cl_red">*</strong>표시는 필수 입력사항입니다.</p>
						<input type="hidden" name="portfSeq"value="${resultList.portfSeq }">
						<input type="hidden" name="code"value="${resultList.code }">
						<!-- <h4 class="tit">소제목</h4> -->
						<table class="bd_tbl bd_tbl_view">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="con_cd1">제목</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="title" id="title" value="${resultList.title }" maxlength="50" id="con_cd1">
									</td>
								</tr>
								<tr>
									<th scope="col"><label for="">포트폴리오 첨부파일<span class="tbl_star">*</span></label></th>
									<td>
										<form:hidden path="fileSeq"/>
										<div class="area_filebox upload">
									  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										 	<label for="multi_attach">파일찾기</label>
											<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
											<a href="#none" class="upload_btn"  onclick="thumbnail_image()">업로드</a>
											
											<ul id="multi_file_attch" class="multi_file_attch" >
											</ul>
										</div>
										<div id="multi_file_attch" class="multi_file_attch">
											<c:if test="${not empty resultList.fileSeq }">
											<li id="${resultList.fileSeq }" style='width:75%;margin-bottom:5px;'>
											<i class="main_img">
												<a href="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" >${resultList.fileNm }</a>
											</i>
											<a class="tbl-btn" href="javascript:thumbnail_delete('${resultList.fileSeq }');">삭제</a></li>
											</c:if> 
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
					<div class="bd_btn_area center">
						<c:if test="${flag == 'update'}">
							<a href="#" class="btn_black" onclick="javascript:history.back()">취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
						</c:if>
						<c:if test="${flag == 'insert'}">
							<a href="/admin/portf/portfList.do?code=${resultList.code }" class="btn_black" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
						</c:if>		
						
					</div>

					<!-- //컨텐츠 영역 e -->
</form:form>