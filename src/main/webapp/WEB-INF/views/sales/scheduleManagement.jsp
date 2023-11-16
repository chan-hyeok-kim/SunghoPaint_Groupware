<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
  
<style type="text/css">
#calendar{
	text-decoration: none;
	color:black;
}

#calendar a{
	text-decoration: none;
}

.fc-col-header-cell-cushion{
	color:black;
}

.fc-daygrid-day a{
	color:black;
	
}


#calendar button{
	background: #90caf9;
	margin-right:10px;

}

#calendar .fc-toolbar-chunk:nth-child(3) button{
	border-radius:10%;
	
}

#calendar .fc-toolbar-chunk:nth-child(1) button{
	color: gray;
	background: white;
	border: none;
}

#calendar .fc-toolbar-chunk:nth-child(1) button:hover{
	background: rgb(222,226,230);
	
}


/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a{
  color: blue;
  text-decoration: none;
}

</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content" class="page-content">
        <div class="container-fluid">
          <div class="row">
            <!-- 왼쪽 영역 -->
            <div class="col-md-2 text-center">
              <h1>일정 관리</h1>
              <ul class="nav-tabs">
				</ul>
              <a href="#calendarAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" 
              onmouseout="this.style.backgroundColor='transparent'">
              <span class="btn btn-mini" style="border:1px solid #ddd; 
              background-color: transparent; font-weight:bold;" 
              onmouseover="this.style.backgroundColor='transparent'" 
              onmouseout="this.style.backgroundColor='transparent'">연차등록</span></a>
              
              <p> 내 캘린더 </p>
              
              <p> 팀 캘린더 </p>
            </div>

            <!-- 오른쪽 영역 -->
            <div class="col-md-10">
              <div class="card">
                <div class="card-body">
                  <div id='calendar'></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  

 
     
     <div style="border: 1px solid gray;">
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
</div>
      
      
      
 <!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">연차 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./addAnnual" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<label for="taskId" class="col-form-label">항목 선택</label>
                    	
                        <select class="form-select form-select-sm" aria-label="Small select example" id="carList" name="carNo">
						  <option selected>항목을 선택하세요</option>
						  <c:forEach items="${carList}" var="car">
						  <c:if test="${car.carStatusCd eq 'C011'}">
					        <option value="${car.carNo}">${car.carModelName}</option>
					        </c:if>
					    </c:forEach>
						</select>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="rental_Date">
                        <select class="form-select form-select-sm" id="calendar_start_date_time" name="rental_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="return_Date">
                        <select class="form-select form-select-sm" id="calendar_end_date_time" name="return_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name" value="${name}" readonly>
                        <input type="hidden" class="form-control" id="calendar_name" name="employeeId" value=${empId}>
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="calendar_content" name="rentalReasonCd">
						  <option selected>항목을 선택하세요</option>
						  <option value="C041">외부인 미팅</option>
						  <option value="C042">제품 홍보</option>
						  <option value="C043">출장</option>
						  <option value="C044">외근</option>
						</select>
                        
                        <label for="taskId" class="col-form-label">행선지</label>
                        <input type="text" class="form-control" id="calendar_location" name="rentalLocation">
                        
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
<!------------------------------------------------- Add modal ------------------------------------------------->
 
 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        // 캘린더 옵션들 설정
        // ...
        events: [
            // 이벤트 데이터 배열
            // { title: '이벤트 제목', start: '2023-11-14' }
            // ...
        ]
    });
    calendar.render();
});
		
</script>
</body>
</html>