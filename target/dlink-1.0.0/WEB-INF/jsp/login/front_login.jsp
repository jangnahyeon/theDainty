<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="제주특별자치도 D.Link" />
	<meta name="description" content="제주특별자치도, D.Link">
	<title>D.Link</title>

	<link rel="stylesheet" type="text/css" href="/DLink/HTML/css/style.css">

	<script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-ui.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/common.js"></script>
	<link rel="SHORTCUT ICON" href="/DLink/HTML/images/common/favicon.ico">

</head>
<body id="">

<div class="skiptoContent">
	<a href="#container_wrap">본문내용 바로가기</a>
</div>
<!-- wrap s -->
<div id="wrap" class="login_wrap">
	<!-- logon_area -->
	<div id="login_box">
		<a href="/front/main.do"><h1 class="logo" ><span class="only">DLink</span></h1></a>
		<form name="Frm" method="post" action="/front/loginSel.do">
		<div class="login_form">
			<div class="login_body">
				<div>
					<fieldset>
						<legend>로그인</legend>
						<p><label for="user_id" class="focus_tit">아이디</label><input type="text" id="user_id" name="user_id"></p>
						<p><label for="user_pw" class="focus_tit">비밀번호</label><input type="password" id="user_pw" name="user_pw"></p>
						<span><input type="submit" value="로그인"></span>
					</fieldset>
					<ul class="login_member">
						<li><a href="/front/memberJoin/mtypeSelect.do">회원가입</a></li>
						<li><a href="/front/login/fdmInfo.do">아이디/비밀번호찾기</a></li>
					</ul>
				</div>
			</div>
		</div>
		</form>
		<div class="login_footer">
			<p>Copyright ⓒ <strong>DLink.</strong> All rights reserved.</p>
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>