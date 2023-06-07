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
  * @author 이재욱
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="flag" value="${empty resultList.imgNo ? 'insert' : 'update' }" />
<script>
function image_upload(){
	
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
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" >" +tmp2+ " </a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></li>');
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
	
	/* if($("#file_attch div").length > 0){
		alert("파일을 삭제해주세요");
		return;
	} */
	var multiFileSeq = [];
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
								+ "<input type='hidden' name='multiFileSeq' value='"+tmp1+"'>"
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" >" +tmp2+ " </a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					
					$("#multiFileSeq").val(tmp1);
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
	var imgNm = $("#imgNm").val(); 
	if(imgNm == ''){
		alert("이미지명을 입력해 주세요.");
		return false;
	}
	
	var useYn = $("#useYn").val();
	if(useYn == ''){
		alert("노출여부를을 선택해주세요.");
		return false;
	}
	
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("대표이미지를 등록해 주세요.");
		return false;
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
		        	location.href="/admin/dBank/dBankList.do";
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
		        	location.href="/admin/dBank/dBankList.do";
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}
//다중 이미지 삭제
function multi_image_delete( val){
	
	
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
						<input type="hidden" name="imgNo"value="${resultList.imgNo }">
						<!-- <h4 class="tit">소제목</h4> -->
						<table class="bd_tbl bd_tbl_view">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="con_cd1">이미지 제목</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="imgNm" class="imgNm" value="${resultList.imgNm }" maxlength="50" id="con_cd1">
									</td>
								</tr>
								
								<tr>
									<th scope="row"><label for="app_nm">노출여부</label></th>
									<td colspan="3">
									<ul class="chk_area">
										<li><input type="radio" name="useYn" value="Y" id="kind1"<c:if test="${resultList.useYn eq 'Y' }">checked</c:if>> <label for="kind1">노출</label></li>
										<li><input type="radio" name="useYn" value="N" id="kind2"<c:if test="${resultList.useYn eq 'N' }">checked</c:if>> <label for="kind2">노출안함</label></li>									
										<%-- <li>
											<form:radiobutton path="openYn" value="Y" />
											<input type="radio" name="kind" value="0003" id="kind3">
											<label for="openYn">사용</label>
										</li>
										<li>
											<form:radiobutton path="openYn" value="N" />
											<label for="openYn">미사용</label>
										</li> --%>
									</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="imgDetail">상세내용</label></th>
									<td> 
										<div>
											<textarea name="imgDetail" style="width:100%; height: 250px;" id="imgDetail">${resultList.imgDetail }</textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="col"><label for="">미리보기 이미지<span class="tbl_star">*</span></label></th>
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
											<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt="" style="width:100px; height:auto; padding-top:20px"></i>
											<%-- <a href='/imagefile/download.do?file_no=${resultList.fileSeq }' class="mt_image_file">${resultList.fileNm }</a> --%>
											<a class="tbl-btn" href="javascript:multi_image_delete('${resultList.fileSeq }');">삭제</a></li>
											</c:if> 
										</div>
									</td>
								</tr>
								<tr>
								<th scope="col"><label for="">기타이미지</label></th>
								<td>
									<%-- <form:hidden path="multiFileSeq"/> --%>
									<div class="area_filebox upload">
								  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
									 	<label for="multi_attach">파일찾기</label>
										<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
										<a href="#none" class="upload_btn"  onclick="multi_image_upload()">업로드</a>
										
										<ul id="multi_file_attch" class="multi_file_attch" >
										</ul>
									</div>
									<!-- <input type="file" name="multi_attach" id="multi_attach"/> <a href="#none" class="btn bg_gray_dark"  onclick="multi_image_upload()">업로드</a> -->
									<%-- <c:if test="${not empty bannerVO.fileSeq }">
									<div id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>
									<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${bannerVO.fileSeq }" alt=""></i>
									<a href='/imagefile/download.do?file_no=${bannerVO.fileSeq }' class="mt_image_file">${bannerVO.fileNm }</a>
									<a class="tbl-btn" href="javascript:multi_image_delete('${bannerVO.fileSeq }');">삭제</a></div>
									</c:if> --%>
									<div id="multi_file_attch" class="" >
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
							<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
							<a href="/admin/dBank/dBankList.do" class="btn_black">목록</a>
						</c:if>
						<c:if test="${flag == 'insert'}">
							<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
							<a href="/admin/dBank/dBankList.do" class="btn_black">목록</a>
						</c:if>		
						
					</div>

					<!-- //컨텐츠 영역 e -->