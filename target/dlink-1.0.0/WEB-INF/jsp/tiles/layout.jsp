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
	
	<script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-ui.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/common.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/main.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/DLink/HTML/css/style.css">
	<link rel="SHORTCUT ICON" href="/DLink/HTML/images/common/favicon.ico">
</head>
<body>

	<div class="skiptoContent">
		<a href="#container_wrap">본문내용 바로가기</a>
	</div>
	
	<!-- wrap s -->
	<div id="wrap" class="wrap">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="submenu" />
		
		
		
		<!-- container_wrap -->
		<div id="wrap_container">
			<%-- 
			<div class="wrap_content">
				<tiles:insertAttribute name="title" />
	
				<div class="contents">
						<tiles:insertAttribute name="content" />
				</div>
			</div>
			 --%>	
			 <tiles:insertAttribute name="content" />
		</div>
		<!-- //container_wrap --> 
		<tiles:insertAttribute name="footer" />
	</div>
			
	
	
</body>
</html>