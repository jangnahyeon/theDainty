<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
 /**
  * @Class Name : TPtplInfoList.jsp
  * @Description : TPtplInfo List 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2022-03-31
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>


<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 수정 화면 function */


function fn_egov_select(loginId) {
    document.getElementById("listForm").loginId.value = loginId;
   	document.getElementById("listForm").action = "<c:url value='/TPtplInfo/updateTPtplInfoView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/TPtplInfo/addTPtplInfoView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/TPtplInfo/TPtplInfoList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
 
 
 

 
</script>

<!--  상담하기 리스트 -->

	
<form name="frm" method="post">
		<div class="wrap_content">
			<!-- 타이틀 시작 -->
			<div class="con_title">
				<h3><i>포트폴리오검색</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a></li>
					<li><a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a></li>
				</ul>
			</div>
			<!-- 타이틀 끝 -->
				<!-- 검색박스 -->
			<div class="filter_box">
				<div class="row title">
					<div class="filter_label">전문분야</div>
					<div class="filter_list">
						<div class="category_selectbox">
							<label for="standard">분야선택</label>
							<select id="standard" name="ptplPart" onchange="javascript:selectPA();">
								<c:forEach var="codeListPA" items="${codeListPA}" varStatus="vs">
									<option value="${codeListPA.code}">${codeListPA.codeNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="category_selectbox">
							<label for="standard">유형선택</label>
							<select id="standard" name="ptplYouhaeng"><!--   onchange="javascript:selectPY();"> -->
								<option value="none">선택</option>
							</select>
						</div>
						※ 분야 및 유형을 먼저 선택해주세요.
					</div>
				</div>
				<!-- <div class="row">
					<div class="filter_label">로고타입</div>
					<div class="filter_list" id="ptCode">
						
					</div>
				</div>
				<div class="row">
					<div class="filter_label">소분류</div>
					<div class="filter_list" id="psCode">
						
					</div>
				</div>
				
				<div class="row">
					<div class="filter_label">추가분류</div>
					<div class="filter_list" id="apCode">
						
					</div>
				</div>				
				<div class="row">
					<div class="filter_label_pick">선택한필터</div>
					
					<div class="filter_list addType">
						
					</div>
				</div> -->
				<div class="row">
					<div class="filter_label_pick">검색어입력</div>
					<div class="filter_list">
						<div class="ipt_search">
							<legend>검색</legend>
							<label for="sear_word" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;">검색어를 입력하세요</label>
							<input type="text" id="sear_word" style="color: rgb(163, 163, 163);">
							<input type="button" value="검색" onclick="javascript:go_search();" >
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="searchKeyword2" id="searchKeyword2">
			<!-- //검색박스 -->
			<div id="load" class="contents">
				<%@ include file="/WEB-INF/jsp/include/TPtplInfo/SearchPortfolioList.jsp" %>
			</div>
					<!-- //의뢰하기 모달팝업 -->
			<div class="pop_modal_bg"></div>
		<!-- //컨텐츠 영역 -->
	<!-- //container_wrap --> 
		<input type="hidden" name="strArr">
	<div id="inputArr"></div>
	
</div>
</form>

<script>
$(document).ready(function() {
	$("select[name=ptplPart] option:eq(0)").prop("selected", true);
	var select_name = $("select[name=ptplPart] option:selected").text();	
	$("select[name=ptplPart]").siblings("label").text(select_name);

	selectPA();
	selectPY();
	
	
});


/* 대분류 선택에 따른 코드값 조회 함수 */
function selectPA() {
	var codePA = $("select[name=ptplPart]").val();
	
	var arr = {};
	
	$("select[name=ptplYouhaeng] *").remove();
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePA},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	$("select[name=ptplYouhaeng]").append("<option value='none'>선택</option>");
	    	$.each(arr, function(idx, val) {
	    		$("select[name=ptplYouhaeng]").append("<option value='" + val.code + "'>" + val.codeNm + "</option>");
	    		
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    } 
	});
}

