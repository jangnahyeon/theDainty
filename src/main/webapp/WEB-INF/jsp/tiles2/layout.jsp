<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="제주특별자치도 D.Link" />
	<meta name="description" content="제주특별자치도, D.Link">
	<title>D.Link</title>
	
	<script type="text/javascript" src="/DLink/HTML_2023/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery-ui.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery-tjgallery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/common.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/main.js"></script>
	<link rel="stylesheet" type="text/css" href="/DLink/HTML_2023/css/style.css">
	<link rel="SHORTCUT ICON" href="/DLink/HTML_2023/images/common/favicon.ico">
</head>
<body>
	<ul class="blind">
		<li><a href=".contents">본문 바로가기(Skip Contents)</a></li>
	</ul>
	
	<!-- wrap s -->
	<div id="wrap" class="wrap">
		<tiles:insertAttribute name="header" />
		<!-- container_wrap -->
		<div id="container">
			<tiles:insertAttribute name="title" />
			<tiles:insertAttribute name="subTabmenu" />
			<tiles:insertAttribute name="content" />
		</div>
		<!-- //container_wrap --> 
		<tiles:insertAttribute name="footer" />
		
	<!-- top button -->
	<a href="#" class="topBtn" title="상단 헤더 메뉴로 이동">
		<span>상단이동</span>
		<svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
			<path d="m4 12 1.41 1.41L11 7.83V20h2V7.83l5.58 5.59L20 12l-8-8-8 8z"></path>
		</svg>
	</a>
	</div>
	
	<!-- wrap e -->
</body>
</html>