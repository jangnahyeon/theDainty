<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 /**
  * @Class Name : TbBrdRegister.jsp
  * @Description : TbBrd Register 화면
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<c:set var="registerFlag" value="${empty tbBrdVO.brdSeq || 0 eq tbBrdVO.brdSeq ? '등록' : '수정'}"/>			

<title> <c:out value="${registerFlag}"/> </title>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="tbBrdVO" staticJavascript="false" xhtml="true" cdata="false"/ -->


<!-- SmartEditor2 라이브러리  -->
<script type="text/javascript" src="/DLink/HTML_2023/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>


<script type="text/javaScript" language="javascript" defer="defer">
// <!--

/* 네이버스마트에디터 스크립트 s*/
 var oEditors = [];
$(function(){ 
     nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "cont", //textarea에서 지정한 id와 일치해야 합니다. 
         //SmartEditor2Skin.html 파일이 존재하는 경로
       sSkinURI: "/DLink/HTML_2023/js/smarteditor2/SmartEditor2Skin.html",
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
     /* oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []); */
     
     
	/* 네이버스마트에디터 validation*/
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", [])
	var cont = document.getElementById("cont").value;
	if (cont == "") {
		alert("내용을 입력해주세요.");

		return false;
	}
}) 

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/front/tbBrd/TbBrdList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/front/tbBrd/deleteTbBrd.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

  	frm.action = "<c:url value="${registerFlag == '등록' ? '/front/tbBrd/addTbBrd.do' : '/front/tbBrd/updateTbBrd.do'}"/>";
    frm.submit();

}

function fn_cmt_add_act() {
	
	<c:if test="${empty frontLoginVO }">
		alert("로그인 후 의견 등록이 가능합니다.");
		fn_login();		
		return;
	</c:if>
	
	var cont = $("#reply_write").val();
	if( !cont ) {
		alert("의견을 입력해 주세요.");
		$("#reply_write").focus();
		return;
	}
	
	$.ajax({
		url : "/front/brdCmt/addBrdCmt_act.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"cont" : cont
		},
		type : "post",
		success : function(res) {
			if( "Y" == res ) {
				alert("의견을 등록하였습니다.");
				fn_brd_cmt_list_act();
				$("#reply_write").val("");
				
			} else {
				alert("의견 등록에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 등록에 실패하였습니다..");
		}
	});

}

