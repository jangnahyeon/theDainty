<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TPtplInfoList.jsp
  * @Description : TPtplInfo List 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/DLink/admin_html/js/common.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script>
<form name="frm" method="post">
<!-- 컨텐츠 영역 s -->
	
	<!-- 상세검색 영역 s -->
	<div class="search_form_area">
		<table class="bd_tbl">
			<caption>이벤트 검색 폼</caption>
			<colgroup><col width="130"><col width="*"></colgroup>

			<tbody>
			<!-- <tr>
				<th scope="row">기간</th>
				<td>
					<div style="vertical-align:middle">
						<div class="area_calendar">
							<input type="text" id="calender_01_strt" class="mr10" > 
							<i style="margin: 10px; "> ~ </i> 
							<input type="text" title="기간검색 종료일입력" id="calender_01_end" class="mr10" >
						</div>
						<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
					</div>
				</td>
			</tr> -->
			<tr>
				<th scope="row">등록일</th>
				<td>
					<div>
						<div class="area_calendar">
							<input type="text" id="calender_02_strt" class="mr10" name="regDtStrt" value=${regDtStrt }>
							<i style="margin: 10px; "> ~ </i> 
							<input type="text" title="기간검색 종료일입력" id="calender_02_end" class="mr10" name="regDtEnd" value=${regDtEnd }>
							
						</div>
						<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
					</div>
					<div class="mgt5">
						<button type="button" onclick="javascript:btn_today();" class="btn_st mini line_gray">오늘</button>
						<button type="button" onclick="javascript:btn_daysAgo('3');" class="btn_st mini line_gray">3일간</button>
						<button type="button" onclick="javascript:btn_daysAgo('7');" class="btn_st mini line_gray">7일간</button>
						<button type="button" onclick="javascript:btn_daysAgo('10');" class="btn_st mini line_gray">10일간</button>
						<button type="button" onclick="javascript:btn_daysAgo('20');" class="btn_st mini line_gray">20일간</button>
						<button type="button" onclick="javascript:btn_daysAgo('30');" class="btn_st mini line_gray">30일간</button>
					</div>
				</td>
			</tr>
			<!-- <tr>
				<th scope="row">입점업체검색</th>
				<td>
					<input type="text" name="title" class="" value="" maxlength="50">
					<button type="button" onclick="" class="btn_st st_bg_blue small">검색</button>
				</td>
			</tr> -->
			<!-- <tr>
				<th scope="row">진행상태</th>
				<td>
					<ul class="chk_area">
						<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">전체</label></li>
						<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">대기</label></li>
						<li><input type="radio" name="kind" value="0003" id="kind3"> <label for="kind3">진행중</label></li>
						<li><input type="radio" name="kind" value="0003" id="kind4"> <label for="kind4">종료</label></li>
						<li><input type="radio" name="kind" value="0003" id="kind5"> <label for="kind5">마감</label></li>
					</ul>
				</td>
			</tr> -->

			<tr>
				<th scope="row">직접검색</th>
				<td>
					<div class="search_form fl">
						<div class="area_select mr10">
							<div class="selectbox">										
								<span class="select_label" for="select_brme" name="select_label"></span>
									<select id="select_name" name="searchCondition">
										<option value="1" <c:if test="${searchCondition eq 1 }">selected</c:if>>업체명</option>
										<option value="2" <c:if test="${searchCondition eq 2 }">selected</c:if>>포트폴리오명</option>
									</select>
							</div>
						</div>
						<input type="button" onclick="javascript:btn_calClear();" class="btn_st mini line_orange" style="float: right;margin-top: 5px;margin-left: 10px;" value="초기화">
						<div class="bd_sel_search">
							<label for="sear_word" class="focus_tit"><c:if test="${empty searchKeyword }">검색어를 입력하세요</c:if></label>
							<input type="text" id="sear_word" name="searchKeyword" >
							<input type="button" value="검색" onclick="javascript:go_search();">
						</div>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>	
	<!-- 상세검색 영역 e -->	
	
	<!-- 일반 게시판 검색일 경우 s 
	<div class="bd_top_type01">
		<div class="area_left">
			<p class="bd_info_page">총 <span>135</span>건 <strong><em>1</em>/<span>100</span>페이지</strong></p>
		</div>
		
		<div class="fr">
			<fieldset class="search_form">
				<legend>검색</legend>

				<div class="sel_box">										
					<label for="sel_area">검색조건</label>
					<div>
						<select id="sel_area">
							<option>전체</option>
							<option>사업자번호</option>
							<option>기관명</option>
						</select>
					</div>
				</div>

				<div class="bd_sel_search">
					<label for="sear_word" class="focus_tit">검색어를 입력하세요</label>
					<input type="text" id="sear_word">
					<input type="button" value="검색">
				</div>
			</fieldset>
		</div>			
	</div>
	 //일반 게시판 검색일 경우 e -->
	<div class="bd_top_type02">
		<h4 class="mt0 tit area_left">포트폴리오 선택관리</h4>
		
		<div class="bd_btn_area right">
			<!-- <a href="#" class="btn_st small">등록</a>
			<a href="#" class="btn_st small line_gray">선택수정</a> -->
			<!-- <a href="#" class="btn_st small line_orange">선택삭제</a> -->
			
		</div>
	</div>
		<table class="bd_tbl center sortable_wrap">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="2%">
				<col width="5%">
				<col width="8%">
				<col width="8%">
				<col width="20%">
				
	        </colgroup>
			<thead>
				<tr>
					<!-- <th scope="col" class=""><input type="checkbox" onclick="" id="all"></th> -->
					<th scope="col" class="">상품코드</th>
					<th scope="col" class="">전문분야</th>
					<th scope="col" class="">업체명</th>
					<th scope="col" class="">이미지</th>
					<th scope="col" class="">제목</th>
					<!-- <th scope="col" class="">수정</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="resultList" items="${resultList}" varStatus="vs">
					<tr>
					<%-- <td><input type="checkbox" onclick="" id="chk${vs.index }"></td> --%>
					<td>${resultList.ptplNo }</td>
					<td>${resultList.ptplPartNm }</td>
					<td>${resultList.comNm }</td>
					<td><i class="sort_img"><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></i></td>
					<td class="left">
						<a href="javascript:go_detail('${resultList.ptplNo }');">${resultList.ptplNm }</a>
					</td>
					<!-- <td>
						<button type="button" class="btn_st mini line_orange">수정</button>
						<button type="button" class="btn_st mini bg_orange">삭제</button>
					</td> -->
				</tr>
				
				</c:forEach>
				<input type="hidden" name="ptplNo">
			</tbody>
		</table>
		<div id="paging" class="bd_pagination">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
			<input type="hidden" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
		</div>
		
		<div class="bd_btn_area right">
			<!-- <a href="#" class="btn_black">등록</a>
			<a href="#" class="btn_black line_gray">선택수정</a> -->
			<!-- <a href="#" class="btn_black line_orange">선택삭제</a> -->
		</div>
