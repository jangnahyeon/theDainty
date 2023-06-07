<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : sisulRsvBoardList.jsp
  * @Description : sisulRsvBoardList54 화면
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
				
				<div class="list_board reserve_list">
					<div class="list_head">
						<span class="bd_num">구분</span>
						<span class="bd_title">제목</span>
						<span class="bd_writer "><a href="/">작성자</a></span>
						<span class="bd_date "><a href="/">작성일</a></span>
						<span class="bd_hit "><a href="/">조회</a></span>
						<span class="bd_state"><a href="/">상태 </a></span>
					</div>
					<ul class="list_body">
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue">공지사항</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>공지사항 한줄 고정</b></a></div>
							<div class="bd_writer ">아이디1</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_blue">예약확정</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_orange">예약불가</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						<li class="list_item">
							<div class="bd_num"><span class="bg_blue_green">디자인스튜디오</span></div>
							<div class="bd_title"><a href="/" class="item_tit"><b>2022 인천국제디자인페어 디자인 세미나 사전모집 안내</b><em class="wicon file">(파일포함)</em></a></div>
							<div class="bd_writer ">아이디2</div>
							<div class="bd_date ">11.01</div>
							<div class="bd_hit ">140</div>
							<div class="bd_state"><span class="bl_gray">가예약중</span></div>
						</li>
						
					</ul>
					<div class="clearfix"></div>
				</div>
				
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