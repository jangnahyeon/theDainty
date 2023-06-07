<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
 /**
  * @Class Name : cpmWrite.jsp
  * @Description : cpmWrite 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-04
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>


<script type="text/javaScript" language="javascript" defer="defer">


/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/company/cpmInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}


/* 글 수정등록 function */
function fn_egov_save() {	
	
	var registerFlag = $("#registerFlag").val();
	var cont = $("#sex").val();
	var urlval = "";
	var form = document.detailForm;
	  
	/* if(form.loginId.value=="" || form.ceoNm.value=="" || form.comNm.value=="" || form.ceoMobileNo.value=="" || form.comNo.value=="" ) {      
		alert("필수값을 입력해주세요.");
	return ;
	} */
	  
	if(registerFlag == 'insert'){
		alert("등록 하시겠습니까?");
		urlval = "/admin/company/addTMemCom.do";
	}else{
		alert("수정 하시겠습니까?");
		urlval = "/admin/company/updateTMemCom.do";
	}
		
	 var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: urlval,
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
		        		$("#searchForm").submit();
		        	}else if(res == "upsuc"){
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
/* 저장된 파일 정보 삭제 function */
function fn_egov_FileDelete(fileSeq) {	

		$.ajax({
		    type: "POST",
		    url: "/admin/company/deleteCompanyFile.do",
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
<form:form name="searchForm" id="searchForm" method="post" action="/admin/company/cpmInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TMemComVO" name="detailForm" id="detailForm" >
	<c:if test="${registerFlag == 'update'}">			
		<%-- <form:hidden path="loginId"/> --%>
	</c:if>
	<form:hidden path="registerFlag" value="${registerFlag}"/>

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
				<th scope="row"><label for="loginId">아이디</label></th>
				<td class="left">
					<form:hidden  path="loginId" cssclass="txt w40"  /><form:errors path="loginId" />
					${TMemComVO.loginId}
				</td>
				<th scope="row"><label for="ceoNm">대표명</label></th>
				<td>
					<form:input path="ceoNm" cssclass="txt w40" /><form:errors path="ceoNm" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="comNm">기업명</label></th>
				<td class="left">
					${TMemComVO.comNm}
				</td>
				<th scope="row"><label for="ceoMobileNo">대표자휴대폰</label></th>
				<td>	
					<form:input name="ceoMobileNo" path="ceoMobileNo" cssclass="txt w40" /><form:errors path="ceoMobileNo" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="comType">기업형태</label></th>
				<td class="left">		
					<form:hidden path="comType" cssclass="txt w40" /><form:errors path="comType" />
					${TMemComVO.comType}
				</td>
				<th scope="row"><label for="sex">대표자성별</label></th>
				<td>	
					<c:choose>
						<c:when test="${TMemComVO.sex == 'SX0001'}">
							남자
						</c:when>
						<c:otherwise>
							여자
						</c:otherwise>
					</c:choose>
				</td>
			</tr>	
			<tr>
				<th scope="row"><label for="comNo">법인등록번호</label></th>
				<td class="left">
					<form:hidden name="comNo" path="comNo" cssclass="txt w40" /><form:errors path="comNo" />
					${TMemComVO.comNo}
				</td>
				<th scope="row"><label for="comUrl">기업홈페이지</label></th>
				<td>
					<form:input path="comUrl" cssclass="txt w40" /><form:errors path="comUrl" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">사업장주소</label></th>
				<td class="left" colspan="3">
					<div class="group_addr">
						<div class="zipcode_txt">
							<form:input path="comZip" cssClass="txt fxw" /><form:errors path="comZip" />
						</div>
						<div class="addr_txt">
							<form:input path="comAddr" cssClass="txt" /><form:errors path="comAddr" />
							<form:input path="comDtlAddr" cssClass="txt" /><form:errors path="comDtlAddr" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangNm">담당자명</label></th>
				<td class="left">
					<form:input path="damdangNm" cssclass="txt w40" /><form:errors path="damdangNm" />
				</td>
				<th scope="row"><label for="reqPart">신청분야</label></th>
				<td>
					<form:input path="reqPart" cssclass="txt w40" /><form:errors path="reqPart" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangDept">담당자부서</label></th>
				<td class="left">
					<form:input path="damdangDept" cssclass="txt w40" /><form:errors path="damdangDept" />
				</td>
				<th scope="row"><label for="damdangPos">담당자직위</label></th>
				<td>
					<form:input path="damdangPos" cssclass="txt w40" /><form:errors path="damdangPos" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="damdangMobileNo">담당자연락처</label></th>
				<td class="left">
					<form:input path="damdangMobileNo" cssclass="txt w40" /><form:errors path="damdangMobileNo" />
				</td>
				<th scope="row"><label for="damdangEmail">담당자이메일</label></th>
				<td>
					<form:input path="damdangEmail" cssclass="txt w40" /><form:errors path="damdangEmail" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="specYn">전문회사여부</label></th>
				<td class="left">
					<ul class="chk_area">									
						<li>
							<form:radiobutton path="specYn" value="Y" cssclass="txt w40"  />
							<label for="specYn">사용</label>
						</li>
						<li>
							<form:radiobutton path="specYn" value="N" cssclass="txt w40"  />
							<label for="specYn">미사용</label>
						</li>
					</ul>
				</td>
				<th scope="row"><label for="regDt">등록일</label></th>
				<td>
					<form:hidden path="regDt" cssclass="txt w40" /><form:errors path="regDt" />
					${TMemComVO.regDt}
				</td>
			</tr>
			<tr>
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
	
	<div id="sysbtn" class="bd_btn_area center">						
		<c:if test="${registerFlag == 'update'}">
			<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
			<a id="bt_00" href="javascript:fn_egov_save();" class="btn_black line_gray">수정</a>
		</c:if>
		<c:if test="${registerFlag == 'insert'}">
			<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
			<a href="javascript:fn_egov_save();" class="btn_black line_gray">등록</a>
		</c:if>
	</div>
 	
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>

