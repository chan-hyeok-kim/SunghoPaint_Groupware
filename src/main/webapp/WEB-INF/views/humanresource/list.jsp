<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/humanresource/list.css">
<link rel="stylesheet" href="/css/transfer/list.css">

<script>
	$(function(){
		let kind = $("[name='department']").attr("data-kind");
		$("[name='department'] > option[value='" + kind + "']").prop("selected", true);
		
		$(".page-link[data-num='${pager.page}']").css("background-color", "#D4E9FB");
	});
	
	$(function(){
		$("#searchBtn").click(function(){
			$("[name='page']").val(1);
			$("form").submit();
		});
	});
	
	$(function(){
		$(".page-link").click(function(){
			let page = $(this).attr("data-num");
			$("[name='page']").val(page);
			
			$("form").submit();
		});
	});
</script>

<div id="wrapper">
	<form action="./list" method="GET">
		<input type="hidden" name="page" value="${pager.page}">
	
		<select name="department" data-kind="${pager.department}">
			<option value="">전체</option>
			<c:forEach items="${departmentList}" var="department">
				<option value="${department.code}">${department.codeName}</option>
			</c:forEach>
		</select>
		<input type="text" name="name" value="${pager.name}">
		<button type="button" id="searchBtn" class="btn btn-gradient-primary">검색</button>
	</form>
	
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
			</tr>
		</c:forEach>
	</table>
	
	<nav>
		<ul class="pagination">
			<li class="page-item ${pager.pre ? '' : 'disabled'}">
				<a class="page-link" href="#" data-num="${pager.startNum - 1}"><i class="mdi mdi-chevron-left"></i></a>
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
</div>