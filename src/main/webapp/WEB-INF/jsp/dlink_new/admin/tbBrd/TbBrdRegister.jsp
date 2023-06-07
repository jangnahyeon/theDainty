<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbBrdRegister.jsp
  * @Description : TbBrd Register 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-25
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="test" value="N"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<c:set var="registerFlag" value="${empty tbBrdVO.brdSeq || 0 eq tbBrdVO.brdSeq ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="tbBrdVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<!-- SmartEditor2 라이브러리  -->
<script type="text/javascript" src="/DLink/HTML_2023/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script tpye="text/javaScript">

/* 네이버스마트에디터 스크립트 s*/
 var oEditors = [];
$(function(){ 
     nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "cont", //textarea에서 지정한 id와 일치해야 합니다. 
         //SmartEditor2Skin.html 파일이 존재하는 경로
       sSkinURI: "/DLink/HTML_2023/js/smarteditor2/SmartEditor2Skin.html",
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
     /* oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []); */
}) 


</script>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbBrd/TbBrdList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if( !confirm( "삭제하시겠습니까?" ) ) {
		return;
	}
	
   	document.getElementById("detailForm").action = "<c:url value='/admin/tbBrd/deleteTbBrd.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	var title = $("#title").val();
	if(!title) {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	
	/* 네이버스마트에디터 validation*/
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", [])
	var cont = document.getElementById("cont").value;
	if (cont == "") {
		alert("내용을 입력해주세요.");

		return false;
	}
	
	if($("input:radio[name=srcNm]:checked").length < 1){
		alert("메뉴를 선택해 주세요.");
		return false;
 	};
	
	//return;
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/admin/tbBrd/addTbBrd.do' : '/admin/tbBrd/updateTbBrd.do'}"/>";
    frm.submit();

}


