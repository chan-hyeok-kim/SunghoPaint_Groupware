<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/js/transfer/list.js"></script>
<style type="text/css">
	tr:not(:first-of-type):hover{
		background-color:#90CAF9;
		cursor:pointer; 
	}

	button.del{
		width:50px; height:30px;
		background-color:#8D8D8D;
		border:none; border-radius:5px;
		font-size:13px;
		color:white;
	}

	button.del:hover{
		background-color:rgb(255, 90, 90);
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
			<tr onclick="location.href='./update?transferNo=${transfer.transferNo}'">
				<td>${transfer.transferDate}</td>
				<td>${transfer.employeeID}</td>
				<td>${transfer.name}</td>
				<td>${transfer.transferTypeCdName}</td>
				<td>${transfer.beforePositionCdName}</td>
				<td>${transfer.transferPositionCdName}</td>
				<td>${transfer.beforeDepartmentCdName}</td>
				<td>${transfer.transferDepartmentCdName}</td>
				<td><button class="del" onclick="del('${transfer.transferNo}', event)">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	
	<%@include file="/WEB-INF/views/humanresource/paging.jsp"%>
</div>