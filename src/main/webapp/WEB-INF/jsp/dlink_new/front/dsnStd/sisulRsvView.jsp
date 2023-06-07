<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rsv" value="${rsvSeq}" />
<%

 /**
  * @Class Name : sisulRsvView. jsp
  * @Description : sisulRsvView 화면
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
function file_download(fileSeq){
	
	var list_type01 = $('#list_type01').clone();
	
	var a = list_type01.find("a");
	a.attr("href", "/imagefile/download.do?file_no="+ fileSeq);
	a.attr("id", list_type01.attr("id") + "_" + fileSeq);
}
</script>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				<div class="view_wrap">
				<%@ include file="/WEB-INF/jsp/dlink_new/front/common/sisulRsvView.jsp" %>
<%-- 				<c:if test="${rsv.sisulSeq == 1}">		
					<span class="bg_blue">디자인스튜디오</span>
				</c:if>
					<h4>${rsv.title}</h4>
					<div class="view_top">
						<span class="name"><b>작성자</b><span>${rsv.memNm}</span></span>
						<span class="date"><b>작성일</b><span><fmt:formatDate value="${rsv.regDt}" pattern="yyyy.MM.dd" /></span></span>
						<span class="hit"><b>조회수</b><span>${rsv.readCnt}</span></span>
					</div>
					<div class="view_content">	
						
						<ul class="view_list">
							<li>
								<div class="tit_box"><b>예약일자</b></div>
								<div class="txt_box">
									<p>${rsv.rsvYear}년${rsv.rsvMonth}월${rsv.rsvDay}일</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>이용시간</b></div>
								<div class="txt_box">
									<p>${rsv.rsvSt}:00 ~ ${rsv.rsvEt}:00</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>촬영품 개수</b></div>
								<div class="txt_box">
									<p>${rsv.prodCnt}</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>촬영제품1</b></div>
								<div class="txt_box">
									<p>${rsv.prod1}</p>
								</div>
							</li>
						<c:if test="${rsv.prod2 != null}">
							<li>
								<div class="tit_box"><b>촬영제품2</b></div>
								<div class="txt_box">
									<p>${rsv.prod2}</p>
								</div>
							</li>
						</c:if>
							<li>
								<div class="tit_box"><b>촬영품 크기</b></div>
								<div class="txt_box">
									<p>${rsv.prodSizeCd}</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>촬영품 반사유무</b></div>
								<div class="txt_box">
									<p>${rsv.prodRefCd}</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>촬영 목적</b></div>
								<div class="txt_box">
									<p>${rsv.purposeCd}</p>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>중소상공인확인서 첨부파일</b></div>
								<div class="txt_box">
									<ul class="list_type01">
										<li><a href="/imagefile/download.do?file_no=${rsv.smBizFileSeq}" class="ellipsis" target="_blank" onchange="">${rsv.fileNm}</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>제품사진 첨부파일</b></div>
								<div class="txt_box">
									<ul class="list_type01">
									<c:forEach var="rsvSeqList" items="${rsvSeqList}">
												<li><a href="/imagefile/download.do?file_no=${rsvSeqList.fileSeq}" class="ellipsis" target="_blank">${rsvSeqList.fileNm}</a></li>
									</c:forEach>
									</ul>
								</div>
							</li>
						</ul>
						
				
					</div> --%>
					
					<div class="bd_btn_area center">
						<a href="/front/dsnStd/sisulRsvList.do" class="btn_black icon_list">목록</a>
					</div>
				</div>
			</div>
		</div>
		<!-- //컨텐츠 영역 -->