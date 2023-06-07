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

<!-- <script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-ui.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script> -->
<!-- <script type="text/javascript" src="/DLink/HTML/js/common.js"></script> -->
<!-- <script type="text/javascript" src="/DLink/HTML/js/main.js"></script> -->
<link rel="stylesheet" type="text/css" href="/DLink/HTML/css/style.css">

<form:form name="searchForm" id="searchForm" method="post" action="/front/consult/consultInquiryList.do">
	
</form:form>
		
				<!-- <div class="tab_device mt40">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="#" class="on">전체</a></li>
						<li><a href="#">제품</a></li>
						<li><a href="#">시각</a></li>
						<li><a href="#">포장</a></li>
						<li><a href="#">멀티</a></li>
						<li><a href="#">서비스</a></li>
					</ul>
				</div> -->
				
				<%-- <div class="listWrap_top">
					<p class="info">기본화면은 랜덤순입니다.</p> 	
					<div class="align">
						<ul>
							<li class="<c:if test="${searchVO.searchKeyword2 eq 'favorite'  }">on</c:if>"><a href="javascript:orderSearch('favorite');" onclick="">♡많은순</a></li>
							<li class="<c:if test="${searchVO.searchKeyword2 eq 'recently'  }">on</c:if>"><a href="javascript:orderSearch('recently');" onclick="">최근등록순</a></li>
						</ul>
					</div>
				</div> --%>
					
					<ul class="lst_thum row04">
						<c:forEach var="resultList" items="${resultList}" varStatus="vs">
						<li>
							<em class="info_favorite"><button class="icon_heart" onclick="favoriteYn('${resultList.ptplNo}')"></button></em>
							<a onclick="showLayer(this,'.pop_modal');go_detail('${resultList.ptplNo}');return false;" href=".design_detail_view"  >
								<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></i></span>
								<strong>${resultList.ptplNm }</strong>
								<span class="info_date">${resultList.ptplPartNm }</span>
								
								<span class="info_over">
									<strong>${resultList.ptplNm }</strong>
									<span class="info_date">${resultList.ptplPartNm }</span>
									<span class="info_btn"><em class="btn">자세히보기</em></span>
								</span>
							</a>
						</li>
						</c:forEach>
					</ul>
					
					<div id="paging" class="pagination">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
						<input type="hidden" name="pageIndex" id="pageIndex"value="${paginationInfo.currentPageNo }"/>
					</div>
					
					
				
					<!-- 디자인 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view" id="pop_modal">
						<div class="pop_design_view"> 
							<h4 class="title">디자인 상세보기</h4>
							<div class="detail_design">
								<div class="detail_img">
									<span><img alt="" id="title_img"/></span>
									<div class="swiper-container" id="slider_list">
										<div class="swiper-wrapper" id="multi_img">
											<!-- <div class='swiper-slide close'>
												<div style="">
													<div class='slider_img'>
														<img id='multi_img_no' src='/imagefile/preview.do?fileSeq=138'/>
													</div>
												</div>
											</div>
											<div class="swiper-slide close">
												<div style="">
													<div class="slider_img">
														<img src="../images/ex/i_1.jpg" alt="" id=""/>
													</div>
												</div>
											</div> -->
										</div>
										 <div class="slideCtrl">
											<div class="swiper-button-prev"></div>
											<div class="swiper-pagination"></div>
											<div class="swiper-button-next"></div>
										</div>
									</div>
								</div>
								<div class="detail_info">
								
									
									<table class="tbl_basic">
										<caption>디자인에 대한 상세정보입니다.</caption>
										<col class="bd_title">
										<col>
										<tbody>
											<tr>
												<th scope="row" class="bd_title">주관기관</th>
												<td id="comNm">
											</tr>
											<tr>
												<th scope="row">제목</th>
												<td id="ptplNm"></td>
											</tr>
											<tr>
												<th scope="row">분야</th>
												<td id="ptplPart"></td>
											</tr>
										</tbody>
									</table>
									<p class="info_category"></p>
									<div class="info_detail">
										<li>
											<strong>design concept</strong>
											<div id="concept">
												
											</div>
										</li>
									</div>
									<c:if test="${loginVO.userType eq 'MG0001'}">   <!-- 개인일 경우에만 의뢰가능 -->
										<div class="bd_btn_area center">
											<a href=".design_write" onclick="showLayer_portfolio(this,'.pop_modal','');return false;" class="btn_black">의뢰하기</a>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<a href="#none" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //디자인 상세보기 모달팝업 -->
				<form name="detailForm" id="detailForm" >		
					<input type="hidden" id="ptplNo"/>
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
											<td>${loginVO.loginId}</td>
																			
										</tr>
										<tr>
											<th scope="row" class="bd_biz_reg">구분</th>
											<td>
												<c:choose>
													<c:when test="${loginVO.userType eq 'MG0001'}">
														개인
														<input type="hidden" id="regGb" name="regGb" value="MG0001" />	
													</c:when>
													<c:otherwise>
														기업
														<input type="hidden" id="regGb" name="regGb" value="MG0002" />
													</c:otherwise>
												</c:choose>
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
					
					
<script>
$(document).ready(function() {
	$('#slider_list .swiper-wrapper .swiper-slide .slider_img img').on('click', function(){
    	tm = $(this).attr('id');
    	
	    /* if($(this).parent().hasClass('on')){
	       
	    } else {
	    	
	    }
    return false; */
	});
	
});

