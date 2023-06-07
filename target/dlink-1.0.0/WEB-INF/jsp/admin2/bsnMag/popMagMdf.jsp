<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : popMagMdf.jsp
  * @Description : popMagMdf 화면
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
					<p class="mb10 right"><strong class="cl_red">*</strong> 표시는 필수 입력사항입니다.</p>
					<table class="bd_tbl bd_tbl_view">
						<caption>팝업 등록 수정 폼</caption>
						<colgroup><col width="130"><col width="*"></colgroup>
						<tbody><tr>
							<th>제목</th>
							<td>
								<input type="text" name="title" class="" value="홈페이지 리뉴얼 안내" maxlength="50">
							</td>
						</tr>
						<tr>
							<th><label for="collection_data01">팝업기간설정</label></th>
							<td>
								<div style="vertical-align:middle">
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
							<th>팝업종류</th>
							<td>	
								<ul class="chk_area">
									<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">윈도우창</label></li>
									<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">고정레이어</label></li>
									<li><input type="radio" name="kind" value="0003" id="kind3"> <label for="kind3">이동레이어</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>내용입력선택</th>
							<td>
								<ul class="chk_area">
									<li><input type="radio" name="isHtml" value="0001" id="isHtml1"> <label for="isHtml1">이미지등록 &amp; 링크걸기</label></li>
									<li><input type="radio" name="isHtml" value="0002" id="isHtml2"> <label for="isHtml2">HTML로 입력</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>이미지등록</th>
							<td id="" class="">
								<div class="area_filebox">
									<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
									<label for="ex_filename">파일찾기</label>
									<input type="file" id="ex_filename" class="upload_hidden">
								</div>
							</td>
						</tr>
						<tr>
							<th>링크 주소</th>
							<td>
								<input type="text" name="linkUrl" value="" class="text_input" maxlength="150">
							</td>
						</tr>

						<tr>
							<th>공지내용</th>
							<td>
								<div>
									<textarea name="content" style="width:100%; height: 250px;" id=""></textarea>
								</div>
							</td>
						</tr>

						<tr>
							<th>팝업 크기</th>
							<td>
								<div>
								폭 : <input type="text" name="width" value="550" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel,
								높이 : <input type="text" name="height" value="630" maxlength="3" style="width:50px" onkeypress="" onkeyup=""> pixel
								</div>
								<p class="cl_blue">※ 높이 설정시 "오늘 이창 띄우지 않음" 부분 높이(20px)를 포함하여 입력해 주세요.</p>
							</td>
						</tr>
						<tr>
							<th>배경색상</th>
							<td>
								<input type="text" id="backColor" name="backColor" value="#FFFFFF" maxlength="7" class="text_input" style="width:70px; background:#FFFFFF">
								<button type="button" onclick="colorpicker.open(event, setColor, 'backColor')">색상선택</button></span>
							</td>
						</tr>
						<tr>
							<th>글자색상</th>
							<td>
								<input type="text" id="foreColor" name="foreColor" value="#999999" maxlength="7" class="text_input" style="width:70px; background:#999999">
								<button type="button" onclick="" class="btn_st mini line_gray">색상선택</button></span>
								&nbsp;<span class="cl_blue">"오늘 이창을 다시 띄우지 않음"의 글자색
							</span></td>
						</tr>
						<tr>
							<th>팝업 위치</th>
							<td>
								<span><select id="baseX" name="baseX" selected="0" style="width:100px"><option value="0">화면</option></select></span> 
								<span>좌측부터 <input type="text" name="x" value="1500" class="text_input" style="width:50px" maxlength="4" onkeypress="" onkeyup="">pixel, </span>
								<span>상단에서 <input type="text" name="y" value="200" class="text_input" style="width:50px" maxlength="4" onkeypress="" onkeyup="">pixel</span>
							</td>
						</tr>
						<tr>
							<th>진행상태</th>
							<td>
								<ul class="chk_area">
									<li><input type="radio" name="isApply" value="0001" id="isApply1"> <label for="isApply1">대기중</label></li>
									<li><input type="radio" name="isApply" value="0002" id="isApply2"> <label for="isApply2">등록후 바로띄움</label></li>
								</ul>
							</td>
						</tr>
						</tbody></table>
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black">등록</a>
							<a href="#" class="btn_black line_gray">취소</a>
						</div>


					<!-- //컨텐츠 영역 e -->