<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/js/humanresource/list.js"></script>
<style type="text/css">
	tr:not(:first-of-type):hover{
		background-color:#90CAF9;
		cursor:pointer; 
	}
	
	/*
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
	*/
</style>

<%@include file="/WEB-INF/views/humanresource/search.jsp"%>
	
	<div id="buttons">
		<button id="excelDownload">목록 다운로드</button>
	</div>

	<table>
		<tr>
			<th>입사일</th>
			<th>사번</th>
			<th>부서</th>
			<th>성명</th>
			<th>직급</th>
			<th>이메일</th>
			<th>대표번호</th>
		</tr>
		<c:forEach items="${humanResourceList}" var="humanResource">
			<tr onclick="location.href='./update?employeeID=${humanResource.employeeID}'">
				<td>${humanResource.joinDate}</td>
				<td>${humanResource.employeeID}</td>
				<td>${humanResource.departmentCdName}</td>
				<td>${humanResource.name}</td>
				<td>${humanResource.positionCdName}</td>
				<td>${humanResource.email}</td>
				<td>${humanResource.mainNumber}</td>
				<!-- <td><button class="del" onclick="del('${humanResource.employeeID}', event)">삭제</button></td> -->
			</tr>
		</c:forEach>
	</table>
	
	<%@include file="/WEB-INF/views/humanresource/paging.jsp"%>
</div>