<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : mtypeSelect.jsp
  * @Description : 회원관리 - 01회원선택 화면
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

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="loginId" />
   	<input type="hidden" name="registerFlag" id="registerFlag" />	

		<div class="wrap_content">
			<!-- 회원가입 -->
			<div class="join_agreement_wrap">
				<ol class="join_step_list">
					<li class="active step00" title="현재 진행중">
						<div><strong>01.</strong> 회원선택</div>
					</li>
					<li class="step01">
						<div><strong>02.</strong> 약관동의</div>
					</li>
					<li class="step02">
						<div><strong>03.</strong> 회원정보 입력</div>
					</li>
					<li class="step03">
						<div><strong>04.</strong> 회원가입 완료</div>
					</li>
				</ol>
				<div class="choice_tit mb40">
					<p><strong>D</strong>.link에 오신 것을 환영합니다!</p>
					<p>원하시는 가입유형을 선택하세요.</p>
				</div>
								
				<div class="member_content choice_join">
					<ul>
						<li class="individual mb40">
							<div class="mem_choice">
								<a href="#" class="join_link">
									<p>개인회원</p>
									<span class="join_icon indiv_icon"></span>
									<span class="join_txt indiv_txt">D.link를 통해 제공하는 서비스를 이용하는 회원</span>
									<div class="btn_con">
										<a href="/front/memberJoin/prtermsAgree.do" class="join_btn">가입하기</a>
									</div>
								</a>
							</div>
						</li>
						<li class="corporate">
							<div class="mem_choice">
								<a href="#" class="join_link">
									<p>기업회원</p>
									<span class="join_icon corp_icon"></span>
									<span class="join_txt corp_txt">D.link에 기업을 등록 후 제공하는  서비스를 이용하는회원</span>
									<div class="btn_con">
										<a href="/front/memberJoin/cptermsAgree.do" class="join_btn">가입하기</a>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- //회원가입 -->
		</div>

</form:form>

