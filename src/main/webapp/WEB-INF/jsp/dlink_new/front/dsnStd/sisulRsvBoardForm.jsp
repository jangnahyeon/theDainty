<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

 /**
  * @Class Name : sisulRsvBoardForm. jsp
  * @Description : sisulRsvBoardForm 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-01-05
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<!-- <script type="text/javascript" src="/DLink/HTML_2023/js/EgovMultiFiles.js"></script> -->
<script>
$(document).ready(function(){
	<c:if test="${empty frontLoginVO}">
		alert("로그인 후 이용해 주세요");
		location.href = "/front/dsnStd/sisulRsvList.do";
	</c:if>
});
</script>
<c:set var="yyyy" value="${param.rsvYear}"/>
<c:set var="mm" value="${param.rsvMonth}"/>
<c:set var="dd" value="${param.rsvDay}"/>

<!-- 수정 -->

<script>

//이미지 업로드
function file_upload( fileId, fileNmId, fileSeqId ) {
	var file = $(fileId);
	var fileNm = $(fileNmId);
	var fileSeq = $(fileSeqId);
	
	var formData = new FormData();
	
	for( var i = 0; i < file[0].files.length; i++ ) {
		formData.append( "file" + i, file[0].files[i] );
	}
	

	
	if ($('#smBizFile').val() != null) {
		var ext = $('#smBizFile').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
	}
	
	$.ajax({		
		url : "/multi/file/upload.do",		
		type : "post",
		data : formData,
		cache : false,
		processData : false,
		contentType : false,
		dataType : "json",		
		success : function(res) {
			
			if("Y" == res.result) {
				res.fileList.forEach(function(file) {
					
					fileNm.val( file.fileNm );
					fileSeq.val( file.fileSeq );
				});
			} else {
				alert("파일 업로드에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("파일 업로드에 실패하였습니다..");
		}
	});
}
/* 다중이미지 업로드 */
function fn_file_upload( fileId, fileNmId, fileSeqId ) {
	var file = $(fileId);
	var fileNm = $(fileNmId);
	var fileSeq = $(fileSeqId);
	
	var formData = new FormData();
	
	
	var multi_attach = $('#multi_attach')[0].files;//.value;
	var multilength = $("#multi_attach")[0].files.length;
	var imglength = $("#multi_file_view_pop").find("img").length;
	if ($("#multi_attach")[0].files.length > 5 || imglength > 5 || multilength + imglength > 6) {
		alert("이미지는 5개까지 가능합니다.");
		return;
	} 
	
	if ($('#multi_attach').val() != null) {
		for( var i = 0; i < $("#multi_attach")[0].files.length; i++ ) {
		var file1 = multi_attach[i];
		var ext = file1.name.split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
		}
	}
	
 	if($("#multi_attach")[0].files.length = 5){
		$(".text_notice").hide();
	}
	
	for( var i = 0; i < $("#multi_attach")[0].files.length; i++ ) {
		formData.append( "file" + i, $("#multi_attach")[0].files[i] );
	}
	
	$.ajax({		
		url : "/multi/file/upload.do",		
		type : "post",
		data : formData,
		cache : false,
		processData : false,
		contentType : false,
		dataType : "json",		
		success : function(res) {
			
			if("Y" == res.result) {
				res.fileList.forEach(function(file) {
					var list_photo_src = $('#list_photo_src').clone();
					list_photo_src.show();
					
					list_photo_src.attr("id", list_photo_src.attr("id") + "_" + file.fileSeq);
					
					var testimg = list_photo_src.find("img");
					testimg.attr("src", "/imagefile/preview.do?fileSeq=" + file.fileSeq);
					
					var testa = list_photo_src.find("a");
					testa.attr("href", "javascript:multi_image_delete(\'" + file.fileSeq + "\');");
					
					$('#multi_file_list_photo').append(list_photo_src);
					/* ==================================== */
					var photo_list_src = $('#photo_list_src').clone();
					photo_list_src.show();
					
					photo_list_src.attr("id", photo_list_src.attr("id") + "_" + file.fileSeq);
					
					var img = photo_list_src.find("img");
					img.attr("src", "/imagefile/preview.do?fileSeq=" + file.fileSeq);
					img.attr("name", "fileSeq" + file.fileSeq)
											
					var input = photo_list_src.find("input");
					input.attr("name", "multiFileSeq");
					input.attr("value", file.fileSeq);
					
					var a = photo_list_src.find("a");
					a.attr( "href", "javascript:multi_image_delete(\'" + file.fileSeq + "\');" );
					
					$('#multi_file_view').append(photo_list_src);
					/* ==================================== */
					var photo_list_src_pop = $('#photo_list_src_pop').clone();
					photo_list_src_pop.show();
					
					photo_list_src_pop.attr("id", photo_list_src_pop.attr("id") + "_" + file.fileSeq);
					
					img = photo_list_src_pop.find("img");
					img.attr("src", "/imagefile/preview.do?fileSeq=" + file.fileSeq);
					
					a = photo_list_src_pop.find("a");
					a.attr( "href", "javascript:multi_image_delete(\'" + file.fileSeq + "\');" );
					
					$('#multi_file_view_pop').append(photo_list_src_pop);
					/* ==================================== */
					var photo_view = $("#multi_file_attch_Info").clone();
					photo_view.show();
					
					photo_view.attr("id", photo_view.attr("id") + "_" + file.fileSeq);
					
					span = photo_view.find("span");
					span.text(file.fileNm);
					
					a = photo_view.find("a");
					a.attr( "href", "javascript:multi_image_delete(\'" + file.fileSeq + "\');" );
					$("#multi_file_attch").append(photo_view);
					
					fileNm.val( file.fileNm );
					fileSeq.val( file.fileSeq );
				});
			} else {
				alert("파일 업로드에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("파일 업로드에 실패하였습니다..");
		}
	});
}

//다중 이미지 삭제
function multi_image_delete(val){
	
	
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


function multi_image_delete(fileSeq) {
	var photo_list = $("#photo_list_src" + "_" + fileSeq);
	photo_list.remove();
	$(photo_list).remove();
	/* $('#multi_file_view').remove(photo_list); */
	
	var photo_list_pop = $("#photo_list_src_pop" + "_" + fileSeq);
	photo_list_pop.remove();
	$(photo_list_pop).remove();
	/* $('#multi_file_view_pop').remove(photo_list_pop); */
	
	var multi_file_attch_Info = $("#multi_file_attch_Info" + "_" + fileSeq);
	multi_file_attch_Info.remove();
	$(multi_file_attch_Info).remove();
	/* $('#multi_file_attch').remove(multi_file_attch_Info); */
	
	var list_photo = $("#list_photo_src" + "_" + fileSeq);
	list_photo.remove();
	$(list_photo).remove();
}


function chkUsr(codeNm) {
	var usrType = '${frontLoginVO.code}';
	if(usrType == '0002' && codeNm == '중소기업 제품 촬영 지원') {
		alert("개인회원은 셀프 스튜디오 이용을 선택해주세요.");
		 $("input[type=radio][name=rsvGbCd]").prop('checked', false);
	}

}
</script>
		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
			
				<div class="tab_group">
					<ul class="tab_wrap">
						  <li><a href="/front/dsnStd/sisulRsv.do" class="" data="cs01"><span>예약현황</span></a></li>
						  <li><a href="/front/dsnStd/sisulRsvList.do" class="ov" data="cs02" ><span>예약게시판</span></a></li>
					</ul>
				</div>
				
				<h3>예약게시판</h3>
				
				<div class="bgcont_box icon_reserve">
					<ul>
						<li>※ 예약 현황(달력)을 참고하신 후 작성 바랍니다.</li>
						<li>※ 스튜디오 이용 유의사항 확인 부탁드립니다.</li>
						<li>※ 예약 가능한 날짜는 오늘 날짜보다 최소 14일 이후에 가능합니다.</li>
						<li>※ 보내주신 신청서 검토 후 1~2일 내에 연락을 드리며 통화가 되지 않을 시 취소될 수 있습니다.</li>
						<li>※ 예약 확정 후에는 작성자가 신청 내용을 수정할 수 없습니다.</li>
					</ul>
				</div>
				
				<form id="sisulRsvForm" name="sisulRsvForm" action="/front/dsnStd/addSisulRsv.do" method="post">
				
				<!-- 시설번호 추가시 변경 -->
					<input id="sisulSeq" name="sisulSeq" value="1" type="hidden"/>
				<!-- 시설번호 추가시 변경 -->
					<input id="memId" name="memId" value="${frontLoginVO.memId}" type="hidden"/>
					<input id="memSeq" name="memSeq" value="${frontLoginVO.memSeq}" type="hidden"/>
					<input id="regId" name="regId" value="${frontLoginVO.memId}" type="hidden"/>
					<input id="updId" name="updId" value="${frontLoginVO.memId}" type="hidden"/>
					
					<!-- 수정 -->
					<input id="title" name="title" type="hidden"/>
				
				<div class="wirte_container_con">
					<div class="wirte_container_tit">
						<h4 class="tit">기본정보 입력<span><input type="radio" name="gender" id="secret" value="" checked><label for="secret" class="">비밀글</label></span></h4>
						<strong class="req"><b>*</b> 필수 항목입니다.</strong>
					</div>
					<div class="wirte_container_con_inner">	
						
<!-- 					수정
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_subject">제목<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input id="title" name="title" class="input01" placeholder="예) 0000년 00월 00일(수) 오전 00~00시 예약합니다" type="text" value="" size="10" maxlength="19"/>
								</div>
							</div>
						</div> -->
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">구분<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${codelist.gbCd == 'plt008'}">
											<li><input type="radio" name="rsvGbCd" id="${codelist.codeNm}" value="${codelist.code}" onclick="javascript:chkUsr('${codelist.codeNm}');"><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_subject">예약일자<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area">
											<c:if test="${not empty yyyy}"><span class="select_btn">${yyyy}년</span>
											</c:if><c:if test="${empty yyyy}"><span class="select_btn">년도 선택</span></c:if>
												 <select id="rsvYear" name="rsvYear" class="rsvYear" onchange="javascript:Date_value()"><!-- <option>년도 선택</option> --></select>
											</div>
										</div>
										<div class=" item_filter" style="">
											<div class="selec_area">
											<c:if test="${not empty mm}"><span class="select_btn">${mm}월</span>
											</c:if><c:if test="${empty mm}"><span class="select_btn">월 선택</span></c:if>
												 <select id="rsvMonth" name="rsvMonth" class="rsvMonth" onchange="javascript:Date_value()"><!-- <option>월 선택</option> --></select>
											</div>
										</div>
										<div class=" item_filter" style="">
											<div class="selec_area">
											<c:if test="${not empty dd}"><span class="select_btn">${dd}일</span>
											</c:if><c:if test="${empty yyyy}"><span class="select_btn">일 선택</span></c:if>
												 <select id="rsvDay" name="rsvDay" class="rsvDay" onchange="javascript:day_value()"><!-- <option>일 선택</option> --></select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">이용시간<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area"><span class="select_btn">시작시간 선택 </span>
												 <select id="rsvSt" name="rsvSt" class="rsvSt" onchange="javascript:end_value()"><option>시작시간 선택</option></select>
											</div>
										</div>
										<div class=" item_filter" style=""><!-- 4시간 이상 선택할 경우 alert창 >> "3시간 단위로만 예약 가능합니다" // 확인 후 주석 삭제하세요 -->
											<div class="selec_area"><span class="select_btn">종료시간 선택 </span>
												 <select id="rsvEt" name="rsvEt" class="rsvEt"><option>종료시간 선택</option></select>
												   <!-- <option value="CF004">11:00</option> -->
											</div>
										</div>
									</div>
								</div>
								<p class="notice_p bottom">※중소기업 제품 촬영 지원 : 최대 3시간  / 셀프 스튜디오 이용 : 최대 2시간</p>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 개수<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area"><span class="select_btn">개수 선택 </span>
												 <!-- <select id="" name="" class="">
												   <option value="1개">1개 </option>
												   <option value="2개">2개 </option>
												</select> -->
												<select id="prodCnt" class="prodCnt" name="prodCnt">
													<option>개수 선택</option>
													<option value="1개">1개</option>
													<option value="2개">2개</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영제품1<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input id="prod1" name="prod1" class="input01 email" placeholder="예) 감귤박스1kg(농산물)" type="text" value="" size="50" maxlength="100"/>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영제품2</label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input id="prod2" name="prod2" class="input01 email" placeholder="예) 비누1종패키지(화장품)" type="text" value="" size="50" maxlength="100"/>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 크기<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${codelist.gbCd == 'plt002'}">
											<li><input type="radio" name="prodSizeCd" id="${codelist.codeNm}" value="${codelist.codeNm}"><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 반사유무<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${codelist.gbCd == 'plt003'}">
											<li><input type="radio" name="prodRefCd" id="${codelist.codeNm}" value="${codelist.codeNm}"><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						
						<!-- 수정 추가 -->
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">식품 특성<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${codelist.gbCd == 'plt007'}">
											<li><input type="radio" name="fodChrCd" id="${codelist.codeNm}" value="${codelist.codeNm}"><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>

						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="data_cont">촬영 목적<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${codelist.gbCd == 'plt004'}">
											<li><input type="checkbox" name="purposeCd" id="${codelist.codeNm}" value="${codelist.codeNm}"><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="data_cont">세금계산서 발행 메일주소<!-- <b>*</b> --><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input type="text" name="email" id="siemail" value="" class="input01 email" size="50" maxlength="100" required="">
								</div>
							</div>
						</div>
						
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_name">중소기업확인서 파일첨부</label>
							</div>
							<div class="wirte_content file">
								<div class="wirte_content_inner">
									<input type="text" id="smBizFileNm" class="upload_name"  disabled="disabled" title="첨부파일명이 표시됩니다.">
									<label for="smBizFile">파일찾기</label>
									<input type="file" id="smBizFile" name="image_upload" class="upload_hidden"  onchange="file_upload( '#smBizFile', '#smBizFileNm', '#smBizFileSeq' );">
									<input type="hidden" id="smBizFileSeq" name="smBizFileSeq" id="smBizFileSeq">
								</div>
							</div>
						</div>
						
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_name">제품사진 파일첨부</label>
							</div>
							<div class="wirte_content">
								<div class="photo_upload">
									<ul class="photo_list" id="multi_file_view">
										<li id="photo_list_src" style="display: none;">
											<input type="hidden">
										 	<a href="" class="thumb"><img src="" class="multi_file_view" name="" width="80" height="80" alt="이미지">
											<span class="icon nicon_close delete btn_delete theme_background _deleteThumbnail"><span class="blind">삭제</span></span></a>
											</li>
									</ul>
									<ul class="list_photo" id="multi_file_list_photo">
										<li id="list_photo_src" style="display: none;">
											<a href="" class="thumb"><img src="" width="43" height="43" alt="이미지">
											<span class="icon nicon_close delete btn_delete theme_background "><span class="blind">삭제</span></span></a>
										</li>
										<li><span class="text_notice">사진등록(최대 5개)</span></li>
									</ul>

									<!-- 사진 5개 모두 등록시 추가 버튼 미노출 -->
									<a href=".photo_upload_view" onclick="showLayer(this,'.pop_modal');return false;" class="btn_add">
										<span class="icon icon_clip">
										</span>
									</a>
								</div>
							</div>
						</div>
						
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_password">비밀번호<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<!-- <input type="password" name="wr_password" id="wr_password" required="" class="input01" maxlength="20"> -->
									<input id="pwd" name="pwd" class="input01" placeholder="20자 이내" type="password" value="" maxlength="20"/>
								</div>
							</div>
						</div>
						
						<div class="wirte_container">
							<span class="custom_checkbox">
								<input type="checkbox" value="1" name="wr_agree" id="wr_agree" disabled>
								<label for="wr_agree"><strong>개인정보 수집 및 이용 동의 </strong> 동의 (필수)<b>*</b>
								<a href=".privacy_view" onclick="showLayer(this,'.pop_modal');return false;" id="wr_agree_pop">보기</a></label>
							</span>
							<span class="custom_checkbox">
								<input type="checkbox" value="1" name="wr_agree2" id="wr_agree2" disabled>
								<label for="wr_agree2"><strong>스튜디오 이용 약관  </strong> 동의 (필수)<b>*</b>
								<a href=".agreement_view" onclick="showLayer(this,'.pop_modal');return false;" id="wr_agree_pop2">보기</a></label>
							</span>
						</div>
	
					</div>					
				</div>
				
				<div class="bd_btn_area center">
					<button type="button" onclick="javascript:sisulRsv_can()" class="mo_wd50">취소</button><!-- 버튼이 두개일경우만 mo_wd50 -->
					<button type="button" onclick="javascript:sisulRsv_check()" id="insertBtn" class="mo_wd50 btn_black">등록</button>
					
				</div>
				</form>
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
						<!-- 제품사진 파일첨부 모달팝업 -->
				<div class="pop_modal photo_upload_view">
					<div class="pop_photo_upload"> 
						<h4 class="title">파일업로드</h4>
						<div class="upload_inner">
							<div class="photo_upload">
								<!-- <ul class="photo_list"> -->

								<!-- </ul> -->
								<ul class="photo_list" id="multi_file_view_pop">
									<li id="photo_list_src_pop" style="display: none;">
										<a href="#" class="thumb"><img src="" width="80" height="80" alt="이미지">
										<span class="icon nicon_close delete btn_delete theme_background _deleteThumbnail"><span class="blind">삭제</span></span></a>
									</li>
								</ul>
								<div id="" class="btn_add upload_button">
									<a href="#multi_attach" class="btn_add" id=""><span class="add_text">추가</span><span class="icon icon_clip"></a>
									<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" onchange="fn_file_upload()" multiple />
									<!-- <input type="file" style="" multiple="multiple" accept="image/*"> -->
								</div>
								<div class="file_name_list" style="/* display:none; */">
									<div class="" id="">
									<ul class="multi_file_attch" id="multi_file_attch">
										<li id="multi_file_attch_Info" style="display: none;">
											<span name="fileinfo" class="fileinfo"></span><a class="close" href="">X</a>
										</li>
									</ul>                       
									</div>
								</div>
							</div>
							<ul class="notice_list">
								<li>사진 파일은 5개, 총합 50MB까지 올릴 수 있습니다.</li>
								<li>파일 확장자가 JPG, GIF, PNG, BMP인 이미지만 올릴 수 있습니다.</li>
								<li>음란물, 저작권 침해 등의 불법적인 이미지를 올릴 경우 사전 경고 없이 삭제될 수 있으며, 동의하신 약관에 의거하여 서비스 이용이 제한 될 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<a href="#none" class="pop_close">팝업 닫기</a>
				</div>
				<!-- // 제품사진 파일첨부 모달팝업 -->
				
				<!-- 개인정보 모달팝업 -->
				<div class="pop_modal privacy_view">
					<div class="pop_privacy_view">
						<h4 class="title">개인정보 수집 및 이용, 제공 동의</h4>
						<div class="pop_inner">
							<div class="agree_wrap">
								<div class="agree_tit">* 개인정보 수집 및 이용, 제공 동의</div>
								<div class="agree_index">
									<ul class="list_type01">
										<li>1. 수집·이용 목적 : 제주 디자인 스튜디오 지원사업의 효율적(원활한) 운영</li>
										<li>2. 수집하려는 개인(기업)정보의 항목<br>
										<p class="ml10">- 성명, 이메일, 연락처(휴대전화), 주소, 회사명, 사업자번호</p></li>
										<li>3. 개인(기업)정보의 보유 및 이용, 제공 기간 : 5년</li>
										<li>4. 개인(기업)정보의 제3자 제공 동의 : 제3자(제주특별자치도) </li>
										<li>5. 개인(기업)정보 수집 동의 거부의 권리<br>
										<p class="ml10">- 제주 디자인 스튜디오의 원활한 사업 운영을 위하여 기본 정보 이외의 고유식별정보
										(개인인증을 위해 활용)를 수집하고 있으며, 제공을 원하지 않을 경우 수집하지 않으며
										미동의로 인한 불이익이 발생할 수도 있습니다.</p></li>
									</ul>

								</div>
							</div>
						</div>
					</div>
					<a href="#" class="pop_close">팝업 닫기</a>
				</div>
				<!-- //개인정보 모달팝업 -->
				
				<!-- 약관동의 모달팝업 -->
				<div class="pop_modal agreement_view">
					<div class="pop_agreement_view">
						<h4 class="title">스튜디오 이용 시 유의사항</h4>
						<div class="pop_inner">
							<div class="agree_wrap">
								<div class="agree_tit">* 스튜디오 이용 시 유의사항</div>
								<div class="agree_index">
									<ul class="list_type01">
										<li>1. 예약 후 부득이한 상황으로 취소를 원하시는 경우, 촬영예정일 기준 최소 7일 전에 취소 바랍니다.</li>
										<li>2. 촬영예정일 기준 당일~6일 전 취소하시는 경우, 6개월 간 이용에 제한이 있습니다.</li>
										<li>3. 월 최대 2회, 일 최대 3시간 이용 가능합니다. (셀프 스튜디오는 최대 2시간)</li>
										<li>4. 귀중품 분실 시 제주 디자인 스튜디오 측의 책임이 없습니다. 퇴실 시 분실물이 없는지 확인 부탁드립니다.</li>
										<li>5. 사용 중 부주의로 인한 시설물 및 소품 파손, 분실 등의 피해가 있는 경우 보상해야 합니다.</li>
										<li>6. 촬영 도중 발생한 사고와 관련하여 본 시설 운영자의 고의 또는 중과실이 있는 경우를 제외하고는 인적, 물적 손해에 대한 배상 책임을 지지 않습니다.</li>
										<li>7. 촬영한 제품을 회수하시는 경우, 촬영 결과물(사진)을 받아 보신 후 2주 이내 스튜디오 재방문 부탁드립니다.</li>
										<li>8. 촬영 결과물은 6개월 간 보관 후 폐기됩니다. (셀프 스튜디오 제외).</li>
										<li>9. 결과물의 저작권은 제주 디자인 스튜디오와 공동으로 소유하며, 본 스튜디오에서 촬영한 사진, 영상 등의 콘텐츠는 스튜디오의 홍보에 사용될 수 있습니다.</li>
										<li>10. 촬영 결과물 확인 후, 만족도 관련 설문조사 참여 부탁드립니다.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<a href="#" class="pop_close">팝업 닫기</a>
				</div>
				<!-- //약관동의 모달팝업 -->
				<div class="pop_modal_bg"></div>
		
<!-- 수정 -->
<script>
$(document).ready(function(){
	$(".pop_close").attr("href","#none");
	$("#wr_agree").prop("disabled",true);
	$("#wr_agree2").prop("disabled",true);
});
$("#wr_agree_pop").click(function(){
	$("#wr_agree").prop("disabled",false);
});
$("#wr_agree_pop2").click(function(){
	$("#wr_agree2").prop("disabled",false);
});	
</script>
<script>
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    /* var year = (now.getFullYear() + 1 > 9 ? ''+(now.FullYear() + 1) : '0'+(now.getFullYear() + 1); */
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());
    var strHours = '';
    var time = '';
    //년도 selectbox만들기
    
    	$('#rsvYear').append('<option value="년도 선택">년도선택</option>');
        $('#rsvYear').append('<option id="' + "y" + year + '" value="' + year + '">' + year + '년</option>');
	  	if("${yyyy}" != year && "${yyyy}" != ""){
			$('#rsvYear').append('<option id="' + "y" + "${yyyy}" + '" value="' + "${yyyy}" + '">' + "${yyyy}" + '년</option>');
			$("#rsvYear").val("$yyyy}년").prop("selected", true);
		}
    	<c:if test="${not empty yyyy}">
    	$("#rsvYear").val("${yyyy}").attr("selected", true);
    	</c:if>

 		if(month == 11 || month == 12){
			var year2 = year + 1;
			$('#rsvYear').append('<option id="' + "y" + year2 + '" value="' + year2 + '">' + year2 + '년</option>');
		}

    // 월별 selectbox 만들기
    $('#rsvMonth').append('<option value="월 선택">월 선택</option>');            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#rsvMonth').append('<option id="' + "m" + mm + '" value="' + mm + '">' + mm + '월</option>');    
    }
	<c:if test="${not empty mm}">
		$("#rsvMonth").val("${mm}").attr("selected", true);
	</c:if>
    
    // 일별 selectbox 만들기
    <c:if test="${not empty dd}">
	var daysm = new Date("${yyyy}", "${mm}", 0).getDate();
    $('#rsvDay').append('<option value="일 선택">일 선택</option>');
    for(var i=1; i <= daysm; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#rsvDay').append('<option id="' + "d" + dd + '" value="' + dd + '">' + dd+ '일</option>');
    }
    	$("#rsvDay").val("${dd}").attr("selected", true);
	// 시작시간 selectbox
    	var start = 0;
        for (var y = 9; y < 16; y++){
    		   	start = y;
    		   	if(start == 9){
    		   		start = '09';
    		   	}
       	        $('#rsvSt').append('<option id="' + "s" + start + '" value="' + start  + '">' + start  + ':00</option>');
       	    }
	</c:if>
	



    // 촬영품 개수 selectbox 만들기
   /*  var n = 0;
    for (i = 1; i< 11; i++) {
    	n = i;
    	$('#prodCnt').append('<option value="' + n + '개' + '">' + n + '개' + '</option>');
    } */
    
});
</script>

