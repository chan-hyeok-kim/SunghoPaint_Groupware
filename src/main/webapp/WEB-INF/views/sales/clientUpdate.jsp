<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

						<div style="float:left"><p style="font-weight:bold; font-size: 20px;">${getClientDetail.clientName}</p></div> 
						<div style="text-align: right;">
							<a id="updateClient" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">
							<span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-size: 12px; padding: 5px 10px;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">확인</span></a>
							
							<a href="./clientDetail?clientNo=${getClientDetail.clientNo}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">
							<span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-size: 12px; padding: 5px 10px;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">취소</span></a>
						</div>
					</div>
					<br>
					
					

					<ul class="nav-tabs">
					</ul>
					<br>

					
					<div style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">

						<form action="./clientUpdate" method="post">
						<div class="container-fluid">
						<div class="row">
                    		<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">업체명</label>
							<input type="text" class="form-control form-control-short" id="clientName" name="clientName" value="${getClientDetail.clientName}">
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">거래처 구분</label>
					        <select class="form-select form-select-sm form-control-short" aria-label="Small select example" id="clientTypeCd" name="clientTypeCd">
								    <option value="C021">매출처</option>
								    <option value="C022">매입처</option>
								    <option value="C033">매출/매입처</option>
								</select>
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">업종</label>
							<input type="text" class="form-control form-control-short" id="clientIndustry" name="clientIndustry" value="${getClientDetail.clientIndustry}">
							</div>
						</div>
						<br>
						
						<div class="row">
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">대표자명</label>
							<input type="text" class="form-control form-control-short" id="clientRepresent" name="clientRepresent" value="${getClientDetail.clientRepresent}">
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">대표번호</label>
							<input type="text" class="form-control form-control-short" id="clientNumber" name="clientNumber" value="${getClientDetail.clientNumber}">
							</div>
                    		<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">사업장 주소</label>
							<input type="text" class="form-control form-control-short" id="clientAddress" name="clientAddress" value="${getClientDetail.clientAddress}">
							</div>
						</div>
						<br>
						
						<div class="row">
                    		<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">거래처 담당자</label>
							<select class="form-select form-select-sm" aria-label="Small select example" id="clientManager" name="clientManager">
							  <c:forEach items="${getManager}" var="car">
						        <option value="${car.name}">${car.name} ${car.codeName}</option>
						    </c:forEach>
							</select>
							
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">담당자 연락처</label>
							<input type="text" class="form-control form-control-short" id="clientPhone" name="clientPhone" value="${getClientDetail.clientPhone}">
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">은행명</label>
							<input type="text" class="form-control form-control-short" id="clientBank" name="clientBank" value="${getClientDetail.clientBank}">
							</div>
						</div>
						<br>
						
						<div class="row">
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">계좌번호</label>
							<input type="text" class="form-control form-control-short" id="clientAccountNo" name="clientAccountNo" value="${getClientDetail.clientAccountNo}">
							</div>
							<div class="col-md-4">
							<label for="carReason" class="form-label" style="font-weight:bold;">예금주명</label>
							<input type="text" class="form-control form-control-short" id="clientBankName" name="clientBankName" value="${getClientDetail.clientBankName}">
							</div>
						</div>
						<br>
						
				  </div>
				  <input type="hidden" class="form-control form-control-short" id="clientNo" name="clientNo" value="${getClientDetail.clientNo}">
							
				  			</form>
				  </div>
				 
				</div>
              </div>
			</div>
</div>
		
		
		
<script type="text/javascript">
$("#updateClient").click(function(){
    $("form").submit();
});
</script>
</body>
</html>