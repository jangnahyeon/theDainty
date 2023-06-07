<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javaScript" language="javascript" defer="defer">

/*글 view 화면 function */
function fn_egov_view(menuId, postNo, seq, registerFlag) {
    document.getElementById("listForm").menuId.value = menuId;
    document.getElementById("listForm").postNo.value = postNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/front/business/viewCommuty.do'/>";
   	document.getElementById("listForm").submit();
}


/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
}


function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/dsn/dsnBankList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}


function orderSearch(_val) {
	$("#searchKeyword2").val(_val);
	go_search();
}


function selectModel(dsnNo) {
	$.ajax({
	    type: "POST",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/dsn/dsnBankAjaxSelect.do",
	    data : {dsnNo:dsnNo},
	    dataType: "text",
	    success: function(data){
	    	var result  = eval( "(" +data+ ")" );
	    	console.log(result);
	    	$("#modelFile").empty();
	    	$("#modelFile").html('<img src="/imagefile/preview.do?fileSeq='+result.fileSeq+'" alt="'+result.fileNm+'"/>');
	    	$("#modelFileDown").empty();
	    	$("#modelFileDown").html("<a href='#' onclick='imgDown(\""+result.fileSeq+"\")' class='btn_black'>이미지다운로드</a>");
	    	
	    	$("#modelDsnNm").text(result.dsnNm);
	    	$("#modelRefWord").text(result.refWord);
	    	$("#modelConecept").text(result.concept);
	    	$("#modelDsnPartNm").text(result.dsnPartNm);
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}


function favoriteYn(dsnNo){
	<%if(loginVO == null){ %>
		alert("로그인해주세요");
		return false;
	<%}%>
	
	$.ajax({
	    type: "POST",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/dsn/dsnBankFavoriteAjax.do",
	    data : {dsnNo:dsnNo},
	    dataType: "text",
	    success: function(data){
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}

function imgDown(fileSeq){
	<%if(loginVO == null){ %>
		alert("로그인해주세요.");
		window.location.href="/front/login.do";
		return false;
	<%} else {%>
		window.location.href="/imagefile/download.do?file_no="+fileSeq;
	<% } %>
}
</script>


<div class="wrap_content">
	<div class="con_title">
		<h3><i>이미지검색</i></h3>
		<ul class="loca">
			<li><a href="/front/main.do" class="home">home</a></li>
			<li><a href="/front/dsn/dsnBankList.do">디자인뱅크</a></li>
			<li><a href="/front/dsn/dsnBankList.do">이미지검색</a></li>
		</ul>
	</div>
	
	<div class="contents">
				<!-- 컨텐츠 영역 -->
				<div class="bd_top_style">
					<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
						<form:hidden path="pageIndex" />
						<form:hidden path="searchKeyword2" />
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
							<div class="area_right">
								<div class="area_select">
									<div class="selectbox">
										<label for="searchCondition">검색조건</label>
										<form:select path="searchCondition">
											<form:option value="">검색조건</form:option>
											<form:option value="0">디자인명</form:option>
											<form:option value="1">연관검색어</form:option>
										</form:select>
									</div>
									<input type="button" value="선택">
								</div>
							</div>
						</div>
						<fieldset class="bd_sel_search">
							<legend>검색</legend>
							<label for="searchKeyword" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;">검색어를 입력하세요</label>
							<form:input path="searchKeyword" onkeypress="enterkey()" for="searchKeyword" onkeyup="javascript:enterkey();"/>
							<input type="button" value="검색">
						</fieldset>	
						</form:form>
					</div>
					
					
					
				<div class="listWrap_top">
					<p class="info">기본화면은 랜덤순입니다.</p> 	
					<div class="align">
						<ul>
							<li class="<c:if test="${empty searchVO.searchKeyword2 or searchVO.searchKeyword eq 'random'  }">on</c:if>"><a href="#none" onclick="orderSearch('random')">랜덤</a></li>
							<li class="<c:if test="${searchVO.searchKeyword2 eq 'favorite'  }">on</c:if>"><a href="#none" onclick="orderSearch('favorite')">♡많은순</a></li>
							<li class="<c:if test="${searchVO.searchKeyword2 eq 'date'  }">on</c:if>"><a href="#none" onclick="orderSearch('date')">최근등록순</a></li>
						</ul>
					</div>
				</div>
					
				<div class="lst_thum row03">
					<c:forEach var="result" items="${resultList}" varStatus="vs">
							<div class="item">
								<em class="info_favorite"><button class="icon_heart" onclick="favoriteYn('${result.dsnNo}')"></button></em>
								<div class="item_description">							
									<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');selectModel('${result.dsnNo}');return false;">
	<!-- 									<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');return false;"> -->
										<strong>${result.dsnNm }</strong>
										<c:forEach var="code" items="${codeList}" varStatus="vs">
											<c:if test="${code.code eq result.dsnPart }">
												<span class="info_date">${code.codeNm }</span>
											</c:if>
										</c:forEach>
										<span class="info_btn"><em class="btn">자세히보기</em></span>
										
									</a>
								</div>
								<img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt="${result.fileNm }">
							</div>
					</c:forEach>
				</div>
					
					<div class="pagination" id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
					</div>
					
					
					<!-- 이미지 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view">
						<div class="pop_design_view"> 
							<h4 class="title">이미지 상세보기</h4>
							<div class="detail_design">
								<div class="detail_img">
									<span id="modelFile"></span>
								</div>
								<div class="detail_info">
									<table class="tbl_basic">
										<caption>디자인에 대한 상세정보입니다.</caption>
										<col class="bd_title">
										<col>
										<tbody>
											<tr>
												<th scope="row" class="bd_title">디자인명</th>
												<td id="modelDsnNm"></td>
											</tr>
											<tr>
												<th scope="row">연관검색어</th>
												<td id="modelRefWord"></td>
											</tr>
											<tr>
												<th scope="row">컨셉</th>
												<td id="modelConecept"></td>
											</tr>
											
										</tbody>
									</table>
									<p class="info_category"><span class="category_tag" id="modelDsnPartNm"></span></p>
										
									<div class="bd_btn_area center" id="modelFileDown"></div>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //이미지 상세보기 모달팝업 -->
					
					
					
					
					<div class="pop_modal_bg"></div>
				<!-- //컨텐츠 영역 -->
			</div>
			
</div>


