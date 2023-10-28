<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/js/attendance/status.js"></script>
<link rel="stylesheet" href="/css/attendance/status.css">

<sec:authorize access="isAuthenticated()" var="isAuthenticated" />

<script type="text/javascript">
	// init(${isAuthenticated});
	let weeksOfMonthInfo_json = ${weeksOfMonthInfo_json};
	let attendances_json = ${attendances_json};
	
	$(function(){
		let month_accrue = "00:00:00"; // 이번달 누적
		let month_over = "00:00:00"; // 이번달 연장
		$.each(attendances_json, function(index, element){
			let dataDateAttribute = dateToDataDateAttribute(new Date(element.attendanceDate));

			let attendanceStart = new Date(element.attendanceStart);
			let attendanceEnd = new Date(element.attendanceEnd);
			let formatted_attendanceStart = formatTime(attendanceStart.getHours(), attendanceStart.getMinutes(), attendanceStart.getSeconds(), ":");
			let formatted_attendanceEnd = formatTime(attendanceEnd.getHours(), attendanceEnd.getMinutes(), attendanceEnd.getSeconds(), ":");
			$("[data-date='" + dataDateAttribute + "']").find(".start").html(formatted_attendanceStart);
			$("[data-date='" + dataDateAttribute + "']").find(".end").html(formatted_attendanceEnd);
			
			// 총 근무 시간 구하기(점심 시간(12시 ~ 13시) 제외)
			let total;
			let lunch_time;
			let isNextDay = attendanceStart.getDate() != attendanceEnd.getDate();
			if(attendanceEnd.getHours() >= 13 || isNextDay){
				lunch_time = 1000 * 60 * 60;
				total = timeDiffToTimeString(attendanceEnd.getTime() - attendanceStart.getTime() - lunch_time, ":");
			}else if(attendanceEnd.getHours() == 12){
				let minutes = attendanceEnd.getMinutes();
				let seconds = attendanceEnd.getSeconds();
				lunch_time = "00:" + minutes + ":" + seconds;
				
				total = timeDiffToTimeString(attendanceEnd.getTime() - attendanceStart.getTime(), ":");
				total = hoursToTimeString(timeStringToHours(total, ":") - timeStringToHours(lunch_time, ":"), ":");
			}

			$("[data-date='" + dataDateAttribute + "']").find(".total").html(total);

			month_accrue = hoursToTimeString(timeStringToHours(month_accrue, ":") + timeStringToHours(total, ":"), ":");
			
			// 근무 시간 상세 구하기
			let detail = "";
			let basic = "08:00:00";

			if(parseInt(total.split(":")[0]) < 8) basic = total;
			detail += "기본 " + basic;
			
			let over = hoursToTimeString(timeStringToHours(total, ":") - timeStringToHours("08:00:00", ":"), ":");
			let over_timeObj = splitTimeString(over, ":");

			if(timeStringToHours(over, ":") - timeStringToHours("00:00:00", ":") > 0){
			// 또는 if(over > "00:00:00")
				detail += " / 연장 " + over;
				if(over_timeObj.hours > 4){
					detail += "(야간 " + formatTime(over_timeObj.hours - 4, over_timeObj.minutes, over_timeObj.seconds, ":") + ")";
				}

				month_over = hoursToTimeString(timeStringToHours(month_over, ":") + timeStringToHours(over, ":"), ":");
			}
			
			$("[data-date='" + dataDateAttribute + "']").find(".detail").html(detail);
		});

		month_accrue = convertFormatTime(month_accrue, ":", "hms");
		$("#total #month_accrue > .time > span").html(month_accrue);

		month_over = convertFormatTime(month_over, ":", "hms");
		$("#total #month_over > .time > span").html(month_over);
	});

	$(function(){
		$("#weeksOfMonthInfo").on("click", ".week > img", function(){
			if($(this).hasClass("open")){
				$(this).removeClass("open").addClass("close");
			}else if($(this).hasClass("close")){
				$(".week > img").not(this).removeClass("open").addClass("close");
				$(this).removeClass("close").addClass("open");
				
				// ===================================================================================
				
				// - 선택한 주차의 누적, 초과, 잔여 시간 구하기 -
				
				// 누적
				let week = parseInt($(this).siblings("h3").html().split(" ")[0]);
				let accrue = "00:00:00";
				
				$.each(weeksOfMonthInfo_json[week], function(index, element){
					if(index == 0) return true; // == continue
					
					let date = element.split(" ")[0];
					let total = $("[data-date='" + date + "']").find(".total").html();

					if(total != ""){
						accrue = hoursToTimeString(timeStringToHours(accrue, ":") + timeStringToHours(total, ":"), ":");
					}
				});

				let accrue_timeObj = splitTimeString(accrue, ":");
				accrue = convertFormatTime(accrue, ":", "hms");
				$("#total #week_accrue > .time > span").html(accrue);
				
				// 초과
				let excess = "0h 0m 0s";
				if(accrue_timeObj.hours >= 40){
					excess = hoursToTimeString(timeStringToHours(accrue, "hms") - timeStringToHours("40h 0m 0s", "hms"), "hms");
				}
				
				$("#total #week_excess > .time > span").html(excess);

				// 잔여
				let remain = "0h 0m 0s";
				if(accrue_timeObj.hours < 40){
					remain = hoursToTimeString(timeStringToHours("40h 0m 0s", "hms") - timeStringToHours(accrue, "hms"), "hms");
				}

				$("#total #week_remain > .time > span").html(remain);
			}
		});

		$("#weeksOfMonthInfo .week[data-weekOfMonth='${date.weekOfMonth}'] > img").trigger("click");
	});
