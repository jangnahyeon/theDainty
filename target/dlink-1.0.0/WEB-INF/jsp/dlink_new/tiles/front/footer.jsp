<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	//TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
 	<!-- footer -->
	<footer id="footer" class="footer">
		<div class="foot">
			<ul class="foot_link">
				<!-- <li class="policy1"><a>개인정보처리방침</a></li>
				<li class="policy2"><a>이용약관</a></li>
				<li class="policy3"><a>이메일무단수집거부</a></li>
				<li class="policy4"><a>오시는길</a></li> -->
				
				<c:forEach var="menuFooter" items="${frontMenuFooterList }" varStatus="vs">
					<li class="policy${vs.count }"><a href="${menuFooter.menuUrl }">${menuFooter.menuNm }</a></li>
				</c:forEach>
			</ul>
			<div class="foot_info">
				<h1><img src="/DLink/HTML_2023/images/common/foot_logo.png" alt="제주특별자치도 경제통상진흥원"></h1>
				<address>
					<dl>
						<dt>Address.</dt>
						<dd> (63217) 제주특별자치도 제주시 연삼로 473 (이도이동) 2층 </dd>
					</dl>
					<span class="bar"></span>
					<dl>
						<dt>Tel.</dt>
						<dd>064-805-3358</dd>
					</dl>
				</address>
				<p class="copy">Copyright ⓒ 제주특별자치도 경제통상진흥원</p>
			</div>
		</div>
	</footer>
	<!-- //footer -->