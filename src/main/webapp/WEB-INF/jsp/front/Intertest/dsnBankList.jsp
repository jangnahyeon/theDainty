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
	    	$("#modelFileDown").html("<a href='/imagefile/download.do?file_no="+result.fileSeq+"' class='mt_image_file'>이미지다운로드</a>");
	    	
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
		
 		location.href = "/front/login.do";
		 
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
</script>


<div class="wrap_content">

	 <!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>이미지</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">관심정보</a></li>
					<li><a href="#">이미지</a></li>
				</ul>
				<!-- <div class="link_sns">
					<a href="#" class="icon_sns"><i>SNS공유</i></a>				
					<div class="sns_area">
						<ul>
							<li><a href="#" class="sns_k">카카오톡</a></li>
							<li><a href="#" class="sns_u">URL</a></li>
						</ul>
						<a href="#" class="pop_close">닫기</a>
					</div>
				</div> -->
			</div>
			<!--  타이틀 끝 -->
	
		<div class="contents">
	
			<div class="tab_device">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" >알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=agency"  class="on">관심정보</a></li>
						<%if(("MG0003").equals(loginVO.getUserType())){ %>   <!-- 관리자는 상담관리 이용 불가능 -->
										
						<%} else {%>
							<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
						<%} %>
						<%if(("MG0001").equals(loginVO.getUserType())){ %>
							<li><a href="/front/privacy/infoInquiry.do">개인정보관리</a></li>
						<%} else {%>
							<li><a href="/front/proAgency/infoMagmt.do">기업정보관리</a></li>
						<% } %>
					</ul>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/Interest/proCompany.do?sel_gb=agency" >전문회사</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=ptpl">포트폴리오</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=dsn" class="on">이미지</a></li>
					</ul>
				</div>
				
			<section class="tab_content">				
				<div class="lst_thum row03">
					<c:forEach var="result" items="${resultList}" varStatus="vs">
						<div class="item">
							<em class="info_favorite">
								<button class="icon_heart" onclick="favoriteYn('${result.dsnNo}')"></button>
							</em>
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
		</section>
		<!-- 닫힘 -->		
					
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
											<tr>
												<th scope="row" colspan="2" id="modelFileDown"></th>
											</tr>
											
										</tbody>
									</table>
									<p class="info_category"><span class="category_tag" id="modelDsnPartNm"></span></p>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //이미지 상세보기 모달팝업 -->
					
					
					
					
					<div class="pop_modal_bg"></div>
				<!-- //컨텐츠 영역 -->
			
			
</div>


