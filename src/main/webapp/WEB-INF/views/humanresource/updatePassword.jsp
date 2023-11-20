<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <script src="/js/humanresource/updatePassword.js"></script> -->
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/humanresource/updatePassword.css">

<div id="wrapper">
	<img src="/images/humanResource/security.png"><br>
	<header>
		<h1>비밀번호 변경</h1>
		<div>
			<ul>
				<li>비밀번호 최소 길이 : 8자</li>
				<li>비밀번호 최대 길이 : 16자</li>
				<li>필수 포함 문자 : 숫자, 문자, 특수문자</li>
				<li>ex) 1234abcd#</li>
			</ul>
		</div>
	</header>
	<form:form modelAttribute="updatePasswordVO" action="./updatePassword" method="POST">
		<div>
			<form:password path="curPassword" showPassword="true" placeholder="현재 비밀번호" /><br>
			<form:errors path="curPassword" />
		</div>
		<br>
		<div>
			<form:password path="newPassword" showPassword="true" placeholder="새로운 비밀번호" /><br>
			<form:errors path="newPassword" />
		</div>
		<br>
		<div>
			<form:password path="checkNewPassword" showPassword="true" placeholder="새로운 비밀번호 확인" /><br>
			<form:errors path="checkNewPassword" />
		</div>
		<br>
		<form:button>변경</form:button>
	</form:form>
</div>