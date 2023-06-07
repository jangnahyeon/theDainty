<%@page import="dlink_new.admin.vo.TImgInfo"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<c:set var="flag" value="${empty resultList.memSeq ? 'insert' : 'update' }" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function thumbnail_image(){
	
	
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
	
	if($("#multi_file_attch li").length > 0){
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
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" >" +tmp2+ " </a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:thumbnail_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					$("#comFileSeq").val(tmp1);
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
function thumbnail_delete( val){
	
	var formData = new FormData();
	formData.append("comFileSeq", val);
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
					$("#comFileSeq").val('');
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
function fn_post_code( id ) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            console.log(data);
            var addr = "(" + data.zonecode + ") " + data.address
            $(id).val( addr );
        }
    }).open();
}

function go_register() {
	var code = $('input[name=code]').val();
	var comType = $('input[name=comType]').val();
	
	var memId = $("#memId").val(); 
	if(memId == ''){
		alert("아이디를 입력해 주세요.");
		$("#memId").focus();
		return false;
	}
	
	var regexId = /^[a-z]+[a-z0-9]{3,11}$/g;
	if( !regexId.test(memId) ) {
		alert("아이디는 4~12자 영문, 숫자만 사용가능합니다.");
		$("#memId").focus();
		return;
	}
	
	if(code == '0003') {
		var comNm = $("#comNm").val(); 
		if(comNm == ''){
			alert("업체명을 입력해 주세요.");
			$("#comNm").focus();
			return false;
		}
		var memNm = $("#memNm").val(); 
		if(memNm == ''){
			alert("대표자 성명을 입력해 주세요.");
			$("#memNm").focus();
			return false;
		}
		var comNo = $("#comNo").val(); 
		if(comNo == ''){
			alert("사업자등록번호를 입력해 주세요.");
			$("#comNo").focus();
			return false;
		}
		var damdangNm = $("#damdangNm").val(); 
		if(damdangNm == ''){
			alert("담당자 성명을 입력해 주세요.");
			$("#damdangNm").focus();
			return false;
		}
	} else if(code == '0002') {
		var memNm = $("#memNm").val(); 
		if(memNm == ''){
			alert("이름을 입력해 주세요.");
			$("#memNm").focus();
			return false;
		}	
		
		if($("input:radio[name=jobGbCd]:checked").length < 1){
			alert("직업을 선택해 주세요.");
			return false;
	 	};
	}
	
	var hp = $("#hp").val(); 
	if(hp == ''){
		alert("휴대폰번호를 입력해 주세요.");
		$("#hp").focus();
		return false;
	}
	
	
	var email = $("#email").val(); 
	if(email == ''){
		alert("이메일을 입력해 주세요.");
		$("#email").focus();
		return false;
	}	
	
	var regexEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if( !regexEmail.test(email) ) {
		alert("이메일 형식이 맞지 않습니다.");
		$("#email").focus();
		return;
	}
	
	if(code == '0003') {
		var comAddr = $("#comAddr").val();
		if(comAddr == ''){
			alert("사업장주소를 입력해 주세요.");
			return false;
		}	
		
		var comType = $('input[name=comType]:checked').val();
		if (comType == null || comType == 'undefined') {
			alert("기업성격을 선택해주세요.");
			return false;
		}
		
		var comFileSeq = $("#comFileSeq").val();
		if(comFileSeq == ''){
			alert("사업자등록증을 등록해주세요.");
			return false;
		}
	}
	
	
	var params = $("#detailForm").serialize();
	
	var flag = "${flag}";
	if(flag == 'insert') {
		
		var id_check = $("#id_check").val();
		if("Y" != id_check) {		
			alert("아이디 중복확인 해주세요.");
			$("#id_check_btn").focus();
			return;
		}
		
		var memPw = $("#memPw").val(); 
		if(memPw == ''){
			alert("비밀번호를 입력해 주세요.");
			$("#memPw").focus();
			return false;
		}
		
		var regexPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,19}$/;
		if( !regexPw.test(memPw) ) {
			alert("비밀번호는 6~20자의 영문, 숫자, 특수문자의 조합으로 입력해주세요.");
			$("#memPw").focus();
			return;
		}
		
		$.ajax({
			url : "/admin/tbMem/addTbMem.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("저장되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/mem/memList.do?code=0001";
		        	} else if(code == '0002') {
		        		location.href="/admin/mem/memList.do";
		        	} else if(code == '0003') {
		        		if(comType == 'C'){
			        		location.href="/admin/mem/memCList.do";	
		        		} else if(comType == 'D'){
		        			location.href="/admin/mem/memDList.do";
		        		}
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	} else if (flag == 'update') {
		var id_check = $("#id_check").val();
		var id_org = "${resultList.memId }";
		var id_chg = $("#memId").val();

		if("Y" != id_check && id_org != id_chg) {		
			alert("아이디 중복확인 해주세요.");
			$("#id_check_btn").focus();
			return;
		}
		
		var memPw = $("#memPw").val(); 
		if(memPw){
			var regexPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,19}$/;
			if( !regexPw.test(memPw) ) {
				alert("비밀번호는 6~20자의 영문, 숫자, 특수문자의 조합으로 입력해주세요.");
				$("#memPw").focus();
				return;
			}
		}		
		
		var email_check = $("#email_check").val();
		var email_org = "${resultList.email }";
		var email_chg = $("#email").val();

		if("Y" != email_check && email_org != email_chg) {		
			alert("이메일 중복확인 해주세요.");
			$("#email_check_btn").focus();
			return;
		}
		
		$.ajax({
			url : "/admin/tbMem/updateTbMem.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("수정되었습니다.");
		        	if(code == '0001') {		        		
		        		location.href="/admin/mem/memList.do?code=0001";
		        	} else if(code == '0002') {
		        		location.href="/admin/mem/memList.do";
		        	} else if(code == '0003') {
		        		if(comType == 'C'){
			        		location.href="/admin/mem/memCList.do";	
		        		} else if(comType == 'D'){
		        			location.href="/admin/mem/memDList.do";
		        		}
		        	}
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}
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

function fn_email_check_act() {
	var email = $("#email").val();
	if(!email) {
		alert("이메일을 입력해주세요");
		$("#email").focus();
		return;
	}	
	
	var regexEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if( !regexEmail.test(email) ) {
		alert("이메일 형식이 맞지 않습니다.");
		$("#email").focus();
		return;
	}
	
	$.ajax({
		url : "/front/join/emailCheck_act.do",
		data : {
			"email" : email			
		},		
		method : "post",
		success : function(res) {
			
			if("Y" == res) {
				alert("사용 가능한 이메일 입니다.");	
				$("#email_check").val("Y");
			} else {
				alert("이미 사용 중인 이메일 입니다.");
				$("#email").focus();
			}
			
		},
		error : function(err) {
			alert("이메일 중복확인에 실패하였습니다.");
		}
	});
}

const regexPhoneNumber = (target) => {
    target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

const regexComNumber = (target) => {
    target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`);
}

const fn_id_change = (target) => {
	$("#id_check").val( "N" );
}

const fn_email_change = (target) => {
	$("#email_check").val( "N" );
}
</script>


<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
	<input type="hidden" name="id_check" id="id_check" value="N"/>
	<input type="hidden" name="email_check" id="email_check" value="N"/>
	<input type="hidden" name="memSeq"value="${resultList.memSeq }">
	<input type="hidden" name="code"value="${resultList.code }">
	<table class="bd_tbl bd_tbl_view">
		<caption>회원정보 </caption>
		<colgroup>
			<col width="15%">
			<col width="auto;">
			<col width="15%">
			<col width="auto;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><label for="memId">아이디<span class="tbl_star">*</span></label></th>
				<td class="left">										
					<input type="text" size="" class="txt w40" name="memId" value="${resultList.memId }" maxlength="50" id="memId" oninput="fn_id_change(this);">
					<button type="button" class="btn_st st_bg_blue small" onclick="fn_id_check_act();" id="id_check_btn">중복체크</button>
				</td>
				<th scope="row"><label for="memPw">비밀번호<span class="tbl_star">*</span></label></th>
				<td class="left">
					<input type="password" size="" class="txt w40" name="memPw" value="" id="memPw"  size="10" maxlength="20" placeholder="6~20자의 영문과 숫자의 조합" >
				</td>
			</tr>
			<c:if test="${resultList.code eq '0003'}">
				<tr>
					<th scope="row"><label for="comNm">업체명<span class="tbl_star">*</span></label></th>
					<td class="left" colspan="3">
						<ul class="chk_area">
							<input type="text" size="" class="txt w40" name="comNm" value="${resultList.comNm }" maxlength="50" id="comNm">
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="memNm">대표자 성명<span class="tbl_star">*</span></label></th>
					<td>
						<ul class="chk_area">
							<input type="text" size="" class="txt w40" name="memNm" value="${resultList.memNm }" maxlength="50" id="memNm">
						</ul>
					</td>
					<th scope="row"><label for="comNo">사업자등록번호<span class="tbl_star">*</span></label></th>
					<td class="left">
						<input type="text" size="" class="txt w40" name="comNo" value="${resultList.comNo }" maxlength="12" id="comNo" oninput="regexComNumber(this);">
					</td>
				</tr>
				
				
			</c:if>
			<tr>
				<c:if test="${resultList.code eq '0003'}">
					<th scope="row"><label for="damdangNm">담당자 성명<span class="tbl_star">*</span></label></th>
					<td>
						<ul class="chk_area">
							<input type="text" size="" class="txt w40" name="damdangNm" value="${resultList.damdangNm }" maxlength="50" id="damdangNm">
						</ul>
					</td>
				</c:if>
				<c:if test="${resultList.code eq '0002'}">
					<th scope="row"><label for="memNm">이름<span class="tbl_star">*</span></label></th>
					<td>
						<ul class="chk_area">
							<input type="text" size="" class="txt w40" name="memNm" value="${resultList.memNm }" maxlength="50" id="memNm">
						</ul>
					</td>
				</c:if>
				<th scope="row"><label for="birth">생년월일</label></th>
				<td class="left">
					<input type="text" size="" class="txt w40" name="birth" value="${resultList.birth }" maxlength="50" id="birth">
				</td>
			</tr>
			<c:if test="${resultList.code eq '0002'}">
				<tr>
					<th scope="row"><label for="jobGbCd">직업<span class="tbl_star">*</span></label></th>
					<td class="left" colspan="3">
						<ul class="chk_area">
							<c:forEach var="codelist" items="${codelist}">
								<c:if test="${codelist.gbCd == 'plt009'}">
									<li><input type="radio" name="jobGbCd" value="${codelist.code }" id="${codelist.codeNm }" <c:if test="${codelist.code eq resultList.jobGbCd }">checked</c:if>> <label for="${codelist.codeNm }">${codelist.codeNm }</label></li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</c:if>
			<tr>
				<th scope="row"><label for="hp">휴대폰 번호<span class="tbl_star">*</span></label></th>
				<td>
					<div class="wirte_container_tit">
						</div>
					<input type="text" size="" class="txt w40" name="hp" value="${resultList.hp }" maxlength="13" id="hp" oninput="regexPhoneNumber(this);">					
				</td>
				<th scope="row"><label for="email">이메일<span class="tbl_star">*</span></label></th>
				<td class="left">
					<input type="text" size="" class="txt w40" name="email" value="${resultList.email }" maxlength="50" id="email" oninput="fn_email_change(this);">
					<button type="button" class="btn_st st_bg_blue small" onclick="fn_email_check_act();" id="email_check_btn">중복체크</button>
				</td>				
			</tr>
			<c:if test="${resultList.code eq '0002' || resultList.code eq '0003'}">
			<tr>
				<th scope="row"><label for="smsYn">문자허용여부</label></th>
				<td>
					<ul class="chk_area">
						<li><input type="radio" name="smsYn" value="Y" id="smsY" <c:if test="${tbMemVO.smsYn eq 'Y' }">checked</c:if>> <label for="smsY">허용</label></li>
						<li><input type="radio" name="smsYn" value="" id="smsn" <c:if test="${tbMemVO.smsYn eq null }">checked</c:if>> <label for="smsn">허용안함</label></li>
					</ul>
				</td>
				<th scope="row"><label for="emailYn">메일링허용여부</label></th>
				<td>
					<ul class="chk_area">
						<li><input type="radio" name="emailYn" value="Y" id="emailY" <c:if test="${tbMemVO.smsYn eq 'Y' }">checked</c:if>> <label for="emailY">허용</label></li>
						<li><input type="radio" name="emailYn" value="" id="emailn" <c:if test="${tbMemVO.smsYn eq null }">checked</c:if>> <label for="emailn">허용안함</label></li>
					</ul>
				</td>
			</tr>
			</c:if>
			<tr>
				<th scope="row"><label for="addr">주소</label></th>
				<td class="left" colspan="3">
					<div class="group_addr">
						<div class="zipcode_txt">
							<input type="text" size="" class="txt" name="addr" id="addr" value="${resultList.addr } " maxlength="100" readonly="readonly">
							<button type="button" class="btn_st st_bg_blue small" onclick="fn_post_code( '#addr' );">우편번호찾기</button>
						</div>
						<div class="addr_txt">
							<input type="text" size="" class="txt" name="addrDtl" id="addrDtl" value="${resultList.addrDtl }" maxlength="100">
						</div>
					</div>
				</td>
			</tr>
			<c:if test="${resultList.code eq '0003' }">
				<tr>
					<th scope="row"><label for="comAddr">사업장주소<span class="tbl_star">*</span></label></th>
					<td class="left" colspan="3">
						<div class="group_addr">
							<div class="zipcode_txt">
								<input type="text" size="" class="txt" name="comAddr" id="comAddr" value="${resultList.comAddr }" maxlength="100" readonly="readonly">
								<button type="button" class="btn_st st_bg_blue small" onclick="fn_post_code( '#comAddr' );">우편번호찾기</button>
							</div>
							<div class="addr_txt">
								<input type="text" size="" class="txt" name="comAddrDtl" id="comAddrDtl" value="${resultList.comAddrDtl }" maxlength="100">
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row"><label for="comType">기업성격<span class="tbl_star">*</span></label></th>
					<td class="left" colspan="3">
						<ul class="chk_area">
							<li><input  type="radio" name="comType" value="C" id="comType1" <c:if test="${resultList.comType eq 'C' }">checked</c:if>> <label for="comType1">중소기업</label></li>
							<li><input  type="radio" name="comType" value="D" id="comType2" <c:if test="${resultList.comType eq 'D' }">checked</c:if>> <label for="comType2">디자인전문회사</label></li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<th scope="col"><label for="comFileSeq">사업자등록증<span class="tbl_star">*</span></label></th>
					<td colspan="3">
						<form:hidden path="comFileSeq"/>
						<div class="area_filebox upload">
					  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
						 	<label for="multi_attach">파일찾기</label>
							<input type="file" name="multi_attach" id="multi_attach" class="upload_hidden" /> 
							<a href="#none" class="upload_btn"  onclick="thumbnail_image()">업로드</a>
							
							<ul id="multi_file_attch" class="multi_file_attch" >
							</ul>
						</div>
						<div id="multi_file_attch" class="multi_file_attch">
							<c:if test="${not empty resultList.comFileSeq }">
							<li id="${resultList.comFileSeq }" style='width:75%;margin-bottom:5px;'>
							<i class="main_img">
								<a href="/imagefile/preview.do?fileSeq=${resultList.comFileSeq }" >${resultList.fileNm }</a>
							</i>
							<a class="tbl-btn" href="javascript:thumbnail_delete('${resultList.comFileSeq }');">삭제</a></li>
							</c:if> 
						</div>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
		
	<div class="bd_btn_area center">
		<c:if test="${flag == 'update'}">
			<a href="#" class="btn_black" onclick="javascript:history.back()">취소</a>
			<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
		</c:if>
		<c:if test="${flag == 'insert'}">
			<a href="#" class="btn_black"onclick="javascript:history.back()" >취소</a>
			<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
		</c:if>	
	</div>
</form:form>