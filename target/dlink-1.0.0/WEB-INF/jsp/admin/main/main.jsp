<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
											<option>내용</option>
											<option>이미지명</option>
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
					
					<ul class="lst_thum row01">
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>								
								<strong>2021.03.21<i>북한산</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>북한산</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>
								<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>								
								<strong>2021.03.21<i>북한산</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>북한산</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>
								<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>								
								<strong>2021.03.21<i>북한산</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>북한산</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>
								<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>								
								<strong>2021.03.21<i>북한산</i></strong>
								
								<span class="info_over">
									<strong>2021.03.21<i>북한산</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
						<li>
							<a href=".collection_detail_view" onclick="">
								<span class="info_poster"><i><img src="DLink/admin_html/images/ex/i_1.jpg" alt=""></i></span>
								<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
								<span class="info_btn"><em class="btn_st bg_blue_green">이미지분류</em></span>
								
								<span class="info_over">
									<strong>2021.03.21<i>풍경(늪에 사는)풍경(늪에 사는)풍경(늪에 사는)</i></strong>
									<span class="info_btn"><em class="btn_st">상세보기</em></span>
								</span>
							</a>
						</li>
					</ul>
					
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
					<!-- //컨텐츠 영역 e -->
				</div>
				
