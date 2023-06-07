<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="registerFlag" value="${empty registerFlag}" />
<%
 /**
  * @Class Name : TReqUserRegister.jsp
  * @Description : TReqUser Register 화면
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
<script type="text/javascript" src="/DLink/admin_html/js/common.js"></script>
<script type="text/javaScript" defer="defer">

var userPw = false; 
var userId = false;
var authCheck = false;
var emailAddr = false;
var mobileNo = false;


/* 이전 화면 function */
function fn_egov_selectPrev() {
   	document.getElementById("detailForm").action = "<c:url value='/front/memberJoin/prtermsAgree.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 회원가입저장 function */
function fn_egov_next() {	
	
		var registerFlag = $("#registerFlag").val();
		var cont = $("#sex").val();
		var urlval = "";
		var form = document.detailForm;
		
	/* 불일치 */	
	if(!userPw){
		alert("비밀번호 확인해주세요.");
		return ;
	}
	
	if(!userId){
		alert("아이디중복확인 해주세요.");
		return ;
	}
	
	if(!authCheck){
		alert("인증번호가 다릅니다. \n확인해주세요.");
		return ;
	}
	
	
	/* sms,email 체크박스 */	
	if($('#smsYnChk').is(':checked')) {
	       $("#smsYn").val("Y");
	   }
	if($('#mailYnChk').is(':checked')) {
	       $("#mailYn").val("Y");
	   }
		
	/* 필수값입력 */	
	if( form.loginId.value=="" ) { form.loginId.focus(); alert("아이디를 입력해 주십시오."); return false; }
	if( form.userNm.value=="" ) { form.userNm.focus(); alert("이름을 입력해 주십시오."); return false; }
	if( form.loginPwd.value=="" ) { form.loginPwd.focus(); alert("비밀번호를 입력해 주십시오."); return false; }
	if( form.mobileNo.value=="" ) { form.mobileNo.focus(); alert("핸드폰번호를 입력해 주십시오."); return false; }
	if( form.emailAddr.value=="" ) { form.emailAddr.focus(); alert("이메일를 입력해 주십시오."); return false; }
	if( (form.sex[0].checked == false) && (form.sex[1].checked == false) ) { alert("성별을 선택해 주십시오."); return false; }
	if( form.birthday.value=="" ) { form.birthday.focus(); alert("생년월일을 입력해 주십시오."); return false; }
	
	var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: "/front/memberJoin/addTReqUser.do",
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
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
}

/* 아이디 중복 체크 함수 */
function loginIdCheck() {

	 var loginId =  $("#loginId").val(); 
	 
	 $.ajax({
	        url:'/front/memberJoin/idCheck.do',
	        type: "POST",
	        data:{loginId:loginId},
	        success:function(cnt){ 
 	            if(cnt != 1){ 
 	            	alert("사용가능한 아이디입니다.");
 	            	userId = true;
 	            } else { 
 	            	alert("사용중인 아이디입니다.");
 	            }
	        },
	        error:function(){
	            alert("에러입니다");
	        }
	    });
  }
$(function(){
	   $("#loginId").on("propertychange change keyup paste input", function() {
	      userId = false;
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
	    } else if (pw.search(id) > -1) {
         $('#PwChkNotice').html('비밀번호에 아이디가 포함되었습니다.');
         $('#PwChkNotice').attr('color', 'red');
         userPw = false;         
	    } else {
    	$('#PwChkNotice').html('비밀번호가 정상적으로 입력되었습니다.');
    	$('#PwChkNotice').attr('color', 'blue');
        return true;
	    }
   });
}); 

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
/* 이메일정규식 */
$(function(){
	
	 $('#emailAddr').keyup(function(){
		 
		var emailVal = $("#emailAddr").val(); 
		var regExp =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		
		if (emailVal.match(regExp) != null) {
			$('#EmailCheck').html('사용가능합니다.');
	        $('#EmailCheck').attr('color', 'blue');
	        emailAddr = true;  
		 } else{
	         $('#EmailCheck').html('다시입력해주세요.');
	         $('#EmailCheck').attr('color', 'red');
	         emailAddr = false; 
		}
		
	 });
});

