<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- plugins:css -->
    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/images/favicon.ico" />
   
   <!-- Google Icon -->
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
   

<script type="text/javascript" src="/js/ztree/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="/js/ztree/jquery.ztree.core.js"></script>
 </head>
<body>


 <div class="container-scroller">
      
      
      <tiles:insertAttribute name="navbar"/>
      <div class="container-fluid page-body-wrapper">
      
      <tiles:insertAttribute name="sidebar"/>
      <div class="main-panel">
      <div class="content-wrapper">
      <tiles:insertAttribute name="body"/>
          
       
             </div>
             <tiles:insertAttribute name="footer"/>
       </div>
     
        </div>
      <!-- page-body-wrapper ends -->
      
    </div>
    <!-- container-scroller-ends-->
    
    <!-- plugins:js -->
    <script src="/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="/vendors/chart.js/Chart.min.js"></script>
    <script src="/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/js/off-canvas.js"></script>
    <script src="/js/hoverable-collapse.js"></script>
    <script src="/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/js/dashboard.js"></script>
    <script src="/js/todolist.js"></script>
    <!-- End custom js for this page -->
    
    <script src="https://cdn.jsdelivr.net/npm/ztree@3.5.24/js/jquery.ztree.all.min.js"></script>
    
	<!-- Bootstrap -->
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>