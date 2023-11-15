<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="/js/annual/myAnnual.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/annual/myAnnual.css">

<sec:authentication property="principal" var="principal" />

<script>
	$(function(){
		let curDate = new Date();
		let joinDate = new Date("${principal.joinDate}");
		let curYear = curDate.getFullYear();
		let joinYear = joinDate.getFullYear();

		for(let i = joinYear; i <= curYear; i++){
			$("#movePeriod > select").append("<option value='" + i + "'>" + i + "-01-01 ~ " + i + "-12-31" + "</option>")
		}

		if("${param.year}") $("#movePeriod > select > option[value='${param.year}']").prop("selected", true);
		else $("#movePeriod > select > option[value='" + curYear + "']").prop("selected", true);
	});
</script>

<table id="total">
	<tr>
		<td>
			<img src="${principal.profile}">
			<span>${principal.name} ${principal.positionCdName}</span>
		</td>
		<td>
			<h2>발생 연차</h2>
			<span>${annualVO.occurrenceAnnualLeave}</span>
		</td>
		<td>
			<h2>총 연차</h2>
			<span>${annualVO.totalAnnualLeave}</span>
		</td>
		<td>
			<h2>사용 연차</h2>
			<span>${annualVO.usedAnnualLeave}</span>
		</td>
		<td>
			<h2>잔여 연차</h2>
			<span>${annualVO.haveAnnualLeave}</span>
		</td>
	</tr>
</table>

<form action="./myAnnual" method="GET" id="movePeriod" onchange="movePeriod()">
	<select name="year"></select>
</form>

<div id="usedList">
	<h1>사용 내역</h1>
	<table>
		<tr>
			<th>성명</th>
			<th>부서명</th>
			<th>연차 사용기간</th>
			<th>사용 연차</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${annualVO.annualLeaveUsedHistorys}" var="annualLeaveUsedHistory">
			<c:if test="${!empty annualLeaveUsedHistory.annualLeaveUsedHistoryNo}">
				<tr>
					<td>${principal.name}</td>
					<td>${principal.departmentCdName}</td>
					<td>
						<fmt:formatDate value="${annualLeaveUsedHistory.annualLeaveStart}" pattern="yyyy-MM-dd" />
						~
						<fmt:formatDate value="${annualLeaveUsedHistory.annualLeaveEnd}" pattern="yyyy-MM-dd" />
					</td>
					<td>${annualLeaveUsedHistory.usedAnnualLeaveCount}</td>
					<td>${annualLeaveUsedHistory.reason}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>

<div id="generatedList">
	<h1>발생 내역</h1>
	<table>
		<tr>
			<th>발생일</th>
			<th>발생일수</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${annualVO.annualLeaveOccurredHistorys}" var="annualLeaveOccurredHistory">
			<c:if test="${!empty annualLeaveOccurredHistory.annualLeaveOccurredHistoryNo}">
				<tr>
					<td><fmt:formatDate value="${annualLeaveOccurredHistory.occurredDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${annualLeaveOccurredHistory.occurredType == 0}">+</c:if>
						<c:if test="${annualLeaveOccurredHistory.occurredType == 1}">-</c:if>
						${annualLeaveOccurredHistory.occurredCount}
					</td>
					<td>${annualLeaveOccurredHistory.description}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>