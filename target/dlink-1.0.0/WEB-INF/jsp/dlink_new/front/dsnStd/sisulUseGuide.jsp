<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : sisulInt. jsp
  * @Description : sisulInt 화면
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
				
				<h3>이용방법</h3>
				<section class="info_step step4">
					<ol>
						<li>
							<div class="h_box"><img src="/DLink/HTML_2023/images/contents/studio_info_ico01.png" alt=""></div>
							<strong>가예약신청</strong>
							<p>
								시설 예약 스케줄표 참고
							</p>
						</li>
						<li>
							<div class="h_box"><img src="/DLink/HTML_2023/images/contents/studio_info_ico02.png" alt=""></div>
							<strong>상담 후 예약 확정</strong>
							<p>
								담당자가 연락 예정
							</p>
						</li>
						<li>
							<div class="h_box"><img src="/DLink/HTML_2023/images/contents/studio_info_ico03.png" alt=""></div>
							<strong>이용 요금 결제</strong>
							<p>
								결제정보 문자 및 메일 발송
							</p>
						</li>
						<li>
							<div class="h_box"><img src="/DLink/HTML_2023/images/contents/studio_info_ico04.png" alt=""></div>
							<strong>스튜디오 이용</strong>
							<p>
								하단 이용안내 확인
							</p>
						</li>
					</ol>
				</section>
				<h3>결제안내</h3>
				<section id="" class="info_approval">
					<table class="tbl_basic center">
						<caption class="skip_tag">스듀티오 결제안내</caption>
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">사용 요금</th>
								<th scope="col">결제 수단</th>
								<th scope="col">결제 방법</th>
								<th scope="col" class="no_border">비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<b class="dis_block">기본 3시간</b>
									<strong class="dis_block f_size25 cl_blue">55,000원</strong>
									<span class="cl_gray">(부가세 포함)</span>
								</td>
								<td>현금</td>
								<td>무통장 입금</td>
								<td rowspan="2" class="no_border">전자세금계산서 청구 발급</td>
							</tr>
						</tbody>
					</table>
				</section>
				<h3>이용시간 안내</h3>
				<section class="cont_box">
					<p class="mb40">스튜디오 이용시간은 <b>장비 세팅 및 연출 준비, 촬영 후 최종본을 선택하는 시간을 모두 포함한 시간</b>입니다.</p>
					<div class="time_cont mb40">
						<ol>
							<li>
								<strong>촬영 준비</strong>
								<p>
									약 20분
								</p>
							</li>
							<li>
								<strong>촬영</strong>
								<p>
									약 2시간 30분
								</p>
							</li>
							<li>
								<strong>촬영본 확인</strong>
								<p>
									약 10분
								</p>
							</li>
						</ol>
					</div>
					<div class="">
						<ul class="list_type01">
							<li>3시간을 기준으로 하여 평균 촬영 가능한 컷수는 연출컷 약 2컷, 누끼컷 약 3컷입니다.</li>
							<li>제품의 크기, 소재 등 다양한 요인에 따라 촬영 시간이 상이할 수 있습니다.</li>
							<li>기타 자세한 사항은 홈페이지 내 스튜디오 이용 유의사항을 필히 확인 후 신청하시기 바라며, 유의사항을 준수하지 않음으로 발생하는 문제에 대해 스튜디오에서는 책임지지 않습니다.</li>
						</ul>
					</div>
				</section>
				<h3>이용 유의사항</h3>
				<section class="info_cont mb30">
					<p class="tit">1) 스튜디오 신청 유의사항</p>
					<div class="cont_box">
						<ul class="list_type01">
							<li>운영 시간 : 월~금 / 09:00~18:00 (공휴일 제외)</li>
							<li>지원 대상 : 제주도내 중소기업 및 소상공인</li>
							<li>사용 시간 : 기본 3시간</li>
							<li>사용 기준 : 월 2개 제품 이내 / 1개 업체당</li>
							<li>제품 촬영 상담 시 예약일이 변동될 수 있습니다.</li>
							<li>이용 요금은 무통장 입금으로 결제하실 수 있습니다.</li>
							<li>세금계산서는 신청 기업으로 처리되며, 별도 요청이 없는 경우 입금일 기준으로 발행됩니다.</li>
							<li>이용신청서 작성 후 신청 내용 변경 또는 추가하는 경우 추가금액이 발생할 수 있습니다.</li>
							<li>결과물의 품질에 대해서 스튜디오에서는 책임지지 않습니다.</li>
							<li>상호 협의되지 않은 가예약 신청은 취소될 수 있습니다.</li>
							<li>예약 후 부득이한 상황으로 취소를 원하시는 경우, 촬영예정일 기준 최소 3일 전에 전화로 취소 바랍니다.</li>
							<li>일방적인 예약 취소, 변경 시 스튜디오 이용이 1개월간 제한될 수 있습니다.</li>
						</ul>
					</div>
					<p class="tit">2) 촬영 유의사항</p>
					<div class="cont_box">
						<ul class="list_type01">
							<li>본 시설 내에서는 장애인 안내견 외의 반려동물(촬영용 포함) 출입이 제한되어 있습니다.</li>
							<li>촬영품은 최대한 깨끗한 상태로 준비하셔야 좋은 결과물을 얻으실 수 있습니다.</li>
							<li>스튜디오 내 음식물 섭취는 금지됩니다.</li>
							<li>사전에 협의되지 않은 촬영은 제한됩니다.</li>
							<li>귀중품 분실 시, 스튜디오 측의 책임이 없습니다. 퇴실 시 분실물이 없는지 확인 부탁드립니다.</li>
							<li>시설물 및 소품 파손, 분실 등의 피해가 있는 경우 보상해야 합니다.</li>
							<li>스튜디오 촬영 도중 발생한 사고와 관련하여 본 시설 운영자의 고의 또는 중과실이 있는 경우를 제외하고는 
							 어떠한 인적, 물적 손해에 대한 배상 책임을 지지 않습니다.</li>
							<li>쓰레기는 쓰레기통에 버리시고 음식물은 필히 수거 부탁드립니다.</li>
							<li>스튜디오 내 조리실을 제외한 공간에서의 인화성 소품과 화기류 장비 사용을 금합니다.</li>
						</ul>
					</div>
					<p class="tit">3) 촬영 결과물 유의사항</p>
					<div class="cont_box">
						<ul class="list_type01">
							<li>촬영 결과물은 jpg, png 파일 제공을 기본으로 하며, 촬영일 기준 2주 이내 메일을 통해 제공됩니다.</li>
							<li>사용자의 데이터는 제공일 기준 7일간 보관 후 순차적으로 폐기됩니다.</li>
							<li>결과물의 저작권은 제주 디자인 스튜디오와 공동으로 소유합니다.</li>
							<li>본 스튜디오에서 촬영한 사진, 영상 등의 콘텐츠는 제주 디자인 스튜디오의 홍보에 사용될 수 있습니다.</li>
						</ul>
					</div>
				</section>
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->