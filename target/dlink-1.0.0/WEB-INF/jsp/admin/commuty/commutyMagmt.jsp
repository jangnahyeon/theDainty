<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyRegister.jsp
  * @Description : TCommuty Register 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TCommutyVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javascript" src="/DLink/HTML/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>	
<script type="text/javaScript" language="javascript" defer="defer">
 


/* 네이버에디터 스크립트 */
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

  
/* 네이버에디터 스크립트 end*/  
				
				
    
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/commuty/commutyInquiryList.do?menu_id=gongji'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {

	var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: "/admin/commuty/deleteCommuty.do",
		    data : data,
		    dataType: "text",
		    success: function(rst){
		        if(rst != null){
		        	if(rst == "suc"){
		        		alert("삭제 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "삭제에 실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
}

/* 글 등록 function */
function fn_egov_save() {	
	
	
	var title = $("#title").val();
	if(title == ""){
		alert("제목을 입력해주세요.");
		
		return false;
	}
	
	// 필수입력
	var openYn = $("input:radio[name=openYn]:checked").val();
	if(openYn == null){
		alert("사용여부를 선택해주세요.");
		
		return false;
	}
	
	
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", [])
	  var cont = document.getElementById("cont").value;
	  
	var registerFlag = $("#registerFlag").val();
	 var menuId = $("#menuId").val();	 
	 var data = $("#detailForm").serialize();
	 
	var urlval = "";
	if(registerFlag == 'insert'){
		urlval = "/admin/commuty/addCommuty.do";
		
	}else{
		urlval = "/admin/commuty/updateCommuty.do";
	}
	
		
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
	        		alert(res);
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
		
	var formData = new FormData();
	formData.append("file", $("input[name=multi_attach]")[0].files[0]);
	
	if ($("#multi_attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
	if ($('#multi_attach').val() != null) {
		var ext = $('#multi_attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg', 'xlsx', 'hwp']) == -1) {
			alert('파일만 업로드 가능합니다');
			return;
		}
	}
	
	/* if($("#file_attch div").length > 0){
		alert("파일을 삭제해주세요");
		return;
	} */
	
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
						
						$('#multi_file_attch').append( 
								"<li id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>" 
								+ "<input type='hidden' name='file_attch' value='"+tmp1+"' />"
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\">"+ tmp2+ "</a>"
								+ '&nbsp;&nbsp;<a class="btn_del" href="javascript:multi_image_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					$("#fileSeq").val(tmp1);
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

//다중 이미지 삭제
function multi_image_delete(val){
	
	
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
					
					$("#detailForm").submit();
					return ;
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


//다중 이미지 삭제
function save_image_delete(fileSeq){
	
	
	 var fileSeq = document.getElementById("detailForm").fileSeq.value = fileSeq;
	 var formData = $("#detailForm").serialize();
		
	 
	$.ajax({
		url : "/admin/commuty/deleteFileCommuty.do",
		data : formData ,	
		type : "POST",
		dataType : "text",
		success : function(res) {			
			if(res == "suc") {
				$("#"+val).remove();
				alert('삭제하였습니다.');
				
				$("#detailForm").submit();
			} else{
				alert('삭제에 실패했습니다. \n 다시 시도해 주세요.');
				return false;
			}
			
		},
		error : function(request, status, error) {
			alert("시스템 오류가 발생했습니다. \n 관리자에게 문의하세요.");
		}
	});
	
}
</script>			



<form:form name="searchForm" id="searchForm" method="post" action="/admin/commuty/commutyInquiryList.do?menu_id=gongji">
	
</form:form>




	<form:form modelAttribute="TCommutyVO" name="detailForm" id="detailForm" >
		<form:hidden path="menuId" value="${menuId}"/>
		<form:hidden path="postNo" />
		<form:hidden path="seq" />
		<form:hidden path="registerFlag" value="${registerFlag}"/>
		<form type="hidden" name="fileSeq" id="fileSeq" />
		
		<!-- 컨텐츠 영역 s -->
				<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
				<div>					
				<table class="bd_tbl bd_tbl_view">
					<caption>신청내역</caption>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="app_nm">제목</label> <span class="tbl_star">*</span></th>
							<td><form:input type="text" path="title" /></td>
						</tr>
						<tr>
							<th scope="row"><label for="con_cd1">공개여부</label> <span class="tbl_star">*</span></th>
							<td colspan="3">
								<ul class="chk_area">									
									<li>
										<form:radiobutton path="openYn" value="Y" />
										<label for="openYn">사용</label>
									</li>
									<li>
										<form:radiobutton path="openYn" value="N" />
										<label for="openYn">미사용</label>
									</li>
								</ul>
							</td>
							<%-- <th><label for="cont">비밀번호</label></th>
							<td>
								<form:password path="pwd" />
							</td> --%>
						</tr>
						<tr>
							<th scope="row" rowspan="2"><label for="ex_filename">파일내용</label></th>
							<td colspan="3">	
								<c:choose>
									<c:when test="${registerFlag == 'update'}">
										<form:hidden path="fileSeq"/>
										
										 <div class="area_filebox upload">
											<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." />
											<label for="multi_attach">파일찾기</label>
											<input type="file" id="multi_attach" name="multi_attach" class="upload_hidden" />
											<button type="button" class="upload_btn" onclick="multi_image_upload(); return false;">업로드</button>
										</div>
											
										<ul id="multi_file_attch" class="multi_file_attch">
											<c:if test="${not empty selectTCommutyFileList}">
												<c:forEach var="vlimg" items="${selectTCommutyFileList}" varStatus="vlvs">	
													
														<li id='"+tmp1+"' style='width:75%;margin-bottom:5px;'>
															<a href='/imagefile/download.do?file_no=${vlimg.fileSeq }' class="mt_image_file">${vlimg.fileNm }</a>
															<input type="hidden" name="file_attch" value="${vlimg.fileSeq}" /> 
															<a class="btn_del" href="javascript:save_image_delete('${vlimg.fileSeq }');">삭제</a>
														</li>
													
												</c:forEach>		
											</c:if>
										</ul>
									</c:when>
									<c:otherwise>
										<form:hidden path="fileSeq"/>
										
										 <div class="area_filebox upload">
											<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." />
											<label for="multi_attach">파일찾기</label>
											<input type="file" id="multi_attach" name="multi_attach" class="upload_hidden" />
											<button type="button" class="upload_btn" onclick="multi_image_upload(); return false;">업로드</button>
										</div>
										
										<ul id="multi_file_attch" class="multi_file_attch">
										</ul>
										
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td id="file_attch" class="" colspan="3">
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="cont">내용</label></th>
							<td colspan="3">
								<form:input type="text" path="cont" />		    	
								 	<!-- <textarea id="conttemt" name="cont" rows="10" cols="100"/>		이걸로 에디터 적용시 아래의 버튼 적용 안됨    --> 										
							</td>
						</tr>
						
					</tbody>
				</table>
				
			</div>
				
					
				<!-- // 타이틀 -->
				<div class="bd_btn_area center" id="sysbtn">							
					<c:if test="${registerFlag == 'update'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" id="save" class="btn_black line_gray">수정</a>
						<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
					</c:if>
					<c:if test="${registerFlag == 'insert'}">
						<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>
						<a href="javascript:fn_egov_save();" id="save"  class="btn_black line_gray">등록</a>
					</c:if>		
				</div>
			
				
			<!-- //컨텐츠 영역 e -->
			
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			
			
	</form:form>




								