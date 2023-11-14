/**
 * 
 */


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
	    	    },
				cumstomButton2:{
					text:'일정 등록',
				}
	    	  },
	    	    	  
	      headerToolbar: {
	    	    left: 'myCustomButton',
	    	    center: 'title',
	    	    right: 'cumstomButton2'
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

	