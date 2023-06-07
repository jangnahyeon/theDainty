<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ntcDtl.jsp
  * @Description : ntcDtl 화면
  * @Modification Information
  * 
  * @author 장나현
  * @since 2023-01-09
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>
<script>
function go_add() {
	document.getElementById("listForm").action = "<c:url value='/admin/dBank/dBankUpdate.do'/>";
   	document.getElementById("listForm").submit();
} 
function go_delete(dsnSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").dsnSeq.value = dsnSeq; 
		document.getElementById("listForm").action = "<c:url value='/admin/dBank/dBankDelete.do'/>";
   		document.getElementById("listForm").submit();
	}
} 

</script>
				<div>	
					<div class="detail_design">
						<%-- <div class="detail_img">
							<span><img src="/imagefile/preview.do?fileSeq=${resultList.fileSeq }" alt=""></span>
						</div> --%>
						
						<form:form modelAttribute="resultList" name="listForm" id="listForm" method="post">
						<form:hidden path="dsnSeq"/>
						<div class="">
							<table class="bd_tbl bd_tbl_view">
								<caption>디자인에 대한 상세정보입니다.</caption>
								<col width="15%">
								<col>
								<tbody>
									<tr>
										<th scope="row" class="bd_title">이미지 제목</th>
										<td>${resultList.dsnNm }</td>
									</tr>
									<tr>
										<th scope="row">상세내용</th>
										<td>${resultList.detail } </td>
									</tr>
									<tr>
										<th scope="row">검색어</th>
										<td>${resultList.srcTrm } </td>
									</tr>
									<tr>
										<th scope="row">노출여부</th>
										<td>
											<input onclick="return(false);" type="radio" name="useYn" value="Y" id="useY" <c:if test="${resultList.useYn eq 'Y' }">checked</c:if>> <label for="useY">노출</label></li>
											<input onclick="return(false);" type="radio" name="useYn" value="N" id="useN" <c:if test="${resultList.useYn eq 'N' }">checked</c:if>> <label for="useN">노출안함</label></li>
										</td>
									</tr>
									<tr>
										<th scope="row">타입 선택</th>
										<td>
											<input onclick="return(false);" type="radio" name="code" value="0001" id="code1" <c:if test="${resultList.code eq '0001' }">checked</c:if>> <label for="code1">패키지디자인</label></li>
											<input onclick="return(false);" type="radio" name="code" value="0002" id="code2" <c:if test="${resultList.code eq '0002' }">checked</c:if>> <label for="code2">이미지</label></li>
											<input onclick="return(false);" type="radio" name="code" value="0003" id="code3" <c:if test="${resultList.code eq '0003' }">checked</c:if>> <label for="code3">영상</label></li>
										</td>
									</tr>
									<tr>
										<th scope="row" >미리보기 이미지</th>
										<td>
											<div >
												<span><img style="width:50%;height:50%"src="/imagefile/preview.do?fileSeq=${resultList.thumFileSeq }" alt=""></span>
												<%-- <a href="/imagefile/download.do?file_no=${resultList.fileSeq }"> ${resultList.thumFileNm }</a> --%>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" >대표 첨부파일</th>
										<td>
											<div >
												<span>
												<a href="/imagefile/download.do?file_no=${resultList.fileSeq }"> ${resultList.fileNm }</a>
												
												</span>
    											</video>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">등록일</th>
										<td>${resultList.regDt }</td>
									</tr>
									<tr>
										<th scope="row">총 다운로드 수</th>
										<td>
										<div style="padding-right:10px;display:inline-block;'">
											${resultList.downCnt }
										</div>
											<a href=".sch_layer" onclick="showLayer(this,'.pop_modal');go_detail('${resultList.dsnSeq}');return false;" title="레이어팝업" class="btn_st st_bg_blue small"><span>자세히 보기</span></a>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div class="bd_btn_area right">
								<a href="#" class="btn_black line_gray" onclick="javascript:go_add();">수정</a>
								<a href="#" class="btn_black line_orange"onclick="javascript:go_delete('${resultList.dsnSeq}');">삭제</a>
								<c:if test="${resultList.code eq '0001' }">								
									<a href="/admin/dBank/pkDsnList.do" class="btn_black btn_list" >목록</a>
								</c:if>
								<c:if test="${resultList.code eq '0002' }">								
									<a href="/admin/dBank/imgDsnList.do" class="btn_black btn_list" >목록</a>
								</c:if>
								<c:if test="${resultList.code eq '0003' }">								
									<a href="/admin/dBank/vidDsnList.do" class="btn_black btn_list">목록</a>
								</c:if>
							</div>
						</div>
						
						<!-- 모달팝업 -->
						<div class="pop_modal sch_layer"  style="margin-top:-200.695px">
							<div class="view_layer_area" >
								<h4 class="title">다운로드 상세보기</h4>
								<div class="pop_cont" style="overflow:scroll;width:920px; height:250px;">
									<table class="bd_tbl">
										<caption>코드분류 리스트 검색결과</caption>
										<colgroup>
											<col width="7%">
											<col width="15%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">회원 번호</th>
												<th scope="col">회원 아이디</th>
												<th scope="col">회원 이름</th>
												<th scope="col">다운로드 날짜</th>
											</tr>
										</thead>
										<tbody  id="addList">
											
										</tbody>
									</table>
								</div>
							</div>
							<a href="#" class="pop_close" onClick="window.location.reload()">팝업 닫기</a>
						</div>
						<!-- //모달팝업 -->
						<div class="pop_modal_bg"></div>
					</form:form>
					</div>
					
						

						
						
					<!-- //컨텐츠 영역 e -->
				</div>
				<!-- //contents e -->
				
				
<script>
function go_detail(no) {
	
		$.ajax({
			url : "/admin/dBank/dBankDownDetailJson.do",
			data : {"dsnSeq": no
			},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			async:false,
		    success: function(data){
		    	$("#addList").empty();
		    	var temp = "";
		    	for(var i in data) {
		    		temp += "<tr class=''>";
		    		temp += "<td class='center'  id='dememSeq"+i + "'>" + data[i].memSeq + "</td>";
		    		temp += "<td class='center'  id='dememId"+i + "'>" + data[i].memId + "</td>";
		    		temp += "<td class='center'  id='dememNm"+i + "'>" + data[i].memNm + "</td>";
		    		temp += "<td class='center'  id='dedownDt"+i + "'>" + data[i].regDt + "</td>";
		    		temp += "</tr>";
		    		
		    	}
		    	$("#addList").append(temp);
		    	
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	
}

</script>				