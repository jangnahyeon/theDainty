<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : sisulRsrMag.jsp
  * @Description : sisulRsrMag 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
					<!-- 컨텐츠 영역 s -->
					
					<div class="bd_top_type01">
						<div class="area_left">
							<p class="bd_info_page">총 <span>135</span>건 <strong><em>1</em>/<span>100</span>페이지</strong></p>
						</div>
						
						<div class="fr">
							<fieldset class="search_form">
								<legend>검색</legend>

								<div class="sel_box">										
									<label for="sel_area">검색조건</label>
									<div>
										<select id="sel_area">
											<option>전체</option>
											<option>처리중</option>
											<option>처리완료</option>
										</select>
									</div>
								</div>

								<div class="bd_sel_search">
									<label for="sear_word" class="focus_tit">검색어를 입력하세요</label>
									<input type="text" id="sear_word">
									<input type="button" value="검색">
								</div>
							</fieldset>
						</div>			
					</div>
					<table class="bd_tbl bd_biz center">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="15%">
								<col>
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="15%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">업체명</th>
									<th scope="col" class="">제목</th>
									<th scope="col" class="">예약시간</th>
									<th scope="col" class="">촬영목적</th>
									<th scope="col" class="">첨부파일</th>
									<th scope="col" class="">처리여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td><em class="icon_file"></em></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">승인</button>
											<button type="button" class="btn_st mini bg_orange">반려</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">승인</button>
											<button type="button" class="btn_st mini bg_orange">반려</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">승인</button>
											<button type="button" class="btn_st mini bg_orange">반려</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">승인</button>
											<button type="button" class="btn_st mini bg_orange">반려</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_gray">처리완료</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_gray">처리완료</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_gray">처리완료</button>
										</span>
									</td>
								</tr><tr>
									<td>디자인메이트(주)</td>
									<td><a href="">디자인 스튜디오 예약합니다.</a></td>
									<td>2022.11.30 / 12:00 ~ 15:00</td>
									<td>메뉴판/간판</td>
									<td></td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_gray">처리완료</button>
										</span>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="bd_pagination">
							<a href="#" class="direction first">처음 페이지로</a>
							<a href="#" class="direction prev">이전 페이지로</a>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">10</a>
							<a href="#" class="direction next">다음 페이지로</a>
							<a href="#" class="direction last">마지막 페이지로</a>
						</div>
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black">등록</a>
							<a href="#" class="btn_black line_gray">수정</a>
							<a href="#" class="btn_black line_orange">삭제</a>
						</div>


					<!-- //컨텐츠 영역 e -->