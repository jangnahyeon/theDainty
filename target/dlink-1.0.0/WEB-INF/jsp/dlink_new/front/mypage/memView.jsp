<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%

 /**
  * @Class Name : sisulRsvList. jsp
  * @Description : sisulRsvList 화면
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

<c:if test="${frontLoginVO.code eq '0003' }">

</c:if>

<c:set var="smBizFileSeqYn" value="N" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/mypage/sisulRsvList.do'/>";
   	document.getElementById("listForm").submit();
}

function fn_write() {
	<c:if test="${empty frontLoginVO }">
		fn_login();
		return;
	</c:if>
	
	<c:if test="${not empty frontLoginVO }">
		location.href = "/front/dsnStd/sisulRsvBoardForm.do";
	</c:if>
}

$(function(){
	$(".cl_red").hide();
	
	<c:if test="${frontLoginVO.smsYn eq 'Y' }">
		$("#smsYn").attr( "checked", true );
	</c:if>
	
	<c:if test="${frontLoginVO.emailYn eq 'Y' }">
		$("#emailYn").attr( "checked", true );
	</c:if>
});

function fn_memPw_change() {
	var memPw = $("#memPw").val();	
	var memPw2 = $("#memPw2").val();
	
	if(!memPw) {
		return;
	}
	
	if(!memPw2) {
		return;
	}
	
	if( memPw != memPw2 ) {
		$(".cl_red").show();
	} else {
		$(".cl_red").hide();
	}
}

function fn_post_code( id ) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            console.log(data);
            
            $(id).val( data.address );
        }
    }).open();
}

function fn_file_upload( fileId, fileNmId, fileSeqId ) {
	var file = $(fileId);
	var fileNm = $(fileNmId);
	var fileSeq = $(fileSeqId);
	
	var formData = new FormData();
	
	for( var i = 0; i < file[0].files.length; i++ ) {
		formData.append( "file" + i, file[0].files[i] );
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
			console.log(res);
			
			if("Y" == res.result) {
				res.fileList.forEach(function(file) {
					console.log( "fileSeq : " + file.fileSeq );
					
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

function fn_validate( id, name, guide ) {
	var val = $(id).val();
	if(!val) {		
		if(guide) {
			alert(name + " " + guide);
		} else {
			alert(name + " 입력해 주세요.");
		}
		
		$(id).focus();
		
		return false;
	}
	
	return true;
}

function fn_go_prev() {
	//location.href = "/front/join/joinMember2.do";
	history.back();
}

function fn_join_act() {
	/* var memId = $("#memId").val();
	if(!memId) {
		alert("아이디를 입력해주세요");
		$("#memId").focus();
		return;
	}
	
	var id_check = $("#id_check").val();
	if("Y" != id_check) {		
		alert("아이디 중복확인 해주세요.");
		$("#id_check_btn").focus();
		return;
	} */
	
	var memPw = $("#memPw").val();
	/* if(!memPw) {
		alert("비밀번호를 입력해 주세요.");
		$("#memPw").focus();
		return;
	} */
	
	var memPw2 = $("#memPw2").val();
	/* if(!memPw2) {
		alert("비밀번호를 확인해 주세요.");
		$("#memPw2").focus();
		return;
	} */
	
	if( memPw != memPw2 ) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#memPw2").focus();
		return;
	}
	
	var regexPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,19}$/;
	if(memPw != "" || memPw2 != ""){
		if( !regexPw.test(memPw) ) {
			alert("비밀번호는 6~20자의 영문, 숫자, 특수문자의 조합으로 입력해주세요.");
			$("#memPw").focus();
			return;
		}
	}
	
	/* if( !fn_validate("#memNm", "이름을") ) {
		return;
	} */
	
	if( !fn_validate("#hp_1", "휴대전화를") ) {
		return;
	}
	
	if( !fn_validate("#hp_2", "휴대전화를") ) {
		return;
	}
	
	if( !fn_validate("#hp_3", "휴대전화를") ) {
		return;
	}
	
	var hp = $("#hp_1").val() + "-" + $("#hp_2").val() + "-" + $("#hp_3").val();
	$("#hp").val( hp );
	
	if( !fn_validate("#email_1", "이메일을") ) {
		return;
	}
	
	if( !fn_validate("#email_2", "이메일을") ) {
		return;
	}
	
	var email = $("#email_1").val() + "@" + $("#email_2").val();
	$("#email").val( email );
	
