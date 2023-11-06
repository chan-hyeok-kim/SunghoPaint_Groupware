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


  td {
    padding: 10px 0; /* 위 아래 여백을 10px로 설정 */
  }

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

						기기 정보 <span
							style="margin-left: 700px; text-align: right; width: 700px;">
							
						</span>
					</div>

					

					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">



							<form action="./update" method="post">
							<table class="table-bordered mt-2" id="approval-table">
								<tbody>
									<tr>
										<td>제품, 원료 코드</td>
										<td><input type="text" name="materialProductCd" value="${dto.materialProductCd}" readonly></td>
									</tr>
									<tr>
										<td>제품, 원료 이름</td>
										<td><input type="text" name="codeName" value="${dto.codeName}" readonly></td>
									</tr>
									<tr>
										<td>가격</td>
										<td><input type="text" name="materialProductPrice" value="${dto.materialProductPrice}"></td>
									</tr>
									<tr>
										<td>사용여부</td>
										<td><input type="text" name="materialProductUse" value="${dto.materialProductUse}"></td>
									</tr>	
									<tr>
										<td>재고</td>
										<td><input type="text" name="materialProductStock" value="${dto.materialProductStock}"></td>
									</tr>	
									<tr>
										<td>범주</td>
										<td><input type="text" name="materialProductCategory" value="${dto.materialProductCategory}"></td>
									</tr>	
	

									
																		
		
								</tbody>
		
							</table>
							<br>
							<button type="submit" class="btn btn-info">수정</button>
						</form>
						</div>
					

						<br>
			

					</div>










				</div>
			</div>
		</div>




		<script src="/js/commons/list-date.js"></script>

		
</body>
</html>