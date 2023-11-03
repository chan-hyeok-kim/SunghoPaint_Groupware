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
	
    <li class="nav-item">
      <a class="nav-link" href="/">
        <span class="menu-title">Dashboard</span>
        <i class="mdi mdi-home menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
        <span class="menu-title">Basic UI Elements</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
      </a>
      <div class="collapse" id="ui-basic">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
        </ul>
      </div>
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
	          <li class="nav-item"> <a class="nav-link" href="/transfer/registration"> 발령 등록 </a></li>
	          <li class="nav-item"> <a class="nav-link" href="/transfer/view" style="cursor:pointer;"> 발령 조회 </a></li>
	          <!-- <li class="nav-item"> <a class="nav-link" onclick="sendPost('/transfer/view')" style="cursor:pointer;"> 발령 조회 </a></li> -->
	        </ul>
	      </div>
	    </li>
    </sec:authorize>
    <li class="nav-item">
      <a class="nav-link" href="pages/forms/basic_elements.html">
        <span class="menu-title">Forms</span>
        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="pages/charts/chartjs.html">
        <span class="menu-title">Charts</span>
        <i class="mdi mdi-chart-bar menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="pages/tables/basic-table.html">
        <span class="menu-title">Tables</span>
        <i class="mdi mdi-table-large menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">Sample Pages</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-medical-bag menu-icon"></i>
      </a>
      <div class="collapse" id="general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item sidebar-actions">
      <span class="nav-link">
      
        <div class="border-bottom">
        </div>
     
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
    
    <div class="border-bottom">
        </div>
     
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
    
        
        
          <div class="border-bottom">
            <p class="text-secondary">Categories</p>
          </div>
          <ul class="gradient-bullet-list mt-4">
            <li>Free</li>
            <li>Pro</li>
          </ul>
       
      </span>
    </li>
  </ul>
</nav>