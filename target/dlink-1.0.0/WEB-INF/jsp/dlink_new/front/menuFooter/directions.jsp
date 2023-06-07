<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				
				<h3>오시는 길</h3>
				<section class="center_cont">
					<div class="center_img">
						<img src="../images/contents/center_img01.png" alt="">
						<img src="../images/contents/center_img02.png" alt="">
					</div>
				</section>
				<div class="location_box mt50">
					<ul class="info_li">
						<li>
							<b>ADDRESS</b>
							<p>제주특별자치도 제주시 연삼로 473, 제주특별자치도 경제통상진흥원 2층 제주 디자인 스튜디오</p>
						</li>
						<li>
							<b>TEL</b>
							<p>064-805-3358</p>
						</li>
						<li>
							<b>FAX</b>
							<p>064-805-3313</p>
						</li>
					</ul>
					<div id="" class="map_area">
						<!-- <div id="map" style="width:500px;height:400px;"></div> -->
						<div id="map" style="width:100%;height:100%;"></div>

					</div>
				</div>
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script> -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8345be4339e7b12b1018a12bfea38966"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.49954181573858, 126.54029084155712), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.49954181573858, 126.54029084155712); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		
		var iwContent = '<div style="padding:5px;">제주 디자인 스튜디오 <br><a href="https://map.kakao.com/link/map/제주틀별자치도 제주시 연삼로473,33.49954181573858, 126.54029084155712" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/제주틀별자치도 제주시 연삼로473,33.49954181573858, 126.54029084155712" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
			
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 	
		</script>