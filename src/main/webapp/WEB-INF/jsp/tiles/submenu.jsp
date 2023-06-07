<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- sub(page)_menu -->
<div class="wrap_pagemenu">
	<div class="pagemenu">				
		<ul class="menu_sub">
			<li><a href="#">D.Link</a></li>
			<li><a href="#">서브메뉴1</a></li>
			<li><a href="#">서브메뉴2</a></li>
		</ul>
		<div class="menu_use">
			<a href="#" class="icon_sns"><i>SNS공유</i></a>				
			<div class="sns_area">
				<ul>
					<li><a href="#" class="sns_f">페이스북</a></li>
					<li><a href="#" class="sns_t">트위터</a></li>
					<li><a href="#" class="sns_k">카카오톡</a></li>
					<li><a href="#" class="sns_b">블로그</a></li>
				</ul>
				<a href="#" class="pop_close">닫기</a>
			</div>

			<a href="#none" onclick="javascript:printPart('contents'); return false;" class="icon_print"><i>인쇄</i></a>
		</div>
	</div>
</div>
<!-- // sub(page)_menu -->