<script>
function Date_value(){
	var rsvYear = document.getElementById("rsvYear").value;
	var rsvMonth = document.getElementById("rsvMonth").value;
	var rsvDay = document.getElementById("rsvDay").value;
	var rsvSt = document.getElementById("rsvSt").value;
	var rsvEt = document.getElementById("rsvEt").value;
	var daysm = new Date(rsvYear, rsvMonth, 0).getDate();
	$('#rsvDay').empty();
    $('#rsvDay').append('<option value="일 선택">일 선택</option>');
    for(var i=1; i <= daysm; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#rsvDay').append('<option id="' + "d" + dd + '" value="' + dd + '">' + dd+ '일</option>');
    }
}
</script>
<script>
function day_value(){
	var rsvYear = document.getElementById("rsvYear").value;
	var rsvMonth = document.getElementById("rsvMonth").value;
	var rsvDay = document.getElementById("rsvDay").value;
	var rsvSt = document.getElementById("rsvSt").value;
	var rsvEt = document.getElementById("rsvEt").value;
	var daysm = new Date(rsvYear, rsvMonth, 0).getDate();
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var wk = week[new Date(rsvYear + "-" + rsvMonth + "-" + rsvDay).getDay()];
    
	// 시작시간 selectbox 만들기
	$('#rsvSt').empty();
	$('#rsvSt').append('<option value="' + '시작시간 선택' + '" >' + '시작시간 선택' + '</option>');

	var start = 0;
    for (var y = 9; y < 16; y++){
		   	start = y;
		   	if(start == 9){
		   		start = '09';
		   	}
   	        $('#rsvSt').append('<option id="' + "s" + start + '" value="' + start  + '">' + start  + ':00</option>');
   	    }
	<c:forEach var="sisul" items="${sisulRsvList}">
	if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "Y" == "${sisul.acceptYn}" ) {
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$("#s"+i).remove();
		}
	}
	</c:forEach>
	
	var hldDay = rsvYear + "-" + rsvMonth + "-" + rsvDay;
	<c:forEach var="hld" items="${hldList}">
	if(hldDay == "${hld.hldDt}"){
		
		for(var i = 9; i < 16; i++){
		if(i == 9){
			i = '09';
		}
		$("#s"+i).remove();
	}
		alert("${hld.hldNm}" + "이므로 예약이 불가합니다.");
		return false;
	}
	</c:forEach>
	
	if(wk == '일' || wk == '토'){
		alert("주말 및 공휴일은 예약이 불가능합니다.");
		for(var i = 9; i<16; i++){
			if(i == 9){
				i = '09';
			}
			$('#s'+i).remove();
		}
		return false;
	}
	
	if(rsvYear != "" && rsvMonth != "" && rsvDay != ""){
		var now = new Date();
		var plus7 = new Date(now);
		plus7.setDate(now.getDate()+7);
		var rsv = new Date(rsvYear + "-" + rsvMonth + "-" + rsvDay);
		if(plus7 > rsv){
			alert("예약 가능한 날짜는 오늘 날짜보다 최소 7일 이후에 가능합니다.");
			for(var i = 9; i<16; i++){
				if(i == 9){
					i = '09';
				}
				$('#s'+i).remove();
			}
			return false;
		}
	}

 }
