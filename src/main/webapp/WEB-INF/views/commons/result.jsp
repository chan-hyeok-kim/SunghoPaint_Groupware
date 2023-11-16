<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- sockjs -->
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  
   
</head>
<body>
	<script type="text/javascript">
		if('${result}' > 0){
	        icon= 'success';
		}else{
			icon= 'warning';
		}
		
		resultSwal(icon);
		
		function resultSwal(icon){
			swal({
				text:'${message}',
				icon:icon
				}).then(function(){
				location.href = "${url}";		
			})
		}
		
	/* 	var ws = new SockJS("http://localhost:82/echo");
		
		ws.onopen = function() {
	 		console.log("연결완료");

	 	};
	 	
		if('${appResultCheck}'>0){
			 $.ajax({
			        type:'GET',
			        url:'/setAlarm',
			        success:function(result){
			            console.log(result);
			            if(result && ws){

			                let message=result.notificationTitle+','+result.notificationContents+','+result.notificationDate;
			                console.log(message);
			                ws.send(message);
			            }
			        }


			    })
		}
		
		ws.onclose = function() {
	 	    console.log('close');
	 	}; */
	</script>
</body>
</html>