var tfileSeq = 0;
function fn_file_upload( fileId, fileNmId, fileSeqId ) {
	var file = $(fileId);
	var fileNm = $(fileNmId);
	var fileSeq = $(fileSeqId);
	
	var fileCnt = $("[name=multiFileSeq]").length;
	
	if( 5 <= fileCnt ) {
		alert("첨부파일은 최대 5개까지 등록이 가능합니다.");
		return;
	}
	
	var formData = new FormData();
	
	for( var i = 0; i < file[0].files.length; i++ ) {
		
		var ext = file[0].files[i].name.split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
		
		formData.append( "file" + i, file[0].files[i] );
	}
	
	var orgFileNm = file[0].files[0].name;
	fileNm.val( orgFileNm );
	
	//
<c:if test="${test eq 'Y' }">
	tfileSeq += 1;
	var attach = $("#multi_file_attch");
	var li = $("#proto").clone();
	li.removeAttr( "id" );
	li.attr("id", "proto_" + tfileSeq);
	li.show();
	
	var a_down = li.find(".mt_image_file");
	a_down.attr( "href", "/imagefile/download.do?file_no=" + tfileSeq );
	a_down.text( orgFileNm );
	
	var a_del = li.find(".btn_del");
	a_del.attr( "href", "javascript:file_delete(" + tfileSeq + ");" );
	
	var a_fileSeq = li.find("[name=multiFileSeq_proto]");
	a_fileSeq.val( tfileSeq );
	a_fileSeq.attr("name", "multiFileSeq");
		
	attach.append(li);
	
	return;
</c:if>
	
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
					
					//fileNm.val( file.fileNm );
					//fileSeq.val( file.fileSeq );
					
					var attach = $("#multi_file_attch");
					var li = $("#proto").clone();
					li.removeAttr( "id" );
					li.attr("id", "proto_" + file.fileSeq);
					li.show();
					
					var a_down = li.find(".mt_image_file");
					a_down.attr( "href", "/imagefile/download.do?file_no=" + file.fileSeq );
					a_down.text( orgFileNm );
					
					var a_del = li.find(".btn_del");
					
					a_del.attr( "href", "javascript:file_delete(" + file.fileSeq + ");" );
					
					var a_fileSeq = li.find("[name=multiFileSeq_proto]");
					a_fileSeq.val( file.fileSeq );
					a_fileSeq.attr("name", "multiFileSeq");
						
					attach.append(li);
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
<c:if test="${test eq 'Y' }">
	$("#proto_"+val).remove();
	return;
</c:if>
	
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
					$("#proto_"+val).remove();
					//$("#fileSeq").val('');
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

function fn_cmt_add_act() {
	
	var cont = $("#reply_write").val();
	if( !cont ) {
		alert("의견을 등록해 주세요.");
		$("#reply_write").focus();
		return;
	}
	
	$.ajax({
		url : "/admin/brdCmt/addBrdCmt_act.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"cont" : cont
		},
		type : "post",
		success : function(res) {
			if( "Y" == res ) {
				alert("의견을 등록하였습니다.");
				fn_brd_cmt_list_act();
			} else {
				alert("의견 등록에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 등록에 실패하였습니다..");
		}
	});
	
}

function fn_cmt_del_act(cmtSeq) {
	
	if( !confirm("의견을 삭제하시겠습니까?") ) {
		return;
	}
	
	$.ajax({
		url : "/admin/brdCmt/deleteBrdCmt_act.do",
		data : {
			"cmtSeq" : cmtSeq			
		},
		type : "post",
		success : function(res) {
			if( "Y" == res ) {
				alert("의견을 삭제하였습니다.");
				fn_brd_cmt_list_act();
			} else {
				alert("의견 삭제에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 삭제에 실패하였습니다..");
		}
	});
}

function fn_cmt_page_info(currentPageNo, totalPageCount) {	
	$("#cmtCurrentPageNo").val( currentPageNo );
	$("#cmtTotalPageCount").val( totalPageCount );
	
	var curPage = currentPageNo * 1;
	var totPage = totalPageCount * 1;
	
	$("#btn_cmt_more").find("a").text("더보기 (" + curPage + "/" + totPage + ")" );	
}

function fn_brd_cmt_list_act() {
	$.ajax({
		url : "/admin/tbBrdCmt/TbBrdCmtList.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"pageUnit" : 3
		},
		type : "post",
		dataType : "text",
		success : function(res) {
			if( res ) {
				//alert("의견을 조회하였습니다.");
				$("#reply_lst").empty();
				$("#reply_lst").append(res);
				$("#reply_write").val("");
			} else {
				alert("의견 조회에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 조회에 실패하였습니다..");
		}
	});
}

function fn_brd_cmt_list_more_act() {
	
	var cmtCurrentPageNo = $("#cmtCurrentPageNo").val();
	if( !cmtCurrentPageNo ) {
		return;
	}
	
	var cmtTotalPageCount = $("#cmtTotalPageCount").val();
	if( !cmtTotalPageCount ) {
		return;
	}
	
	var curPage = cmtCurrentPageNo * 1;
	var totPage = cmtTotalPageCount * 1;
	
	if( curPage >= totPage ) {
		alert("더이상 조회할 의견이 없습니다.");
		return;
	}
	
	$.ajax({
		url : "/admin/tbBrdCmt/TbBrdCmtList.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"pageUnit" : 3,
			"pageIndex" : curPage + 1
		},
		type : "post",
		dataType : "text",
		success : function(res) {
			if( res ) {
				//alert("의견을 조회하였습니다.");
				//$("#reply_lst").empty();
				$("#reply_lst").append(res);
				
			} else {
				alert("의견 조회에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 조회에 실패하였습니다..");
		}
	});
}

$(function(){
	fn_brd_cmt_list_act();
});
function fn_cmt_update(cmtSeq) {
	
	$(".replyUpdate" + cmtSeq).show();
	$(".replyCont" + cmtSeq).hide();
	
	$(".saveBtn").show();
	$(".updateBtn" ).hide();
}
function  fn_cmt_update_act(cmtSeq){
	var params = $("#detailForm").serialize();
	var contNum = "cont" + cmtSeq;
	
	var cont =  $("#cont" + cmtSeq).val();
	params += "&contUpdate="+cont;
	params += "&cmtSeq="+cmtSeq;
	console.log(params);
	
	$.ajax({
		url : "/admin/brdCmt/updateBrdCmt_act.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	        	alert("수정되었습니다.");
	        	fn_brd_cmt_list_act();
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}

// -->
</script>

</head>
<body>

<form:form modelAttribute="tbBrdVO" name="detailForm" id="detailForm" >
	<input type="hidden" name="menuSeq" value="${param.menuSeq }" />
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<div id="table">
	<table class="bd_tbl bd_tbl_view">
		<caption>게시판 상세보기</caption>
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<c:if test="${registerFlag == '수정'}">
		</c:if>
		<c:if test="${registerFlag == '등록'}">
		</c:if>		
		<%-- <tr>
			<th>BRD_SEQ</th>
			<td>
				<form:input path="brdSeq" cssClass="txt"/>
				&nbsp;<form:errors path="brdSeq" />
			</td>
		</tr>	
		<tr>
			<th>MENU_SEQ</th>
			<td>
				<form:input path="menuSeq" cssClass="txt"/>
				&nbsp;<form:errors path="menuSeq" />
			</td>
		</tr>
		 --%>		
		<c:if test="${registerFlag == '수정'}">
		<input type="hidden" name="brdSeq" value="${tbBrdVO.brdSeq}"/>
			<%-- <tr>
				<th>작성자번호</th>
				<td>
					<form:input path="memSeq" cssClass="txt" readonly="true"/>
					&nbsp;<form:errors path="memSeq" />
				</td>
			</tr> --%>	
		</c:if>
		<c:if test="${registerFlag == '수정'}">
			<tr>
				<th>작성자(ID)</th>
				<td>		
					<input type="text" value="${tbBrdVO.memVO.memNm }(${tbBrdVO.memId })">
					<form:hidden path="memId" cssClass="txt" readonly="true" maxlength="50"/>
					&nbsp;<form:errors path="memId" />						
				</td>
			</tr>
		</c:if>
		<tr>
			<th scope="row">제목<span class="tbl_star">*</span></th>
			<td>
				<form:input path="title" cssClass="txt" maxlength="100"/>
				<form:errors path="title" />
			</td>
		</tr>
		<tr>
			<th scope="row">메뉴 선택<span class="tbl_star">*</span></th>
			<td>
				<%-- <form:radiobutton  path="srcNm" /> --%>
				<form:radiobutton path="srcNm" title="디링크 공지사항" value="디링크 공지사항" label="디링크 공지사항"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<form:radiobutton path="srcNm" title="시설예약 공지사항" value="시설예약 공지사항" label="시설예약 공지사항"/>
				<form:errors path="srcNm" />
			</td>
		</tr>
		<tr>
			<th scope="row">관련 링크</th>
			<td>
				<form:input path="link" cssClass="txt" maxlength="100"/>
				<form:errors path="link" />
			</td>
		</tr>
		<tr>
			<th scope="row">내용<span class="tbl_star">*</span></th>
			<td>
				<!-- <div> -->
				<form:textarea path="cont" cssStyle="width: 100%; height: 250px;" 
					maxlength="1000" htmlEscape="false" value="${tbBrdVO.cont}"  />
					
					<%-- <c:out path="cont" value='${tbBrdVO.cont}' escapeXml="false" /> --%>
				<form:errors path="cont" />
				<!-- </div> -->	
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<div class="area_filebox" id="area_filebox">
					<input type="text" id="fileNm" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
					<label for="file">파일찾기</label>
					<input type="file" id="file" class="upload_hidden" onchange="fn_file_upload( '#file', '#fileNm', '#fileSeq' );">
					<input type="hidden" id="fileSeq"/>
				</div>
				<ul id="multi_file_attch" class="multi_file_attch">
					<li id="proto" style="display:none;">
						<a href="/imagefile/download.do?file_no=0" class="mt_image_file">fileNm.ext </a>
						&nbsp;&nbsp;
						<a class="btn_del" href="javascript:file_delete('0');">삭제</a>
						<input type="hidden" name="multiFileSeq_proto"/>
					</li>
					
					<c:forEach var="brdFileVO" items="${tbBrdVO.brdFileVOList }">
						<li id="proto_${brdFileVO.fileSeq }">
							<a href="/imagefile/download.do?file_no=${brdFileVO.fileSeq }" class="mt_image_file">${brdFileVO.fileVO.fileNm } </a>
							&nbsp;&nbsp;
							<a class="btn_del" href="javascript:file_delete('${brdFileVO.fileSeq }');">삭제</a>
							<input type="hidden" name="multiFileSeq" value="${brdFileVO.fileSeq }"/>
						</li>
					</c:forEach>
				</ul>
			</td>
		</tr>		
		<%-- <tr>
			<th scope="row">출처<span class="tbl_star">*</span></th>
			<td>
				<form:input path="srcNm" cssStyle="txt" maxlength="100"/>
				&nbsp;<form:errors path="srcNm" />
			</td>
		</tr>	 --%>
		<%-- <c:if test="${registerFlag == '수정'}">
			<tr>
				<th>작성일</th>
				<td>
					<form:input path="regDt" cssClass="txt" readonly="true" style="color: rgb(72, 72, 72);" maxlength="10"/>
					&nbsp;<form:errors path="regDt" />
				</td>
			</tr>	
		</c:if> --%>
		<%-- <tr>
			<th>REG_ID</th>
			<td>
				<form:input path="regId" cssClass="txt"/>
				&nbsp;<form:errors path="regId" />
			</td>
		</tr>	
		<tr>
			<th>UPD_DT</th>
			<td>
				<form:input path="updDt" cssClass="txt"/>
				&nbsp;<form:errors path="updDt" />
			</td>
		</tr>	
		<tr>
			<th>UPD_ID</th>
			<td>
				<form:input path="updId" cssClass="txt"/>
				&nbsp;<form:errors path="updId" />
			</td>
		</tr> --%>	
	</table>
  </div>
  
<c:if test="${registerFlag == '수정'}">
  
	<div class="reply_area">
		<div class="reply_form">
			<label for="reply_write" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;">의견을 등록해 주세요. 댓글은 1000자까지 입력 가능합니다.</label>
			<textarea id="reply_write" maxlength="1000"></textarea>
			<a href="javascript:fn_cmt_add_act();">의견등록</a>
		</div>
	
		<ul class="reply_lst" id="reply_lst">
			<li>
				<em>관리자<span>2021-02-19<span>08:50:34</span></span></em>
				<div>
					디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
				</div>
				<p class="btn_area_reply">
					<a href="#" class="btn_st bg_gray">삭제</a>
					<a href="#" class="btn_st line_gray"><span>수정</span></a>
				</p>
			</li>
			<li>
				<em>관리자<span>2021-02-19<span>08:50:34</span></span></em>
				<div>
					디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
				</div>
				<p class="btn_area_reply">
					<a href="#" class="btn_st bg_gray">삭제</a>
					<a href="#" class="btn_st line_gray"><span>수정</span></a>
				</p>
			</li>
			
			
		</ul>
		
		<input type="hidden" id="cmtCurrentPageNo" value="0" />
		<input type="hidden" id="cmtTotalPageCount" value="0" />
				
		<p class="bd_btn_area center" id="btn_cmt_more">
			<a href="javascript:fn_brd_cmt_list_more_act();" class="btn_black line_gray">더보기</a>
		</p>
	</div>

</c:if>
  
  	<%-- 
	<div id="sysbtn" class="bd_btn_area center">
		<ul>
			<li>
				<span class="btn_blue_l">
					<a href="javascript:fn_egov_selectList();">목록</a>
					<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
			<li>
				<span class="btn_blue_l">
				<a href="javascript:fn_egov_save();" class="btn_black line_gray"><c:out value='${registerFlag}'/></a>
				<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
			<c:if test="${registerFlag == '수정'}">
				<li>
					<span class="btn_blue_l">
						<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>
						<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
					</span>
				</li>
			</c:if>
			<li>
				<span class="btn_blue_l">
					<a href="javascript:document.detailForm.reset();">되돌리기</a>
					<img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" />
				</span>
			</li>
		</ul>
	</div>
	 --%>
	
	 
	 
	<div class="bd_btn_area center">
		<a href="javascript:fn_egov_selectList();" class="btn_black btn_list">목록</a>
		<a href="javascript:fn_egov_save();" class="btn_black line_gray"><c:out value='${registerFlag}'/></a>
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





<form:form commandName="boardVO"></form:form>

<form id="boardVO" action="/bbs/boardlist.do" method="post"></form>