var searchArr = [];
var count = 0;
/* PY코드 선택에 따른 로고타입 조회 함수 */
function selectPY() {
	var codePY = $("select[name=ptplYouhaeng]").val();
	var arr = {};
	var num = 1;
	
	$("#ptCode *").remove();
	$("#psCode *").remove();
	$("#apCode *").remove();
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "PT"		
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<button class='filter_item'><span class='" + val.code + "'id=''>" + val.codeNm + "</span></button>";
	    		
	    		$("#ptCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "PS"
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<button class='filter_item'><span class='" + val.code + "'id=''>" + val.codeNm + "</span></button>";
	    		
	    		$("#psCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	$.ajax({
		url : "/front/portMagmt/selectCodeListJason.do",
		data : {"refCode": codePY,
				"gubun" : "AP"
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	console.log(data);
	    	arr = data;
	    	
	    	$.each(arr, function(idx, val) {
	    		
	    		var ptCodeAdd = "<button class='filter_item'><span class='" + val.code + "' id=''>" + val.codeNm + "</span></button>";
	    		
	    		$("#apCode").append(ptCodeAdd);
	    		
	    		num++;
	    	});
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	var tm = "";
	
	//검색필터 클릭 시 
    $('.filter_box .row .filter_list .filter_item span').on('click', function(){
    	tm = $(this).attr('class');
	    if($(this).parent().hasClass('on')){
	        $(this).parent().removeClass('on');
	        /* $('.filter_box .row .filter_list .filter_item span').removeClass('on'); */
	        var rm = "#rm"+ $(this).attr('id');
	        
	        $(rm).remove();
	        searchArr[$(this).attr('id')] = "";
	        /* $(".0").parent().remove(); */
	        /* alert($(".0").parent()); */
	        
	        
	    } else {
	    	$("." + tm).attr('id', count);
	    	
	        $(this).parent().addClass('on'); 
	        /* $('.filter_box .row .filter_list .filter_item span').addClass('on');  */
	        /* alert($(this).attr('class')); */
	        var addCodeType = "<button class='filter_item_pick'id='rm"+count+"'><span id='"+$(this).attr('class')+"'>" + $(this).text() + "</span><a href='#' class='close' id='"+count+" '>필터 닫기</a></button>"
	        $('.addType').append(addCodeType);
	        
	        searchArr[count] = tm;
	        count++;
	        /* for (index in searchArr) {
	        	console.log(searchArr[index]);
        	} */
	    }
    return false;
	});
	
    $(document).on("click", ".close", function () {
		var index = $(this).attr("id");
		/* tag[index] = "";  */
		
		var rm = "#rm"+ index;
		var rmOn = "#" + index;
		$(rm).remove();
		$(rmOn).removeClass('on');
		$(rmOn).parent().removeClass('on');
		index = parseInt(index);
		
		searchArr[index] = "";
		
	});
}
function orderSearch(_val) {
	$("#searchKeyword2").val(_val);
	go_search();
}
function go_search() {
	var sear_word = $("#sear_word").val();
	var pageIndex = parseInt($("#pageIndex").val());
	var codePA = $("select[name=ptplPart]").val();
	var codePY = $("select[name=ptplYouhaeng]").val();
	var searchKeyword2 = $("#searchKeyword2").val();
	
/* 	document.frm.strArr.value = searchArr;
	document.frm.pageIndex.value = pageIndex;    
	document.frm.action = "/front/portfolio/searchPortfolio.do";
	document.frm.submit(); */
	 
	
	$.ajax({
		url : "/portfolio/searchPortfolio.do",
		data : {"strArr": searchArr,
				"searchKeyword" : sear_word,
				"pageIndex" : pageIndex,
				"ptplPart" : codePA,
				"ptplYouhaeng" : codePY,
				"searchKeyword2" : searchKeyword2
		},
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	
	    	$('#load').html(data);
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});   
	
}

</script>
