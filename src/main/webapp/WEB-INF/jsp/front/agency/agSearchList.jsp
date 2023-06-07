<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : mJoinInquiryList.jsp
  * @Description : mJoinInquiry List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-04-15
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


/* 글 상세  화면 function */
function fn_egov_select(comNm,loginId,registerFlag) {
	document.getElementById("listForm").comNm.value = comNm;
	document.getElementById("listForm").loginId.value = loginId;
    document.getElementById("listForm").registerFlag.value = registerFlag;
   	document.getElementById("listForm").action = "<c:url value='/front/agency/AgencyDetail.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.getElementById("listForm").registerFlag.value = "insert";
   	document.getElementById("listForm").action = "<c:url value='/admin/member/addTSpecReqComView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/agency/agSearchList.do'/>";
   	document.getElementById("listForm").submit();
}

function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/agency/agSearchList.do'/>";
   	document.getElementById("listForm").submit();
} 

function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}


/* 의뢰하기 등록 function */
function fn_egov_save(registerFlag) {	
	
	
	<%if(loginVO == null){ %>
		alert('로그인 해주세요.');
		 location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
	
	
	var registerFlag = document.getElementById("detailForm").registerFlag.value = registerFlag;	 
	alert(registerFlag);
	
	
	 var data = $("#detailForm").serialize();	
	 
	 
		$.ajax({
		    type: "POST",
		    url: "/front/consult/addConsult.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
		        		$("#consultSearchForm").submit();
		        	}else{
		        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#consultSearchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	
}


/* pagination 페이지 링크 function */
function fn_egov_tabSearch(ptplPart){
	document.getElementById("listForm").ptplPart.value = ptplPart;
	document.getElementById("listForm").action = "<c:url value='/front/agency/agSearchList.do'/>";
   	document.getElementById("listForm").submit();
}

/* 하트누르면 관심정보 이동 */
function favoriteYn(fileSeq,loginId){
	
	<%if(loginVO == null){ %>
		
		 location.href = "/front/login.do";
		alert('로그인 해주세요.');
		 
		 return false;
	<%} %>
	
	
	 
	$.ajax({
	    type: "POST",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/agency/portfolioFavoriteAjax.do",
	    data : {
	    	"fileSeq" : fileSeq,
	    	"loginId" :loginId	    	
	    },
	    dataType: "text",
	    success: function(msg){
	    	 if(msg == 'succes'){
	    		 alert("관심정보로 등록되었습니다.");
	    	 }
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}

//모달창 스크립트

//Popup modal style
function showLayer_agSearchList(self,obj,ptplNo){
	
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



<form:form name="searchForm" id="searchForm" method="post" action="/front/agency/agSearchList.do">
	
</form:form>

<form:form name="consultSearchForm" id="consultSearchForm" method="post" action="/front/consult/consultInquiryList.do">
	
</form:form>




   	<div class="wrap_content">

    		<!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>전문업체검색</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="#">전문업체검색</a></li>
					<li><a href="#">업체검색</a></li>
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
			
				<!-- 컨텐츠 영역 s -->
				<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
						<input type="hidden" name="comNm" id="comNm" />
						<input type="hidden" name="ptplNo" id="ptplNo" />
						<input type="hidden" name="loginId" id="loginId" />		
						<input type="hidden" name="ptplPart" id="ptplPart" />
				   		<input type="hidden" name="registerFlag" id="registerFlag" />	
				   	
	   	
	   	
			   		
				   		<!-- 검색박스 -->
							<div class="search_box gray">
								<!-- <fieldset> -->
									<legend>디자인검색</legend>
									<div class="category_selectbox wd_20per">
										<label for="standard">선택</label>
										<form:select id="standard" path="searchCondition">
											<form:option value="0">선택</form:option>
											<form:option value="1">전문업체이름</form:option>
											<form:option value="2">지역별 검색</form:option>
										</form:select>
									</div>
									 <!--<div class="category_selectbox wd_20per">
										<label for="standard">디자인분야선택</label>
										<form:select id="standard" path="searchCondition" cssClass="use">
											<form:option value="01">카테고리선택</form:option>
											
										</form:select>
									</div>
									<div class="category_selectbox wd_20per">
										<label for="standard">작업가능여부선택</label>
										<form:select id="standard" path="searchCondition" cssClass="use">
											<form:option value="001">카테고리선택</form:option>
											
										</form:select>
									</div>
									 -->
									<div class="ipt_search mt15">
										<form:input path="searchKeyword" placeholder="주관기관 검색" class="focus_tit" type="text" onkeyup="javascript:enterkey();" style="width:auto;"/>
										<input type="text" id="sear_word">
										<input type="button" onclick="go_search();"  value="검색">
									</div>
									
					                   
								<!-- </fieldset> -->
							</div>
							<!-- //검색박스 -->
							
	
							<!-- 컨텐츠 영역 -->
						<div class="tab_device mt40">
								<a href="#" class="tab_device_ti"></a>
								<ul class="tab_style01">
									<%-- <li><a href="javaScript:fn_egov_tabSearch('')" class="<c:if test="${empty searchVO.ptplPart}">on</c:if>">전체</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA0002')" class="<c:if test="${searchVO.ptplPart eq 'PA0002'}">on</c:if>">제품</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA0001')" class="<c:if test="${searchVO.ptplPart eq 'PA0001'}">on</c:if>">시각</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA0003')" class="<c:if test="${searchVO.ptplPart eq 'PA0003'}">on</c:if>">포장</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA0004')" class="<c:if test="${searchVO.ptplPart eq 'PA0004'}">on</c:if>">멀티</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA0006')" class="<c:if test="${searchVO.ptplPart eq 'PA0006'}">on</c:if>">서비스</a></li>
									<li><a href="javaScript:fn_egov_tabSearch('PA9999')" class="<c:if test="${searchVO.ptplPart eq 'PA9999'}">on</c:if>">기타</a></li> --%>
								</ul> 
							</div> 
						
								<!-- <div class="listWrap_top">
									<p class="info">기본화면은 랜덤순입니다.</p> 	
									<div class="align">
										<ul>
											<li class="on"><a href="javascript:;" onclick="">하트많은순</a></li>
											<li class=""><a href="javascript:;" onclick="">최근등록순</a></li>
										</ul>
									</div>
								</div> -->
						
								<ul class="lst_thum row01" id="load">
									<c:forEach var="resultList" items="${resultList}" varStatus="status">
										<li>
											<c:choose>
												<c:when test="${not empty resultList.fileSeq}"> <!-- fileSeq -->
													<span class="info_item">
														<i>
															<img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq}" alt="">
														</i>
													</span>
												</c:when>
												<c:otherwise>
													<span class="info_item no_img"><i>이미지없음</i></span>
												</c:otherwise>
											</c:choose>	
											
											
											
											<div class="com_box">
												<div class="">
													<strong><a href="javascript:fn_egov_select('${resultList.comNm}','${resultList.loginId}','view')">${resultList.comNm}</a></strong>
													<em class="info_favorite">	
														<button class="icon_heart" onclick="favoriteYn('${resultList.fileSeq}','${resultList.loginId}');return false;"></button>
													</em>
												</div>
												<!-- <p class="info_category"><span class="category_tag">#섬세한</span><span class="category_tag">#모던한</span></p>-->
												<p class="info_btn">
													<!-- 
														<a href="#" class="btn bg_gray_dark">메세지</a>
													 
													<a href=".design_write" onclick="showLayer_agSearchList(this,'.pop_modal');return false;" class="btn bl_gray">의뢰하기</a>
													-->
												</p>
											</div>
											<ul class="img_item">
												<c:forEach var="imgList" items="${resultList.imgList}" begin="0" end="3" step="1" varStatus="status">
													
															
													<li>
														<i>
															<img src="/imagefile/preview.do?fileSeq=${imgList.fileSeq}" alt="">
														</i>
													</li>
														
														
												</c:forEach>
												<c:if test="${empty resultList.imgList}">
													<li class="no_img"><i><img src="/images/ex/lst_thum_row02_03.jpg" alt=""></i></li>
												</c:if>
											</ul>
										</li>
									</c:forEach>
								</ul>
							
		
						
						<!-- 페이징 -->
						<div id="paging" class="pagination">
							<ui:pagination paginationInfo = "${paginationInfo}"
									   type="image"
									   jsFunction="fn_egov_link_page"
									   />
							<form:hidden path="pageIndex" />
						</div>
						<!-- end 페이징 -->
					</form:form>
				</div>	
				
				<form:form name="detailForm" id="detailForm" method="post" >
					<input type="hidden" name="loginId" id="loginId" value="${loginVO.loginId}"/>
					<!-- <input type="hidden" id="ptplNo"  name="ptplNo"/>   -->
					<input type="hidden" name="registerFlag" id="registerFlag" />	 
			
					<!-- 의뢰하기 모달팝업 -->
						<div class="pop_modal design_write">
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
												<td>${loginVO.loginId}</td>
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
					</form:form>
					
						
					<div class="pop_modal_bg"></div>
				</div>
			
		


