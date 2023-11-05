<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<script type="text/javascript">
		if('${result}'>0){
	        icon='success';
		}else{
			icon='warning';	
		}
		resultSwal(icon);
		
		function resultSwal(icon){
			swal({
				text:'${message}',
				icon:icon
				}).then(function(){
				location.href="${url}";		
			})
		}
		
	</script>

</body>
</html>