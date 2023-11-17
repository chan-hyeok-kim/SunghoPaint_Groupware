<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css"
	type="text/css">


<style type="text/css">
#tree_list_add {
	margin-left: 20px;
}

#tree-table {
	border: 1px solid black;
	height: 360px;
	width: 220px;
	padding: 10px;
}

#tree-table-div {
	margin: 10px;
}

#approval-table {
	text-align: center;
	width: 100%
}

.nav-tabs>li:before, .nav-tabs>li:after {
	content: " ";
	display: block;
	position: absolute;
	top: 0;
	height: 100%;
	width: 12px;
	background-color: #f7f7f7;
	transition: all 250ms ease;
}

.nav-tabs>li {
	float: left;
	position: relative;
	cursor: pointer;
	z-index: 2;
	transition: all 250ms ease;
	padding: 0;
	margin: 5px 12px -1px 0;
	background-color: #f7f7f7;
	border-top: 1px solid #d4d4d4;
	border-bottom: 1px solid #d4d4d4;
	list-style: none;
}

.nav-tabs>li>a {
	color: #999;
	display: block;
	padding: 4px 10px 1px 11px;
	text-decoration: none;
}

.nav-tabs>li:after {
	left: -4px;
	transform: skew(-25deg, 0deg);
	box-shadow: #d4d4d4 -1px 1px 0;
}

.nav-tabs>li {
	border-radius: 7px 7px 0 0;
}

.nav-tabs>li:before {
	right: -4px;;
	transform: skew(25deg, 0deg);
	box-shadow: #d4d4d4 1px 1px 0;
}

.nav-tabs>li:before {
	border-radius: 0 2px 0 0;
}

.nav-tabs>li:after {
	border-radius: 2px 0 0 0;
}

.link-tab:hover {
	background: #f7f7f7;
}

.wrapper-toolbar {
	padding: 10px 10px;
}

ul.nav-tabs {
	border-bottom: 1px solid #d4d4d4;
}

#grid-top-date {
	margin: 4px 0;
	line-height: 1.7;
	position: relative;
	display: inline-block;
}

#top-search-bar {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

#top-search-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#top-search-select {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}
</style>
</head>
<body id="page-top">
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="card">
				<div class="card-body">

					<div class="wrapper-toolbar">

						<div style="float:left">발주서 리스트</div> 
						<div style="text-align: right;">
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">전체</option>
									<option>거래처</option>
									<option>발주번호</option>
									<option>발주번호</option>
									<option>발주번호</option>
									<option>발주번호</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>

					<ul class="nav-tabs">
						<li><a class="link-tab">전체</a></li>
						<li><a class="link-tab">결재중</a></li>
						<li><a class="link-tab">진행중</a></li>
						<li><a class="link-tab">미확인</a></li>
						<li><a class="link-tab">완료</a></li>
					</ul>


					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">
						<div class="container-fluid">
							<table class="table-bordered mt-2" id="approval-table">
								<thead>
									<tr>
										<th>#</th>
										<th>일자</th>
										<th>거래처명</th>
										<th>품목명</th>
										<th>금액 합계</th>
										<th>거래 유형</th>
										<th>공장명</th>
										<th>발주 현황</th>
									</tr>
								</thead>
								<tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><input type="checkbox" ></td>
				             <td>${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.approvalContents}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApprover}</td>
				             <c:choose>
				             <c:when test="${vo.approvalStatusCd eq 'R001'}">
				             <td>기안중</td>
				             </c:when>
				             </c:choose>
				             <td><a>기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>

							</table>
						</div>
					</div>
						
						<!-- pagination -->
					
		<br><br><br><br><br>
					
		<nav class="room-pagination" aria-label="Page navigation example">
			<ul class="pagination" id="product-ul-list2" >

				<li class="page-item ${pager.pre?'':'disabled'}"><a
					class="page-link"
					href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}"
					aria-label="Previous fa-long-arrow-left"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.next}">
					<li class="page-item"><a class="page-link"
						href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}"
						aria-label="Next fa-long-arrow-right"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>



			</ul>
		</nav>
						
						<!-- Button List  -->
						
						<div style="float: right;">
							<button class="btn btn-info" onclick="location.href='/order/add'">신규 발주서 추가</button>
						</div>
					</div>
			</div>
		</div>
		<script src="/js/commons/list-date.js"></script>
</body>
</html>