</script>

<script>
function end_value(){
	var rsvYear = document.getElementById("rsvYear").value;
	var rsvMonth = document.getElementById("rsvMonth").value;
	var rsvDay = document.getElementById("rsvDay").value;
	var rsvSt = document.getElementById("rsvSt").value;
	var rsvEt = document.getElementById("rsvEt").value;
	$/* ('#rsvEt').empty();
	$('#rsvEt').append('<option value="' + '종료시간 선택' + '" >' + '종료시간 선택' + '</option>');
    	var y = Number(rsvSt)+3;
   	$('#rsvEt').append('<option id="' + "e" + y + '" value="' + y + '">' + y  + ':00</option>');
    <c:forEach var="sisul" items="${sisulRsvList}">
    if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "Y" == "${sisul.acceptYn}") {
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$("#e"+i).remove();
		}
    }
    </c:forEach> */
    
    $('#rsvEt').empty();
	$('#rsvEt').append('<option value="' + '종료시간 선택' + '" >' + '종료시간 선택' + '</option>');

	var start = 0;
    for (var y = 9; y < 19; y++){
		   	start = y;
		   	if(start == 9){
		   		start = '09';
		   	}
   	        $('#rsvEt').append('<option id="' + "e" + start + '" value="' + start  + '">' + start  + ':00</option>');
   	    }
	<c:forEach var="sisul" items="${sisulRsvList}">
	if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "Y" == "${sisul.acceptYn}" ) {
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$("#e"+i).remove();
		}
	}
	</c:forEach>
}
</script>

