<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rsv" value="${rsvSeqList}" />
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
$(document).ready(function(){
	<c:if test="${empty frontLoginVO}">
		alert("로그인 후 이용해 주세요");
		location.href = "/front/login.do";
	</c:if>
});

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
						<span class="name"><b>작성자</b><span>${rsv.memId}</span></span>
						<span class="date"><b>작성일</b><span><fmt:formatDate value="${rsv.regDt }" pattern="MM.dd"/></span></span>
						<span class="hit"><b>조회수</b><span>6</span></span>
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
									<p>${rsv.prodCnt}개 </p>
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
								<div class="tit_box"><b>중소상공인확인서 파일첨부</b></div>
								<div class="txt_box">
									<ul class="list_type01">
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="tit_box"><b>제품사진 파일첨부</b></div>
								<div class="txt_box">
									<ul class="list_type01">
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
										<li><a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a></li>
									</ul>
								</div>
							</li>
						</ul>
						
				
					</div> --%>
					<!-- 덧글 -->
					<!-- <div class="reply_area">
						<div class="reply_form">
							<label for="reply_write" class="focus_tit" style="">의견을 등록해 주세요. 내용과 무관한 댓글, 악플은 삭제될 수 있습니다. 댓글은 1000자까지 입력 가능합니다.</label>
							<textarea id="reply_write"></textarea>
							<a href="#">의견등록</a>
						</div>

						<ul class="reply_lst">
							<li>
								<em>로그인1<span>2021-02-19<span>08:50:34</span></span></em>
								<div>
									디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
								</div>
								<p class="btn_area_reply">
									<a href="#" class="btn bg_gray">삭제</a>
									<a href="#" class="btn bl_gray"><span>수정</span></a>
								</p>
							</li>
							<li>
								<em>홍길동<span>2021-02-19<span>08:50:34</span></span></em>
								<div>
									디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
								</div>
								<p class="btn_area_reply">
									<a href="#" class="btn bl_gray"><span>수정</span></a>
								</p>
							</li>
							<li>
								<em>로그인2<span>2021-02-19<span>08:50:34</span></span></em>
								<div>
									디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
								</div>
								<p class="btn_area_reply">
									<a href="#" class="btn bl_gray"><span>수정</span></a>
								</p>
							</li>
						</ul>

						<p class="bd_btn_area center"><a href="#" class="f_size16">더보기</a></p>
					</div> -->					
					
					<!-- //덧글 -->
					
									
					<!-- <div class="view_paging">
						<a role="button" href="" class="view_paging_prev">
							<b>이전글</b>
							<p class="ellipsis">2022 IDSC CMF 트렌드 4차(히다)</p>
						</a>
						<div class="view_paging_next">
							<b>다음글</b>
							<p class="ellipsis">다음글이 없습니다.</p>
						</div>
					</div> -->
					<div class="bd_btn_area center">
						<c:if test="${rsvSeq.acceptYn ne 'Y' && rsvSeq.acceptYn ne 'N' && rsvSeq.acceptYn ne 'C' }">
							<a href="#" onclick="javascript:rsvCancle()"class="bl_blue mo_wd50">예약 취소</a>
						</c:if>
						<a href="/front/mypage/sisulRsvList.do" class="btn_black icon_list">목록</a>
					</div>
				</div>
				</
			</div>
		</div>
		<!-- //컨텐츠 영역 -->