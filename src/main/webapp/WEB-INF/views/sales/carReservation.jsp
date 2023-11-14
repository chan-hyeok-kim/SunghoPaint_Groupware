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
  #tree_list_add{
      margin-left: 20px;

  }
  #tree-table{
      border: 1px solid black;
      height: 360px;
      width: 220px;
      padding: 10px;
  }
  #tree-table-div{
      margin: 10px;
  }
  #reservation-table{
      text-align: left; 
      width: 100%
  }
  
#title {
    text-align: left;
}

#reservation-table > :not(:last-child) > :last-child > *, .jsgrid .jsgrid-table > :not(:last-child) > :last-child > * {
    border-bottom-color: #000000;
}

#reservation-table th, .table td{
	border-color:#ffffff;
}

#reservation-table th {
        font-weight: bold;
}
    
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">


				<div class="container-fluid">
				  
				  <h2 id="title">차량 예약</h2>
				  <br>
				  
				    <div class="card">
				  <div class="card-body">
				    1. 사용 신청 이후 운영관리자에게 차키와 운행일지를 수령, 사용 후 반납<br>
					2. 차량 반납 시 차량내부의 쓰레기 등을 반드시 수거하여 차량 청결에 유의<br>
					3. 차량 내부에서는 절대 금연함<br>
					4. 차량이용자는 운전 전 차량의 상태 (안전사항 및 청결도)를 확인하며, 이상이 있을 경우 즉시 운영관리자에게 연락함<br>
					<br><br>◎ 운영관리자 : 업무지원팀 ( ☎ 8888)
				  </div>
				  </div>
				  
				  <br><br>
				  <h2 id="title">자산별 상세 정보</h2>
				  
				    <table class="table" id="reservation-table">
				        <thead>
				           <tr>
				             <th>항목</th>
				             <th>대여 여부</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><c:choose>
				                <c:when test="${vo.carStatusCd eq 'C011'}">
				                    <a href="#calendarAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                <c:when test="${vo.carStatusCd eq 'C012'}">
				                    <a href="#calendarViewModal" data-toggle="modal" data-num="${vo.carNo}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold; color:red;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                <c:when test="${vo.carStatusCd eq 'C013'}">
				                    <a class="sweet" data-num="${vo.carNo}"  data-reason="${vo.carReason}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold; color:red;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                
				            </c:choose></td>
				            
				             <c:choose>
				             <c:when test="${vo.carStatusCd eq 'C011'}">
				             <td><a href="#calendarAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">대여 가능</span></a></td>
				             </c:when>
				             <c:when test="${vo.carStatusCd eq 'C012'}">
				             <td><a href="#calendarViewModal" data-toggle="modal" data-num="${vo.carNo}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; color:red;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">대여 중</span></a></td>
				             </c:when>
				             <c:when test="${vo.carStatusCd eq 'C013'}">
				             <td><a class="sweet" data-num="${vo.carNo}" data-reason="${vo.carReason}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; color:red;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">대여 불가</span></a></td>
				             </c:when>
				             
				             </c:choose>
				            
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>

				  <br>
				  
				  <!-- pagination -->
				  <div style="text-align: center">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
				  
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <i class="mdi mdi-arrow-left-drop-circle"></i>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
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
                
                <form id="addForm" action="./addCar" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<label for="taskId" class="col-form-label">항목 선택</label>
                    	
                    	
                        <select class="form-select form-select-sm" aria-label="Small select example" id="carList" name="carNo">
						  <option selected>항목을 선택하세요</option>
						  <c:forEach items="${list}" var="car">
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
                        <input type="text" class="form-control" id="calendar_name" value=${name} readonly>
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

