<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/js/commons/registration.js"></script>
<script src="/js/humanresource/registration.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/humanresource/registration.css">

<script>
	$(function(){
		$("input#yearsOfService").attr("type", "number");
		$("input#yearsOfService").attr("min", "0");
		$("input#yearsOfService").attr("max", "100");
		
		if("${isUpdate}") $("form#registrationForm").attr("action", "./update");
		
		if("${isDetail}"){
			$("*").off("click");
			$("*:not(.nav-link, #return)").removeAttr("onclick");
			
			$("select").attr("disabled", true);
			$("input[type='file']").attr("disabled", true);
			$("input").attr("readonly", true);
			$("input").css("cursor", "default");
		}
	});

	$(function(){
		if("${hasErrors}"){
			if($("#joinDateErrors").css("display") != "none"){
				$("#joinDateErrors").empty();
				$("#joinDateErrors").html("<span>'입사일'을 선택해주세요.</span>");
			}

			if($("#birthErrors").css("display") != "none"){
				$("#birthErrors").empty();
				$("#birthErrors").html("<span>'생년월일'을 선택해주세요.</span>");
			}

			$("#errorsDetailModal").modal("show");
		}
	});
</script>

<c:if test="${isUpdate}">
	<button id="updateRole" onclick="updateRole('${humanResourceVO.employeeID}')">권한 수정</button>
</c:if>
<form:form modelAttribute="humanResourceVO" action="./registration" method="POST" enctype="multipart/form-data" id="registrationForm">
	<table id="basicInfo">
		<tr>
			<td rowspan="4" id="profile">
				<c:if test="${empty humanResourceVO.profile}">
					<img src="/images/humanresource/profile.png">
				</c:if>
				<c:if test="${!empty humanResourceVO.profile}">
					<img src="${humanResourceVO.profile}">
				</c:if>
				<input type="file" name="file" accept="image/*" onchange="validation(this)">
			</td>
			<th>이름</th>
			<th>사번</th>
			<td>
				<input type="hidden" name="employeeID" value="${humanResourceVO.employeeID}">
				${humanResourceVO.employeeID}
			</td>
			<th>부서</th>
			<td>
				<form:hidden path="departmentCd" />
				<form:input path="departmentCdName" readonly="true" data-search-type="department" />
			</td>
		</tr>
		<tr>
			<td rowspan="3"><form:input path="name" /></td>
			<th>이메일</th>
			<td><form:input path="email" /></td>
			<th>내선번호</th>
			<td><form:input path="extensionNumber" placeholder="'-' 제외" /></td>
		</tr>
		<tr>
			<th>직급</th>
			<td>
				<form:hidden path="positionCd" />
				<form:input path="positionCdName" readonly="true" data-search-type="position" />
			</td>
			<th>휴대폰</th>
			<td><form:input path="phone" placeholder="'-' 제외" /></td>
		</tr>
		<tr>
			<th>근속연수</th>
			<td><form:input path="yearsOfService" /></td>
			<th>대표번호</th>
			<td><form:input path="mainNumber" placeholder="'-' 제외" /></td>
		</tr>
	</table>
	<table id="additionalInfo">
		<tr>
			<th>입사일</th>
			<td><input type="date" name="joinDate" value="${humanResourceVO.joinDate}"></td>
			<th>주소</th>
			<td><form:input path="address" readonly="true" onclick="daumPostcode()" /></td>
			<th>은행</th>
			<td><form:input path="bank" /></td>
		</tr>
		<tr>
			<th>입사구분</th>
			<td>
				<form:select path="joinType">
					<form:option value="0">신입</form:option>
					<form:option value="1">경력</form:option>
				</form:select>
			</td>
			<th>퇴사일</th>
			<td><input type="date" name="quitDate" value="${humanResourceVO.quitDate}"></td>
			<th>예금주</th>
			<td><form:input path="accountHolder" /></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" name="birth" value="${humanResourceVO.birth}"></td>
			<th>퇴사사유</th>
			<td><form:input path="quitReason" /></td>
			<th>계좌번호</th>
			<td><form:input path="accountNumber" placeholder="'-' 제외" /></td>
		</tr>
	</table>

	<div id="buttons">
		<c:if test="${isRegistration}">
			<button type="button" id="regist">등록</button>
		</c:if>
		<c:if test="${isUpdate}">
			<button type="button" id="update">수정</button>
		</c:if>
		<c:if test="${empty isDetail}">
			<button type="button" id="cancel" onclick="location.href='./list'">취소</button>
		</c:if>
		<c:if test="${isDetail}">
			<button type="button" id="return" onclick="location.href='../'">돌아가기</button>
		</c:if>
	</div>
	
	
	
	<div class="modal fade" id="addressDetailModal" tabindex="-1" role="dialog" aria-labelledby="addressDetailModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="addressDetailModalLabel"></h5>
	        <img src="/images/humanresource/close-icon.png" class="close" data-dismiss="modal" aria-label="Close">
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="message-text" class="col-form-label">상세주소를 입력해주세요.</label>
				<input type="text" id="message-text" class="form-control">
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" id="modal-submit" class="btn btn-primary">등록</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<div class="modal fade" id="errorsDetailModal" tabindex="-1" role="dialog" aria-labelledby="errorsDetailModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorsDetailModalTitle">
						<c:if test="${isRegistration}">등록 실패</c:if>
						<c:if test="${isUpdate}">수정 실패</c:if>
					</h5>
					<img src="/images/humanresource/close-icon.png" class="close" data-dismiss="modal" aria-label="Close">
				</div>
				<div class="modal-body">
					<ul>
						<li id="joinDateErrors"><form:errors path="joinDate" /></li>
						<li><form:errors path="name" /></li>
						<li id="birthErrors"><form:errors path="birth" /></li>
						<li><form:errors path="departmentCd" /></li>
						<li><form:errors path="positionCd" /></li>
						<li><form:errors path="yearsOfService" /></li>
						<li><form:errors path="extensionNumber" /></li>
						<li><form:errors path="phone" /></li>
						<li><form:errors path="mainNumber" /></li>
						<li><form:errors path="email" /></li>
						<li><form:errors path="address" /></li>
						<li><form:errors path="bank" /></li>
						<li><form:errors path="accountNumber" /></li>
						<li><form:errors path="accountHolder" /></li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form:form>