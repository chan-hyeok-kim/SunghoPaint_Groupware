<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />
<link rel="stylesheet" href="/css/index.css" />

<!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="/">
          <img src="/images/humanresource/logo3.png" style="width:300px;height: 55px;">
          
          <a class="navbar-brand brand-logo-mini" href="/"><span class="material-symbols-outlined" style="color:#198ae3">
format_color_fill
</span></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch" style="padding-right:6%; padding-left:6%;">
          <button class="navbar-toggler navbar-toggler align-self-center" id="minimize-toggle" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="/">
              <div class="input-group">
                  <input type="text" class="form-control bg-transparent border-0" placeholder="무엇이든 검색하세요">
                  <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
          	<sec:authorize access="isAuthenticated()">
	            <li class="nav-item nav-profile dropdown">
	              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
	                <div class="nav-profile-img">
	                  <img src="${principal.profile}" alt="image">
	                  <span class="availability-status online"></span>
	                </div>
	                <div class="nav-profile-text">
	                  <p class="mb-1 text-black">${principal.name} ${principal.positionCdName}</p>
	                </div>
	              </a>
	              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
	                <a class="dropdown-item" href="/humanresource/detail?employeeID=${principal.employeeID}"><i class="mdi mdi-account-circle me-2"></i> 내 인사정보 </a>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item" href="/humanresource/updatePassword"><i class="mdi mdi-cached me-2"></i> 비밀번호 변경 </a>
	              </div>
	            </li>
	            
	           
	            
	            <li class="nav-item dropdown" id="notification-toggle-li">
	              <a style="cursor:pointer;" class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" data-bs-toggle="dropdown" data-bs-auto-close="false">
	                <i class="mdi mdi-bell-outline"></i>
	                <span class="count-symbol bg-danger"></span>
	              </a>
	              
	            <!--    <div id="notification-modal" class="dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
	                <h6 class="p-3 mb-0">알림</h6>
	                <div class="dropdown-divider" id="alarmUL"></div>
	               
	                <h6 class="p-3 mb-0 text-center"><a>모든 알림 확인하기</a></h6>
	              </div>  -->
	              
	               <div style="width: 350px;" class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
	                <h6 class="p-3 mb-0">알림</h6>
	                <div class="dropdown-divider" id="alarmUL"></div>
	               
	                <!-- <h6 class="p-3 mb-0 text-center"><a>모든 알림 확인하기</a></h6> -->
	              </div> 
	            </li> 
	            
	            
	            
            </sec:authorize>
            
            <li class="nav-item nav-logout d-none d-lg-block">
            	<sec:authorize access="isAuthenticated()">
              		<a class="nav-link" href="/logout">
                		<i class="mdi mdi-power on"></i>
                	</a>
				</sec:authorize>
              	<sec:authorize access="!isAuthenticated()">
              		<a class="nav-link" href="/login">
                		<i class="mdi mdi-power"></i>
                	</a>
				</sec:authorize>
            </li>
            
            <sec:authorize access="isAuthenticated()">
	            <li class="nav-item nav-settings d-none d-lg-block" id="toggle">
	              <button class="navbar-toggler" id="todolist-toggle">
	                <i class="mdi mdi-format-line-spacing"></i>
	              </button>
	            </li>
            </sec:authorize>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
        
        
      </nav>
      
      
    