<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	tr:not(:first-of-type):hover{
		background-color:#90CAF9;
		cursor:pointer; 
	}
</style>

<%@include file="/WEB-INF/views/humanresource/search.jsp"%>
	
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
		<c:forEach items="${transferList}" var="transfer">
			<tr onclick="location.href='./update?employeeID=${transfer.employeeID}'">
				<td>${transfer.transferDate}</td>
				<td>${transfer.employeeID}</td>
				<td>${transfer.name}</td>
				<td>${transfer.transferTypeCdName}</td>
				<td>${transfer.beforePositionCdName}</td>
				<td>${transfer.transferPositionCdName}</td>
				<td>${transfer.beforeDepartmentCdName}</td>
				<td>${transfer.transferDepartmentCdName}</td>
			</tr>
		</c:forEach>
	</table>
	
	<%@include file="/WEB-INF/views/humanresource/paging.jsp"%>
</div>