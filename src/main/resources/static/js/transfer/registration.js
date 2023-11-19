$(function(){
	$("#registrationForm .search").click(function(){
		let searchType = $(this).siblings("input[type='text']").attr("data-search-type");
		createSearchWindow(searchType);
		
		$("#searchWindow #apply").click(function(){
			let checked = $(".select > input[type='checkbox']:checked");
			
			if(checked.length == 0){
				alert("항목을 선택해주세요.");
			}else{
				if(searchType == "existing"){
					$("input[name='employeeID']").val(checked.parent().siblings(".employeeID").html());
					$("input[name='name']").val(checked.parent().siblings(".name").html());
					$("input[name='beforeDepartmentCd']").val(checked.parent().siblings(".departmentCdName").attr("data-code"));
					$("input[name='beforeDepartmentCdName']").val(checked.parent().siblings(".departmentCdName").html());
					$("input[name='beforePositionCd']").val(checked.parent().siblings(".departmentCdName").attr("data-code"));
					$("input[name='beforePositionCdName']").val(checked.parent().siblings(".positionCdName").html());
				}else if(searchType == "transferType"){
					$("input[name='transferTypeCd']").val(checked.parent().siblings(".code").html());
					$("input[name='transferTypeCdName']").val(checked.parent().siblings(".codeName").html());
				}else if(searchType == "position"){
					$("input[name='transferPositionCd']").val(checked.parent().siblings(".code").html());
					$("input[name='transferPositionCdName']").val(checked.parent().siblings(".codeName").html());
				}else if(searchType == "department"){
					$("input[name='transferDepartmentCd']").val(checked.parent().siblings(".code").html());
					$("input[name='transferDepartmentCdName']").val(checked.parent().siblings(".codeName").html());
				}
				
				$("#searchWindow").remove();
			}
		});
	});
	
	$("#registrationForm input[type='text']").click(function(){
		$("#search_" + $(this).attr("data-search-type")).trigger("click");
	});
});