<script>
function sisulRsv_check(){
	/* var title = document.getElementById("title"); */
	var rsvYear = document.getElementById("rsvYear");
	var rsvMonth = document.getElementById("rsvMonth");
	var rsvDay = document.getElementById("rsvDay");
	var rsvSt = document.getElementById("rsvSt");
	var rsvEt = document.getElementById("rsvEt");
	var prodCnt = document.getElementById("prodCnt");
	var prod1 = document.getElementById("prod1");
	var prod2 = document.getElementById("prod2");
	var pwd = document.getElementById("pwd");
	var wrAgree = document.getElementById("wr_agree");
	var dataFile = document.getElementById("data_file");
	var multiimglength = $("#multi_file_view_pop").find("img").length;
	var siemail = document.getElementById("siemail");
	var rsvEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

	if($("input:radio[name=rsvGbCd]:checked").length < 1){
		alert("예약구분을 선택해 주세요.");
		return false;
	};
	
	if(rsvYear.value == "년도 선택"){
		alert("년도를 선택해 주세요.");
		rsvYear.focus();
		return false;
	}else if(rsvYear.value == ""){
		alert("년도를 선택해 주세요.");
		rsvYear.focus();
		return false;
	};
	if(rsvMonth.value == "월 선택"){
		alert("월을 선택해 주세요.");
		rsvMonth.focus();
		return false;
	}else if(rsvMonth.value == ""){
		alert("월을 선택해 주세요.");
		rsvMonth.focus();
		return false;
	};
	if(rsvDay.value == "일 선택"){
		alert("일을 선택해 주세요.");
		rsvDay.focus();
		return false;
	}else if(rsvDay.value == ""){
		alert("일을 선택해 주세요.");
		rsvDay.focus();
		return false;
	};
 	if(rsvSt.value == "시작시간 선택"){
		alert("시작시간을 선택해 주세요.");
		rsvSt.focus();
		return false;
	};
	if(rsvEt.value == "종료시간 선택"){
		alert("종료시간을 선택해 주세요.");
		rsvEt.focus();
		return false;
	};
	if(prodCnt.value == "개수 선택"){
		alert("촬영개수를 선택해 주세요.");
		prodCnt.focus();
		return false
	};
	if(prod1.value == ""){
		alert("촬영제품1을 입력하세요.");
		prod1.focus();
		return false;
	};	
/* 	if(prod2.value == ""){
		alert("촬영제품2을 입력하세요.");
		prod1.focus();
		return false;
	}; */
	if($("input:radio[name=prodSizeCd]:checked").length < 1){
		alert("촬영품 크기를 선택해 주세요.");
		return false;
	};
	if($("input:radio[name=prodRefCd]:checked").length < 1){
		alert("촬영품 반사유무를 선택해 주세요.");
		return false;
	};
	if($("input:radio[name=fodChrCd]:checked").length < 1){
		alert("식품특성을 선택해 주세요.");
		return false;
 	};
	if($("input:checkbox[name=purposeCd]:checked").length < 1){
		alert("촬영 목적을 선택해 주세요.");
		return false;
 	};
	/* if(siemail.value == ""){
		alert("세금계산서 발행 메일주소를 입력해주세요.");
		siemail.focus();
		return false;
	}; */
 	/* if(rsvEmail.test(siemail.value)==false){
		alert("이메일형식이 올바르지 않습니다.");
		siemail.focus();
		return false;
	}; */
	/* if(smBizFileNm.value == ""){
		alert("중소상공확인서 파일을 첨부해주세요.")
		return false;
	} */
	/* if(multiimglength < 2){
		alert("제품사진 파일을 첨부해주세요.");
		return false;
	} */
	if(pwd.value == ""){
		alert("비밀번호을 입력하세요.");
		pwd.focus();
		return false;
	};
	if($("#pwd").val().length < 3){
		alert("비밀번호을 3자 이외 20자 이내 입력해 주세요.");
		pwd.focus();
		return false;
	};
	if($("#pwd").val().length >= 20){
		alert("비밀번호을 3자 이외 20자 이내 입력해 주세요.");
		pwd.focus();
		return false;
	};
	if($("input:checkbox[name=wr_agree]:checked").length < 1){
		alert("개인정보 수집 및 이용 동의를 해주세요.");
		return false;
	};
	if($("input:checkbox[name=wr_agree2]:checked").length < 1){
		alert("스튜디오 이용 약관 동의를 해주세요.");
		return false;
	};
	if(!confirm("시설예약을 하시겠습니까?")){
		alert("예약을 취소 하였습니다.");
		return false;
	}else{
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var wk = week[new Date(rsvYear.value + "-" + rsvMonth.value + "-" + rsvDay.value).getDay()];
		var comNm = "${frontLoginVO.comNm }";
		$("#title").attr("value",  rsvYear.value + "년" + rsvMonth.value + "월" + rsvDay.value + "일" + "(" + wk + ")");
		document.sisulRsvForm.submit();
	};
};

