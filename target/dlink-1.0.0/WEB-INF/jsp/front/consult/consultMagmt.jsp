<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyRegister.jsp
  * @Description : TCommuty Register 화면
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


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TCommutyVO" staticJavascript="false" xhtml="true" cdata="false"/ -->
	
<script type="text/javaScript" language="javascript" defer="defer">
 

    
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/front/consult/consultInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {

	var data = $("#detailForm").serialize();
		
		$.ajax({
		    type: "POST",
		    url: "/front/consult/deleteConsult.do",
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

/* 글 등록 function */
function fn_egov_save() {	
 
	
	 var data = $("#detailForm").serialize();

			
		$.ajax({
		    type: "POST",
		    url:"/front/consult/addConsult.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res != null){
		        	if(res == "suc"){
		        		alert("등록 되었습니다.");
		        		$("#searchForm").submit();
		        	}else if(res == "upsuc"){
		        		alert("수정 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert(res);
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

<!-- 
      수정 
function commtModi(){
	
	 $("#cmmt_tr").empty();
		$("#cmmt_tr")
		.append('<textarea path="cont"  placeholder="상담내용의 의견을 등록해 주세요 상담과 무관한 댓글, 악플은 삭제될 수 있습니다. 댓글은 1000자까지 입력 가능합니다."/>'
		    + '<a href="javascript:fn_egov_save("update")">의견등록</a>'
			+'<input type="hidden" id="menuId" value="'+menuId+'" ><input type="hidden" id="postNo" value="'+postNo+'" >'
			+'<input type="hidden" id="seq" value="'+seq+'" >'); 
}
-->

</script>			

<form:form name="searchForm" id="searchForm" method="post" action="/front/consult/consultInquiryList.do">
	
</form:form>


				<!-- container_wrap -->
	<div id="wrap_container">

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
	
			<form:form modelAttribute="TReqMakeVO" name="detailForm" id="detailForm" >
				<form:hidden path="reqNo" value="${reqNo}"/>
				<form:hidden path="ptplNo" value="${ptplNo}"/>
				<form:hidden path="seq" value="${seq}"/>
				<form:hidden path="registerFlag" value="MyInsert"/> 
				<form:hidden path="regGb" value="${regGb}"/>
		
					<div class="contents">
					<!-- 컨텐츠 영역 -->		
						<!-- <div class="bd_view_thum">
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
						
						<section class="tab_content">					
							<!-- 상담관리 -->
							<div class="bd_advice">
								<div class="reply_form">
									<textarea name="cont" id="cont"  placeholder="상담내용의 의견을 등록해 주세요 상담과 무관한 댓글, 악플은 삭제될 수 있습니다. 댓글은 1000자까지 입력 가능합니다."></textarea>
									<a href="javascript:fn_egov_save()">의견등록</a>
								</div>
		
								<ul class="reply_lst">
									<c:forEach var="selectCommentList" items="${selectCommentList}" varStatus="vs">				
										<li>
											<em>
												${selectCommentList.register}
												<input type="hidden" name="register" id="register" value="${selectCommentList.register}" />
											</em>
											<div>
												${selectCommentList.cont}
											</div>
											<!-- 로그인한 사용자와 등록한 사용자 비교 -->
											<!-- 	<p class="btn_area_reply">
													<a href="javascript:fn_egov_delete()" class="btn bg_gray">삭제</a>
												</p> -->
										</li>
									</c:forEach>
								</ul>
		
								<!-- <p class="bd_btn_area center"><a href="#" class="f_size16">더보기</a></p> -->
							</div>
							
							<div class="bd_btn_area right">
								<a href="javascript:fn_egov_selectList();" class="btn_black icon_list">목록</a>
							</div>
								
						</section>
						
					
						
					
					
					<!-- 검색조건 유지 -->
					<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
					
				</div>
						
							
			</form:form>
		</div>
	</div>



								