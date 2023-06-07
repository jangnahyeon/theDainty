<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcDtl.jsp
  * @Description : ntcDtl 화면
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
				        	<caption>게시판 상세보기</caption>
				        	<colgroup>
				        		<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
								
				        	</colgroup>
				        	<tbody>
								<tr>
									<th scope="row"><label for="org_nm">업체명</label> <span class="tbl_star">*</span></th>
									<td colspan="3">디자인메이트(주)</td>
								</tr>
								<tr>
									<th scope="row"><label for="address">주소</label></th>
									<td colspan="3"> 서울특별시 중구 수표로 3-6 통로빌딩<br> 30129 </td> 									
								</tr>
								<tr>
									<th scope="row"><label for="org_cd">사업자번호</label> <span class="tbl_star">*</span></th>
									<td>292-92-00172</td>
									<th colspan="2"></th>
								</tr>
								<tr>
									<th scope="row"><label for="phone">전화번호</label></th>
									<td>044-270-5005</td>
									<th scope="row"><label for="fax">FAX</label></th>
									<td>044-270-5005</td>
								</tr>
							</tbody>
						</table>
						
						<h4 class="tit">신청내역</h4>
						
						<table class="bd_tbl bd_tbl_view" summary="신청내역" id="tbl_pro">
							<caption>신청내역</caption>
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th><label for="con_cd"></label>업체계약명</th>
									<td>공기청정기 제품 디자인 </td>
								</tr>
								<tr>
									<th scope="row"><label for="app_nm">신청명</label></th>
									<td> 공기청정기 제품 디자인</td>
								</tr>
								<tr>
									<th scope="row"><label for="cont">신청내용</label></th>
									<td> 
										공기청정기 제품 디자인
=========================================
이 부분에 대해서 데이터 이전시에 참조해야할 테이블이 어떤부분인지 
MEMBER_ID/INFOMEM/PAYCONENTS 이외에 어떤 테이블이 있는지 확인 부탁드립니다.
									
									
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="cont">파일내용</label></th>
									<td colspan="3">* 파일 다운로드만 가능합니다.</td>
								</tr>
							</tbody>
						</table>

						
						
						<div class="bd_btn_area center">
							<a href="#" class="btn_black btn_list">목록</a>
							<a href="#" class="btn_black line_gray">취소</a>
						</div>

					<!-- //컨텐츠 영역 e -->