</form>

					<!-- //컨텐츠 영역 e -->
				
				
				
				
<script>
$(document).ready(function() {
	var select_name = $("select[name=searchCondition] option:selected").text();	
	$("span[name=select_label]").text(select_name);
	
	var searchKeyword = "${searchKeyword }";
	$("input[name=searchKeyword]").val(searchKeyword);
	
	
});
function btn_calClear() {
	$("input[name=regDtStrt]").val("");
	$("input[name=regDtEnd]").val("");
	$("#sear_word").val("");
}
function go_detail(ptplNo) {
	document.frm.ptplNo.value = ptplNo;
	document.frm.action = "/admin/portfolio/portfDetail.do";
	document.frm.submit();
}

function go_search() {
	document.frm.pageIndex.value = 1;
	document.frm.action = "/admin/portfolio/portfInquiryList.do";
	document.frm.submit();
}

/* datepicker 함수 */
$( function() {
    $( "#calender_01_strt" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	regional: "ko",
    	buttonImage: "/DLink/HTML/css/images/contents/btn_calendar.gif",
    	showOn: 'button',
    	buttonImageOnly: true,
    	buttonText: "달력", 
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능                
        buttonText: "선택", //버튼 호버 텍스트              
        yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
        yearRange: 'c-100:c+10',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
             
    	/* beforeShowDay: function(date){
    		var day = date.getDay();
    		return [(day != 0 && day != 6)];
    	} */
    });

    $( "#calender_01_end" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	regional: "ko",
    	buttonImage: "/DLink/HTML/css/images/contents/btn_calendar.gif",
    	showOn: 'button',
    	buttonImageOnly: true,
    	buttonText: "달력", 
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능                
        buttonText: "선택", //버튼 호버 텍스트              
        yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
        yearRange: 'c-100:c+10',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
    });
    
    $( "#calender_02_strt" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	regional: "ko",
    	buttonImage: "/DLink/HTML/css/images/contents/btn_calendar.gif",
    	showOn: 'button',
    	buttonImageOnly: true,
    	buttonText: "달력", 
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능                
        buttonText: "선택", //버튼 호버 텍스트              
        yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
        yearRange: 'c-100:c+10',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
    });
    
    $( "#calender_02_end" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	regional: "ko",
    	buttonImage: "/DLink/HTML/css/images/contents/btn_calendar.gif",
    	showOn: 'button',
    	buttonImageOnly: true,
    	buttonText: "달력", 
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
        changeYear: true, //option값 년 선택 가능
        changeMonth: true, //option값  월 선택 가능                
        buttonText: "선택", //버튼 호버 텍스트              
        yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
        yearRange: 'c-100:c+10',
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
    });
    
 } );
 
function btn_today(){
	var d = new Date();
	dateToday = d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
	
	$("input[name=regDtStrt]").val(dateToday);
	$("input[name=regDtEnd]").val(dateToday);
}
/* 이전날짜 조회 함수 */
function btn_daysAgo(days){
	days = parseInt(days);
	
	var d = new Date();
	dateToday = d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
	var daysAgo = d.setDate(d.getDate() - days);
	daysAgo = d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
	
	$("input[name=regDtStrt]").val(daysAgo);
	$("input[name=regDtEnd]").val(dateToday);
}

function fn_egov_link_page(pageNo){
	document.frm.pageIndex.value = pageNo; 
	document.frm.action = "/admin/portfolio/portfInquiryList.do";
	document.frm.submit();
}

</script>