<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="/js/annual/list.js"></script>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/annual/list.css">

<script>
	function set(){
		let employeeIDList = ${employeeIDList_json};
		
		$.each(employeeIDList, function(index, element){
			$.ajax({
				url:"./myStatus",
				type:"POST",
				async:false,
				dataType:"html",
				data:{
					employeeID:element
				}
				success:function(result){
					console.log(result);
				}
			});
		});
	}

	$(function(){
		set();
	});
</script>