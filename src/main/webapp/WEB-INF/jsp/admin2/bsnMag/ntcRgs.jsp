<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcRgs.jsp
  * @Description : ntcRgs 화면
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
				        	<caption>기관등록</caption>
				        	<colgroup>
				        		<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
								
				        	</colgroup>
				        	<tbody>
								<tr>
									<th scope="row"><label for="org_nm">업체명</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="title" class="" value="" maxlength="50" id="org_nm">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="sel">분류</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<select id="sel" name="">
											<option value="">선택</option>
											<option value="00">TOP5</option>
											<option value="01">회원서비스</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="address">주소</label></th>
									<td colspan="3">
										<div class="group_addr">
											<div class="zipcode_txt">
												<input type="text" size="" class="txt fxw" name="" id="" value="" readonly="readonly" id="address">
												<button type="button" class="btn_st mini" onclick="">우편번호찾기</button>
											</div>
											<div class="addr_txt">
												<input type="text" size="" class="txt" name="" id="" value="대전 서구 " maxlength="100" readonly="readonly">
												<input type="text" size="" class="txt" name="" id="" value="111동 111호" maxlength="100">
											</div>
										</div>
									</td> 									
								</tr>
								<tr>
									<th scope="row"><label for="org_cd">사업자번호</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<div class="group_tel">
											<input type="text" size="3" class="txt" name="ordMobile1" value="" maxlength="3" id="org_cd">
											<span>-</span>
											<input type="text" size="2" class="txt" name="ordMobile2" value="" maxlength="4">
											<span>-</span>
											<input type="text" size="5" class="txt" name="ordMobile3" value="" maxlength="5">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">전화번호</label></th>
									<td>
										<div class="group_tel">
											<input type="text" size="3" class="txt" name="ordMobile1" value="010" maxlength="3" id="phone">
											<span>-</span>
											<input type="text" size="2" class="txt" name="ordMobile2" value="" maxlength="4">
											<span>-</span>
											<input type="text" size="5" class="txt" name="ordMobile3" value="" maxlength="4">
										</div>
									</td>
									<th scope="row"><label for="fax">FAX</label></th>
									<td>
										<div class="group_tel">
											<input type="text" size="3" class="txt" name="ordMobile1" value="010" maxlength="3" id="fax">
											<span>-</span>
											<input type="text" size="2" class="txt" name="ordMobile2" value="" maxlength="4">
											<span>-</span>
											<input type="text" size="5" class="txt" name="ordMobile3" value="" maxlength="4">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<h4 class="tit">소제목</h4>
						
						<table class="bd_tbl bd_tbl_view">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="con_cd1">업체계약명</label> <span class="tbl_star">*</span></th>
									<td colspan="3">
										<input type="text" name="title" class="" value="" maxlength="50" id="con_cd1">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">신청명</label></th>
									<td><input type="text" name="title" class="" value="" maxlength="50" id="app_nm"></td>
								</tr>
								<tr>
									<th scope="row"><label for="cont">신청내용</label></th>
									<td> 
										<div>
											<textarea name="content" style="width:100%; height: 250px;" id="cont"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ex_filename">파일내용</label></th>
									<td colspan="3">
										<div class="area_filebox">
											<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
											<label for="ex_filename">파일찾기</label>
											<input type="file" id="ex_filename" class="upload_hidden">
										</div>
										<p class="cl_blue">※ 파일용량  100mb 이하</p>
									</td>
								</tr>
							</tbody>
						</table>

						
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black">등록</a>
							<a href="#" class="btn_black line_gray">취소</a>
						</div>

					<!-- //컨텐츠 영역 e -->