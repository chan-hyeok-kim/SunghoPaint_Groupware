<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/js/attendance/status.js"></script>
<link rel="stylesheet" href="/css/attendance/status.css">

<sec:authorize access="isAuthenticated()" var="isAuthenticated" />

<script type="text/javascript">
	// init(${isAuthenticated});
	let attendances_json = ${attendances_json};
	
	function timeFormat(time){
		return String(time).padStart(2, "0");
	}
	
	$(function(){
		$(".week img.open").click(function(){
			$(this).removeClass("open");
			$(this).addClass("close");
		});
		
		// =========================================================================================================================
		
		$.each(attendances_json, function(index, element){
			let attendanceDate = new Date(element.attendanceDate);
			let day = attendanceDate.getDate();
			
			let attendanceStart = new Date(element.attendanceStart);
			let attendanceEnd = new Date(element.attendanceEnd);
			
			let diff = attendanceEnd.getTime() - attendanceStart.getTime();
			var diff_hour = Math.floor(diff / (1000 * 60 * 60));
			var diff_min = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			var diff_sec = Math.floor((diff % (1000 * 60)) / 1000);
			
			attendanceStart = timeFormat(attendanceStart.getHours()) + ":" + timeFormat(attendanceStart.getMinutes()) + ":" + timeFormat(attendanceStart.getSeconds());
			attendanceEnd = timeFormat(attendanceEnd.getHours()) + ":" + timeFormat(attendanceEnd.getMinutes()) + ":" + timeFormat(attendanceEnd.getSeconds());
			
			$("[data-day='" + day + "']").attr("data-day");
			$("[data-day='" + day + "']").find(".start").html(attendanceStart);
			$("[data-day='" + day + "']").find(".end").html(attendanceEnd);
			
			let total = timeFormat(diff_hour) + ":" + timeFormat(diff_min) + ":" + timeFormat(diff_sec);
			$("[data-day='" + day + "']").find(".total").html(total);
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
					<div>
						<c:if test="${week_status.index == 1}"> 
							<img class="open">
						</c:if>
						<c:if test="${week_status.index != 1}"> 
							<img class="close">
						</c:if>
						<h3>${week_status.index} 주차</h3>
						<div>
							<table>
								<tr>
									<th>일자</th> <th>업무 시작</th> <th>업무 종료</th> <th>총 근무 시간</th> <th>근무 시간 상세</th>
								</tr>
								<c:forEach items="${week}" var="day" varStatus="day_status">
									<c:if test="${day_status.index != 0}">
										<tr data-day="${day}">
											<td class="day">${day}</td>
											<td class="start"></td>
											<td class="end"></td>
											<td class="total"></td>
											<td class="detail"></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>