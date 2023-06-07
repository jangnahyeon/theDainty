<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="registerFlag" value="${empty searchVO.popSeq || 0 eq searchVO.popSeq ? '등록' : '수정'}"/>	

<title> <c:out value="${registerFlag}"/> </title>

<script type="text/javaScript" language="javascript" defer="defer">
function fn_file_upload( fileId, fileNmId, fileSeqId ) {
	$('#proto_').remove();
	var file = $(fileId);
	var fileNm = $(fileNmId);
	var fileSeq = $(fileSeqId);
	
	var formData = new FormData();
	
	for( var i = 0; i < file[0].files.length; i++ ) {
		formData.append( "file" + i, file[0].files[i] );
	}
	

	
	if ($('#smBizFile').val() != null) {
		var ext = $('#smBizFile').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
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
			
			if("Y" == res.result) {
				res.fileList.forEach(function(file) {
				/* $('#file_attch').empty(); */
					
				fileNm.val( file.fileNm );
				fileSeq.val( file.fileSeq );
					
				var proto = $('#proto').clone();
				proto.show();
				
				proto.attr("id", proto.attr("id") + "_");
				
				var protoimg = proto.find("img");
				protoimg.attr("src", "/imagefile/preview.do?fileSeq=" + file.fileSeq);
				
				var protodel = proto.find("a");
				protodel.attr("href", "javascript:file_delete(\'" + file.fileSeq +"\');");
				
				$('#file_attch').append(proto);
				
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
function file_delete(val){

	$('#fileNm').val('');
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
					var proto = $("#proto" + "_");
					proto.remove();
					$(proto).remove();
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

function fn_egov_add(){
	var title = $("#title").val();
	if (title == "") {
		alert("제목을 입력해주세요.");
		return false;
	}
	
	var openYn = $("input:radio[name=useYn]:checked").val();
	if (openYn == null) {
		alert("사용여부를 선택해주세요.");

		return false;
	}
	
	var fileSeq = $("#fileSeq").val();
	if(fileSeq == ''){
		alert("배너사진을 등록해주세요.");
		return false;
	}
	frm = document.getElementById("detailForm");
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/admin/tbBn/addTbBanner.do' : '/admin/tbBn/updateTbBanner.do'}"/>";
    frm.submit();
}

function fn_egov_delete(){
	if( !confirm( "삭제하시겠습니까?" ) ) {
		return;
	}
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbBn/deleteTbBanner.do'/>";
   	document.getElementById("detailForm").submit();
}
</script>
</head>
<body>

<form:form modelAttribute="searchVO" name="detailForm" id="detailForm" >
<c:if test="${registerFlag == '등록'}">
<input type="hidden" name="regId" value="${adminLoginVO.memId }"/>
</c:if>
<c:if test="${registerFlag == '수정'}">
<input type="hidden" name="modId" value="${adminLoginVO.memId }"/>
<input type="hidden" name="popSeq" value="${searchVO.popSeq }"/>
</c:if>
<input type="hidden" name="popGubun" value="B"/>
<div id="content_pop">
	<!-- // 타이틀 -->
	<div id="table">
	<table class="bd_tbl bd_tbl_view">
		<caption>게시판 상세보기</caption>
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
		<tr>
			<th scope="row">제목<span class="tbl_star">*</span></th>
			<td><input type="text" name="title" id="title" value="${searchVO.title }"></td>
		</tr>
		<tr>
			<th scope="row">내용<span class="tbl_star">*</span></th>
			<td><textarea name="contents" id="contents">${searchVO.contents }</textarea></td>
		</tr>
		<tr>
			<th scope="row">사용유무<span class="tbl_star">*</span></th>
			<td>	
				<ul class="chk_area">
					<li>
						<input type="radio" name="useYn" value="Y" id="useY" <c:if test="${searchVO.useYn eq 'Y' }">checked</c:if>> <label for="useY">사용</label>
					</li>
					<li>
						<input type="radio" name="useYn" value="N" id="useN"<c:if test="${searchVO.useYn eq 'N' }">checked</c:if>> <label for="useN">사용안함</label>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th scope="row">이미지<span class="tbl_star">*</span></th>
			<td>
				<div class="area_filebox" id="area_filebox">
					<input type="text" id="fileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다." <c:if test="${not empty searchVO.fileNm}"> value="${searchVO.fileNm }"</c:if>>
					<label for="file">파일찾기</label>
					<input type="file" id="file" class="upload_hidden" onchange="fn_file_upload( '#file', '#fileNm', '#fileSeq' );">
					<input type="hidden" name="fileSeq" id="fileSeq" <c:if test="${not empty searchVO.fileSeq}"> value="${searchVO.fileSeq}"</c:if> />
				</div>
				<ul id="file_attch" class="file_attch">
					<li id="proto" style="display:none;">
						<img src="" class="mt_image_file" style="width:200px; height:80px">
						&nbsp;&nbsp;
						<a class="btn_del" href="">삭제</a>
						<input type="hidden" />
					</li>
					<c:if test="${registerFlag == '수정'}">
						<li id="proto_">
							<img src="/imagefile/preview.do?fileSeq=${searchVO.fileSeq }" class="mt_image_file" style="width:200px; height:80px">
							&nbsp;&nbsp;
							<a class="btn_del" href="javascript:file_delete('${searchVO.fileSeq }');">삭제</a>
						</li>
					</c:if>
				</ul>
			</td>
		</tr>
	</table>
  </div>
	<div class="bd_btn_area center">
		<a href="/admin/tbBn/TbBnList.do" class="btn_black btn_list">목록</a>
		<a href="javascript:fn_egov_add();" class="btn_black line_gray"><c:out value='${registerFlag}'/></a>
		<c:if test="${registerFlag == '수정'}">
			<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
		</c:if>
	</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>