/* 휴대폰번호정규식 */
$(function(){
	
	 $('#mobileNo').keyup(function(){
		 
		var mobileVal = $("#mobileNo").val(); 
		var regExp =  /^01([0|1|6|7|8|9])([0-9]{7,8})$/;
		
		
		if (mobileVal.match(regExp) != null) {
			$('#chkMobile').html('사용가능합니다.');
	        $('#chkMobile').attr('color', 'blue');
	        mobileNo = true;  
		 } else{
	         $('#chkMobile').html('다시입력해주세요.');
	         $('#chkMobile').attr('color', 'red');
	         mobileNo = false; 
		}
		
	 });
});

/* datepicker 함수 */
$( function() {
    $( "#calender_02_strt" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	regional: "ko",
    	buttonImage: "/DLink/HTML/css/images/contents/btn_calendar.gif",
    	showOn: 'button',
    	buttonImageOnly: true,
    	buttonText: "달력", 
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능                
        buttonText: "선택", //버튼 호버 텍스트              
        yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
        yearRange: 'c-100:c+10',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
    });
    
    
 } );
 
/* 인증번호발송 */
function AuthNmSend() {

	 var mobileNo =  $("#mobileNo").val(); 
	 
	 $.ajax({
	        url:'/front/userCheck.do',
	        type: "POST",
	        data:{'mobileNo':mobileNo},
	        
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
	 var mobileNo =  $("#mobileNo").val(); 
	 
	 $.ajax({
	        url:'/front/userCheckResult.do',
	        type: "POST",
	        data:{
	        	'authNm':authNm,
	        	'mobileNo':mobileNo
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
	            alert("에러입니다");
	        }
	    });
  }
   
</script>


<form:form name="searchForm" id="searchForm" method="post" action="/front/memberJoin/joinCmplt.do">	
</form:form>
<form:form name="falseForm" id="falseForm" method="post" action="/front/memberJoin/addTReqUserView.do">	
</form:form>
<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TReqUserVO" name="detailForm" id="detailForm" >
<%-- <form:hidden path="registerFlag" value="<c:out value='${registerFlag}'/>"/>--%>
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
				<p>회원정보입력</p>
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
										<form:input id="loginId" path="loginId" name="loginId" cssClass="txt fxw" maxlength="50" /><form:errors path="loginId" />										
										<button onclick="javascript:loginIdCheck();" type="button" class="btn st_small" >중복확인</button>											
										<span id="result" class="infotext">아이디는 4~12자 영문,숫자만 사용가능</>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="userNm">이름<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="userNm" path="userNm" name="userNm" type="text" cssClass="txt fxw" maxlength="50" /><form:errors path="userNm" />	
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
									<th scope="row"><label for="mobileNo">핸드폰번호<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="mobileNo" path="mobileNo" name="mobileNo" cssClass="txt fxw" maxlength="50" /><form:errors path="mobileNo" />	
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
									<th scope="row"><label for="emailAddr">이메일<span class="tbl_star">*</span></label></th>
									<td class="left">
										<form:input id="emailAddr" path="emailAddr" cssClass="txt fxw" maxlength="50" /><form:errors path="emailAddr" />
										<font id="EmailCheck" style="font:15px;"></font>										<!-- <button onclick="javascript:EmailCheck();" type="button" class="btn st_small" >이메일확인</button>	 -->
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="sex">성별 <span class="tbl_star">*</span></label></th>
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
									<th scope="row"><label for="birthday">생년월일 <span class="tbl_star">*</span></label></th>
									<td class="left">
										<div>
											<div class="area_calendar">
												<input type="text" id="calender_02_strt" class="mr10" name="birthday" value=${birthday }>
											</div>
											<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<span class="member_field_agree">
							<em>SMS나 이메일로 다양한 서비스를 받아보시겠습니까?</em>
							<input type="checkbox" id="smsYnChk" name="chk"><label for="smsYnChk">sms로 받기</label>
							<form:hidden path="smsYn" id="smsYn" value="N"/>
                 		    <input type="checkbox" id="mailYnChk" name="chk"><label for="mailYnChk">email로 받기</label>
							<form:hidden path="mailYn" id="mailYn" value="N"/>
							
						</span>
						<p class="mt10">이메일 및 SMS 수신 거부여부와 상관없이, 주문관련내용은 기본 발송 사항으로 이메일과 SMS로 발송됩니다.</p>
					</div>

					<div div id="sysbtn" class="bd_btn_area center" >
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


