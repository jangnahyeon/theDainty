<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

</style>
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<script type="text/javascript" src="/fullcalendar-6.0.2/dist/index.global.js"></script>
<script src="/fullcalendar-6.0.2/packages/core/locales/ko.global.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },

      eventDidMount: function(info) {
        var tooltip = new Tooltip(info.el, {
          title: info.event.extendedProps.description,
          placement: 'top',
          trigger: 'click',
          container: 'body'
        });
      },
      
      locale: 'ko',
      initialView: 'dayGridMonth',
      initialDate: '2023-01-09',
/*       navLinks: true, // can click day/week names to navigate views */
/*       editable: true,
      dayMaxEvents: true, // allow "more" link when too many events */
      events: [
      	  {
      	  	title: 'test1',
      		description: 'test1',
            start: '2023-01-01'
          },
          {
            groupId: 999,
            title: 'test2',
            description: 'test2',
            start: '2023-01-08T16:00:00'
          }
          ]
    });

    calendar.render();
  });

</script>
		<!-- 컨텐츠 영역 -->
		<div class="contents">			
			<div class="innerwrap">	
			
				<div class="tab_group">
					<ul class="tab_wrap">
						  <li><a href="javascript:void(0);" class="ov" data="cs01"><span>예약현황</span></a></li>
						  <li><a href="javascript:void(0);" class="" data="cs02" ><span>예약게시판</span></a></li>
					</ul>
				</div>
				
				<h3>예약방법</h3>
				<div class="booking_guide">
					<ol>
						<li><p>스케쥴표를 통해 예약 가능 일자 확인 후 예약 게시판에서 신청서를 작성해 주세요.</p></li>
						<li><p>담당자가 신청서 확인 후 1~2일 내에 기입하신 전화번호로 연락을 드립니다.</p></li>
						<li><p>예약자 전화번호로 예약 확정 문자메세지를 보내 드립니다.</p></li>
					</ol>
				</div>
				
				<h3>예약현황</h3>
				
				<div class="widget calendar">
					<div id="calendar" class="fc fc-ltr fc-unthemed">
						<div class="fc-toolbar">
							<!-- <div class="fc-center"><h2>2022년 11월</h2></div> -->
							  <div id='calendar'></div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
		<!-- //컨텐츠 영역 -->