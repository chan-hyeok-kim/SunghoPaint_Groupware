<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/js/commons/excelDownload.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/humanresource/list.css">

<script>
	$(function(){
		if("${pager.startDate}") $("[name='startDate']").val("${pager.startDate}");
		if("${pager.endDate}") $("[name='endDate']").val("${pager.endDate}");

		let department = $("[name='department']").attr("data-department");
		$("[name='department'] > option[value='" + department + "']").prop("selected", true);
		
		let kind = $("[name='kind']").attr("data-kind");
		$("[name='kind'] > option[value='" + kind + "']").prop("selected", true);

		$(".page-link[data-num='${pager.page}']").css("background-color", "#D4E9FB");
	});

	$(function(){
		$("#searchBtn").click(function(){
			$("[name='page']").val(1);
			$("form#searchForm").submit();
		});
	});

	$(function(){
		$(".page-link").click(function(){
			let page = $(this).attr("data-num");
			$("[name='page']").val(page);
			
			$("form#searchForm").submit();
		});
	});
</script>

<div id="wrapper">
	<form action="./list" method="GET" id="searchForm">
		<input type="hidden" name="page" value="${pager.page}">
		
		<div>
			<input type="date" name="startDate" value="${startDate}">
			~
			<input type="date" name="endDate" value="${endDate}">
		</div>
		
		<div>
			<c:if test="${empty transferList}">
				<select name="department" data-department="${pager.department}">
					<option value="">전체</option>
					<c:forEach items="${departmentList}" var="department">
						<option value="${department.code}">${department.codeName}</option>
					</c:forEach>
				</select>
			</c:if>
		
			<select name="kind" data-kind="${pager.kind}">
				<option value="employeeID">사번</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="keyword" value="${pager.keyword}">
			<button type="button" id="searchBtn" class="btn btn-gradient-primary">검색</button>
		</div>
	</form>