<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
$(function() {
    var _html = '<li class="home"><a href="#home">home</a></li>';
    _html += '<li><a href="'+ $("#leftmenu h2").attr("url") +'">'+ $("#leftmenu h2").text() +'</a></li>';
    
    if($(".on").is("[dept='3']")){
    	
    	$(".con_title h3").text($("#leftmenu .on").text());
    	
    	_html += '<li><a href="'+ $("#leftmenu .on").attr("href") +'">'+ $("#leftmenu .on").text() +'</a></li>';
    	
    } else {
    	console.log("test");
    	$(".con_title h3").text($("#leftmenu .on").text());
    	
    	_html += '<li><a href="'+ $("#leftmenu .on").parent().parent().prev().attr("href") +'">'+ $("#leftmenu .on").parent().parent().prev().text() +'</a></li>';
    	_html += '<li><a href="'+ $("#leftmenu .on").attr("href") +'">'+ $("#leftmenu .on").text() +'</a></li>';
    	
    	console.log("test@@");
    	//왼쪽 메뉴 class 추가
    	$(".on").parent().parent().prev().addClass("on");
    	console.log("test!!");
    }
    
    
    $(".snavi").html(_html);
});
</script>
<!-- 타이틀 s -->
				<div class="con_title">
				 	<h3>이미지등록</h3>
					<!-- 현재위치 표시 s -->
					<ul class="snavi">
						<li class="home"><a href="#home">home</a></li>
						<li><a href="#">디자인뱅크</a></li>
						<li><a href="#">이미지조회</a></li>
					</ul>
					<!-- 현재위치표시 e -->
				</div>
				<!-- 타이틀 e -->	