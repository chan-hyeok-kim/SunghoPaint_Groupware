<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li id="attendance" class="nav-item nav-profile">
      <a href="#" class="nav-link">
        <div class="nav-profile-image">
          <img src="/images/faces/face1.jpg" alt="profile">
          <span class="login-status online"></span>
          <!--change to offline or busy as needed-->
        </div>
        <div class="nav-profile-text d-flex flex-column">
          <span class="font-weight-bold mb-2">David Grey. H</span>
          <span class="text-secondary text-small">Project Manager</span>
        </div>
        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
      </a>
    </li>
	
   
    <script>
      function sendPost(uri){
        let form = $("<form></form>");
        form.attr("method", "POST");
        form.attr("action", uri);
        form.appendTo("body");
        form.submit();
      }
    </script>
	    <li class="nav-item">
	      <a class="nav-link" onclick="sendPost('/attendance/status')" style="cursor:pointer;">
	        <span class="menu-title">근태 관리</span>
	        <i class="mdi mdi-contacts menu-icon"></i>
	      </a>
	    </li>
    <!-- <sec:authorize access="hasRole('USER')"> -->
    <!-- </sec:authorize> -->
    <sec:authorize access="hasRole('ADMIN')">
    	<li class="nav-item">
	      <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
	        <span class="menu-title">인사 관리</span>
	        <i class="menu-arrow"></i>
	        <i class="mdi mdi-medical-bag menu-icon"></i>
	      </a>
	      <div class="collapse" id="general-pages">
	        <ul class="nav flex-column sub-menu">
            <li class="nav-item"> <a class="nav-link" href="/humanresource/registration"> 인사 등록 </a></li>
	          <li class="nav-item"> <a class="nav-link" href="/transfer/registration"> 발령 등록 </a></li>
	          <li class="nav-item"> <a class="nav-link" onclick="sendPost('/transfer/view')" style="cursor:pointer;"> 발령 조회 </a></li>
	        </ul>
	      </div>
	    </li>
    </sec:authorize>
   
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#approval-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">전자결재</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-file-check menu-icon"></i>
      </a>
      <div class="collapse" id="approval-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/approval/list">내 결재 관리</a></li>
          <li class="nav-item"> <a class="nav-link" href="/approval/add"> 기안서 작성 </a></li>
          <li class="nav-item"> <a class="nav-link" href="/approval/totalList"> 기안서 통합관리  </a></li>
        </ul>
      </div>
    </li>
   
   
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#general-pages-1" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">예약</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-medical-bag menu-icon"></i>
      </a>
      <div class="collapse" id="general-pages-1">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/sales/carReservation"> 차량예약 </a></li>
          <li class="nav-item"> <a class="nav-link" href="/sales/calendarReservation"> 차량예약 현황 </a></li>
          <li class="nav-item"> <a class="nav-link" href="/sales/reservationStatus"> 대여 현황/내 예약 </a></li>
          <li class="nav-item"> <a class="nav-link" href="/sales/assetManagement"> 자산관리 </a></li>
        </ul>
      </div>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#general-pages-2" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">영업관리</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-medical-bag menu-icon"></i>
      </a>
      <div class="collapse" id="general-pages-2">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/sales/clientList"> 거래처 관리 </a></li>
          <li class="nav-item"> <a class="nav-link" href="/sales/dealList"> 거래내역 조회 </a></li>
        </ul>
      </div>
    </li>
    
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#general-pages-3" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">일정관리</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-medical-bag menu-icon"></i>
      </a>
      <div class="collapse" id="general-pages-3">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/sales/scheduleManagement"> 일정 관리 </a></li>
        </ul>
      </div>
    </li>
    
    
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#purchase-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">구매 리스트</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-cash-multiple menu-icon"></i>
      </a>
      <div class="collapse" id="purchase-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/purchase/list">구매 조회</a></li>
          <li class="nav-item"> <a class="nav-link" href="/purchase/add">구매서 작성</a></li>
        </ul>
      </div>
    </li>
    
    
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#order-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">발주서 리스트</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-book-open menu-icon"></i>
      </a>
      <div class="collapse" id="order-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/order/list">발주서 조회</a></li>
          <li class="nav-item"> <a class="nav-link" href="/order/add">발주서 작성</a></li>
        </ul>
      </div>
    </li>  
    
       
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#approval-admin-pages" aria-expanded="false" aria-controls="admin-pages">
        <span class="menu-title">관리자</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-folder-lock menu-icon"></i>
      </a>
      <div class="collapse" id="approval-admin-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/code/list">코드 관리</a></li>
          <li class="nav-item"> <a class="nav-link" href="/document/list">문서 양식함</a></li>
          
        </ul>
      </div>
    </li>
         
          </ul>
       
     
</nav>