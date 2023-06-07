<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : packageDsnSc.jsp
  * @Description : packageDsnSc 화면
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
				
				<h3>패키지 디자인 소스</h3>
				<div class="bd_top_style">
					<div class="area_left">
						<p class="bd_info_page">총 <span>135</span>건 <strong><em>1</em>/<span>100</span>페이지</strong></p>
					</div>
					
					<fieldset class="bd_sel_search">
						<legend>검색</legend>
						<label for="sear_" class="focus_tit" style="">검색어를 입력하세요</label>
						<input type="text" id="sear_">
						<input type="button" value="검색">
					</fieldset>	
				</div>
				
				<!-- 이미지게시판 -->
				<ul class="lst_thum row01">
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');return false;">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row02_01.jpg" alt=""></i></span>
							<strong>감귤박스 패키지</strong>
							
							<span class="info_over">
								<strong>감귤박스 패키지</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart active"></button></em><!-- 찜한소스 class "active" -->
						<a href="#">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row02_02.jpg" alt=""></i></span>
							<strong>제품이미지</strong>
							
							<span class="info_over">
								<strong>제품이미지</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row02_02.jpg" alt=""></i></span>
							<strong>제품이미지</strong>
							
							<span class="info_over">
								<strong>제품이미지</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row04_02.jpg" alt=""></i></span>
							<strong>패키지이미지</strong>
							
							<span class="info_over">
								<strong>패키지이미지</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item no_img"><i>이미지없음</i></span>
							<strong>패키지이미지</strong>
							
							<span class="info_over">
								<strong>패키지이미지)</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row04_03.jpg" alt=""></i></span>
							<strong>디자인네오</strong>
							
							<span class="info_over">
								<strong>디자인네오</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item no_img"><i>이미지없음</i></span>
							<strong>패키지이미지</strong>
							
							<span class="info_over">
								<strong>패키지이미지)</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href="#">
							<span class="info_item"><i><img src="../images/ex/lst_thum_row04_03.jpg" alt=""></i></span>
							<strong>디자인네오</strong>
							
							<span class="info_over">
								<strong>디자인네오</strong>
								<span class="info_btn"><em class="btn">다운로드</em></span>
							</span>
						</a>
					</li>
				</ul>
				<ul class="row01">
					<li class="no_data">현재 등록된 디자인이 없습니다.</li>
				</ul>
				<!-- //이미지게시판 -->
				
				<div class="pagination">
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
					<a href="" onclick="" class="btn_black icon_write">글쓰기</a>
				</div>
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->