<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
  
<style type="text/css">

</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<div class="container-fluid">
				  
				  <h1>차량 예약 목록</h1>
				  <input type="hidden" id="username" value="${name1}">
				  <div class="card">
				  	<div class="card-body">
						<div id='calendar'></div>
				  	</div>
				  </div>
				  	  
    </div>
  </div>
</div>

 
     
     <div style="border: 1px solid gray;">
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
</div>
      
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<script type="text/javascript">
		
</script>
</body>
</html>