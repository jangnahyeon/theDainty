<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : mJoinDetail.jsp
  * @Description : mJoinDetail 화면
  * @Modification Information
  * 
  * @author 이은지
  * @since 2022-04-07
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/mJoinInquiryEndList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
	 var data = $("#detailForm").serialize();
	}	
		$.ajax({
		    type: "POST",
		    url: "/admin/member/deleteTSpecCom.do",
		    data : data,
		    dataType: "text",
		    success: function(rst){		        
	        	if(rst == "suc"){
	        		alert("삭제 되었습니다.");
	        		$("#searchForm").submit();
	        	}else{
	        		alert( "삭제에 실패했습니다. \n  관리자에게 문의바랍니다.");
	        		$("#searchForm").submit();
	        	}
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});

}



</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/member/mJoinInquiryEndList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TSpecComVO" name="detailForm" id="detailForm" >				
	<form:hidden path="loginId"/>
	<form:hidden path="specNo" value="${setTSpecComVO.specNo}"/>
	
	<h4 class="tit">업체정보<span> - 승인일 등록 시 주관기관 등록승인이 완료된 것으로 처리됩니다.</span></h4>
	
	<table class="bd_tbl bd_tbl_view">
		<caption>업체정보</caption>
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">기업명</th>
				<td class="left">	
					${setTSpecComVO.comNm}
				</td>
				<th scope="row">법인등록번호</th>
				<td>
					${setTSpecComVO.comNo}
				</td>
			</tr>
			<tr>
				<th scope="row">사업장주소</th>
				<td class="left">	
					${setTSpecComVO.comAddr}/${setTSpecComVO.comDtlAddr}${setTSpecComVO.comZip}
				</td>
				<th scope="row">기업홈페이지</th>
				<td>
					${setTSpecComVO.comUrl}
				</td>
			</tr>
			<tr>
				<th scope="row">대표자명 / 성별</th>
				<td class="left">	
					${setTSpecComVO.ceoNm}/
					<c:choose>
						<c:when test="${setTSpecComVO.sex == 'SX0001'}">남자</c:when>
						<c:otherwise>여자</c:otherwise>
					</c:choose>
				</td>
				<th scope="row">대표자휴대폰</th>
				<td>
					${setTSpecComVO.ceoMobileNo}
				</td>
			</tr>
		</tbody>
	</table>
		
	
			<h4 class="tit">담당자 정보</h4>
					<table class="bd_tbl bd_tbl_view"> 
						<caption>담당자정보</caption>
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">	
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="20%">								
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">담당자 이름</th>
								<td>${setTSpecComVO.damdangNm}</td>
								<th scope="row">부서/직위</th>
								<td> ${setTSpecComVO.damdangDept}/ ${setTSpecComVO.damdangPos}</td> 								
								<th scope="row">담당자연락처</th>
								<td>${setTSpecComVO.damdangMobileNo}</td>
								<th scope="row">담당자이메일</th>
								<td scope="row"> ${setTSpecComVO.damdangEmail} </td>
							</tr>
						</tbody>
					</table>
	
	
				<table class="bd_tbl bd_tbl_view"> 
						<caption>회사정보</caption>
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">							
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">매출액</th>
								<td>${setTSpecComVO.salesAmt}</td>
								<th scope="row">주요거래처</th>
								<td>${setTSpecComVO.keyCustomer} </td> 	
							</tr>
							<tr>
								<th scope="row">고용현황</th>
								<td colspan="3">${setTSpecComVO.employ}</td>
							</tr>
							<tr>
								<th scope="row">디자인 인력현황</th>
								<td colspan="3">
									<table class="bd_tbl bd_tbl_view"> 
										<caption>전문회사별인력 현황</caption>
										<colgroup>
											<col width="5%">
											<col width="10%">
											<col width="10%">
											<col width="10%">
											<col width="20%">
											<col width="20%">
											<col width="25%">
								        </colgroup>
										<thead>
											<tr>
												<th scope="col" class="">순번</th>
												<th scope="col" class="">직원명</th>
												<th scope="col" class="">직위</th>
												<th scope="col" class="">생년월일</th>
												<th scope="col" class="">최종학력</th>
												<th scope="col" class="">전공/전공분야</th>
												<th scope="col" class="">경력</th>
											</tr>
										</thead> 
										<c:if test="${not empty selectTSpecMemList}">
											<tbody>
												<c:forEach var="selectTSpecMemList" items="${selectTSpecMemList}" varStatus="vs">
													<tr>
														<td>${vs.count}</td> 
														<td>${selectTSpecMemList.staffNm}</td>
														<td>${selectTSpecMemList.position}</td>
														<td>${selectTSpecMemList.birthday}</td>
														<td>${selectTSpecMemList.lstHakwi}</td>
														<td>${selectTSpecMemList.jungong} / ${selectTSpecMemList.jungongPart}</td>
														<td>${selectTSpecMemList.career}</td>
													</tr>	
												</c:forEach>							
											</tbody>
										</c:if>
										<c:if test="${empty selectTSpecMemList}">
											<tbody>
												<tr>
													<td colspan="7">등록된 내용이 없습니다.</td>
												</tr>
											</tbody>
										</c:if>
									</table>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="data_file">첨부파일</label></th>
								<td colspan="3">
									<table class="bd_tbl bd_tbl_view"> 
										<caption>디자인 인력현황</caption>
										<col  width="10"/>
										<col  width="30"/>
										<col  width="60"/>
										<thead>
											<th>순번</th>
											<th>파일정보</th>
											<th>파일이름</th>							
										</thead>
										<c:if test="${not empty TMemComFileList}">
											<c:forEach var="vlimg" items="${TMemComFileList}" varStatus="vlvs">
												<tr>
													<td>${vlvs.count}</td> 
													<td>${vlimg.fileKind}</td>
													<td>
														<div id="${vlimg.fileSeq}" style='width: 75%; margin-bottom: 5px;'>
														  <a href="/imagefile/download.do?file_no=${vlimg.fileSeq}">${vlimg.fileNm}</a>
															<form:hidden path="fileSeq"/>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<!-- 사용자가 게시판 올릴 때 자료가 없으면 비출력 -->
										<c:if test="${empty TMemComFileList}">
											<tbody>
												<tr>
													<td colspan="3">등록된 첨부파일이 없습니다.</td>
												</tr>
											</tbody>
										</c:if>
									</table>
									<p class="mt10 mb5 f_size14"> ※ 사업대상지 현장사진 등 관련 참고자료 첨부</p>
								</td>
							</tr>
							<tr>
								<th scope="row">승인일자</th>
								<td colspan="3">
									${setTSpecComVO.acceptDt}
								</td>
							</tr>
						</tbody>
					</table>
					
	
						
						
						
	<div id="sysbtn" class="bd_btn_area center">
		<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>					
		<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>					
	</div>
		
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
