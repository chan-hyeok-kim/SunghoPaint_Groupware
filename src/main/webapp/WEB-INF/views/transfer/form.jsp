<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/js/transfer/form.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/transfer/form.css">

<h1 id="title">인사 발령</h1>
<form id="transferForm" method="POST">
	<div class="component">
		<label for="transferDate">발령 일자</label>
		<input type="date" name="transferDate" id="transferDate">
	</div>
	<div class="component">
		<label for="employeeId">사번</label>
		<div class="inputWrap">
			<input type="text" name="employeeId" id="employeeId">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="name">이름</label>
		<input type="text" name="name" id="name">
	</div>
	<div class="component">
		<label for="transferTypeCd">발령 구분</label>
		<div class="inputWrap">
			<input type="text" name="transferTypeCd" id="transferTypeCd">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforePositionCd">이전 직급</label>
		<div class="inputWrap">
			<input type="text" name="beforePositionCd" id="beforePositionCd">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="transferPositionCd">발령 직급</label>
		<div class="inputWrap">
			<input type="text" name="transferPositionCd" id="transferPositionCd">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforeDepartmentCd">이전 부서</label>
		<div class="inputWrap">
			<input type="text" name="beforeDepartmentCd" id="beforeDepartmentCd">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="transferDepartmentCd">발령 부서</label>
		<div class="inputWrap">
			<input type="text" name="transferDepartmentCd" id="transferDepartmentCd">
			<img class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div id="buttonWrap">
		<button type="submit">등록</button>
	</div>
</form>