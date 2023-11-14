<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/calendarStyle/calendar.css">
<link rel="stylesheet" href="/css/myCustomStyle/todolist.css">

</head>
<body>
<div class="row">
<div class="col-md-5 grid-margin stretch-card">
<div class="card">
 <div class="card-body">성호 페인트 홈입니다</div>
</div>
</div>
</div>



<!-- progress start -->
<div class="row">
<div class="col-7 grid-margin stretch-card">
<div class="card">
 <div class="card-body">
 <h4 class="card-title">내 결재현황</h4>
 <table class="table table-hover mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>선택</th>
				             <th>기안일자</th>
				             <th>제목</th>
				             <th>기안자</th>
				             <th>결재자</th>
				             <th>진행상태</th>
				             <th>결재 확인</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				        
				           <tr>
				             <td><input type="checkbox"></td>
				             <td class="approval-start-date">${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
				             <td>${vo.apCodeName}</td>
				             <td><a data-no="${vo.approvalNo}" class="detail-proceed-btn">기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
 </table>
 </div>
</div>
</div>




<!-- progress end -->

<!-- calendar start -->
   <div class="col-md-5 grid-margin stretch-card" style="flex:right">
                
                <div class="card">
           		  <div class="card-body">
              		  
               		  <div id='calendar'></div>
                  </div>
                 </div>
                </div>
</div>                
<!-- calendar end -->

<!-- my approval -->
<div class="row">
<div class="col-md-7 grid-margin stretch-card">
<div class="card">
<div class="card-body">
                    <h4 class="card-title">재고현황</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th> # </th>
                            <th> 수성1 </th>
                            <th> 마감 기한 </th>
                            <th> 생산량 </th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${materList}" var="mvo" varStatus="i">
                          <tr>
                            <td> ${i.count} </td>
                            <td> ${mvo.materialProductName} </td>
                            <td> 12월 3일 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-success" role="progressbar" style="width: 25%" aria-valuenow="${mvo.materialProductStock}" aria-valuemin="0" aria-valuemax="1000"></div>
                              </div>
                            </td>
                          </tr>
                          </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
                  </div>
</div>
</div>
</div>
<!-- my approval end -->

<!-- pending approval -->

<!-- <div class="col-md-5 grid-margin stretch-card">
<div class="card">
 <div class="card-body"></div>
</div>
</div>
 -->
<!-- pending approval end -->


<!-- todolist start -->


 
                <!-- todolist end -->
             
             
          
                <!-- calendar -->
                
       <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
       <script src='/js/main/mainCalendar.js'></script>
       
       
       <script src='/js/main/toDoList.js'></script>
</body>
</html>