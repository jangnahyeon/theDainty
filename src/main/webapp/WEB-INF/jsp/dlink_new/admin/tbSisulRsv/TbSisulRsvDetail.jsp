<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcDtl.jsp
  * @Description : ntcDtl 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function () {
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
	$( "#rsvDt" ).datepicker({
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		buttonImage: "/DLink/admin2_html/images/contents/btn_calendar.gif", 
		showOn: 'button', 
		buttonImageOnly: true,
		buttonText: "달력",
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: "yy-mm-dd",
		/* minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
		onClose: function( selectedDate ) {    
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
// 			$("#req_dt").datepicker( "option", "minDate", selectedDate );
		}
	});
	
	
	// 시작시간 selectbox 만들기
	$('#rsvSt').empty();
	$('#rsvSt').append('<option value="' + '시작시간 선택' + '" >' + '시작시간 선택' + '</option>');

	var start = 0;
    for (var y = 9; y < 16; y++){
		   	start = y;
		   	if(start == 9){
		   		start = '09';
		   	}
   	        $('#rsvSt').append('<option id="' + "s" + start + '" value="' + start  + '">' + start  + ':00</option>');
   	    }
});
function addReply() {
	
	var params = $("#listForm").serialize();
	var cont =  $("#cont").val();
	params += "&cont="+cont;
	console.log(params);
	
	$.ajax({
		url : "/admin/tbSisulRsv/TbSisulRsvReplyAdd.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	        	alert("저장되었습니다.");
	        	fn_brd_cmt_list_act();
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
}
function replyUpdate(cmtSeq) {
	
	$(".replyUpdate" + cmtSeq).show();
	$(".replyCont" + cmtSeq).hide();
	
	$(".saveBtn").show();
	$(".updateBtn" ).hide();
	
	
}
function  replySave(cmtSeq){
	var params = $("#listForm").serialize();
	var contNum = "cont" + cmtSeq;
	
	var cont =  $("#cont" + cmtSeq).val();
	params += "&contUpdate="+cont;
	params += "&cmtSeq="+cmtSeq;
	console.log(params);
	
	$.ajax({
		url : "/admin/tbSisulRsv/TbSisulRsvReplyUpdate.do",
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

function  replyDelete(cmtSeq){
	var params = $("#listForm").serialize();
	params += "&cmtSeq="+cmtSeq;
	
	$.ajax({
		url : "/admin/tbSisulRsv/TbSisulRsvReplyDelete.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	        	alert("삭제되었습니다.");
	        	fn_brd_cmt_list_act();
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
}

function fn_brd_cmt_list_act() {
	var rsvSeq = "${result.rsvSeq }";
	/* alert(rsvSeq); */
	$.ajax({
		url : "/admin/tbSisulRsv/TbSisulRsvCmt.do",
		data : {
			"rsvSeq" : rsvSeq
		},
		type : "post",
		dataType : "text",
		success : function(res) {
			if( res ) {
				//alert("의견을 조회하였습니다.");
				$("#reply_lst").empty();
				$("#reply_lst").append(res);
				$("#cont").val("");
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
function  acceptYn(status){
	var params = $("#listForm").serialize();
	params += "&acceptYn="+status;
	console.log(params);
	if(status == 'N' && $("#rejectMsg").val() == '') {
		alert("반려사유를 입력해주세요");
		return;
	}
	$.ajax({
		url : "/admin/tbSisulRsv/TbSisulRsvAcceotUpdate.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	    		if(status == "W") {
	        		alert("대기처리되었습니다.");
	    		} else if(status == "Y") {
	    			alert("승인처리되었습니다.");
	    		} else if(status == "N") {
	    			alert("반려처리되었습니다.");
	    		}
	        	location.reload();
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}

function go_excel(){
	document.getElementById("listForm").action = "/admin/excel/TbSisulRsvExcelDown.do";
   	document.getElementById("listForm").submit();
};
function updateRsvDt() {
	var rsvDt = $("input[name=rsvDt]").val();
	var rsvYear = rsvDt.substring(0,4);
	var rsvMonth = rsvDt.substring(5, 7);
	var rsvDay = rsvDt.substring(8, 10);
	var rsvSt = $("select[name=rsvSt2]").val();
	var rsvEt = $("select[name=rsvEt2]").val();
	$('input[name=rsvYear]').attr('value',rsvYear);
	$('input[name=rsvMonth]').attr('value',rsvMonth);
	$('input[name=rsvDay]').attr('value',rsvDay);
	$('input[name=rsvSt]').attr('value',rsvSt);
	$('input[name=rsvEt]').attr('value',rsvEt);
	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var wk = week[new Date(rsvYear + "-" + rsvMonth + "-" + rsvDay).getDay()];
	$('input[name=title]').attr("value",  rsvYear + "년" + rsvMonth + "월" + rsvDay + "일" + "(" + wk + ")");
	var tdtitle = document.getElementById("tdtitle").innerText;
	$("#tdtitle").empty();
	tdtitle = rsvYear + "년" + rsvMonth + "월" + rsvDay + "일" + "(" + wk + ")";
	$("#tdtitle").append(tdtitle);
	
	var data = $("#listForm").serialize();
	if(confirm("수정하시겠습니까?")) {
		$.ajax({
			url : "/admin/tbSisulRsv/updateRsvDt.do",
			data : data,
			type : "post",
			dataType : "text",
			success : function(res) {
				if( res ) {
					alert("수정되었습니다.")
					
				} else {
					alert("수정에 실패하였습니다.");
				}
			},
			error : function(err) {
				alert("수정에 실패하였습니다..");
			}
		});
	} else {
		return;
	}
	
}
function go_delete(rsvSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").rsvSeq = rsvSeq; 
		document.getElementById("listForm").action = "<c:url value='/admin/tbSisulRsv/deleteTbSisulRsv.do'/>";
   		document.getElementById("listForm").submit();
	}
}
</script>
<form:form modelAttribute="result" name="listForm" id="listForm" method="post">
					<form:hidden path="title"/>
					<form:hidden path="rsvSeq"/>
					<form:hidden path="memId"/>
					<form:hidden path="memSeq"/>
					<form:hidden path="rsvYear"/>
					<form:hidden path="rsvMonth"/>
					<form:hidden path="rsvDay"/>
					<form:hidden path="rsvSt"/>
					<form:hidden path="rsvEt"/>
					<div class="bd_top_type02">
						<h4 class="mt0 tit area_left">시설예약관리</h4>
						
						<div class="bd_btn_area right">
							<a href="#" onclick="javascript:acceptYn('W');" class="btn_st small line_blue">대기</a>
							<a href="#" onclick="javascript:acceptYn('Y');" class="btn_st small">승인</a>
							<a href="#" onclick="javascript:acceptYn('N');" class="btn_st small line_orange">반려</a>
							
						</div>
					</div>
						<table class="bd_tbl bd_tbl_view"> 
				        	<caption>게시판 상세보기</caption>
				        	<colgroup>
				        		<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
								
				        	</colgroup>
				        	<tbody>
				        		<c:if test="${result.comNm eq null }">
				        			<tr>
										<th scope="row"><label for="org_nm">작성자</label> </th>
										<td colspan="3">${result.memId }</td>
									</tr>
				        		</c:if>
								<c:if test="${result.comNm ne null }">
				        			<tr>
										<th scope="row"><label for="org_nm">업체명</label> </th>
										<td colspan="3">${result.comNm }</td>
									</tr>
				        		</c:if>
								<tr id="trtitle">
									<th scope="row"><label for="address">제목</label></th>
									<td colspan="3" id="tdtitle">${result.title } </td> 									
								</tr>
								<tr id="trtitle">
									<th scope="row"><label for="address">예약구분</label></th>
									<td colspan="3" id="tdrsvGbCd">
										<c:forEach var="codelist" items="${codelist}">
											<c:if test="${codelist.gbCd == 'plt008'}">
												<c:if test="${codelist.code == result.rsvGbCd }">
													${codelist.codeNm }
												</c:if>
											</c:if>
										</c:forEach>
									</td> 									
								</tr>
								<tr>
									<th scope="row"><label for="org_cd">예약일시</label></th>
									<td colspan="3">
										<div style="margin-right:20px;display:inline-block">
											<input readonly type="text" id="rsvDt" name="rsvDt" value="${result.rsvYear}-${result.rsvMonth}-${result.rsvDay}" style="width:150px;">
										</div>
										 <select style="width:100px" id="rsvSt2" name="rsvSt2" class="rsvSt" >
											 <option>시작시간 선택</option>
											 <c:forEach var="i"  begin="9" end="18">
										        <option value="${i}" <c:if test="${result.rsvSt eq i }">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
										     </c:forEach>
										 </select>
										 <select style="width:100px" id="rsvEt2" name="rsvEt2" class="rsvEt">
											 <option>종료시간 선택</option>
											 <c:forEach var="i"  begin="9" end="18">
										        <option value="${i}" <c:if test="${result.rsvEt eq i }">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
										     </c:forEach>
									     </select>
										<!-- <a href="#" onclick="window.location.reload();" class="btn_st small">초기화</a> -->
										<a href="#" onclick="javascript:updateRsvDt();" class="btn_st small line_gray">수정</a>
									</td>
									
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영품개수</label></th>
									<td>${result.prodCnt}</td>
									<th scope="row"><label for="fax">촬영제품</label></th>
									<td>${result.prod1}</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영품크기</label></th>
									<td>${result.prodSizeCd }</td>
									<th scope="row"><label for="fax">촬영반사유무</label></th>
									<td>${result.prodRefCd }</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영목적</label></th>
									<td colspan="3">- ${fn:replace(result.purposeCd, ',', '</br>- ')}</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">중소상공인확인서 파일첨부</label></th>
									<td colspan="3">
										<ul class="">
												<li><a href="/imagefile/download.do?file_no=${result.smBizFileSeq }"> ${result.fileNm }</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">제품사진 파일첨부</label></th>
									<td colspan="3">
										<ul class="lst_bul02">
											<c:forEach var="resultList" items="${fileList}" varStatus="vs">
												<li><a href="/imagefile/download.do?file_no=${resultList.fileSeq }"> ${resultList.fileNm }</a></li>
											</c:forEach>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">처리상태</label></th>
									<td colspan="3">
										<c:if test="${result.acceptYn eq 'Y'}">승인</c:if>
										<c:if test="${result.acceptYn eq 'N'}">반려</c:if>
										<c:if test="${result.acceptYn eq 'W'}">대기</c:if>
										<c:if test="${result.acceptYn eq 'C'}">취소</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">반려사유</label></th>
									<td colspan="3">
										<input type="text" name="rejectMsg" id="rejectMsg" value="${result.rejectMsg }"maxlength="100"/>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="regDt">등록일</label></th>
									<td  colspan="3"><fmt:formatDate value="${result.regDt}" pattern="y-MM-dd" type="date"/></td>
								</tr>
								<tr>
									<th scope="row"><label for="">납기본 업로드</label></th>
									<td colspan="3">
									<p class="mb10 left"style="font-size:14px"><strong class="cl_red">*</strong> 납기본 업로드 시 해당 회원에게 설문조사링크와 함께 알림톡이 전송됩니다. 설문조사링크 입력 후 업로드 버튼을 눌러주세요.</p>
										<div style="margin-bottom:10px">
											<div style="display:inline-block">
												<p>설문조사링크 : </p>
											</div>
											<div style="display:inline-block">
											<input type="text" name="surveyLink" id="surveyLink" value="" maxlength="1000" style="inlink-block;width:500px;"/>
											</div>
										</div>
										<form:hidden path="fileSeq"/>
										<div class="area_filebox upload">
									  		<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										 	<label for="attach">파일찾기</label>
											<input type="file" name="attach" id="attach" class="upload_hidden" /> 
											<a href="#none" class="upload_btn"  onclick="image_upload()">업로드</a>
											
											<ul id="attach" class="attach" >
											</ul>
										</div>
										<div id="file_attch" class="file_attch">
											<c:if test="${result.fileSeq != 0}">
												<li id="${result.fileSeq }" >
													<a href="/imagefile/preview.do?fileSeq=${result.fileSeq }" id="fileNm">${result.zipFileNm }</a>
													<a class="btn_del" href="javascript:file_delete('${result.fileSeq }');">삭제</a>
												</li>
												
											</c:if> 
										</div>
									</td>
								</tr>	
							</tbody>
						</table>
						
						<div class="reply_area">
							<div class="reply_form">
								<label for="reply_write" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;">의견을 등록해 주세요. 댓글은 1000자까지 입력 가능합니다.</label>
								<textarea id="cont" maxlength="1000"></textarea>
								<a href="#" onclick="javascript:addReply();">의견등록</a>
							</div>

							<ul class="reply_lst" id="reply_lst">
								
						</div>
						
						<div class="bd_btn_area center">
							<a href="#" onclick="javascript:go_delete('${result.rsvSeq}');"class="btn_black line_orange">삭제</a>
							<a href="javascript:go_excel();" class="btn_black line_blue">엑셀다운</a>
							<a href="/admin/sisul/sisulRsvList.do" class="btn_black btn_list">목록</a>
						</div>
</form:form>
<script>
function image_upload(){
	var surveyLink = document.getElementById('surveyLink').value;
	if(surveyLink == null || surveyLink == 'undefined' || surveyLink == '') {
		alert("설문조사링크를 입력해주세요.");
		return;
	}
	
	if ($('#attach').val() != null) {
		var ext = $('#attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['zip', 'egg']) == -1) {
			alert('압축파일만 업로드 가능합니다');
			return;
		}
	}
	
	var formData = new FormData();
	formData.append("file", $("input[name=attach]")[0].files[0]);

	if ($("#attach")[0].files[0] == null) {
		alert('파일을 선택해주세요.');
		return;
	}
	/* if ($('#attach').val() != null) {
		var ext = $('#attach').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg']) == -1) {
			alert('이미지 파일만 업로드 가능합니다');
			return;
		}
	} */
	
	if($("#file_attch li").length > 0){
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
						$('#file_attch').append( 
								"<li id='"+tmp1+"' >" 
								+ "<a href='/imagefile/download.do?file_no="+ tmp1+ "' class=\"mt_image_file\" id=\"fileNm\" >"+tmp2+"</a>"
								+ '&nbsp;&nbsp;<a class="btn_del"  href="javascript:file_delete(\''+tmp1+'\');">삭제</a></li>');
					}
					$("#fileSeq").val(tmp1);
					file_update(tmp1);
					
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

function file_update( val){
	var formData = new FormData();
	formData.append("fileSeq", val);
	formData.append("rsvSeq", "${result.rsvSeq }");
	formData.append("memId", "${result.memId }");
	formData.append("memSeq", "${result.memSeq }");
	
	var surveyLink = document.getElementById('surveyLink').value;
	formData.append("surveyLink", surveyLink);
	 
	$.ajax({
		url : "/admin/tbSisulRsv/updateZipFile.do",
		data : formData ,
		processData : false,
		contentType : false,
		async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				if(res == "Y") {
					alert('파일이 정상적으로 등록되었습니다');
				} else{
					alert('업로드 실패했습니다. \n 다시 시도해 주세요.');
					return ;
				}
			} else {
				alert('업로드 실패했습니다. \n 다시 시도해 주세요.');
				return ;
			}
		},
		error : function(request, status, error) {
			alert("시스템 오류가 발생했습니다. \n 관리자에게 문의하세요.");
		}
	});
}

function file_delete( val){
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
					$("#fileSeq").val('');
					zipFileDelete();
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
function zipFileDelete(){
	var formData = new FormData();
	formData.append("rsvSeq", "${result.rsvSeq }");
	formData.append("memId", "${result.memId }");
	formData.append("memSeq", "${result.memSeq }");
	
	$.ajax({
		url : "/admin/tbSisulRsv/deleteZipFile.do",
		data : formData ,
		processData : false,
		contentType : false,
		async : false,
		type : "POST",
		dataType : "text",
		success : function(res) {
			if(res != null) {
				if(res == "Y") {
					alert("삭제되었습니다.");
					$("#"+val).remove();
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

</script>