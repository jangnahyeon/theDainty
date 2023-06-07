<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TPtplInfoRegister.jsp
  * @Description : TPtplInfo Register 화면
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
<script type="text/javascript" src="/DLink/HTML/js/EgovMultiFiles.js"></script>
<div class="wrap_content">
			<!-- 타이틀 시작  -->
			<div class="con_title">
				<h3><i>마이페이지</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a></li>
					<li><a href="/front/portMagmt/portInquiryList.do">기업정보관리</a></li>
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
				<!-- 컨텐츠 영역 -->
				
				<div class="bd_view_thum">
					<div class="info_company mypage">
						<span class="info_item"><i><img src="../images/ex/port_logo.png" alt=""></i></span>
						<div class="info_tit">
							<strong>나의 회사명 (${comInfo.comNm })</strong>
							<p>${comInfo.comUrl }</p>
						</div>						
						<p class="info_btn"><a href="/front/privacy/infoModf" class="btn bl_gray icon_setting">회원정보 수정</a></p>
					</div>
				</div>
				
				<div class="tab_device">
					<a href="#" class="tab_device_ti"></a>
					<ul class="tab_style01">
						<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do" >알림센터</a></li>
						<li><a href="/front/Interest/proCompany.do">관심정보</a></li>
						<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
							<li><a href="/front/proAgency/infoMagmt.do" class="on">기업정보관리</a></li>
						<%if(("CP0002").equals(loginVO.getUserType())){ %>
							<li><a href="/front/privacy/infoModf.do">개인정보관리</a></li>
						<%} %>
						
					</ul>
				</div>
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/proAgency/infoMagmt.do">업체정보관리</a></li>
						<li><a href="/front/portMagmt/portInquiryList.do" class="on">포트폴리오관리</a></li>
					</ul>
				</div>
				
				<form:form modelAttribute="resultList" name="detailForm" id="detailForm" method="post">
				<input type="hidden" name="ptplNo" value="${resultList.ptplNo }">
				<section class="tab_content">
					<!-- 포트폴리오 -->
					<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
					<table class="tbl_basic bd_proposal">
						<caption>포트폴리오 등록테이블로 관련 정보를 입력합니다.</caption>
						<colgroup>
							<col class="bd_biz_reg">
							<col>
						</colgroup>
						<tbody>
							<!-- 임시 -->
							<!-- <tr>
								<th scope="row" class="tbl_name"><label for="name">이름<span class="tbl_star">*</span></label></th>
								<td><input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="name" autocomplete='off'></td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_title">등록코드<span class="tbl_star">*</span></label></th>
								<td><input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="data_title"></td>
							</tr> -->
							<tr>
								<th scope="row" class="tbl_name"><label for="data_cont">포트폴리오명<span class="tbl_star">*</span></label></th>
								<td>${resultList.ptplNm }</td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="keyword">연관검색어</label></th>
								<td>${resultList.refWord }</td>
							</tr>
							<tr>
							<!-- 임시 -->
							<!-- <th scope="row" class="tbl_name"><label for="ex_filename">업체</label></th>
								<td>
									<input type="text" size="" class="txt fxw" name="" value="" maxlength="50" id="ex_filename" autocomplete='off'>
								</td>
							</tr> -->
							<tr>
								<th scope="row" class="tbl_name">전문분야<span class="tbl_star">*</span></th>
								<td>${resultList.ptplPartNm }&nbsp;&nbsp;&nbsp;&nbsp;〉&nbsp;${resultList.ptplYouhaengNm }
								</td>
							</tr>
							<%-- <tr>
								<th scope="row" class="tbl_name"><label for="data_tag">로고타입</label></th>
								<td>
									${codeListPT }
									<!-- <p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p> -->
								</td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_tag">소분류</label></th>
								<td>
									${codeListPS }
									<!-- <p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p> -->
								</td>
							</tr>
							<tr>
								<th scope="row" class="tbl_name"><label for="data_tag">추가분류</label></th>
								<td>
									${codeListAP }
									<!-- <p class="mt10 f_size14">※ 최대 5개까지만 입력 가능합니다.</p> -->
								</td>
							</tr> --%>
							<tr>
								<th scope="row" class="tbl_name">디자인 컨셉<span class="tbl_star">*</span></th>
								<td class="">									
									${resultList.concept }
									<p class="f_size14">※ 최대 200글자 이하까지 입력 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="col"><label for="">대표이미지</label></th>
								<td class="">									
									<img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt="" style="width:300px; height:auto; padding:20px">
								</td>
							</tr>
							<tr>
								<th scope="col"><label for="">기타이미지</label></th>
								<td class="">
									<c:forTokens items="${resultList.multiSeq }" delims="," var="multiSeq">
									    <img src="/imagefile/preview.do?fileSeq=${multiSeq }" alt="" style="width:300px; height:auto; padding:20px"></br>
									</c:forTokens>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="bd_btn_area center">
						<button type="button" id="btnPrevStep" class="btn bl_gray" onclick="javascript:history.back();">취소</button>
						<button type="button" id="save_btn" class="btn bg_gray_dark" onclick="javascript:go_modify(${resultList.ptplNo});">수정</button>
					</div>
				</section>
				</form:form>
			</div>
		</div>	
				<!-- //컨텐츠 영역 -->
			
	
<script>
/* 글 목록 화면 function */
/* function go_register() {
   	document.getElementById("detailForm").action = "<c:url value='/front/portMagmt/registerTPtplInfo.do'/>";
   	document.getElementById("detailForm").submit();		
} */

/* 포트폴리오 등록 함수 */
function go_modify() {
	var params = $("#detailForm").serialize();
	
	$.ajax({
		url : "/front/portMagmt/updateTPtplInfo.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	        	alert("성공하였습니다.");
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});

}
function go_modify(ptplNo){
	document.detailForm.ptplNo.value = ptplNo; 
	document.detailForm.action = "/front/portMagmt/portModi.do";
	document.detailForm.submit();
}


</script>
