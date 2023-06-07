<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : joinMember3. jsp
  * @Description : joinMember3 화면
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

<c:if test="${joinMemVO.code eq '0003' }">

</c:if>

<c:set var="smBizFileSeqYn" value="N" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	$(".cl_red").hide();
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
            
            //$(id).val( data.address );
            
            var addr = "(" + data.zonecode + ") " + data.address
            $(id).val( addr );
        }
    }).open();
}
</script>

<script>
function fn_id_check_act() {
	var memId = $("#memId").val();
	if(!memId) {
		alert("아이디를 입력해주세요");
		$("#memId").focus();
		return;
	}	
	
	$.ajax({
		url : "/front/join/idCheck_act.do",
		data : {
			"memId" : memId			
		},		
		method : "post",
		success : function(res) {
			
			if("Y" == res) {
				alert("사용 가능한 아이디 입니다.");	
				$("#id_check").val("Y");
			} else {
				alert("이미 사용 중인 아이디 입니다.");
				$("#memId").focus();
			}
			
		},
		error : function(err) {
			alert("아이디 중복확인에 실패하였습니다.");
		}
	});
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
	location.href = "/front/join/joinMember2.do";
}

function fn_join_act() {
	var memId = $("#memId").val();
	if(!memId) {
		alert("아이디를 입력해주세요");
		$("#memId").focus();
		return;
	}
	
	var regexId = /^[a-z]+[a-z0-9]{3,11}$/g;
	if( !regexId.test(memId) ) {
		alert("아이디는 4~12자 영문, 숫자만 사용가능합니다.");
		$("#memId").focus();
		return;
	}
	
	var id_check = $("#id_check").val();
	if("Y" != id_check) {		
		alert("아이디 중복확인 해주세요.");
		$("#id_check_btn").focus();
		return;
	}
	
	var memPw = $("#memPw").val();
	if(!memPw) {
		alert("비밀번호를 입력해 주세요.");
		$("#memPw").focus();
		return;
	}
	
	//var regexPw = /^[A-Za-z0-9]{5,19}$/;
	//var regexPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{5,19}$/;
	var regexPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,19}$/;
	if( !regexPw.test(memPw) ) {
		alert("비밀번호는 6~20자의 영문, 숫자, 특수문자의 조합으로 입력해주세요.");
		$("#memPw").focus();
		return;
	}
	
	var memPw2 = $("#memPw2").val();
	if(!memPw2) {
		alert("비밀번호를 확인해 주세요.");
		$("#memPw2").focus();
		return;
	}
	
	if( memPw != memPw2 ) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#memPw2").focus();
		return;
	}
	if('${joinMemVO.code}'== '0003') {
		if( !fn_validate("#comNm", "업체명을") ) {
			return;
		}
		
		if( !fn_validate("#comNo1", "사업자등록번호를") ) {
			return;
		}
		
		if( !fn_validate("#comNo2", "사업자등록번호를") ) {
			return;
		}
		
		if( !fn_validate("#comNo2", "사업자등록번호를") ) {
			return;
		}
		
		if( !fn_validate("#memNm", "대표자 성명을") ) {
			return;
		}
		
		if( !fn_validate("#damdangNm", "담당자 성명을") ) {
			return;
		}
		
		var comNo = $("#comNo1").val() + "-" + $("#comNo2").val() + "-" + $("#comNo3").val();
		$("#comNo").val( comNo );	
	} else {
		if( !fn_validate("#memNm", "이름을") ) {
			return;
		}
		
		if($("input:radio[name=jobGbCd]:checked").length < 1){
			alert("직업을 선택해 주세요.");
			return false;
	 	};
	}
	
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
	
	var email_1 = $("#email_1").val();
	var regexEmail_1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*/;
	if( !regexEmail_1.test(email_1) ) {
		alert("이메일 형식이 맞지 않습니다.");
		$("#email_1").focus();
		return;
	}
	
	if( !fn_validate("#email_2", "이메일을") ) {
		return;
	}
	
	var email_2 = $("#email_2").val();
	var regexEmail_2 = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if( !regexEmail_2.test(email_2) ) {
		alert("이메일 형식이 맞지 않습니다.");
		$("#email_2").focus();
		return;
	}
	
	var email = $("#email_1").val() + "@" + $("#email_2").val();
	$("#email").val( email );
	
	
