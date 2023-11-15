<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- <script src="/js/annual/myAnnual.js"></script> -->
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/annual/myAnnual.css">

<sec:authentication property="principal" var="principal" />

<table>
	<tr>
		<td>
			<img src="${principal.profile}">
			<span>${principal.name} ${principal.positionCdName}</span>
		</td>
		<td>
			<h2>발생 연차</h2>
			<span></span>
		</td>
	</tr>
</table>