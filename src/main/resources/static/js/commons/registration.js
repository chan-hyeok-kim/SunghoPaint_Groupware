function createSearchWindow(searchType){
	let url;
	let param = new Object();
	let title;
	let table_header;
	let table_body = new Array();
	
	if(searchType == "existing"){
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
		table_body.push("departmentCd");
		table_body.push("positionCdName");
		table_body.push("positionCd");
	}else if(searchType == "transferType"){
		url = "/transfer/getCodeList";
		title = "발령 구분";
		param.upCode = "U01";
		table_header = "<th></th>" +
							 "<th>발령 구분 코드</th>" +
							 "<th>발령 구분명</th>";
		table_body.push("code");
		table_body.push("codeName");
	}else if(searchType == "position"){
		url = "/transfer/getCodeList";
		title = "직급";
		param.upCode = "U00";
		table_header = "<th></th>" +
							 "<th>직급 코드</th>" +
							 "<th>직급명</th>";
		table_body.push("code");
		table_body.push("codeName");
	}else if(searchType == "department"){
		url = "/transfer/getCodeList";
		title = "부서";
		param.upCode = "D00";
		table_header = "<th></th>" +
							 "<th>부서 코드</th>" +
							 "<th>부서명</th>";
		table_body.push("code");
		table_body.push("codeName");
	}
	
	if($("#searchWindow").length > 0) $("#searchWindow").remove();
	
	$("body").append("<div id='searchWindow'>" +
								"<div id='titleBar'>" +
									"<p>" + title + " 리스트</p>" +
									"<img id='close' src='/images/commons/close-icon.png'>" +
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
		data:param,
		success:function(result){
			list_json = JSON.parse(JSON.stringify(result));
			
			$.each(list_json, function(index, element){
				$("#searchWindow #list > table").append("<tr><td class='select'><input type='checkbox'></td></tr>");
				$.each(table_body, function(i, e){
					if(searchType == "existing"){
						if(e.endsWith("Cd")){
							let before = table_body[i - 1];
							$("td." + before).attr("data-code", element[e]);
						}else{
							$("#searchWindow #list > table tr:last-of-type").append("<td class='" + e + "'>" + element[e] + "</td>");
						}
					}else{
						$("#searchWindow #list > table tr:last-of-type").append("<td class='" + e + "'>" + element[e] + "</td>");
					}
				});
			});
			
			$("#searchWindow .select > input[type='checkbox']").change(function(){
				if($(this).is(":checked")){
					$("#searchWindow .select > input[type='checkbox']").not(this).prop("checked", false);
				}
			});
		}
	});
	
	$("#searchWindow").draggable({
		handle:"#titleBar",
		cancel:"#close",
		containment:"document"
	});
	
	$("#searchWindow #close").click(function(){
		$("#searchWindow").remove();
	});
}