<c:if test="${joinMemVO.code eq '0003' }">
	// 기업회원
	if( !fn_validate("#comAddr", "사업장주소를") ) {
		return;
	}
	
	if( !fn_validate("#comAddrDtl", "사업장상세주소를") ) {
		return;
	}
	
	var comType = $('input[name=comType]:checked').val();
	if (comType == null || comType == 'undefined') {
		alert("기업성격을 선택해주세요.");
		return false;
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
		url : "/front/join/join_act.do",
		data : data,
		method : "post",
		success : function(res) {
			if(res) {
				if("Y" == res) {
					alert("회원가입 되었습니다.");
					location.href = "/front/join/joinMember4.do";
				} else {
					switch(res) {
					case "EMAIL_EXIST":
						alert("이미 사용중인 이메일 입니다.");
						break;
						
					default:
						alert("회원가입에 실패하였습니다.");
						break;
					}					
				}
			}
		},
		error : function(err) {
			alert("회원가입에 실패하였습니다");
		}
		
	});
}
</script>

<form name="joinForm" id="joinForm" action="" method="post">
	<input type="hidden" name="id_check" id="id_check" value="N"/>
	<input type="hidden" name="hp" id="hp" />
	<input type="hidden" name="comNo" id="comNo" />
	<input type="hidden" name="email" id="email" />
	<input type="hidden" name="email_check" id="email_check" value="N"/>
	
	<c:if test="${joinMemVO.code eq '0003' }">
		<input type="hidden" name="comFileSeq" id="comFileSeq" />
		<c:if test="${smBizFileSeqYn eq 'Y' }">
			<input type="hidden" name="smBizFileSeq" id="smBizFileSeq" />
		</c:if>
	</c:if>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">
				<!-- 회원가입 -->
				<div class="join_agreement_wrap">
					<ol class="join_step_list">
						<li class="step01">
							<div><strong>01.</strong> 회원선택</div>
						</li>
						<li class="step02" title="현재 진행중">
							<div><strong>02.</strong> 약관동의</div>
						</li>
						<li class="active step03">
							<div><strong>03.</strong> 회원정보 입력</div>
						</li>
						<li class="step04">
							<div><strong>04.</strong> 회원가입 완료</div>
						</li>
					</ol>
					<div class="agree_tit">
						<p><span class="">회원정보</span> 입력</p>
					</div>
									
					<div class="wirte_container_con">
						<div class="wirte_container_tit">
							<strong class="req"><b>*</b> 필수 항목입니다.</strong>
						</div>
						<div class="wirte_container_con_inner">	
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memId">아이디 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="memId" value="" id="memId" required="" class="input01" size="10" maxlength="20" placeholder="아이디는 4~12자 영문,숫자만 사용가능">
										<button type="button" id="id_check_btn" class="com_btn" onclick="fn_id_check_act();">중복확인</button>
									</div>
								</div>
							</div>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memPw">비밀번호<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="password" name="memPw" value="" id="memPw" required="" class="input01" size="10" maxlength="20" placeholder="6~20자의 영문, 숫자, 특수문자의 조합" onkeyup="fn_memPw_change();">
									</div>
								</div>
							</div>
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="memPw2">비밀번호 확인<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="password" name="memPw2" value="" id="memPw2" required="" class="input01" size="10" maxlength="20" onkeyup="fn_memPw_change();">
									</div>
									<p class="cl_red">비밀번호가 일치하지 않습니다.</p>
								</div>
							</div>
							
							<c:if test="${joinMemVO.code eq '0003' }">
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="comNm">업체명<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
										<div class="wirte_content_inner">
											<input type="text" name="comNm" value="" id="comNm" required="" class="input01" size="10" maxlength="20">
										</div>
									</div>
								</div>
								
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="comNo">사업자등록번호<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
										<div class="wirte_content_inner">
											<div class="gourp_inp ">        
												<div class=" item_filter">
													<input type="text" name="comNo1" value="" id="comNo1" required="" class="input01" size="3" maxlength="3" >
												</div>
												<span class="txt_dash">-</span>
												<div class=" item_filter" style="">
													<input type="text" name="comNo2" value="" id="comNo2" required="" class="input01" size="2" maxlength="2">
												</div>
												<span class="txt_dash">-</span>
												<div class=" item_filter" style="">
													<input type="text" name="comNo3" value="" id="comNo3" required="" class="input01" size="5" maxlength="5">
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="memNm">대표자 성명<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
										<div class="wirte_content_inner">
											<input type="text" name="memNm" value="" id="memNm" required="" class="input01" size="10" maxlength="20">
										</div>
									</div>
								</div>
								
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="damdangNm">담당자 성명<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
										<div class="wirte_content_inner">
											<input type="text" name="damdangNm" value="" id="damdangNm" required="" class="input01" size="10" maxlength="20">
										</div>
									</div>
								</div>
							</c:if>
							
							<c:if test="${joinMemVO.code ne '0003' }">
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="memNm">이름<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
										<div class="wirte_content_inner">
											<input type="text" name="memNm" value="" id="memNm" required="" class="input01" size="10" maxlength="20">
										</div>
									</div>
								</div>
							</c:if>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="mem_birth">생년월일</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="birth" value="" id="birth" required="" class="input01" size="10" maxlength="8">
									</div>
								</div>
							</div>
							
							<c:if test="${joinMemVO.code eq '0002' }">
								<div class="wirte_container">
									<div class="wirte_tit">
										<label for="memNm">직업<b>*</b><strong class="blind">필수</strong></label>
									</div>
									<div class="wirte_content">
									<div class="wirte_content_inner">
										<ul class="gender_radio">
										<c:forEach var="codelist" items="${codelist}">
											<c:if test="${codelist.gbCd == 'plt009'}">
												<li><input type="radio" name="jobGbCd" id="${codelist.codeNm}" value="${codelist.code}" ><label for="${codelist.codeNm}" class="">${codelist.codeNm}</label></li>
											</c:if>
										</c:forEach>
										</ul>
									</div>
								</div>
								</div>
							</c:if>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_email">휴대전화<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">        
											<div class=" item_filter">
												<input type="text" name="hp_1" value="010" id="hp_1" required="" class="input01" size="3" maxlength="3" >
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="hp_2" value="" id="hp_2" required="" class="input01" size="4" maxlength="4">
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="hp_3" value="" id="hp_3" required="" class="input01" size="4" maxlength="4">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="mem_email_1">이메일<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">        
											<div class=" item_filter">
												<input type="text" name="email_1" value="" id="email_1" required="" class="input01" size="3" maxlength="20" >
											</div>
											<span class="txt_dash">@</span>
											<div class=" item_filter" style="">
												<input type="text" name="email_2" value="" id="email_2" required="" class="input01" size="4" maxlength="20">
											</div>
											<div class=" item_filter" style="">
												<div class="selec_area">
													<span class="select_btn">직접입력 </span>
													<select id="" name="" onchange="$('#email_2').val( $(this).val() );">
														<option value="">직접입력</option>
														<option value="naver.com" selected>naver.com</option>
														<option value="daum.net" selected>daum.net</option>
														<option value="gmail.com">gmail.com</option>
														<option value="nate.com">nate.com</option>
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
									<label for="wr_subject">주소 </label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="addr" value="" id="addr" required="" class="input01" size="10" maxlength="100" placeholder="">
										<button type="button" id="addr_btn" class="com_btn" onclick="fn_post_code( '#addr' );">우편번호찾기</button>
										<input type="text" name="addrDtl" value="" id="addrDtl" required="" class="input01 mt5" size="10" maxlength="100" placeholder="">
									</div>
								</div>
							</div>
							
						<c:if test="${joinMemVO.code eq '0003' }">
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_subject">사업장주소 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="comAddr" value="" id="comAddr" required="" class="input01" size="10" maxlength="100" placeholder="">
										<button type="button" id="comAddr_btn" class="com_btn" onclick="fn_post_code( '#comAddr' );">우편번호찾기</button>
										<input type="text" name="comAddrDtl" value="" id="comAddrDtl" required="" class="input01 mt5" size="10" maxlength="100" placeholder="">
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="data_cont">기업 성격<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<ul class="gender_radio">
											<li><input type="radio" name="comType" id="comType1" value="C"><label for="comType1" class="">중소기업</label></li>
											<li><input type="radio" name="comType" id="comType2" value="D"><label for="comType2" class="">디자인전문회사</label></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_name">사업자등록증 첨부<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content file">
									<div class="wirte_content_inner">
										<input type="text" id="comFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
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
											<input type="text" id="smBizFileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
											<label for="smBizFile">파일찾기</label>
											<input type="file" id="smBizFile" class="upload_hidden" onchange="fn_file_upload( '#smBizFile', '#smBizFileNm', '#smBizFileSeq' );">
										</div>
									</div>
								</div>
							</c:if>
						</c:if>
							
							<div class="wirte_container">
								<p class="member_field_agree mt20">
									<em class="pr20">SMS나 이메일로 다양한 서비스를 받아보시겠습니까?</em> 
									<input type="checkbox" id="sms_agree" name="smsYn" value="Y">
									<label for="sms_agree">sms로 받기</label>
									<input type="checkbox" id="email_disagree" name="emailYn" value="Y">
									<label for="email_disagree">email로 받기</label>
								</p>
							</div>
		
						</div>					
					</div>
					<!-- //member_cont -->
					<div class="bd_btn_area center">
						<button type="button" onclick="javascript:fn_go_prev();" class="mo_wd50">이전단계</button>
						<button type="button" onclick="javascript:fn_join_act();" class="mo_wd50 btn_black">다음단계</button>
					</div>
				</div>
				<!-- //회원가입 -->
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
</form>