<%@page import="dlink.admin.vo.TMemAccptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
%>
<!-- header -->
<header id="wrap_header">
	<div class="bgLayer"></div>
	<div id="header"> 
		<!-- logoa  -->
		<h1 class="logo"><a href="/front/main.do">D.Link</a></h1>
		<!-- //logo --> 

		<!-- search_layer -->
		<div class="top_Srch">
			<div class="layer_Srch"> <!-- 검색어 입력 레이어 -->
				<form name="searchEngine" id="searchEngine">
					<input type="hidden" name="menu" id="menu" value="통합검색" > 
					<span>
						<input type="text" name="qt" id="qt" value="검색어 입력">
						<button onclick="javascript:getItSearch(); return false;">검색</button>
					</span> 
				</form> 
			</div>
		</div>
		<!-- //search_layer -->

		<div class="layerGnb">
			<div class="wrapCnt">
				<!-- global -->
				<div id="wrap_nav">
					<ul id="util">
						<li><a href="/front/main.do">HOME</a></li>
						<%if(loginVO == null){ %>
							<li><a href="/front/login.do">로그인</a></li>
						<%} else { %>
							<li><a href="/logout/front.do">로그아웃</a></li>
							<%if("MG0002".equals(loginVO.getUserType())) {%>
							<li><a href="/front/proAgency/infoMagmt.do"><strong class="reg">기업정보관리</strong></a></li>
						<%		}
							} 
						%>
					</ul>
					<div class="btn_menu">
						<button type="button" class="menu">
							<span><i></i></span>
							전체메뉴
						</button>
					</div>
					<div class="btn_Srch"><a href="javascript:;">검색하기</a></div>
					<div class="allmenu">
						<button type="button" class="menu">
							<span></span>
							전체메뉴 닫기
						</button>
						<ul>
							<li>								
								<a href="/front/agency/agSearchList.do">전문업체검색</a>
								<ul class="depth2">
									<li><a href="/front/agency/agSearchList.do">업체검색</a></li>
								</ul>
							</li>
							<li>								
								<a href="/front/portfolio/portfSearchList.do">포트폴리오</a>
								<ul class="depth2">
									<li><a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a></li>
								</ul>
							</li>
							<li>								
								<a href="/front/dsn/dsnBankList.do">디자인뱅크</a>
								<ul class="depth2 first">
									<li><a href="/front/dsn/dsnBankList.do">이미지검색</a></li>
									<!-- <li><a href="/front/image/imgApply.do">이미지신청</a></li> -->
								</ul>
							</li>
							<li>								
								<a href="/front/content/bsnIntro.do">사업소개</a>
								<ul class="depth2">
									<li><a href="/front/content/centerIntro.do">진흥원소개</a></li>
									<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
									<li><a href="/front/business/wordArgmtList.do">용어정리</a></li>
									<li><a href="/front/business/qnaList.do">Q&A</a></li>
									<li><a href="/front/business/noticeList.do?menu_id=gongji">공지사항</a></li>
								</ul>
							</li>
							<%if(loginVO != null){ %>
							<li>								
								<a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">마이페이지</a>
								<ul class="depth2 first">
									<li><a href="/front/mtsAtalkMsg/MtsAtalkMsgList.do">알림센터</a></li>
									<li><a href="/front/Interest/proCompany.do?sel_gb=agency">관심정보</a></li>
										<%if(("MG0003").equals(loginVO.getUserType())){ %>   <!-- 관리자는 상담관리 이용 불가능 -->
														
										<%} else {%>
											<li><a href="/front/consult/consultInquiryList.do">상담관리</a></li>
										<%} %>
									<%if(("MG0001").equals(loginVO.getUserType())){ %>
										<li><a href="/front/privacy/infoInquiry.do">개인정보관리</a></li>
									<%} else {%>
										<li><a href="/front/proAgency/infoMagmt.do">기업정보관리</a></li>
									<%} %>
								</ul>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
				<!-- //global -->
				<div class="allmenu_bg"></div>

				<!-- gnb -->
				<nav class="gnb" id="gnb">
					<ul>
						<li>								
							<a href="/front/agency/agSearchList.do">전문업체검색</a>
							<ul class="depth2">
								<li><a href="/front/agency/agSearchList.do">업체검색</a></li>
							</ul>
						</li>
						<li>								
							<a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a>
							<ul class="depth2">
								<li><a href="/front/portfolio/portfSearchList.do">포트폴리오검색</a></li>
							</ul>
						</li>
						<li>								
							<a href="/front/dsn/dsnBankList.do">디자인뱅크</a>
							<ul class="depth2">
								<li><a href="/front/dsn/dsnBankList.do">이미지검색</a></li>
							</ul>
						</li>
						<li>								
							<a href="/front/content/bsnIntro.do">사업소개</a>
							<ul class="depth2 first">
								<li><a href="/front/content/centerIntro.do">진흥원소개</a></li>
								<li><a href="/front/content/bsnIntro.do">사업소개</a></li>
								<li><a href="/front/business/wordArgmtList.do">용어정리</a></li>
								<li><a href="/front/business/qnaList.do">Q&A</a></li>
								<li><a href="/front/business/noticeList.do?menu_id=gongji">공지사항</a></li>
							</ul>
						</li>
						
					</ul>
		        </nav>
				<!-- //gnb -->
			</div>
		</div>
	</div>
</header>
<!-- //header --> 