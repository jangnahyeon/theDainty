<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : codeMag.jsp
  * @Description : codeMag 화면
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
					<div class="bd_top_type02">
						<h4 class="mt0 tit area_left">신청인 정보입력</h4>
						
						<div class="bd_btn_area right">
							<a href="#" class="btn_st small line_blue">조회</a>
							<a href="#" class="btn_st small">등록</a>
							<a href="#" class="btn_st small line_gray">수정</a>
							<a href="#" class="btn_st small line_orange">삭제</a>
						</div>
					</div>
						<form name="codegb_form" id="codegb_form">
						<table class="bd_tbl bd_tbl_view" cellspacing="0">
							<caption></caption>
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 23%;">
								<col style="width: 12%;">
								<col style="width: 21%;">
								<col style="width: 10%;">
								<col style="width: 23%;">
							</colgroup>
							<tbody>
								<tr>
									<th>코드분류</th>
										<td>
											<input type="text" id="gb_cd" name="gb_cd" class="wd_60">
											<a href=".sch_layer" onclick="showLayer(this,'.pop_modal');return false;" title="레이어팝업" class="btn_st st_bg_blue small"><span>찾기</span></a>
										</td>
									<th>코드분류명</th>
										<td><input type="text" id="gb_nm" name="gb_nm" class="wd_100"></td>
									<th>사용여부</th>
										<td>
											<select name="use_yn" id="use_yn" class="wd_100">
												<option value="">없음</option>
												<option value="Y">사용</option>
												<option value="N">사용하지 않음</option>
											</select>
										</td>
								</tr>
								<tr>
									<th>정의1</th>
										<td><input type="text" id="user_def1" name="user_def1" class="wd_100"></td>
									<th>정의2</th>
										<td><input type="text" id="user_def2" name="user_def2" class="wd_100"></td>
									<th>내용</th>
										<td><input type="text" id="etc_cont" name="etc_cont" class="wd_100"></td>
								</tr>
							</tbody>
						</table> 
						</form>
						
						<table class="bd_tbl bd_biz center mt50">
							<caption>시스템관리 목록</caption>
							<colgroup>
								<col width="12%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col>
								<col width="12%">
					        </colgroup>
							<thead>
								<tr>
									<th scope="col" class="">코드</th>
									<th scope="col" class="">코드명</th>
									<th scope="col" class="">정의1</th>
									<th scope="col" class="">정의2</th>
									<th scope="col" class="">내용</th>
									<th scope="col" class="">사용여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0001</td>
									<td>장애</td>
									<td>요청</td>
									<td>요청합니다</td>
									<td class="left">요청합니다</td>
									<td>Y</td>
								</tr>								
							</tbody>
						</table>
						
						
						<div class="bd_top_type02">
							<h4 class="mt0 tit area_left">코드정보</h4>
							
							<div class="bd_btn_area right">
								<a href="#" class="btn_st small line_blue">조회</a>
								<a href="#" class="btn_st small">등록</a>
								<a href="#" class="btn_st small line_gray">수정</a>
								<a href="#" class="btn_st small line_orange">삭제</a>
							</div>
						</div>

						<form name="codegb_form" id="codegb_form">
						<table class="bd_tbl bd_tbl_view" cellspacing="0">
							<caption></caption>
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 23%;">
								<col style="width: 12%;">
								<col style="width: 21%;">
								<col style="width: 10%;">
								<col style="width: 23%;">
							</colgroup>
							<tbody>
								<tr>
									<th>코드분류</th>
										<td>
											<input type="text" id="gb_cd" name="gb_cd" class="wd_100">
										</td>
									<th>코드분류명</th>
										<td><input type="text" id="gb_nm" name="gb_nm" class="wd_100"></td>
									<th>사용여부</th>
										<td>
											<select name="use_yn" id="use_yn" class="wd_100">
												<option value="">없음</option>
												<option value="Y">사용</option>
												<option value="N">사용하지 않음</option>
											</select>
										</td>
								</tr>
								<tr>
									<th>정의1</th>
										<td><input type="text" id="user_def1" name="user_def1" class="wd_100"></td>
									<th>정의2</th>
										<td><input type="text" id="user_def2" name="user_def2" class="wd_100"></td>
									<th>내용</th>
										<td><input type="text" id="etc_cont" name="etc_cont" class="wd_100"></td>
								</tr>
							</tbody>
						</table> 
						</form>


					<!-- //컨텐츠 영역 e -->