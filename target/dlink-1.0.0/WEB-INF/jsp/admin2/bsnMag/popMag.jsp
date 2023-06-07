<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : popMag.jsp
  * @Description : popMag 화면
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
												<option>사업자번호</option>
												<option>기관명</option>
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
							<caption>팝업관리 목록</caption>
							<colgroup>
								<col width="5%">
								<col>
								<col width="10%">
								<col width="8%">
								<col width="8%">
								<col width="6%">
								<col width="12%">
								<col width="9%">
								<col width="10%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">번호</th>
									<th scope="col" class="">제목</th>
									<th scope="col" class="">기간</th>
									<th scope="col" class="">종류</th>
									<th scope="col" class="">입력방법</th>
									<th scope="col" class="">진행</th>
									<th scope="col" class="">크기 및 위치</th>
									<th scope="col" class="">팝업보기</th>
									<th scope="col" class="">관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td class="left">홈페이지 리뉴얼 안내</td>
									<td style="line-height:10px;">2021-09-23<br>~<br>2021-10-06</td>
									<td></td>
									<td>이미지</td>
									<td>
										종료</td>
									<td>550 × 630<br>좌: 1500 , 위: 200</td>
									<td><span class="bd_btn"><button type="button" onclick="" class="btn_st mini line_gray">미리보기</button></span></td>
									<td>
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="left">홈페이지 리뉴얼 안내</td>
									<td style="line-height:10px;">2021-09-23<br>~<br>2021-10-06</td>
									<td></td>
									<td>이미지</td>
									<td>
										종료</td>
									<td>550 × 630<br>좌: 1500 , 위: 200</td>
									<td><span class="bd_btn"><button type="button" onclick="" class="btn_st mini line_gray">미리보기</button></span></td>
									<td>
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="left">홈페이지 리뉴얼 안내</td>
									<td style="line-height:10px;">2021-09-23<br>~<br>2021-10-06</td>
									<td></td>
									<td>이미지</td>
									<td>
										종료</td>
									<td>550 × 630<br>좌: 1500 , 위: 200</td>
									<td><span class="bd_btn"><button type="button" onclick="" class="btn_st mini line_gray">미리보기</button></span></td>
									<td>
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="left">홈페이지 리뉴얼 안내</td>
									<td style="line-height:10px;">2021-09-23<br>~<br>2021-10-06</td>
									<td></td>
									<td>이미지</td>
									<td>
										종료</td>
									<td>550 × 630<br>좌: 1500 , 위: 200</td>
									<td><span class="bd_btn"><button type="button" onclick="" class="btn_st mini line_gray">미리보기</button></span></td>
									<td>
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="left">홈페이지 리뉴얼 안내</td>
									<td style="line-height:10px;">2021-09-23<br>~<br>2021-10-06</td>
									<td></td>
									<td>이미지</td>
									<td>
										종료</td>
									<td>550 × 630<br>좌: 1500 , 위: 200</td>
									<td><span class="bd_btn"><button type="button" onclick="" class="btn_st mini line_gray">미리보기</button></span></td>
									<td>
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
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
						</div>


					<!-- //컨텐츠 영역 e -->