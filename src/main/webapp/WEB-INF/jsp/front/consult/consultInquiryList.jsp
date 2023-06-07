<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyList.jsp
  * @Description : TCommuty List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-03-30
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


/* 글 등록 화면 function */
function fn_egov_addView(reqNo,seq,ptplNo,regGb,registerFlag) {
    document.getElementById("listForm").reqNo.value = reqNo;
    document.getElementById("listForm").seq.value = seq;
    document.getElementById("listForm").ptplNo.value = ptplNo;
    document.getElementById("listForm").regGb.value = regGb;
	document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/front/consult/addConsultView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/consult/consultInquiryList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/consult/consultInquiryList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
/*
function fn_click_tab01($val){

	$("#tab01").val($val);
	
	fn_tab_ajax();
}

function fn_click_tab02($val){

	$("#tab02").val($val);
	
	fn_tab_ajax();
}

function fn_tab_ajax(){
	
	var tab01 = $("#tab01");
	var tav02 = $("#tab02");
	
	//ajax
	
}
*/
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/front/consult/consultInquiryList.do">
	
</form:form>



<!-- 
<input  type="hidden"  name="tab01" id="tab01" value="A"/>
<input  type="hidden"  name="tab02" id="tab02" value="1"/>
 -->					
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="registerFlag" id="registerFlag" />
    <input type="hidden" id="reqNo" name="reqNo" /> 
	<input type="hidden" id="ptplNo" name="ptplNo" />
	<input type="hidden" id="seq" name="seq" />
	<input type="hidden" id="regGb" name="regGb" />
			
			
			<div class="wrap_content">
				<div class="con_title">
					<h3><i>상담관리</i></h3>
					<ul class="loca">
						<li><a href="/front/main.do" class="home">home</a></li>
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
						<li><a href="#">상담관리</a></li>
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
				
				<!-- 	<div class="bd_view_thum">
						<div class="info_company mypage">
							<span class="info_item"><i><img src="../images/ex/port_logo.png" alt=""></i></span>
							<div class="info_tit">
								<strong>나의 회사명 (mmmming2323)</strong>
								<p>https://kmong.com/</p>
							</div>						
							<p class="info_btn"><a href="#" class="btn bl_gray icon_setting">회원정보 수정</a></p>
						</div>
					</div>
					 -->
				
				
					<div class="tab_device">
						<a href="#" class="tab_device_ti"></a>
						<ul class="tab_style01">
							<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">알림센터</a></li>
							<li><a href="/front/Interest/proCompany.do?sel_gb=agency">관심정보</a></li>
							<li><a href="/front/consult/consultInquiryList.do"  class="on">상담관리</a></li>
							<%if(("MG0001").equals(loginVO.getUserType())){ %>
								<li><a href="/front/privacy/infoInquiry.do">개인정보관리</a></li>
							<%} else {%>
								<li><a href="/front/proAgency/infoMagmt.do">기업정보관리</a></li>
							<% } %>
						</ul>
					</div>
				
				
					<section class="tab_content" >
				<!-- 컨텐츠 영역 s -->
					<div class="bd_top_style">
						<div class="area_left">
							<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 
							<strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.recordCountPerPage}</span>페이지</strong></p>
							
							<div class="area_right">
							<!-- <div class="area_calendar">
								<input type="text" title="검색조건 시작일입력"><a href="#">달력</a> <span>~</span>
								<input type="text" title="검색조건 종료일입력"><a href="#">달력</a>
							</div> -->
								<div class="area_select">
									<div class="selectbox">
										<label for="standard">검색조건</label>
											
										<form:select path="searchCondition" id="standard">
											<form:option value="0">검색조건선택</form:option>
											<form:option value="1">수신자</form:option>
											<form:option value="2">메세지</form:option>
										</form:select>
									</div>
									<!-- <input type="button" value="선택"> -->
								</div>
							</div>
						</div>	
						
						<fieldset class="bd_sel_search">
							<legend>검색</legend>
							<form:input path="searchKeyword" placeholder="검색어를 입력하세요" for="sear_" class="focus_tit" type="text" onkeyup="javascript:enterkey();"/>
							<input type="text" id="sear_" />
							<input type="button" onclick="go_search();"  value="검색" />
						</fieldset>		
					</div>

					<table class="tbl_basic center bd_type02">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="10%" />
								<col width="10%" /> 
								<col width="70%"  />
								<col width="10%" />
					        </colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">포트폴리오번호</th>
									<th scope="col">내용</th>
									<th scope="col">작성일</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<tr onclick="javascript:fn_egov_addView('${result.reqNo}', '${result.seq}', '${result.ptplNo}', '${result.regGb}', 'insert');"> 
										<td><c:out value="${paginationInfo.totalRecordCount+1 - ((paginationInfo.currentPageNo-1) * paginationInfo.pageSize + vs.count)}"/></td>
										<td class="tit">
											<a href="#">
												${result.ptplNo}
											</a>
										</td>
										<td>${result.cont}</td>
										<td>${result.regDt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
						
				<%-- 		
						<div class="bd_btn_area right">
							<a href="javascript:fn_egov_addView('${menuId}','insert');" class="btn_black">등록</a>
						</div>

				 --%>
			</section>
			
			</div>
		</div>
	</form:form>

