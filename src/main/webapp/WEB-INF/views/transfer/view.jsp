<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tr>
		<th>일자</th>
		<th>사번</th>
		<th>성명</th>
		<th>발령 구분</th>
		<th>이전 직급</th>
		<th>발령 직급</th>
		<th>이전 부서</th>
		<th>발령 부서</th>
	</tr>
	<c:forEach items="transferList" var="transfer">
		<tr>
			<td>${transfer.transferDate}</td>
			<td>${transfer.employeeId}</td>
			<td>${transfer.name}</td>
			<td>${transfer.transferTypeCdName}</td>
			<td>${transfer.beforePositionCdName}</td>
			<td>${transfer.transferPositionCdName}</td>
			<td>${transfer.beforeDepartmentCdName}</td>
			<td>${transfer.transferDepartmentCdName}</td>
		</tr>
	</c:forEach>
</table>