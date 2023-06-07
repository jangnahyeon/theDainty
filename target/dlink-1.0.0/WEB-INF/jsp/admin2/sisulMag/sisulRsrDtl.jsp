<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : sisulRsrDtl.jsp
  * @Description : sisulRsrDtl 화면
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
						<h4 class="mt0 tit area_left">시설예약관리</h4>
						
						<div class="bd_btn_area right">
							<a href="#" class="btn_st small line_blue">대기</a>
							<a href="#" class="btn_st small">승인</a>
							<a href="#" class="btn_st small line_orange">반려</a>
						</div>
					</div>
						<table class="bd_tbl bd_tbl_view"> 
				        	<caption>게시판 상세보기</caption>
				        	<colgroup>
				        		<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
								
				        	</colgroup>
				        	<tbody>
								<tr>
									<th scope="row"><label for="org_nm">업체명</label> </th>
									<td colspan="3">디자인메이트(주)</td>
								</tr>
								<tr>
									<th scope="row"><label for="address">제목</label></th>
									<td colspan="3"> 예) 2022년 11월 23일(수) 오전 10~12시 예약합니다 </td> 									
								</tr>
								<tr>
									<th scope="row"><label for="org_cd">예약일자</label></th>
									<td>2020.11.20</td>
									<th scope="row"><label for="phone">이용시간</label></th>
									<td> 16:00 ~ 19:00</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영품개수</label></th>
									<td>2</td>
									<th scope="row"><label for="fax">촬영제품</label></th>
									<td>감귤박스</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영품크기</label></th>
									<td>2</td>
									<th scope="row"><label for="fax">촬영반사유무</label></th>
									<td>감귤박스</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">촬영목적</label></th>
									<td colspan="3">상세페이지</td>
								</tr>
								<tr>
									<th scope="row"><label for="phone">제품사진 파일첨부</label></th>
									<td colspan="3">
										<ul class="lst_bul02">
											<li>이미지.jpg</li>
											<li>이미지.jpg</li>
											<li>이미지.jpg</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black btn_list">목록</a>
							<a href="#" class="btn_black line_gray">취소</a>
						</div>


					<!-- //컨텐츠 영역 e -->