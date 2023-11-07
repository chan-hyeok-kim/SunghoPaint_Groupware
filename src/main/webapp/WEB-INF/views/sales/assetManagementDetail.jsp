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

						<div style="float:left">자산 수정</div> 
						<br>
						
						<div style="text-align: right;">
							
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


						<div class="container-fluid">
							
							
							<label for="carSortList" class="form-label">구분</label>
								<select class="form-select form-select-sm form-control-short" aria-label="Small select example" id="carSortList" name="carModelCd">
								    <option value="C001" ${detail.carModelCd eq 'C001' ? 'selected' : ''}>경차</option>
								    <option value="C002" ${detail.carModelCd eq 'C002' ? 'selected' : ''}>세단</option>
								    <option value="C003" ${detail.carModelCd eq 'C003' ? 'selected' : ''}>SUV</option>
								    <option value="C004" ${detail.carModelCd eq 'C004' ? 'selected' : ''}>1톤</option>
								    <option value="C005" ${detail.carModelCd eq 'C005' ? 'selected' : ''}>4.5톤</option>
								</select>
								
							<br>
							
							<label for="carName" class="form-label">이름</label>
							<input type="text" class="form-control form-control-short" id="carName" name="carModelName" value="${detail.carModelName}">
							
							<br>
							<label for="carSortStatus" class="form-label">구분</label>
								<select class="form-select form-select-sm form-control-short" aria-label="Small select example" id="carSortStatus" name="carStatusCd">
							<c:choose>
								<c:when test="${detail.carStatusCd eq 'C012'}">
								    <option value="C011" ${detail.carStatusCd eq 'C011' ? 'selected' : ''} disabled>대여 가능</option>
								    <option value="C012" ${detail.carStatusCd eq 'C012' ? 'selected' : ''}>대여 중</option>
								    <option value="C013" ${detail.carStatusCd eq 'C013' ? 'selected' : ''} disabled>대여 불가</option>
								</c:when>
								<c:otherwise>
									<option value="C011" ${detail.carStatusCd eq 'C011' ? 'selected' : ''}>대여 가능</option>
								    <option value="C012" ${detail.carStatusCd eq 'C012' ? 'selected' : ''} disabled>대여 중</option>
								    <option value="C013" ${detail.carStatusCd eq 'C013' ? 'selected' : ''}>대여 불가</option>
								</c:otherwise>
							</c:choose>
								</select>
								
							<br>
							<label for="carReason" class="form-label">사유</label>
							<input type="text" class="form-control form-control-short" id="carReason" name="carReason" value="${detail.carReason}">
								
								
							<br><br>
							<ul class="nav-tabs">
							</ul>
							<br>
							
							<div style="text-align: right;">
								<form action="./carUpdate" method="post" style=display:inline-block;>
									<input type="hidden" name="carNo" value="${detail.carNo}"/>
									<input type="hidden" name="carModelCd" value="${detail.carModelCd}"/>
									<input type="hidden" name="carModelName" value="${detail.carModelName}"/>
									<input type="hidden" name="carStatusCd" value="${detail.carStatusCd}"/>
									<input type="hidden" name="carReason" value="${detail.carReason}"/>
							        <button type="button" class="btn btn-primary" id="updateBtn" onclick="submitForm()">수정</button>
						        </form>
						        
						        <a href="./assetManagement"><button type="button" class="btn btn-secondary">취소</button></a>
						        <form id="delForm" action="./carDelete" method="post" style=display:inline-block;>
							        <input type="hidden" name="carNo" value="${detail.carNo}"/>
						        	<button id="delBtn" type="button" class="btn btn-danger" onclick="deleteCar()">삭제</button>
						        </form>
						    </div>
				  </div>
				  </div>
				  
				  
				</div>
              </div>
			</div>
</div>
		
		

<script type="text/javascript">


function submitForm() {
    var carSortList = document.getElementById('carSortList');
    var carModelName = document.getElementById('carName');
    var carSortStatus = document.getElementById('carSortStatus');

    var carNoInput = document.createElement('input');
    carNoInput.type = 'hidden';
    carNoInput.name = 'carNo';
    carNoInput.value = "${detail.carNo}";

    var carModelCdInput = document.createElement('input');
    carModelCdInput.type = 'hidden';
    carModelCdInput.name = 'carModelCd';
    carModelCdInput.value = carSortList.value;

    var carModelNameInput = document.createElement('input');
    carModelNameInput.type = 'hidden';
    carModelNameInput.name = 'carModelName';
    carModelNameInput.value = carModelName.value;

    var carStatusCdInput = document.createElement('input');
    carStatusCdInput.type = 'hidden';
    carStatusCdInput.name = 'carStatusCd';
    carStatusCdInput.value = carSortStatus.value;
    
    var carReasonInput = document.createElement('input');
    carReasonInput.type = 'hidden';
    carReasonInput.name = 'carReason';
    carReasonInput.value = carReason.value;

    var form = document.createElement('form');
    form.action = './carUpdate';
    form.method = 'post';
    form.style.display = 'none';

    form.appendChild(carNoInput);
    form.appendChild(carModelCdInput);
    form.appendChild(carModelNameInput);
    form.appendChild(carStatusCdInput);
    form.appendChild(carReasonInput);
    
    document.body.appendChild(form);
    form.submit();
}

 
function deleteCar() {
    var carStatusCd = "${detail.carStatusCd}";

    if (carStatusCd !== 'C012') {
    	 swal({
             title: "삭제 확인",
             text: "삭제된 자산은 복구할 수 없습니다. 정말 삭제하시겠습니까?",
             icon: "warning",
             buttons: ["취소", "삭제"],
             dangerMode: true,
         })
         .then((willDelete) => {
             if (willDelete) {
                 document.getElementById('delForm').submit();
             }
         });
    } else {
        alert('대여 중인 차량은 삭제할 수 없습니다.');
    }
}

</script>

</body>
</html>