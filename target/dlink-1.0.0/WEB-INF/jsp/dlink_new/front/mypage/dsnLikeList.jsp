<%@page import="dlink_new.admin.vo.TbMemVO"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	

<%
	TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
%>


<script>
$(function(){
	var url = window.location.pathname;
	
	if(url == "/front/mypage/pkDsnList.do") {
		 $( '#pkOn' ).attr( 'class', 'on' );
	} else if(url == "/front/mypage/imgDsnList.do") {
		$( '#imgOn' ).attr( 'class', 'on' );
	} else if(url == "/front/mypage/vidDsnList.do") {
		$( '#vidOn' ).attr( 'class', 'on' );
	} 
});
</script>

<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<form:hidden path="pageIndex" />
	<form:hidden path="searchKeyword2" />
<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				<div class="bd_view_thum">
					<div class="info_company mypage">
						<div class="info_tit">
							<strong>${memVO.memNm } (${memVO.memId }님)</strong>
							<%-- <p>${memVO.email }</p> --%>
						</div>						
						<p class="info_btn"><a href="/front/mypage/memView.do" class="btn bl_gray icon_setting">회원정보 수정</a></p>
					</div>
				</div>
				
				<div class="tab_device mt40">
					<ul class="tab_style05">
						<li><a href="/front/mypage/pkDsnList.do" id="pkOn">패키지 디자인 소스</a></li>
						<li><a href="/front/mypage/imgDsnList.do" id="imgOn">이미지 소스</a></li>
						<li><a href="/front/mypage/vidDsnList.do" id="vidOn">영상 소스</a></li>
					</ul>
				</div>
				
				<h3>찜한 패키지 디자인 소스</h3>
				<div class="bd_top_style">
					<div class="area_left">
						<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
						
						<div class="selec_area">
							<span class="select_btn">검색조건 </span>
							<form:select path="searchCondition" id="sel_area">
								<form:option value="">전체</form:option>
								<form:option value="1">내용</form:option>
								<form:option value="2">이미지명</form:option>
							</form:select>
						</div>
					</div>
					
					<fieldset class="bd_sel_search">
						<legend>검색</legend>
						<label for="sear_word" class="focus_tit">검색어를 입력하세요</label>
						<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="sear_word" maxlength="20"/>
						<input type="button" value="검색"onclick="javascript:go_search()">
					</fieldset>					
				</div>
				<c:if test="${!empty searchVO }">
				<!-- 이미지게시판 -->
				<ul class="lst_thum row01">
					<c:forEach var="result" items="${resultList}" varStatus="vs">
					<li>
						<em class="info_favorite"><button type="button" class="icon_heart" onclick="deleteLikeInfo('${result.dsnSeq}', 'like')"></button></em>
						<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');go_detail('${result.dsnSeq}');return false;">
							<span class="info_item">
								<i>
									<img src="/imagefile/preview.do?fileSeq=${result.fileSeq }"  alt="">
								</i>
							</span>
							<strong>${result.dsnNm }</strong>
							
							<span class="info_over">
								<strong>${result.dsnNm }</strong>
								<span class="info_btn"><em class="btn">자세히보기</em></span>
							</span>
						</a>
					</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${paginationInfo.totalRecordCount eq 0}">
					<ul class="row01">
						<li class="no_data">찜한 디자인이 없습니다.</li>
					</ul>
				</c:if>
				<!-- //이미지게시판 -->
				
				<div class="pagination">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
				</div>
				
				<!-- 이미지 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view">
						<div class="pop_design_view"> 
							<h4 class="title">상세보기</h4>
							<div class="detail_design">
								<div class="detail_img">
									<span><img src="../images/ex/design_view.jpg" alt="" id="title_img"/></span>
								</div>
								<div class="detail_info">
									<table class="tbl_basic">
										<caption>디자인에 대한 상세정보입니다.</caption>
										<col class="bd_title02">
										<col>
										<tbody>
											<tr>
												<th scope="row" class="bd_title02">제목</th>
												<td id="deName"></td>
											</tr>
											<tr>
												<th scope="row">상세내용</th>
												<td id="deDetail"> </td>
											</tr>
											<tr>
												<th scope="row">콘텐츠 크기</th>
												<td id="deFeilSize"> </td>
											</tr>
											<tr>
												<th scope="row">콘텐츠 형식</th>
												<td id="deFeilType"> </td>
											</tr>
										</tbody>
									</table>
									<!-- <p class="info_category"><span class="category_tag">#섬세한</span><span class="category_tag">#모던한</span><span class="category_tag">#심볼형</span><span class="category_tag">#식품</span></p> -->
									<div class="info_detail">
										<strong>콘텐츠 유의사항</strong>
										<div>
											<ul class="list_type01">
												<li>콘텐츠 가이드라인의 규정사항을 엄격히 준수해야 하며 임의로 가이드라인 내용의 전체 또는 부분을 수정하거나 변형할 수 없습니다.</a></li>
												<li>본 콘텐츠는 제주특별자치도 경제통상진흥원의 이미지 자산이므로 외부에 유출하거나 무단으로 복제할 수 없습니다.</li>
												<li>본 콘텐츠를 활용하여 제작, 발주할 때에는 해당 항목만 발췌하여 제시해야 합니다.</li>
												<li>각 농산물 패키지 제작 시에는 제작 규정을 엄수해야 하나, 자체 브랜드 표기 공간에는 상황과 내용에 맞춰 응용할 수 있습니다.</li>
											</ul>
										</div>
									</div>
									<div class="bd_btn_area center">
										<a href="#" class="mo_wd50 btn bg_blue" id="dsnLike">♡ 찜하기 취소</a>
										<a href="#" class="mo_wd50 btn_black icon_down" id="imgDownload" >다운로드</a>
									</div>
								</div>
							</div>
						</div>
						<a href="#" class="pop_close">팝업 닫기</a>
					</div>
					<!-- //이미지 상세보기 모달팝업 -->
					<div class="pop_modal_bg"></div>
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->
		
		
</form:form>
<script>
function go_detail(no) {
	<%if(memVO == null){ %>
		$(".design_detail_view").css('display','none');
		alert('로그인 해주세요.');
		$("#loginChk").click();
		 return false;
	<%} %>

		$.ajax({
			url : "/front/dBank/dBankDetailJson.do",
			data : {"dsnSeq": no
			},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			async:false,
		    success: function(data){
		    	
		    	$('#deName').html('');
		    	$("#deName").append(data.dsnNm);
		    	$('#deDetail').html('');
		    	$("#deDetail").append(data.detail);
		    	
		    	var bytes = parseInt(data.fileSize);
		        var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
		        var e = Math.floor(Math.log(bytes)/Math.log(1024));
		        if(e == "-Infinity") {
		        	var fileSize = "0 "+s[0];
		        } 
		        else {	        	
		        	var fileSize = (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
		        }
		    	
		    	$('#deFeilSize').html('');
		    	$("#deFeilSize").append(fileSize);
		    	
		    	
		    	//$("#ptplNo").val(data.ptplNo);
		    	$("#name").append("<input type='hidden' id='dsnSeq' name='dsnSeq' value='" + data.dsnSeq + "' />"); 
		    	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+data.thumFileSeq);
		    	$("#imgDownload").attr("href", "/imagefile/download.do?file_no="+data.fileSeq);
		    	$("#imgDownload").attr("onclick", "insertDownInfo('"+data.dsnSeq+"')");
		    	$("#dsnLike").attr("onclick", "deleteLikeInfo('"+data.dsnSeq+"')");
		    	
		    	var fileNm = fileType(data.fileNm);
		    	$('#deFeilType').html('');
		    	$("#deFeilType").append(fileNm);
		    
		    	
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	
}
/**
 * 파일명에서 확장자명 추출
 */
 function fileType(fileNm) {
	 
	    var fileLength = fileNm.length;
	    var dot = fileNm.lastIndexOf('.');
	 
	    var fileType = fileNm.substring(dot+1, fileLength).toUpperCase();
	 
	    return fileType;
}

 function deleteLikeInfo(no) {
		<%if(memVO == null){ %>
			alert('로그인 해주세요.');
			$("#loginChk").click();
			 return false;
		<%} %>
			var memId = "${memVO.memId}";
			var memSeq = "${memVO.memSeq}";
			var formData = new FormData();
			formData.append("dsnSeq", no);
			formData.append("memId", memId);
			formData.append("memSeq", memSeq);
			
			console.log(formData);
			if(!confirm('찜한목록에서 삭제하시겠습니까?')) {
				return;
			} else {
				$.ajax({
					url : "/front/mypage/deleteLikeInfo.do",
					data : formData ,
					processData : false,
					contentType : false,
					async : false,
					type : "POST",
					dataType : "text",
				    success: function(rs){
				    	if(rs == "Y") {
				        	alert("삭제되었습니다.");
				        	location.reload();
				    	} else if(rs == "N") {
				    		/* alert("이미 저장된 디자인입니다."); */
				    	}
				    },
				    error:function(){
				        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
				    }
				});	
			}
	}
</script>