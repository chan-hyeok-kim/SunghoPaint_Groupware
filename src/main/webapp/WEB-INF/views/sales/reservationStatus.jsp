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
#calendar_start_date_time {
    height: 50px;
    overflow-y: auto;
}
#calendar_end_date_time {
    height: 50px;
    overflow-y: auto;
}
#calendar_start_date_time_update {
    height: 50px;
    overflow-y: auto;
}
#calendar_end_date_time_update {
    height: 50px;
    overflow-y: auto;
}
.modal-header .close {
    display: none;
}
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<div class="container-fluid">
				  
				  <h1>차량 예약 목록</h1>
				  
				  <div class="card">
				  	<div class="card-body">
						<div id='calendar'></div>
				  	</div>
				  </div>
				  	  
    </div>
  </div>
</div>

 <!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">차량 예약</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./add" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<label for="taskId" class="col-form-label">항목 선택</label>
                    	
                        <select class="form-select form-select-sm" aria-label="Small select example" id="carList" name="carNo">
						  <option selected>항목을 선택하세요</option>
						  <option value="9">모닝 (151허 5155)</option>
						  <option value="10">G80 (301하 5148)</option>
						  <option value="11">싼타페 (143호 1234)</option>
						  <option value="12">포터 (871허 1234)</option>
						  <option value="13">윙바디 (678허 9876)</option>
						</select>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="rental_Date">
                        <select class="form-select form-select-sm" id="calendar_start_date_time" name="rental_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="return_Date">
                        <select class="form-select form-select-sm" id="calendar_end_date_time" name="return_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name" name="employeeId">
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="calendar_content" name="rentalReasonCd">
						  <option selected>항목을 선택하세요</option>
						  <option value="1">외부인 미팅</option>
						  <option value="2">제품 홍보</option>
						  <option value="3">출장</option>
						  <option value="4">외근</option>
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
    
<!------------------------------------------------- Update modal ------------------------------------------------->
 <div class="modal fade" id="calendarUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">차량 예약</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="updateForm" action="./update" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    
                    	<input type="hidden" id="rental_no_update" name="rentalNo">
                    
                    	<label for="taskId" class="col-form-label">항목 선택</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="car_update" name="carNo">
						  <option selected>항목을 선택하세요</option>
							  <option value="9">모닝 (151허 5155)</option>
							  <option value="10">G80 (301하 5148)</option>
							  <option value="11">싼타페 (143호 1234)</option>
							  <option value="12">포터 (871허 1234)</option>
							  <option value="13">윙바디 (678허 9876)</option>
						</select>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date_update" name="rental_Date">
                        <select class="form-select form-select-sm" id="calendar_start_date_time_update" name="rental_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date_update" name="return_Date">
                        <select class="form-select form-select-sm" id="calendar_end_date_time_update" name="return_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name_update" name="employeeId">
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="rental_reason_update" name="rentalReasonCd">
						  <option selected>항목을 선택하세요</option>
						  <option value="1">외부인 미팅</option>
						  <option value="2">제품 홍보</option>
						  <option value="3">출장</option>
						  <option value="4">외근</option>
						</select>
                        
                        <label for="taskId" class="col-form-label">행선지</label>
                        <input type="text" class="form-control" id="calendar_location_update" name="rentalLocation">
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="updateCalendar">수정</button>
                    <input type="hidden" id="eventId" name="eventId" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="modalClose">취소</button>
                </form>
                <form id="deleteForm" action="./delete" method="post">
                	<input type="hidden" id="rental_no_delete_rentalNo" name="rentalNo">
                	<input type="hidden" id="rental_no_delete_carNo" name="carNo">
                    <button type="submit" class="btn btn-danger" id="deleteCalendar">삭제</button>
                    </form>
                </div>
    			<!-- </form> -->
            </div>
        </div>
    </div>
