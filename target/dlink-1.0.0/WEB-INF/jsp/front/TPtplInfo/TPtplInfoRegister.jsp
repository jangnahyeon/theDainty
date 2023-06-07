<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TPtplInfoRegister.jsp
  * @Description : TPtplInfo Register 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2022-03-31
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<script type="text/javascript" src="/DLink/HTML/js/EgovMultiFiles.js"></script>
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
	
}
</script>
<div class="wrap_content">
			<!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>마이페이지</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
					<li><a href="/front/portMagmt/portInquiryList.do">기업정보관리</a></li>
				</ul>
				<!-- <div class="link_sns">
					<a href="#" class="icon_sns"><i>SNS공유</i></a>				
					<div class="sns_area">
						<ul>
							<li><a href="#" class="sns_k">카카오톡</a></li>
							<li><a href="#" class="sns_u">URL</a></li>
						</ul>
						<a href="#" class="pop_close">닫기</a>
					</div>
				</div> -->
			</div>
			<!--  타이틀 끝 -->
			<div class="contents">
				<!-- 컨텐츠 영역 -->
				
				<!-- 컨텐츠 영역 -->
				
				<div class="bd_view_thum">
					<div class="info_company mypage">
						<span class="info_item"><i><img src="../images/ex/port_logo.png" alt=""></i></span>
						<div class="info_tit">
							<strong>나의 회사명 (${comInfo.comNm })</strong>
							<p>${comInfo.comUrl }</p>
						</div>						
						<p class="info_btn"><a href="/front/privacy/infoModf" class="btn bl_gray icon_setting">회원정보 수정</a></p>
					</div>
				</div>
				
				<div class="tab_device">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" >알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do">관심정보</a></li>
						<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
							<li><a href="/front/proAgency/infoMagmt.do" class="on">기업정보관리</a></li>
						<%if(("CP0002").equals(loginVO.getUserType())){ %>
							<li><a href="/front/privacy/infoModf.do">개인정보관리</a></li>
						<%} %>
						
					</ul>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/proAgency/infoMagmt.do">업체정보관리</a></li>
						<li><a href="/front/portMagmt/portInquiryList.do" class="on">포트폴리오관리</a></li>
					</ul>
				</div>
				
				<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
				<section class="tab_content">
					<!-- 포트폴리오 -->
					<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
					<table class="tbl_basic bd_proposal">
						<caption>포트폴리오 등록테이블로 관련 정보를 입력합니다.</caption>
						<colgroup>
							<col class="bd_biz_reg">
							<col>
						</colgroup>
						<tbody>
							<!-- 임시 -->
							<!-- <tr>
								<th scope="row" class="tbl_name"><label for="name">이름<span class="tbl_star">*</span></label></th>
								<td><input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="name" autocomplete='off'></td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_title">등록코드<span class="tbl_star">*</span></label></th>
								<td><input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="data_title"></td>
							</tr> -->
							<tr>
								<th scope="row" class="tbl_name"><label for="data_cont">포트폴리오명<span class="tbl_star">*</span></label></th>
								<td><form:input path="ptplNm" cssClass="txt" maxlength="50"/></td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="keyword">연관검색어</label></th>
								<td><form:input path="refWord" cssClass="txt" maxlength="50" />
								
									<p class="mt10 f_size14">※ 등록할 검색어를 콤마(,)로 구분해서 입력합니다. 최대 5개까지만 입력 가능합니다.</p>
								</td>
							</tr>
							<tr>
							<!-- 임시 -->
							<!-- <th scope="row" class="tbl_name"><label for="ex_filename">업체</label></th>
								<td>
									<input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="ex_filename" autocomplete='off'>
								</td>
							</tr> -->
							<tr>
								<th scope="row" class="tbl_name">전문분야<span class="tbl_star">*</span></th>
								<td>
									<div class="group_tel">
										<div class="selec_area wd_45per mr5"><span class="select_btn">선택</span>
										<select id="data_div" name="ptplPart" onchange="javascript:selectPA();">
											<option value="">선택</option>
											<c:forEach var="codeListPA" items="${codeListPA}" varStatus="vs">
												<option value="${codeListPA.code}" >${codeListPA.codeNm}</option>
											</c:forEach>
										</select>
										</div>
										
										<div class="selec_area wd_45per"><span class="select_btn">선택</span>
										<select id="data_div" name="ptplYouhaeng"  onchange="javascript:selectPY();">
											<option value="">선택</option>
										</select>
										</div>
									</div>
								</td>
							</tr>
							<!-- <tr>
								<th scope="row" class="tbl_name"><label for="data_tag">로고타입</label></th>
								<td>
									<ul class="tag_checkbox" id="ptCode">
										<li><input type="checkbox" name="ptCode" id="type_1" value="" checked=""><label for="type_1" class="">전체</label></li>
										
									</ul>
									<p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_tag">소분류</label></th>
								<td>
									<ul class="tag_checkbox" id="psCode">
										<li><input type="checkbox" name="" id="type_1" value="" checked=""><label for="type_1" class="">전체</label></li>
																			
									</ul>
									<p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_tag">추가분류</label></th>
								<td>
									<ul class="tag_checkbox" id="apCode">
										<li><input type="checkbox" name="" id="type_1" value="" checked=""><label for="type_1" class="">전체</label></li>
																			
									</ul>
									<p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p>
								</td>
							</tr> -->
							<tr>
								<th scope="row" class="tbl_name">디자인 컨셉<span class="tbl_star">*</span></th>
								<td class="">									
									
									<form:textarea path="concept" cols="50" rows="5" id="data_cont" maxlength="200"/>
									<p class="f_size14">※ 최대 200글자 이하까지 입력 가능합니다.</p>
								</td>
							</tr>
						
							<tr>
								<th scope="col"><label for="">대표이미지<span class="tbl_star">*</span></label></th>
								<td>
									<%-- <form:hidden path="fileSeq"/> --%>
									<form:hidden path="fileSeq"/>
									<div class="area_filebox upload">
								  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
									 	<label for="attach">파일찾기</label>
										<input type="file" name="attach" id="attach" class="upload_hidden" /> 
										<a href="#none" class="upload_btn"  onclick="image_upload()">업로드</a>
										
										<ul id="attach" class="attach" >
										</ul>
									</div>
									<!-- <input type="file" name="attach" id="attach"/> <a href="#none" class="btn bg_gray_dark" onclick="image_upload()">업로드</a> -->
									<%-- <c:if test="${not empty bannerVO.fileSeq }">
									<div id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>
									<i class="main_img"><img src="/imagefile/preview.do?fileSeq=${bannerVO.fileSeq }" alt=""></i>
									<a href='/imagefile/download.do?file_no=${bannerVO.fileSeq }' class="mt_image_file">${bannerVO.fileNm }</a>
									<a class="tbl-btn" href="javascript:multi_image_delete('${bannerVO.fileSeq }');">삭제</a></div>
									</c:if> --%>
									<div id="file_attch" class="file_attch">
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
						</tbody>
					</table>
					
					<div class="bd_btn_area center">
						<button type="button" id="btnPrevStep" class="btn bl_gray" onclick="javascript:history.back();">취소</button>
						<button type="button" id="save_btn" class="btn bg_gray_dark" onclick="javascript:go_register();">등록</button>
					</div>
				</section>
				</form:form>
			</div>
		</div>
				<!-- //컨텐츠 영역 -->
			
	
