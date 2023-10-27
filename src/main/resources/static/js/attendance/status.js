/*
	function init(isAuthenticated){
		if(isAuthenticated){ // 로그인 상태
			
		}else{ // 비로그인 상태
			
		}
	}
*/

function formatTime(h, m, s, format){
	switch(format){
		case ":":
			return (h < 10 ? "0" : "") + h + ":" + (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
		case "hms":
			return (h < 10 ? "0" : "") + h + "h " + (m < 10 ? "0" : "") + m + "m " + (s < 10 ? "0" : "") + s + "s";
	}
}


function splitTimeString(timeString, format){
	let timeObj = new Object();
	
	if(format == ":"){
		parts = timeString.split(":");
		timeObj.hours = parseInt(parts[0]);
		timeObj.minutes = parseInt(parts[1]);
		timeObj.seconds = parseInt(parts[2]);
	}else if(format == "hms"){
		parts = timeString.split(" ");
		timeObj.hours = parseInt(parts[0].substr(1));
		timeObj.minutes = parseInt(parts[1].substr(1));
		timeObj.seconds = parseInt(parts[2].substr(1));
	}
	
	return timeObj;
}


// ex) timeToTimeString(날짜.getTime() - 날짜.getTime()) = "HH:mm:ss"
function timeDiffToTimeString(time, format){
	let h = Math.floor(time / (1000 * 60 * 60));
	let m = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
	let s = Math.floor((time % (1000 * 60)) / 1000);
	return formatTime(h, m, s, format);
}


/*
	"HH:mm:ss" 형식 '시간' 계산 함수(날짜 개념 X)
	ex) "10:10:10" + "20:20:20" = "30:30:30"
*/

function timeStringToHours(timeString, format){
	let timeObj = splitTimeString(timeString, format);
	return timeObj.hours + (timeObj.minutes / 60) + (timeObj.seconds / 3600);
}

function hoursToTimeString(hours, format){
	let h = Math.floor(hours);
	let m = Math.floor((hours - h) * 60);
	let s = Math.round((hours - h - m / 60) * 3600);
	return formatTime(h, m, s, format);
}


// init
$(function(){
	let cur_time = new Date().toTimeString().split(" ")[0];
	
	$("#attendance").html("<p id='cur_date'></p>" +
								   "<p id='cur_time'>" + cur_time + "</p>" +
								   "<div id='start_time' class='attendance_time'><i>출근 시간</i> <span>미등록</span></div>" +
								   "<div id='end_time' class='attendance_time'><i>퇴근 시간</i> <span>미등록</span></div>" +
								   "<div id='attendance_btn' class='on'>" +
									   "<button id=start_btn'>출근하기</button> &nbsp;" +
									   "<button id='end_btn'>퇴근하기</button>" +
								   "</div>");
	
	let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	let dayOfWeek = new Date().getDay();
	let cur_date = new Date().toLocaleDateString().replace(/\./g, "").replace(/\s/g, "-");
	$("#cur_date").html(cur_date + "(" + daysOfWeek[dayOfWeek] + ")");
	
	setInterval(function(){
		cur_time = new Date().toTimeString().split(" ")[0];
		$("#cur_time").html(cur_time);
	}, 1000);
});