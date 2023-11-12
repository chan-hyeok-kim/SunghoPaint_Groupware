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
				<td>${annual.employeeID}</td>
				<td>${annual.departmentCdName}</td>
				<td>${annual.name}</td>
				<td>${annual.joinDate}</td>
				<td>${annual.quitDate}</td>
				<td>${annual.yearsOfService}</td>
				<td>${annual.occurrenceAnnualLeave}</td>
				<td>${annual.totalAnnualLeave}</td>
				<td>${annual.usedAnnualLeave}</td>
				<td>${annual.haveAnnualLeave}</td>
			</tr>
		</c:forEach>
	</table>
	
	<%@include file="/WEB-INF/views/humanresource/paging.jsp"%>
</div>