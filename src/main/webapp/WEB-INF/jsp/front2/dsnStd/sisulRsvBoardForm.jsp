<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : sisulRsvBoardForm. jsp
  * @Description : sisulRsvBoardForm 화면
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
			
				<div class="tab_group">
					<ul class="tab_wrap">
						  <li><a href="javascript:void(0);" class="" data="cs01"><span>예약현황</span></a></li>
						  <li><a href="javascript:void(0);" class="ov" data="cs02" ><span>예약게시판</span></a></li>
					</ul>
				</div>
				
				<h3>예약게시판</h3>
				
				<div class="bgcont_box icon_reserve">
					<ul>
						<li>※ 예약 현황(달력)을 참고하신 후 작성 바랍니다.</li>
						<li>※ 예약 가능한 날짜는 오늘 날짜보다 최소 5일 이후에 가능합니다. (주말 포함)</li>
						<li>※ 보내주신 신청서 검토 후 1~2일 내에 제품 촬영 상담을 위해 연락을 드리며    예약하신 날짜 기준으로 3일 전까지 통화가 되지 않을 시 자동 취소될 수 있습니다.</li>
						<li>※ 예약 게시판 상단의 ‘예약 시 주의사항’ 확인 부탁드립니다.</li>
						<li>※ 예약 확정 후에는 작성자가 신청 내용을 수정할 수 없습니다.</li>
					</ul>
				</div>
				
				<div class="wirte_container_con">
					<div class="wirte_container_tit">
						<h4 class="tit">기본정보 입력<span><input type="radio" name="gender" id="secret" value="" checked><label for="secret" class="">비밀글</label></span></h4>
						<strong class="req"><b>*</b> 필수 항목입니다.</strong>
					</div>
					<div class="wirte_container_con_inner">	
						
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_subject">제목<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input type="text" name="wr_subject" value="" id="wr_subject" required="" class="input01" size="10" maxlength="20" placeholder="예) 2022년 11월 23일(수) 오전 10~12시 예약합니다">
								</div>
							</div>
						</div>

						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_subject">예약일자<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area"><span class="select_btn">년도 선택 </span>
												 <select id="" name="" class="">
												   <option value="2022">2022년 </option>
												   <option value="2022">2022년 </option>
												</select>
											</div>
										</div>
										<div class=" item_filter" style="">
											<div class="selec_area"><span class="select_btn">월 선택 </span>
												 <select id="" name="" class="">
												   <option value="">11월 </option>
												</select>
											</div>
										</div>
										<div class=" item_filter" style="">
											<div class="selec_area"><span class="select_btn">일 선택 </span>
												 <select id="" name="" class="">
												   <option value="">1일 </option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">이용시간<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area"><span class="select_btn">시작시간 선택 </span>
												 <select id="" name="" class="">
												   <option value="CF002">09:00 </option>
												   <option value="CF003">10:00</option>
												   <option value="CF004">11:00</option>
												</select>
											</div>
										</div>
										<div class=" item_filter" style=""><!-- 4시간 이상 선택할 경우 alert창 >> "3시간 단위로만 예약 가능합니다" // 확인 후 주석 삭제하세요 -->
											<div class="selec_area"><span class="select_btn">종료시간 선택 </span>
												 <select id="" name="" class="">
												   <option value="CF004">11:00</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<p class="notice_p bottom">※ 예약일자 및 시간은 관리자 확인 후 변경될 수 있습니다.</p>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 개수<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<div class="gourp_inp ">        
										<div class=" item_filter">
											<div class="selec_area"><span class="select_btn">개수 선택 </span>
												 <select id="" name="" class="">
												   <option value="1개">1개 </option>
												   <option value="2개">2개 </option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영제품1<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input type="text" name="wr_email" id="wr_email" value="" class="input01 email" size="50" maxlength="100" placeholder="예) 감귤박스1kg(농산물)">
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영제품2<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input type="text" name="wr_email" id="wr_email" value="" class="input01 email" size="50" maxlength="100" placeholder="예) 비누1종패키지(화장품)">
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 크기<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
										<li><input type="radio" name="" id="sel3" value=""><label for="sel3" class="">30cm 이내</label></li>
										<li><input type="radio" name="" id="sel4" value=""><label for="sel4" class="">50cm 이내</label></li>
										<li><input type="radio" name="" id="sel5" value=""><label for="sel5" class="">1m 이내</label></li>
										<li><input type="radio" name="" id="sel6" value=""><label for="sel6" class="">1m  이상</label></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_email">촬영품 반사유무<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
										<li><input type="radio" name="" id="11" value=""><label for="11" class="">유광</label></li>
										<li><input type="radio" name="" id="22" value=""><label for="22" class="">반광</label></li>
										<li><input type="radio" name="" id="33" value=""><label for="33" class="">무광</label></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="data_cont">촬영 목적<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<ul class="gender_radio">
										<li><input type="radio" name="aim" id="aim1" value=""><label for="aim1" class="">상세페이지</label></li>
										<li><input type="radio" name="aim" id="aim2" value=""><label for="aim2" class="">메뉴판/간판</label></li>
										<li><input type="radio" name="aim" id="aim3" value=""><label for="aim3" class="">리플렛/카다로그</label></li>
										<li><input type="radio" name="aim" id="aim4" value=""><label for="aim4" class="">홈페이지 홍보</label></li>
									</ul>
								</div>
							</div>
						</div>
					

					
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_password">비밀번호<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="wirte_content_inner">
									<input type="password" name="wr_password" id="wr_password" required="" class="input01" maxlength="20">
								</div>
							</div>
						</div>
						
						<div class="wirte_container">
							<div class="wirte_tit">
								<label for="wr_name">첨부파일<b>*</b><strong class="blind">필수</strong></label>
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
							<div class="wirte_tit">
								<label for="wr_name">제품사진 파일첨부<b>*</b><strong class="blind">필수</strong></label>
							</div>
							<div class="wirte_content">
								<div class="photo_upload">
									<ul class="photo_list">
										<li>
											<a href="#" class="thumb"><img src="../images/ex/lst_thum_row02_01.jpg" width="80" height="80" alt="이미지">
											<span class="icon nicon_close delete btn_delete theme_background _deleteThumbnail"><span class="blind">삭제</span></span></a>
										</li>
									</ul>
									<ul class="list_photo">
										<li>
											<a href="#" class="thumb"><img src="../images/ex/lst_thum_row02_01.jpg" width="43" height="43" alt="이미지">
											<span class="icon nicon_close delete btn_delete theme_background "><span class="blind">삭제</span></span></a>
										</li>
										<li><span class="text_notice">사진등록(최대 5개)</span></li>
									</ul>
									<!-- 사진 5개 모두 등록시 추가 버튼 미노출 -->
									<a href=".photo_upload_view" onclick="showLayer(this,'.pop_modal');return false;" class="btn_add">
										<span class="icon icon_clip">
										</span>
									</a>
								</div>
							</div>
						</div>
						<div class="wirte_container">
							<span class="custom_checkbox">
								<input type="checkbox" value="1" name="wr_agree" id="wr_agree">
								<label for="wr_agree"><strong>개인정보 수집 및 이용 동의 </strong> 동의 (필수)<b>*</b>
								<a href=".agreement_view" onclick="showLayer(this,'.pop_modal');return false;" >보기</a></label>
							</span>
						</div>
	
					</div>					
				</div>
				
				<div class="bd_btn_area center">
					<button type="button" onclick="" class="mo_wd50">취소</button><!-- 버튼이 두개일경우만 mo_wd50 -->
					<button type="button" onclick="" class="mo_wd50 btn_black">등록</button>
					<!--<button type="button" disabled class="mo_wd50 btn_black">등록</button> 필수항목 채우지 않았을 경우 버튼 비활성화 -->
				</div>
				
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->