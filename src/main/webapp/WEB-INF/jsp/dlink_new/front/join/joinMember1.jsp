<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : joinMember1. jsp
  * @Description : joinMember1 화면
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
					<li class="active step01" title="현재 진행중">
						<div><strong>01.</strong> 회원선택</div>
					</li>
					<li class="step02">
						<div><strong>02.</strong> 약관동의</div>
					</li>
					<li class="step03">
						<div><strong>03.</strong> 회원정보 입력</div>
					</li>
					<li class="step04">
						<div><strong>04.</strong> 회원가입 완료</div>
					</li>
				</ol>
				<div class="choice_tit mb40">
					<p><strong>D.link</strong>에 오신 것을 환영합니다!</p>
					<p>원하시는 가입유형을 선택하세요.</p>
					<p>기업회원으로 가입하셔야 스튜디오 예약이 가능합니다.</p>
				</div>
								
				<div class="member_content choice_join">
					<ul>
						<li class="individual mb40">
							<div class="mem_choice">
								<a href="#" class="join_link">
									<p>개인회원</p>
									<span class="join_icon indiv_icon"></span>
									<span class="join_txt indiv_txt">D.link를 통해 제공하는 서비스를 이용하는 회원</span>
								</a>
								<div class="btn_con"><a href="#" class="join_link">
									</a><a href="/front/join/joinMember2.do?code=0002" class="join_btn">가입하기</a>
								</div>			
							</div>
							
						</li>
						<li class="corporate">
							<div class="mem_choice">
								<a href="#" class="join_link">
									<p>기업회원</p>
									<span class="join_icon corp_icon"></span>
									<span class="join_txt corp_txt">D.link에 기업을 등록 후 제공하는  서비스를 이용하는 회원</span>
								</a>
								<div class="btn_con"><a href="#" class="join_link">
									</a><a href="/front/join/joinMember2.do?code=0003" class="join_btn">가입하기</a>
								</div>
							</div>
							
						</li>
					</ul>
				</div>
				<!-- //member_cont -->
				</div>
				<!-- //회원가입 -->
				
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->