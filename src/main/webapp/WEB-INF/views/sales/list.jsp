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
	/* .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
	}

	.modal-content {
	    background-color: #fefefe;
	    margin: 5% auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%;
	    height: 50%;
	    
	}
	
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	} */
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

     <!-- <div id="myModal" class="modal">
  		<div class="modal-content">
    		<span class="close">&times;</span>
    			<p>차량 예약</p>
		        항목 : <select class="form-select form-select-sm" aria-label="Small select example">
						  <option selected>항목을 선택하세요</option>
						  <option value="1">G80</option>
						  <option value="2">모하비</option>
						  <option value="3">1톤</option>
						</select>
		        대여일 : <input type="text" id="userName" placeholder="사용자 이름">
		        반납 예정일 : <input type="text" id="userName" placeholder="사용자 이름">
		        대여자 : <input type="text" id="userName" placeholder="사용자 이름">
		        대여 용도 : <input type="text" id="userName" placeholder="사용자 이름">
		        행선지 : <input type="text" id="userName" placeholder="사용자 이름">
		        <br>
		        <button id="confirm">예약 확인</button>
        		<button id="cancel">취소</button>
  		</div>
	</div> -->
     
     <div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="confirm" class="btn btn-primary" >Save changes</button>
        <button type="button" id="cancel" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
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
	      initialView: 'dayGridMonth',
	      selectable: true,
	      selectHelper: true,
	      select: function(start, end, allDays){
	    	  console.log('되냐?');
	    	  console.log(start, "?");
	    	  $('#myModal').modal('toggle');
	      },
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '차량 예약',
	    	      click: function() {
	    	    	  console.log("zzz");
	    	    	  $('#myModal').modal('toggle');
	    	    	  
			    	        /* 
	    	    	  		let modal = document.getElementById('myModal');
		                    let span = document.getElementsByClassName('close')[0];
		                    let confirmButton = document.getElementById('confirm');
		                    let cancelButton = document.getElementById('cancel');
		
		                    modal.style.display = 'block';
		
		                    span.onclick = function() {
		                        modal.style.display = 'none';
		                    }
		
		                    window.onclick = function(event) {
		                        if (event.target == modal) {
		                            modal.style.display = 'none';
		                        }
		                    }
		                    
		                    confirmButton.onclick = function() {
		                        var reservationDate = document.getElementById('reservationDate').value;
		                        var userName = document.getElementById('userName').value;

		                        modal.style.display = 'none';
		                    }
		                    
		                    cancelButton.onclick = function() {
		                        modal.style.display = 'none';
		                    }
		                     */
	    	      }
	    	    }
	    	  },
	      headerToolbar: {
	    	    left: 'prev,next today myCustomButton',
	    	    center: 'title',
	    	    right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    	  },
	    	  
	      buttonText:{
	    	  today: '오늘'
	      }
	    	  
	    });
	    calendar.render();
	  });
</script>
</body>
</html>