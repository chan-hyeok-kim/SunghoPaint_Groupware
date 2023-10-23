/*
	function init(isAuthenticated){
		if(isAuthenticated){ // 로그인 상태
			
		}else{ // 비로그인 상태
			
		}
	}
*/

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
		cur_time = new Date().toTimeString().split(' ')[0];
		$("#cur_time").html(cur_time);
	}, 1000);
});