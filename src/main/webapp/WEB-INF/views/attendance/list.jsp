<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/js/attendance/list.js"></script>
<script src="/js/attendance/myStatus.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/attendance/list.css">
<link rel="stylesheet" href="/css/attendance/myStatus.css">

<div id="move_month" data-url="/attendance/list" data-action="GET">
	<i id="before_month">《</i>
	<h2>${date.year}.<fmt:formatNumber value="${date.month}" pattern="00" /></h2>
	<i id="after_month">》</i>
</div>

<form action="./list" method="GET" id="searchForm">
	<input type="hidden" name="year" value="${date.year}">
	<input type="hidden" name="month" value="${date.month}">

	<select name="department">
		<c:if test="${empty pager.department}">
			<option value="" selected>전체</option>
		</c:if>
		<c:if test="${!empty pager.department}">
			<option value="">전체</option>
		</c:if>
		<c:forEach items="${departmentList}" var="department">
			<c:if test="${department.code eq pager.department}">
				<option value="${department.code}" selected>${department.codeName}</option>
			</c:if>
			<c:if test="${department.code ne pager.department}">
				<option value="${department.code}">${department.codeName}</option>
			</c:if>
		</c:forEach>
	</select>

	<input type="text" name="keyword" value="${pager.keyword}">
	<button type="submit" class="btn btn-gradient-primary">검색</button>
</form>

<table>
	<tr>
		<th>이름</th>
		<th>누적 근무 시간</th>
		<c:forEach items="${weeksOfMonthInfo}" var="week" varStatus="week_status">
			<c:if test="${week_status.index != 0}">
				<th>${week_status.index}주차</th>
			</c:if>
		</c:forEach>
	</tr>
	<c:forEach items="${attendanceStatuses}" var="attendanceStatus">
		<tr onclick="attendanceDetail('${attendanceStatus.employeeID}', '${date.year}', '${date.month}')">
			<td class="humanresource">
				<div class="alignWrap">
					<div>
						<img src="${attendanceStatus.profile}">
					</div>
					<div>
						<h2>${attendanceStatus.name}</h2>
						<p>${attendanceStatus.positionCdName}</p>
						<p>${attendanceStatus.departmentCdName}</p>
					</div>
				</div>
			</td>
			<c:forEach items="${attendanceStatus.accrues}" var="accrues">
				<c:if test="${empty accrues}">
					<td>
						<h2>0h 0m 0s</h2>
						<p>기본 : 0h 0m 0s</p>
						<p>연장 : 0h 0m 0s</p>
						<p>야간 : 0h 0m 0s</p>
					</td>
				</c:if>
				<c:if test="${!empty accrues}">
					<td>
						<h2>${accrues.weekAccrue}</h2>
						<p>기본 : ${accrues.weekDefault}</p>
						<p>연장 : ${accrues.weekOver}</p>
						<p>야간 : ${accrues.weekNight}</p>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</c:forEach>
</table>