<script>
/* 글 목록 화면 function */
/* function go_register() {
   	document.getElementById("detailForm").action = "<c:url value='/front/portMagmt/registerTPtplInfo.do'/>";
   	document.getElementById("detailForm").submit();		
} */

/* 포트폴리오 등록 함수 */
function go_register() {
	var ptplNm = $("#ptplNm").val(); 
	if(ptplNm == ''){
		alert("포트폴리오명을 입력해 주세요.");
		return false;
	}
	
	var ptplPart = $("select[name=ptplPart]").val();
	var ptplYouhaeng = $("select[name=ptplYouhaeng]").val();
	
	if(ptplPart == '' || ptplYouhaeng == ''){
		alert("전문분야를 선택해주세요.");
		return false;
	}
	var concept = $("#concept").val();
	if(concept == ''){
		alert("디자인 컨셉을 입력해주세요.");
		return false;
	}
	
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("대표이미지를 등록해 주세요.");
		return false;
	}
	
	
	var params = $("#detailForm").serialize();
	console.log(params);
	$.ajax({
		url : "/front/portMagmt/registerTPtplInfo.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	        	alert("저장되었습니다.");
	        	location.href="/front/portMagmt/portInquiryList.do";
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});

}

/* 대분류 선택에 따른 코드값 조회 함수 */
function selectPA() {
	var codePA = $("select[name=ptplPart]").val();
	if(codePA == null || codePA == "") {
		return false;
	}
	var arr = {};
	
	$("select[name=ptplYouhaeng] *").remove();
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePA},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	$("select[name=ptplYouhaeng]").append("<option value=''>선택</option>");
	    	$.each(arr, function(idx, val) {
	    		
	    		$("select[name=ptplYouhaeng]").append("<option value='" + val.code + "'>" + val.codeNm + "</option>");
	    		
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    } 
	});
	
}

/* PY코드 선택에 따른 로고타입 조회 함수 */
/* function selectPY() {
	var codePY = $("select[name=ptplYouhaeng]").val();
	if(codePY == null || codePY == "") {
		return false;
	}
	var arr = {};
	var num = 1;
	
	$("#ptCode *").remove();
	$("#psCode *").remove();
	$("#apCode *").remove();
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "PT"		
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<li><input type='checkbox' name='ptplType' id='type_" + num + "' value='" + val.code + "'><label for='type_" + num + "'>" + val.codeNm + "</label></li>";
	    		
	    		$("#ptCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "PS"
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<li><input type='checkbox' name='ptplStyle' id='type_" + num + "' value='" + val.code + "'><label for='type_" + num + "'>" + val.codeNm + "</label></li>";
	    		
	    		$("#psCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "AP"
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<li><input type='checkbox' name='addOption' id='type_" + num + "' value='" + val.code + "'><label for='type_" + num + "'>" + val.codeNm + "</label></li>";
	    		
	    		$("#apCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
} */

</script>
