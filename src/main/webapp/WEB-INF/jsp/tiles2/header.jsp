<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
	<!-- header -->
	<div id="header" class="">
		<div class="head">
			
			<h1><a href="/">디자인을 잇다. 디링크</a></h1>
			<ul class="pc_nav">
				<li class="on"><a href="/">디링크</a>
					<div class="sub">
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인 스튜디오</a>
					<div class="sub">
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인뱅크</a>
					<div class="sub">
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>
					</div>
				</li>
			</ul>	
			<div class="btns">
				<a class="header_btn" href="/">로그인</a>
				<a class="header_btn" href="/">회원가입</a>
				<div class="btn_menu">
					<div></div>
					<div></div>
					<div></div> 
				</div>
			</div>

		</div>
		<div class="sub_bg"></div>
		<div class="all_menu">
			<div class="menuwrap">
				<ul>
					<li class="dep1"><a>디링크</a>
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</li>
					<li class="dep1"><a>디자인 스튜디오</a>
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>		
					</li>
					<li class="dep1"><a>디자인뱅크</a>
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>		
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //header --> 