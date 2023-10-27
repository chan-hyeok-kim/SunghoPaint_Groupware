<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/js/attendance/status.js"></script>
<link rel="stylesheet" href="/css/attendance/status.css">

<sec:authorize access="isAuthenticated()" var="isAuthenticated" />

<script type="text/javascript">
	// init(${isAuthenticated});
	let attendances_json = ${attendances_json};
	let weeksOfMonth_json = ${weeksOfMonth_json}
	
	$(function(){
		$.each(attendances_json, function(index, element){
			let attendanceDate = new Date(element.attendanceDate);
			let day = attendanceDate.getDate();
			
			let attendanceStart = new Date(element.attendanceStart);
			let attendanceEnd = new Date(element.attendanceEnd);
			let formatted_attendanceStart = formatTime(attendanceStart.getHours(), attendanceStart.getMinutes(), attendanceStart.getSeconds(), ":");
			let formatted_attendanceEnd = formatTime(attendanceEnd.getHours(), attendanceEnd.getMinutes(), attendanceEnd.getSeconds(), ":");
			
			$("[data-day='" + day + "']").find(".start").html(formatted_attendanceStart);
			$("[data-day='" + day + "']").find(".end").html(formatted_attendanceEnd);
			
			// 총 근무 시간 구하기
			let diff = attendanceEnd.getTime() - attendanceStart.getTime();
			let formatted_diff = timeDiffToTimeString(diff, ":");
			$("[data-day='" + day + "']").find(".total").html(formatted_diff);
			
			// 연장, 야간 근무 시간 구하기
			let detail = "";
			
			let standard_leaveWork = new Date(element.attendanceDate);
			standard_leaveWork.setHours(18, 0, 0);
			
			diff = standard_leaveWork.getTime() - attendanceStart.getTime();
			formatted_diff = timeDiffToTimeString(diff, ":");
			let diff_hour = parseInt(formatted_diff.split(":")[0]);
			if(diff_hour >= 9) formatted_diff = "09:00:00"
			detail += "기본 " + formatted_diff;
			
			diff = attendanceEnd.getTime() - standard_leaveWork.getTime();
			formatted_diff = timeDiffToTimeString(diff, ":");
			
			diff_hours = parseInt(formatted_diff.split(":")[0]);
			diff_minutes = parseInt(formatted_diff.split(":")[1]);
			diff_seconds = parseInt(formatted_diff.split(":")[2]);
			
			if(diff_hours >= 1){
				detail += " / 연장 " + formatted_diff;
				if(diff_hours >= 5){
					detail += " / 야간 " + (diff_hours - 4) + ":" + diff_minutes + ":" + diff_seconds;
				}
			}
			
			$("[data-day='" + day + "']").find(".detail").html(detail);
		});
	});

	$(function(){
		$("#weeksOfMonth").on("click", ".week > img", function(){
			if($(this).hasClass("open")){
				$(this).removeClass("open").addClass("close");
			}else if($(this).hasClass("close")){
				$(".week > img").not(this).removeClass("open").addClass("close");
				$(this).removeClass("close").addClass("open");
				
				// ====================================================================
				
				// - 선택한 주차의 누적, 초과, 잔여 시간 구하기 -
				
				// 누적
				let week = parseInt($(this).siblings("h3").html().split(" ")[0]);
				let accrue = "00:00:00";
				
				$.each(weeksOfMonth_json[week], function(index, element){
					if(index == 0) return true; // == continue
					
					let day = element.split(" ")[0];
					let total = $("[data-day='" + day + "']").find(".total").html();

					if(total != ""){
						accrue = hoursToTimeString(timeStringToHours(accrue, ":") + timeStringToHours(total, ":"), "hms");
					}
				});
				
				let week_accrue = $("#total #week_accrue > .time > span").html(accrue);
				let excess = "00h 00m 00s"; // ing . . .
				
				// 초과
				let accrue_timeObj = splitTimeString(accrue, "hms");
				
				if(accrue_timeObj.hours >= 40){
					excess = hoursToTimeString(timeStringToHours(accrue, "hms") - timeStringToHours("40h 00m 00s", "hms"));
				}
				
				let week_excess = $("#total #week_excess > .time");
				let week_accrue = $("#total #week_excess > .time > span").html(excess);

				// 잔여
				let remain_timeObj = splitTimeString("", timeObj);

				if(accrue_timeObj.hours < 40){
					let result = hoursToTimeString(timeStringToHours("40:00:00") - timeStringToHours(accrue));
					remain_timeObj = splitTimeString(result);
				}

				let week_remain = $("#total #week_remain > .time");
				week_remain.children("span:eq(0)").html(remain_timeObj.hours + "h");
				week_remain.children("span:eq(1)").html(remain_timeObj.minutes + "m");
				week_remain.children("span:eq(2)").html(remain_timeObj.seconds + "s");
			}
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
				<span></span>
			</div>
		</div>
	</div>
	<p class="dividing"></p>
	<div class="wrap">
		<div id="week_excess" class="component">
			<h3>이번주 초과</h3>
			<div class="time">
				<span></span>
			</div>
		</div>
		<div id="week_remain" class="component">
			<h3>이번주 잔여</h3>
			<div class="time">
				<span></span>
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
				<span></span>
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