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
				
				<h3>JDS 소개</h3>
				<p class="">
					제주 디자인 스튜디오(Jeju Design Studio)는 제주도 내 중소기업 및 소상공인을 대상으로 높은 품질 대비 낮은 비용의 제품 촬영 서비스를 제공함으로써, <br>
					촬영 비용 부담을 절감하고 제품 경쟁력을 강화하는 데 도움을 드리고자 합니다.
				</p>
				<section class="center_cont">
					<ol>
						<li>
							<b class="num">01</b>
							<div class="img_box"><img src="../images/contents/center_ico01.png" alt=""></div>
							<p>
								제품 촬영 기획
							</p>
						</li>
						<li>
							<b class="num">02</b>
							<div class="img_box"><img src="../images/contents/center_ico02.png" alt=""></div>
							<p>
								제품 스타일링
							</p>
						</li>
						<li>
							<b class="num">03</b>
							<div class="img_box"><img src="../images/contents/center_ico03.png" alt=""></div>
							<p>
								제품 촬영
							</p>
						</li>
						<li>
							<b class="num">04</b>
							<div class="img_box"><img src="../images/contents/center_ico04.png" alt=""></div>
							<p>
								사진 편집
							</p>
						</li>
						<li>
							<b class="num">05</b>
							<div class="img_box"><img src="../images/contents/center_ico05.png" alt=""></div>
							<p>
								결과물 제공
							</p>
						</li>
					</ol>
					<p class="quo_text mt50"><em>제품 전문 촬영 인력이 콘텐츠 기획부터<br> 스타일링까지 지원합니다.</em></p>
					<div class="center_img">
						<img src="../images/contents/center_img01.png" alt="">
						<img src="../images/contents/center_img02.png" alt="">
					</div>
				</section>
				<h3>시설소개</h3>
				<section id="" class="center_room">
					<div class="room_box">
						<img src="../images/contents/center_room_map.png" alt="" usemap="#imgmap20231415748" id="room_map01">
						<map id="imgmap20231415748" name="imgmap20231415748">
							<area shape="circle" alt="A" title="" coords="437,140,13" href=".center_room01" onclick="showLayer(this,'.pop_modal');return false;" target="" />
							<area shape="circle" alt="B" title="" coords="225,14,12" href=".center_room02" onclick="showLayer(this,'.pop_modal');return false;" target="" />
							<area shape="circle" alt="C" title="" coords="220,333,12" href=".center_room03" onclick="showLayer(this,'.pop_modal');return false;" target="" />
							<area shape="circle" alt="D" title="" coords="13,184,11" href=".center_room04" onclick="showLayer(this,'.pop_modal');return false;" target="" />
						</map>
						<div>
							<ul>
								<li><a href=".center_room01" onclick="showLayer(this,'.pop_modal');return false;" ><b>A</b> 화이트&크로마키 스튜디오</a></li>
								<li><a href=".center_room02" onclick="showLayer(this,'.pop_modal');return false;" ><b>B</b> 연출 스튜디오(키친&리빙룸)</a></li>
								<li><a href=".center_room03" onclick="showLayer(this,'.pop_modal');return false;" ><b>C</b>회의실</a></li>
								<li><a href=".center_room04" onclick="showLayer(this,'.pop_modal');return false;" ><b>D</b>라운지</a></li>
							</ul>
							<p>※ 각 구역 클릭 시 상세정보를 확인할 수 있습니다. </p>
						</div>
					</div>
				</section>
				<h3>찾아오시는 길</h3>
				<div class="location_box">
					<ul class="info_li">
						<li>
							<b>ADDRESS</b>
							<p>제주특별자치도 제주시 연삼로 473, 제주특별자치도 경제통상진흥원 2층 제주 디자인 스튜디오</p>
						</li>
						<li>
							<b>TEL</b>
							<p>064-805-3399</p>
						</li>
						<li>
							<b>FAX</b>
							<p>064-751-3339</p>
						</li>
					</ul>
					<div id="" class="map_area">
					</div>
				</div>
				
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		<!-- 시설소개 모달팝업 -->
		<div class="pop_modal center_room01">
			<div class="center_room">
				<h4 class="title">JDS 스튜디오 </h4>
				<div class="pop_inner">
					<div class="content_box">
						<div class="txt_box">
							<div class="tit_box">
								<b>A</b>
								<strong>화이트&크로마키 스튜디오</strong>
							</div>
							<ul class="list_type01">
								<li>용도 및 형태 : 제품 누끼컷 촬영</li>
								<li>주요장비 : 
									<ul class="list_type02 ml10">
										<li>[카메라] Sony A1 ILCE-1</li>
										<li>[렌즈] Sony FE 23-70mm F2.8 GM</li>
										<li>[렌즈] Sony FE 90mm Macro G OSS</li>
										<li>[조명] Hensel Expert D 500</li>
										<li>[조명] Hensel Softbox</li>
									</ul>
								</li>
							</ul>							
						</div>
						<div class="img_box">
							<img src="../images/contents/center_room_map_a.png" alt="">
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="pop_close">팝업 닫기</a>
		</div>
		<div class="pop_modal center_room02">
			<div class="center_room">
				<h4 class="title">JDS 스튜디오 </h4>
				<div class="pop_inner">
					<div class="content_box">
						<div class="txt_box">
							<div class="tit_box">
								<b>B</b>
								<strong>연출 스튜디오(키친&리빙룸)</strong>
							</div>
							<ul class="list_type01">
								<li>용도 및 형태 : 제품 연출컷 촬영</li>
								<li>주요장비 : 
									<ul class="list_type02 ml10">
										<li>[카메라] Sony 7S-3 ILCE-7SM3</li>
										<li>[렌즈] Sony FE 70-200mm F2.8 GM OSS II</li>
										<li>[조명] Aputure LS 600C PRO 600W RGBWW Bowens Mount Point-Source LED</li>
										<li>[조명] Aputure Spotlight Mount</li>
									</ul>
								</li>
							</ul>								
						</div>
						<div class="img_box">
							<img src="../images/contents/center_room_map_b.png" alt="">
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="pop_close">팝업 닫기</a>
		</div>
		<div class="pop_modal center_room03">
			<div class="center_room">
				<h4 class="title">JDS 스튜디오 </h4>
				<div class="pop_inner">
					<div class="content_box">
						<div class="txt_box">
							<div class="tit_box">
								<b>C</b>
								<strong>회의실 S</strong>
							</div>
							<ul class="list_type01">
								<li>용도 및 형태 : 제품 촬영 상담</li>
								<li>주요장비 : 
									<ul class="list_type02 ml10">
										<li>[모니터] Wasabi Mango QGM652 QLED  Waglewagle+ 65inch</li>
										<li>[노트북] Gram 14 14ZD90P-GX30K</li>
										<li>[카메라] Logitech PTZ Pro 2 Web Cam FHD</li>
									</ul>
								</li>
							</ul>								
						</div>
						<div class="img_box">
							<img src="../images/contents/center_room_map_c.png" alt="">
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="pop_close">팝업 닫기</a>
		</div>
		<div class="pop_modal center_room04">
			<div class="center_room">
				<h4 class="title">JDS 스튜디오 </h4>
				<div class="pop_inner">
					<div class="content_box">
						<div class="txt_box">
							<div class="tit_box">
								<b>D</b>
								<strong>라운지</strong>
							</div>
							<ul class="list_type01">
								<li>용도 및 형태 : 비즈니스 및 미팅</li>
								<li>주요장비 : 
									<ul class="list_type02 ml10">
										<li>[PC] Samsung All-in-one PC DM530ADA-L58A</li>
									</ul>
								</li>
							</ul>								
						</div>
						<div class="img_box">
							<img src="../images/contents/center_room_map_d.png" alt="">
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="pop_close">팝업 닫기</a>
		</div>
		<!-- //시설소개 모달팝업 -->
		<div class="pop_modal_bg"></div>