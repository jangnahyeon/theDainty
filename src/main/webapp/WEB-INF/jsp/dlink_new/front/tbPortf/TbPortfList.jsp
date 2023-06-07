<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TbPortfList.jsp
  * @Description : TbPortf List 화면
  * @Modification Information
  * 
  * @author 김현재
  * @since 2023-01-21
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
 --%><script type="text/javaScript" language="javascript" defer="defer">
//<!--
/* 글 수정 화면 function */


function fn_egov_select(portfSeq) {
    document.getElementById("listForm").portfSeq.value = portfSeq;
   	document.getElementById("listForm").action = "<c:url value='/front/tbPortf/updateTbPortfView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/front/tbPortf/addTbPortfView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/dsnStd/portfList.do'/>";
   	document.getElementById("listForm").submit();
}

function fn_code( code ) {
	document.getElementById("listForm").code.value = code;
	document.getElementById("listForm").action = "<c:url value='/front/tbPortf/TbPortfList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
 
 function go_detail(no) {
	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+no);
}
</script>
</head>
<body>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
    <input type="hidden" name="portfSeq" />
    <input type="hidden" name="code" value="${param.code }" />
<div id="content_pop">
	<!-- 타이틀 -->
	<%-- <div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div> --%>
	<!-- // 타이틀 -->
	<!-- List -->
	<div id="table">
		<%-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<colgroup>
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
				<col/>				
			</colgroup>		  
			<tr>
				<th align="center">PortfSeq</th>
				<th align="center">MemSeq</th>
				<th align="center">MemId</th>
				<th align="center">Title</th>
				<th align="center">FileSeq</th>
				<th align="center">RegDt</th>
				<th align="center">RegId</th>
				<th align="center">UpdDt</th>
				<th align="center">UpdId</th>
			</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
	 				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.portfSeq}"/>')"><c:out value="${result.portfSeq}"/></a>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.memSeq}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.memId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.title}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.fileSeq}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.regId}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updDt}"/>&nbsp;</td>
					<td align="center" class="listtd"><c:out value="${result.updId}"/>&nbsp;</td>
				</tr>
			</c:forEach>
		</table> --%>
	</div>
	<!-- /List -->
	<%-- <div id="paging">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	<div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn">
					<span class="btn_blue_l"><a href="javascript:fn_egov_addView();">등록</a><img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div> --%>
</div>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
			
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<!-- <li><a href="#" class="on">가공식품</a></li>
						<li><a href="#" onclick="fn_code( '0002' );">농수축산품</a></li>
						<li><a href="#">생활용품</a></li> -->
						
						<c:forEach var="menu3" items="${frontMenuList3 }">
							<c:if test="${menu3.upMenuSeq eq frontMenuVO2.menuSeq }">
								<li>
									<a href="${menu3.menuUrl }" class="<c:if test="${menu3.menuSeq eq frontMenuVO3.menuSeq }">on</c:if>">${menu3.menuNm }</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				
				<h3>촬영 포트폴리오</h3>
				<ul class="lst_thum row01">
					<c:forEach var="result" items="${resultList}" varStatus="vs">
					<li>
						<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');go_detail('${result.fileSeq}');return false;">
							<span class="info_item">
								<i>
									<img src="/imagefile/preview.do?fileSeq=${result.fileSeq }"  alt="">
								</i>
							</span>
							<strong>${result.title }</strong>
							
							<span class="info_over">
								<strong>${result.title }</strong>
								<span class="info_btn"><em class="btn">자세히보기</em></span>
							</span>
						</a>
					</li>
					
					</c:forEach>
				</ul>
				
				<%-- <ul class="lst_thum row01">					
					<c:forEach var="result" items="${resultList }">
						<li>
							<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }" alt=""></i></span>
							<span class="info_date">${result.title }</span>
						</li>
					</c:forEach>
				</ul>	
				 --%>
				 <!-- 이미지 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view">
						<div class="pop_design_view center "> 
							<h4 class="title">상세보기</h4>
							<div class="detail_design center">
								<div class="detail_img" style="float:none">
									<span><img src="../images/ex/design_view.jpg" alt="" id="title_img"/></span>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //이미지 상세보기 모달팝업 -->
					<div class="pop_modal_bg"></div>
					
				<c:if test="${paginationInfo.totalRecordCount eq 0}">
					<ul class="row01">
						<li class="no_data">현재 등록된 포트폴리오가 없습니다.</li>
					</ul>
				</c:if>			
				
				<div id="paging" class="pagination">
					<ui:pagination paginationInfo = "${paginationInfo}"
							   type="image"
							   jsFunction="fn_egov_link_page"
							   />
					<form:hidden path="pageIndex" />
				</div>
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
</form:form>
</body>
</html>