/* 의뢰하기 등록 function */
function fn_egov_save(registerFlag) {	
	
	var registerFlag = $("#registerFlag").val("Insert");	 
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
function imgClick(fileSeq) {
	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+fileSeq);
}
function go_detail(no) {
	var arrType = {};
	var arrStyle = {};
	var arrAddOption = {};
	var arr = {};
	var arrFileSeq = [];
	
	var ptplType = '';
	var ptplStyle = '';
	var addOption = '';
	$.ajax({
		url : "/front/portfolio/selectPortfolioJson.do",
		data : {"ptplNo": no
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	
	    	$('#comNm').html('');
	    	$("#comNm").append(data.comNm);
	    	$('#ptplNm').html('');
	    	$("#ptplNm").append(data.ptplNm);
	    	$('#ptplPart').html('');
	    	$("#ptplPart").append(data.ptplPartNm + "&nbsp;&nbsp;&nbsp;〉" + data.ptplYouhaengNm);
	    	$("#concept").html('');
	    	$("#concept").append(data.concept);	  
	    	
	    	//$("#ptplNo").val(data.ptplNo);
	    	 $("#ptplNo").append("<input type='hidden' id='ptplNo' name='ptplNo' value='" + data.ptplNo + "' />"); 
	    	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
	    	
	    	if(data.multiSeq == null) {
	    	} else {
		    	arrFileSeq = data.multiSeq.split(",");
		    	var fileNum = arrFileSeq.length;
		    	
		    	var addMultiFile = "<div class='swiper-slide' style='width:91.6px'><div class='slider_img'><img id='multi_img_no' onclick='imgClick("+data.fileSeq+")'/></div></div>";
		    	for(var i = 0; i < fileNum; i++) {
		    		addMultiFile +="<div class='swiper-slide' style='width:91.6px'><div class='slider_img'><img id='multi_img_no"+ i +"' onclick='imgClick("+arrFileSeq[i]+")'/></div></div>";
		    	}
		    	
		    	$("#multi_img").html(addMultiFile);
		    	
		    	$("#multi_img_no").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
		    	for(var i = 0; i < fileNum; i++) {
			    	$("#multi_img_no"+i).attr("src", "/imagefile/preview.do?fileSeq="+arrFileSeq[i]);
		    	}
	    	}
	    	
	    	ptplType = data.ptplType;
	    	ptplStyle = data.ptplStyle;
	    	addOption = data.addOption;
	    	
	    	if(ptplType === "" || ptplType === undefined || ptplType === null) {
	    		
	    	} else {
	    		arrType =  ptplType.split(',');
	    		arr = arrType;
	    		
	    	}
	    	
	    	if(ptplStyle === "" || ptplStyle === undefined || ptplStyle === null) {
	    		
	    	} else {
	    		arrStyle = ptplStyle.split(',');
	    		if(arr == 'undefined' || arr == null || arr == '') {
	    			arr = arrStyle;
	    		} else {
	    			arr = arr.concat(arrStyle);
	    		}
	    		
	    	}
	    	
	    	if(addOption === "" || addOption === undefined || addOption === null) {
	    		
	    	}  else {
	    		arrAddOption = addOption.split(',');
	    		if(arr == 'undefined' || arr == null || arr == '') {
	    			arr = arrAddOption;
	    		} else {
	    			arr = arr.concat(arrAddOption);
	    		}
	    	}
	    	
	    	
	    	/* for(i in arr) {
	    		arr[i] = "'" + arr[i] + "'";
	    	} */
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	
	
	$('.info_category').html('');
	$.ajax({
		url : "/front/portfolio/selectCategoryNm.do",
		data : {"arr": arr
		},
		dataType : "json",
		
		type : "POST",
		async:false,
	    success: function(data){
	    	var lengthOfObject = Object.keys(data).length; 
	    	  console.log(lengthOfObject);
	    	if(lengthOfObject > 0) {
				$.each(arr, function(idx, val) {
					
		    		$(".info_category").append("<span class='category_tag'>#" + data[idx].codeNm + "</span>"); 
		    		
		    	});
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}

function fn_egov_link_page(pageNo){
	
	document.frm.pageIndex.value = pageNo; 
	document.frm.action = "/front/portfolio/portfSearchList.do";
	document.frm.submit();
}

function favoriteYn(ptplNo){
	var loginId = $("#loginId").val();
	
	<%if(loginVO == null){ %>
		alert("로그인해주세요");
	<%}%>
	
	$.ajax({
	    type: "POST",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/portfolio/portfolioFavoriteAjax.do",
	    data : {ptplNo:ptplNo},
	    dataType: "text",
	    success: function(data){
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}


//모달창 스크립트

//Popup modal style
function showLayer_portfolio(self,obj,ptplNo){
	
	<%if(loginVO == null){ %>
		alert('로그인 해주세요.');
		 location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;

	$('#pop_modal').hide();  // 포트폴리오 상세정보 모달창 닫기
	
	
	$('.pop_modal_bg').show();
	$('.modal_header_wrap').css('display','block');
	$('#header_wrap').addClass('no_shadow');
	if($(window).width()<668){
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').css('z-index','2');
	}
	

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



$(window).ready(function(){
	$(".tab_device_ti").click(function(){
		$(this).toggleClass("ov");
		$(".tab_device .tab_style01,.tab_device .tab_style02,.tab_device .tab_style03").slideToggle(400);	
		return false;	
	});
	
	var mySwiper = new Swiper ('.swiper-container', {
		direction: 'horizontal',
		slidesPerView:'auto', 
		mousewheel: true, 
		loop: true, 
		centeredSlides: false,
		observer: true,
		observeParents: true,
		autoplay: { //시간 1000 이 1초 
		delay: 2500,
		disableOnInteraction: false, 
		},
		 pagination: { 
		 el: '.swiper-pagination', 
		 clickable: true,
		 }, 
		 navigation: { 
		 nextEl: '.swiper-button-next',
		 prevEl: '.swiper-button-prev', 
		 },
		 breakpoints: {
		// 1280px 보다 클 경우
		1280: {
		  slidesPerView: 5,
		  spaceBetween: 5
			}
		}
	});
});
</script>