<!-- ------------------------------------------------ -->
 <div class="modal fade" id="calendarViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">차량 상세</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    
                    	<input type="hidden" id="rental_no_update" name="rentalNo">
                    
                    	<label for="taskId" class="col-form-label">차량명</label>
                        <input type="text" class="form-control" id="car_view" name="carNo" readonly>
						
                        <label for="taskId" class="col-form-label">대여일</label>
                        <input type="date" class="form-control" id="calendar_start_date_view" name="rental_Date" readonly>
                        <input type="time" class="form-control" id="calendar_start_date_time_view" name="rental_DateTime" readonly>
                        
                        <label for="taskId" class="col-form-label">반납 예정일</label>
                        <input type="date" class="form-control" id="calendar_end_date_view" name="return_Date" readonly>
                        <input type="time" class="form-control" id="calendar_end_date_time_view" name="return_DateTime" readonly>
                        
                        <label for="taskId" class="col-form-label">대여자</label>
                        <input type="text" class="form-control" id="calendar_name_view" name="employeeId" readonly>
                        
                        <label for="taskId" class="col-form-label">대여 용도</label>
                        <input type="text" class="form-control" id="rental_reason_view" name="rentalReasonCd" readonly>
                        
                        
                        <label for="taskId" class="col-form-label">행선지</label>
                        <input type="text" class="form-control" id="calendar_location_view" name="rentalLocation" readonly>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="modalClose">닫기</button>
                </div>
                </div>
                </div>
                </div>
                
                
                
<script type="text/javascript">
const arr = new Array();
const arr2 = new Array();
function timeFormat(time){
      return String(time).padStart(2, "0");
   }

$('.sweet').click(function(){
let carReason = $(this).attr("data-reason");
	console.log(carReason);
	swal("사유", carReason);
});

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
	      
	      arr.push(obj);
	    }
	    console.log(arr);
	
	  },
	  error: function (XMLHttpRequest, textStatus, errorThrown) {
	    console.log('error')
	  },
	});
	
	
	$.ajax({
		  type: "GET", 
		  url: "/sales/getCarList",
		  async: false,
		  success: function (res) {
		    for (const key in res) {
		      let obj = new Object();
		      
		      obj.carNo = res[key].carNo;
		      obj.carModelCd = res[key].carModelCd;
		      obj.carModelName = res[key].carModelName;
		      obj.carStatusCd = res[key].carStatusCd;
		      
		      arr2.push(obj);
		    }
		    console.log(arr2);
		
		  },
		  error: function (XMLHttpRequest, textStatus, errorThrown) {
		    console.log('error')
		  },
		});
	
	document.querySelectorAll('a[href="#calendarViewModal"]').forEach(function(a) {
	    a.addEventListener('click', function() {
	        let a = $(this).attr("data-num");
	        console.log($(this).attr("data-num"));
	        for(let i in arr){
	        if(a==arr[i].carCategory){
	        	console.log(arr[i].carCategory, "항목");
	        	console.log(arr[i].start, "대여일");
	        	console.log(arr[i].end, "반납일");
	        	console.log(arr[i].title, "대여자");
	        	console.log(arr[i].rentalReason, "대여용도");
	        	console.log(arr[i].location, "행선지");
	        	console.log(arr[i].timeStart, "대여시간");
	        	for(let j in arr2){
	        		if(a==arr2[j].carNo){
	        			$("#car_view").val(arr2[j].carModelName);
	        		}
	        	}
	        	$("#calendar_start_date_view").val(arr[i].start.toISOString().slice(0,10));
	        	$("#calendar_start_date_time_view").val(arr[i].timeStart);
	        	$("#calendar_end_date_view").val(arr[i].end.toISOString().slice(0,10));
	        	$("#calendar_end_date_time_view").val(arr[i].timeEnd);
	        	$("#calendar_name_view").val(arr[i].title);
	        	
	        	let rentalReasonCode = arr[i].rentalReason;
	        	let rentalReasonText = '';

	        	switch(rentalReasonCode) {
	        	    case 'C041':
	        	        rentalReasonText = '외부인 미팅';
	        	        break;
	        	    case 'C042':
	        	        rentalReasonText = '제품 홍보';
	        	        break;
	        	    case 'C043':
	        	        rentalReasonText = '출장';
	        	        break;
	        	    default:
	        	        rentalReasonText = '외근';
	        	}
	        	$("#rental_reason_view").val(rentalReasonText);
	        	$("#calendar_location_view").val(arr[i].location);
	        	
        		
		    	}
	        }
	    });
	});
	
	$("#addCalendar").click(function(){
		var today1 = new Date(); 
	    var today2 = today1.setHours(today1.getHours());
		console.log("추가 ㅋㅋ")
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
	    	    		 		 $("#addForm").submit();
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