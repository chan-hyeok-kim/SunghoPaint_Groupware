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

						<div style="float:left">거래내역 조회</div> 
						<div style="text-align: right;">
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">거래처명</option>
									<option>담당자명</option>
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

					
					<div style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">

							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" style="font-weight:bold;">구매일자</th>
							      <th scope="col" style="font-weight:bold;">거래처명</th>
							      <th scope="col" style="font-weight:bold;">품목명</th>
							      <th scope="col" style="font-weight:bold;">수량</th>
							      <th scope="col" style="font-weight:bold;">단가</th>
							      <th scope="col" style="font-weight:bold;">금액합계</th>
							      <th scope="col" style="font-weight:bold;">영업 담당자</th>
							      <th scope="col" style="font-weight:bold;">엑셀</th>
							    </tr>
							  </thead>
							  <tbody>
							   <c:forEach items="${dealList}" var="vo" varStatus="i">
						           <tr>
						            <td id="purchaseDate">${vo.purchaseDate}</td>
						             <td id="clientName">${vo.clientName}</td>
						             <td id="codeName">${vo.codeName}</td>
						             <td id="purchaseQuantity">${vo.purchaseQuantity}</td>
						             <td id="unitPrice">${vo.materialProductPrice}</td>
						             <td id="totalPrice">${vo.totalPrice}</td>
						             <td id="employeeId">${vo.clientManager}</td>
						             <td id="clientZipCode" hidden>${vo.clientZipCode}</td>
						             <td id="clientAddress" hidden>${vo.clientAddress}</td>
						             <td id="clientRefAddress" hidden>${vo.clientRefAddress}</td>
						             <td id="clientDetailAddress" hidden>${vo.clientDetailAddress}</td>
						             <td id="clientNumber" hidden>${vo.clientNumber}</td>
						             
						             <td class="showInvoiceButton">
							             <a href="#">
							             	<i class="fas fa-file-excel"></i>
							             </a>
							         </td>
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
    <li class="page-item"><a class="page-link" href="/approval/getList?page=${i}"><%-- ${i} --%>1</a></li>
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
		
		
<div id="invoicePopup" style="display:none;"></div>


	
<script type="text/javascript">
$('.showInvoiceButton').click(function() {
	event.preventDefault();
	let popupWidth = 1200; // 팝업의 너비
    let popupHeight = 750; // 팝업의 높이
    let leftPosition = (window.innerWidth - popupWidth) / 2;
    let topPosition = (window.innerHeight - popupHeight) / 2;
    
    
    window.purDate = $(this).siblings("#purchaseDate").html();
    window.cliName = $(this).siblings("#clientName").html();
    window.codName = $(this).siblings("#codeName").html();
    window.toPrice = $(this).siblings("#totalPrice").html();
    window.empId = $(this).siblings("#employeeId").html();
    window.clientZipCode = $(this).siblings("#clientZipCode").html();
    window.clientAddress = $(this).siblings("#clientAddress").html();
    window.clientRefAddress = $(this).siblings("#clientRefAddress").html();
    window.clientDetailAddress = $(this).siblings("#clientDetailAddress").html();
    window.clientNumber = $(this).siblings("#clientNumber").html();
    window.purchaseQuantity = $(this).siblings("#purchaseQuantity").html();
    window.unitPrice = $(this).siblings("#unitPrice").html();
    console.log($(this).siblings("#clientAddress").html());
    console.log("zz");
   
    let openWin = window.open('dealPopup', 'Invoice Popup', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition);

});


    </script>
</body>
</html>