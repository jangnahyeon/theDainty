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
	
	if( !fn_validate("#comAddr", "사업장주소를") ) {
		return;
	}
	
	if( !fn_validate("#comAddrDtl", "사업장상세주소를") ) {
		return;
	}
	
	if( !fn_validate("#comFileSeq", "사업자등록증을", "첨부해 주세요.") ) {
		return;
	}
	
	if( !fn_validate("#smBizFileSeq", "중소상공인확인서를", "첨부해 주세요.") ) {
		return;
	}
	
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

function fn_out_act() {
	
	if( !fn_validate("#memPw", "비밀번호를") ) {
		return;
	}
	
	var checked = $("[name=outReason]").is(":checked");
	if(!checked) {
		alert("회원탈퇴이유를 선택해주세요.");
		return;
	}
	
	/* if( !fn_validate("#outReason", "회원탈퇴이유를") ) {
		return;
	} */
	
	var data = $("#joinForm").serialize();
	
	//console.log( data );
	
	//return;
	
	$.ajax({
		url : "/front/mypage/memOut_act.do",
		data : data,
		method : "post",
		success : function(res) {
			if("Y" == res) {
				alert("회원탈퇴 되었습니다.");
				//location.href = "/front/join/joinMember4.do";
				location.reload();
			} else {
				alert("회원탈퇴에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("회원탈퇴에 실패하였습니다..");
		}
		
	});
}
</script>

<form name="joinForm" id="joinForm" action="" method="post">
	<%-- <input type="hidden" name="hp" id="hp" />
	<input type="hidden" name="email" id="email" />
	<input type="hidden" name="comFileSeq" id="comFileSeq" value="${frontLoginVO.comFileSeq }"/>
	<input type="hidden" name="smBizFileSeq" id="smBizFileSeq" value="${frontLoginVO.smBizFileSeq }" /> --%>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				<div class="bd_view_thum">
					<div class="info_company mypage">
						<div class="info_tit">
							<strong>${frontLoginVO.memNm } (${frontLoginVO.memId }님)</strong>
							<!-- <p>https://kmong.com/기업 url 있니</p> -->
						</div>						
						<p class="info_btn"><a href="/front/mypage/memView.do" class="btn bl_gray icon_setting">회원정보 수정</a></p>
					</div>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/mypage/memView.do">회원정보 수정</a></li>
						<li><a href="/front/mypage/memOut.do" class="on">회원 탈퇴</a></li>
					</ul>
				</div>
				<h3>회원 탈퇴</h3>
				
				<div class="wirte_container_con">
						<div class="wirte_container_con_inner">	
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memId">아이디</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="memId" value="${frontLoginVO.memId }" id="memId" required="" class="input01" size="10" maxlength="20" readonly>
									</div>
								</div>
							</div>			
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memPw">비밀번호</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="password" name="memPw" value="" id="memPw" required="" class="input01" size="10" maxlength="20">
									</div>
								</div>
							</div>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_email">회원탈퇴이유</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<ul class="gender_radio">
											<li>
												<input type="checkbox" name="outReason" id="outReason1" value="개인정보유출 우려">
												<label for="outReason1" class="">개인정보유출 우려</label>
											</li>
											<li>
												<input type="checkbox" name="outReason" id="outReason2" value="이미지소스의 다양성">
												<label for="outReason2" class="">이미지소스의 다양성</label>
											</li>
											<li>
												<input type="checkbox" name="outReason" id="outReason3" value="전화응대 불친절">
												<label for="outReason3" class="">전화응대 불친절</label>
											</li>
											<li>
												<input type="checkbox" name="outReason" id="outReason4" value="회원가입의 실질적인 혜택이 없음">
												<label for="outReason4" class="">회원가입의 실질적인 혜택이 없음</label>
											</li>
											<li>
												<input type="checkbox" name="outReason" id="outReason5" value="잦은 시스템 에러">
												<label for="outReason5" class="">잦은 시스템 에러</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="leaveMsg">남기고 싶은 말</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<p class="focus_tit">										
											이용하면서 불편하셨던 점이나 불만사항을 알려주시면 적극 반영하여 개선하도록 하겠습니다.<br>
											그 동안 D.Link를 이용해 주셔서 감사드립니다.										
										</p>
										<textarea name="leaveMsg" cols="5" rows="8" id="leaveMsg" class="input01 textarea" maxlength="1000"></textarea>
									</div>
								</div>
							</div>
		
						</div>					
					</div>
					<div class="bd_btn_area center">
						<button type="button" onclick="history.back();" class="mo_wd50">취소</button>
						<button type="button" onclick="fn_out_act();" class="mo_wd50 btn_black">회원탈퇴</button>
					</div>
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
</form>