function fn_cmt_del_act(cmtSeq) {
	
	if( !confirm("의견을 삭제하시겠습니까?") ) {
		return;
	}
	
	$.ajax({
		url : "/front/brdCmt/deleteBrdCmt_act.do",
		data : {
			"cmtSeq" : cmtSeq			
		},
		type : "post",
		success : function(res) {
			if( "Y" == res ) {
				alert("의견을 삭제하였습니다.");
				fn_brd_cmt_list_act();
			} else {
				alert("의견 삭제에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 삭제에 실패하였습니다..");
		}
	});
}

function fn_cmt_page_info(currentPageNo, totalPageCount) {	
	$("#cmtCurrentPageNo").val( currentPageNo );
	$("#cmtTotalPageCount").val( totalPageCount );
	
	var curPage = currentPageNo * 1;
	var totPage = totalPageCount * 1;
	
	$("#btn_cmt_more").find("a").text("더보기 (" + curPage + "/" + totPage + ")" );	
}

function fn_brd_cmt_list_act() {
	$.ajax({
		url : "/front/tbBrdCmt/TbBrdCmtList.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"pageUnit" : 3
		},
		type : "post",
		dataType : "text",
		success : function(res) {
			if( res ) {
				//alert("의견을 조회하였습니다.");
				$("#reply_lst").empty();
				$("#reply_lst").append(res);
			} else {
				alert("의견 조회에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 조회에 실패하였습니다..");
		}
	});
}

function fn_brd_cmt_list_more_act() {
	
	var cmtCurrentPageNo = $("#cmtCurrentPageNo").val();
	if( !cmtCurrentPageNo ) {
		return;
	}
	
	var cmtTotalPageCount = $("#cmtTotalPageCount").val();
	if( !cmtTotalPageCount ) {
		return;
	}
	
	var curPage = cmtCurrentPageNo * 1;
	var totPage = cmtTotalPageCount * 1;
	
	if( curPage >= totPage ) {
		alert("더이상 조회할 의견이 없습니다.");
		return;
	}
	
	$.ajax({
		url : "/front/tbBrdCmt/TbBrdCmtList.do",
		data : {
			"brdSeq" : "${tbBrdVO.brdSeq }",
			"pageUnit" : 3,
			"pageIndex" : curPage + 1
		},
		type : "post",
		dataType : "text",
		success : function(res) {
			if( res ) {
				//alert("의견을 조회하였습니다.");
				//$("#reply_lst").empty();
				$("#reply_lst").append(res);
				
			} else {
				alert("의견 조회에 실패하였습니다.");
			}
		},
		error : function(err) {
			alert("의견 조회에 실패하였습니다..");
		}
	});
}

$(function(){
	fn_brd_cmt_list_act();
});

// -->
</script>
</head>
<body>

<form:form modelAttribute="tbBrdVO" name="detailForm" id="detailForm" >
	<input type="hidden" name="menuSeq" value="${param.menuSeq }" />
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><%-- <img src="<c:url value='/images//title_dot.gif'/>" alt="" /> --%><%-- <c:out value="${registerFlag}"/> --%></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<div id="table">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" >
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<c:if test="${registerFlag == '수정'}">
		</c:if>
		<c:if test="${registerFlag == '등록'}">
		</c:if>		
		<%-- <tr>
			<th>BRD_SEQ</th>
			<td>
				<form:input path="brdSeq" cssClass="txt"/>
				&nbsp;<form:errors path="brdSeq" />
			</td>
		</tr>	
		<tr>
			<th>MENU_SEQ</th>
			<td>
				<form:input path="menuSeq" cssClass="txt"/>
				&nbsp;<form:errors path="menuSeq" />
			</td>
		</tr>	
		<tr>
			<th>MEM_SEQ</th>
			<td>
				<form:input path="memSeq" cssClass="txt"/>
				&nbsp;<form:errors path="memSeq" />
			</td>
		</tr>	
		<tr>
			<th>MEM_ID</th>
			<td>
				<form:input path="memId" cssClass="txt"/>
				&nbsp;<form:errors path="memId" />
			</td>
		</tr> --%>	
		<%-- <tr>
			<th>TITLE</th>
			<td>
				<form:input path="title" cssClass="txt"/>
				&nbsp;<form:errors path="title" />
			</td>
		</tr>	
		<tr>
			<th>CONT</th>
			<td>
				<form:input path="cont" cssClass="txt"/>
				&nbsp;<form:errors path="cont" />
			</td>
		</tr>	 --%>
		<%-- <tr>
			<th>REG_DT</th>
			<td>
				<form:input path="regDt" cssClass="txt"/>
				&nbsp;<form:errors path="regDt" />
			</td>
		</tr>	
		<tr>
			<th>REG_ID</th>
			<td>
				<form:input path="regId" cssClass="txt"/>
				&nbsp;<form:errors path="regId" />
			</td>
		</tr>	
		<tr>
			<th>UPD_DT</th>
			<td>
				<form:input path="updDt" cssClass="txt"/>
				&nbsp;<form:errors path="updDt" />
			</td>
		</tr>	
		<tr>
			<th>UPD_ID</th>
			<td>
				<form:input path="updId" cssClass="txt"/>
				&nbsp;<form:errors path="updId" />
			</td>
		</tr>	 --%>
	</table>
  </div>
	<%-- <div id="sysbtn">
		<ul>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_selectList();">List</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_save();"><c:out value='${registerFlag}'/></a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<c:if test="${registerFlag == '수정'}">
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_delete();">삭제</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			</c:if>
			<li><span class="btn_blue_l"><a href="javascript:document.detailForm.reset();">Reset</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li></ul>
	</div> --%>
</div>

<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>

<!-- 컨텐츠 영역 -->
<div class="contents">			
	<div class="innerwrap">	
		<div class="view_wrap">					
			<span class="bg_blue">${tbMenuVO.menuNm }</span>
			<h4>${tbBrdVO.title }</h4>
			<div class="view_top">
				<span class="name"><b>작성자</b><span>${tbBrdVO.memVO.memNm }</span></span>
				<span class="date"><b>작성일</b>
					<span>
						<%-- <fmt:formatDate value="${tbBrdVO.regDt }" pattern="yyyy.MM.dd HH:mm:ss" /> --%>
						${tbBrdVO.regDt }
					</span>
				</span>
				<span class="hit"><b>조회수</b><span>${tbBrdVO.readCnt }</span></span>
			</div>
			<c:if test="${not empty tbBrdVO.link}">
				<div class="view_link">
					<span class="link"><b>관련링크</b><span><a href="${tbBrdVO.link }" target="_blank">${tbBrdVO.link }</a></span></span>
				</div>
			</c:if>
			<div class="view_content">
				<div class="view_img">
					${fn:replace(tbBrdVO.cont, newLineChar, '<br/>') }
					
					<!-- <img content="" src="../images/ex/lst_thum_row02_01.jpg" alt="" class="img-tag "> -->
					<%-- <c:forEach var="brdFile" items="${tbBrdVO.brdFileVOList }">
					
						<c:if test="${fn:contains( brdFile.fileVO.fileType, 'image' ) }">
							<img content="" src="/imagefile/preview.do?fileSeq=${brdFile.fileSeq }" alt="" class="img-tag ">
						</c:if>
					</c:forEach> --%>
				</div>
			</div>
			
			<c:if test="${not empty tbBrdVO.brdFileVOList }">
				<div class="view_file_link view_file">
					<strong>첨부파일</strong>
					<div>
						<!-- <a href="" class="ellipsis" target="_blank">가이드북.pdf (75.0M)</a> -->	
						<c:forEach var="brdFile" items="${tbBrdVO.brdFileVOList }">
							<a href="/imagefile/download.do?file_no=${brdFile.fileSeq }" class="ellipsis" target="_self">${brdFile.fileVO.fileNm }</a>
						</c:forEach>	
					</div>
				</div>
			</c:if>
			
			<!-- <div class="view_paging">
				<a role="button" href="" class="view_paging_prev">
					<b>이전글</b>
					<p class="ellipsis">2022 IDSC CMF 트렌드 4차(히다)</p>
				</a>
				<div class="view_paging_next">
					<b>다음글</b>
					<p class="ellipsis">다음글이 없습니다.</p>
				</div>
			</div> -->
			
			<div class="view_paging">
				<c:if test="${not empty prevBrd.brdSeq }">
					<a role="button" href="/front/brd/brdView.do?brdSeq=${prevBrd.brdSeq }&menuSeq=${prevBrd.menuSeq }" class="view_paging_prev">
						<b>이전글</b>
						<p class="ellipsis">${prevBrd.title }</p>
					</a>
				</c:if>
				<c:if test="${empty prevBrd }">
					<div class="view_paging_next">
						<b>이전글</b>
						<p class="ellipsis">이전글이 없습니다.</p>
					</div>
				</c:if>
				
				<c:if test="${not empty nextBrd }">
					<a role="button" href="/front/brd/brdView.do?brdSeq=${nextBrd.brdSeq }&menuSeq=${nextBrd.menuSeq }" class="view_paging_prev">
						<b>다음글</b>
						<p class="ellipsis">${nextBrd.title }</p>
					</a>
				</c:if>
				<c:if test="${empty nextBrd }">
					<div class="view_paging_next">
						<b>다음글</b>
						<p class="ellipsis">다음글이 없습니다.</p>
					</div>
				</c:if>
			</div>
			
			<!-- 덧글 -->
			<div class="reply_area">
				<div class="reply_form">
					<label for="reply_write" class="focus_tit" style="">의견을 등록해 주세요. 내용과 무관한 댓글, 악플은 삭제될 수 있습니다. 댓글은 1000자까지 입력 가능합니다.</label>
					<textarea id="reply_write" maxlength="1000"></textarea>
					<a href="javascript:fn_cmt_add_act();">의견등록</a>
				</div>

				<ul class="reply_lst" id="reply_lst">
					<!-- <li>
						<em>로그인1<span>2021-02-19<span>08:50:34</span></span></em>
						<div>
							디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
						</div>
						<p class="btn_area_reply">
							<a href="#" class="btn bg_gray">삭제</a>
							<a href="#" class="btn bl_gray"><span>수정</span></a>
						</p>
					</li>
					<li>
						<em>홍길동<span>2021-02-19<span>08:50:34</span></span></em>
						<div>
							디자인개발 수행사(주관기관)의 체계적 관리를 위한 사전 등록제도 운영
						</div>
						<p class="btn_area_reply">
							<a href="#" class="btn bl_gray"><span>수정</span></a>
						</p>
					</li> -->
				</ul>
				
				<input type="hidden" id="cmtCurrentPageNo" value="0" />
				<input type="hidden" id="cmtTotalPageCount" value="0" />				
				<p class="bd_btn_area center" id="btn_cmt_more">
					<a href="javascript:fn_brd_cmt_list_more_act();" class="f_size16">더보기</a>
				</p>
			</div>
			
			<!-- //덧글 -->
			
			<div class="bd_btn_area center">
				<c:if test="${fn:contains(tbBrdVO.srcNm, '디링크 공지사항') }">
					<a href="/front/brd/brdList.do?menuSeq=${tbMenuVO.menuSeq }" class="btn_black icon_list">목록</a>
				</c:if>
				<c:if  test="${fn:contains(tbBrdVO.srcNm, '시설예약 공지사항') }">
					<a href="javascript:history.back();" class="btn_black icon_list">목록</a>
				</c:if>
			</div>
		</div>
		</
	</div>
</div>
<!-- //컨텐츠 영역 -->

</body>
</html>

