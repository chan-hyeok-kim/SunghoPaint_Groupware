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

</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">


				<div class="container-fluid">
				  
				  <h1>달력ㅋ</h1>
				  
				  <div class="card">
				  	<div class="card-body">
						<div id='calendar'></div>
				  	</div>
				  </div>
				  
				  
				  
    </div>
  </div>
</div>

    
     
 <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">차량 예약</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form action="./list2" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<label for="taskId" class="col-form-label">항목 선택</label>
                    	
                        <select class="form-select form-select-sm" aria-label="Small select example" id="carList">
						  <option selected>항목을 선택하세요</option>
						  <option value="1">G80</option>
						  <option value="2">모하비</option>
						  <option value="3">1톤</option>
						</select>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="rental_Date">
                       	<!-- <input type="time" class="form-control" id="calendar_start_date_time" name="rental_DateTime"> -->
                        <select class="form-select form-select-sm" id="calendar_start_date_time" name="rental_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="return_Date">
                        <!-- <input type="time" class="form-control" id="calendar_end_date_time" name="return_DateTime"> -->
                        <select class="form-select form-select-sm" id="calendar_end_date_time" name="return_DateTime"></select>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name">
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <input type="text" class="form-control" id="calendar_content" name="rentalReasonCd">
                        
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

     
     
     <div style="border: 1px solid gray;">
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
</div>
      
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: "ko",
	      timeZone: 'UTC',
	      initialView: 'dayGridMonth',
	      selectable: true,
	      select: function(start, end, allDays){
	    	  console.log('되냐?');
	    	  $("#calendarModal").modal("show");
	    	  
	    	  $('#addCalendar').click(function(){
	    		  	console.log('저장')
	    			
	    		})
	    	  
	    	  $('#sprintSettingModalClose').click(function(){
	    			$('#calendarModal').modal('hide')	
	    		})
	    		
	      },
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '차량 예약',
	    	      click: function() {
	    	    	  $("#calendarModal").modal("show");
	    	    	  
	    	    	  $('#addCalendar').click(function(){
	    	    		  	let a = $('#carList').val();
	    	    		  	let b = $('#calendar_start_date').val();
	    	    		  	//let  = $('#calendar_location').val();
	    	    		  	
	    	    		  	
	    	    		  	console.log('항목 선택 : ', a)
	    	    		  	console.log('대여일 :', b);
	    	    		})
	    	    	  
	    	    	  $('#sprintSettingModalClose').click(function(){
	    	    			$('#calendarModal').modal('hide')	
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
	      
	      
	      events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
              {
                  title:'일정',
                  start:'2023-10-26',
                  end:'2023-10-28'
              }
          ],
        
	    	  
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
	</script>
</body>
</html>