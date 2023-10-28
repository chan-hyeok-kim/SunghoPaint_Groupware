/*
	function init(isAuthenticated){
		if(isAuthenticated){ // 로그인 상태
			
		}else{ // 비로그인 상태
			
		}
	}
*/

function dateToDataDateAttribute(date){
	let y = date.getFullYear();
	let m = date.getMonth() + 1;
	let d = date.getDate();
	return y + "y" + m + "m" + d + "d";
}


function formatTime(h, m, s, format){
	switch(format){
		case ":":
			return (h >= 0 && h < 10 ? "0" : "") + h + ":" + (m >= 0 && m < 10 ? "0" : "") + m + ":" + (s >= 0 && s < 10 ? "0" : "") + s;
		case "hms":
			return h + "h " + m + "m " + s + "s";
	}
}


function convertFormatTime(timeString, before_format, after_format){
	let timeObj = splitTimeString(timeString, before_format);
	return formatTime(timeObj.hours, timeObj.minutes, timeObj.seconds, after_format);
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
		let hours = parts[0];
		let minutes = parts[1];
		let seconds = parts[2];

		timeObj.hours = parseInt(hours.substr(0, hours.length - 1));
		timeObj.minutes = parseInt(minutes.substr(0, minutes.length - 1));
		timeObj.seconds = parseInt(seconds.substr(0, seconds.length - 1));
	}
	
	return timeObj;
}


/*
	시간 '차이' 계산(날짜 개념 있음)
	1. let timeString = timeDiffToTimeString(날짜.getTime() - 날짜.getTime(), "hms");
	2. console.log(timeString); // "○○h ○○m ○○s"
*/
function timeDiffToTimeString(time, format){
	let h = Math.floor(time / (1000 * 60 * 60));
	let m = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
	let s = Math.floor((time % (1000 * 60)) / 1000);
	return formatTime(h, m, s, format);
}


/*
	단순 '시간' 계산(날짜 개념 없음)
	1. let hours = timeStringToHours("10:10:10", ":") + timeStringToHours("20:20:20", ":");
	2. let timeString = hoursToTimeString(hours, ":");
	3. console.log(timeString); // "30:30:30"
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

// 월(Month) 이동
$(function(){
	$("#move_month > i").click(function(){
		let date = $(this).siblings("h2").html();
		let year = parseInt(date.split(".")[0]);
		let month = parseInt(date.split(".")[1]) - 1;

		date = ($(this).attr("id") == "before_month") ? new Date(year, month - 1) : new Date(year, month + 1);
		year = date.getFullYear();
		month = date.getMonth() + 1;

		let form = $("<form></form>");
        form.attr("method", "POST");
        form.attr("action", "/attendance/status");
		form.append($("<input/>", {type:"hidden", name:"year", value:year}));
		form.append($("<input/>", {type:"hidden", name:"month", value:month}));
		form.append("<input/>", );
        form.appendTo("body");
        form.submit();
	});
});