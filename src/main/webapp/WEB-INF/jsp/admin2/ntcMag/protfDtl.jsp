<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : protfDtl.jsp
  * @Description : protfDtl 화면
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
		
					<table class="bd_tbl bd_tbl_view sortable">
						<caption>포트폴리오 상세정보</caption>
						<colgroup><col width="130"><col width="*"></colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td>
								포트폴리오 제목
							</td>
						</tr>
						<tr>
							<th>전문분야</th>
							<td>서비스</td>
						</tr>
						<tr>
							<th>업체명</th>
							<td>
								디자인이름 <a href="" class="btn_st st_bg_blue small">회사소개</a>
							</td>
						</tr>
						<tr>
							<th>디자인컨셉</th>
							<td>방치되고 노후된 인근 시설물과 공간을 새롭게 재해석, 색채디자인을 적용하여 활기찬 공간으로 개선</td>
						</tr>
						<tr>
							<th>대표이미지</th>
							<td id="" class="">
								<i class="main_img"><img src="../images/ex/port_logo.png" alt=""></i>
							</td>
						</tr>
						<tr>
							<th>기타이미지</th>
							<td>
								<ul>
									<li class="dis_inline_b mr10"><i class="sub_img"><img src="../images/ex/port_logo.png" alt=""></i></li>
									<li class="dis_inline_b"><i class="sub_img"><img src="../images/ex/port_logo.png" alt=""></i></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>동영상</th>
							<td>
								
							</td>
						</tr>
						</tbody>
					</table>
						
					<div class="bd_btn_area center">
						<a href="#" class="btn_black">등록</a>
						<a href="#" class="btn_black line_gray">수정</a>
						<a href="#" class="btn_black line_orange">삭제</a>
					</div>


					<!-- //컨텐츠 영역 e -->