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
<c:set var="flag" value="${empty resultList.dsnSeq ? 'insert' : 'update' }" />
<script>
function image_upload(){
	var code = $('input[name=code]:checked').val();
	
	if (code == null || code == 'undefined') {
		alert("파일타입을 먼저 선택해주세요");
		return;
	} else if(code == '0001') {
		if ($('#attach').val() != null) {
			var ext = $('#attach').val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['zip', 'egg']) == -1) {
				alert('압축파일만 업로드 가능합니다');
				return;
			}
		}
	} else if(code == '0002'){
		if ($('#attach').val() != null) {
			var ext = $('#attach').val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
				alert('이미지 파일만 업로드 가능합니다');
				return;
			}
		} 
	} else if(code == '0003') {
		if ($('#attach').val() != null) {
			var ext = $('#attach').val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['mp4', 'mov', 'qt']) == -1) {
				alert('동영상 파일만 업로드 가능합니다');
				return;
			}
		}
	} 

	
	
	var formData = new FormData();
	formData.append("file", $("input[name=attach]")[0].files[0]);

	if ($("#attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
	/* if ($('#attach').val() != null) {
		var ext = $('#attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
	} */
	
	if($("#file_attch li").length > 0){
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
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" id=\"fileNm\" >"+tmp2+"</a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:file_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					$("#fileSeq").val(tmp1);
					alert('파일이 정상적으로 등록되었습니다');
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
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" >" +tmp2+ " </a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:thumbnail_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					$("#thumFileSeq").val(tmp1);
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
	var dsnNm = $("#dsnNm").val(); 
	if(dsnNm == ''){
		alert("제목을 입력해 주세요.");
		return false;
	}
	var detail = $("#detail").val(); 
	if(detail == ''){
		alert("상세내용을 입력해주세요.");
		return false;
	}
	
	var useYn = $('input[name=useYn]').is(":checked");
	if(!useYn){
		alert("노출여부를 선택해주세요.");
		return false;
	}
	var code = $('input[name=code]:checked').val();
	if (code == null || code == 'undefined') {
		alert("타입을 선택해주세요.");
		return false;
	}
	
	
	var thumFileSeq = $("#thumFileSeq").val();
	if(thumFileSeq == ''){
		alert("미리보기 이미지를 등록해주세요.");
		return false;
	}
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("대표 첨부파일을 등록해주세요.");
		return false;
	}
	 var fileNm = $("#fileNm").text();
	 fileNm = fileNm.trim();
	if(code == '0001') {
		var ext = fileNm.split('.').pop().toLowerCase();
		if($.inArray(ext, ['zip', 'egg']) == -1) {
			alert('압축파일만 업로드 가능합니다.\n타입 선택을 확인해주세요.');
			return;
		}
	} else if(code == '0002'){
		var ext = fileNm.split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다.\n타입선택을 확인해주세요.');
			return;
		}
		
	} else if(code == '0003') {
		var ext = fileNm.split('.').pop().toLowerCase();
		if($.inArray(ext, ['mp4', 'mov', 'qt']) == -1) {
			alert('동영상 파일만 업로드 가능합니다.\n타입선택을 확인해주세요.');
			return;
		}
		
	} 
	
	var params = $("#detailForm").serialize();
	console.log(params);
	var flag = "${flag}";
	if(flag == 'insert') {
		$.ajax({
			url : "/admin/dBank/dBankAddAct.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("저장되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/dBank/pkDsnList.do";
		        	} else if(code == '0002') {
		        		location.href="/admin/dBank/imgDsnList.do";
		        	} else if(code == '0003') {
		        		location.href="/admin/dBank/vidDsnList.do";
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	} else if (flag == 'update') {
		$.ajax({
			url : "/admin/dBank/dBankUpdateAct.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("수정되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/dBank/pkDsnList.do";
		        	} else if(code == '0002') {
		        		location.href="/admin/dBank/imgDsnList.do";
		        	} else if(code == '0003') {
		        		location.href="/admin/dBank/vidDsnList.do";
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}

function file_delete( val){
	
	
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
	
	$.ajax({
		url : "/admin/dBank/deleteImg.do",
		data : formData ,
		processData : false,
		contentType : false,
		async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				if(res == "Y") {
					$("#"+val).remove();
					
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
					$("#thumFileSeq").val('');
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
	
	$.ajax({
		url : "/admin/dBank/deleteImg.do",
		data : formData ,
		processData : false,
		contentType : false,
		async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				if(res == "Y") {
					$("#"+val).remove();
					
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

</script>
					<!-- 컨텐츠 영역 s -->
					<p class="mb10 left"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
					<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
						<input type="hidden" name="dsnSeq"value="${resultList.dsnSeq }">
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
										<input type="text" name="dsnNm" id="dsnNm" value="${resultList.dsnNm }" maxlength="50" id="con_cd1">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="detail">상세내용 <span class="tbl_star">*</span></label></th>
									<td> 
										<div>
											<textarea name="detail" style="width:100%; height: 250px;" id="detail" maxlength="200" >${resultList.detail }</textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">노출여부 <span class="tbl_star">*</span></label></th>
									<td colspan="3">
									<ul class="chk_area">
										<li><input type="radio" name="useYn" value="Y" id="kind1"<c:if test="${resultList.useYn eq 'Y' }">checked</c:if>> <label for="kind1">노출</label></li>
										<li><input type="radio" name="useYn" value="N" id="kind2"<c:if test="${resultList.useYn eq 'N' }">checked</c:if>> <label for="kind2">노출안함</label></li>									
									</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">타입 선택 <span class="tbl_star">*</span></label></th>
									<td colspan="3">
									<ul class="chk_area">
										<li><input type="radio" name="code" value="0001" id="code1"<c:if test="${resultList.code eq '0001' }">checked</c:if>> <label for="code1">패키지디자인</label></li>
										<li><input type="radio" name="code" value="0002" id="code2"<c:if test="${resultList.code eq '0002' }">checked</c:if>> <label for="code2">이미지</label></li>
										<li><input type="radio" name="code" value="0003" id="code3"<c:if test="${resultList.code eq '0003' }">checked</c:if>> <label for="code3">영상</label></li>									
									</ul>
									</td>
								</tr>
								<tr>
									<th scope="col"><label for="">미리보기 이미지<span class="tbl_star">*</span></label></th>
									<td>
										<form:hidden path="thumFileSeq"/>
										<div class="area_filebox upload">
									  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										 	<label for="multi_attach">파일찾기</label>
											<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
											<a href="#none" class="upload_btn"  onclick="thumbnail_image()">업로드</a>
											
											<ul id="multi_file_attch" class="multi_file_attch" >
											</ul>
										</div>
										<div id="multi_file_attch" class="multi_file_attch">
											<c:if test="${not empty resultList.thumFileSeq }">
											<li id="${resultList.thumFileSeq }" style='width:75%;margin-bottom:5px;'>
											<i class="main_img">
												<%-- <img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt="" style="width:100px; height:auto; padding-top:20px"> --%>
												<a href="/imagefile/preview.do?fileSeq=${resultList.thumFileSeq }" >${resultList.thumFileNm }</a>
											</i>
											<%-- <a href='/imagefile/download.do?file_no=${resultList.fileSeq }' class="mt_image_file">${resultList.fileNm }</a> --%>
											<a class="tbl-btn" href="javascript:thumbnail_delete('${resultList.thumFileSeq }');">삭제</a></li>
											</c:if> 
										</div>
									</td>
								</tr>
								<tr>
									<th scope="col"><label for="">대표 첨부파일<span class="tbl_star">*</span></label></th>
									<td>
										<form:hidden path="fileSeq"/>
										<div class="area_filebox upload">
									  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										 	<label for="attach">파일찾기</label>
											<input type="file" name="attach" id="attach" class="upload_hidden" /> 
											<a href="#none" class="upload_btn"  onclick="image_upload()">업로드</a>
											
											<ul id="attach" class="attach" >
											</ul>
										</div>
										<div id="file_attch" class="file_attch">
											<c:if test="${not empty resultList.fileSeq }">
											<li id="${resultList.fileSeq }" style='width:75%;margin-bottom:5px;'>
											<i class="main_img">
												<a href="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" id="fileNm">${resultList.fileNm }</a>
												<%-- <c:if test="${resultList.fileType eq 'img' }">
													<img src="/imagefile/preview.do?fileSeq=${imgList.fileSeq }" alt="" style="width:100px; height:auto; padding-top:20px"/>
												</c:if>
												<c:if test="${resultList.fileType eq 'video' }">
													<video src="/imagefile/preview.do?fileSeq=${imgList.fileSeq }" alt="" style="width:100px; height:auto; padding-top:20px">
												</c:if>
												<c:if test="${resultList.fileType eq 'illust' }">
													<a href="/imagefile/preview.do?fileSeq=${imgList.fileSeq }" >${imgList.fileNm }</a>
												</c:if> --%>
											</i>
											<%-- <a href='/imagefile/download.do?file_no=${resultList.fileSeq }' class="mt_image_file">${resultList.fileNm }</a> --%>
											<a class="tbl-btn" href="javascript:file_delete('${resultList.fileSeq }');">삭제</a>
											</li>
											</c:if> 
										</div>
									</td>
								</tr>
								

								<!-- <tr>
									<th scope="row"><label for="ex_filename">이미지 첨부</label></th>
									<td colspan="3">
										<div class="area_filebox">
											<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
											<label for="ex_filename">파일찾기</label>
											<input type="file" id="ex_filename" class="upload_hidden">
										</div>
										<p class="cl_blue">※ 파일용량  100mb 이하</p>
									</td>
								</tr> -->
							</tbody>
						</table>
					</form:form>
						
					<div class="bd_btn_area center">
						<c:if test="${flag == 'update'}">
							<a href="#" class="btn_black line_orange" onclick="javascript:history.back()">취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
						</c:if>
						<c:if test="${flag == 'insert'}">
							<a href="javascript:history.back()" class="btn_black btn_list" >목록</a>
							<a href="/admin/dBank/dBankAdd.do" class="btn_black line_orange" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
						</c:if>		
						
					</div>

					<!-- //컨텐츠 영역 e -->