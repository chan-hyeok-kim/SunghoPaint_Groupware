<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 
  
  
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

.nav-tabs>li.active:after {
    box-shadow: #005b9e -1px 1px 0;
}
.nav-tabs>li.active, .nav-tabs>li.active:before, .nav-tabs>li.active:after {
    background-color: #005b9e;
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

						<div style="float:left">대여 현황/내 예약</div> 
						<div style="text-align: right;">
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">차량명</option>
									<option>대여자</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>

					<ul class="nav-tabs">
						<li id="liAll"><a class="link-tab" id="all">대여 현황</a></li>
						<li id="liMy"><a class="link-tab" id="my">내 예약</a></li>
					</ul>


					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">


				  
				  <table class="table">
							  <thead>
							    <tr>
							      <th scope="col" style="font-weight:bold;">번호</th>
							      <th scope="col" style="font-weight:bold;">차종</th>
							      <th scope="col" style="font-weight:bold;">예약 시간</th>
							      <th scope="col" style="font-weight:bold;">반납 예정일</th>
							      <th scope="col" style="font-weight:bold;">대여자</th>
							    </tr>
							  </thead>
							  <tbody>
							   <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				           	 <td>${i.index + 1}</td>
				             <td>${vo.carModelName}</td>
				             <td>${vo.carReservationVO.rentalDate}</td>
				             <td>${vo.carReservationVO.returnDate}</td>
				             <td>${vo.name} ${vo.codeName}</td>
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
      
	
<script type="text/javascript">
$(document).ready(function() {
	// 처음 페이지 로드시 "전체 목록" 탭을 active로 설정
    $('#liAll').addClass('active');
	
    $('#my').click(function(event) {
        event.preventDefault();
        $.ajax({
    		type:"GET",
    		url:"/sales/myReservation",
    		
    	
    	success:function(result){
    		$("#content table").remove();
    		$("#content > .container-fluid").html(result);
    		
    		$('#liMy').addClass('active');
        	$('#liAll').removeClass('active');
    	},
    	error:function(){
    		alert("error");
    	}
    	
    	})
        
    });
    
    $('#all').click(function(event) {
        event.preventDefault();
        $.ajax({
    		type:"GET",
    		url:"/sales/reservationList",
    		
    	
    	success:function(result){
    		$("#content table").remove();
    		$("#content > .container-fluid").html(result);
    		
    		$('#liAll').addClass('active');
        	$('#liMy').removeClass('active');
    	},
    	error:function(){
    		alert("error");
    	}
    	
    	})
        
    });
});

$(document).ready(function() {
    // 테이블의 행 개수를 체크
    var rowCount = $('#approval-table tbody tr').length;

    // 만약 행이 없다면 메시지를 추가
    if (rowCount === 0) {
        $('#approval-table tbody').append('<tr><td colspan="5">예약 목록이 없습니다.</td></tr>');
    }
    
});






	
</script>
</body>
</html>