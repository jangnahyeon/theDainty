<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

 /**
  * @Class Name : sisulRsvList. jsp
  * @Description : sisulRsvList 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-01-05
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
		<!-- 컨텐츠 영역 -->
<%-- 		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post" onSubmit="fn_egov_link_page(1); return false;">
		<div class="contents">			
			<div class="innerwrap">	
			
				<div class="tab_group">
					<ul class="tab_wrap">
						  <li><a href="/front/dsnStd/sisulRsv.do" class="" data="cs01"><span>예약현황</span></a></li>
						  <li><a href="/front/dsnStd/sisulRsvList.do" class="ov" data="cs02" ><span>예약게시판</span></a></li>
					</ul>
				</div> --%>
				
<%-- 				<h3>예약게시판</h3>
				<div class="bd_top_style">
					<div class="area_left">
						<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.lastPageNoOnPageList}</span>페이지</strong></p>
					</div>
					
					<fieldset class="bd_sel_search">
						<legend>검색</legend>
						<label for="sear_" class="focus_tit" style="">검색어를 입력하세요</label>
						<input type="hidden" name="searchCondition" value="title" />
						<input type="text" id="sear_" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" maxlength="20">
						<input type="button" value="검색" onclick="fn_egov_link_page(1);">
					</fieldset>	
				</div>
				
				<div class="list_board reserve_list">
					<div class="list_head">
						<span class="bd_num">구분</span>
						<span class="bd_title">제목</span>
						<span class="bd_writer "><a href="/">작성자</a></span>
						<span class="bd_date "><a href="/">작성일</a></span>
						<span class="bd_hit "><a href="/">조회</a></span>
						<span class="bd_state"><a href="/">상태 </a></span>
					</div>
					<ul class="list_body">
					

						<li class="list_item">
						<input type="hidden" name="brdSeq" value="${brdLast.brdSeq }" />
							<div class="bd_num"><span class="bg_blue">${brdLast.srcNm}</span></div>
							<div class="bd_title">
							<a href="/front/brd/brdView.do?menuSeq=3&brdSeq=${brdLast.brdSeq}" onclick="" class="item_tit">
								<b>${brdLast.title}</b>
								<c:if test="${brdLast.fileSeq != 0}">
									<em class="wicon file">(파일포함)</em>
								</c:if>
								<c:if test="${result.brdCmtCnt > 0 }">
									<em class="wicon reply">${result.brdCmtCnt }</em>
								</c:if>
							</a>
							</div>
							<div class="bd_writer ">관리자</div>
							<div class="bd_date ">
							<fmt:formatDate value="${brdLast.regDt }" pattern="MM.dd" />
							</div>
							<div class="bd_hit ">${brdLast.readCnt }</div>
							<div class="bd_state"></div>
						</li>
					
						<c:forEach var="sisul" items="${resultList}">
						<li class="list_item">
						<c:forEach var="list" items="${sisul.tbSisulVOList}">
							<c:if test="${sisul.sisulSeq eq list.sisulSeq}">
								<div class="bd_num"><span class="bg_blue_green">${list.sisulNm}</span></div>							
							</c:if>
						</c:forEach>
								<div class="bd_title"><a href="${rsvDtlPageUrl }?rsvSeq=${sisul.rsvSeq}" onclick="showLayer(this,'.pop_modal');return false;"  class="item_tit"><b>${sisul.title}</b>
							<c:if test="${not empty sisul.tbSisulRsvFileVOList }">
								<em class="wicon file">(파일포함)</em><!-- 덧글이 있는 경우 -->
							</c:if>
							<c:if test="${sisul.sisulCmtCnt > 0 }">
								<em class="wicon reply">${sisul.sisulCmtCnt }</em>
							</c:if>
							</a></div>

								<div class="bd_writer "><c:out value="${sisul.memNm}"/></div>
								<div class="bd_date "><fmt:formatDate value="${sisul.regDt}" pattern="MM.dd" /></div>
								<div class="bd_hit ">${sisul.readCnt}</div>
							<c:if test="${sisul.acceptYn == 'Y'}">
								<div class="bd_state"><span class="bl_blue">예약확정</span></div>
							</c:if>
							<c:if test="${sisul.acceptYn == 'W'}">
								<div class="bd_state"><span class="bl_gray">가예약중</span></div>
							</c:if>
							<c:if test="${sisul.acceptYn == 'N'}">
								<div class="bd_state"><span class="bl_orange">예약불가</span></div>
							</c:if>
							<c:if test="${sisul.acceptYn == 'C'}">
								<div class="bd_state"><span class="bl_orange">예약취소</span></div>
							</c:if>
						</li>
						</c:forEach>
					</ul>
					<div class="clearfix"></div>
				</div>
				
				<div id="paging" class="pagination">
					<ui:pagination paginationInfo = "${paginationInfo}"
							   type="image"
							   jsFunction="fn_egov_link_page"
							   />
					<input type="hidden" name="pageIndex"/>
				</div> --%>
				
				<!-- <div class="bd_btn_area center">
					<a onclick="fn_write()" class="btn_black icon_write">글쓰기</a>
				</div> -->
				
			<%-- </div>
		</div>
		</form:form>
		<!-- //컨텐츠 영역 --> --%>