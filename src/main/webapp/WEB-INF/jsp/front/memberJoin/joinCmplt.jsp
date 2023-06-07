<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%
 /**
  * @Class Name : joinCmplt.jsp
  * @Description : joinCmplt 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-11
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>


<script type="text/javaScript" language="javascript" defer="defer">



</script>


<!-- 컨텐츠 영역 s -->


	<div class="wrap_content">
		<!-- 회원가입 -->
		<div class="join_agreement_wrap">
			<ol class="join_step_list">
				<li class="step00">
					<div><strong>01.</strong> 회원선택</div>
				</li>
				<li class="step01">
					<div><strong>02.</strong> 약관동의</div>
				</li>
				<li class="step02">
					<div><strong>03.</strong> 회원정보 입력</div>
				</li>
				<li class="active step03" title="현재 진행중">
					<div><strong>04.</strong> 회원가입 완료</div>
				</li>
			</ol>
			<div class="">
				<div class="agree_tit">
					<p><span class="">회원가입</span> 완료</p>
				</div>
				<div class="member_content">
					<div class="join_agreement_cont">
						<div class="join_agreement_box agree_all">
							<div class="joinComplete">
								<em>회원가입을 축하드립니다.</em>
							</div>
						</div>
						<div class="join_agreebox_wrap">
							
							<div style="font-size:20px; text-align:center; padding-top:25px;" >로그인후 이용가능합니다.
								<div class="bd_btn_area center">
									<a href="/front/login.do" class="btn bg_gray_dark">로그인</a>
								</div>
								<%-- <div class="join_agreement_box js_terms_view">
									<dl class="joinComplete">
										<dt style="font" >로그인후 이용가능합니다.</dt>
										<dd class="cl_black">${TReqUserVO.loginId}</dd>
										<dt class="">이름</dt>
										<dd class="cl_black">${TReqUserVO.userNm}</dd>
										<dt class="">이메일</dt>
										<dd class="cl_black">${TReqUserVO.emailAddr}</dd>
									</dl>
								</div> --%>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


