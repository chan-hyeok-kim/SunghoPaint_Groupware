<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/js/annual/status.js"></script>
<link rel="stylesheet" href="/css/annual/status.css">

<%@include file="/WEB-INF/views/humanresource/search.jsp"%>
	
	<div id="buttons">
		<button id="setAnnualLeave">연차 조정</button>
		<button id="excelDownload">목록 다운로드</button>
	</div>
	
	<table>
		<tr>
			<th><input type="checkbox" id="checkAll"></th>
			<th>사번</th>
			<th>부서</th>
			<th>성명</th>
			<th>입사일</th>
			<th>퇴사일</th>
			<th>근속연수</th>
			<th>발생 연차</th>
			<th>총 연차</th>
			<th>사용 연차</th>
			<th>잔여 연차</th>
		</tr>
		<c:forEach items="${annualList}" var="annual">
			<tr onclick="location.href='#'">
				<td><input type="checkbox"></td>
				<td class="employeeID">${annual.employeeID}</td>
				<td>${annual.departmentCdName}</td>
				<td class="name">${annual.name}</td>
				<td class="joinDate">${annual.joinDate}</td>
				<td>${annual.quitDate}</td>
				<td>${annual.yearsOfService}</td>
				<td class="occurrence">${annual.occurrenceAnnualLeave}</td>
				<td class="total">${annual.totalAnnualLeave}</td>
				<td class="used">${annual.usedAnnualLeave}</td>
				<td class="have">${annual.haveAnnualLeave}</td>
			</tr>
		</c:forEach>
	</table>
	
	<%@include file="/WEB-INF/views/humanresource/paging.jsp"%>
</div>