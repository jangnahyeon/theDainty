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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/DLink/admin_html/js/common.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">


/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/private/prmInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}


/* 글 수정등록 function */
function fn_egov_save() {	
	
	var registerFlag = $("#registerFlag").val();
	var cont = $("#sex").val();
	var urlval = "";
	var form = document.detailForm;
	  
	
	  
	if(registerFlag == 'insert'){
		alert("등록 하시겠습니까?");
		urlval = "/admin/private/addTMemUser.do";
	}else{
		alert("수정 하시겠습니까?");
		urlval = "/admin/private/updateTMemUser.do";
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
/* datepicker 함수 */
$( function() {
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

</script>
<form:form name="searchForm" id="searchForm" method="post" action="/admin/private/prmInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TMemUserVO" name="detailForm" id="detailForm" >
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
					${TMemUserVO.loginId}
				</td>
				<th scope="row"><label for="userNm">회원명</label></th>
				<td class="left">
					<form:input name="userNm" path="userNm" cssclass="txt w40" /><form:errors path="userNm" />	
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="sex">성별</label></th>
				<td>	
					<c:choose>
						<c:when test="${TMemUserVO.sex == 'SX0001'}">
							남자
						</c:when>
						<c:otherwise>
							여자
						</c:otherwise>
					</c:choose>
				</td>
				
				<th scope="row"><label for="birthday">생년월일</label></th>
				<td class="left">
					<div>
						<div class="area_calendar">
							<input type="text" id="calender_02_strt" class="mr10" name="birthday" value=${birthday }>
						</div>
						<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
					</div>	
				</td>
			</tr>	
			<tr>
				<th scope="row"><label for="mobileNo">휴대전화</label></th>
				<td class="left">
					<form:input name="mobileNo" path="mobileNo" cssclass="txt w40" /><form:errors path="mobileNo" />	
				</td>
				<th scope="row"><label for="emailAddr">이메일</label></th>
				<td class="left">
					<form:input path="emailAddr" cssclass="txt w40" /><form:errors path="emailAddr" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">주소</label></th>
				<td class="left" colspan="3">
					<div class="group_addr">
						<div class="zipcode_txt">
							<form:input path="zipCd" cssClass="txt fxw" /><form:errors path="zipCd" />
						</div>
						<div class="addr_txt">
							<form:input path="addr" cssClass="txt" /><form:errors path="addr" />
							<form:input path="dtlAddr" cssClass="txt" /><form:errors path="dtlAddr" />
						</div>
					</div>
				</td>
			</tr>
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

