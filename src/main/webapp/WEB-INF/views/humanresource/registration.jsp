<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/js/commons/registration.js"></script>
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
			<td colspan="3">
				<input type="hidden" name="departmentCd">
				<input type="text" name="departmentCdName" readonly="readonly" data-search-type="department">
			</td>
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
			<td>
				<input type="hidden" name="positionCd">
				<input type="text" name="positionCdName" readonly="readonly" data-search-type="position">
			</td>
			<th>대표번호</th>
			<td><input type="text" name="mainNumber"></td>
		</tr>
	</table>
	<table id="additionalInfo">
		<tr>
			<th>입사일</th>
			<td><input type="date" name="joinDate"></td>
			<th>주소</th>
			<td><input type="text" name="address" readonly="readonly" onclick="daumPostcode()"></td>
			<th>은행</th>
			<td><input type="text" name="bank"></td>
		</tr>
		<tr>
			<th>입사구분</th>
			<td>
				<select name="joinType">
					<option value="0">신입</option>
					<option value="1">경력</option>
				</select>
			</td>
			<th>퇴사일</th>
			<td><input type="date" name="quitDate"></td>
			<th>예금주</th>
			<td><input type="text" name="accountHolder"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" name="birth"></td>
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
	
	
	
	<div class="modal fade" id="addressDetailModal" tabindex="-1" role="dialog" aria-labelledby="addressDetailModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="message-text" class="col-form-label">상세주소를 입력해주세요.</label>
	            <textarea class="form-control" id="message-text"></textarea>
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
</form>