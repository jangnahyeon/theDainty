<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%
 /**
  * @Class Name : infoMagmt.jsp
  * @Description : 마이페이지-회사정보관리  화면
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
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<script type="text/javascript" src="/DLink/HTML/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>	
<script type="text/javaScript" language="javascript" defer="defer">


//네이버에디터 스크립트 
var oEditors = [];

$(function(){ 
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "cont", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "/DLink/HTML/js/smarteditor2/SmartEditor2Skin.html",
        fCreator: "createSEditor2" ,
        htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true
          },
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["cont"].exec("PASTE_HTML", [""]);
          }
      })
    
      oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
	})
	

/* 전문회사신청 제출function */
function fn_egov_submit() {
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", [])
	  var cont = document.getElementById("cont").value;
	
	if(confirm("제출하시겠습니까??")){
		document.getElementById("specialForm").cont.value = cont;
		document.getElementById("specialForm").action = "<c:url value='/front/proAgency/specialCompanyView.do'/>";
	   	document.getElementById("specialForm").submit();
	}
}


/* 글 수정후 저장 function */
function fn_egov_save() {	
	
	var urlval = "/front/proAgency/updateinfoMagmt.do";
	var form = document.detailForm;
		
	
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

/* 현재비밀번호 확인 */
function pwCheck() {

	 var loginPwd =  $("#loginPwd").val(); 
	 	 
	 $.ajax({
	        url:'/front/proAgency/pwCheck.do',
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
/* 매출액 숫가만 입력가능 */
$(document).ready(function(){
   $('#salesAmt').on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
   });
   
 });
/* 인력정보 추가 */
$('#btn-add-row').click(function() {
	 $("#add>tbody").append();	
  });
$('#btn-delete-row').click(function() {
    $('#mytable > tbody > tr:last').remove();
  });


  function addRow() {
     var dynamicTable = document.getElementById("#add");
      var newRow = add.insertRow();
      
      var cell1 = newRow.insertCell();
      var cell2 = newRow.insertCell();
      var cell3 = newRow.insertCell()
      var cell4 = newRow.insertCell();
      var cell5 = newRow.insertCell();
      var cell6 = newRow.insertCell(); 
      var cell7 = newRow.insertCell();
      var cell8 = newRow.insertCell(); 
      var cell9 = newRow.insertCell();
      var cell10 = newRow.insertCell();
      var cell11 = newRow.insertCell();
     
      cell1.innerHTML = '<input type="text" class="form-control" name="staffNm" style="width:100%;" >';
      cell2.innerHTML = '<input type="text" class="form-control" name="position" style="width:100%;" >';
      cell3.innerHTML = '<input type="text" class="form-control" name="mSex" style="width:100%;" >';
     
      /* cell3.innerHTML = '<div><input type="radio" class="form-control" name="mSex"+i+"" value="SX0001" style="width:100%;"><label for="sex1">남자</label><input type="radio" class="form-control" name="mSex" value="SX0002" style="width:100%;" ><label for="여자">여자</label></div>';
       */
      
      cell4.innerHTML = '<input type="text" class="form-control" name="birthday" style="width:100%;" >';
      cell5.innerHTML = '<input type="text" class="form-control" name="school" style="width:100%;" >';
      cell6.innerHTML = '<input type="text" class="form-control" name="acquisitionYear" style="width:100%;" >';
      cell7.innerHTML = '<input type="text" class="form-control" name="lstHakwi" style="width:100%;" >';
      cell8.innerHTML = '<input type="text" class="form-control" name="jungong" style="width:100%;" >';
      cell9.innerHTML = '<input type="text" class="form-control" name="jungongPart" style="width:100%;" >';
      cell10.innerHTML = '<input type="text" class="form-control" name="career" style="width:100%;" >';
      cell11.innerHTML = '<button class="btn btn-default" name="delStaff">삭제</button>';
   }  
  
//삭제 버튼
  $(document).on("click","button[name=delStaff]",function(){
      
      var trHtml = $(this).parent().parent();
      
      trHtml.remove(); //tr 테그 삭제
      
  });
  


  /* 저장된 파일 정보 삭제 function */
  function fn_egov_FileDelete(fileSeq) {	

  		$.ajax({
  		    type: "POST",
  		    url: "/front/proAgency/deleteCompanyFile.do",
  		    data : {
  		    	"fileSeq" : fileSeq
  		    },
  		    dataType: "text",
  		    success: function(res){
  		        if(res != null){
  		        	if(res == "delete"){
  		        		alert("삭제 되었습니다.");
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

</script>



<form:form name="searchForm" id="searchForm" method="post" action="/front/proAgency/infoMagmt.do">
</form:form>
<form:form name="subForm" id="subForm" method="post" action="/front/proAgency/infoMagmt.do">
</form:form>


<div class="wrap_content">
	<div class="con_title">
		<h3><i>기업정보관리</i></h3>
		<ul class="loca">
			<li><a href="/front/main.do" class="home">home</a></li>
			<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
			<li><a href="#">기업정보관리</a></li>
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
					<li><a href="/front/privacy/infoInquiry.do">개인정보관리</a></li>
				<%} else {%>
					<li><a href="/front/proAgency/infoMagmt.do" class="on">기업정보관리</a></li>
				<% } %>
			</ul>
		</div>
		<div class="tab_device mt40">
			<ul class="tab_style05">
				<li><a href="/front/proAgency/infoMagmt.do"class="on">업체정보관리</a></li>
				<li><a href="/front/portMagmt/portInquiryList.do" >포트폴리오관리</a></li>
			</ul>
		</div>
		<section class="tab_content">
		
			<form:form modelAttribute="TMemComVO" name="detailForm" id="detailForm" >	
			<h4 class="mt0">업체 정보입력</h4>
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
						<td class="left">
							${settMemComVO.loginId}
							<input type="hidden" name="loginId" id="loginId" value="${settMemComVO.loginId}">
						</td>
						<th scope="row"><label for="comNm">회사명</label></th>
						<td class="left">
							${settMemComVO.comNm}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="comType">기업형태</label></th>
						<td class="left">
							<ul class="gender_radio">
								<li>
									<input type="radio" name="comType" <c:if test="${settMemComVO.comType eq 'MG0001'}">checked</c:if> id="comType1" value="MG0001"/>
									<label for="comType1">법인</label>
								</li>
								<li>
									<input type="radio" name="comType" <c:if test="${settMemComVO.comType eq 'MG0002'}">checked</c:if> id="comType2" value="MG0002"/>
									<label for="comType2">개인</label>
								</li>
							</ul>
						</td>
						<th scope="row"><label for="comUrl">기업홈페이지</label></th>
						<td class="left">
							<input type="text" name="comUrl" id="comUrl" value="${settMemComVO.comUrl}"  />
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="ceoNm">대표자명</label></th>
						<td class="left">
							${settMemComVO.ceoNm}
						</td>
						<th scope="row"><label for="ceoMobileNo">대표자 휴대폰</label></th>
						<td class="left">
							<input type="text" name="ceoMobileNo" id="ceoMobileNo" value="${settMemComVO.ceoMobileNo}"  />
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="sex">성별</label></th>
						<td>	
							<ul class="gender_radio">
								<c:choose>
									<c:when test="${settMemComVO.sex == 'SX0001'}">
										남자
									</c:when>
									<c:otherwise>
										여자
									</c:otherwise>
								</c:choose>
							</ul>
						</td>
						<th scope="row"><label for="comNo">법인등록번호</label></th>
						<td class="left">
							${settMemComVO.comNo}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="loginPwd">현재비밀번호</label></th>
						<td class="left">
							<form:input path="loginPwd" type="password"/>
							<button onclick="javascript:pwCheck();" type="button" class="btn st_small" >비밀번호확인</button>	
						</td>
						<th scope="row"><label for="regDt">등록일</label></th>
						<td class="left">
							${settMemComVO.regDt}
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="loginPwd">변경비밀번호</label></th>
						<td class="left">
							<input id="userPw" name="loginPwdAfter" type="password" Class="txt fxw" maxlength="50" disabled /></br>
							<font id="PwChkNotice" style="font:15px;"></font>
						</td>
						<th scope="row"><label for="userPwChk">변경비밀번호 확인</label></th>
						<td class="left">
							<input id="userPwChk" type="password" Class="txt fxw" maxlength="50"  disabled/></br>
							<font id="chkNotice" style="font:15px;"></font>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="useradd">주소</label></th>
						<td class="left" colspan="3">
							<div class="group_addr">
								<div class="zipcode_txt">
								<input type="text" class="txt" name="comZip" id="comZip" value="${settMemComVO.comZip}"  />
								</div>
								<div class="addr_txt">
									<input type="text" class="txt"  name="comAddr" id="comAddr" value="${settMemComVO.comAddr}"  />
									<input type="text" class="txt"  name="comDtlAddr" id="comDtlAddr" value="${settMemComVO.comDtlAddr}"  />
								</div>
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>
					
			<h4 class="mt30">담당자 정보</h4>
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
						<th scope="row"><label for="damdangNm">담장자명</label></th>
						<td class="left">
							<input type="text" name="damdangNm" id="damdangNm" value="${settMemComVO.damdangNm}"  />
						</td>
						<th scope="row"><label for="damdangDept">담당자부서</label></th>
						<td class="left">
							<input type="text" name="damdangDept" id="damdangDept" value="${settMemComVO.damdangDept}"  />
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="damdangMobileNo">담당자연락처</label></th>
						<td class="left">
							<input type="text" name="damdangMobileNo" id="damdangMobileNo" value="${settMemComVO.damdangMobileNo}"  />
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
						<th scope="row"><label for="damdangEmail">담당자이메일</label></th>
						<td class="left">
							<input type="text" name="damdangEmail" id="damdangEmail" value="${settMemComVO.damdangEmail}"  />
						</td>
						<th scope="row"><label for="mailYn">메일링허용여부</label></th>
						<td>
							<ul class="gender_radio">
								<li>
									<input type="radio" name="mailYn" <c:if test="${settMemAccptVO.mailYn eq 'Y' }">checked</c:if> id="mailYn1" value="Y"/>
									<label for="mailYn1">예</label>
								</li>
								<li>
									<input type="radio" name="mailYn" <c:if test="${settMemAccptVO.mailYn eq 'N' }">checked</c:if> id="mailYn2" value="N"/>
									<label for="mailYn2">아니오</label>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			
			<h4 class="mt30">첨부파일<span class="stxt ml5">사업자등록증, 신고필증 사본 등</span></h4>
			<table class="tbl_basic mob_row table_write ">
				<caption>사업자등록증, 신고필증 사본 등 첨부파일을 등록합니다.</caption>
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody>
					<tr class="fileTR">
						<th scope="col">
							<form:select path="searchCondition" cssClass="use">
								<form:option value="CF0001" >대표이미지</form:option>
	        					<form:option value="CF0002" >사업자등록증</form:option>
	        					<form:option value="CF0003">신고증</form:option>
	        					<form:option value="CF0004">기타</form:option>
        					</form:select>
						</th>
					  	<td colspan="3" style="min-height: 51px;">
						  <div class="area_filebox upload">
					  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
						 	<label for="multi_attach">파일찾기</label>
							<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
							<a href="#none" class="upload_btn"  onclick="multi_image_upload()">업로드</a>
							
							<ul id="multi_file_attch" class="multi_file_attch" >
							</ul>
						</div> 
						</td>
					</tr>
					<c:forEach var="vlimg" items="${selectTMemComFileList}" varStatus="vlvs">	
						<tr>
							<th>${vlimg.fileKindNm}</th>
							<td colspan="3" >
								<ul id="multi_file_attch" class="multi_file_attch" >
									<li>							
										<a href='/imagefile/download.do?file_no=${vlimg.fileSeq }' class="mt_image_file">${vlimg.fileNm }</a>
										<!--  <input type="hidden" name="file_attch" value="${vlimg.fileSeq}" />   -->
										<input type="hidden" name="multi_attach" id="multi_attach" class="upload_hidden" value="${vlimg.fileSeq}" /> 
										<a class="btn_del" href="javascript:fn_egov_FileDelete('${vlimg.fileSeq}');">삭제</a>
									</li>
									<c:if test="${vlimg.fileKind eq 'CF0001'}">
										<li>
											<img src="/imagefile/preview.do?fileSeq=${vlimg.fileSeq }" style="width:300px; height:150px;" alt="${vlimg.fileNm}" />
										</li>
									</c:if>	
								</ul>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="sysbtn" class="bd_btn_area right">
				<a href="javascript:fn_egov_save();" class="btn bg_gray_dark" >저장</a>
			</div>
			</form:form>	
			<form:form modelAttribute="TMemComVO" name="specialForm" id="specialForm" >					
			<h4 class="mt30">전문회사 신청정보<span class="stxt ml5">전문회사 신청을 원하시면 아래 양식작성후 제출을 눌러주세요.</span></h4>
			<p class="mb10 right"></p>
			<table class="tbl_basic mob_row">
				<caption>회원정보 </caption>
				<colgroup>
					<col width="15%" class="mb_w01">
					<col >
					<col width="15%" class="mb_w02"> 
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="salesAmt">매출액</label></th>
						<td class="left">
							<form:input path="salesAmt" cssclass="txt w40" /> <span style="color:red;">숫자만 입력가능합니다.</span><form:errors path="salesAmt" />
						<th scope="row"><label for="keyCustomer">주요거래처</label></th>
						<td class="left">
							<form:input path="keyCustomer" cssclass="txt w40" /><form:errors path="keyCustomer" />
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="employ">고용현황</label></th>
						<td class="left">
							<form:input path="employ" cssclass="txt w40" /><form:errors path="employ" />
						</td>
						<th scope="row"><label for="requester">신청자</label></th>
						<td class="left">
							<form:input path="requester" cssclass="txt w40" /><form:errors path="requester" />
						</td>
					</tr>
						
					<tr>
					<th scope="row"><label for="cont">주요실적내용</label></th>
						<td colspan="3">
							<form:input type="text" path="cont" style="width:100%" />			
						</td>
					</tr>
					
				</tbody>
				<form:hidden path="reqNo" cssclass="txt w40" /><form:errors path="reqNo" />
			</table>
					
			<h4 class="mt30">전문회사 신청 인력현황 정보  <input type="button" value="+행추가"  class="btn st_small bg_blue_light" style="float:right;"  onClick="addRow();"/></h4>
			 
			<p class="mb10 right"></p>
			<table id="add" class="tbl_basic center bd_type01">
				<caption>게시판 목록</caption>
				<colgroup>
					<col width="">						
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="8%">
		        </colgroup>
				<thead>
					<tr>
						<th scope="col" class="">직원명</th>
						<th scope="col" class="">직위</th>
						<th scope="col" class="">성별</th>
						<th scope="col" class="">생년월일</th>
						<th scope="col" class="">학교명</th>
						<th scope="col" class="">취득연도</th>
						<th scope="col" class="">최종학위</th>
						<th scope="col" class="">전공</th>
						<th scope="col" class="">전공분야</th>
						<th scope="col" class="">경력</th>
						<th scope="col" class=""></th>
					</tr>
				</thead>
				<tbody>
					<tr name="trStaff" > 
						<td><form:input path="staffNm" name="staffNm" style="width:100%;" /><form:errors path="staffNm" /></td>
						<td><form:input path="position" name="position" style="width:100%;" /><form:errors path="position" /></td>
						<td><form:input path="mSex" name="mSex" style="width:100%;" /><form:errors path="mSex" />
							<%-- <ul>
								<li style="float:left;">
									<form:radiobutton path="mSex" value="SX0001" />
									<label for="mSex1">남자</label>
								</li>
								<li>
									<form:radiobutton path="mSex" value="SX0002" />
									<label for="mSex2">여자</label>
								</li>
							</ul> --%>
						</td>
						<td><form:input path="birthday" name="birthday" style="width:100%;" /><form:errors path="birthday" /></td>
						<td><form:input path="school" name="school" style="width:100%;" /><form:errors path="school" /></td>
						<td><form:input path="acquisitionYear" name="acquisitionYear" style="width:100%;" /><form:errors path="acquisitionYear" /></td>
						<td><form:input path="lstHakwi" name="lstHakwi" style="width:100%;" /><form:errors path="lstHakwi" /></td>
						<td><form:input path="jungong" name="jungong" style="width:100%;" /><form:errors path="jungong" /></td>
						<td><form:input path="jungongPart" name="jungongPart" style="width:100%;" /><form:errors path="jungongPart" /></td>
						<td><form:input path="career" name="career" style="width:100%;" /><form:errors path="career" /></td>
						<td></td>
					</tr>
				</tbody>
			</table>
						
			
			<div id="sysbtn" class="bd_btn_area right">
				<a href="javascript:fn_egov_submit();" class="btn bg_gray_dark" >제출</a>
			</div>
			</form:form>
			
			
		</section>
	</div>
</div>
	