</script>

<h1 id="title">근태 현황</h1>
<div id="move_month">
	<i id="before_month">《</i>
	<h2>${date.year}.<fmt:formatNumber value="${date.month}" pattern="00" /></h2>
	<i id="after_month">》</i>
</div>
<div id="total">
	<div class="wrap">
		<div id="week_accrue" class="component">
			<h3>이번주 누적</h3>
			<div class="time">
				<span>0h 0m 0s</span>
			</div>
		</div>
	</div>
	<p class="dividing"></p>
	<div class="wrap">
		<div id="week_excess" class="component">
			<h3>이번주 초과</h3>
			<div class="time">
				<span>0h 0m 0s</span>
			</div>
		</div>
		<div id="week_remain" class="component">
			<h3>이번주 잔여</h3>
			<div class="time">
				<span>0h 0m 0s</span>
			</div>
		</div>
	</div>
	<p class="dividing"></p>
	<div class="wrap">
		<div id="month_accrue" class="component">
			<h3>이번달 누적</h3>
			<div class="time">
				<span>0h 0m 0s</span>
			</div>
		</div>
		<div id ="month_over" class="component">
			<h3>이번달 연장</h3>
			<div class="time">
				<span>0h 0m 0s</span>
			</div>
		</div>
	</div>
</div>
<div id="weeksOfMonthInfo">
	<ul>
		<c:forEach items="${weeksOfMonthInfo}" var="week" varStatus="week_status">
			<c:if test="${week_status.index != 0}">
				<li class="week" data-weekOfMonth="${week_status.index}">
					<img class="close">
					<h3>${week_status.index}주차</h3>
					<table>
						<tr>
							<th>일자</th> <th>업무 시작</th> <th>업무 종료</th> <th>총 근무 시간</th> <th>근무 시간 상세</th>
						</tr>
						<c:forEach items="${week}" var="date" varStatus="date_status">
							<c:if test="${date_status.index != 0}">
								<tr data-date="${fn:split(date, ' ')[0]}">
									<td class="day">${fn:replace(fn:split(date, "m")[1], "d", "")}</td>
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