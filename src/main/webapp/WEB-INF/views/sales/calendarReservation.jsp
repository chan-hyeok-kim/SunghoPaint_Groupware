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
				  <input type="hidden" id="username" value="${name1}">
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
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
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
                        <select class="form-select form-select-sm" aria-label="Small select example" id="car_update" name="carNo" disabled>
						  <option selected>항목을 선택하세요</option>
							  <c:forEach items="${carList}" var="car">
					        	<option value="${car.carNo}">${car.carModelName}</option>
					    	</c:forEach>
						</select>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date_update" name="rental_Date">
                        <select class="form-select form-select-sm" id="calendar_start_date_time_update" name="rental_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date_update" name="return_Date">
                        <select class="form-select form-select-sm" id="calendar_end_date_time_update" name="return_DateTime" style="padding-left:20px;"></select>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name_update" readonly>
                        <input type="hidden" class="form-control" id="calendar_name_update1" name="employeeId" value=${empId } readonly>
                        
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="rental_reason_update" name="rentalReasonCd">
						  <option selected>항목을 선택하세요</option>
						  <option value="C041">외부인 미팅</option>
						  <option value="C042">제품 홍보</option>
						  <option value="C043">출장</option>
						  <option value="C044">외근</option>
						</select>
                        
                        <label for="taskId" class="col-form-label">행선지</label>
                        <input type="text" class="form-control" id="calendar_location_update" name="rentalLocation">
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="updateCalendar">수정</button>
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
			  url: "/sales/getList",
			  async: false,
			  success: function (res) {
			    for (const key in res) {
			      let obj = new Object();
			      
			      obj.id = res[key].rentalNo;
			      
			      obj.title = res[key].name + ' ' + res[key].codeName;
			      
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
			      
			      obj.name=res[key].name;
			      arr.push(obj);
			    }
			    console.log(arr);
			    console.log(arr[0].name)
			
			  },
			  error: function (XMLHttpRequest, textStatus, errorThrown) {
			    console.log('error')
			  },
			});


	document.addEventListener('DOMContentLoaded', function() {
		var today1 = new Date(); // 오늘 날짜 가져오기
	    var today2 = today1.setHours(today1.getHours()); // 시간 보정 (KST 기준)
		
	    
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      selectable: true,
	      select: function(start, end, allDays){
	    	  $("#calendarAddModal").modal("show");
	    	  
	    	   
	    	  $('#addCalendar').click(function(){
	    		  var rentalDate = new Date($('#calendar_start_date').val());
	    	      var returnDate = new Date($('#calendar_end_date').val());
	    		  console.log("추가") // 달력에서 버튼 눌렀을때
	    		  console.log(rentalDate)
	    		  console.log(returnDate)
	    		  
	    		  
	    		var dateObject = new Date(today2);
        		
        		var startDate = rentalDate;

				var year = startDate.getFullYear();
				var month = startDate.getMonth() + 1;
				var day = startDate.getDate();
				
				var formattedDate = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
				

				var startDate1 = dateObject;

				var year = startDate1.getFullYear();
				var month = startDate1.getMonth() + 1;
				var day = startDate1.getDate();
				
				var formattedDate1 = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
				
				
				
				
	    		  if (formattedDate < formattedDate1) {
                    alert('대여일은 오늘 이후로 설정해야 합니다.');
                    return 0;
                }
			        // 반납 예정일이 대여일보다 이전인지 확인
			        if (returnDate < rentalDate) {
			            alert('반납 예정일은 대여일보다 이전으로 설정할 수 없습니다.');
			            return 0;
			        } else{
	    		 		 $("#addForm").submit();
			        }
	    		})
	    	  
	    	  
	    	  $('#sprintSettingModalClose').click(function(){
	    			$('#calendarAddModal').modal('hide')	
	    		})
	    		
	      },
	      
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '차량 예약',
	    	      click: function() {
	    	    	  $("#calendarAddModal").modal("show");
	    	    	  
	    	    	   
	    	    	  $('#addCalendar').click(function(){
	    	    		  console.log("추가2") // 차량 예약 버튼에서 눌렀을때
	    	    		  var rentalDate = new Date($('#calendar_start_date').val());
	    	    	      var returnDate = new Date($('#calendar_end_date').val());
	    	    		  console.log(rentalDate)
	    	    		  console.log(returnDate)
	    	    		  
	    	    		  var dateObject = new Date(today2);
        		
		        		var startDate = rentalDate;
		
						var year = startDate.getFullYear();
						var month = startDate.getMonth() + 1;
						var day = startDate.getDate();
						
						var formattedDate = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
						
		
						var startDate1 = dateObject;
		
						var year = startDate1.getFullYear();
						var month = startDate1.getMonth() + 1;
						var day = startDate1.getDate();
						
						var formattedDate1 = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
						
						
		    	    		  if (formattedDate < formattedDate1) {
			                    alert('대여일은 오늘 이후로 설정해야 합니다.');
			                    return 0;
			                }
	    			        // 반납 예정일이 대여일보다 이전인지 확인
	    			        if (returnDate < rentalDate) {
	    			            alert('반납 예정일은 대여일보다 이전으로 설정할 수 없습니다.');
	    			            return 0;
	    			        } else{
	    	    		 		 $("#addForm").submit();
	    			        }
	    	    		})
	    	    	   
	    	    		
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
 				console.log("클릭한 이벤트", event.event.extendedProps.name);
        		console.log("클릭한 이벤트", event.event.title);
        		console.log("클릭한 이벤트", event.event.start);
        		console.log("클릭한 이벤트", event.event.extendedProps.carCategory);
        		
        		let usernameValue = $("#username").val();
        		console.log(usernameValue);
        		
        		let eventCreator = event.event.extendedProps.name;
        		console.log(eventCreator)
        		
        		let isCurrentUserEvent = usernameValue === eventCreator;
        		
        		let isPastDate = event.event.start <= today2;

        		console.log("startDate : ",event.event.start)
        		var dateObject = new Date(today2);
        		console.log("오늘 날짜 dateObject : ",dateObject)
		
        		let eventTimestamp = event.event.start.getTime();
                console.log("startDate : ",eventTimestamp);
        		console.log("오늘 날짜 : today2",today2)

        		

        		
        		var startDate = event.event.start;

				var year = startDate.getFullYear();
				var month = startDate.getMonth() + 1;
				var day = startDate.getDate();
				
				var formattedDate = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
				

				var startDate1 = dateObject;

				var year = startDate1.getFullYear();
				var month = startDate1.getMonth() + 1;
				var day = startDate1.getDate();
				
				var formattedDate1 = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
				
				console.log("startDate :", formattedDate);
				console.log("today :",formattedDate1);

        		if (isCurrentUserEvent && (formattedDate >= formattedDate1)) {

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
	    		
	    		
        		 } else {
                     // 사용자가 이 이벤트를 편집하거나 삭제할 권한이 없거나 날짜가 지난 경우 메시지 표시 또는 처리
                     if (!isCurrentUserEvent) {
                         alert("이 차량을 편집하거나 삭제할 권한이 없습니다.");
                     } else {
                         alert("이미 지난 날짜의 예약은 수정 및 삭제할 수 없습니다.");
                     }
                     return 0;
                 }
        		 
            }
        	
	    	  
	    });
	    calendar.render();
	  });
	
	$('#updateCalendar').click(function () {
		var today1 = new Date(); 
	    var today2 = today1.setHours(today1.getHours());
		console.log("업데이트 ㅋ")
						var rentalDate = new Date($('#calendar_start_date_update').val());
	    	    	      var returnDate = new Date($('#calendar_end_date_update').val());
	    	    		  console.log(rentalDate)
	    	    		  console.log(returnDate)
	    	    		  
	    	    		  var dateObject = new Date(today2);
        		
		        		var startDate = rentalDate;
		
						var year = startDate.getFullYear();
						var month = startDate.getMonth() + 1;
						var day = startDate.getDate();
						
						var formattedDate = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
						
		
						var startDate1 = dateObject;
		
						var year = startDate1.getFullYear();
						var month = startDate1.getMonth() + 1;
						var day = startDate1.getDate();
						
						var formattedDate1 = year + (month < 10 ? '0' : '') + month + (day < 10 ? '0' : '') + day;
						console.log(formattedDate)
						console.log(formattedDate1)
						
						
		    	    		  if (formattedDate < formattedDate1) {
			                    alert('대여일은 오늘 이후로 설정해야 합니다.');
			                    return 0;
			                }
	    			        // 반납 예정일이 대여일보다 이전인지 확인
	    			        if (returnDate < rentalDate) {
	    			            alert('반납 예정일은 대여일보다 이전으로 설정할 수 없습니다.');
	    			            return 0;
	    			        } else{
	    			        	var carUpdateSelect = document.getElementById('car_update');
	    			        	carUpdateSelect.removeAttribute('disabled');
	    	    		 		 $("#updateForm").submit();
	    			        }
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
	endElement.value = "18:00";
	
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