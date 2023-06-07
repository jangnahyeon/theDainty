<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	/* TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin"); */
%>

<!-- 팝업관련 s -->
<style>
	.container {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		align-items: flex-start;
		justify-content: flex-start;
		
		position: absolute;
		left: 0px;
		top: 0px;		
	}
	
	.popup {
		position: relative;
		top: 0px;
		left: 0px;
		z-index: 9998;
		visibility: visible;
		max-width: none;
		height: auto;
		border: 2px solid #404040;
		background: #ffffff;
	}
	
	.popup.imgPop {
		width: auto !important;
	}
	
	@media screen and (max-width: 1258px) {
		.popup {
    		width: auto !important;
    		height: auto !important;
    		margin-left: 0px !important;
    		margin-top: 0px !important;
    		top: 0% !important;
    		left: 0% !important;
    		transform: translate(0, 0);
  		}
  		
  		.popup.imgPop {
  			width: 320px !important;
  		}
	}
</style>

<div class="container">

	<%-- <div class="popup linkPop theme1" id="layer_0" style="display:none;">
		<div class="header">
	        <p tabindex="0">공지사항</p>
	    </div>
	    <div class="defaultText">
	    		<img src="/DLink/HTML_2023/images/common/foot_logo.png" alt="제주특별자치도 경제통상진흥원">
	    </div>  
	    <div class="inner">
	        <ul>
	        	<c:forEach var="popup" items = "${popupList}" varStatus="status" >
	            <li>
		            <a href="javascript:showPopup('show_${popup.popSeq}', '${popup.popupWidth}', '${popup.popupHeight}');">
		            <span>${popup.title } </span>
		            <i class="fas fa-arrow-right"></i>
		            </a>
	             </li>
	            </c:forEach>
	        </ul>
	    </div>
	    <div class="closeWrap clearfix">
	        <div class="leftbox"><input type="checkbox" name="closeModal1" id="closeModal_0" value="checkbox"><label for="closeModal_0"><i></i>오늘 하루 이 창을 열지 않습니다.</label></div>
	        <div class="rightbox"><a href="javascript:closePopup('0')" class="close" >닫기</a></div>
	    </div>
	</div> --%>

	<c:forEach var="popup" items = "${popupList}" varStatus="status" >		
		
			<div class="popup" id="show_${popup.popSeq}" style="display:none; z-index:9999;">
			    <%-- <div class="header">
			        <p tabindex="0">${popup.title}</p>
			    </div> --%>		      
			    <div class="inner">
			        <div class="pop-conts" >
			            <!--content //-->
			            <%-- <p class="ctxt mb20"><c:out value="${popup.pop_cont}" escapeXml="false"/></p> --%>
			            <c:out value="${popup.contents}" escapeXml="false" />
			            <!--// content-->
			        </div>
			    </div>
			    <div class="closeWrap clearfix">
			        <div class="leftbox"><input type="checkbox" name="closeModal1" id="closeModal_${popup.popSeq}" value="checkbox"><label for="closeModal_${popup.popSeq}"><i></i>오늘 하루 이 창을 열지 않습니다.</label></div>
			        <div class="rightbox"><a href="javascript:closeShowPopup('${popup.popSeq}');" class="close" >닫기</a></div>
			    </div>
			</div>
		
	</c:forEach>
	
</div>

<script type="text/javascript">
var cnt = 9999;
//이벤트 팝업
function openPopup(id, width, height, tpos, lpos){
	var divName = document.getElementById(id);
	divName.style.width = width + "px";
	divName.style.height = height + "px";
	divName.style.top = tpos + "px";
	divName.style.left = lpos + "px";
}

function showPopup(id, width, height ){
	/* $("#" + id).hide(); */
	var divName = document.getElementById(id);
	/* divName.style.width = width + "px";
	divName.style.height = height + "px"; */
	//divName.style.top = "100px";
	//divName.style.left = "460px";
	//divName.style.top = "";
	divName.style.zIndex = cnt; 
	$("#" + id).show();
	cnt++;
}


function openPopupList(id){
	 var divName = document.getElementById(id);
	 /* divName.style.width = "500px";
	 divName.style.height = "500px";
	 divName.style.top ="100px";
	 divName.style.left = "600px"; */
	 
	 $("#" + id).show();
}

//팝업 닫기
function closePopup(id){
	_this = $(this);
  var popupString = "layer_"+id;
  var flag = $('#closeModal_'+id).is(":checked");
	if(flag == true){
		//쿠키세팅(그냥닫기 오늘안보기)
		setCookie(popupString,"end",1);
	 	$("#layer_"+id).css("display","none");
	}else{
		 $("#layer_"+id).css("display","none");
	}
}

