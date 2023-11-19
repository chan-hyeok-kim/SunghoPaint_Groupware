/**
 * 
 */


const arr = new Array();
const arr2 = new Array();
let currentEvents = arr;
$.ajax({
	  type: "GET", 
	  url: "/sales/getAnnualList",
	  async: false,
	  success: function (res) {
	    for (const key in res) {
	      let obj = new Object();
	      
	      obj.id = res[key].scheduleNo;
	      
	      obj.title = res[key].scheduleContents;
	      
	      obj.name = res[key].name + ' ' + res[key].codeName;
	      
	      let scheduleDate = new Date(res[key].scheduleDate);
	      scheduleDate.setHours(scheduleDate.getHours() + 9);
	      obj.start = scheduleDate;
	      
	      let scheduleEndDate = new Date(res[key].scheduleEndDate);
	      scheduleEndDate.setHours(scheduleEndDate.getHours() + 9);
	      obj.end = scheduleEndDate;

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
	    	      text: '일정 등록',
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
				customButton2:{
					text:'새로고침',
				}
	    	  },
	    	    	  
	      headerToolbar: {
	    	    left: 'prev,next',
	    	    center: 'title',
	    	    right: 'myCustomButton,customButton2'
	    	  },
			  buttonIcons:{
				customButton2: '',
				myCustomButton: '',
			  }
	    	  ,
	      buttonText:{
	    	  today: '오늘',
	    	  title: '일정관리'
	      },
	      
	      
        events: currentEvents,
        
        eventClick:function(event) {
        	console.log("제목", event.event.title);
        	console.log("시작일", event.event.start);
        	console.log("종료일", event.event.end);
        	console.log("pk", event.event.id);
        	
    		$("#calendarUpdateModal").modal("show");
    		
    		$("#calendar_start_date_update").val(event.event.start.toISOString().slice(0,10));
    		$("#calendar_end_date_update").val(event.event.end.toISOString().slice(0,10));
    		$("#calendar_name_update").val(event.event.extendedProps.name);
    		$("#calendar_location_update").val(event.event.title);
    		
    		$("#rental_no_delete_rentalNo").val(event.event.id);
        }
    });

    
    
    calendar.render();
    

	let icon=document.getElementsByClassName('fc-icon');
	
	icon[3].innerHTML='<span class="material-symbols-outlined">cached</span>';
	icon[2].innerHTML='<span class="material-symbols-outlined">edit_square</span>';
});
	