function sisulRsv_can(){
	if(!confirm("시설예약을 취소하시겠습니까?")){
		return false;
	}else{
		alert("예약을 취소하였습니다.");
		location.href = "/front/dsnStd/sisulRsvList.do";
	}
}
</script>

<!-- <script>
function day_value(){
	var rsvYear = document.getElementById("rsvYear").value;
	var rsvMonth = document.getElementById("rsvMonth").value;
	var rsvDay = document.getElementById("rsvDay").value;
	var rsvSt = document.getElementById("rsvSt").value;
	var rsvEt = document.getElementById("rsvEt").value;     
	if(rsvYear != "" && rsvMonth != "" && rsvDay != ""){
		var now = new Date();
		var plus7 = new Date(now);
		plus7.setDate(now.getDate()+7);
		var rsv = new Date(rsvYear + "-" + rsvMonth + "-" + rsvDay);
		if(plus7 > rsv){
			alert("오늘부터 7일 이후로 선택해주세요.");
			for(var i = 9; i<16; i++){
				if(i == 9){
					i = '09';
				}
				$('#s'+i).remove();
			}
			return false;
		}
	}
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var wk = week[new Date(rsvYear + "-" + rsvMonth + "-" + rsvDay).getDay()];
	
	/* 수정 */
	$("#title").attr("value",  rsvYear + "년" + rsvMonth + "월" + rsvDay + "일" + "(" + wk + ")");
	
	if(wk == '일' || wk == '토'){
		alert("주말입니다.");
		for(var i = 9; i<16; i++){
			if(i == 9){
				i = '09';
			}
			$('#s'+i).remove();
		}
		return false;
	}
	/* else if(rsvYear == "${ma.rsvYear}" && rsvMonth == "${ma.rsvMonth}" && rsvDay == "${ma.rsvDay}"){
		alert("${ma.title}");
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$('#s'+i).remove();
		}
		return false;
	} */
/*     var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    
    if(rsvYear == year){
    	for(i = 0; i<(month); i++){
    		$("m"+i).remove();
    	}
    } */
    
	// 시작시간 selectbox 만들기
	$('#rsvSt').empty();
	$('#rsvSt').append('<option value="' + '시작시간 선택' + '" >' + '시작시간 선택' + '</option>');

	var start = 0;
    for (var y = 9; y < 16; y++){
		   	start = y;
		   	if(start == 9){
		   		start = '09';
		   	}
   	        $('#rsvSt').append('<option id="' + "s" + start + '" value="' + start  + '">' + start  + ':00</option>');
   	    }
	<c:forEach var="sisul" items="${sisulRsvList}">
	if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "Y" == "${sisul.acceptYn}" ) {
	/* 	if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "N" != "${sisul.acceptYn}" &&  "C" != "${sisul.acceptYn}" ) { */
/* 	
		수정
		var st = ${sisul.rsvSt};
		var en = ${sisul.rsvEt};
		for(var i = st; i <= en; i++){
		$("#s"+i).remove();
		} */
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$("#s"+i).remove();
		}
	}
	</c:forEach>
 }
