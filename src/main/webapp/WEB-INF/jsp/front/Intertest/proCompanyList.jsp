<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TSelImgList.jsp
  * @Description : TSelImg List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-04-14
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


function fn_egov_select(userId) {
    document.getElementById("listForm").userId.value = userId;
   	document.getElementById("listForm").action = "<c:url value='/TSelImg/updateTSelImgView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/TSelImg/addTSelImgView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/TSelImg/TSelImgList.do'/>";
   	document.getElementById("listForm").submit();
}

  -->
  
  /* 글 상세  화면 function */
  function fn_egov_select(comNm,loginId,registerFlag) {
  	document.getElementById("searchListForm").comNm.value = comNm;
  	document.getElementById("searchListForm").loginId.value = loginId;
      document.getElementById("searchListForm").registerFlag.value = registerFlag;
     	document.getElementById("searchListForm").action = "<c:url value='/front/agency/AgencyDetail.do'/>";
     	document.getElementById("searchListForm").submit();
  }
  
 
  /* 의뢰하기 등록 function */
function fn_egov_save(registerFlag) {	
	
	var registerFlag =  document.getElementById("modalDetailForm").registerFlag.value = registerFlag; 
	 var data = $("#modalDetailForm").serialize();	
	 
		$.ajax({
		    type: "POST",
		    url: "/front/consult/addConsult.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	
}
 
  
function modal_view(ptplNo) {

    $('#uiloehagi').on('show.bs.modal', function (event) {

        $(".detail_design #ptplNo").val( ptplNo );

    })

}




// 모달창 스크립트

// Popup modal style
function showLayer_company(self,obj,ptplNo){
	
	<%if(loginVO == null){ %>
		alert('로그인 해주세요.');
		 location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;
	$('.pop_modal_bg').show();
	$('.modal_header_wrap').css('display','block');
	$('#header_wrap').addClass('no_shadow');
	if($(window).width()<668){
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').css('z-index','2');
	}
	
	document.getElementById("ptplNo").value = ptplNo;

	//$('#ptplNo').val(ptplNo);
	scrollNone();

	$target.attr('tabindex', '0').show().focus();
	$(obj).css({"margin-top":"-"+ _pHeight +"px","margin-left":"-"+ _pWidth +"px"})
	$(obj).find(".pop_close").click(function(){
		hideLayer();
	});

	//키보드 포커스 popup modal 영역운영
	var 
		firstElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':first'),
		lastElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':last');
		firstElement.off("keydown").on("keydown",function(b){
			if(b.keyCode == 9 && b.shiftKey){
				b.preventDefault();
				lastElement.focus();
			}
		});

	lastElement.off("keydown").on("keydown",function(b){
		if(b.keyCode == 9 && b.shiftKey){
		} else if (b.keyCode == 9){
			b.preventDefault();
			firstElement.focus();
		}
	});

	function hideLayer(){
		$(obj).hide();
		$(obj).removeAttr('tabindex');
		$('.pop_modal_bg').hide().css({'top':'0','height':'100%'});
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').removeClass('no_shadow').css('z-index','101');
		scrollBlock();
		$self.focus();
		$(this).off('click');
	}
}

function fn_egov_close(){
	$(".pop_modal .pop_close").trigger("click");
}
</script>


<form:form name="searchForm" id="searchForm" method="post" action="/front/consult/consultInquiryList.doo">
	
</form:form>

<form:form modelAttribute="searchVO" name="searchListForm" id="searchListForm" method="post">
	<input type="hidden" name="comNm" id="comNm" />						
	<input type="hidden" name="loginId" id="loginId" />		
  		<input type="hidden" name="registerFlag" id="registerFlag" />	
</form:form>


<div class="wrap_content">

    <!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>관심정보</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
					<li><a href="#">관심정보</a></li>
				</ul>
								
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
						<li><a href="/front/Interest/proCompany.do?sel_gb=agency" class="on">전문회사</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=ptpl">포트폴리오</a></li>
						<li><a href="/front/Interest/proCompany.do?sel_gb=dsn">이미지</a></li>
					</ul>
				</div>
			
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
				
				   		
				<section class="tab_content">	
	
					<!-- 포트폴리오 -->
						<!-- <div class="listWrap_top">
							<p class="info">기본화면은 등록순입니다.</p> 	
							<div class="align">
								<ul>
									<li class="on"><a href="javascript:;" onclick="">하트많은순</a></li>
									<li class=""><a href="javascript:;" onclick="">최근등록순</a></li>
								</ul>
							</div>
						</div>
						 -->
						 
						 
						<ul class="lst_thum row01">
							<c:forEach var="TSelImgList" items="${TSelImgList}" varStatus="vs">
								<c:forEach var="agSearchList" items="${TSelImgList.agSearchList}" varStatus="status">
									<li>		
											<c:choose>
												<c:when test="${not empty agSearchList.fileSeq}">
													<span class="info_item">
														<i><img src="/imagefile/preview.do?fileSeq=${agSearchList.fileSeq}" alt="대표이미지" /></i>
													</span>
												</c:when>
												<c:otherwise>
													<span class="info_item"><i><img src="/images/ex/lst_thum_row02_03.jpg" alt=""></i></span>
												</c:otherwise>
											</c:choose>	
											
												<div class="com_box">
													<div class="">
														
															<strong>
																<a href="javascript:fn_egov_select('${agSearchList.comNm}','${agSearchList.loginId}','view')">${agSearchList.comNm}</a>
															</strong>
														
															
														<!-- <em class="info_favorite"><button class="icon_heart"></button></em> -->
													</div>
													<!-- <p class="info_category"><span class="category_tag">#섬세한</span><span class="category_tag">#모던한</span></p> -->
													<p class="info_btn">
														<!--  <a href="#" class="btn bg_gray_dark">메세지</a> 
														<a href="#uiloehagi" onclick="showLayer_company(this,'.pop_modal', '${TSelImgList.ptplNo}');return false;" class="btn bl_gray">의뢰하기</a>
														--> 
													</p>
												</div>
											
												<ul class="img_item">
													<c:forEach var="imgList" items="${TSelImgList.imgList}" begin="0" end="3" step="1" varStatus="status">
														<c:choose>
															<c:when test="${not empty imgList.fileSeq}">
																<li>
																	<i>
																		<img src="/imagefile/preview.do?fileSeq=${imgList.fileSeq}" alt="">
																	</i>
																</li>
															</c:when>
															<c:otherwise>
																<li class="no_img"><i><img src="/images/ex/lst_thum_row02_03.jpg" alt=""></i></li>
															</c:otherwise>
														</c:choose>	
													</c:forEach>
												</ul>
										</li>
									</c:forEach>
									
									
							
							</c:forEach>
						</ul>
			
						
						<div class="pagination" id="paging">
							<ui:pagination paginationInfo = "${paginationInfo}"
								   type="image"
								   jsFunction="fn_egov_link_page"
								   />
							<form:hidden path="pageIndex" />
						</div>
			
				</section>		
		</form:form>
					
			<form name="modalDetailForm" id="modalDetailForm" >		
				<input type="hidden" name="loginId" id="loginId" value="${loginVO.loginId}"/>
				<input type="hidden" id="ptplNo" name="ptplNo" />
				<input type="hidden" name="registerFlag" id="registerFlag" />
					
					<!-- 의뢰하기 모달팝업 -->
					<div class="pop_modal design_write" id="uiloehagi">
						<div class="pop_design_view"> 
							<h4 class="title">의뢰하기</h4>
							<div class="detail_design">
								<table class="tbl_basic">
									<caption>의뢰하기 등록테이블로 제목, 내용, 동의여부확인 관련 정보를 입력합니다.</caption>
									<colgroup><col class="bd_biz_reg">
									<col>
									</colgroup><tbody>
										<tr>
											<th scope="row" class="bd_biz_reg">이름</th>
											<td>
												${loginVO.loginId}
											</td>
										</tr>
										<tr>
											<th scope="row" class="bd_biz_reg">구분</th>
											<td>
												<select id="regGb" name="regGb">
													<option value="none">선택</option>
													<c:forEach var="codeListCP" items="${codeListCP}" varStatus="vs">
														<option value="${codeListCP.code}" >${codeListCP.codeNm}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="data_cont">내용<span class="tbl_star">*</span></label></th>
											<td>
												<textarea id="cont" name="cont"></textarea>
											</td>
										</tr>
										
									</tbody>
								</table>
								
								<div class="bd_btn_area center">
									<a onclick="fn_egov_save('Insert');" class="btn_black">등록</a>
									<a onclick="fn_egov_close();" class="btn bl_gray">취소</a>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //의뢰하기 모달팝업 -->
				</form>
				
				
			<div class="pop_modal_bg"></div>
		
		<!-- //컨텐츠 영역 -->
	</div>
</div>


