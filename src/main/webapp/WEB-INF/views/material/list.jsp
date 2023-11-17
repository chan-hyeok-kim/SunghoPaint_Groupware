<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						물품 리스트 <span
							style="margin-left: 700px; text-align: right; width: 700px;">
							<form class="form-inline"
								style="width: 700px; display: inline-block;">

								<!-- 검색 설정 -->
								<select name="kind" class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected" value="code">물품코드</option>
									<option value="name">물품이름</option>
									<option value="234">품목구분</option>
								</select> 							
													
								<input style="display: inline-block;" id="top-search-bar" name="search"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</span>
					</div>

					<ul class="nav-tabs">
						<!-- <li><a class="link-tab">전체</a></li>
						<li><a class="link-tab">기안중</a></li>
						<li><a class="link-tab">진행중</a></li>
						<li><a class="link-tab">반려</a></li>
						<li><a class="link-tab">결재</a></li> -->
					</ul>


					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						
					</div>
					<div id="content">


						<div class="container-fluid">




							<table class="table-bordered mt-2" id="approval-table">
								<thead>								
									<tr>
										<th>선택</th>
										<th>코드</th>
										<th>제품명</th>
										<th>원료명</th>
										<th>입고가</th>
										<th>출고가</th>
										<th>재고</th>
										<th>품목구분</th>
										<th>보관장소</th>
										<th>사용여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo" varStatus="i">
										<tr>
											<td><input type="checkbox" name="checkList" value="${vo.materialProductCd}"></td>
										    <td><a href="./detail?materialProductCd=${vo.materialProductCd}">${vo.materialProductCd}</a></td>
								            
								            <c:if test="${vo.materialProductCategory == '제품'}">
								            <td width="200">${vo.codeName}</td>
								            <td width="200">-</td>
								            </c:if>
								            
								            <c:if test="${vo.materialProductCategory == '원료'}">
								            <td width="200">-</td>
								            <td width="200">${vo.codeName}</td>
								            </c:if>   
								            
								            <c:if test="${vo.materialProductCategory == '원료'}">
											<td><fmt:formatNumber value="${vo.materialProductPrice}" pattern="###,###,###" />원
											</td>
											<td>-</td>											
											</c:if>
											
											<c:if test="${vo.materialProductCategory == '제품'}">
											<td>-</td>
											<td><fmt:formatNumber value="${vo.materialProductPrice}" pattern="###,###,###" />원
											</td>
											</c:if>
											
											
											<td><c:if test="${vo.materialProductCategory == '원료'}">
											<fmt:formatNumber value="${vo.materialProductStock}" pattern="###,###,###" />kg
											</c:if>
											<c:if test="${vo.materialProductCategory == '제품'}">
											<fmt:formatNumber value="${vo.materialProductStock}" pattern="###,###,###" />EA
											</c:if></td>																		
								            <td>${vo.materialProductCategory}</td>
								            <td><c:if test="${vo.materialProductCategory == '원료'}">원료 창고</c:if>
											<c:if test="${vo.materialProductCategory == '제품'}">제품 창고</c:if></td>
											<td>${vo.materialProductUse}</td>
																						
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
					</div>


					<!-- pagination -->
								<div style="text-align: center; margin: 20px 20px;">
				  <nav aria-label="Page navigation example" style="display: inline-block;">


  <nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		 <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/material/list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/material/list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/material/list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
	</ul>
</nav>

</nav>
				</div>
						<!-- Button List  -->
						 <div style="margin-left:1200px;">
						      <button type="button" class="btn  btn-inverse-dark" id="delete-btn">선택 삭제</button>
						      <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#materialAddModal">신규 등록</button>
						  </div> 

	<!-- Modal -->
	<div class="modal fade" id="materialAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h1 class="modal-title fs-5" id="exampleModalLabel">신규 제품, 원료 등록</h1>


			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
			</div>
			<div class="modal-body">
			<form action="/material/add" method="post" id="frm">
				<div class="mb-3 btn-group" role="group" aria-label="Basic radio toggle button group">
					<table class="table-bordered mt-2" id="approval-table" >
						<tbody>
							<tr>
								<td width="200">코드</td>
								<td width="400"><input type="text" name="materialProductCd" class="form-control" id="code" placeholder="제품, 원료 코드를 입력하세요"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="number" name="materialProductPrice" class="form-control" id="price" placeholder="제품, 원료 가격을 입력하세요"></td>
							</tr>
							<tr>
								<td>사용여부</td>
								<td> <div class="btn-group use" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="materialProductUse" value="Yes" id="btnradio1" autocomplete="off" >
							  <label class="btn btn-outline-primary" for="btnradio1">Yes</label>
							
							  <input type="radio" class="btn-check" name="materialProductUse" value="No" id="btnradio2" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio2">No</label>
							</div></td>
							</tr>
							<tr>
								<td>재고</td>
								<td><input type="number" name="materialProductStock" class="form-control" id="stock" placeholder="재고를 입력하세요"></td>
							</tr>
							<tr>
								<td>범주</td>
								<td> <div class="btn-group cate" role="group" aria-label="Basic radio toggle button group">
								  <input type="radio" class="btn-check" name="materialProductCategory" value="제품" id="btnradio3" autocomplete="off" >
								  <label class="btn btn-outline-primary" for="btnradio3">제품</label>
								
								  <input type="radio" class="btn-check" name="materialProductCategory" value="원료" id="btnradio4" autocomplete="off">
								  <label class="btn btn-outline-primary" for="btnradio4">원료</label>
							</div></td>
							</tr>


						
							

						</tbody>

					</table>
				  </div>
			</div>
			<div class="modal-footer" >
			<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="close">닫기</button>
			<button type="button" class="btn btn-primary" id="add">제품, 원료등록</button>
			</form>
			</div>
		</div>
		</div>
  </div>











				</div>
			</div>
		</div>




	<script src="/js/commons/list-date.js"></script>
	<script src="/js/general/material/add-check.js"></script>	
	<script src="/js/general/material/delete-check.js"></script>

</body>
</html>