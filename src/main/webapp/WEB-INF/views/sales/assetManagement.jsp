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

						<div style="float:left">자산 관리</div> 
						<div style="text-align: right;">
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">구분</option>
									<option>이름</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>
					<br>
					
					

					<ul class="nav-tabs">
					</ul>
					<br>

					<a href="#carAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">
					<span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-size: 12px; padding: 5px 10px;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">자산추가</span></a>

					<div style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">

							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" style="font-weight:bold;">번호</th>
							      <th scope="col" style="font-weight:bold;">구분</th>
							      <th scope="col" style="font-weight:bold;">이름</th>
							      <th scope="col" style="font-weight:bold;">상태</th>
							      <th scope="col" style="font-weight:bold;">설정</th>
							    </tr>
							  </thead>
							  <tbody>
							   <c:forEach items="${carList}" var="vo" varStatus="i">
						           <tr>
						           	<td>${i.index + 1}</td>
						             <td>
						             <c:choose>
							            <c:when test="${vo.carModelCd eq 'C001'}">경차</c:when>
							            <c:when test="${vo.carModelCd eq 'C002'}">세단</c:when>
							            <c:when test="${vo.carModelCd eq 'C003'}">SUV</c:when>
							            <c:when test="${vo.carModelCd eq 'C004'}">1톤</c:when>
							            <c:when test="${vo.carModelCd eq 'C005'}">4.5톤</c:when>
							          </c:choose>
							          </td>
						             <td>${vo.carModelName}</td>
						             <td>
						             <c:choose>
							            <c:when test="${vo.carStatusCd eq 'C011'}">대여 가능</c:when>
							            <c:when test="${vo.carStatusCd eq 'C012'}">대여 중</c:when>
							            <c:when test="${vo.carStatusCd eq 'C013'}">대여 불가</c:when>
							          </c:choose>
						             </td>
						             <td><a href="./assetManagementDetail?carNo=${vo.carNo}"><i class="fa fa-cogs"></i></a></td>
						           </tr>
						         </c:forEach>
							  </tbody>
							</table>
				  </div>
				  </div>
				  
				  <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${startNum-1}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/approval/getList?page=${i}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${lastNum+1}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

				  
  					</div>
				</div>
              </div>
			</div>
</div>
		
		
		 <div class="modal fade" id="carAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">자산 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./addCarList" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<label for="taskId" class="col-form-label">구분</label>
                    	
                        <select class="form-select form-select-sm" aria-label="Small select example" id="carList" name="carModelCd">
						  <option selected>항목을 선택하세요</option>
						  <c:forEach items="${carSort}" var="car">
					        <option value="${car.code}">${car.codeName}</option>
					    </c:forEach>
						</select>
                        
                        <label for="taskId" class="col-form-label">이름</label><br>
                        <input type="text" class="form-control" id="car_name" name="carModelName">
                        
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    			</form>
            </div>
        </div>
    </div>

</body>
</html>