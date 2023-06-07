<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<script type="text/javascript">

function fn_login() {
	//showLayer(this,'.pop_modal');
	
	/* $(".pop_model").trigger("click"); */
	$("#loginChk").trigger("click");
}

function fn_login_act() {
	//console.log("submit");
	
	var mem_id = $("#user_id").val();
	if(!mem_id) {
		alert("아이디를 입력해주세요");
		$("#user_id").focus();
		return;
	}
	
	var mem_pw = $("#user_pw").val();
	if(!mem_pw) {
		alert("비밀번호를 입력해주세요");
		$("#user_pw").focus();
		return;
	}
	
	$.ajax({
		url : "/front/login_act.do",
		data : {
			"memId" : mem_id,
			"memPw" : mem_pw
		},		
		method : "post",
		success : function(res) {
			
			if("Y" == res) {				
				
				if( location.href.includes("/front/login.do") ) {
					location.href = "/front/dlink/intro.do";
				} else {
					location.reload();
				}
				
			} else if( "OUT_MEM" == res ) {
				alert("탈퇴처리된 회원입니다.");
			} else {
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			}
			
		},
		error : function(err) {
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
	});
}

function fn_logout_act() {
	
	if( !confirm("로그아웃 하시겠습니까?") ) {
		return;
	}
	
	$.ajax({
		url : "/front/logout_act.do",
		data : "",		
		method : "post",
		success : function(res) {
			
			if("Y" == res) {
				
				location.reload();
				
			} else {
				alert("로그아웃에 실패하였습니다.");
			}
			
		},
		error : function(err) {
			alert("로그아웃에 실패하였습니다.");
		}
	});
}

</script>