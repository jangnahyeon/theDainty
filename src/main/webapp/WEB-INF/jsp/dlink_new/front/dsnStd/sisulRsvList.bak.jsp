<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="brdLast" value="${brdLast}"/>
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
<script>
/* pagination 페이지 링크 function */
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

	
	
	<c:if test="${not empty frontLoginVO && frontLoginVO.code ne '0003'}">
		alert("기업회원만 작성이 가능합니다.");
		return;
	</c:if>
	<c:if test="${not empty frontLoginVO && frontLoginVO.code == '0003'}">
		location.href = "/front/dsnStd/sisulRsvBoardForm.do";
	</c:if>

}
</script>
<script>
function brdForm(){
/*     var brdForm = document.createElement("form");
    brdForm.setAttribute("method", "Post");
    brdForm.setAttribute("action", "/front/brd/brdView.do");

    var brdInput = document.createElement("input");
    brdInput.setAttribute("type", "hidden");
    brdInput.setAttribute("name", "brdSeq");
    brdInput.setAttribute("value", "${brdLast.brdSeq}");

    brdForm.appendChild(brdInput);
    
    document.body.appendChild(brdForm);

    brdForm.submit(); */
    document.getElementById("brdForm").submit();
}

$(function(){
	$.ajax({
		url : "/front/main/brdListJson.do",
		data : {
			"menuSeq" : 3,
			"searchCondition" : "srcNm",
			"searchKeyword" : "시설예약 공지사항"			
		},
		async : false,
		dataType : "json",
		success : function(res) {
			if(res) {				
				
				for(idx in res.brdList) {
					var brd = res.brdList[idx];
					
					console.log(brd);
					
					var parent = $("#list_body");	
					var child = $("#list_item_proto").clone();
					
					var bd_num = child.find(".bd_num>span");
					bd_num.text(brd.srcNm);
					
					var bd_title = child.find(".bd_title>a>b");
					bd_title.text(brd.title);
					
					var bd_title_a = child.find(".bd_title>a");
					var href = "/front/brd/brdView.do?brdSeq=" + brd.brdSeq + "&" + "menuSeq=" + 3;
					bd_title_a.attr("href", href);
					
					var file = child.find(".bd_title>a>.file");
					if( 0 < brd.brdFileCnt ) {
						file.show();
					} else {
						file.hide();
					}
					
					var reply = child.find(".bd_title>a>.reply");
					if( 0 < brd.brdCmtCnt ) {
						reply.show();
					} else {
						reply.hide();
					}
					
					reply.text(brd.brdCmtCnt);
					
					file.removeAttr("style");
					reply.removeAttr("style");
					
					var bd_writer = child.find(".bd_writer");
					bd_writer.text(brd.memVO.memNm);
					bd_writer.attr("style", "width:200px;")
					
					var bd_date = child.find(".bd_date");
					var regDt = new Date(brd.regDt);
					var year = regDt.getFullYear();
					var month = regDt.getMonth() + 1;
					var date = regDt.getDate();					
					var regDtStr = month < 10 ? "0" + month : "" + month;
					regDtStr += ".";
					regDtStr += date < 10 ? "0" + date : "" + date;					
					bd_date.text( regDtStr );
					
					var bd_hit = child.find(".bd_hit");
					bd_hit.text(brd.readCnt);
					
					child.find(".bd_state").text("");
					
					child.removeAttr("id");	
					child.show();
					parent.prepend(child);
					child.removeAttr("style");
					
				
				}
				
				
			} else {
				alert("공지사항 조회 실패.");
			}
		},
		error : function(err) {
			alert("공지사항 조회 실패..");
		}
	});	
	
});
</script>
		<!-- 컨텐츠 영역 -->
		<form:form name="brdForm" id="brdForm" action="/front/brd/brdView.do" method="post">
			<input type="hidden" name="brdSeq" value="${brdLast.brdSeq }">
    		<input type="hidden" name="menuSeq" value="${param.menuSeq }" />
		</form:form>
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post" onSubmit="fn_egov_link_page(1); return false;">
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
						<span class="bd_writer " style="width:200px;"><a href="/">업체명</a></span>
						<span class="bd_date "><a href="/">작성일</a></span>
						<span class="bd_hit "><a href="/">조회</a></span>
						<span class="bd_state"><a href="/">상태 </a></span>
					</div>
					<ul class="list_body" id="list_body">
					
						<li class="list_item" id="list_item_proto" style="display: none;">
							<div class="bd_num"><span class="bg_blue" >공지사항</span></div>
							<div class="bd_title">
								<a href=".password_view" onclick="showLayer(this,'.pop_modal');return false;" class="item_tit">
									<b>공지사항 한줄 고정</b>
									<em class="wicon file">(파일포함)</em>
									<em class="wicon reply">1</em>
								</a>
							</div>							
							<div class="bd_writer ">아이디1</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_blue">예약확정</span></div>
						</li>

						<%-- <li class="list_item">
							<input type="hidden" name="brdSeq" value="${brdLast.brdSeq }" />
							<div class="bd_num"><span class="bg_blue">${brdLast.srcNm}</span></div>
							<div class="bd_title">
							<a href="/front/brd/brdView.do?menuSeq=3&brdSeq=${brdLast.brdSeq}" onclick="" class="item_tit">
								<b>${brdLast.title}</b>
								<c:if test="${brdLast.brdFileCnt > 0}">
									<em class="wicon file">(파일포함)</em>
								</c:if>
 								<c:if test="${brdLast.brdCmtCnt > 0 }">
									<em class="wicon reply">${brdLast.brdCmtCnt }</em>
								</c:if>
							</a>
							</div>
							<div class="bd_writer ">관리자</div>
							<div class="bd_date ">
							<fmt:formatDate value="${brdLast.regDt }" pattern="MM.dd" />
							</div>
							<div class="bd_hit ">${brdLast.readCnt }</div>
							<div class="bd_state"></div>
						</li> --%>
						<c:forEach var="sisul" items="${resultList}">
						<c:if test="${not empty sisul.comNm }">
						<li class="list_item">
						<c:forEach var="list" items="${sisul.tbSisulVOList}">
							<c:if test="${sisul.sisulSeq eq list.sisulSeq}">
								<div class="bd_num"><span class="bg_blue_green">${list.sisulNm}</span></div>
							</c:if>
						</c:forEach>
								<div class="bd_title">
							<c:if test="${sisul.comNm == frontLoginVO.comNm || frontLoginVO.code == '0001'}">
								<a href="${rsvDtlPageUrl }?rsvSeq=${sisul.rsvSeq}" onclick="showLayer(this,'.pop_modal');return false;"  class="item_tit">
							</c:if>
								<b>${sisul.title}</b>
							<c:if test="${not empty sisul.tbSisulRsvFileVOList }">
								<em class="wicon file">(파일포함)</em><!-- 덧글이 있는 경우 -->
							</c:if>
							<c:if test="${sisul.sisulCmtCnt > 0 }">
								<em class="wicon reply">${sisul.sisulCmtCnt }</em>
							</c:if>
							<c:if test="${sisul.comNm == frontLoginVO.comNm || frontLoginVO.code == '0001'}">
							</a>
							</c:if>
							</div>

								<div class="bd_writer " style="width:200px;"><c:out value="${sisul.comNm}"/></div>
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
						</c:if>
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
				</div>
			
				<div class="bd_btn_area center">
					<a onclick="fn_write()" class="btn_black icon_write">글쓰기</a>
				</div>
				
			</div>
		</div>
		</form:form>
		<!-- //컨텐츠 영역 -->