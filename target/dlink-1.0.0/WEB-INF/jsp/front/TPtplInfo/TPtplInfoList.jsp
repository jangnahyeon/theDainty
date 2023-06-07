<%@page import="dlink.admin.vo.TMemAccptVO"%>
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
  * @since 2022-03-31
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
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
<div class="wrap_content">
			<!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>포트폴리오관리</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
					<li><a href="/front/portMagmt/portInquiryList.do">기업정보관리</a></li>
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
				<!-- 컨텐츠 영역 -->
<form name="frm" method="post">
	
				<!-- 컨텐츠 영역 -->
				
				<%-- <div class="bd_view_thum">
					<div class="info_company mypage">
						<span class="info_item"><i><img src="../images/ex/port_logo.png" alt=""></i></span>
						<div class="info_tit">
							<strong>나의 회사명 (${comInfo.comNm })</strong>
							<p>${comInfo.comUrl }</p>
						</div>						
						<p class="info_btn"><a href="/front/privacy/infoModf" class="btn bl_gray icon_setting">회원정보 수정</a></p>
					</div>
				</div> --%>
				
				<div class="tab_device">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" >알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do">관심정보</a></li>
						<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
						<li><a href="/front/proAgency/infoMagmt.do" class="on">기업정보관리</a></li>
						
					</ul>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/proAgency/infoMagmt.do">업체정보관리</a></li>
						<li><a href="/front/portMagmt/portInquiryList.do" class="on">포트폴리오관리</a></li>
					</ul>
				</div>
				<section class="tab_content">
					<div class="bd_top_search">
						<div class="area_left">
							<div class="area_select">
								<!-- <div class="selectbox"> -->
									<!-- <label for="standard">전문분야선택</label> -->
									<select id="standard" name="ptplPartList" style="height:35px;">
											<option value="" >전문분야선택</option>
										<c:forEach var="codeListPA" items="${codeListPA}" varStatus="vs">
											<option value="${codeListPA.code}" <c:if test="${ptplType eq  codeListPA.code}">selected</c:if>> ${codeListPA.codeNm}</option>
										</c:forEach>
									</select>
									<input type="hidden" name="ptplPart">
								<!-- </div> -->
								<!-- <input type="button" value="선택"> -->
							</div>						
						
							<fieldset class="bd_sel_search">
								<legend>검색</legend>
								<label for="sear_word" class="focus_tit" style="position: absolute; z-index: 1; display: block; visibility: visible;">검색어를 입력하세요</label>
								<input type="text" id="sear_word" name="searchKeyword" value="${searchKeyword }">
								<input type="button" value="검색" onclick="javascript:go_search();">
							</fieldset>	
						</div>
						<div class="area_right">
							<a href="/front/portMagmt/portRegt.do" class="btn bg_gray_dark icon_write">포트폴리오 등록</a>
						</div>
					</div>
					<!-- 포트폴리오 -->
						<!-- <script>
						$( function() {
							$( "#sortable" ).sortable();
						} ); -->
						</script>
						<div class="sortable_wrap">
							<div class="sortable_list">
								<div class="sortable_top">
									<!-- <span class="sort_num">순서</span> -->
									<!-- <span class="sort_chk"><input type="checkbox" onclick="" id="all"><label for="all">전체선택</label></span> -->
									<span class="sort_code">상품코드</span>
									<span class="sort_divi">전문분야</span>
									<span class="sort_img">이미지</span>
									<span class="sort_tit">제목</span>
									<span class="sort_code">수정</span>
									<!-- <span class="sort_move">이동</span> -->
								</div>
								<ul id="sortable" class="ui-sortable">
									<c:forEach var="resultList" items="${resultList}" varStatus="vs">
										<li class="ui-state-default ui-sortable-handle">										
											<%-- <span class="sort_num"><input type="text" value="${vs.count }"></span> --%>
											<%-- <span class="sort_num">${vs.count }</span> --%>
											<%-- <span class="sort_chk"><input type="checkbox" onclick="" id="chk${vs.count }"><label for="chk${vs.count }">선택</label></span> --%>
											<span class="sort_code">${resultList.ptplNo }</span>
											<span class="sort_divi">${resultList.ptplPartNm }</span>
											<span class="sort_img"><i><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></i></span>
											<span class="sort_tit"><a href="javascript:go_detail('${resultList.ptplNo }');"">${resultList.ptplNm }</a></span>
											<span class="sort_move"><a href="javascript:go_modify('${resultList.ptplNo }');" class="btn bg_green" >수정</a></span>
											<span class="sort_move"><a href="javascript:fn_egov_delete('${resultList.ptplNo }');" class="btn bg_gray" >삭제</a></span>
											<!-- <span class="sort_move">이동</span> -->
										</li>
									</c:forEach>
									<input type="hidden" name="ptplNo"/>
									<!-- <li class="ui-state-default ui-sortable-handle">
										<span class="sort_num"><input type="text" value="2"></span>
										<span class="sort_chk"><input type="checkbox" onclick="" id="chk01"><label for="chk01">선택</label></span>
										<span class="sort_code">상품코드</span>
										<span class="sort_divi">시각</span>
										<span class="sort_img"><i><img src="../images/ex/port_logo.png" alt=""></i></span>
										<span class="sort_tit"><a href="">주방용품 효율적인 수납이 가능한 키친툴 세트 디자인</a></span>
										<span class="sort_modi"><a href="" class="btn btn bg_green">수정</a></span>
										<span class="sort_move">이동</span>
									</li>
									<li class="ui-state-default ui-sortable-handle">								
										<span class="sort_num"><input type="text" value="3"></span>
										<span class="sort_chk"><input type="checkbox" onclick="" id="chk01"><label for="chk01">선택</label></span>
										<span class="sort_code">상품코드</span>
										<span class="sort_divi">포장</span>
										<span class="sort_img"><i><img src="../images/ex/lst_thum_row04_02.jpg" alt=""></i></span>
										<span class="sort_tit"><a href="">주방용품 효율적인 수납이 가능한 키친툴 세트 디자인</a></span>
										<span class="sort_modi"><a href="" class="btn btn bg_green">수정</a></span>
										<span class="sort_move">이동</span>
									</li> -->
								</ul>
							</div>
						</div>
						
						<div id="paging" class="pagination">
							<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
							<input type="hidden" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
						</div>
				</section>
			</div>
		</div>
				
				<!-- //컨텐츠 영역 -->
			
	<!-- //container_wrap --> 
</form>

<script>
function go_search() {
	var ptplPart = $("select[name=ptplPartList]").val();
	
	/* if(ptplPart == 'all'){
		document.frm.ptplPart.value = null;
	} */
	
   	document.frm.ptplPart.value = ptplPart;
	document.frm.action = "/front/portMagmt/portInquiryList.do";
 	document.frm.submit();
}

function fn_egov_link_page(pageNo){
	var ptplPart = $("select[name=ptplPartList]").val();
	document.frm.ptplPart.value = ptplPart;
	document.frm.pageIndex.value = pageNo; 
	document.frm.action = "/front/portMagmt/portInquiryList.do";
	document.frm.submit();
}

function go_modify(ptplNo){
	document.frm.ptplNo.value = ptplNo; 
	document.frm.action = "/front/portMagmt/portModi.do";
	document.frm.submit();
}

function go_detail(ptplNo){
	document.frm.ptplNo.value = ptplNo; 
	document.frm.action = "/front/portMagmt/portDetail.do";
	document.frm.submit();
}

function fn_egov_delete(ptplNo) {
	document.frm.ptplNo.value = ptplNo; 
	document.frm.action = "/front/portMagmt/deleteTPtplInfo.do";
	document.frm.submit();
}

</script>