//팝업 닫기
function closeShowPopup(id){
	_this = $(this);
  var popupString = "show_"+id;
  var flag = $('#closeModal_'+id).is(":checked");
	if(flag == true){
		//쿠키세팅(그냥닫기 오늘안보기)
		setCookie(popupString,"end",1);
	 	$("#show_"+id).css("display","none");
	}else{
		 $("#show_"+id).css("display","none");
	}
}

//주어진 이름의 쿠키를 반환하는데,
//조건에 맞는 쿠키가 없다면 undefined를 반환합니다.
function getCookie(name) {
	let matches = document.cookie.match(new RegExp(
	 "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	));
	return matches ? decodeURIComponent(matches[1]) : undefined;
}

function setCookie(name, value, options) {

	  options = {
	    path: '/'
	  };

	  if (options.expires instanceof Date) {
	    options.expires = options.expires.toUTCString();
	  }

	  let updatedCookie = encodeURIComponent(name) + "=" + encodeURIComponent(value);

	  for (var optionKey in options) {
	    updatedCookie += "; " + optionKey;
	    let optionValue = options[optionKey];
	    if (optionValue !== true) {
	      updatedCookie += "=" + optionValue;
	    }
	  }

	  document.cookie = updatedCookie;
	  
}

/* //Cookie Setting
function setCookie(cookie_name, value, days) {
	
   var exdate = new Date();
   exdate.setDate(exdate.getDate() + days);
   // 설정 일수만큼 현재시간에 만료값으로 지정
   var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
   document.cookie = cookie_name + '=' + cookie_value;
 } */

$(function(){
	
    //팝업 쿠키확인후 보여주기   	
   	<c:if test="${not empty popupList}">
   	
	   	var cookie = getCookie('layer_0');
		if(!cookie || 'end' != cookie) {
			openPopupList('layer_0');
		}
   	
		<c:set var="popup_y_cnt" value="0" />
	
   		<c:forEach var="popup" items = "${popupList}" varStatus="status">
            
			<c:if test="${popup_y_cnt < maxPopupCnt}">
            
            	<c:if test="${popup.useYn eq 'Y'}">
            	
		            var cookie = getCookie("show_${popup.popSeq}");
		            if(!cookie || 'end' != cookie) {
	            		$("#show_${popup.popSeq}").show();
		            }
		            
		            <c:set var="popup_y_cnt" value="${popup_y_cnt + 1}" />
		            
	            </c:if>
	            
	        </c:if>
            
        </c:forEach>
        
	</c:if> 
	
	<%-- 팝업관리 에디터 미리보기와 동일하게 --%>
	$(".popup .pop-conts table").css("table-layout", "auto");
	$(".popup .pop-conts p").css("line-height", "1.2");
	$(".popup .pop-conts span").css("line-height", "145%");

});

</script>

<script>
!function() {
    function addListener(element, type, callback, capture) {
        if (element.addEventListener) {
            element.addEventListener(type, callback, capture);
        } else {
            element.attachEvent("on" + type, callback);
        }
    }

    function draggable(element) {
        var dragging = null;

        addListener(element, "mousedown", function(e) {
            if( $(e.target).parent().hasClass("pop-conts") ){
                if( !element.style.left ){
                    element.style.left = $(element).css("left");
                }
                if( !element.style.top ){
                    element.style.top = $(element).css("top");
                }

                $(".popup").each( function(e){
                    if( $(this).attr("data-idx") === $(element).attr("data-idx") ){
                        $(element).css("z-index", 1002);
                    }else{
                        $(this).css("z-index", 1001);
                    }
                });


                var e = window.event || e;
                dragging = {
                    mouseX: e.clientX,
                    mouseY: e.clientY,
                    startX: parseInt(element.style.left),
                    startY: parseInt(element.style.top)
                };
                if (element.setCapture) element.setCapture();
            }
        });

        addListener(element, "losecapture", function() {
            dragging = null;
        });

        addListener(document, "mouseup", function() {
            dragging = null;
            if (document.releaseCapture) document.releaseCapture();
        }, true);

        var dragTarget = element.setCapture ? element : document;

        addListener(dragTarget, "mousemove", function(e) {
            if (!dragging) return;

            var e = window.event || e;
            var top = dragging.startY + (e.clientY - dragging.mouseY);
            var left = dragging.startX + (e.clientX - dragging.mouseX);
            element.style.top = (Math.max(0, top)) + "px";
            if( $(window).width() > left+$(element).outerWidth(true)){
                element.style.left = (Math.max(0, left)) + "px";
            }
        }, true);
    };

    $(".popup").each( function(idx){
        $(this).attr("data-idx", idx)
        draggable($(this)[0]);       
    });

}();
</script>
<!-- 팝업관련 e -->



	<!-- header -->
	<div id="header" class="">
		<div class="head">
			
			<h1><a href="/front/main.do">디자인을 잇다. 디링크</a></h1>
			<ul class="pc_nav">
				<!-- <li class="on"><a href="/">디링크</a>
					<div class="sub">
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인 스튜디오</a>
					<div class="sub">
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>
					</div>
				</li>
				<li><a href="/">디자인뱅크</a>
					<div class="sub">
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>
					</div>
				</li> -->
				
				<c:forEach var="menu1" items="${frontMenuList1 }">
					<li class="<c:if test="${menu1.menuSeq eq frontMenuVO1.menuSeq }">on</c:if>">
					
						<%-- url 찾기 --%>
						<c:set var="url" value="" />
						
						<c:forEach var="menu2" items="${frontMenuList2 }">
							<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
								<c:if test="${empty url && not empty menu2.menuUrl }">
									<c:set var="url" value="${menu2.menuUrl }" />
								</c:if>
								
								<c:forEach var="menu3" items="${frontMenuList3 }">
									<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					
						<a href="${url }">${menu1.menuNm }</a>
						<div class="sub">
							<ul>
								<c:forEach var="menu2" items="${frontMenuList2 }">									
								
									<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
										<li>
											<%-- url 찾기 --%>
											<c:set var="url" value="${menu2.menuUrl }" />
											<c:forEach var="menu3" items="${frontMenuList3 }">
												<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
													<c:if test="${empty url && not empty menu3.menuUrl }">
														<c:set var="url" value="${menu3.menuUrl }" />
													</c:if>
												</c:if>
											</c:forEach>
									
											<a href="${url }">${menu2.menuNm }</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</li>
				</c:forEach>
			</ul>	
			<div class="btns">
				<c:if test="${empty frontLoginVO }">
					<a class="header_btn" href=".login_view" onclick="showLayer(this,'.pop_modal');return false;" id="loginChk">로그인</a>
					<a class="header_btn" href="/front/join/joinMember1.do">회원가입</a>
				</c:if>
				<c:if test="${not empty frontLoginVO }">
					<a class="header_btn" href="javascript:fn_logout_act();">로그아웃</a>
					<a class="header_btn" href="/front/mypage/pkDsnList.do">마이페이지</a>
					<!-- <a class="header_btn" href="/">회원가입</a> -->
				</c:if>
				
				<div class="btn_menu">
					<div></div>
					<div></div>
					<div></div> 
				</div>
			</div>

		</div>
		<div class="sub_bg"></div>
		<div class="all_menu">
			<div class="menuwrap">
				<ul>
					<!-- <li class="dep1"><a>디링크</a>
						<ul>
							<li><a href="/">디링크소개</a></li>
							<li><a href="/">공지사항</a></li>
						</ul>
					</li>
					<li class="dep1"><a>디자인 스튜디오</a>
						<ul>
							<li><a href="/">시설소개</a></li>
							<li><a href="/">이용안내</a></li>
							<li><a href="/">촬영 포트폴리오</a></li>
							<li><a href="">시설예약</a></li>
						</ul>		
					</li>
					<li class="dep1"><a>디자인뱅크</a>
						<ul>
							<li><a href="/">패키지 디자인 소스</a></li>
							<li><a href="/">이미지 소스</a></li>
							<li><a href="/">영상 소스</a></li>
						</ul>		
					</li> -->
					
					<c:forEach var="menu1" items="${frontMenuList1 }">
						<li class="dep1">
						
							<%-- url 찾기 --%>
							<c:set var="url" value="" />
							
							<c:forEach var="menu2" items="${frontMenuList2 }">
								<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
									<c:if test="${empty url && not empty menu2.menuUrl }">
										<c:set var="url" value="${menu2.menuUrl }" />
									</c:if>
									
									<c:forEach var="menu3" items="${frontMenuList3 }">
										<c:if test="${empty url && not empty menu3.menuUrl }">
											<c:set var="url" value="${menu3.menuUrl }" />
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
							
							<%-- <a href="${url }">${menu1.menuNm }</a> --%>
							<a>${menu1.menuNm }</a>
							
							<ul>
								<c:forEach var="menu2" items="${frontMenuList2 }">
									<c:if test="${menu2.upMenuSeq eq menu1.menuSeq }">
										<li>
											<%-- url 찾기 --%>
											<c:set var="url" value="${menu2.menuUrl }" />
											<c:forEach var="menu3" items="${frontMenuList3 }">
												<c:if test="${menu3.upMenuSeq eq menu2.menuSeq }">
													<c:if test="${empty url && not empty menu3.menuUrl }">
														<c:set var="url" value="${menu3.menuUrl }" />
													</c:if>
												</c:if>
											</c:forEach>
										
											<a href="${url }">${menu2.menuNm }</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
							
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- //header --> 