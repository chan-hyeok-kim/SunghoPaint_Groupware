$(function(){
	$("#transferForm .search").click(function(){
		let id = $(this).attr("id");
		let url;
		let title;
		let table_header;
		let table_body = new Array();
		
		if(id == "search_existing"){
			url = "/transfer/getHumanResourceList";
			title = "사원 정보";
			table_header = "<th></th>" +
								 "<th>사원번호</th>" +
								 "<th>성명</th>" +
								 "<th>부서</th>" +
								 "<th>직급</th>";
			table_body.push("employeeID");
			table_body.push("name");
			table_body.push("departmentCdName");
			table_body.push("positionCdName");
		}else if(id == "search_transferType"){
			url = "/transfer/...";
			title = "발령 구분";
		}else if(id == "search_position"){
			url = "/transfer/...";
			title = "직급";
		}else if(id == "search_department"){
			url = "/transfer/...";
			title = "부서";
		}
		
		if($("#searchWindow").length > 0) $("#searchWindow").remove();
		
		$("body").append("<div id='searchWindow'>" +
									"<div id='titleBar'>" +
										"<p>" + title + " 리스트</p>" +
										"<img id='close' src='/images/transfer/close-icon.png'>" +
									"</div>" +
									"<div id='list'>" +
										"<table>" +
											"<tr>" + table_header + "</tr>" +
										"</table>" +
									"</div>" +
									"<div id='footer'>" +
										"<button id='apply'>적용</button>" +
									"</div>" +
								"</div>");
		
		$.ajax({
			url:url,
			type:"GET",
			success:function(result){
				list_json = JSON.parse(JSON.stringify(result));
				
				$.each(list_json, function(index, element){
						$("#searchWindow #list > table").append("<tr><td class='select'><input type='checkbox'></td></tr>");
						$.each(table_body, function(i, e){
								$("#searchWindow #list > table tr:last-of-type").append("<td class='" + e + "'>" + element[e] + "</td>");
						});
				});
				
				$(".select > input[type='checkbox']").change(function(){
					if($(this).is(":checked")){
						$(".select > input[type='checkbox']").not(this).prop("checked", false);
					}
				});
			}
		});
		
		$("#searchWindow").draggable({
			handle:"#titleBar",
			cancel:"#close",
			containment:"document"
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