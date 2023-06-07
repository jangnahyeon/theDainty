<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : joinMember3. jsp
  * @Description : joinMember3 화면
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
						<li class="active step03">
							<div><strong>03.</strong> 회원정보 입력</div>
						</li>
						<li class="step04">
							<div><strong>04.</strong> 회원가입 완료</div>
						</li>
					</ol>
					<div class="agree_tit">
						<p><span class="">회원정보</span> 입력</p>
					</div>
									
					<div class="wirte_container_con">
						<div class="wirte_container_tit">
							<strong class="req"><b>*</b> 필수 항목입니다.</strong>
						</div>
						<div class="wirte_container_con_inner">	
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">아이디 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="아이디는 4~12자 영문,숫자만 사용가능">
										<button type="button" id="email_cert" class="com_btn">중복확인</button>
									</div>
								</div>
							</div>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">비밀번호<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="6~20자의 영문과 숫자의 조합">
									</div>
								</div>
							</div>
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">비밀번호 확인<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20">
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">이름<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20">
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">생년월일</label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20">
									</div>
								</div>
							</div>

							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_email">휴대전화<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">        
											<div class=" item_filter">
												<input type="text" name="wr_subject" value="010" id="wr_subject" required="" class="input01" size="3" maxlength="3" >
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="4" maxlength="4">
											</div>
											<span class="txt_dash">-</span>
											<div class=" item_filter" style="">
												<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="4" maxlength="4">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_email">이메일<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner">
										<div class="gourp_inp ">        
											<div class=" item_filter">
												<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="3" maxlength="3" >
											</div>
											<span class="txt_dash">@</span>
											<div class=" item_filter" style="">
												<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="4" maxlength="4">
											</div>
											<div class=" item_filter" style="">
												<div class="selec_area"><span class="select_btn">직접입력 </span>
													<select id="" name="">
														<option value="">직접입력</option>
														<option value="chollian.net">chollian.net</option><option value="daum.net">daum.net</option><option value="dreamwiz.com">dreamwiz.com</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<div class="wirte_tit">
									<label for="wr_subject">주소 </label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="">
										<button type="button" id="email_cert" class="com_btn">우편번호찾기</button>
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01 mt5" size="10" maxlength="20" placeholder="">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="">
									</div>
								</div>
							</div>
							
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_subject">사업장주소 <b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content">
									<div class="wirte_content_inner btn_box">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="">
										<button type="button" id="email_cert" class="com_btn">우편번호찾기</button>
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01 mt5" size="10" maxlength="20" placeholder="">
										<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="">
									</div>
								</div>
							</div>
							
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_name">사업자등록증 첨부<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content file">
									<div class="wirte_content_inner">
										<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										<label for="data_file">파일찾기</label>
										<input type="file" id="data_file" class="upload_hidden">
									</div>
								</div>
							</div>
							
							<div class="wirte_container"><!-- 기업회원일 경우 -->
								<div class="wirte_tit">
									<label for="wr_name">중소상공인확인서 첨부<b>*</b><strong class="blind">필수</strong></label>
								</div>
								<div class="wirte_content file">
									<div class="wirte_content_inner">
										<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										<label for="data_file">파일찾기</label>
										<input type="file" id="data_file" class="upload_hidden">
									</div>
								</div>
							</div>
							
							<div class="wirte_container">
								<p class="member_field_agree mt20">
									<em class="pr20">SMS나 이메일로 다양한 서비스를 받아보시겠습니까?</em> 
									<input type="radio" id="sms_agree" name="isSms" value="T">
									<label for="sms_agree">sms로 받기</label>
									<input type="radio" id="email_disagree" name="isEmail" value="F">
									<label for="email_disagree">email로 받기</label>
								</p>
							</div>
		
						</div>					
					</div>
					<!-- //member_cont -->
					<div class="bd_btn_area center">
						<button type="button" onclick="" class="mo_wd50">이전단계</button>
						<button type="button" onclick="" class="mo_wd50 btn_black">다음단계</button>
					</div>
				</div>
				<!-- //회원가입 -->
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->