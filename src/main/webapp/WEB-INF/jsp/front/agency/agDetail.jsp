<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : mJoinDetail.jsp
  * @Description : mJoinDetail 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-07
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
var _ptplNo = '';


//모달창 스크립트

//Popup modal style
function showLayer_agdetail(self,obj,ptplNo){
	
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



/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/mJoinInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_tabSearch(ptplPart){
	document.getElementById("detailForm").ptplPart.value = ptplPart;
	document.getElementById("detailForm").action = "<c:url value='/front/agency/AgencyDetailTab.do'/>";
   	document.getElementById("detailForm").submit();
}


/* pagination 페이지 링크 function */
/* function fn_egov_tabSearch(ptplPart){
	
	
	var ptplPart = document.getElementById("detailForm").ptplPart.value = ptplPart;
	var comNm = $("#comNm").val();
	var loginId = $("#loginId").val();
   
   	$.ajax({
	    type: "get",
	    url: "/front/agency/AgencyDetailTab.do",
	    data : {
	    	'ptplPart' : ptplPart,
	    	'comNm' : comNm,
	    	'loginId' : loginId
	    },
	    dataType: "text",
	    success: function(msg){
	        if(msg != null){
	        	if(msg == "succes"){
	        		alert("성공");
	        		//console.log(data);
	        		//$("#lst_thum").html();
	        		location.reload();
	        		//$("#detailForm").submit();
	        	}else{
	        		alert( "실패");
	        		//$("#detailForm").submit();
	        	}
	        }
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});

}
 */


/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
	 var data = $("#detailForm").serialize();
	}	
		$.ajax({
		    type: "POST",
		    url: "/admin/member/deleteTSpecReqCom.do",
		    data : data,
		    dataType: "text",
		    success: function(rst){
		        if(rst != null){
		        	if(rst == "suc"){
		        		alert("삭제 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "삭제에 실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});

}

/* 글 수정 화면 function */
function fn_egov_select(loginId,registerFlag) {
    document.getElementById("detailForm").loginId.value = loginId;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/updateTSpecReqComView.do'/>";
   	document.getElementById("detailForm").submit();
}


/* 의뢰하기 등록 function */
function fn_egov_save() {	
		
		var cont = $("#cont").val();
		var loginId = $("#loginId").val();
		var registerFlag = "Insert";
		var regGb = $("#regGb").val();
	
		if(cont == ''){
			alert("내용을 입력해주세요.");
			return false;
		}
		
		
		$.ajax({
		    type: "POST",
		    url: "/front/consult/addAgDetail.do",
		    data : {
		    	"ptplNo" : _ptplNo,
		    	"cont" : cont,
		    	"loginId" : loginId,
		    	"registerFlag" : registerFlag,
		    	"regGb" : regGb
		    },
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
	    	console.log(data);
	    	_ptplNo = data.ptplNo;
	    	$('#ptplNm').html('');
	    	$("#ptplNm").append(data.ptplNm);
	    	$('#ptplPart').html('');
	    	$("#ptplPart").append(data.ptplPartNm + "&nbsp;&nbsp;&nbsp;〉" + data.ptplYouhaengNm);
	    	$("#concept").html('');
	    	$("#concept").append(data.concept);	  
	    	$("#ptplNo_11").append("<input type='hidden' id='ptplNo' name='ptplNo' value='" + data.ptplNo + "' />");
	    	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
	    	arrFileSeq = data.multiSeq.split(",");
	    	var fileNum = arrFileSeq.length;
	    	
	    	var addMultiFile = "<div class='swiper-slide'><div class='slider_img'><img id='multi_img_no' onclick='imgClick("+data.fileSeq+")'/></div></div>";
	    	for(var i = 0; i < fileNum; i++) {
	    		addMultiFile +="<div class='swiper-slide'><div class='slider_img'><img id='multi_img_no"+ i +"' onclick='imgClick("+arrFileSeq[i]+")'/></div></div>";
	    	}
	    	$("#multi_img").html(addMultiFile);
	    	
	    	$("#multi_img_no").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
	    	for(var i = 0; i < fileNum; i++) {
		    	$("#multi_img_no"+i).attr("src", "/imagefile/preview.do?fileSeq="+arrFileSeq[i]);
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

function fn_egov_close(){
	$(".pop_modal .pop_close").trigger("click");
}	

	
/* 하트누르면 관심정보 이동 */
function favoriteYn(imgPath,loginId,selGb){
	
	<%if(loginVO == null){ %>
		
		alert('로그인 해주세요.');
		location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
 
	$.ajax({
	    type: "POST",
	  // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/agency/AgencyDetailAjax.do",
	    data : {
	    	"imgPath" : imgPath,
	    	"loginId" :loginId,
	    	"selGb" : selGb
	    },
	    async:false,
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

/* 하트누르면 관심정보 이동 */
function favoriteYn_PtplNo(imgPath,ptplNo,loginId,selGb){
	
	<%if(loginVO == null){ %>
		
		alert('로그인 해주세요.');
		location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
	$.ajax({
	    type: "POST",
	  // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/agency/AgencyDetailAjax.do",
	    data : {
	    	"imgPath" : imgPath,
	    	"ptplNo" : ptplNo,
	    	"loginId" :loginId,
	    	"selGb" : selGb    	
	    },
	    async:false,
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


</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/member/mJoinInquiryList.do">
	
</form:form>

<form:form name="consultSearchForm" id="consultSearchForm" method="post" action="/front/consult/consultInquiryList.do">
	
</form:form>

			<!-- 컨텐츠 영역 s -->
	<form:form modelAttribute="TMemComVO" name="detailForm" id="detailForm" >				
		 
		<form:hidden path="registerFlag"/>
		<form:hidden path="ptplNo"/>
		<form:hidden path="imgPath"/>
		<form:hidden path="ptplPart"/>
		
	<div id="wrap_container">

		<div class="wrap_content">
			<!-- 타이틀 시작 -->
			<div class="con_title">
				<h3><i>디자인전문회사</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="#">전문업체검색</a></li>
					<li><a href="#">디자인전문회사</a></li>
				</ul>
				
			</div>
			<!-- 타이틀 끝 -->
			

			<div class="contents">
				<!-- 컨텐츠 영역 -->				
				<div class="bd_view_thum">
					<div class="info_company">
						<span class="info_item">
							<c:choose>
									<c:when test="${not empty setTMemComVO.imgPath}">
										<span class="info_item">
											<i>
												<img src="/imagefile/preview.do?fileSeq=${setTMemComVO.imgPath}" alt="">
											</i>
										</span>
									</c:when>
									<c:otherwise>
										<span class="info_item no_img"><i>이미지없음</i></span>
									</c:otherwise>
								</c:choose>	
							</span>
						<div class="info_tit">
							<strong>
								${setTMemComVO.comNm}
								<input type="hidden" id="comNm" name="comNm" value="${setTMemComVO.comNm}">
								<input type="hidden" id="ptLoginId" name="ptLoginId" value="${setTMemComVO.loginId}"/>
							</strong>
							<em class="info_favorite">
								<button class="icon_heart active" onclick="favoriteYn('${setTMemComVO.imgPath}','${setTMemComVO.loginId}','agency'); return false;"></button>
							</em>
							<p>${setTMemComVO.comUrl}</p>
						</div>							
						<div class="cp_detail">
							<ul>
								<!-- <li>
									<i>전문분야</i>
									<span>멀티</span>
								</li> -->
								<li>
									<i>소재지</i>
									<span>${setTMemComVO.comAddr} / ${setTMemComVO.comDtlAddr} (${setTMemComVO.comZip})</span>
								</li>
								<li>
									<i>전화번호</i>
									<span>${setTMemComVO.damdangMobileNo}</span>
								</li>
								<li>
									<i>E-mail</i>
									<span>${setTMemComVO.damdangEmail}</span>
								</li>
							</ul>
							<p class="info_btn">
								<!-- 
									<a href="#" class="btn bg_gray_dark">메세지</a>
								
								<a href=".design_write" onclick="showLayer_agdetail(this,'.pop_modal');return false;" class="btn bl_gray">의뢰하기</a> -->
							</p>
						</div>
					</div>
				</div>
				
					<div class="tab_device mt40">
						<a href="#" class="tab_device_ti"></a>
						<ul class="tab_style01">
							<li><a href="javaScript:fn_egov_tabSearch('')" class="<c:if test="${empty searchVO.ptplPart}">on</c:if>">전체</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA0002')" class="<c:if test="${searchVO.ptplPart eq 'PA0002'}">on</c:if>">제품</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA0001')" class="<c:if test="${searchVO.ptplPart eq 'PA0001'}">on</c:if>">시각</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA0003')" class="<c:if test="${searchVO.ptplPart eq 'PA0003'}">on</c:if>">포장</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA0004')" class="<c:if test="${searchVO.ptplPart eq 'PA0004'}">on</c:if>">멀티</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA0006')" class="<c:if test="${searchVO.ptplPart eq 'PA0006'}">on</c:if>">서비스</a></li>
							<li><a href="javaScript:fn_egov_tabSearch('PA9999')" class="<c:if test="${searchVO.ptplPart eq 'PA9999'}">on</c:if>">기타</a></li>
						</ul>
					</div>
							
					<ul class="lst_thum row04" id="lst_thum">
						<c:forEach var="setTPtplInfoVO" items="${setTPtplInfoVO}" varStatus="status">
							<li>
								<em class="info_favorite">
									
									<button class="icon_heart" onclick="favoriteYn_PtplNo('${setTMemComVO.imgPath}','${setTPtplInfoVO.ptplNo}','${setTPtplInfoVO.loginId}','ptpl'); return false;"></button>
									<form:hidden path="ptplNo"/>
									
								</em>
								<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');go_detail('${setTPtplInfoVO.ptplNo}');return false;" >
									<c:choose>
										<c:when test="${not empty setTPtplInfoVO.fileSeq}">
											<span class="info_item">
												<i>
													<img src="/imagefile/preview.do?fileSeq=${setTPtplInfoVO.fileSeq}" alt="">
												</i>
											</span>
										</c:when>
										<c:otherwise>
											<span class="info_item no_img"><i>이미지없음</i></span>
										</c:otherwise>
									</c:choose>	
										
									
									<strong>${setTPtplInfoVO.ptplNm}</strong>
									<span class="info_date">서비스</span>
									
									<span class="info_over">
										<strong>${setTPtplInfoVO.ptplNm}</strong>
										<span class="info_date">서비스</span>
										<span class="info_btn"><em class="btn">자세히보기</em></span>
									</span>
								</a>
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
					
					<!-- 디자인 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view" id="pop_modal">
						<div class="pop_design_view"> 
							<h4 class="title">디자인 상세보기</h4>
							<div class="detail_design">
								<div class="detail_img">
									<span><img alt="" id="title_img"/></span>
									<div class="swiper-container" id="slider_list">
										<div class="swiper-wrapper" id="multi_img">										
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
											<!-- <tr>
												<th scope="row" class="bd_title">주관기관</th>
												<td>!!!기관등록기능완료 후 추가 필요</td>
											</tr> -->
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
									<c:if test="${loginVO.userType eq 'MG0001'}">
										<div class="bd_btn_area center">
											<input type="hidden" id="ptplNo_11">
											<a href=".design_write" onclick="showLayer_agDetail(this,'.pop_modal');return false;" class="btn_black">의뢰하기</a>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //디자인 상세보기 모달팝업 -->
				<!-- 검색조건 유지 -->
		<%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/> --%>
				
	</div>

	
			
			
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
										</colgroup>
									<tbody>
										<tr>
												<th scope="row" class="bd_biz_reg"><span class="tbl_star">*</span>이름</th>
												<td>${loginVO.loginId}<input type="hidden" name="loginId" id="loginId" value="${loginVO.loginId}"/></td>
											</tr>
											<tr>
												<th scope="row" class="bd_biz_reg"><span class="tbl_star">*</span>구분</th>
												<td>
													<input type="hidden" id="regGb" name="regGb" value="${loginVO.userType }" />	
													<c:choose>
														<c:when test="${loginVO.userType eq 'MG0001'}">
															개인
														</c:when>
														<c:when test="${loginVO.userType eq 'MG0002'}">
															기업
														</c:when>
														<c:otherwise>
															기타
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="data_cont"><span class="tbl_star">*</span>내용</label></th>
												<td>
													<textarea id="cont" name="cont" rows="5"></textarea>
												</td>
											</tr>
										</tbody>
									</table>
									
								<div class="bd_btn_area center">
									<a onclick="fn_egov_save();" class="btn_black">등록</a>
									<a onclick="fn_egov_close();" class="btn bl_gray">취소</a>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //의뢰하기 모달팝업 -->
				
					<div class="pop_modal_bg"></div>
				
				<!-- //컨텐츠 영역 -->
			</div>
		</div>
	
	<!-- //container_wrap --> 
</form:form>
				
	<script>
	
	//모달창 스크립트

	//Popup modal style
	function showLayer_agDetail(self,obj){
		
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

	</script>

