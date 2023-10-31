let list_json;
function getList(url){
	$.ajax({
		url:url,
		type:"GET",
		success:function(result){
			list_json = JSON.parse(JSON.stringify(result));
			
			for(i = 0; i < 100; i++){
			$.each(list_json, function(index, element){
				$("#searchWindow #list > table").append("<tr>" +
																			"<td class='select'><input type='checkbox'></td>" +
																			"<td class='employeeID'>" + element.employeeID + "</td>" +
																			"<td class='name'>" + element.name + "</td>" +
																			"<td class='departmentCdName'>" + element.departmentCdName + "</td>" +
																			"<td class='positionCdName'>" + element.positionCdName + "</td>" +
																		"</tr>");
			});
			}
			
			$(".select > input[type='checkbox']").change(function(){
				if($(this).is(":checked")){
					$(".select > input[type='checkbox']").not(this).prop("checked", false);
				}
			});
		}
	});
}

$(function(){
	$("#transferForm .search").click(function(){
		let search_type = $(this).attr("id");
		// substr
		if(){
			
		}
		
		if($("#searchWindow").length > 0) $("#searchWindow").remove();
		
		getList("/transfer/getHumanResourceList");
		
		$("body").append("<div id='searchWindow'>" +
									"<div id='titleBar'>" +
										"<p>○○구분 리스트</p>" +
										"<img id='close' src='/images/transfer/close-icon.png'>" +
									"</div>" +
									"<div id='list'>" +
										"<table>" +
											"<tr>" +
												"<th></th>" +
												"<th>사원번호</th>" +
												"<th>성명</th>" +
												"<th>부서</th>" +
												"<th>직급</th>" +
											"</tr>" +
										"</table>" +
									"</div>" +
									"<div id='footer'>" +
										"<button id='apply'>적용</button>" +
									"</div>" +
								"</div>");
		
		$("#searchWindow").draggable({
			handle:"#titleBar",
			cancel:"#close",
			containment:"document",
		});
		
		$("#apply").click(function(){
			
		});
		
		$("#close").click(function(){
			$("#searchWindow").remove();
		});
	});
	
	$("#transferForm input[type='text']").click(function(){
		let search_type = $(this).attr("data-search-type");
		$("#search_" + search_type).trigger("click");
	});
});