<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 /**
  * @Class Name : TbBrdList.jsp
  * @Description : TbBrd List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-25
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:forEach var="resultList" items="${resultReply}" varStatus="status">
	<li>
		<em>관리자<span>${resultList.regDt }</span></em>
		<div class="replyCont${resultList.cmtSeq}">
			${resultList.cont }
		</div>
		<div class="replyUpdate${resultList.cmtSeq}" style="display:none">
			<textarea id="cont${resultList.cmtSeq}" >${resultList.cont }</textarea>
		</div>
			
		<p class="btn_area_reply">
			<a href="#" onclick="javascript:replyDelete('${resultList.cmtSeq}');" class="btn_st bg_gray">삭제</a>
			<a href="#" onclick="javascript:replyUpdate('${resultList.cmtSeq}');" class="btn_st line_gray updateBtn"><span>수정</span></a>
			<a href="#" onclick="javascript:replySave('${resultList.cmtSeq}');" class="btn_st line_gray saveBtn" style="display:none"><span>저장</span></a>
		</p>
	</li>
</c:forEach>
