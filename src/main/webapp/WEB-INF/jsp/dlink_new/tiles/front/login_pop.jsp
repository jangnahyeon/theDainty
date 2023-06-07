<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

	<!-- 로그인 모달팝업 -->
	<div class="pop_modal login_view">
		<div class="login_view"> 
			<div id="login_box">
				<h1 class="logo"><span class="only">DLink</span></h1>
				<form name="Frm" method="post" action="javascript:fn_login_act();" onsubmit="">
				<div class="login_form">
					<div class="login_body">
						<div>
							<fieldset>
								<legend>로그인</legend>
								<p><label for="user_id" class="focus_tit">아이디</label><input type="text" id="user_id" maxlength="50"></p>
								<p><label for="user_pw" class="focus_tit">비밀번호</label><input type="password" id="user_pw" maxlength="50"></p>
								<span><input type="submit" value="로그인"></span>
							</fieldset>
							<ul class="login_member">
								<li><a href="/front/join/joinMember1.do">회원가입</a></li>
								<li><a href="/front/mem/findId.do">아이디/비밀번호찾기</a></li>
							</ul>
						</div>
					</div>
				</div>
				</form>
			</div>
			
		</div>
		<a href="#" class="pop_close">팝업 닫기</a>
	</div>
	
	<!-- <div class="pop_modal_bg"></div> -->
	<!-- //로그인 모달팝업 -->