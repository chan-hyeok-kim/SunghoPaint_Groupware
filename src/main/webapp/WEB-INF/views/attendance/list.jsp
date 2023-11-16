<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/js/annual/list.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<!-- <link rel="stylesheet" href="/css/annual/list.css"> -->

<style type="text/css">
	table{
		width:100%;
	}
	
	table th,
	table td{
		height:35px;
		text-align:center;
	    border-collapse:collapse;
		border-top:1px solid #CDCDCD;
		border-bottom:1px solid #CDCDCD;
		font-size:14px;
	}
</style>

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
	<tr>
		<td>아무개</td>
		<td>50h 50m 50s</td>
		<c:forEach items="${weeksOfMonthInfo}" var="week" varStatus="week_status">
			<c:if test="${week_status.index != 0}">
				<td>50h 50m 50s</td>
			</c:if>
		</c:forEach>
	</tr>
</table>