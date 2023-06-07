<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : TCommutyRegister.jsp
  * @Description : TCommuty Register 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="TCommutyVO" staticJavascript="false" xhtml="true" cdata="false"/ -->
<script type="text/javascript" src="/DLink/HTML/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>	
<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/front/business/noticeList.do?menu_id=gongji'/>";
   	document.getElementById("detailForm").submit();		
}



/* 네이버에디터 스크립트 */
/* var oEditors = [];

$(function(){ 
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "cont", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "/DLink/HTML/js/smarteditor2/SmartEditor2Skin.html",
        fCreator: "createSEditor2" ,
        htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true
          },
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["cont"].exec("PASTE_HTML", [""]);
          }
      })
    
      oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
	})
 */
  
/* 네이버에디터 스크립트 end*/  
</script>

<form:form name="searchForm" id="searchForm" method="post" action="/front/business/noticeList.do?menu_id=gongji">
		
</form:form>

	<!-- container_wrap -->
	<div id="wrap_container">

		<div class="wrap_content">

	<form:form modelAttribute="TCommutyVO" name="detailForm" id="detailForm" >
		<form:hidden path="menuId" />
		<form:hidden path="postNo" />
		<form:hidden path="seq" />
		<form:hidden path="registerFlag" />
		
			<!-- 타이틀 시작 -->
			<div class="con_title">
				<h3><i>공지사항</i></h3>
				<ul class="loca">
					<li><a href="/front/main.do" class="home">home</a></li>
					<li><a href="#">사업소개</a></li>
					<li><a href="#">공지사항</a></li>
				</ul>				
			</div>
			<!-- 타이틀 끝 -->
			
			<div class="contents">
				<!-- 컨텐츠 영역 -->
				<section class="faq_content mt40">
			<!-- 컨텐츠 영역 s -->
					<div class="bd_view">
						<h4 class="bd_view_title">${TCommutyVO.title} </h4>
						<table class="tbl_basic mob_row">
							<caption>공지사항에 대한 상세목록으로 작성자, 작성일, 조회수, 첨부파일이 확인됩니다.</caption>
							<colgroup>
								<col class="bd_tbl_tit">
								<col class="bd_tbl_cont">
								<col class="bd_tbl_tit">
								<col class="bd_tbl_cont">
							</colgroup>
						<tbody>
								<tr>
									<th scope="row">작성자</th>
									<td>
										<c:choose>
											<c:when test="${TCommutyVO.register == 'admin'}">
												관리자
											</c:when>
											<c:otherwise>${TCommutyVO.register}</c:otherwise>
										</c:choose>
									</td>
									<th scope="row">작성일</th>
									<td>
										${TCommutyVO.regDt}
									</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td colspan="3">
										<c:if test="${not empty selectTAttfileList}">
											<c:forEach var="vlimg" items="${selectTAttfileList}" varStatus="vlvs">
											  <div id="${vlimg.fileSeq}" style='width: 75%; margin-bottom: 5px;'>
												  <a href="/imagefile/download.do?file_no=${vlimg.fileSeq}">${vlimg.fileNm}</a>
													<form:hidden path="fileSeq"/>
												</div>
											</c:forEach>
										</c:if>
										<!-- 사용자가 게시판 올릴 때 자료가 없으면 비출력 -->
										<c:if test="${empty selectTAttfileList}">
											등록된 첨부파일이 없습니다.
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
	
						<div class="bd_desc">
							<%-- <form:input type="text" path="cont" value="${TCommutyVO.cont}"/> --%>		  
							<c:out value="${TCommutyVO.cont}"  escapeXml="false"/>  								
						</div>
					</div>
							
								
				
			
					<!-- // 타이틀 -->
					<div class="bd_btn_area center" id="sysbtn">							
						<a href="javascript:fn_egov_selectList();" class="btn_black icon_list">목록</a>
					</div>
					
					<!-- //컨텐츠 영역 e -->
					
					<!-- 검색조건 유지 -->
					<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
					
				</section>		
			</div>
		</form:form>
	</div>		
</div>