</script> -->

<!-- <script>
function end_value(){
    // 종료시간 selectbox 만들기
	var rsvYear = document.getElementById("rsvYear").value;
	var rsvMonth = document.getElementById("rsvMonth").value;
	var rsvDay = document.getElementById("rsvDay").value;
	var rsvSt = document.getElementById("rsvSt").value;
	var rsvEt = document.getElementById("rsvEt").value;
	$('#rsvEt').empty();
	$('#rsvEt').append('<option value="' + '종료시간 선택' + '" >' + '종료시간 선택' + '</option>');
    /* for (var y = Number(rsvSt)+1; y < Number(rsvSt)+4; y++) { */
    	var y = Number(rsvSt)+3;
    	        $('#rsvEt').append('<option id="' + "e" + y + '" value="' + y + '">' + y  + ':00</option>');
    /* 	    } */
    <c:forEach var="sisul" items="${sisulRsvList}">
    if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "Y" == "${sisul.acceptYn}") {
    /* if(rsvYear == "${sisul.rsvYear}" && rsvMonth == "${sisul.rsvMonth}" && rsvDay == "${sisul.rsvDay}" && "N" != "${sisul.acceptYn}" &&  "C" != "${sisul.acceptYn}" ) { */
/* 		
 		수정
 		var st = ${sisul.rsvSt};
		var en = ${sisul.rsvEt};
		for(var i = st+1; i <= en; i++){
		$("#e"+i).remove();
		}
		*/
		
		for(var i = 9; i < 16; i++){
			if(i == 9){
				i = '09';
			}
			$("#e"+i).remove();
		}
    }
    </c:forEach>
}
</script> -->