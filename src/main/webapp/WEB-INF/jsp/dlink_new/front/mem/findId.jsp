<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="제주특별자치도 D.Link" />
	<meta name="description" content="제주특별자치도, D.Link">
	<title>D.Link</title>

	<script type="text/javascript" src="/DLink/HTML_2023/js/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery-3.6.0.min"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/common.js"></script>
	<script type="text/javascript" src="/DLink/HTML_2023/js/jquery.min.js"></script>

	<link rel="stylesheet" type="text/css" href="/DLink/HTML_2023/css/style.css">

	<%@ include file="/WEB-INF/jsp/dlink_new/tiles/front/script.jsp" %>
	
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
		
		function fn_find_act() {
			console.log("fn_find_act");
			
			switch(idx) {
			case 0:
				fn_find_id_act();
				break;
				
			case 1:
				fn_find_pw_act();
				break;
				
			default:
				break;
			}
		}
		
		function fn_find_id_act() {
			
			var memNm_1 = $("#memNm_1").val();
			if( !memNm_1 ) {
				alert("이름을 입력해주세요.");
				$("#memNm_1").focus();
				return;
			}
			
			var email_1 = $("#email_1").val();
			if( !email_1 ) {
				alert("이메일을 입력해주세요.");
				$("#email_1").focus();
				return;
			}
			
			var regexEmail_1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if( !regexEmail_1.test(email_1) ) {
				alert("이메일 형식이 맞지 않습니다.");
				$("#email_1").focus();
				return;
			}
			
			$.ajax({
				url : "/front/mem/findId_act.do",
				data : {
					"memNm" : memNm_1,
					"email" : email_1
				},
				dataType : "json",
				type : "post",				
				success : function(res) {
					if( res ) {
						if( "Y" == res.result ) {
							alert("아이디는 " + res.memId + "입니다.");
						} else {
							alert("아이디가 존재하지 않습니다.");
						}
					}
				},
				error : function(err) {
					alert("아이디가 존재하지 않습니다..");
				}
			});
			
		}
		
		function fn_find_pw_act() {
			var memNm_2 = $("#memNm_2").val();
			if( !memNm_2 ) {
				alert("이름을 입력해주세요.");
				$("#memNm_2").focus();
				return;
			}
			
			var memId_2 = $("#memId_2").val();
			if( !memId_2 ) {
				alert("아이디를 입력해주세요.");
				$("#memId_2").focus();
				return;
			}
			
			var email_2 = $("#email_2").val();
			if( !email_2 ) {
				alert("이메일을 입력해주세요.");
				$("#email_2").focus();
				return;
			}
			
			var regexEmail_2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if( !regexEmail_2.test(email_2) ) {
				alert("이메일 형식이 맞지 않습니다.");
				$("#email_2").focus();
				return;
			}
			
			var hp_2 = $("#hp_2").val();
			if( !hp_2 ) {
				alert("휴대폰번호를 입력해주세요.");
				$("#hp_2").focus();
				return;
			}
			
			$.ajax({
				url : "/front/mem/findPw_act.do",
				data : {
					"memNm" : memNm_2,
					"memId" : memId_2,
					"email" : email_2,
					"hp" : hp_2
				},
				dataType : "json",
				type : "post",				
				success : function(res) {
					if( res ) {
						if( "Y" == res.result ) {
							alert("임시 비밀번호는 [" + res.memPw + "] 입니다.");
						} else {
							alert("비밀번호찾기에 실패하였습니다.");
						}
					}
				},
				error : function(err) {
					alert("비밀번호찾기에 실패하였습니다..");
				}
			});
		}
		
		const regexPhoneNumber = (target) => {
		      target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
	</script>

</head>
<body>

<div class="skiptoContent">
	<a href="#container_wrap">본문내용 바로가기</a>
</div>
<!-- wrap s -->
<div id="wrap" class="login_wrap">
	<!-- logon_area -->
	<div id="member_box">		
		<h1 class="logo"><a href="/front/main.do" title="홈으로 이동"><span class="only">DLink</span></a></h1>
		<div class="member_tit"><h3>아이디/비밀번호 찾기</h3></div>
		<form name="Frm" method="post" action="" onSubmit="fn_find_act(); return false;">
		<div class="login_form">
			<ul class="tablist">
				<li class="tab on"><a href="#">아이디찾기</a></li>
				<li class="tab"><a href="#">비밀번호찾기</a></li>
			</ul>
			<div class="login_body">
				<div class="on">
					<p class="member_info">이름과 이메일로 가입여부와 아이디를 확인합니다.</p>
					<fieldset>
						<legend>아이디찾기</legend>
						<p><label for="memNm_1" class="focus_tit">이름</label><input type="text" id="memNm_1" maxlength="50"></p>
						<p><label for="email_1" class="focus_tit">가입메일주소</label><input type="text" id="email_1" maxlength="50"></p>
						<span><input type="submit" value="아이디찾기"></span>
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
						<p><label for="memNm_2" class="focus_tit">이름</label><input type="text" id="memNm_2" maxlength="50"></p>
						<p><label for="memId_2" class="focus_tit">아이디입력</label><input type="text" id="memId_2" maxlength="50"></p>
						<p><label for="email_2" class="focus_tit">이메일입력</label><input type="text" id="email_2" maxlength="50"></p>
						<p><label for="hp_2" class="focus_tit">휴대폰번호입력</label><input type="text" id="hp_2" maxlength="13" oninput="regexPhoneNumber(this);"></p>
						<span><input type="submit" value="비밀번호찾기"></span>
					</fieldset>
					<ul class="login_btn">
						<li><a href="/front/login.do">로그인하기</a></li>
					</ul>
				</div>
			</div>
		</div>
		</form>
		<div class="login_footer">
			<p class="copy">Copyright ⓒ 제주특별자치도 경제통상진흥원</p>
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>