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


<!-- progress start -->
<div class="row">
<div class="col-7 grid-margin stretch-card" style="height:500px;">
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

<!-- stock -->
<div class="col-md-5 grid-margin stretch-card" style="height:1000px;">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Traffic Sources</h4>
                    <canvas id="traffic-chart" width="277" height="138" style="display: block; width: 277px; height: 138px;" class="chartjs-render-monitor"></canvas>
                    <div id="traffic-chart-legend" class="rounded-legend legend-vertical legend-bottom-left pt-4"><ul><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(54, 215, 232, 1), rgba(177, 148, 250, 1))"></span>Search Engines<span class="float-right">30%</span></li><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(6, 185, 157, 1), rgba(132, 217, 210, 1))"></span>Direct Click<span class="float-right">30%</span></li><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(255, 191, 150, 1), rgba(254, 112, 150, 1))"></span>Bookmarks Click<span class="float-right">40%</span></li></ul></div>
                  </div>
                </div>
              </div>
</div>   
<!-- stock end -->

<!-- todolist start -->

<div class="toggle-slide-List">
<div class="card">
                  <div class="card-body">
                    <h4 class="card-title text-black">To-do List</h4>
                    <div class="add-items d-flex">
                      <input type="text" id="todo-list-input" class="form-control todo-list-input" placeholder="오늘 할일이 뭐가 있을까?">
                      <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task">
                      <span class="material-symbols-outlined">add</span></button>
                    </div>
                    <div class="list-wrapper">
                      <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                      <c:forEach items="${toDoList}" var="vo">
                      <c:if test="${vo.toDoListCheck}">
                        <li class="complete completed">
                        </c:if>
                        <c:if test="${not vo.toDoListCheck}">
                        <li>
                        </c:if>
                          <div class="form-check">
                            <label class="form-check-label">
                             <c:if test="${vo.toDoListCheck}">
                             <input class="checkbox" type="checkbox" checked="checked"></c:if>
                              <c:if test="${not vo.toDoListCheck}"><input class="checkbox" type="checkbox"></c:if> 
                              <i class="input-helper"></i><span id="toDoContents">${vo.toDoListContents}</span></label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline" data-no="${vo.toDoListNo}"></i>
                        </li>
                       </c:forEach>
                      </ul>
                    </div>
                  </div>
                </div>
                </div> 
 
                <!-- todolist end -->



<!-- calendar start -->
   <div class="col-md-5 grid-margin stretch-card" style="flex:right">
                
                <div class="card">
           		  <div class="card-body">
              		  
               		  <div id='calendar'></div>
                  </div>
                 </div>
                </div>
             
<!-- calendar end -->

<!-- pending approval -->

<!-- <div class="col-md-5 grid-margin stretch-card">
<div class="card">
 <div class="card-body"></div>
</div>
</div>
 -->
<!-- pending approval end -->



             
             
          
                <!-- calendar -->
                
       <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
       <script src='/js/main/mainCalendar.js'></script>
       
       
       <script src='/js/main/toDoList.js'></script>
</body>
</html>