<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>

	<!-- header -->
	<header id="header_wrap">
		<div id="header"> 
			<!-- logo  -->
			<h1 class="logo"><a href="#index">D.Link관리자시스템</a></h1>
			<!-- //logo --> 

			<!-- global -->
			<div id="global_wrap">
				<ul id="util">
					<li><a href="#index"><strong class="user">123.111.149.171 관리자님</strong></a></li>
					<li class="logout" title="로그아웃"><a href="#util">로그아웃</a></li>
					<li class="mypage" title="마이페이지"><a href="/">마이페이지</a></li>
				</ul>
			</div>
			<!-- //global -->
			<!-- gnb -->
			<nav class="gnb" id="gnb">
				<ul>
					<li><a href="#gnb">기준정보관리</a></li>
					<li><a href="#gnb">회원관리</a></li>
					<li class="active"><a href="#gnb">게시판관리</a></li>
					<li><a href="#gnb">디자인뱅크</a></li>
					<li><a href="#gnb">시설예약관리</a></li>
				</ul>
			</nav>
			<!-- //gnb -->
			
		</div>
	</header>
	<div class="modal_header_wrap"></div>
	<!-- //header --> 