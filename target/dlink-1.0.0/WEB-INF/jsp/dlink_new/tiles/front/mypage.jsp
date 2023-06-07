<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<script>
$(function(){
	var url = window.location.pathname;
	
	if(url == "/front/mypage/pkDsnList.do" || url == "/front/mypage/imgDsnList.do" || url == "/front/mypage/vidDsnList.do") {
		 $( '#like' ).attr( 'class', 'on' );
	} 
	
	if( url == "/front/mypage/sisulRsvList.do" || url == "/front/mypage/sisulRsvView.do" ) {
		$( '#sisul' ).attr( 'class', 'on' );
	}
	
	if( url == "/front/mypage/memView.do" || url == "/front/mypage/memOut.do" ) {
		$( '#info' ).attr( 'class', 'on' );
	}
});
</script>
		<!-- 메뉴 탭 -->
		<div class="sub_tabmenu">
			<div class="innerwrap">		
				<ul class="tab_style grid3">
					<li id="like"><a href="/front/mypage/pkDsnList.do">찜한 목록</a></li>
					<c:if test="${frontLoginVO.code eq '0003' }">
						<li class="" id="sisul"><a href="/front/mypage/sisulRsvList.do">시설예약 관리</a></li>
					</c:if>
					<li class="" id="info"><a href="/front/mypage/memView.do">정보관리</a></li>
				</ul>
			</div>
		</div>
		<!-- //메뉴 탭 -->