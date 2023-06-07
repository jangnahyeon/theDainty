<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

 /**
  * @Class Name : sisulRsv. jsp
  * @Description : sisulRsv 화면
  * @Modification Information
  * 
  * @author 이재욱
  * @since 2023-01-05
  * @version 1.0
  * @see
  *  
  * Copyright (C) All right reserved.
  */
%>

<style>
/*   body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  } */
  .popper,
  .tooltip {
    position: absolute;
    z-index: 9999;
    /* background: #FFC107; */
    background: #FFFFFF;
    color: black;
    width: 150px;
    border-radius: 3px;
    box-shadow: 0 0 2px rgba(0,0,0,0.5);
    padding: 10px;
    text-align: center;
  }
  .style5 .tooltip {
    background: #1E252B;
    color: #FFFFFF;
    max-width: 200px;
    width: auto;
    font-size: .8rem;
    padding: .5em 1em;
  }
  .popper .popper__arrow,
  .tooltip .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
  }

  .tooltip .tooltip-arrow,
  .popper .popper__arrow {
    /* border-color: #FFC107; */
    border-color:#FFFFFF;
  }
  .style5 .tooltip .tooltip-arrow {
    border-color: #1E252B;
  }
  .popper[x-placement^="top"],
  .tooltip[x-placement^="top"] {
    margin-bottom: 5px;
  }
  .popper[x-placement^="top"] .popper__arrow,
  .tooltip[x-placement^="top"] .tooltip-arrow {
    border-width: 5px 5px 0 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    bottom: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .popper[x-placement^="bottom"],
  .tooltip[x-placement^="bottom"] {
    margin-top: 5px;
  }
  .tooltip[x-placement^="bottom"] .tooltip-arrow,
  .popper[x-placement^="bottom"] .popper__arrow {
    border-width: 0 5px 5px 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-top-color: transparent;
    top: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .tooltip[x-placement^="right"],
  .popper[x-placement^="right"] {
    margin-left: 5px;
  }
  .popper[x-placement^="right"] .popper__arrow,
  .tooltip[x-placement^="right"] .tooltip-arrow {
    border-width: 5px 5px 5px 0;
    border-left-color: transparent;
    border-top-color: transparent;
    border-bottom-color: transparent;
    left: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  .popper[x-placement^="left"],
  .tooltip[x-placement^="left"] {
    margin-right: 5px;
  }
  .popper[x-placement^="left"] .popper__arrow,
  .tooltip[x-placement^="left"] .tooltip-arrow {
    border-width: 5px 0 5px 5px;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    right: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

/** 옆 동그라미 색깔 설정 */
.red .fc-daygrid-event-dot {
	border: calc(var(--fc-daygrid-event-dot-width)/2) solid #d83737;
}
.green .fc-daygrid-event-dot {
	border: calc(var(--fc-daygrid-event-dot-width)/2) solid #37d872;
}

.fc-event-time{
	display: none;
}
</style>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="/fullcalendar-6.0.2/dist/index.global.js"></script>
<script src="/fullcalendar-6.0.2/packages/core/locales/ko.global.js"></script>
 	<c:set var="today" value="<%=new java.util.Date() %>" />
	<c:set var="yyyy" value="${param.rsvYear }" />
	<c:if test="${empty yyyy }">
		<fmt:formatDate value="${today}" pattern="yyyy" var="yyyy" />
	</c:if>
	
	<c:set var="mm" value="${param.rsvMonth }" />
	<c:if test="${empty mm }">
		<fmt:formatDate value="${today}" pattern="MM" var="mm" />
	</c:if>

<c:if test="${param.rsvYear != null && param.rsvMonth != null }">	
<script>
 window.addEventListener('load', () => {
	    window.scrollTo(0, 700);
	});
</script>
</c:if>
<script>
	/* dayGridMonth,timeGridWeek,timeGridDay */
	var dateNow = new Date();
	var todayD = dateNow.getDate();
     if(todayD < 10) {
     	todayD = "0"+todayD; 
     }
	var todayDt = new Date("${yyyy}" + "-" + "${mm}" + "-" + todayD);
    
	document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {

	    headerToolbar: {
		      left: 'title,prev,next today',
		      center: '',
		      right: ''
	    },
	    
	    locale: 'ko',
	    initialView: 'dayGridMonth',
	    //initialDate: 2022-01-22,
	    initialDate: todayDt,
	    dayMaxEventRows: true, // for all non-TimeGrid views
	    views: {
	      timeGrid: {
	        dayMaxEventRows: 2 // adjust to 6 only for timeGridWeek/timeGridDay
	      }
	    },
	    /* aspectRatio: 1.35, */
	   windowResize: function(arg) {
            var widthSize = $("#calendar").width();
            var heightSize = widthSize * 0.75;
	      	if(widthSize < 370){
	      		calendar.setOption('contentHeight', 680);
	      	} else if(widthSize < 800){
	      		calendar.setOption('contentHeight', 500);
	      	}else{
	      		calendar.setOption('contentHeight', heightSize);
	      	}
	    },
	    customButtons: {
	        prev: {
	            text: 'Prev',
	            click: function() {
	                        calendar.prev();
	                        var test1 = screen.width;
	                        var dyyyy = ($('#fc-dom-1').text().substring(0, 4));
	                        var MM = ($('#fc-dom-1').text().substring(6, 9).split('월', 1));
		                    var NumberMM = Number(MM);
   		                        if(NumberMM <10) {
   		                        	NumberMM = "0"+NumberMM; 
		                        }
	                        todayY = dyyyy;
	                        todayM = NumberMM;
	                        location.href = "/front/dsnStd/sisulRsv.do?rsvYear=" + todayY + "&&rsvMonth=" + todayM;
	            },
	          },
	          next: {
	            text: 'Next',
	            click: function() {
	                        calendar.next();
	                        var dyyyy = ($('#fc-dom-1').text().substring(0, 4));
	                        var MM = ($('#fc-dom-1').text().substring(6, 9).split('월', 1));
		                    var NumberMM = Number(MM);
   		                        if(NumberMM <10) {
   		                        	NumberMM = "0"+NumberMM; 
		                        }
	                        todayY = dyyyy;
	                        todayM = NumberMM;
	                        location.href = "/front/dsnStd/sisulRsv.do?rsvYear=" + todayY + "&&rsvMonth=" + todayM;
	            },
	          },
	          today: {
	        	  text: '오늘',
	        	  click:function(){
	        		calendar.today();	
                    var dyyyy = ($('#fc-dom-1').text().substring(0, 4));
                    var MM = ($('#fc-dom-1').text().substring(6, 9).split('월', 1));
                    var NumberMM = Number(MM);
	                        if(NumberMM <10) {
	                        	NumberMM = "0"+NumberMM; 
                        }
                    todayY = dyyyy;
                    todayM = NumberMM;
                    location.href = "/front/dsnStd/sisulRsv.do?rsvYear=" + todayY + "&&rsvMonth=" + todayM;
	        	  },
	          },
	        },
	    moreLinkClick: "popover",
	      eventDidMount: function(info) {
	          var tooltip = new Tooltip(info.el, {
	        	eventstart : moment(info.event.start).format('yyyy-MM-dd'),
	            title: "<div id='test'>" + info.event.extendedProps.description + "</div>" +
	            		"<div id='test2'>" + moment(info.event.start).format('YYYY년 MM월 DD일') + "</div>" +
	            		"<div id='test3'>" + moment(info.event.start).format('HH시') +
	            		" ~ " + moment(info.event.end).format('HH시') + "</div>",
	            placement: 'top',
	            trigger: 'hover focus',
	            html: true,
	            container: 'body',
	          });
	        },
	      dateClick: function(info){
	    	  
	  			var hldy = info.dateStr;
				<c:forEach var="hld" items="${hldList}">
				if("${hld.hldDt }"== hldy){
					alert("${hld.hldNm}" + "이므로 예약이 불가합니다.")
					return;
				}
	    		</c:forEach>
			    
			    var days = info.dateStr;
			    var yyyys = info.dateStr.slice(0, 4);
			    var mms = info.dateStr.slice(5, 7);
			    var dds = info.dateStr.slice(8);
			    /* var reultDays = days.replace */
			    
 				var week = ['일', '월', '화', '수', '목', '금', '토'];
				var wk = week[new Date(days).getDay()];
				if(wk == '토' || wk == '일'){
					alert("해당 날짜는 선택하실 수 없습니다.\n주말 및 공휴일을 제외하고 선택해주세요.");
					return;
				};

				/* 예약완료시 예약 불가 */
				<c:forEach var="TbSisulRsvVO" items="${resultList}">
		    		/* <c:if test="${TbSisulRsvVO.acceptYn == 'Y' && TbSisulRsvVO.memNm != null}"> */
		    		if("${TbSisulRsvVO.acceptYn == 'Y' && TbSisulRsvVO.comNm != null}"){
					var dataDays = '<c:out value="${TbSisulRsvVO.rsvYear}" />' + '-' +
					  			   '<c:out value="${TbSisulRsvVO.rsvMonth}" />' + '-' +
					  			   '<c:out value="${TbSisulRsvVO.rsvDay}" />';
					if(days == dataDays){
						return;
						};
		    		};
					/* </c:if> */
				</c:forEach>
				
				/* 달력에 있는 월 아님 예약불가 */
                var MM = ($('#fc-dom-1').text().substring(6, 9).split('월', 1));
                if(MM < 10){
                var MMp = "0"+MM;	
					if(MMp != mms){
						return;
					};
                };
                
                /* 7일이후로 예약가능 */
        		var now = new Date();
        		var plus7 = new Date(now);
        		plus7.setDate(now.getDate()+7);
        		var rsv = new Date(yyyys + "-" + mms + "-" + dds);
        		if(plus7 > rsv){
        			alert("예약 가능한 날짜는 오늘 날짜보다 최소 7일 이후에 가능합니다.");
        			return;
        		};
        		
				/* 공휴일 지정날짜 db만들고 위에 코드와 동일(if빼고) */ 
				
/* 				var datas = info.event.title
				if(datas == ""){
					return;
				}; */
				
/* 				if($(yyyys == mama.Year && mms == mama.Month && dds == mama.Day)){
					return;
				} */
				
	    	  /* 추가 */
	    	  
	    	  if(!confirm("시설예약을 하시겠습니까?")){
	    		  alert("취소 하였습니다.");
	    	  }else{
	    		 <c:if test="${empty frontLoginVO }">
	    		 	alert("기업회원으로 로그인 해주세요");
	    			fn_login();
	    			return;
	    		</c:if>
	    		
	    		<c:if test="${not empty frontLoginVO && frontLoginVO.code ne '0003'}">
	    			alert("기업회원만 작성이 가능합니다.");
	    			return;
	    		</c:if>
	    		<c:if test="${not empty frontLoginVO && frontLoginVO.code == '0003'}">
	    		/* 수정 */
	    			location.href = "/front/dsnStd/sisulRsvBoardForm.do?rsvYear=" + yyyys + "&&rsvMonth=" + mms + "&&rsvDay=" + dds;
	    		</c:if>
	    	  };
	      },
 	    events:[
		    	<c:forEach var="TbSisulRsvVO" items="${resultList}">
				    	{
		    		<c:if test="${(TbSisulRsvVO.acceptYn == 'W' || TbSisulRsvVO.acceptYn == 'Y') && (TbSisulRsvVO.comNm != null)}">
 				    	<c:if test="${TbSisulRsvVO.acceptYn == 'W'}">
				    		title: '<c:out value="${TbSisulRsvVO.comNm}" />' + '(' + '가예약중' + ')',
				    	</c:if>
					    <c:if test="${TbSisulRsvVO.acceptYn == 'Y'}">
				    		title: '<c:out value="${TbSisulRsvVO.comNm}" />'+'(' + '예약완료' + ')',
				    	</c:if>
				    		start: '<c:out value="${TbSisulRsvVO.rsvYear}" />' + '-' +
				    			   '<c:out value="${TbSisulRsvVO.rsvMonth}" />' + '-' +
				    			   '<c:out value="${TbSisulRsvVO.rsvDay}" />' + 'T' +
				    			   '<c:out value="${TbSisulRsvVO.rsvSt}" />' + ":00",
				    		end:   '<c:out value="${TbSisulRsvVO.rsvYear}" />' + '-' +
				    			   '<c:out value="${TbSisulRsvVO.rsvMonth}" />' + '-' +
				    			   '<c:out value="${TbSisulRsvVO.rsvDay}" />' + 'T' +
				    			   '<c:out value="${TbSisulRsvVO.rsvEt}" />' + ":00",
				    		description: '<c:out value="${TbSisulRsvVO.title}" />',

					</c:if>
				    	},
		    	</c:forEach>
		    	
		    	<c:forEach var="hld" items="${hldList}">
			    	{
			    		title:'<c:out value="${hld.hldNm}" />',
			    		start:'<c:out value="${hld.hldDt}" />',
			    		classNames: 'hld',
			    		color: '#FFFFFF',
			    		textColor: '#FF0000',
			    		description:'<c:out value="${hld.hldNm}" />',
			    	},
		    	</c:forEach>
		    	
			    ],
			    
		  });
	  
	  calendar.render();

      var widthSize = $("#calendar").width();
      var heightSize = widthSize * 0.75;
    	if(widthSize < 370){
    		calendar.setOption('contentHeight', 680);
    	} else if(widthSize < 800){
    		calendar.setOption('contentHeight', 500);
    	}else{
    		calendar.setOption('contentHeight', heightSize);
    	}
  	
	    // 시간 표시 삭제
	  	$(".fc-event-time").hide();
	});
	  
	

	
/*
	나중 시설추가시 동그라미 색깔 변경
<c:if test="${TbSisulRsvVO.sisulSeq == '1'}">
	className: 'green'
</c:if>
<c:if test="${TbSisulRsvVO.sisulSeq == '2'}">
	className: 'red'
</c:if>*/

 </script>

		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
			
				<div class="tab_group">
					<ul class="tab_wrap">
						  <li><a href="/front/dsnStd/sisulRsv.do" class="ov" data="cs01"><span>예약현황</span></a></li>
						  <li><a href="/front/dsnStd/sisulRsvList.do" class="" data="cs02" ><span>예약게시판</span></a></li>
					</ul>
				</div>
				
				<h3>예약방법</h3>
				<div class="booking_guide" id="booking_guide">
					<ol>
						<li id="focc"><p>스케쥴표를 통해 예약 가능 일자 확인 후 예약 게시판에서 신청서를 작성해 주세요.</p></li>
						<li><p>담당자가 신청서 작성 후 1~2일 내에 기입하신 전화번호로 연락을 드립니다.</p></li>
						<li><p>예약자 전화번호로 예약 확정 문자메세지를 보내 드립니다.</p></li>
					</ol>
				</div>
				
				<h3 id="foc">예약현황</h3>
				
				<div class="widget calendar">
					<div id="calendar" class="fc fc-ltr fc-unthemed">
						<div class="fc-toolbar">
							<!-- <div class="fc-center"><h2>2022년 11월</h2></div> -->
							  <!-- <div id='calendar'></div> -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->