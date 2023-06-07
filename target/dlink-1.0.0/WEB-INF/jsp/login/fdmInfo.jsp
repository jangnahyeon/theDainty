<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="제주특별자치도 D.Link" />
	<meta name="description" content="제주특별자치도, D.Link">
	
	<title>D.Link</title>

	<link rel="stylesheet" type="text/css" href="/DLink/HTML/css/style.css">
	<link rel="SHORTCUT ICON" href="/DLink/HTML/images/common/favicon.ico">
	<script type="text/javascript" src="/DLink/HTML/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-ui.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/jquery-tjgallery.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML/js/common.js"></script>

</head>
<body id="">
<script type="text/javascript">
	var idx = 0;
	$(document).ready(function() {
		$(".tablist li").click(function() {
		  idx = $(this).index();
		  $(".tablist li").removeClass("on");
		  $(".tablist li").eq(idx).addClass("on");
		  $(".login_body > div").hide();
		  $(".login_body > div").eq(idx).show();
		  
		  $("[name='type']").val(idx);
		})
	  });
	
	function Search(type){
		var url = '';
		var userId = '';
		var userEmail = '';
		var userNm = '';
		
		if(type == 'ID'){
			url = "/front/loginSearch/searchId.do";
			userEmail = $("#id_user_mail").val();
			userNm = $("#id_user_name").val();
		} else if(type == 'PSW') {
			url = "/front/loginSearch/searchPsw.do";
			userId = $("#psw_user_id").val();
			userEmail = $("#psw_user_mail").val();
			userNm = $("#psw_user_name").val();
		}

		$.ajax({
		    type: "POST",
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    url: url,
		    data : {"email":userEmail,"name":userNm,"loginId":userId},
		    dataType: "text",
		    success: function(data){
		    	if(data != null){
		        	if(data == "infoFail"){
		        		alert( "일치하는 정보가 없습니다.");
		        	}else if(data == "fail"){
		        		alert( "실패했습니다. \n관리자에게 문의바랍니다.");
		        	} else if(data == "suc") {
		        		alert("이메일로 전송하였습니다.");
		        	}
		        }
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
		
	}
	
	
</script>
<div class="skiptoContent">
	<a href="#container_wrap">본문내용 바로가기</a>
</div>
<!-- wrap s -->
<div id="wrap" class="login_wrap">
	<!-- logon_area -->
	<div id="member_box">
		<h1 class="logo"><span class="only">DLink</span></h1>
		<div class="member_tit"><h3>아이디/비밀번호 찾기</h3></div>
		<div class="login_form">
			<ul class="tablist">
				<li class="tab on"><a href="#">아이디찾기</a></li>
				<li class="tab"><a href="#">비밀번호찾기</a></li>
			</ul>
			<div class="login_body">
				<div class="on">
					<p class="member_info">이름과 이메일, 휴대폰번호로 가입여부와 아이디를 확인합니다.</p>
					<fieldset>
						<legend>아이디찾기</legend>
						<p><label for="user_name" class="focus_tit">이름</label><input type="text" id="id_user_name" name="id_user_name"></p>
						<p><label for="user_mail" class="focus_tit">가입메일주소</label><input type="text" id="id_user_mail" name="id_user_mail"></p>
						<span><input type="button" value="아이디찾기" onclick="Search('ID')"></span>
					</fieldset>
					<ul class="login_btn">
						<li><a href="/front/login.do">로그인하기</a></li>
					</ul>
				</div>
				<div>
					<ul class="member_info list_type01">
						<li>비밀번호찾기를 완료 하시면 임시 비밀번호를 SMS 및 이메일로 발송합니다.</li>
						<li>전송 받으신 비밀번호로 로그인 후 <strong class="">마이페이지 &gt; 회원정보수정</strong> 메뉴에서 필히 비밀번호를 수정하시기 바랍니다.</li>
					</ul>
					<fieldset>
						<legend>비밀번호찾기</legend>
						<p><label for="user_name" class="focus_tit">이름</label><input type="text" id="psw_user_name" name="psw_user_name"></p>
						<p><label for="user_id" class="focus_tit">아이디입력</label><input type="text" id="psw_user_id" name="psw_user_id"></p>
						<p><label for="user_mail" class="focus_tit">이메일입력</label><input type="text" id="psw_user_mail" name="psw_user_mail"></p>
						<span><input type="button" value="비밀번호찾기" onclick="Search('PSW')"></span>
					</fieldset>
					<ul class="login_btn">
						<li><a href="/front/login.do">로그인하기</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="login_footer">
			<p>Copyright ⓒ <strong>DLink.</strong> All rights reserved.</p>
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>