<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/js/humanresource/registration.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/humanresource/registration.css">

<h1 id="title">인사 등록</h1>
<form action="./registration" method="POST" enctype="multipart/form-data" id="registrationForm">
	<table id="basicInfo">
		<tr>
			<td rowspan="4" id="profile">
				<img src="/images/humanresource/profile.png">
				<input type="file" name="file" accept="image/*" onchange="validation(this)">
			</td>
			<th>이름</th>
			<th>부서</th>
			<td colspan="3"><input type="text" name="departmentCd"></td>
		</tr>
		<tr>
			<td rowspan="3"><input type="text" name="name"></td>
			<th>사번</th>
			<td></td>
			<th>내선번호</th>
			<td><input type="text" name="extensionNumber"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
			<th>휴대폰</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>직급</th>
			<td><input type="text" name="positionCd"></td>
			<th>대표번호</th>
			<td><input type="text" name="mainNumber"></td>
		</tr>
	</table>
	<table id="additionalInfo">
		<tr>
			<th>입사일</th>
			<td><input type="text" name="joinDate"></td>
			<th>주소</th>
			<td><input type="text" name="address"></td>
			<th>은행</th>
			<td><input type="text" name="bank"></td>
		</tr>
		<tr>
			<th>입사구분</th>
			<td><input type="text" name="joinType"></td>
			<th>퇴사일</th>
			<td><input type="text" name="quitDate"></td>
			<th>예금주</th>
			<td><input type="text" name="accountHolder"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth"></td>
			<th>퇴사사유</th>
			<td><input type="text" name="quitReason"></td>
			<th>계좌번호</th>
			<td><input type="text" name="accountNumber"></td>
		</tr>
	</table>

	<div id="buttons">
		<button type="submit">등록</button>
		<button type="button" onclick="location.href='../'">취소</button>
	</div>
</form>