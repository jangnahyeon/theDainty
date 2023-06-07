<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TFaqList.jsp
  * @Description : TFaq List 화면
  * @Modification Information
  * 
  * @author 이효진
  * @since 2022-03-30
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">


</script>


	<!-- container_wrap -->
	<div id="wrap_container">

		<div class="wrap_content">

					
		<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
			<input type="hidden" name="faqNo" id="faqNo" />
			<input type="hidden" name="registerFlag" id="registerFlag" />
				
				<!-- 타이틀 시작 -->
			<div class="con_title">
				<h3><i>Q&A관리</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
					<li><a href="#">Q&A관리</a></li>
				</ul>				
			</div>
			<!-- 타이틀 끝 -->
			
				<!-- contents s -->	
				<div class="contents">
					<!-- 컨텐츠 영역 s -->
								
					<section class="faq_content mt40">	
							<div id="accordion">
								<c:forEach var="result" items="${resultList}" varStatus="vs">
									<div class="accordion_panel">
										<div class="panel_head">
											<span>Q</span><h5><a>${result.question}</a></h5>
										</div>
										<div class="pane_content">
											<span>A</span> <p>${result.answer}</p></div>
									</div>
								</c:forEach>								
							</div>
					</section>	
				</div>
		</form:form>
	</div>
</div>
