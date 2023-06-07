<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="D.link 관라자시스템" />
<meta name="description" content="D.link, 관리자시스템">
<title>D.link 관라자시스템</title>

<link rel="stylesheet" type="text/css" href="/DLink/admin2_html/css/style.css">
<script type="text/javascript" src="/DLink/admin2_html/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/DLink/admin2_html/js/common.js"></script>
</head>
<body>

<!-- wrap s -->
<div id="login_wrap" class="wrap">
	
	<!-- logon_area -->
	<div id="login_box">
		<h1 class="logo"><span class="only">D.link 관라자시스템</span></h1>
		<form name="Frm" method="post" action="" onSubmit="">
		<div class="login_form">
			<div class="login_body">
				<fieldset>
					<legend>로그인</legend>
					<p><label for="user_id" class="focus_tit id">아이디</label><input type="text" id="user_id"></p>
					<p><label for="user_pw" class="focus_tit pw">비밀번호</label><input type="password" id="user_pw"></p>
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