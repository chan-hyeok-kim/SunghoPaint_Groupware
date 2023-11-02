<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="/js/transfer/form.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/transfer/form.css">

<h1 id="title">발령 등록</h1>
<form id="transferForm" method="POST">
	<div class="component">
		<label for="transferDate">발령 일자</label>
		<input type="date" name="transferDate" id="transferDate">
	</div>
	<div class="component">
		<label for="employeeId">사번</label>
		<div class="inputWrap">
			<input type="text" name="employeeId" id="employeeId" data-search-type="existing" readonly>
			<img id="search_existing" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" data-search-type="existing" readonly>
	</div>
	<div class="component">
		<label for="transferTypeCdName">발령 구분</label>
		<div class="inputWrap">
			<input type="hidden" name="transferTypeCd">
			<input type="text" name="transferTypeCdName" id="transferTypeCdName" data-search-type="transferType" readonly>
			<img id="search_transferType" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforePositionCdName">이전 직급</label>
		<input type="hidden" name="beforePositionCd">
		<input type="text" name="beforePositionCdName" id="beforePositionCdName" data-search-type="existing" readonly>
	</div>
	<div class="component">
		<label for="transferPositionCdName">발령 직급</label>
		<div class="inputWrap">
			<input type="hidden" name="transferPositionCd">
			<input type="text" name="transferPositionCdName" id="transferPositionCdName" data-search-type="position" readonly>
			<img id="search_position" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforeDepartmentCdName">이전 부서</label>
		<input type="hidden" name="beforeDepartmentCd">
		<input type="text" name="beforeDepartmentCdName" id="beforeDepartmentCdName" data-search-type="existing" readonly>
	</div>
	<div class="component">
		<label for="transferDepartmentCdName">발령 부서</label>
		<div class="inputWrap">
			<input type="hidden" name="transferDepartmentCd">
			<input type="text" name="transferDepartmentCdName" id="transferDepartmentCdName" data-search-type="department" readonly>
			<img id="search_department" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div id="buttonWrap">
		<button type="submit">등록</button>
	</div>
</form>