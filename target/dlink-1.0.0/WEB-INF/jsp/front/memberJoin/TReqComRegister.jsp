<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="registerFlag" value="${empty registerFlag}" />
<%
 /**
  * @Class Name : TReqComRegister.jsp
  * @Description : TReqCom Register 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-11
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javaScript"  defer="defer">


var userPw = false; 
var loginId = false;
var authCheck = false;
var mobileNo = false
	

/* 이전 화면 function */
function fn_egov_selectPrev() {
   	document.getElementById("detailForm").action = "<c:url value='/front/memberJoin/cptermsAgree.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 회원가입저장 function */
function fn_egov_next() {	
	
	var registerFlag = $("#registerFlag").val();
	var urlval = "/front/memberJoin/addTReqCom.do";
	var form = document.detailForm;
	
	/* 불일치 */	
	if(!userPw){
		alert("비밀번호 확인해주세요.");
		return ;
	}
		
	if(!authCheck){
		alert("인증번호가 다릅니다. \n확인해주세요.");
		return ;
	}
	
	
	/* 필수값입력 */	
	if( form.loginId.value=="" ) { form.loginId.focus(); alert("아이디를 입력해 주십시오."); return false; }
	if( form.comNm.value=="" ) { form.comNm.focus(); alert("기업명을 입력해 주십시오."); return false; }
	if( form.comNo.value=="" ) { form.comNo.focus(); alert("법인등록 번호를 입력해 주십시오."); return false; }
	if( form.loginPwd.value=="" ) { form.loginPwd.focus(); alert("비밀번호를 입력해 주십시오."); return false; }
	if( form.ceoNm.value=="" ) { form.ceoNm.focus(); alert("대표자명을 입력해 주십시오."); return false; }
	if( form.ceoMobileNo.value=="" ) { form.ceoMobileNo.focus(); alert("대표자휴대폰 번호를 입력해 주십시오."); return false; }
	if( (form.comType[0].checked == false) && (form.comType[1].checked == false) ) { alert("기업형태를 선택해 주십시오."); return false; }
	if( (form.sex[0].checked == false) && (form.sex[1].checked == false) ) { alert("대표자성별을 선택해 주십시오."); return false; }
	if( form.multi_attach.value=="" ) { form.multi_attach.focus(); alert("대표이미지를 등록해 주십시오."); return false; }
	
	
	var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: urlval,
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("입력되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n 관리자에게 문의바랍니다.");
		        		$("#falseForm").submit();
		        		return;
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
}

/* 아이디 중복 체크 함수 */
function comIdCheck() {

 var loginId =  $("#loginId").val(); 
 
 $.ajax({
        url:'/front/memberJoin/comIdCheck.do',
        type: "POST",
        data:{loginId:loginId},
        success:function(cnt){ 
	            if(cnt != 1){ 
	            	alert("사용가능한 아이디입니다.");
	            	loginId = true;
	            } else { 
	            	alert("사용중인 아이디입니다.");
	            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
 }
	
/* 비밀번호확인 */
$(function(){
   $('#userPw').keyup(function(){
     $('#chkNotice').html('');
   });

   $('#userPwChk').keyup(function(){

       if($('#userPw').val() != $('#userPwChk').val()){
         $('#chkNotice').html('비밀번호 일치하지 않음');
         $('#chkNotice').attr('color', 'red');
         userPw = false;        
       } else{
         $('#chkNotice').html('비밀번호 일치함');
         $('#chkNotice').attr('color', 'blue');
        userPw = true; 
       }

   });
}); 

/* 비밀번호 유효성 검사 */ 
$(function(){
   $('#userPw').keyup(function(){
	   
		let id = $("#loginId").val();
	    let pw = $("#userPw").val();
	    let number = pw.search(/[0-9]/g);
	    let english = pw.search(/[a-z]/ig);
	    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

	    if (pw.length < 8 || pw.length > 20) {
         $('#PwChkNotice').html('8자리 ~ 20자리 이내로 입력해주세요.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false;        
	    } else if (pw.search(/\s/) != -1) {
         $('#PwChkNotice').html('비밀번호는 공백 없이 입력해주세요.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false; 
	    } else if (number < 0 || english < 0 || spece < 0) {
         $('#PwChkNotice').html('영문,숫자,특수문자를 혼합하여 입력해주세요.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false; 
	    } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
         $('#PwChkNotice').html('영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false; 
	    } else if (/(\w)\1\1\1/.test(pw)) {
         $('#PwChkNotice').html('같은 문자를 4번 이상 사용하실 수 없습니다.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false; 
	    } else {
    	$('#PwChkNotice').html('비밀번호가 정상적으로 입력되었습니다.');
    	$('#PwChkNotice').attr('color', 'blue');
        return true;
	    }
   });
}); 

//다중 이미지 업로드
function multi_image_upload(){
	//대표이미지 체크
	var formData = new FormData();
	var fileType = $("#searchCondition").val();
	var fileTypeNm = $("#searchCondition option:checked").text();
	formData.append("file", $("input[name=multi_attach]")[0].files[0]);
	
	
	for (var i = 0; i <$("[name=fileKind]").length; i++) {
		if($("[name=fileKind]").eq(i).val() == 'CF0001' && fileType == 'CF0001'){
			alert("대표이미지는 하나만 등록해주세요");
			return false;
		}
	};
	
	
	if ($("#multi_attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
		
	var multiFileSeq = [];
	$.ajax({
		url : "/imagefile/upload.do",
		data : formData ,
		processData : false,
		contentType : false,
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
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" > [" + fileTypeNm + "]" +tmp2+ " </a>"
								+ "<input type='hidden' name='multiFileSeq' value='"+tmp1+"'>"
								+ "<input type='hidden' name='fileKind' value='"+fileType+"'>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					alert('첨부파일이 정상적으로 등록되었습니다');
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

/* 인증번호발송 */
function AuthNmSend() {

	 var ceoMobileNo =  $("#ceoMobileNo").val(); 
	 
	 $.ajax({
	        url:'/front/userCheck.do',
	        type: "POST",
	        data:{'mobileNo':ceoMobileNo},
	        
	        success:function(alrim){ 
 	            if(alrim != 1){ 
 	            	alert("발송했습니다.");
 	            } else { 
 	            	alert("발송실패했습니다.");
 	            }
	        },
	        error:function(){
	            alert("에러입니다");
	        }
	    });
  }
/* 인증번호확인 */
function AuthNmCheck() {

	 var authNm =  $("#authNm").val(); 
	 var ceoMobileNo =  $("#ceoMobileNo").val(); 
	 
	 $.ajax({
	        url:'/front/userCheckResult.do',
	        type: "POST",
	        data:{
	        	'authNm':authNm,
	        	'mobileNo':ceoMobileNo
	        	},
	        
	        success:function(totCnt){ 
 	            if(totCnt == 1){ 
 	            	alert("인증번호가 확인되었습니다.");
 	            	authCheck = true;
 	            } else { 
 	            	alert("인증번호가 다릅니다. \n다시입력해주세요.");
 	            }
	        },
	        error:function(){
	            alert("에러에러에러");
	        }
	    });
  }

/* 휴대폰번호정규식 */
$(function(){
	
	 $('#ceoMobileNo').keyup(function(){
		 
		var mobileVal = $("#ceoMobileNo").val(); 
		var regExp =  /^01([0|1|6|7|8|9])([0-9]{7,8})$/;
		
		
		if (mobileVal.match(regExp) != null) {
			$('#chkMobile').html('사용가능합니다.');
	        $('#chkMobile').attr('color', 'blue');
	        ceoMobileNo = true;  
		 } else{
	         $('#chkMobile').html('다시입력해주세요.');
	         $('#chkMobile').attr('color', 'red');
	         ceoMobileNo = false; 
		}
		
	 });
});

   
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/front/memberJoin/joinCmplt.do">	
</form:form>
<form:form name="falseForm" id="falseForm" method="post" action="/front/memberJoin/addTReqComView.do">	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TReqComVO" name="detailForm" id="detailForm" >
<form:hidden path="registerFlag" value="${registerFlag}"/>

	<div class="wrap_content">
		<!-- 회원가입 -->
		<div class="join_agreement_wrap">
			<ol class="join_step_list">
				<li class="step00">
					<div><strong>01.</strong> 회원선택</div>
				</li>
				<li class="step01">
					<div><strong>02.</strong> 약관동의</div>
				</li>
				<li class="active step02" title="현재 진행중">
					<div><strong>03.</strong> 회원정보 입력</div>
				</li>
				<li class="step03">
					<div><strong>04.</strong> 회원가입 완료</div>
				</li>
			</ol>
			<div class="agree_tit">
				<p>기업회원정보입력</p>
			</div>
							
			<div class="member_content">
				<form id="formTerms" name="formTerms" method="post" action="">  
					<div class="join_agreement_cont">
						<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
						<table class="tbl_basic mt10">
							<caption>회원정보 입력
								<p>회원가입을 위한 회원정보를 입력하는 표로 <span class="tbl_star">*</span>는 필수 입력 요소입니다.</p>
							</caption>
							<colgroup>
								<col width="25%">
								<col width="auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="loginId">아이디<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input path="loginId" cssClass="txt fxw" maxlength="50" /><form:errors path="loginId" />										
										<button onclick="javascript:comIdCheck();" type="button" class="btn st_small" >중복확인</button>	
										<span id="result" class="infotext">아이디는 사업자번호만 가능합니다. 예시)123-11-12345</>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="comNm">기업명<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="comNm" path="comNm" name="comNm" type="text" cssClass="txt fxw" maxlength="50" /><form:errors path="comNm" />	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="comType">기업형태<span class="tbl_star">*</span></label></th>
									<td>	
										<ul>
											<li style="float:left;">
												<form:radiobutton path="comType" value="MG0001" />
												<label for="comType1">법인</label>
											</li>
											<li>
												<form:radiobutton path="comType" value="MG0002" />
												<label for="comType2">개인</label>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="comNo">법인등록번호<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="comNo" path="comNo" name="comNo" type="text" cssClass="txt fxw" maxlength="50" /><form:errors path="comNo" />	
									</td>
								</tr>
								<tr>
								<th scope="row"><label for="loginPwd">비밀번호<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="userPw" path="loginPwd" name="loginPwd" type="password" cssClass="txt fxw" maxlength="50" /><form:errors path="loginPwd" />
										<br><font id="PwChkNotice" style="font:15px;"></font>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="userPwChk">비밀번호 확인<span class="tbl_star">*</span></label></th>
									<td class="left">
										<input id="userPwChk" type="password" Class="txt fxw" maxlength="50" />
										<br><font id="chkNotice" style="font:15px;"></font>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ceoNm">대표자명<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="ceoNm" path="ceoNm" cssClass="txt fxw" maxlength="50" /><form:errors path="ceoNm" />	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="comUrl">기업홈페이지</label></th>
									<td class="left">
										<form:input id="comUrl" path="comUrl" cssClass="txt fxw" maxlength="50" /><form:errors path="comUrl" />	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="useradd">사업장주소</label></th>
									<td class="left">
										<div class="group_addr">
											<div class="zipcode_txt">
												<form:input path="comZip" cssClass="txt fxw" /><form:errors path="comZip" />
											</div>
											<div class="addr_txt">
												<form:input path="comAddr" cssClass="txt fxw" /><form:errors path="comAddr" />
												<form:input path="comDtlAddr" cssClass="txt fxw" /><form:errors path="comDtlAddr" />
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="sex">대표자성별 <span class="tbl_star">*</span></label></th>
									<td>	
										<ul>
											<li style="float:left;">
												<form:radiobutton path="sex" value="SX0001" />
												<label for="sex1">남자</label>
											</li>
											<li>
												<form:radiobutton path="sex" value="SX0002" />
												<label for="sex2">여자</label>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ceoMobileNo">대표자휴대폰 <span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="ceoMobileNo" path="ceoMobileNo" cssClass="txt fxw" maxlength="50" /><form:errors path="ceoMobileNo" />
										<button onclick="javascript:AuthNmSend();" type="button" class="btn st_small" >인증번호발송</button>
										<br><font style="font:15px;">숫자입력 (예: 01011112222)</font>	
										<br><font id="chkMobile" style="font:15px;"></font>	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="authNm">인증번호확인<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="authNm" path="authNm" name="authNm" cssClass="txt fxw" maxlength="50" /><form:errors path="authNm" />	
										<button onclick="javascript:AuthNmCheck();" type="button" class="btn st_small" >인증번호확인</button>	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="damdangNm">담당자명</label></th>
									<td class="left">
										<form:input id="damdangNm" path="damdangNm" cssClass="txt fxw" maxlength="50" /><form:errors path="damdangNm" />	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="damdangDept">담당자부서</label></th>
									<td class="left">
										<form:input id="damdangDept" path="damdangDept" cssClass="txt fxw" maxlength="50" /><form:errors path="damdangDept" />	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="damdangMobileNo">담당자연락처 </label></th>
									<td class="left">
										<form:input id="damdangMobileNo" path="damdangMobileNo" cssClass="txt fxw" maxlength="50" /><form:errors path="damdangMobileNo" />	
									</td>
								</tr>
								<tr>
									<th scope="row">
										<form:select path="searchCondition" cssClass="use"> 
											<form:option value="CF0001" >대표이미지</form:option>
				        					<form:option value="CF0002" >사업자등록증</form:option>
				        					<form:option value="CF0003">신고증</form:option>
				        					<form:option value="CF0004">기타</form:option>
			        					</form:select><span class="tbl_star">*</span>
									</th>
									<td class="left" >
									  	<div class="area_filebox upload">
									  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										 	<label for="multi_attach">파일찾기</label>
											<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
											<a href="#none" class="upload_btn"  onclick="multi_image_upload()">업로드</a>
											<ul id="multi_file_attch" class="multi_file_attch" ></ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="sysbtn" class="bd_btn_area center" >
						<c:if test="${registerFlag}">
							<button type="button" onclick="javascript:fn_egov_selectPrev();" class="btn bl_gray">이전단계</button>
							<button type="button" onclick="javascript:fn_egov_next();" class="btn bg_gray_dark">다음단계</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
</form:form>