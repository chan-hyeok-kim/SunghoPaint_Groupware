function sendPost(uri){
	let form = $("<form></form>");
	form.attr("method", "POST");
	form.attr("action", uri);
	form.appendTo("body");
	form.submit();
}


function sidebarCommute(url){
	$.ajax({
		url:url,
		type:"POST",
		success:function(result){
			if(result) location.reload();
			else alert("잘못된 접근입니다.");
		}
	});
}

$(function(){
	$("#attendance-btns > #start-btn.on").click(function(){
		if(selected = confirm("출근하시겠습니까?")){
			sidebarCommute("/attendance/goWork");
		}
	});
	
	$("#attendance-btns > #end-btn.on").click(function(){
		if(selected = confirm("퇴근하시겠습니까?")){
			sidebarCommute("/attendance/leaveWork");
		}
	});
});

function getServerDate(){
	let serverDate;
	$.ajax({
		url:"/attendance/getServerDate",
		type:"GET",
		async:false,
		success:function(result){
			serverDate = result;
		}
	});
	
	return serverDate;
}

let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
function setCommuteDate(){
	let serverDate = getServerDate();
	
	let curDate = new Date(serverDate).toLocaleDateString().replace(/\./g, "").replace(/\s/g, "-");
	let dayOfWeek = new Date(serverDate).getDay();
	$("#cur-date").html(curDate + "(" + daysOfWeek[dayOfWeek] + ")");
	
	let curTime = new Date(serverDate).toTimeString().split(" ")[0];
	$("#cur-time").html(curTime);
}

$(function(){
	setCommuteDate();
	
	setInterval(function(){
		setCommuteDate();
	}, 1000);
});