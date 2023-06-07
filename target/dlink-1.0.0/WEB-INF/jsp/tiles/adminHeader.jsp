<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<!-- header -->
			<script type="text/javascript">
			
			$(document).ready(function() {
			      var params = "";
			      
			      munuSetting();
// 			      $.ajax({
// 			         type : "POST",
// 			         url : "/sessionlogout.do",
// 			         data : params,
// 			         dataType : "text",
// 			         success : function(rst) {
// 			            if (rst != null) {
// 			               if (rst == "N") {
// 			                  alert("세션값이 만료되었습니다.다시 로그인해주세요.");
// 			                  location = "/backend/login.do";
// 			                  return;
// 			               } else if (rst == "Y") {
// 			                  return;
// 			               }
// 			            }
// 			         }
// 			      });



				
			});

			function munuSetting() {
				$("#gnb ul li").remove();
				$.ajax({
					url : "/admin/menu/header.do",
					dataType : "json",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					type : "POST",
				    success: function(arr){
				    	$.each(arr, function(idx, val) {
				    		$("#gnb ul").append('<li><a href="'+val.menuPath+'">'+val.menuNm+'</a></li>');
				    	});
				    },
				    error:function(){
				        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
				    } 
				});
				
			}
			

			
			var tid;
			var cnt = parseInt(1800);
			function counter_init() {
				tid = setInterval("counter_run()", 1000);
			}
			
			function counter_reset() {
				clearInterval(tid);
				cnt = parseInt(1800);
				counter_init();
			}
			
			function counter_run() {
				document.all.counter.innerText = time_format(cnt);
				cnt--;
				if(cnt < 0) {
					clearInterval(tid);
					alert("유효 시간이 만료되었습니다. 다시 로그인 하세요")
					self.location = "/logout/admin.do";
				}
			}
			
			function time_format(s) {
				var nMin = 0;
				var nSec = 0;
				if(s > 0) {
					nMin = parseInt(s/60);
					nSec = s % 60;
				}
				if(nSec < 10) nSec = "0" + nSec;
				if(nMin < 10) nMin = "0" + nMin;
				
				return nMin + ":" + nSec + " ";
			}
			 </script>
			<!-- header -->
				<header id="header_wrap">
					<div id="header"> 
						<!-- logo  -->
						<h1 class="logo"><a href="CodeMang.do">D.Link관리자시스템</a></h1>
						<!-- //logo --> 
			
						<!-- global -->
						<div id="global_wrap">
							<ul id="util">
								<li><span id="counter"></span><input type="button" value="연장" onclick="counter_reset()"></li>
								<li><a href="#none"><strong class="user">로그인 (<%=loginVO.getLoginId()%>)</strong></a></li>
								<li class="logout" title="로그아웃"><a href="/logout/admin.do" onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a></li>
								<li class="mypage" title="마이페이지"><a href="/">마이페이지</a></li>
							</ul>
						</div>
						<!-- //global -->
						<!-- gnb -->
						<nav class="gnb" id="gnb">
							<ul>
									<li><a href="CodeMang.do">기준정보관리</a></li>
								<li><a href="DeptSelect.do">회원관리</a></li>
								<li><a href="RegUserList.do">전문회사관리</a></li>
								<li><a href="imageList.do">디자인뱅크</a></li>
								<li><a href="#">전시관리</a></li>
								<li><a href="adm_consulting.do">상담관리</a></li>
								<li><a href="/admin/word/selectWordList.do">커뮤니티</a></li>
							</ul>
						</nav>
						<!-- //gnb -->
						
					</div>
				</header>
				<div class="modal_header_wrap"></div>
				<!-- //header --> 
			<script>
				counter_init();
			</script>
			
				
	<!-- //header --> 