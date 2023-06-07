<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : joinMember4. jsp
  * @Description : joinMember4 화면
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

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">
				<!-- 회원가입 -->
				<div class="join_agreement_wrap">
					<ol class="join_step_list">
						<li class="step01">
							<div><strong>01.</strong> 회원선택</div>
						</li>
						<li class="step02" title="현재 진행중">
							<div><strong>02.</strong> 약관동의</div>
						</li>
						<li class="step03">
							<div><strong>03.</strong> 회원정보 입력</div>
						</li>
						<li class="active step04">
							<div><strong>04.</strong> 회원가입 완료</div>
						</li>
					</ol>
					<div class="agree_tit">
						<p><span class="">회원가입</span> 완료</p>
					</div>
					
					<div class="member_content">
						<div class="join_agreement_cont">
							<div class="join_agreement_box agree_all">
								<div class="joinComplete">
									<em>회원가입을 축하드립니다.</em>
									<!-- <span>이제 D.link의 모든 혜택을 누리실 수 있습니다.</span> -->
								</div>
							</div>
							<div class="join_agreebox_wrap">
								
								<div class="agree_left">
									<div class="join_agreement_box js_terms_view">
										<dl class="joinComplete">
											<dt class="">아이디</dt>
											<dd class="cl_black">${joinMemVO.memId }</dd>
											<dt class="">이름</dt>
											<dd class="cl_black">${joinMemVO.memNm }</dd>
											<dt class="">이메일</dt>
											<dd class="cl_black">${joinMemVO.email }</dd>
										</dl>
									</div>
								</div>
							</div>
						</div>
					</div>
									
					<!-- //member_cont -->
					<div class="bd_btn_area center">
						<button type="button" onclick="location.href='/front/login.do';" class="btn_black">로그인</button>
					</div>
				</div>
				<!-- //회원가입 -->
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->