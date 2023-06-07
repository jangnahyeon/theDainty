<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="D.link 관리자시스템" />
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
<div class="skiptoContent">
	<a href="#contents">본문내용 바로가기</a>
</div>
<!-- wrap s -->
<div id="wrap" class="wrap">
	<tiles:insertAttribute name="adminHeader" />	

	<!-- container_wrap -->
	<div id="container_wrap">

		<!-- contents_layout s -->
		<div id="contents_layout" class="contents_layout">
			<tiles:insertAttribute name="adminLeft" />
			

			<!-- conRight s -->
			<div class="conRight" id="contents">
				<tiles:insertAttribute name="adminInnerTitle" />
				<div class="contents">
				<tiles:insertAttribute name="content" />
				</div>

			</div>
			<!--// conRight e --> 

			<div class="clear"></div>
		</div>
		<!--// contents_layout e -->
	</div>
	<!-- //container_wrap --> 
	<tiles:insertAttribute name="adminFooter" />
</div>
<!-- wrap e -->
</body>
</html>