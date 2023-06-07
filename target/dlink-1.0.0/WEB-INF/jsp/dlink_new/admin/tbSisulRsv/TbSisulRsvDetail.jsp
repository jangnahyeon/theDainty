<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
<form:form modelAttribute="result" name="listForm" id="listForm" method="post">
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
								<tr>
									<th scope="row"><label for="org_nm">업체명</label> </th>
									<td colspan="3">${result.comNm }</td>
								</tr>
								<tr>
									<th scope="row"><label for="address">제목</label></th>
									<td colspan="3">${result.title } </td> 									
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
									<td colspan="3">${result.purposeCd }</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">중소상공인확인서 파일첨부</label></th>
									<td colspan="3">
										<ul class="lst_bul02">
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
							<a href="javascript:go_excel();" class="btn_black line_blue">엑셀다운</a>
							<a href="/admin/sisul/sisulRsvList.do" class="btn_black btn_list">목록</a>
						</div>
</form:form>