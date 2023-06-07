<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbBrdRegister.jsp
  * @Description : TbBrd Register 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-03-22
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<c:set var="registerFlag" value="${empty searchVO.popSeq || 0 eq searchVO.popSeq ? 'insert' : 'update'}"/>

<!-- SmartEditor2 라이브러리  --> 
<script type="text/javascript" src="/DLink/HTML_2023/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

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
		minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
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
		minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		onClose: function( selectedDate ) {    
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			//$("#req_dt").datepicker( "option", "minDate", selectedDate );
		}
	});
});
/* 달력스크립트 e */
</script>

<script type="text/javaScript" >
/* 네이버에디터 스크립트 s*/
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

/* 네이버에디터 스크립트 e*/  


/* 글 등록 function */
function go_register () {	
	
	var title = $("#title").val();
	if (title == "") {
		alert("제목을 입력해주세요.");

		return false;
	}
	
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


	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", [])
	var cont = document.getElementById("cont").value;
	if (cont == "") {
		alert("팝업내용을 입력해주세요.");

		return false;
	}
	
	// 필수입력
	var openYn = $("input:radio[name=useYn]:checked").val();
	if (openYn == null) {
		alert("사용여부를 선택해주세요.");

		return false;
	}
	
	/* var width = $("#popupWidth").val();
	if (width == "") {
		alert("팝업폭을 입력해주세요.");

		return false;
	}
	
	var height = $("#popupHeight").val();
	if (height == "") {
		alert("팝업높이를 입력해주세요.");

		return false;
	} */

	var data = $("#detailForm").serialize();

	var urlval = "";
	if ("${registerFlag}" == 'insert') {
		urlval = "/admin/popup/popupAddAct.do";

	} else {
		urlval = "/admin/popup/popupUpdateAct.do?popSeq=${searchVO.popSeq}";
	}

	$.ajax({
		type : "POST",
		url : urlval,
		data : data,
		dataType : "text",
		success : function(res) {
			if (res != null) {
				if (res == "suc") {
					alert("저장이 완료되었습니다.");
					location.href="/admin/popup/popupList.do"
				} else if (res == "upsuc") {
					alert("수정이 완료되었습니다.");
					location.href="/admin/popup/popupDetail.do?popSeq=${searchVO.popSeq}";
				} else {
					alert("실패했습니다. \n  관리자에게 문의바랍니다.");
				}
			}
		},
		error : function() {
			alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		}
	});

}
</script>


<form:form modelAttribute="searchVO" name="detailForm" id="detailForm" >
	<!-- 컨텐츠 영역 s -->
	<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
	<table class="bd_tbl bd_tbl_view">
		<caption>팝업 등록 수정 폼</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<tbody><tr>
			<th scope="row">제목<span class="tbl_star">*</span></th>
			<td>
				<input type="text" name="title" id="title" class="" value="${searchVO.title }" maxlength="50">
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="collection_data01">팝업기간설정<span class="tbl_star">*</span></label></th>
			<td>
				<div style="vertical-align:middle">
					<div class="area_calendar">
						<input readonly type="text" name="startDate" id="startDate" value="${searchVO.startDate }">~
						<input readonly type="text" name="endDate" id="endDate" value="${searchVO.endDate }">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row">내용<span class="tbl_star">*</span></th>
			<td>
				<div>
					<%-- <input type="text" class="cont" id="cont" name="cont" style="height:430px" value="${searchVO.contents }"> --%>
					<form:input type="text" path="cont" />
				</div>
			</td>
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
		<!-- <tr>
			<th>팝업 크기</th>
			<td>
				<div>
				폭 : <input type="text" name="popupWidth" id="popupWidth" value="" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel,
				높이 : <input type="text" name="popupHeight" id="popupHeight" value="" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel
				</div>
				<p class="cl_blue">※ 높이 설정시 "오늘 이창 띄우지 않음" 부분 높이(20px)를 포함하여 입력해 주세요.</p>
			</td>
		</tr> -->
		</tbody></table>
		
		<div class="bd_btn_area center">
			<c:if test="${registerFlag eq 'insert' }">
				<a href="javascript:go_register();" class="btn_black">등록</a>
			</c:if>
			<c:if test="${registerFlag eq 'update' }">
				<a href="javascript:go_register();" class="btn_black">수정</a>
			</c:if>
			<a href="/admin/popup/popupList.do" class="btn_black line_gray">취소</a>
		</div>
</form:form>
		