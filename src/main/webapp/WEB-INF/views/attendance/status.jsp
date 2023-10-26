<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/js/attendance/status.js"></script>
<link rel="stylesheet" href="/css/attendance/status.css">

<sec:authorize access="isAuthenticated()" var="isAuthenticated" />

<script type="text/javascript">
	// init(${isAuthenticated});
	let weeksOfMonth_json = ${weeksOfMonth_json}
	let attendances_json = ${attendances_json};
	
	function timeFormat(time){
		return String(time).padStart(2, "0");
	}
	
	$(function(){
		$("#weeksOfMonth").on("click", ".week > img", function(){
			if($(this).hasClass("open")){
				$(this).removeClass("open").addClass("close");
			}else if($(this).hasClass("close")){
				$(".week > img").not(this).removeClass("open").addClass("close");
				$(this).removeClass("close").addClass("open");
				
				// ===============================================
				
				// - 선택한 주차의 누적, 초과, 잔여 시간 구하기 -
				
				let week = parseInt($(this).siblings("h3").html().split(" ")[0]);
				
				let hours = 0;
				let minutes = 0;
				let seconds = 0;
				
				// 누적
				$.each(weeksOfMonth_json[week], function(index, element){
					if(index == 0) return true; // == continue
					
					let day = element.split(" ")[0];
					let start = $("[data-day='" + day + "']").find(".start").html();
					let end = $("[data-day='" + day + "']").find(".end").html();
					let total = $("[data-day='" + day + "']").find(".total").html();
					
					if(total != ""){
						let time = total.split(":");
						hours += parseInt(time[0]);
						minutes += parseInt(time[1]);
						seconds += parseInt(time[2]);
						
						if(seconds >= 60){
							minutes += Math.floor(seconds / 60);
							seconds %= 60;
						}
						
						if(minutes >= 60){
							hours += Math.floor(minutes / 60);
							minutes %= 60;
						}
					}
				});
				
				let week_accrue = $("#total #week_accrue > .time");
				week_accrue.children('span:eq(0)').html(hours + "h");
				week_accrue.children('span:eq(1)').html(minutes + "m");
				week_accrue.children('span:eq(2)').html(seconds + "s");
				
				// 초과
				let week_excess = $("#total #week_excess > .time");
				if(hours >= 40){
					
				}else{
					week_excess.children('span:eq(0)').html(0 + "h");
					week_excess.children('span:eq(1)').html(0 + "m");
					week_excess.children('span:eq(2)').html(0 + "s");
				}
				
				// 잔여
			}
		});
	});
	
	$(function(){
		$.each(attendances_json, function(index, element){
			let attendanceDate = new Date(element.attendanceDate);
			let day = attendanceDate.getDate();
			
			let attendanceStart = new Date(element.attendanceStart);
			let attendanceEnd = new Date(element.attendanceEnd);
			
			let formatted_attendanceStart = timeFormat(attendanceStart.getHours()) + ":" + timeFormat(attendanceStart.getMinutes()) + ":" + timeFormat(attendanceStart.getSeconds());
			let formatted_attendanceEnd = timeFormat(attendanceEnd.getHours()) + ":" + timeFormat(attendanceEnd.getMinutes()) + ":" + timeFormat(attendanceEnd.getSeconds());
			
			$("[data-day='" + day + "']").find(".start").html(formatted_attendanceStart);
			$("[data-day='" + day + "']").find(".end").html(formatted_attendanceEnd);
			
			// 총 근무 시간 구하기
			let diff = attendanceEnd.getTime() - attendanceStart.getTime();
			let diff_hour = Math.floor(diff / (1000 * 60 * 60));
			let diff_min = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			let diff_sec = Math.floor((diff % (1000 * 60)) / 1000);
			
			let total = timeFormat(diff_hour) + ":" + timeFormat(diff_min) + ":" + timeFormat(diff_sec);
			$("[data-day='" + day + "']").find(".total").html(total);
			
			// 연장, 야간 근무 시간 구하기
			let detail = "";
			
			let standard_leaveWork = new Date(element.attendanceDate);
			standard_leaveWork.setHours(18, 0, 0);
			
			diff = standard_leaveWork.getTime() - attendanceStart.getTime();
			diff_hour = Math.floor(diff / (1000 * 60 * 60));
			diff_min = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			diff_sec = Math.floor((diff % (1000 * 60)) / 1000);
			
			if(diff_hour >= 9){
				diff_hour = 9; diff_min = 0; diff_sec = 0;
			}
			
			detail += "기본 " + diff_hour + "h " + diff_min + "m " + diff_sec;
			
			diff = attendanceEnd.getTime() - standard_leaveWork.getTime();
			diff_hour = Math.floor(diff / (1000 * 60 * 60));
			diff_min = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			diff_sec = Math.floor((diff % (1000 * 60)) / 1000);
			
			if(diff_hour >= 1){
				detail += " / 연장 " + diff_hour + "h " + diff_min + "m " + diff_sec + "s";
				if(diff_hour >= 5){
					detail += " / 야간 " + (diff_hour - 4) + "h " + diff_min + "m " + diff_sec + "s";
				}
			}
			
			$("[data-day='" + day + "']").find(".detail").html(detail);
		});
	});
</script>

<h1 id="title">근태 현황</h1>
<div id="move_month">
	<i>《</i>
	<h2>2023.10</h2>
	<i>》</i>
</div>
<div id="total">
	<div class="wrap">
		<div id="week_accrue" class="component">
			<h3>이번주 누적</h3>
			<div class="time">
				<span>3h</span><span>26m</span><span>24s</span>
			</div>
		</div>
	</div>
	<p class="dividing"></p>
	<div class="wrap">
		<div id="week_excess" class="component">
			<h3>이번주 초과</h3>
			<div class="time">
				<span>0h</span><span>0m</span><span>0s</span>
			</div>
		</div>
		<div id="week_remain" class="component">
			<h3>이번주 잔여</h3>
			<div class="time">
				<span>3h</span><span>26m</span><span>24s</span>
			</div>
		</div>
	</div>
	<p class="dividing"></p>
	<div class="wrap">
		<div id="month_accrue" class="component">
			<h3>이번달 누적</h3>
			<div class="time">
				<span>0h</span><span>0m</span><span>0s</span>
			</div>
		</div>
		<div id ="month_extend" class="component">
			<h3>이번주 연장</h3>
			<div class="time">
				<span>3h</span><span>26m</span><span>24s</span>
			</div>
		</div>
	</div>
</div>
<div id="weeksOfMonth">
	<ul>
		<c:forEach items="${weeksOfMonth}" var="week" varStatus="week_status">
			<c:if test="${week_status.index != 0}">
				<li class="week">
					<c:if test="${week_status.index == 1}"> 
						<img class="open">
					</c:if>
					<c:if test="${week_status.index != 1}"> 
						<img class="close">
					</c:if>
					<h3>${week_status.index} 주차</h3>
					<table>
						<tr>
							<th>일자</th> <th>업무 시작</th> <th>업무 종료</th> <th>총 근무 시간</th> <th>근무 시간 상세</th>
						</tr>
						<c:forEach items="${week}" var="day" varStatus="day_status">
							<c:if test="${day_status.index != 0}">
								<tr data-day="${fn:split(day, ' ')[0]}">
									<td class="day">${day}</td>
									<td class="start"></td>
									<td class="end"></td>
									<td class="total"></td>
									<td class="detail"></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>