<!------------------------------------------------- Update modal ------------------------------------------------->
     
     <div style="border: 1px solid gray;">
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
</div>
      
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<script type="text/javascript">
		const arr = new Array();
		
		function timeFormat(time){
		      return String(time).padStart(2, "0");
		   }
		
		$.ajax({
			  type: "GET", 
			  url: "/sales/getlist",
			  async: false,
			  success: function (res) {
			    for (const key in res) {
			      let obj = new Object();
			      
			      obj.id = res[key].rentalNo;
			      
			      obj.title = res[key].employeeId;
			      
			      obj.location = res[key].rentalLocation;
			      
			      let rentalDate = new Date(res[key].rentalDate);
			      rentalDate.setHours(rentalDate.getHours() + 9);
			      obj.start = rentalDate;
			      
			      let returnDate = new Date(res[key].returnDate);
			      returnDate.setHours(returnDate.getHours() + 9);
			      obj.end = returnDate;

			      let originalRentalDate = new Date(res[key].rentalDate);
			      let hoursStart = originalRentalDate.getHours();
			      let minutesStart = rentalDate.getMinutes();
			      let timeStart = timeFormat(hoursStart) + ':' + timeFormat(minutesStart);
			      obj.timeStart = timeStart;
			      
			      let originalReturnDate = new Date(res[key].returnDate);
			      let hoursEnd = originalReturnDate.getHours();
			      let minutesEnd = returnDate.getMinutes();
			      let timeEnd = timeFormat(hoursEnd) + ':' + timeFormat(minutesEnd);
			      obj.timeEnd = timeEnd;
			      
			      obj.carCategory = res[key].carNo;
			      
			      obj.rentalReason = res[key].rentalReasonCd;
			      
			      arr.push(obj);
			    }
			    console.log(arr);
			
			  },
			  error: function (XMLHttpRequest, textStatus, errorThrown) {
			    console.log('error')
			  },
			});


	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      selectable: true,
	      select: function(start, end, allDays){
	    	  $("#calendarAddModal").modal("show");
	    	  
	    	  /* 
	    	  $('#addCalendar').click(function(){
	    		  console.log("추가")
	    		})
	    	  */
	    	  
	    	  $('#sprintSettingModalClose').click(function(){
	    			$('#calendarAddModal').modal('hide')	
	    		})
	    		
	      },
	      
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '차량 예약',
	    	      click: function() {
	    	    	  $("#calendarAddModal").modal("show");
	    	    	  
	    	    	  /* 
	    	    	  $('#addCalendar').click(function(){

	    	    		})
	    	    	   */
	    	    		
	    	    	  $('#sprintSettingModalClose').click(function(){
	    	    			$('#calendarAddModal').modal('hide')	
	    	    		})
	    	    	  
	    	      }
	    	    }
	    	  },
	    	    	  
	      headerToolbar: {
	    	    left: 'prev,next today myCustomButton',
	    	    center: 'title',
	    	    right: 'dayGridMonth timeGridWeek timeGridDay'
	    	  },
	    	  
	      buttonText:{
	    	  today: '오늘'
	    	 
	      },
	      
	      
	      /* events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
              {
                  title:'일정',
                  start:'2023-10-26',
                  end:'2023-10-28'
              },
          ], */
        	events:arr,
        	
        	eventClick:function(event) {
 				console.log("클릭한 이벤트", event.event.extendedProps.location);
        		console.log("클릭한 이벤트", event.event.title);
        		console.log("클릭한 이벤트", event.event.start);
        		console.log("클릭한 이벤ddd트", event.event.extendedProps.carCategory);
        		
        		let modal = $("#calendarUpdateModal");
        		$("#calendarUpdateModal").modal("show");
        		
        		$("#rental_no_delete_rentalNo").val(event.event.id);
        		$("#rental_no_delete_carNo").val(event.event.extendedProps.carCategory);
        		$("#rental_no_update").val(event.event.id);
        		$("#rental_reason_update").val(event.event.extendedProps.rentalReason).prop("selected", true);
        		$("#car_update").val(event.event.extendedProps.carCategory).prop("selected", true);
        		$("#calendar_start_date_time_update").val(event.event.extendedProps.timeStart).prop("selected", true);
        		$("#calendar_end_date_time_update").val(event.event.extendedProps.timeEnd).prop("selected", true);
        		$("#calendar_start_date_update").val(event.event.start.toISOString().slice(0,10));
        		$("#calendar_end_date_update").val(event.event.end.toISOString().slice(0,10));
        		$("#calendar_name_update").val(event.event.title);
        		$("#calendar_location_update").val(event.event.extendedProps.location);
        		
        		$('#modalClose').click(function(){
	    			$('#calendarUpdateModal').modal('hide')	
	    		})
            }
        	
	    	  
	    });
	    calendar.render();
	  });
	
	
	
	var startElement = document.getElementById('calendar_start_date_time');
	for (var hour = 0; hour < 24; hour++) {
	    for (var minute = 0; minute < 60; minute += 30) {
	        var optionElement = document.createElement('option');
	        var formattedHour = hour.toString().padStart(2, '0');
	        var formattedMinute = minute.toString().padStart(2, '0');
	        optionElement.value = formattedHour + ':' + formattedMinute;
	        optionElement.text = formattedHour + ':' + formattedMinute;
	        startElement.appendChild(optionElement);
	        
	    }
	}
	startElement.value = "09:00";
	
	var endElement = document.getElementById('calendar_end_date_time');
	for (var hour = 0; hour < 24; hour++) {
	    for (var minute = 0; minute < 60; minute += 30) {
	        var optionElement = document.createElement('option');
	        var formattedHour = hour.toString().padStart(2, '0');
	        var formattedMinute = minute.toString().padStart(2, '0');
	        optionElement.value = formattedHour + ':' + formattedMinute;
	        optionElement.text = formattedHour + ':' + formattedMinute;
	        endElement.appendChild(optionElement);
	        
	    }
	}
	endElement.value = "09:00";
	
	var updateStartElement = document.getElementById('calendar_start_date_time_update');
	for (var hour = 0; hour < 24; hour++) {
	    for (var minute = 0; minute < 60; minute += 30) {
	        var optionElement = document.createElement('option');
	        var formattedHour = hour.toString().padStart(2, '0');
	        var formattedMinute = minute.toString().padStart(2, '0');
	        optionElement.value = formattedHour + ':' + formattedMinute;
	        optionElement.text = formattedHour + ':' + formattedMinute;
	        updateStartElement.appendChild(optionElement);
	        
	    }
	}

	
	var updateEndElement = document.getElementById('calendar_end_date_time_update');
	for (var hour = 0; hour < 24; hour++) {
	    for (var minute = 0; minute < 60; minute += 30) {
	        var optionElement = document.createElement('option');
	        var formattedHour = hour.toString().padStart(2, '0');
	        var formattedMinute = minute.toString().padStart(2, '0');
	        optionElement.value = formattedHour + ':' + formattedMinute;
	        optionElement.text = formattedHour + ':' + formattedMinute;
	        updateEndElement.appendChild(optionElement);
	        
	    }
	}

	</script>
</body>
</html>