<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="/js/commons/registration.js"></script>
<script src="/js/transfer/registration.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/transfer/registration.css">

<script>
	$(function(){
		if("${isUpdate}") $("form#registrationForm").attr("action", "./update");
	});
	
	$(function(){
		if("${hasErrors}"){
			if($("#transferDateErrors").css("display") != "none"){
				$("#transferDateErrors").empty();
				$("#transferDateErrors").html("<span>'발령 일자'를 선택해주세요.</span>");
			}
			
			$("#errorsDetailModal").modal("show");
		}
	});
</script>

<form:form modelAttribute="transferVO" action="./registration" method="POST" id="registrationForm">
	<form:hidden path="transferNo" />

	<div class="component">
		<form:label path="transferDate">발령 일자</form:label>
		<input type="date" name="transferDate" value="${transferVO.transferDate}" id="transferDate">
	</div>
	<div class="component">
		<label for="employeeID">사번</label>
		<div class="inputWrap">
			<form:input path="employeeID" data-search-type="existing" />
			<img id="search_existing" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="name">이름</label>
		<form:input path="name" data-search-type="existing" readonly="true" />
	</div>
	<div class="component">
		<label for="transferTypeCdName">발령 구분</label>
		<div class="inputWrap">
			<form:hidden path="transferTypeCd" />
			<form:input path="transferTypeCdName" data-search-type="transferType" readonly="true" />
			<img id="search_transferType" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforePositionCdName">이전 직급</label>
		<form:hidden path="beforePositionCd" />
		<form:input path="beforePositionCdName" data-search-type="existing" readonly="true" />
	</div>
	<div class="component">
		<label for="transferPositionCdName">발령 직급</label>
		<div class="inputWrap">
			<form:hidden path="transferPositionCd" />
			<form:input path="transferPositionCdName" data-search-type="position" readonly="true" />
			<img id="search_position" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div class="component">
		<label for="beforeDepartmentCdName">이전 부서</label>
		<form:hidden path="beforeDepartmentCd" />
		<form:input path="beforeDepartmentCdName" data-search-type="existing" readonly="true" />
	</div>
	<div class="component">
		<label for="transferDepartmentCdName">발령 부서</label>
		<div class="inputWrap">
			<form:hidden path="transferDepartmentCd" />
			<form:input path="transferDepartmentCdName" data-search-type="department" readonly="true" />
			<img id="search_department" class="search" src="/images/transfer/search-icon.png">
		</div>
	</div>
	<div id="buttonWrap">
		<c:if test="${isRegistration}">
			<form:button id="regist">등록</form:button>
		</c:if>
		<c:if test="${isUpdate}">
			<form:button id="update">수정</form:button>
		</c:if>
	</div>
	
	
	
	<div class="modal fade" id="errorsDetailModal" tabindex="-1" role="dialog" aria-labelledby="errorsDetailModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorsDetailModalTitle">
						<c:if test="${isRegistration}">등록 실패</c:if>
						<c:if test="${isUpdate}">수정 실패</c:if>
					</h5>
					<img src="/images/transfer/close-icon.png" class="close" data-dismiss="modal" aria-label="Close">
				</div>
				<div class="modal-body">
					<ul>
						<li id="transferDateErrors"><form:errors path="transferDate" /></li>
						<li><form:errors path="employeeID" /></li>
						<li><form:errors path="name" /></li>
						<li><form:errors path="transferTypeCd" /></li>
						<li><form:errors path="beforePositionCd" /></li>
						<li><form:errors path="transferPositionCd" /></li>
						<li><form:errors path="beforeDepartmentCd" /></li>
						<li><form:errors path="transferDepartmentCd" /></li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form:form>