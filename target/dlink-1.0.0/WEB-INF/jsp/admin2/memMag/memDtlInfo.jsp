<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : memDtlInfo.jsp
  * @Description : memDtlInfo 화면
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
					<table class="bd_tbl bd_tbl_view">
						<caption>회원정보 </caption>
						<colgroup>
							<col width="15%">
							<col width="auto;">
							<col width="15%">
							<col width="auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="memId">아이디<span class="tbl_star">*</span></label></th>
								<td class="left">										
									<input type="text" size="" class="txt w40" name="" value="" maxlength="50" id="memId">											
									<button type="button" class="btn_st st_bg_blue small" onclick="">비밀번호초기화</button>	
								</td>
								<th scope="row"><label for="userpw">이름<span class="tbl_star">*</span></label></th>
								<td class="left">
									<input type="text" size="" class="txt w40" name="" value="" maxlength="50" id="userpw">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="user">성별 구분코드</label></th>
								<td>
									<ul class="chk_area">
										<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">남자</label></li>
										<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">여자</label></li>
									</ul>
								</td>
								<th scope="row"><label for="user">생년월일</label></th>
								<td class="left">
									<input type="text" size="" class="txt w40" name="" value="" maxlength="50" id="user">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userphone">휴대전화<span class="tbl_star">*</span></label></th>
								<td class="left">
									<input type="text" size="" class="txt" name="" value="" maxlength="50" id="user">
								</td>
								<th scope="row"><label for="user">문자허용여부</label></th>
								<td>
									<ul class="chk_area">
										<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">남자</label></li>
										<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">여자</label></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="usermail">이메일<span class="tbl_star">*</span></label></th>
								<td class="left">
									<input type="text" size="" class="txt" name="" value="" maxlength="50" id="user">
								</td>
								<th scope="row"><label for="user">메일링허용여부</label></th>
								<td>
									<ul class="chk_area">
										<li><input type="radio" name="kind" value="0001" id="kind1"> <label for="kind1">남자</label></li>
										<li><input type="radio" name="kind" value="0002" id="kind2"> <label for="kind2">여자</label></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="useradd">주소</label></th>
								<td class="left" colspan="3">
									<div class="group_addr">
										<div class="zipcode_txt">
											<input type="text" size="" class="txt fxw" name="" id="" value="" readonly="readonly">
											<button type="button" class="btn_st st_bg_blue small" onclick="">우편번호찾기</button>
										</div>
										<div class="addr_txt">
											<input type="text" size="" class="txt" name="" id="" value="대전 서구 " maxlength="100" readonly="readonly">
											<input type="text" size="" class="txt" name="" id="" value="111동 111호" maxlength="100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="data_file">파일첨부</label></th>
								<td class="left" colspan="3">
									<div class="area_filebox">
										<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
										<label for="data_file">파일찾기</label>
										<input type="file" id="data_file" class="upload_hidden">
									</div>
									<span class="infotext">관련 참고자료 첨부</span>
								</td>
							</tr>
						</tbody>
					</table>
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black">저장</a>
							<a href="#" class="btn_black line_gray">취소</a>
							<a href="#" class="btn_black line_orange">삭제</a>
						</div>


					<!-- //컨텐츠 영역 e -->