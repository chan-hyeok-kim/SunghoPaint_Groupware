<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Map"%>
<%@page import="com.ham.len.attendance.AttendanceService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%
  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);
	AttendanceService attendanceService = (AttendanceService)ctx.getBean("attendanceService");

	Map<String, Boolean> commuteWhether = attendanceService.getCommuteWhether(authentication.getName());
  request.setAttribute("commuteWhether", commuteWhether);
  request.setAttribute("currentAttendance", attendanceService.getCurrentAttendance(authentication.getName()));
%>

<sec:authentication property="principal" var="principal" />
<script type="text/javascript" src="/js/sidebar.js"></script>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li id="attendance" class="nav-item nav-profile">
      <div id="main-attendance">
        <div id="profile-wrap">
          <img src="${principal.profile}" id="profile">
          <h2 id="profile-text">${principal.name} ${principal.positionCdName}</h2>
        </div>
        <div id="commute-wrap">
          <div id="date-wrap">
            <span id="cur-date"></span><br>
            <span id="cur-time"></span>
          </div>
          <div id="start-time">
			<i>출근 시간</i>
			<c:if test="${!commuteWhether.goWork}">
				<span>미등록</span>
			</c:if>
			<c:if test="${commuteWhether.goWork}">
				<span><fmt:formatDate value="${currentAttendance.attendanceStart}" pattern="HH:mm:ss" /></span>
			</c:if>
          </div>
          <div id="end-time">
			<i>퇴근 시간</i>
			<c:if test="${!commuteWhether.goWork || !commuteWhether.leaveWork}">
				<span>미등록</span>
			</c:if>
			<c:if test="${commuteWhether.goWork && commuteWhether.leaveWork}">
				<span><fmt:formatDate value="${currentAttendance.attendanceEnd}" pattern="HH:mm:ss" /></span>
			</c:if>
          </div>
          <div id="attendance-btns">
            <c:if test="${commuteWhether.goWork}">
              <button id="start-btn" class="off">출근</button>
            </c:if>
            <c:if test="${!commuteWhether.goWork}">
              <button id="start-btn" class="on">출근</button>
            </c:if>
            <c:if test="${commuteWhether.leaveWork}">
              <button id="end-btn" class="off">퇴근</button>
            </c:if>
            <c:if test="${!commuteWhether.leaveWork}">
              <button id="end-btn" class="on">퇴근</button>
            </c:if>
          </div>
        </div>
      </div>
    </li>
    <li id="sidebar-divider" class="nav-item"></li>
    <li class="nav-item">
      <a class="nav-link" onclick="sendPost('/attendance/myStatus')" style="cursor:pointer;">
        <span class="menu-title">근태 관리</span>
        <i class="mdi mdi-contacts menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#humanresource-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">인사 관리</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-file-check menu-icon"></i>
      </a>
      <div class="collapse" id="humanresource-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/humanresource/detail">내 인사 정보</a></li>
          <li class="nav-item"> <a class="nav-link" href="/annual/myAnnual">내 연차 현황</a></li>
        </ul>
      </div>
    </li>
   
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
          <sec:authorize access="hasRole('ADMIN')">
          <li class="nav-item"> <a class="nav-link" href="/approval/totalList"> 기안서 통합관리  </a></li>
        </sec:authorize>
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
      <a class="nav-link" data-bs-toggle="collapse" href="#general-affairs-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">자산관리</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-sitemap menu-icon"></i>
      </a>
      <div class="collapse" id="general-affairs-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/instrument/list">기기 리스트</a></li>
          <li class="nav-item"> <a class="nav-link" href="/material/list">품목 리스트</a></li>
          <li class="nav-item"> <a class="nav-link" href="/factory/list">공장/창고 리스트</a></li>
        </ul>
      </div>
    </li>
    
    
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#purchase-general-pages" aria-expanded="false" aria-controls="general-pages">
        <span class="menu-title">구매관리</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-cash-multiple menu-icon"></i>
      </a>
      <div class="collapse" id="purchase-general-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/purchase/list">구매 리스트</a></li>
        </ul>
      </div>
    </li>
    
         
        <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#notice-pages" aria-expanded="false" aria-controls="notice-pages">
        <span class="menu-title">공지사항</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-file-document-box menu-icon"></i>
      </a>
      <div class="collapse" id="notice-pages">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/notice/list">공지사항 리스트</a></li>
          <li class="nav-item"> <a class="nav-link" href="/notice/add">공지사항 작성 </a></li>
        </ul>
      </div>
    </li>
    
    <sec:authorize access="hasRole('ADMIN')">
    	<li id="sidebar-divider" class="nav-item"></li>
    	<li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#approval-admin-pages" aria-expanded="false" aria-controls="admin-pages">
          <span class="menu-title">관리자</span>
          <i class="menu-arrow"></i>
          <i class="mdi mdi-folder-lock menu-icon"></i>
        </a>
        <div class="collapse" id="approval-admin-pages">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="/code/list">코드 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/document/list">문서 양식함</a></li>
            <li id="sidebar-divider" class="nav-item"></li>
            <li class="nav-item"><a class="nav-link" href="/humanresource/registration">인사 등록</a></li>
            <li class="nav-item"><a class="nav-link" href="/humanresource/list">인사 조회</a></li>
            <li id="sidebar-divider" class="nav-item"></li>
            <li class="nav-item"><a class="nav-link" href="/transfer/registration">발령 등록</a></li>
            <li class="nav-item"><a class="nav-link" href="/transfer/list">발령 조회</a></li>
            <li id="sidebar-divider" class="nav-item"></li>
            <li class="nav-item"><a class="nav-link" href="/attendance/list">근태 현황</a></li>
            <li class="nav-item"><a class="nav-link" href="/annual/status">연차 현황</a></li>
          </ul>
        </div>
      </li>
    </sec:authorize>
  </ul>
</nav>