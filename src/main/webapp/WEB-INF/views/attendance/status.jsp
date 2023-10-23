<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/js/attendance/status.js"></script>
<link rel="stylesheet" href="/css/attendance/status.css">

<sec:authorize access="isAuthenticated()" var="isAuthenticated" />

<script type="text/javascript">
	// init(${isAuthenticated});
</script>

<h1 id="title">근태 현황</h1>
<div id="move_month">
	<i>《</i>
	<h2>2023.10</h2>
	<i>》</i>
</div>
<div id="total">
	<div id="week_accrue" class="wrap">
		<h3>이번주 누적</h3>
		<div class="time">
			<span>3h</span><span>26m</span><span>24s</span>
		</div>
	</div>
	<div>
		<div id="week_excess" class="wrap">
			<h3>이번주 초과</h3>
			<div class="time">
				<span>0h</span><span>0m</span><span>0s</span>
			</div>
		</div>
		<div id="week_remain" class="wrap">
			<h3>이번주 잔여</h3>
			<div class="time">
				<span>3h</span><span>26m</span><span>24s</span>
			</div>
		</div>
	</div>
	<div>
		<div id="month_accrue" class="wrap">
			<h3>이번달 누적</h3>
			<div class="time">
				<span>0h</span><span>0m</span><span>0s</span>
			</div>
		</div>
		<div id ="month_extend" class="wrap">
			<h3>이번주 연장</h3>
			<div class="time">
				<span>3h</span><span>26m</span><span>24s</span>
			</div>
		</div>
	</div>
</div>