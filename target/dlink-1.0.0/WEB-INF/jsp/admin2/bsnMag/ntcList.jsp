<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcList.jsp
  * @Description : ntcList 화면
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
					
					
					<!-- 상세검색 영역 s -->
					<div class="search_form_area">
						<table class="bd_tbl">
							<caption>이벤트 검색 폼</caption>
							<colgroup><col width="130"><col width="*"></colgroup>

							<tbody>
							<tr>
								<th scope="row">기간</th>
								<td>
									<div style="vertical-align:middle">
										<div class="area_calendar">
											<input type="text" id="collection_data01"><a href="#">달력</a> <span>~</span>
											<input type="text" title="기간검색 종료일입력"><a href="#">달력</a>
										</div>
										<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">등록일</th>
								<td>
									<div>
										<div class="area_calendar">
											<input type="text" id="collection_data01"><a href="#">달력</a> <span>~</span>
											<input type="text" title="기간검색 종료일입력"><a href="#">달력</a>
										</div>
										<p>직접 입력시에는 “2009-01-01” 형식으로 입력해주세요.</p>
									</div>
									<div class="mgt5">
										<button type="button" onclick="" class="btn_st mini line_gray">오늘</button>
										<button type="button" onclick="" class="btn_st mini line_gray">3일간</button>
										<button type="button" onclick="" class="btn_st mini line_gray">7일간</button>
										<button type="button" onclick="" class="btn_st mini line_gray">10일간</button>
										<button type="button" onclick="" class="btn_st mini line_gray">20일간</button>
										<button type="button" onclick="" class="btn_st mini line_gray">30일간</button>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">입점업체검색</th>
								<td>
									<input type="text" name="title" class="" value="" maxlength="50">
									<button type="button" onclick="" class="btn_st st_bg_blue small">검색</button>
								</td>
							</tr>
							<tr>
								<th scope="row">진행상태</th>
								<td>
									<ul class="chk_area">
										<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">전체</label></li>
										<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">대기</label></li>
										<li><input type="radio" name="kind" value="0003" id="kind3"> <label for="kind3">진행중</label></li>
										<li><input type="radio" name="kind" value="0003" id="kind4"> <label for="kind4">종료</label></li>
										<li><input type="radio" name="kind" value="0003" id="kind5"> <label for="kind5">마감</label></li>
									</ul>
								</td>
							</tr>

							<tr>
								<th scope="row">직접검색</th>
								<td>
									<div class="search_form fl">
										<div class="area_select mr10">
											<div class="selectbox">										
												<span class="select_label" for="select_name">검색조건</span>
													<select id="select_name">
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
										
									</div>
								</td>
							</tr>
							</tbody>
						</table>
					</div>	
					<!-- 상세검색 영역 e -->					
					
					
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
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="20%">
								<col width="10%">
								<col>
								<col width="15%">
								<col width="15%">
								<col width="15%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">업체명</th>
									<th scope="col" class="">지역</th>
									<th scope="col" class="">사업자번호</th>
									<th scope="col" class="">전화번호</th>
									<th scope="col" class="">FAX</th>
									<th scope="col" class="">처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
									<td>										
										<span class="bd_btn">
											<button type="button" class="btn_st mini line_orange">수정</button>
											<button type="button" class="btn_st mini bg_orange">삭제</button>
										</span>
									</td>
								</tr>
								<tr>
									<td>디자인메이트(주)</td>
									<td>세종</td>
									<td>
										<a href="#">292-92-00172</a>
									</td>
									<td>064-270-5005</td>
									<td>044-270-5005</td>
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