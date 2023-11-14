<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/calendarStyle/calendar.css">

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
<div class="col-md-7 grid-margin stretch-card">
<div class="card">
<div class="card-body">
                    <h4 class="card-title">주간 제품별 생산량</h4>
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


<!-- todolist start -->
<div class="card">
                  <div class="card-body">
                    <h4 class="card-title text-black">To-do List</h4>
                    <div class="add-items d-flex">
                      <input type="text" id="todo-list-input" class="form-control todo-list-input" placeholder="오늘 할일이 뭐가 있을까?">
                      <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task">추가</button>
                    </div>
                    <div class="list-wrapper">
                      <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                      <c:forEach items="${list}" var="vo">
                        <li>
                          <div class="form-check">
                            <label class="form-check-label">
                             <c:if test="${vo.toDoListCheck}">
                             <input class="checkbox" type="checkbox" checked="checked"></c:if>
                              <c:if test="${not vo.toDoListCheck}"><input class="checkbox" type="checkbox"></c:if> 
                              <span id="toDoContents">${vo.toDoListContents}</span> <i class="input-helper"></i></label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline" data-no="${vo.toDoListNo}"></i>
                        </li>
                       </c:forEach>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- todolist end -->
             
             
             
                <!-- calendar -->
       <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
       <script src='/js/main/mainCalendar.js'></script>
       
       
       <script src='/js/main/toDoList.js'></script>
</body>
</html>