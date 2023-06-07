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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="D.link 관라자시스템" />
<meta name="description" content="D.link, 관리자시스템">
<title>D.link 관리자시스템</title>

<link rel="stylesheet" type="text/css" href="/DLink/HTML/css/admin/style.css">

<script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-ui.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script>
<script type="text/javascript" src="/DLink/HTML/js/common.js"></script>
<link rel="SHORTCUT ICON" href="/DLink/HTML/images/common/favicon.ico">
</head>
<body>

<!-- wrap s -->
<div id="login_wrap" class="wrap">
	<!-- logon_area -->
	<div id="login_box">
		<h1 class="logo"><span class="only">D.link 관라자시스템</span></h1>
		<form name="Frm" method="post" action="/admin/loginSel.do" >
		<div class="login_form">
			<div class="login_body">
				<fieldset>
					<legend>로그인</legend>
					<p><label for="user_id" class="focus_tit id">아이디</label><input type="text" name="user_id" id="user_id"></p>
					<p><label for="user_pw" class="focus_tit pw">비밀번호</label><input type="password" name="user_pw" id="user_pw"></p>
					<span><input type="submit" value="로그인" class="login_btn"></span>
				</fieldset>
			</div>
		</div>
		</form>
		
		<div class="login_footer">
			<p>Copyright ⓒ <strong>D.link.</strong> All rights reserved.</p>
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>