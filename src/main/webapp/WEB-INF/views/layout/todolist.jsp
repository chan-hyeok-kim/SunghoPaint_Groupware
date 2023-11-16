<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/myCustomStyle/todolist.css">


    	    <!-- todolist start -->
<div id="to-do-list-div">
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
                </div>
 <!-- todolist end -->
 
 
 <!-- todolist -->
   <script src='/js/main/toDoList.js'></script>
   <script src="/js/todolist.js"></script>