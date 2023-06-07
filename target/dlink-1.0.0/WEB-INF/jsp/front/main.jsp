<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>

<script type="text/javaScript" language="javascript" defer="defer">
var ptplList = ["PA0001","PA0002","PA0003","PA0004","PA0005","PA0006","PA9999"];

$(function(){
	
	//배너
	$.ajax({
		type:"GET",
		corssDomain : false,
		url : "/front/banner.do",
		dataType: "html",
		cache: false,
		success : function(html){
				$(".main_visual_wrap").empty();
				$(".main_visual_wrap").html(html);
		}
	});
	
	
	
	$.ajax({
		type:"GET",
		corssDomain : false,
		
		url : "/front/news.do",
		dataType: "html",
		cache: false,
		success : function(html){
			$("#main_news").empty();
			$("#main_news").html(html);
		}
	});
	

	ptplList.forEach(function(item,index,arr2){ 
		
		$.ajax({
			type:"GET",
			corssDomain : false,
			url : "/front/ptpl.do",
			data : {"ptplPart":item},
			dataType: "html",
			cache: false,
			success : function(html){
				$("#portfolio"+ (index + 1)).empty();
				$("#portfolio"+ (index + 1)).html(html);
			}
		});
		
	})
	
}); //document Ready End


 
 

function favoriteYn(ptplNo){
	var loginId = $("#loginId").val();
	
	<%if(loginVO == null){ %>
		alert("로그인해주세요");
	<%}%>
	
	$.ajax({
	    type: "POST",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/front/portfolio/portfolioFavoriteAjax.do",
	    data : {ptplNo:ptplNo},
	    dataType: "text",
	    success: function(data){
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}



function go_detail(no) {
	$.ajax({
		url : "/front/portfolio/selectPortfolioJson.do",
		data : {"ptplNo": no
		},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		async:false,
	    success: function(data){
	    	
	    	$('#comNm').html('');
	    	$("#comNm").append(data.comNm);
	    	$('#ptplNm').html('');
	    	$("#ptplNm").append(data.ptplNm);
	    	$('#ptplPart').html('');
	    	$("#ptplPart").append(data.ptplPartNm + "&nbsp;&nbsp;&nbsp;〉" + data.ptplYouhaengNm);
	    	$("#concept").html('');
	    	$("#concept").append(data.concept);	  
	    	$("#ptplNo").val(data.ptplNo);
	    	/* $("#ptplNo").append("<input id='ptplNo' name='ptplNo' value='" + data.ptplNo + "' />"); */
	    	$("#title_img").attr("src", "/imagefile/preview.do?fileSeq="+data.fileSeq);
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
	    	
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
	
	
}


//Popup modal style
function showLayer_portfolio(self,obj,ptplNo){
	
	<%if(loginVO == null){ %>
		alert('로그인 해주세요.');
		 location.href = "/front/login.do";
		 
		 return false;
	<%} %>
	
	var $self = $(self);
	var $target = $($self.attr('href'));
	var _pWidth = $target.width()/2;
	var _pHeight = $target.height()/2;
	$('.pop_modal_bg').show();
	$('.modal_header_wrap').css('display','block');
	$('#header_wrap').addClass('no_shadow');
	if($(window).width()<668){
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').css('z-index','2');
	}
	
	document.getElementById("ptplNo").value = ptplNo;

	//$('#ptplNo').val(ptplNo);
	scrollNone();

	$target.attr('tabindex', '0').show().focus();
	$(obj).css({"margin-top":"-"+ _pHeight +"px","margin-left":"-"+ _pWidth +"px"})
	$(obj).find(".pop_close").click(function(){
		hideLayer();
	});

	//키보드 포커스 popup modal 영역운영
	var 
		firstElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':first'),
		lastElement = $target.find("div[tabindex='0'],a,input:not([disabled='disabled']),select,button,textarea").filter(':last');
		firstElement.off("keydown").on("keydown",function(b){
			if(b.keyCode == 9 && b.shiftKey){
				b.preventDefault();
				lastElement.focus();
			}
		});

	lastElement.off("keydown").on("keydown",function(b){
		if(b.keyCode == 9 && b.shiftKey){
		} else if (b.keyCode == 9){
			b.preventDefault();
			firstElement.focus();
		}
	});

	function hideLayer(){
		$(obj).hide();
		$(obj).removeAttr('tabindex');
		$('.pop_modal_bg').hide().css({'top':'0','height':'100%'});
		$('.modal_header_wrap').css('display','none');
		$('#header_wrap').removeClass('no_shadow').css('z-index','101');
		scrollBlock();
		$self.focus();
		$(this).off('click');
	}
}
</script>

	
	<!-- visual area s-->
	<div class="main_visual_wrap">
<!-- 		<div class="swiper m_visual"> -->
<!-- 		  <div class="swiper-wrapper"> -->
<!-- 			<div class="swiper-slide"><a href="#m_visualZone"><span class="m_visual_thum"><img src="/DLink/HTML/images/main/main_thum_visual01.jpg" alt=""></span></a></div> -->
<!-- 			<div class="swiper-slide"><a href="#m_visualZone"><span class="m_visual_thum"><img src="/DLink/HTML/images/main/main_thum_visual02.jpg" alt=""></span></a></div> -->
<!-- 		  </div> -->
<!-- 		  <div class="swiper-button-next"></div> -->
<!-- 		  <div class="swiper-button-prev"></div> -->
<!-- 		  <div class="swiper-pagination"></div> -->
<!-- 		</div> -->
	</div>
	<!-- visual area e -->
	
	<!-- container_wrap -->
	<div id="wrap_container">
	
		<div class="m_wrap_content">
			<!-- 포트폴리오 -->
			
			<div id="portfolio1"></div>
			
			<div id="portfolio2"></div>
			
			<div id="portfolio3"></div>
			
			<div id="portfolio4"></div>
			
			<div id="portfolio5"></div>
			
			<div id="portfolio6"></div>
			
			<div id="portfolio7"></div>
			
			<!-- 공지사항 -->
			<div class="group wrap_news" id="main_news">
			
			</div>
			<!-- //공지사항 -->
			
			
			<!-- 디자인 상세보기 모달팝업 -->
			<div class="pop_modal design_detail_view">
				<div class="pop_design_view"> 
					<h4 class="title">디자인 상세보기</h4>
					<div class="detail_design">
						<div class="detail_img">
							<span><img src="../images/ex/design_view.jpg" alt="" /></span>
							<div class="swiper-container" id="slider_list">
								<div class="swiper-wrapper">
									<div class="swiper-slide close">
										<div style="">
											<div class="slider_img">
												<img src="../images/ex/i_1.jpg" alt="" />
											</div>
										</div>
									</div>
								</div>
								 <div class="slideCtrl">
									<div class="swiper-button-prev"></div>
									<div class="swiper-pagination"></div>
									<div class="swiper-button-next"></div>
								</div>
							</div>
						</div>
						<div class="detail_info">
							<table class="tbl_basic">
								<caption>디자인에 대한 상세정보입니다.</caption>
								<col class="bd_title">
								<col>
								<tbody>
									<tr>
										<th scope="row" class="bd_title">주관기관</th>
										<td id="comNm">
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td id="ptplNm"></td>
									</tr>
									<tr>
										<th scope="row">분야</th>
										<td id="ptplPart"></td>
									</tr>
								</tbody>
							</table>
							<p class="info_category"></p>
							<div class="info_detail">
								<li>
									<strong>design concept</strong>
									<div id="concept">
											
									</div>
								</li>
							</div>
						</div>
					</div>
				</div>
				<a href="#none" class="pop_close">팝업 닫기</a>
			</div>
			<!-- //디자인 상세보기 모달팝업 -->
			
			
			
			<div class="pop_modal_bg"></div>
				
				
		</div>
	</div>
	<!-- //container_wrap -->