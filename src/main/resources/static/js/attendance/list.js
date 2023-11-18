function attendanceDetail(employeeID, year, month){	
	window.open("", "attendanceDetailWindow", "　"); 
	
	let form = $("<form></form>");
	form.attr("method", "POST");
	form.attr("action", "/attendance/myStatus");
	form.attr("target", "attendanceDetailWindow");
	form.append($("<input/>",{type:"hidden", name:"employeeID", value:employeeID}));
	form.append($("<input/>", {type:"hidden", name:"year", value:year}));
	form.append($("<input/>",{type:"hidden", name:"month", value:month}));
	form.append($("<input/>",{type:"hidden", name:"newWindow", value:true}));
	form.appendTo("body");
	form.submit();
	form.remove();
}