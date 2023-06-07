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
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/mJoinInquiryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
	if(confirm("삭제하시겠습니까??")){
	 var data = $("#detailForm").serialize();
	}	
		$.ajax({
		    type: "POST",
		    url: "/admin/member/deleteTSpecReqCom.do",
		    data : data,
		    dataType: "text",
		    success: function(rst){
		        if(rst != null){
		        	if(rst == "suc"){
		        		alert("삭제 되었습니다.");
		        		$("#searchForm").submit();
		        	}else{
		        		alert( "삭제에 실패했습니다. \n  관리자에게 문의바랍니다.");
		        		$("#searchForm").submit();
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});

}

/* 글 수정 화면 function */
/* function fn_egov_select(loginId,registerFlag) {
    document.getElementById("detailForm").loginId.value = loginId;
    document.getElementById("detailForm").registerFlag.value = registerFlag;
   	document.getElementById("detailForm").action = "<c:url value='/admin/member/updateTSpecReqComView.do'/>";
   	document.getElementById("detailForm").submit();
} */


/* 글 수정등록 function */
function fn_egov_save() {	

	var acceptYn = $("input[name=acceptYn]:checked").val();
	var acceptCont = $("#acceptCont").val();

	if(acceptYn == null){
			alert("승인여부를 선택해주세요.");
			return false;
		}else if(acceptYn == 'AC0002'){
			if(acceptCont == ''){
				alert("승인거부사유를 작성해주세요.");
				return false;
			}	
		}
	
	 var data = $("#detailForm").serialize();
		
		
		$.ajax({
		    type: "POST",
		    url: "/admin/member/updateTSpecReqCom.do",
		    data : data,
		    dataType: "text",
		    success: function(res){
		        if(res == "suc"){
	        		alert("저장 되었습니다.");
	        		$("#searchForm").submit();
	        	}else{
	        		alert( "실패했습니다. \n  관리자에게 문의바랍니다.");
	        		$("#searchForm").submit();
	        	}
		       
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
}


</script>

<form:form name="searchForm" id="searchForm" method="post" action="/admin/member/mJoinInquiryList.do">
	
</form:form>

<!-- 컨텐츠 영역 s -->
<form:form modelAttribute="TSpecReqComVO" name="detailForm" id="detailForm" >				
	<form:hidden path="loginId"/>
	<form:hidden path="registerFlag"/>
	<form:hidden path="reqNo"/>
	<form:hidden path="salesAmt"/>
	<form:hidden path="keyCustomer"/>
	<form:hidden path="requester"/>
	<form:hidden path="employ"/>
	
	<table class="bd_tbl bd_tbl_view">
		<caption>회원정보 </caption>
		<colgroup>
			<col width="15%">
			<col width="auto;">
			<col width="15%">
			<col width="auto;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><label for="loginId">아이디<span class="tbl_star">*</span></label></th>
				<td class="left">	
					${TSpecReqComVO.loginId}
				</td>
				<th scope="row"><label for="reqNo">신청관리번호<span class="tbl_star">*</span></label></th>
				<td>
					${TSpecReqComVO.reqNo}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="salesAmt">매출액<span class="tbl_star">*</span></label></th>
				<td class="left">	
					${TSpecReqComVO.salesAmt}
				</td>
				<th scope="row"><label for="keyCustomer">주요거래처</label></th>
				<td>
					${TSpecReqComVO.keyCustomer}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="reqDt">신청일자</label></th>
				<td class="left">	
					${TSpecReqComVO.reqDt}
				</td>
				<th scope="row"><label for="requester">신청자</label></th>
				<td>
					${TSpecReqComVO.requester}
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="employ">고용현황</label></th>
				<td class="left">	
					${TSpecReqComVO.employ}
				</td>
				<th scope="row"><label for="acceptYn">승인여부</label><span class="tbl_star">*</span></th>
				<td>
					<ul class="chk_area">
						<li>
							<form:radiobutton path="acceptYn" value="AC0001" />
							<label for="acceptYn1">승인</label>
						</li>
						<li>
							<form:radiobutton path="acceptYn" value="AC0002" />
							<label for="acceptYn2">반려</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="acceptCont">승인거부사유</label></th>
				<td class="left" colspan="3">
					<form:input type="text" path="acceptCont"/>
				</td>
			</tr>	
			<tr>
				<th scope="row"><label for="acceptCont">첨부파일</label></th>
				<td class="left" colspan="3">
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
								<tr name="arr">
									<td>${vlimg.seq}</td>
									<td>${vlimg.fileKind}</td>
									<td>
										<div id="${vlimg.fileSeq}" style='width: 75%; margin-bottom: 5px;'>
										  <a href="/imagefile/download.do?file_no=${vlimg.fileSeq}">${vlimg.fileNm}</a>
											<!-- 
												<form:hidden path="fileSeq"/>
											-->
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
				</td>
			</tr>			
		</tbody>
	</table>
	
	
	<table class="bd_tbl bd_biz center mt50">
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
					<tr name="SpecMemarr">
						<td>${vs.count}</td> <!--  등록된 인력현황 순번  -->
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
	
	
	<div id="sysbtn" class="bd_btn_area center">
		<a href="javascript:fn_egov_selectList();" class="btn_black">목록</a>					
		<a href="javascript:fn_egov_save();" class="btn_black line_gray">저장</a>						
	<%-- 	<a href="javascript:fn_egov_select('${TSpecReqComVO.loginId}', 'update');" class="btn_black line_gray">수정</a> --%>
		<a href="javascript:fn_egov_delete();" class="btn_black line_orange">삭제</a>					
	</div>
		
	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
