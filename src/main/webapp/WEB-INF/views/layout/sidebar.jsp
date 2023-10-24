<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item nav-profile">
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
    <li class="nav-item">
      <a class="nav-link" href="pages/icons/mdi.html">
        <span class="menu-title">Icons</span>
        <i class="mdi mdi-contacts menu-icon"></i>
      </a>
    </li>
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
    
    <li class="nav-item sidebar-actions">
      <span class="nav-link">
      
        <div class="border-bottom">
        </div>
     
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#purchase-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">구매 리스트</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-cash-multiple"></i>
      </a>
      <div class="collapse" id="purchase-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/purchase/list">구매 조회</a></li>
          <li class="nav-item"> <a class="nav-link" href="/purchase/add">구매서 작성</a></li>
        </ul>
      </div>
    </li>
    
        <li class="nav-item sidebar-actions">
      <span class="nav-link">
      
        <div class="border-bottom">
        </div>
     
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#order-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">발주서 리스트</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-book-open"></i>
      </a>
      <div class="collapse" id="order-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/order/list">발주서 조회</a></li>
          <li class="nav-item"> <a class="nav-link" href="/order/add">발주서 작성</a></li>
        </ul>
      </div>
    </li>  
        
          
          </ul>
       
      </span>
    </li>
  </ul>
</nav>