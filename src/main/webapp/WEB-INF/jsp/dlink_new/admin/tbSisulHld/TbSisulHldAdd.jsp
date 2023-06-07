<%@page import="dlink_new.admin.vo.TImgInfo"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulHldAdd.jsp
  * @Description :  TbSisulHld Add 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-03-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="flag" value="${tbSisulHldVO.hldSeq eq '0' ? 'insert' : 'update' }" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function () {
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
	$( "#hldDt" ).datepicker({
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
	
});
</script>

<script>
function go_register() {
    
/*     var hldDt = $('#hldDt').val();
    var yyyy = hldDt.substring(0,4);
    var mm = hldDt.substring(5,7);
    var dd = hldDt.substring(8,10);
    console.log(yyyy + mm + dd); */
    

	var datatimeRegexp = /[0-9]{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])/;
    if ( !datatimeRegexp.test($('#hldDt').val()) ) {
        alert("날짜는 YYYY-mm-dd 형식으로 입력해주세요.");
        return false;
	}
    var hldDt = $('#hldDt').val();
    if(hldDt.length != 10){
    	alert("날짜는 YYYY-mm-dd 형식으로 입력해주세요.");
    	return false;
    }    	
    console.log(hldDt.length);
    
	var hldNm = $("#hldNm").val();
	if(hldNm == ""){
		alert("휴일 이름을 입력해 주세요");
		return false;
	}


	
	var params = $("#detailForm").serialize();
	console.log(params);
	var flag = "${flag}";
	if(flag == 'insert') {
		$.ajax({
			url : "/admin/tbSisulHld/addTbSisulHld.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("저장되었습니다.");
		        	location.href="/admin/sisul/sisulHldList.do";
		        	
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	} else if (flag == 'update') {
		$.ajax({
			url : "/admin/tbSisulHld/updateTbSisulHld.do",
			data : params,
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
		    success: function(rs){
		    	if(rs == "Y") {
		        	alert("수정되었습니다.");
		        	location.href="/admin/sisul/sisulHldList.do";
		    	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	}

}
</script>

<!-- 컨텐츠 영역 s -->
					<p class="mb10 left"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.${tbSisulVO.sisulSeq }</p>
					<form:form modelAttribute="tbSisulHldVO" name="detailForm" id="detailForm" method="post">
						<input type="hidden" name="hldSeq"value="${tbSisulHldVO.hldSeq }">
						<!-- <h4 class="tit">소제목</h4> -->
						<table class="bd_tbl bd_tbl_view">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="con_cd1">휴일 이름</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="hldNm" id="hldNm" value="${tbSisulHldVO.hldNm }" maxlength="50">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">휴일 날짜 <span class="tbl_star">*</span></label></th>
									<td colspan="3">
										<%-- <input type="text" name="hldDt" id="hldDt" value="${tbSisulHldVO.hldDt }" maxlength="10"> --%>
										<div style="margin-right:20px;display:inline-block">
											<input readonly type="text" id="hldDt" name="hldDt" value="${tbSisulHldVO.hldDt }" style="width:150px;">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form:form>
						
					<div class="bd_btn_area center">
						<c:if test="${flag == 'update'}">
							<a href="/admin/sisul/sisulHldList.do" class="btn_black" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">수정</a>
						</c:if>
						<c:if test="${flag == 'insert'}">
							<a href="/admin/sisul/sisulHldList.do" class="btn_black" >취소</a>
							<a href="javascript:go_register();" class="btn_black line_gray">등록</a>
						</c:if>		
						
					</div>
					<!-- //컨텐츠 영역 e -->