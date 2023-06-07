<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>		



<script>
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/front/dBank/dBankList.do'/>";
   	document.getElementById("listForm").submit();
}
function enterkey() {
	if(window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		go_search();
	}
}
function go_search() {
	document.getElementById("listForm").action = "<c:url value='/front/dBank/dBankList.do'/>";
   	document.getElementById("listForm").submit();
} 
</script>
<form:form modelAttribute="searchVO" name="listForm" id="listForm" method="post">
	<form:hidden path="pageIndex" />
	<form:hidden path="searchKeyword2" />	
<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
				
				<h3>패키지 디자인 소스</h3>
				<div class="bd_top_style">
					<div class="area_left">
						<p class="bd_info_page">총 <span>${paginationInfo.totalRecordCount}</span>건 <strong><em>${paginationInfo.currentPageNo}</em>/<span>${paginationInfo.totalPageCount}</span>페이지</strong></p>
						
						<div class="selec_area">
							<span class="select_btn">검색조건 </span>
							<form:select path="searchCondition" id="sel_area">
								<form:option value="">전체</form:option>
								<form:option value="0">내용</form:option>
								<form:option value="1">이미지명</form:option>
							</form:select>
						</div>
					</div>
					
					<fieldset class="bd_sel_search">
						<legend>검색</legend>
						<label for="sear_word" class="focus_tit">검색어를 입력하세요</label>
						<form:input path="searchKeyword" onkeypress="enterkey()" onkeyup="javascript:enterkey();" id="sear_word"/>
						<input type="button" value="검색"onclick="javascript:go_search()">
					</fieldset>					
				</div>
				<c:if test="${!empty searchVO }">
				<!-- 이미지게시판 -->
				<ul class="lst_thum row01">
					<c:forEach var="result" items="${resultList}" varStatus="vs">
					<li>
						<em class="info_favorite"><button class="icon_heart"></button></em>
						<a href=".design_detail_view" onclick="showLayer(this,'.pop_modal');go_detail('${result.imgNo}');return false;">
							<span class="info_item"><i><img src="/imagefile/preview.do?fileSeq=${result.fileSeq }"  alt=""></i></span>
							<strong>${result.imgNm }</strong>
							
							<span class="info_over">
								<strong>${result.imgNm }</strong>
								<span class="info_btn"><em class="btn">자세히보기</em></span>
							</span>
						</a>
					</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${empty searchVO }">
					<ul class="row01">
						<li class="no_data">현재 등록된 디자인이 없습니다.</li>
					</ul>
				</c:if>
				<!-- //이미지게시판 -->
				
				<div class="pagination">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
				</div>
				
				<div class="bd_btn_area center">
					<a href="" onclick="" class="btn_black icon_write">글쓰기</a>
				</div>
				
				<!-- 이미지 상세보기 모달팝업 -->
					<div class="pop_modal design_detail_view">
						<div class="pop_design_view"> 
							<h4 class="title">이미지 상세보기</h4>
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
												<td id="deImgNm"></td>
											</tr>
											<tr>
												<th scope="row">상세내용</th>
												<td id="deImgDetail"> </td>
											</tr>
											<tr>
												<th scope="row">콘텐츠 정보</th>
												<td>5915*4225 / 71MB </td>
											</tr>
										</tbody>
									</table>
									<!-- <p class="info_category"><span class="category_tag">#섬세한</span><span class="category_tag">#모던한</span><span class="category_tag">#심볼형</span><span class="category_tag">#식품</span></p> -->
									<div class="info_detail">
										<strong>콘텐츠 유의사항</strong>
										<div>
											<ul class="list_type01">
												<li>로그인 후 다운로드가 가능합니다.</a></li>
												<li>인물 콘텐츠의 명예훼손적 이용을 금합니다.</li>
												<li>일부 피사체는 초상권, 재산권, 지식재산권 확인이 필요합니다.</li>
												<li>인공지능(AI), NFT, 빅데이터의 분석가공 등에 사용을 금합니다.</li>
											</ul>
										</div>
									</div>
									<div class="bd_btn_area center">
										<a href="#" class="mo_wd50 btn bg_blue">♡ 찜하기</a>
										<a href="#" class="mo_wd50 btn_black icon_down" id="imgDownload">다운로드</a>
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

	var arrFileSeq = [];
	

	$.ajax({
		url : "/front/dBank/dBankDetailJson.do",
		data : {"imgNo": no
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	
	    	$('#deImgNm').html('');
	    	$("#deImgNm").append(data.imgNm);
	    	$('#deImgDetail').html('');
	    	$("#deImgDetail").append(data.imgDetail);
	    	
	    	//$("#ptplNo").val(data.ptplNo);
	    	$("#imgNm").append("<input type='hidden' id='imgNo' name='imgNo' value='" + data.imgNo + "' />"); 
	    	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
	    	$("#imgDownload").attr("href", "/imagefile/download.do?file_no="+data.fileSeq);
	    	
	    	/* if(data.multiSeq == null) {
	    		$("#multi_img").html('');
	    	} else {
		    	arrFileSeq = data.multiSeq.split(",");
		    	var fileNum = arrFileSeq.length;
		    	
		    	var addMultiFile = "<div class='swiper-slide' style='width:91.6px'><div class='slider_img'><img id='multi_img_no' onclick='imgClick("+data.fileSeq+")'/></div></div>";
		    	for(var i = 0; i < fileNum; i++) {
		    		addMultiFile +="<div class='swiper-slide' style='width:91.6px'><div class='slider_img'><img id='multi_img_no"+ i +"' onclick='imgClick("+arrFileSeq[i]+")'/></div></div>";
		    	}
		    	
		    	$("#multi_img").html(addMultiFile);
		    	
		    	$("#multi_img_no").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
		    	for(var i = 0; i < fileNum; i++) {
			    	$("#multi_img_no"+i).attr("src", "/imagefile/preview.do?fileSeq="+arrFileSeq[i]);
		    	}
	    	} */
	    
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	

	
}
</script>