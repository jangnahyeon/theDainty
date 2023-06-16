<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="Dainty 관리자시스템" />
<meta name="description" content="Dainty, 관리자시스템">
<title>Dainty 관리자시스템</title>

<link rel="stylesheet" type="text/css" href="/DLink/admin2_html/css/style.css">

<script type="text/javascript" src="/DLink/admin2_html/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/DLink/admin2_html/js/common.js"></script>

<c:forEach var="menu1" items="${adminMenuList1 }">
	<%-- url 찾기 --%>
	<c:if test="${empty url }">
		<c:set var="url" value="${menu1.menuUrl }" />
		
		<c:forEach var="menu2" items="${adminMenuList2 }">
    		<c:if test="${empty url && menu2.upMenuSeq eq menu1.menuSeq }">										
				<%-- url 찾기 --%>
				<c:set var="url" value="${menu2.menuUrl }" />
				
				<c:forEach var="menu3" items="${adminMenuList3 }">
					<c:if test="${empty url && menu3.upMenuSeq eq menu2.menuSeq }">
						<c:set var="url" value="${menu3.menuUrl }" />
					</c:if>
				</c:forEach>
			</c:if>
		</c:forEach>		
	</c:if>
</c:forEach>

<script type="text/javascript">

function go_submit() {
	console.log("submit");
	
	var mem_id = $("#mem_id").val();
	if(!mem_id) {
		alert("아이디를 입력해주세요");
		$("#mem_id").focus();
		return;
	}
	
	var mem_pw = $("#mem_pw").val();
	if(!mem_pw) {
		alert("비밀번호를 입력해주세요");
		$("#mem_pw").focus();
		return;
	}
	
	$.ajax({
		url : "/admin/login_act.do",
		data : {
			"memId" : mem_id,
			"memPw" : mem_pw
		},
		//dataType : "json",
		method : "post",
		success : function(res) {
			if(res == 'NOT_EXIST' || res == 'N' || res == 'PW_EMPTY'){
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			} else {
				var url = get_url(res);
			}
			
		},
		error : function(err) {
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
	});
}

function get_url(code) {
	
	$.ajax({
		url : "/admin/getUrl.do",
		data : {
			"code" : code
		},
		method : "post",
		success : function(res) {
			location.href = res;
		},
		error : function(err) {
			alert("오류가 발생하였습니다.")
		}
	});
}

</script>

</head>
<body>

<!-- wrap s -->
<div id="login_wrap" class="wrap">
	
	<!-- logon_area -->
	<div id="login_box">
		<h1 class="logo"><span class="only">D.link 관라자시스템</span></h1>
		<form name="Frm" method="post" action="javascript:go_submit();" onSubmit="">
		<div class="login_form">
			<div class="login_body">
				<fieldset>
					<legend>로그인</legend>
					<p><label for="mem_id" class="focus_tit id">아이디</label><input type="text" id="mem_id" name="mem_id" maxlength="50"></p>
					<p><label for="mem_pw" class="focus_tit pw">비밀번호</label><input type="password" id="mem_pw" name="mem_pw" maxlength="50"></p>
					<span><input type="submit" value="로그인" class="login_btn"></span>
				</fieldset>
			</div>
		</div>
		</form>
		<div class="login_footer">
			<!-- <p class="copy">Copyright ⓒ 제주특별자치도 경제통상진흥원</p> -->
		</div>
	</div>
	<!-- //logon_area -->
	
</div>
<!-- wrap e -->
</body>
</html>