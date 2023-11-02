<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/transfer/view.css">

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

<nav>
	<ul class="pagination">
		<li class="page-item ${pager.pre ? '' : 'disabled'}">
			<a class="page-link" data-num="${pager.startNum - 1}"><i class="mdi mdi-chevron-left"></i></a>
		</li>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li class="page-item">
				<a class="page-link" href="#" data-num="${i}">${i}</a>
			</li>
		</c:forEach>
		<li class="page-item ${pager.next ? '' : 'disabled'}">
			<a class="page-link" href="#" data-num="${pager.lastNum + 1}"><i class="mdi mdi-chevron-right"></i></a>
		</li>
	</ul>
</nav>