<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
	<title>로그인</title>
	<link rel="stylesheet" href="/css/humanresource/login.css" />
</head>
<body>
	<div id="container">
		<div id="logo">
			<img src="/images/humanresource/logo-clear.png">
		</div>
		<form:form modelAttribute="humanResourceVO" action="./login" method="POST">
			<form:input path="employeeID" placeholder="사번" />
			<form:password path="password" placeholder="비밀번호" />
			<form:button>로그인</form:button><br>
			<input type="checkbox" name="remember-me" id="remember-me">
			<label for="remember-me">로그인 유지</label>
		</form:form>
	</div>
</body>
</html>