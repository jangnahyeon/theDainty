<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<%
 /**
  * @Class Name : infoInquiry.jsp
  * @Description : 마이페이지-개인정보관리  화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-13
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


/* 글 수정후 저장 function */
function fn_egov_save() {	
	
	var cont = $("#sex").val();
	var cont = $("#smsYn").val();
	var cont = $("#mailYn").val();
	var urlval = "/front/privacy/updateinfoInquiry.do";
	var form = document.detailForm;
	var loginPwd = $("#loginPwd").val();
	var loginPwd1 = $("#loginPwd1").val();
	
	 var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: urlval,
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "upsuc"){
		        		alert("수정 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
}


/* 현재비밀번호 확인 */
function pwCheck() {

	 var loginPwd =  $("#loginPwd").val(); 
	 	 
	 $.ajax({
	        url:'/front/privacy/pwCheck.do',
	        type: "POST",
	        data:{loginPwd:loginPwd},
	        success:function(cnt){  
 	            if(cnt == 1){ 
 	            	alert("현재비밀번호와 일치합니다.");
 	            	$("#userPw").removeAttr('disabled'); 
 	            	$("#userPwChk").removeAttr('disabled'); 
 	            } else { 
 	            	alert("현재비밀번호와 다릅니다.");
 	            }
	        },
	        error:function(){
	            alert("에러입니다");
	        }
	    });
  }
  
/* 변경 비밀번호확인 */
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


</script>
<form:form name="searchForm" id="searchForm" method="post" action="/front/privacy/infoInquiry.do">
	
</form:form>
<form:form modelAttribute="TMemUserVO" name="detailForm" id="detailForm" >	
	

<div class="wrap_content">
	<div class="con_title">
		<h3><i>개인정보관리</i></h3>
		<ul class="loca">
			<li><a href="/front/main.do" class="home">home</a></li>
			<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
			<li><a href="#">개인정보관리</a></li>
		</ul>
	</div>
	
	<div class="contents">
		<div class="tab_device">
			<a href="#" class="tab_device_ti"></a>
			<ul class="tab_style01">
				<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" >알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=agency">관심정보</a></li>
						<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
						<%if(("MG0001").equals(loginVO.getUserType())){ %>
							<li><a href="/front/privacy/infoInquiry.do" class="on">개인정보관리</a></li>
						<%} else {%>
							<li><a href="/front/proAgency/infoMagmt.do">기업정보관리</a></li>
						<% } %>
			</ul>
		</div>
		<section class="tab_content">
			<p class="mb10 right"></p>
			<table class="tbl_basic mob_row">
				<caption>회원정보 </caption>
				<colgroup>
					<col width="15%" class="mb_w01">
					<col>
					<col width="15%" class="mb_w02"> 
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="loginId">아이디</label></th>
						<td class="left">${settMemUserVO.loginId}
						<input type="hidden" name="loginId" id="loginId" value="${settMemUserVO.loginId}">
						</td>
						<th scope="row"><label for="userNm">이름</label></th>
						<td class="left">${settMemUserVO.userNm}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="sex">성별</label></th>
						<td>	
							<ul class="gender_radio">
								<c:choose>
									<c:when test="${settMemUserVO.sex == 'SX0001'}">
										남자
									</c:when>
									<c:otherwise>
										여자
									</c:otherwise>
								</c:choose>
							</ul>
						</td>
						<th scope="row"><label for="birthday">생년월일</label></th>
						<td class="left">${settMemUserVO.birthday}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="loginPwd">현재비밀번호</label></th>
						<td class="left">
							<form:input path="loginPwd" type="password"/>
							<button onclick="javascript:pwCheck();" type="button" class="btn st_small" >비밀번호확인</button>	
						</td>
						<th scope="row"><label for="regDt">등록일</label></th>
						<td class="left">${settMemUserVO.regDt}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="loginPwd">변경비밀번호</label></th>
						<td class="left">
							<input id="userPw" name="loginPwd" type="password" class="txt fxw" maxlength="50" disabled /></br>
							<font id="PwChkNotice" style="font:15px;"></font>
						</td>
						<th scope="row"><label for="userPwChk">변경비밀번호 확인</label></th>
						<td class="left">
							<input id="userPwChk" type="password" class="txt fxw" maxlength="50"  disabled/></br>
							<font id="chkNotice" style="font:15px;"></font>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><label for="mobileNo">휴대전화</label></th>
						<td class="left">
							<input type="text" name="mobileNo" id="mobileNo" value="${settMemUserVO.mobileNo}"  />
						</td>
						<th scope="row"><label for="smsYn">문자허용여부</label></th>
						<td> 
							<ul class="gender_radio">
								<li>
									<input type="radio" name="smsYn" <c:if test="${settMemAccptVO.smsYn eq 'Y' }">checked</c:if> id="smsYn1" value="Y"/>
									<label for="smsYn1">예</label>
								</li>
								<li>
								<input type="radio" name="smsYn" <c:if test="${settMemAccptVO.smsYn eq 'N' }">checked</c:if> id="smsYn2" value="N"/>
									<label for="smsYn2">아니오</label>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="emailAddr">이메일</label></th>
						<td class="left">
							<input type="text" name="emailAddr" id="emailAddr" value="${settMemUserVO.emailAddr}"  />
						</td>
						<th scope="row"><label for="mailYn">메일링허용여부</label></th>
						<td>
							<ul class="gender_radio">
								<li>
									<input type="radio" name="mailYn" <c:if test="${settMemAccptVO.smsYn eq 'Y' }">checked</c:if> id="mailYn1" value="Y"/>
									<label for="mailYn1">예</label>
								</li>
								<li>
									<input type="radio" name="mailYn" <c:if test="${settMemAccptVO.smsYn eq 'N' }">checked</c:if> id="mailYn2" value="N"/>
									<label for="mailYn2">아니오</label>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="useradd">주소</label></th>
						<td class="left" colspan="3">
							<div class="group_addr">
								<div class="zipcode_txt">
								<input type="text" class="txt" name="zipCd" id="zipCd" value="${settMemUserVO.zipCd}"  />
								</div>
								<div class="addr_txt">
									<input type="text" class="txt"  name="addr" id="addr" value="${settMemUserVO.addr}"  />
									<input type="text" class="txt"  name="dtlAddr" id="dtlAddr" value="${settMemUserVO.dtlAddr}"  />
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>					
			
			<div id="sysbtn" class="bd_btn_area center">
				<a href="javascript:fn_egov_save();" class="btn bg_gray_dark" >저장</a>
			</div>
		</section>
	</div>
</div>
</form:form>		