<c:if test="${frontLoginVO.code eq '0003' }">
	if( !fn_validate("#comAddr", "사업장주소를") ) {
		return;
	}
	
	if( !fn_validate("#comAddrDtl", "사업장상세주소를") ) {
		return;
	}
	
	if( !fn_validate("#comFileSeq", "사업자등록증을", "첨부해 주세요.") ) {
		return;
	}
	
	<c:if test="${smBizFileSeqYn eq 'Y' }">
		if( !fn_validate("#smBizFileSeq", "중소상공인확인서를", "첨부해 주세요.") ) {
			return;
		}
	</c:if>
</c:if>
	
	var data = $("#joinForm").serialize();
	
	//console.log( data );
	
	//return;
	
	$.ajax({
		url : "/front/mypage/memView_act.do",
		data : data,
		method : "post",
		success : function(res) {
			if("Y" == res) {
				alert("회원정보가 수정되었습니다.");
				//location.href = "/front/join/joinMember4.do";
				location.reload();
			} else {
				alert("회원정보 수정에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("회원정보 수정에 실패하였습니다..");
		}
		
	});
}
</script>

<form name="joinForm" id="joinForm" action="" method="post">
	<input type="hidden" name="hp" id="hp" />
	<input type="hidden" name="email" id="email" />
	
	<c:if test="${frontLoginVO.code eq '0003' }">
		<input type="hidden" name="comFileSeq" id="comFileSeq" value="${frontLoginVO.comFileSeq }"/>
		<c:if test="${smBizFileSeqYn eq 'Y' }">
			<input type="hidden" name="smBizFileSeq" id="smBizFileSeq" value="${frontLoginVO.smBizFileSeq }" />
		</c:if>
	</c:if>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				<div class="bd_view_thum">
					<div class="info_company mypage">
						<div class="info_tit">
							<strong>${frontLoginVO.memNm } (${frontLoginVO.memId }님)</strong>
							<p></p>
						</div>						
						<!-- <p class="info_btn"><a href="#" class="btn bl_gray icon_setting">회원정보 수정</a></p> -->
					</div>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/mypage/memView.do" class="on">회원정보 수정</a></li>
						<li><a href="/front/mypage/memOut.do">회원 탈퇴</a></li>
					</ul>
				</div>
				<h3>회원정보 수정</h3>
				
				<div class="wirte_container_con">
						<div class="wirte_container_con_inner">	
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">아이디 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										${frontLoginVO.memId }
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">이름<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										${frontLoginVO.memNm }
									</div>
								</div>
							</div>							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="birth">생년월일</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="birth" value="${frontLoginVO.birth }" id="birth" required="" class="input01" size="10" maxlength="20">
									</div>
								</div>
							</div>
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memPw">비밀번호 변경<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="password" name="memPw" value="" id="memPw" required="" class="input01" size="10" maxlength="20" placeholder="6~20자의 영문, 숫자, 특수문자의 조합" onkeyup="fn_memPw_change();">
									</div>
								</div>
							</div>
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memPw2">비밀번호 변경 확인<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="password" name="memPw2" value="" id="memPw2" required="" class="input01" size="10" maxlength="20" onkeyup="fn_memPw_change();">
									</div>
									<p class="cl_red">비밀번호가 일치하지 않습니다.</p>
								</div>
							</div>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="hp1">휴대전화<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">   
											
											<c:set var="hp" value="${fn:split(frontLoginVO.hp,'-') }"/>
										     
											<div class=" item_filter">
												<input type="text" name="hp_1" value="${hp[0] }" id="hp_1" required="" class="input01" size="3" maxlength="3">
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="hp_2" value="${hp[1] }" id="hp_2" required="" class="input01" size="4" maxlength="4">
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="hp_3" value="${hp[2] }" id="hp_3" required="" class="input01" size="4" maxlength="4">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="email1">이메일<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">        
										
											<c:set var="email" value="${fn:split(frontLoginVO.email,'@') }"/>
											
											<div class=" item_filter">
												<input type="text" name="email_1" value="${email[0] }" id="email_1" required="" class="input01" size="3" maxlength="3">
											</div>
											<span class="txt_dash">@</span>
											<div class=" item_filter" style="">
												<input type="text" name="email_2" value="${email[1] }" id="email_2" required="" class="input01" size="4" maxlength="4">
											</div>
											<div class=" item_filter" style="">
												<div class="selec_area"><span class="select_btn">직접입력 </span>
													<select id="" name="" onchange="$('#email_2').val( $(this).val() );">
														<option value="">직접입력</option>
														<option value="chollian.net">chollian.net</option>
														<option value="daum.net">daum.net</option>
														<option value="dreamwiz.com">dreamwiz.com</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="addr">주소 </label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="addr" value="${frontLoginVO.addr }" id="addr" required="" class="input01" size="10" maxlength="20" placeholder="">
										<button type="button" id="email_cert" class="com_btn" onclick="fn_post_code( '#addr' );">우편번호찾기</button>
										<input type="text" name="addrDtl" value="${frontLoginVO.addrDtl }" id="addrDtl" required="" class="input01 mt5" size="10" maxlength="20" placeholder="">
										<!-- <input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder=""> -->
									</div>
								</div>
							</div>
							
						<c:if test="${frontLoginVO.code eq '0003' }">
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_subject">사업장주소 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="comAddr" value="${frontLoginVO.comAddr }" id="comAddr" required="" class="input01" size="10" maxlength="20" placeholder="">
										<button type="button" id="comAddr_btn" class="com_btn" onclick="fn_post_code( '#comAddr' );">우편번호찾기</button>
										<input type="text" name="comAddrDtl" value="${frontLoginVO.comAddrDtl }" id="comAddrDtl" required="" class="input01 mt5" size="10" maxlength="20" placeholder="">
									</div>
								</div>
							</div>
							
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_name">사업자등록증 첨부<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content file">
									<div class="wirte_content_inner">
										<input type="text" id="comFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." value="${comFileVO.fileNm }">
										<label for="comFile">파일찾기</label>
										<input type="file" id="comFile" class="upload_hidden" multiple="multiple" onchange="fn_file_upload( '#comFile', '#comFileNm', '#comFileSeq' );">
									</div>
								</div>
							</div>
							
							<c:if test="${smBizFileSeqYn eq 'Y' }">
								<div class="wirte_container"><!-- 기업회원일 경우 -->
									<div class="wirte_tit">
										<label for="wr_name">중소상공인확인서 첨부<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content file">
										<div class="wirte_content_inner">
											<input type="text" id="smBizFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." value="${smBizFileVO.fileNm }">
											<label for="smBizFile">파일찾기</label>
											<input type="file" id="smBizFile" class="upload_hidden" onchange="fn_file_upload( '#smBizFile', '#smBizFileNm', '#smBizFileSeq' );">
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="smsYn">마케팅 수신동의 </label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<ul class="gender_radio">
											<li><input type="checkbox" name="smsYn" id="smsYn" value="Y"><label for="smsYn" class="">SMS</label></li>
											<li><input type="checkbox" name="emailYn" id="emailYn" value="Y"><label for="emailYn" class="">email</label></li>
										</ul>
									</div>
								</div>
							</div>
		
						</div>					
					</div>
					<div class="bd_btn_area center">
						<button type="button" onclick="fn_go_prev();" class="mo_wd50">취소</button>
						<button type="button" onclick="fn_join_act();" class="mo_wd50 btn_black">확인</button>
					</div>
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
</form>