<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="제주특별자치도 D.Link" />
	<meta name="description" content="제주특별자치도, D.Link">
	<title>D.Link</title>

	<script type="text/javascript" src="/DLink/HTML_2023/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery-3.6.0.min"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/common.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.min.js"></script>

	<link rel="stylesheet" type="text/css" href="/DLink/HTML_2023/css/style.css">

	<%@ include file="/WEB-INF/jsp/dlink_new/tiles/front/script.jsp" %>

</head>
<body>

<div class="skiptoContent">
	<a href="#container_wrap">본문내용 바로가기</a>
</div>
<!-- wrap s -->
<div id="wrap" class="login_wrap">
	<!-- logon_area -->
	<div id="login_box">		
		<h1 class="logo"><a href="/front/main.do" title="홈으로 이동"><span class="only">DLink</span></a></h1>
		<form name="Frm" method="post" action="javascript:fn_login_act();" onSubmit="">
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
		<div class="login_footer">
			<p class="copy">Copyright ⓒ 제주특별자치도 경제통상진흥원</p>
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>