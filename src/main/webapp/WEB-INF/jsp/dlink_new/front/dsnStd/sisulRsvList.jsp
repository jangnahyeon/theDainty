<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/dsnStd/sisulRsvList.do'/>";
   	document.getElementById("listForm").submit();
}
function fn_write() {
 	<c:if test="${empty frontLoginVO }">
		fn_login();
		return;
	</c:if>

	
	
	/* <c:if test="${not empty frontLoginVO && frontLoginVO.code ne '0003'}">
		alert("기업회원만 작성이 가능합니다.");
		return;
	</c:if> */
	<c:if test="${not empty frontLoginVO}">
		location.href = "/front/dsnStd/sisulRsvBoardForm.do";
	</c:if>

}

function chkUsr(memId, rsvSeq) {
	var loginId = "${memVO.memId}";
	var loginCode = "${memVO.code}";
	var url = "/front/dsnStd/sisulRsvView.do?rsvSeq=" + rsvSeq;
	
	if(loginId === memId) {
		location.href = url;
	} else if(loginCode == '0001') {
		location.href = url;
	} else if(loginId == '') {
		alert("로그인 후 이용해주세요.");
		fn_login();
	} else {
		alert("본인 글만 확인할 수 있습니다.");
		return false;
	}
}
</script>

<%-- <form:form name="brdForm" id="brdForm" action="/front/brd/brdView.do" method="post">
	<input type="hidden" name="brdSeq" value="${brdLast.brdSeq }">
	<input type="hidden" name="menuSeq" value="${param.menuSeq }" />
</form:form> --%>


<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post" onSubmit="fn_egov_link_page(1); return false;">		
	<!-- 컨텐츠 영역 -->
	<div class="contents">			
		<div class="innerwrap">	
		
			<div class="tab_group">
				<ul class="tab_wrap">
					<li><a href="/front/dsnStd/sisulRsv.do" class="" data="cs01"><span>예약현황</span></a></li>
					<li><a href="/front/dsnStd/sisulRsvList.do" class="ov" data="cs02" ><span>예약게시판</span></a></li>
				</ul>
			</div>
			
			<c:set var="rsvDtlPageUrl" value="/front/dsnStd/sisulRsvView.do" />
			<h3>예약게시판</h3>
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
					<span class="bd_writer " style="width:200px;">작성자</span>
					<span class="bd_date ">작성일</span>
					<span class="bd_hit ">조회</span>
					<span class="bd_state">상태</span>
				</div>
				<ul class="list_body">
					<!-- 공지사항 List출력 -->
					<c:forEach var="brdResult" items="${brdList}">
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue">시설예약 공지사항</span></div>
							<div class="bd_title"><a href="/front/brd/brdView.do?brdSeq=${brdResult.brdSeq }&menuSeq=3"  class="item_tit"><b>${brdResult.title}</b></a></div>
							<div class="bd_writer " style="width:200px;">관리자</div>
							<div class="bd_date ">${brdResult.regDt}</div>
							<div class="bd_hit ">${brdResult.readCnt }</div>
							<div class="bd_state"></div>
						</li>
					</c:forEach>
					<!-- 시설예약 List출력 -->
					<c:forEach var="result" items="${resultList}">
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">스튜디오</span></div>
							<div class="bd_title">
								<a href="javascript:void(0);" onclick="javascript:chkUsr('${result.memId }', '${result.rsvSeq }');" id="title" class="item_tit">
									<b>${result.title }</b>
								</a>
								<c:if test="${not empty result.tbSisulRsvFileVOList }">
									<em class="wicon file">(파일포함)</em>
								</c:if>
								<c:if test="${result.sisulCmtCnt > 0 }">
									<em class="wicon reply">${result.sisulCmtCnt }</em>
								</c:if>
							</div>
							<c:if test="${result.comNm eq null }">
								<div class="bd_writer" style="width:200px;">${result.memId }</div>
							</c:if>
							<c:if test="${result.comNm ne null }">
								<div class="bd_writer" style="width:200px;">${result.comNm }</div>
							</c:if>
							<div class="bd_date ">${fn:substring(result.regDt,0,10) }</div>
							<div class="bd_hit ">${result.readCnt }</div>
							
							<c:if test="${result.acceptYn == 'Y'}">
								<div class="bd_state"><span class="bl_blue">예약확정</span></div>
							</c:if>
							<c:if test="${result.acceptYn == 'W'}">
								<div class="bd_state"><span class="bl_gray">가예약중</span></div>
							</c:if>
							<c:if test="${result.acceptYn == 'N'}">
								<div class="bd_state"><span class="bl_orange">예약불가</span></div>
							</c:if>
							<c:if test="${result.acceptYn == 'C'}">
								<div class="bd_state"><span class="bl_orange">예약취소</span></div>
							</c:if>
							
						</li>
					</c:forEach>
					
				</ul>
				<div class="clearfix"></div>
			</div>
			
			<div id="paging" class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
				<input type="hidden" name="pageIndex"/>
			</div>
			
			<div class="bd_btn_area center">
				<a onclick="fn_write()" class="btn_black icon_write">글쓰기</a>
			</div>
			
		</div>
	</div>
</form:form>
<!-- //컨텐츠 영역 -->