<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
	<!-- footer -->
	<footer id="wrap_footer">
		<div class="footer">
			<div class="links">
				<div class="inner">
					<div class="txt_fild">
						<h2><a href="/"><img src="/DLink/HTML/images/common/foot_logo.png" alt=""></a></h2>
						<p class="add">
							재단법인 제주특별자치도경제통상진흥원 / <br>63217 제주특별자치도 제주시 연삼로 473 (이도2동) 
						</p>
						<p class="phone">
							<i>TEL</i> 064-751-3320 <br>
							<i>FAX</i> 080-851-3320
						</p>
					</div>
					<div class="link_fild">
						<ul>
							<li>								
								<a href="/front/agency/agSearchList.do">전문업체검색</a>
								<ul class="depth2">
									<li><a href="/front/agency/agSearchList.do">업체검색</a></li>
								</ul>
							</li>
							<li>								
								<a href="/front/portfolio/portfSearchList.do">포트폴리오</a>
								<ul class="depth2">
									<li><a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a></li>
								</ul>
							</li>
							<li>								
								<a href="/front/dsn/dsnBankList.do">디자인뱅크</a>
								<ul class="depth2">
									<li><a href="/front/dsn/dsnBankList.do">이미지검색</a></li>
								</ul>
							</li>
							<li>								
								<a href="/front/content/centerIntro.do">사업소개</a>
								<ul class="depth2">
									<li><a href="/front/content/centerIntro.do">진흥원소개</a></li>
									<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
									<li><a href="/front/business/wordArgmtList.do">용어정리</a></li>
									<li><a href="/front/business/qnaList.do">Q&A</a></li>
									<li><a href="/front/business/noticeList.do?menu_id=gongji">공지사항</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<a href="#" class="top"></a>
			</div>
			<div class="foot">
				<div class="area">
					<p class="link">
						<a href="/front/content/prPolicy.do">개인정보처리방침</a>
						<a href="/front/content/licensing.do">이용약관</a>
						<a href="/front/content/emailDenial.do">이메일 무단수집 거부</a>
					</p>
					<p class="copy">
						Copyright(c) 2021 D.link Inc All Right Reserved
					</p>
				</div>
			</div>
			<div class="side_btn">
				<a onclick="fn_egov_consult();" style="cursor:pointer;">
					<img src="/DLink/HTML/images/common/icon_foot_side.png" alt="알림톡">
				</a>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	
	<!-- //footer -->
	<form id="listForm" name="listForm" method="post">
	
	</form>
	
	<script>
		function fn_egov_consult(){
			
			<%if(loginVO == null){ %>
				alert('로그인 해주세요.');
				 location.href = "/front/login.do";
				 
				 return false;
			<%} %>
			
			
			
			document.getElementById("listForm").action = "<c:url value='/front/consult/consultInquiryList.do'/>";
		   	document.getElementById("listForm").submit();
		}
	</script>