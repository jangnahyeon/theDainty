<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<script type="text/javascript">
			
	$(document).ready(function() {
	      
		var _path = window.location.pathname;
		$.ajax({
		    url: "/admin/menu/leftMenu.do",
		    data : {"path" : _path},
		    type: "POST",
			async : false,
		    dataType: "html",
		    success: function(res){
		    	$("#leftmenu").empty();
				$("#leftmenu").append(res);
		    },
		    error:function(request, status, error){
		    }
		});

		
	});

 </script>
<!-- leftmenu s -->
<div id="leftmenu" class="leftWrap">			 			
	  <ul class="leftMenu">
					<li><a href="imageList.do">이미지 등록</a>						
						<ul style="display:block;">
							<li><a href="#" class="">이미지 조회</a></li>
							<li><a href="#" class="">이미지 정보 관리</a></li>
						</ul>
					</li>
					<li><a href="#">이미지 신청 관리</a>
					</li>
					<li><a href="imageList.do">용어관리</a>						
						<ul style="display:block;">
							<li><a href="/admin/word/selectWordList.do" class="">용어조회</a></li>
							<li><a href="/admin/word/wordInquiryList.do" class="">용어관리</a></li>
						</ul>
					</li>
					<li><a href="imageList.do">Q&A관리</a>						
						<ul style="display:block;">
							<li><a href="/admin/faq/faqInquiryList.do" class="">Q&A 조회</a></li>
							<li><a href="/admin/faq/faqInquiryList.do" class="">Q&A 관리</a></li>
						</ul>
					</li>
					<li><a href="imageList.do">공지사항관리</a>						
						<ul style="display:block;">
							<li><a href="/admin/commuty/commutyInquiryList.do?menu_id=gongji" class="">공지사항 관리</a></li>
						</ul>
					</li>
					<li><a href="imageList.do">상담관리</a>						
						<ul style="display:block;">
							<li><a href="/admin/consult/counSearchList.do?menu_id=sangdam" class="">상담 관리</a></li>
						</ul>
					</li>
			    </ul>
</div>
<!-- // leftmenu e -->