<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbSisulRsvList.jsp
  * @Description : TbSisulRsv List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-21
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">
/* 달력스크립트 S */
$(document).ready(function () {
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
	$( "#startDate" ).datepicker({
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
		minDate: new Date('2023-01-01'),                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		onClose: function( selectedDate ) {    
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			//$("#req_dt").datepicker( "option", "minDate", selectedDate );
		}
	});
	
	$( "#endDate" ).datepicker({
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
		minDate: new Date('2023-01-01'),                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		onClose: function( selectedDate ) {    
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			//$("#req_dt").datepicker( "option", "minDate", selectedDate );
		}
	});
});
/* 달력스크립트 e */
</script>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 수정 화면 function */



/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/admin/tbSisulRsv/addTbSisulRsvView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/admin/tbSisulRsv/TbSisulRsvList.do'/>";
   	document.getElementById("listForm").submit();
}
function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
function go_search() {
	var url =  window.location.pathname;
	document.getElementById("listForm").action = url;
   	document.getElementById("listForm").submit();
}
function goDateSearch(){
	var sd = $("#startDate").val();
	if (sd == "") {
		alert("시작날짜를 입력해주세요.");

		return false;
	}
	
	var ed = $("#endDate").val();
	if (ed == "") {
		alert("종료날짜를 입력해주세요.");

		return false;
	}
	if(ed < sd) {
		alert("종료날짜가 시작날짜보다 이전입니다.\n날짜를 다시 선택해주세요.");
		return false;
	}
	
	var url =  window.location.pathname;
	$("input[name=rsvSeq]").attr("value", 0);
	document.getElementById("listForm").action = "/admin/tbSisulRsv/TbSisulRsvList.do?startDate=" + sd + "&&andDate=" + ed;
   	document.getElementById("listForm").submit();
}
function go_excel(){
	var sd = $("#startDate").val();
	if (sd == "") {
		alert("시작날짜를 입력해주세요.");

		return false;
	}
	
	var ed = $("#endDate").val();
	if (ed == "") {
		alert("종료날짜를 입력해주세요.");

		return false;
	}
	
	if(ed < sd) {
		alert("종료날짜가 시작날짜보다 이전입니다.\n날짜를 다시 선택해주세요.");
		return false;
	}

	$("input[name=rsvSeq]").attr("value", 0);
	document.getElementById("listForm").action = "/admin/excel/TbSisulRsvExcelDown.do";
   	document.getElementById("listForm").submit();
};
 // -->
</script>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="rsvSeq" />
	<form:hidden path="pageIndex" />
					<div class="bd_top_type01">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
						</div>
						<div class="fr">
							<fieldset class="search_form">
								<legend>검색</legend>

								<div class="sel_box">										
									<label for="sel_area">검색조건</label>
									<div>
										
										<form:select path="searchCondition" id="sel_area">
											<form:option value="0">전체</form:option>
											<%-- <form:option value="1">작성자</form:option> --%>
											<form:option value="2">제목</form:option>
											<form:option value="3">년도</form:option>
											<form:option value="4">월</form:option>
										</form:select>
									</div>
								</div>

								<div class="bd_sel_search">
									<label for="searchKeyword" class="focus_tit">검색어를 입력하세요</label>
									<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="searchKeyword" maxlength="20"/>
									<input type="button" value="검색" onclick="javascript:go_search()">
								</div>
							</fieldset>
						</div>		
					</div>
					<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="15%">
								<%-- <col width="15%"> --%>
								<col width="8%">
								<col width="8%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">회원구분</th>
									<th scope="col" class="">작성자</th>
									<th scope="col" class="">제목</th>
									<th scope="col" class="">예약시간</th>
									<!-- <th scope="col" class="">촬영목적</th> -->
									<th scope="col" class="">처리여부</th>
									<th scope="col" class="">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<c:forEach var="codelist" items="${codelist}">
										<c:if test="${result.code eq codelist.code }">
											<td>${codelist.codeNm}</td>
										</c:if>
									</c:forEach>
									<c:if test="${result.comNm eq null }">
										<td>${result.memId}</td>
									</c:if>
									<c:if test="${result.comNm ne null }">
										<td>${result.comNm}</td>
									</c:if>
									<td><a href="/admin/tbSisulRsv/TbSisulRsvDetail.do?rsvSeq=${result.rsvSeq }">${result.title}</a></td>
									<td>${result.rsvYear}.${result.rsvMonth}.${result.rsvDay} / ${result.rsvSt}:00 ~ ${result.rsvEt}:00</td>
									<%-- <td>${result.purposeCd}</td> --%>
									<td>										
										<span class="bd_btn">
											<c:if test="${result.acceptYn eq 'Y'}">											
												<button type="button" class="btn_st mini bg_blue">승인</button>
											</c:if>
											<c:if test="${result.acceptYn eq 'N'}">											
												<button type="button" class="btn_st mini bg_orange">반려</button>
											</c:if>
											<c:if test="${result.acceptYn eq 'W'}">											
												<button type="button" class="btn_st mini line_gray">대기</button>
											</c:if>
											<c:if test="${result.acceptYn eq 'C'}">											
												<button type="button" class="btn_st mini line_gray">취소</button>
											</c:if>
										</span>
									</td>
									<td><fmt:formatDate value="${result.regDt}" pattern="y-MM-dd" type="date"/></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="right" style="padding:20px 0px 20px 0px">
							<input readonly type="text" name="startDate" id="startDate" value="${param.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp;
							<input readonly type="text" name="endDate" id="endDate" value="${param.endDate}">
							<!-- <input type="button" value="검색" class="btn_st small line_gray" onclick="javascript:goDateSearch()"> -->
							<input type="button" value="엑셀다운" class="btn_st small line_blue" onclick="javascript:go_excel()">
						</div>
						<div class="bd_pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
						</div>
						<!-- <div class="bd_btn_area center">
							<a href="#" class="btn_black">등록</a>
							<a href="#" class="btn_black line_gray">수정</a>
							<a href="#" class="btn_black line_orange">삭제</a>
						</div> -->
</form:form>
			
